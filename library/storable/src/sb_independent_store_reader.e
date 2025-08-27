note

	description:

		"Eiffel Storable file readers using independent store format"

	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class SB_INDEPENDENT_STORE_READER

inherit

	SB_READER

feature {NONE} -- Initialization

	make
			-- Create a new Storable reader.
		do
			create type_list.make_with_capacity (50)
			create type_list_index.make (0)
			create error_handler.make_standard
		end

feature -- Schema input

	read_schema (a_schema: SB_SCHEMA; a_file: SB_INPUT_FILE)
			-- Read schema from `a_file'.
			-- Set `error_handler.has_error' is an error occurred.
			-- Can also set `a_schema.has_attribute_type_error' (see header comment of this query).
		local
			i, nb: INTEGER
			l_class: SB_CLASS
			l_max_index: INTEGER
			l_class_count: INTEGER
			l_classes: ARRAY [detachable SB_CLASS]
			l_read_schema_action: PROCEDURE [SB_INPUT_FILE, INTEGER, INTEGER]
		do
				-- Read storable properties.
			read_storable_properties (a_schema, a_file)
				-- Read overhead size.
			a_file.read_integer_16
			a_schema.set_overhead_size (a_file.last_integer_16)
				-- Read maximum number of classes.
			a_file.read_integer_16
			l_max_index := a_file.last_integer_16
			if l_max_index < 0 then
				error_handler.report_error_message ("Invalid maximum class index: " + l_max_index.out)
			end
				-- Read the number of classes to be read.
			a_file.read_integer_16
			l_class_count := a_file.last_integer_16
			if l_class_count < 0 then
				error_handler.report_error_message ("Invalid number of classes: " + l_class_count.out)
			elseif l_class_count > l_max_index + 1 then
				error_handler.report_error_message ("Invalid number of classes: " + l_class_count.out)
			else
				if not error_handler.has_error then
						-- Read classes.
					a_schema.set_maximum_class_index (l_max_index)
					a_schema.set_class_count (l_class_count)
					l_read_schema_action := a_schema.read_schema_action
					nb := l_class_count
					from i := 1 until i > nb loop
						if l_read_schema_action /= Void then
							l_read_schema_action.call (a_file, i, nb)
						end
						read_class (a_schema, a_file)
						if error_handler.has_error then
							i := nb + 1 -- Jump out of the loop.
						else
							i := i + 1
						end
					end
						-- Resolve attribute types.
					l_classes := a_schema.classes
					nb := l_max_index
					from i := 0 until i > nb loop
						l_class := l_classes.item (i)
						if l_class /= Void then
							if l_class.is_unknown then
								l_classes.put (Void, i)
							else
								a_schema.resolve_formal_parameters (l_class)
								resolve_attribute_types (l_class)
							end
						end
						i := i + 1
					end
				end
			end
		end

feature {NONE} -- Schema input

	read_storable_properties (a_schema: SB_SCHEMA; a_file: SB_INPUT_FILE)
			-- Read storable properties of `a_schema' from `a_file'.
		require
			a_schema_not_void: a_schema /= Void
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		deferred
		end

	read_class (a_schema: SB_SCHEMA; a_file: SB_INPUT_FILE)
			-- Read class from `a_file'.
		require
			a_schema_not_void: a_schema /= Void
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			l_name: STRING
			l_class: SB_CLASS
			l_index: INTEGER_16
			l_classes: ARRAY [detachable SB_CLASS]
			l_max_index: INTEGER
			l_flags: NATURAL_32
		do
				-- Read base class name.
			l_name := read_class_name (a_file)
			if l_name /= Void then
					-- Read flags.
				l_flags := read_class_flags (a_file)
					-- Read class index.
				l_max_index := a_schema.maximum_class_index
				l_classes := a_schema.classes
				a_file.read_integer_16
				l_index := a_file.last_integer_16
				if l_index < 0 or l_index > l_max_index then
					error_handler.report_error_message ("Invalid class index for class " + l_name + ": " + l_index.out)
				else
					l_class := l_classes.item (l_index)
					if l_class = Void then
						create l_class.make (l_name, l_index)
						l_classes.put (l_class, l_index)
					else
						l_class.set_name (l_name)
					end
					set_class_flags (l_class, l_flags)
						-- Read storable version.
					read_storable_version (l_class, a_file)
						-- Read formal generic parameters.
					read_formal_parameters (l_class, a_schema, a_file)
						-- Read attributes.
					if not error_handler.has_error then
						read_attributes (l_class, a_schema, a_file)
					end
				end
			end
		end

	read_class_name (a_file: SB_INPUT_FILE):detachable  STRING
			-- Read class's name from `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			i, nb: INTEGER
		do
				-- Read number of characters.
			a_file.read_integer_16
			nb := a_file.last_integer_16
			if nb <= 0 then
				error_handler.report_error_message ("Invalid number of character in base class name: " + nb.out)
			else
				create Result.make (nb)
				from i := 1 until i > nb loop
					a_file.read_character_8
					Result.append_character (a_file.last_character_8)
					i := i + 1
				end
			end
		end

	read_class_flags (a_file: SB_INPUT_FILE): NATURAL_32
			-- Read class's flags (about expandedness etc.) from `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		deferred
		end

	set_class_flags (a_class: SB_CLASS; a_flags: NATURAL_32)
			-- Set `a_flags' flags of `a_class'.
		require
			a_class_not_void: a_class /= Void
		deferred
		end

	read_storable_version (a_class: SB_CLASS; a_file: SB_INPUT_FILE)
			-- Read `a_class''s storable version from `a_file'.
		require
			a_class_not_void: a_class /= Void
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		deferred
		end

	read_formal_parameters (a_class: SB_CLASS; a_schema: SB_SCHEMA; a_file: SB_INPUT_FILE)
			-- Read `a_class''s formal generic parameters from `a_file'.
		require
			a_class_not_void: a_class /= Void
			a_schema_not_void: a_schema /= Void
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			i, nb: INTEGER
			l_type: SB_TYPE
			l_type_list: SB_TYPE_LIST
			l_gentype: NATURAL_32
			l_class_id: INTEGER
			l_class: SB_CLASS
		do
				-- Read number of formal parameters.
			a_file.read_integer_16
			nb := a_file.last_integer_16
			if nb < 0 then
				error_handler.report_error_message ("Invalid number of formal parameters for class " + a_class.name + ": " + nb.out)
			else
				if nb > 0 then
					create l_type_list.make_with_capacity (nb)
					a_class.set_formal_parameters (l_type_list)
					from i := 1 until i > nb loop
						a_file.read_natural_32
						l_gentype := a_file.last_natural_32
						inspect l_gentype
						when Sk_bool then
							l_type := a_schema.boolean_type
							l_type_list.put_last (l_type)
						when Sk_char then
							l_type := a_schema.character_8_type
							l_type_list.put_last (l_type)
						when Sk_int8 then
							l_type := a_schema.integer_8_type
							l_type_list.put_last (l_type)
						when Sk_int32 then
							l_type := a_schema.integer_32_type
							l_type_list.put_last (l_type)
						when Sk_int16 then
							l_type := a_schema.integer_16_type
							l_type_list.put_last (l_type)
						when Sk_real_32 then
							l_type := a_schema.real_32_type
							l_type_list.put_last (l_type)
						when Sk_wchar then
							l_type := a_schema.character_32_type
							l_type_list.put_last (l_type)
						when Sk_real_64 then
							l_type := a_schema.real_64_type
							l_type_list.put_last (l_type)
						when Sk_int64 then
							l_type := a_schema.integer_64_type
							l_type_list.put_last (l_type)
						when Sk_uint8 then
							l_type := a_schema.natural_8_type
							l_type_list.put_last (l_type)
						when Sk_uint16 then
							l_type := a_schema.natural_16_type
							l_type_list.put_last (l_type)
						when Sk_uint32 then
							l_type := a_schema.natural_32_type
							l_type_list.put_last (l_type)
						when Sk_uint64 then
							l_type := a_schema.natural_64_type
							l_type_list.put_last (l_type)
						when Sk_pointer then
							l_type := a_schema.pointer_type
							l_type_list.put_last (l_type)
						else
							if l_gentype = Sk_formal then
								create {SB_REFERENCE_FORMAL_TYPE} l_type.make (i)
								l_type_list.put_last (l_type)
							elseif (l_gentype & Sk_exp) = Sk_exp then
									-- Expanded type.
								l_class_id := (l_gentype & Sk_dtype).to_natural_16.as_integer_16
								if l_class_id < 0 or l_class_id > a_schema.maximum_class_index then
									error_handler.report_error_message ("Formal parameter #" + i.out + " has invalid expanded class index in class " + a_class.name + ": " + l_class_id.out)
								else
									l_class := a_schema.classes.item (l_class_id)
									if l_class = Void then
										create l_class.make_unknown (l_class_id)
										a_schema.classes.put (l_class, l_class_id)
									end
									if l_class = a_class then
											-- A class cannot have itself as expanded formal generic parameter.
										error_handler.report_error_message ("Formal parameter #" + i.out + " has invalid expanded class index (same as current class) in class " + a_class.name + ": " + l_class_id.out)
									else
										l_class.set_expanded (True)
										l_type := l_class.class_type
										l_type_list.put_last (l_type)
									end
								end
							else
								error_handler.report_error_message ("Formal parameter #" + i.out + " either invalid or not supported in class " + a_class.name + ": 0x" + l_gentype.to_hex_string)
							end
						end
						i := i + 1
					end
				end
			end
		end

	read_attributes (a_class: SB_CLASS; a_schema: SB_SCHEMA; a_file: SB_INPUT_FILE)
			-- Read `a_class''s attributes from `a_file'.
		require
			a_class_not_void: a_class /= Void
			a_schema_not_void: a_schema /= Void
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			i, nb: INTEGER
			l_attributes: SB_ATTRIBUTE_LIST
		do
				-- Read number of attributes.
			a_file.read_integer_16
			nb:= a_file.last_integer_16
			if nb < 0 then
				error_handler.report_error_message ("Invalid number of attributes in class " + a_class.name + ": " + nb.out)
			else
				create l_attributes.make_with_capacity (nb)
				a_class.set_attributes (l_attributes)
				from i := 1 until i > nb loop
					read_attribute (a_class, a_schema, a_file)
					if error_handler.has_error then
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
			end
		end

	read_attribute (a_class: SB_CLASS; a_schema: SB_SCHEMA; a_file: SB_INPUT_FILE)
			-- Read an attribute from `a_file' and put it in `a_class'.
		require
			a_class_not_void: a_class /= Void
			a_class_attributes_not_full: a_class.attributes.count < a_class.attributes.capacity
			a_schema_not_void: a_schema /= Void
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		deferred
		end

	resolve_attribute_types (a_class: SB_CLASS)
			-- Resolve types of attributes in `a_class'.
		require
			a_class_not_void: a_class /= Void
		local
			l_attributes: SB_ATTRIBUTE_LIST
			i, nb: INTEGER
		do
			l_attributes := a_class.attributes
			nb := l_attributes.count
			from i := 1 until i > nb loop
				resolve_attribute_type (l_attributes.item (i), a_class)
				i := i + 1
			end
		end

	resolve_attribute_type (a_attribute: SB_ATTRIBUTE; a_class: SB_CLASS)
			-- Resolve type of `a_attribute' in `a_class'.
		require
			a_attribute_not_void: a_attribute /= Void
			a_class_not_void: a_class /= Void
		local
			i, nb: INTEGER
			l_type: SB_TYPE
			l_actuals: SB_TYPE_LIST
			l_has_error: BOOLEAN
		do
			l_type := a_attribute.type
			if not l_type.has_unknown then
				l_actuals := empty_type_list
				if attached {SB_CLASS_TYPE} l_type as l_class_type then
					l_actuals := l_class_type.actual_parameters
					l_class_type.set_actual_parameters (empty_type_list)
				elseif attached {SB_TUPLE_TYPE} l_type as l_tuple_type then
					l_actuals := l_tuple_type.actual_parameters
					l_tuple_type.set_actual_parameters (empty_type_list)
				end
				nb := l_actuals.count
				i := resolve_attribute_subtype (l_type, l_actuals, 1, a_attribute, a_class)
				if i <= 0 then
					-- Error already reported.
				elseif i /= nb + 1 then
					a_attribute.set_type_error (True)
					l_has_error := error_handler.has_error
					error_handler.report_error_message ("Invalid number of generic parameters in attribute `" + a_attribute.name + "' of class " + a_class.full_name + ": " + l_type.name)
					if not l_has_error then
						error_handler.set_has_error (False)
					end
				end
			end
		end

	resolve_attribute_subtype (a_subtype: SB_TYPE; a_parameters: SB_TYPE_LIST; an_index: INTEGER; a_attribute: SB_ATTRIBUTE; a_class: SB_CLASS): INTEGER
			-- Resolve `a_subtype' of `a_attribute' in `a_class' using the actual
			-- generic parameters `a_parameters' starting at index `an_index'.
			-- Return the new index in the list.
		require
			a_subtype_not_void: a_subtype /= Void
			a_parameters_not_void: a_parameters /= Void
			an_index_large_enough: an_index >= 1
			an_index_small_enough: an_index <= a_parameters.count + 1
			not_unknown_subtype: not a_subtype.has_unknown
			a_attribute_not_void: a_attribute /= Void
			a_class_not_void: a_class /= Void
		local
			l_actuals: SB_TYPE_LIST
			l_type: SB_TYPE
			i, nb: INTEGER
			l_has_error: BOOLEAN
			l_formals: SB_TYPE_LIST
		do
			if attached {SB_CLASS_TYPE} a_subtype as l_class_type then
				if not l_class_type.actual_parameters.is_empty then
					a_attribute.set_type_error (True)
					error_handler.report_error_message ("Class type already resolved in attribute `" + a_attribute.name + "' of class " +  a_class.full_name + ": " + l_class_type.name)
					Result := -1
				else
					l_formals := l_class_type.storable_class.formal_parameters
					nb := l_formals.count
					create l_actuals.make_with_capacity (nb)
					l_class_type.set_actual_parameters (l_actuals)
					Result := an_index
					from i := 1 until i > nb loop
						if Result <= 0 then
								-- Error already reported.
							i := nb + 1 -- Jump out of the loop.
						elseif Result > a_parameters.count then
							a_attribute.set_type_error (True)
							l_has_error := error_handler.has_error
							error_handler.report_error_message ("Invalid number of generic parameters in class type in attribute `" + a_attribute.name + "' of class " + a_class.full_name + ": " + l_class_type.name)
							if not l_has_error then
									-- Some older versions of Eiffel stored STORABLE files with incorrect
									-- values for the number of parameters in Tuple types, therefore
									-- we need to be tolerant on this kind of error. So the error is
									-- reported but `error_handler.has_error' is not set and
									-- `has_attribute_type_error' is set instead.
								error_handler.set_has_error (False)
							end
							Result := -1
							i := nb + 1 -- Jump out of the loop.
						else
							l_type := a_parameters.item (Result)
							l_actuals.put_last (l_type)
							Result := resolve_attribute_subtype (l_type, a_parameters, Result + 1, a_attribute, a_class)
							i := i + 1
						end
					end
				end
			elseif attached {SB_TUPLE_TYPE} a_subtype as l_tuple_type then
				if not l_tuple_type.actual_parameters.is_empty then
					a_attribute.set_type_error (True)
					error_handler.report_error_message ("Tuple type already resolved in attribute `" + a_attribute.name + "' of class " + a_class.full_name + ": " + l_tuple_type.name)
					Result := -1
				else
					nb := l_tuple_type.actual_parameters_count
					create l_actuals.make_with_capacity (nb)
					l_tuple_type.set_actual_parameters (l_actuals)
					Result := an_index
					from i := 1 until i > nb loop
						if Result <= 0 then
								-- Error already reported.
							i := nb + 1 -- Jump out of the loop.
						elseif Result > a_parameters.count then
							a_attribute.set_type_error (True)
							l_has_error := error_handler.has_error
							error_handler.report_error_message ("Invalid number of generic parameters in tuple type in attribute `" + a_attribute.name + "' of class " + a_class.full_name + ": " +  l_tuple_type.name)
							if not l_has_error then
									-- Some older versions of Eiffel stored STORABLE files with incorrect
									-- values for the number of parameters in Tuple types, therefore
									-- we need to be tolerant on this kind of error. So the error is
									-- reported but `error.signaled' is not set and
									-- `has_attribute_type_error' is set instead.
								error_handler.set_has_error (False)
							end
							Result := -1
							i := nb + 1 -- Jump out of the loop.
						else
							l_type := a_parameters.item (Result)
							l_actuals.put_last (l_type)
							Result := resolve_attribute_subtype (l_type, a_parameters, Result + 1, a_attribute, a_class)
							i := i + 1
						end
					end
				end
			else
				Result := an_index
			end
		end

feature -- Object input

	read_objects (a_objects: SB_OBJECTS; a_schema: SB_SCHEMA; a_file: SB_INPUT_FILE)
			-- Read objects from `a_file', using `a_schema'.
		local
			i, nb: INTEGER
			l_unresolved: DS_ARRAYED_LIST [SB_UNRESOLVED_ADDRESS]
			l_unresolved_address: SB_UNRESOLVED_ADDRESS
			l_reference_object: SB_REFERENCE_OBJECT
			l_objects: DS_MULTIARRAYED_HASH_TABLE [SB_REFERENCE_OBJECT, NATURAL_64]
			l_read_objects_action: PROCEDURE [SB_INPUT_FILE, INTEGER, INTEGER]
			l_tuple: TUPLE [SB_INPUT_FILE, INTEGER, INTEGER]
			l_index: INTEGER_REF
		do
				-- Read number of objects to be read.
			a_file.read_integer_32
			nb := a_file.last_integer_32
			if nb < 0 then
				error_handler.report_error_message ("Negative number of objects: " + nb.out)
			else
				l_objects := a_objects.objects
				if nb > l_objects.capacity then
					l_objects.resize (nb)
				end
				l_read_objects_action := a_objects.read_objects_action
				create l_unresolved.make (100)
				create l_tuple
				l_tuple.put (a_file, 1)
				l_tuple.put (nb, 3)
				l_index := 1
				from i := 1 until i > nb loop
					if l_read_objects_action /= Void then
						l_index.set_item (i)
						l_tuple.put (l_index, 2)
						l_read_objects_action.call (l_tuple)
					end
					read_object (Void, 0, a_objects, a_schema, a_file, l_unresolved)
					if error_handler.has_error then
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
				nb := l_unresolved.count
				from i := 1 until i > nb loop
					l_unresolved_address := l_unresolved.item (i)
					if l_unresolved_address /= Void then
						l_objects.search (l_unresolved_address.address)
						if l_objects.found then
							l_reference_object := l_objects.found_item
							l_reference_object.set_reference_count (l_reference_object.reference_count + 1)
							l_unresolved_address.object.put (l_reference_object, l_unresolved_address.index)
						else
							error_handler.report_error_message ("Unresolved address: 0x" + l_unresolved_address.address.to_hex_string)
						end
					end
					i := i + 1
				end
				debug ("storable")
					print ("Unresolved addresses: " + l_unresolved.count.out + "%N")
					print ("Boolean objects: " + a_objects.boolean_objects.count.out + "%N")
					print ("Character_8 objects: " + a_objects.character_8_objects.count.out + "%N")
					print ("Character_32 objects: " + a_objects.character_32_objects.count.out + "%N")
					print ("Integer_32 objects: " + a_objects.integer_32_objects.count.out + "%N")
					print ("Integer_8 objects: " + a_objects.integer_8_objects.count.out + "%N")
					print ("Integer_16 objects: " + a_objects.integer_16_objects.count.out + "%N")
					print ("Integer_64 objects: " + a_objects.integer_64_objects.count.out + "%N")
					print ("Natural_8 objects: " + a_objects.natural_8_objects.count.out + "%N")
					print ("Natural_16 objects: " + a_objects.natural_16_objects.count.out + "%N")
					print ("Natural_32 objects: " + a_objects.natural_32_objects.count.out + "%N")
					print ("Natural_64 objects: " + a_objects.natural_64_objects.count.out + "%N")
					print ("Real_32 objects: " + a_objects.real_32_objects.count.out + "%N")
					print ("Real_64 objects: " + a_objects.real_64_objects.count.out + "%N")
					print ("Pointer objects: " + a_objects.pointer_objects.count.out + "%N")
					print ("Type_list capacity: " + type_list.capacity.out + "%N")
				end
			end
		end

feature {NONE} -- Object input

	read_object (a_parent: detachable SB_COMPOSITE_OBJECT; a_parent_index: INTEGER; a_objects: SB_OBJECTS;
		a_schema: SB_SCHEMA; a_file: SB_INPUT_FILE; a_unresolved: DS_ARRAYED_LIST [SB_UNRESOLVED_ADDRESS])
			-- Read object from `a_file', using `a_schema'.
			-- Put it in `a_parent' at index `a_parent_index' if it is expanded
			-- (i.e. when `a_parent' is not void), in `objects' otherwise.
			-- Store unresolved addresses in `a_unresolved'.
		require
			a_parent_index_valid: a_parent /= Void implies a_parent.valid_index (a_parent_index)
			a_objects_not_void: a_objects /= Void
			objects_not_full: a_parent = Void implies not a_objects.objects.is_full
			a_schema_not_void: a_schema /= Void
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
			a_unresolved_not_void: a_unresolved /= Void
		local
			l_address: NATURAL_64
			l_flags: NATURAL_32
			l_type: SB_TYPE
		do
				-- Read address of object.
				-- Number of bytes to encode an address:
			a_file.read_integer_8
			inspect a_file.last_integer_8
			when 4 then
					-- Address on 4 bytes.
				a_file.read_natural_32
				l_address := a_file.last_natural_32
			when 8 then
					-- Address on 8 bytes.
				a_file.read_natural_64
				l_address := a_file.last_natural_64
			else
				error_handler.report_error_message ("Invalid number of bytes to encode address: " + a_file.last_integer_8.out)
			end
			if not error_handler.has_error then
					-- Read flags.
				a_file.read_natural_32
				l_flags := a_file.last_natural_32
				l_type := read_object_type (l_flags, a_schema, a_file)
					-- Read subobject.
				if l_type /= Void then
					read_subobject (l_address, l_flags, l_type, a_parent, a_parent_index, a_objects, a_schema, a_file, a_unresolved)
				end
			end
		end

	read_object_type (a_flags: NATURAL_32; a_schema: SB_SCHEMA; a_file: SB_INPUT_FILE): detachable SB_TYPE
			-- Read object type from `a_file', using `a_schema'.
		require
			a_schema_not_void: a_schema /= Void
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		deferred
		end

	read_subobject (an_address: NATURAL_64; a_flags: NATURAL_32; a_type: SB_TYPE;
		a_parent: detachable SB_COMPOSITE_OBJECT; a_parent_index: INTEGER;
		a_objects: SB_OBJECTS; a_schema: SB_SCHEMA; a_file: SB_INPUT_FILE;
		a_unresolved: DS_ARRAYED_LIST [SB_UNRESOLVED_ADDRESS])
			-- Read subobject from `a_file', using `a_schema'.
			-- Put it in `a_parent' at index `a_parent_index' if it is expanded
			-- (i.e. when `a_parent' is not void), in `objects' otherwise.
			-- Store unresolved addresses in `a_unresolved'.
		require
			a_type_not_void: a_type /= Void
			a_parent_index_valid: a_parent /= Void implies a_parent.valid_index (a_parent_index)
			a_objects_not_void: a_objects /= Void
			objects_not_full: a_parent = Void implies not a_objects.objects.is_full
			a_schema_not_void: a_schema /= Void
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
			a_unresolved_not_void: a_unresolved /= Void
		local
			l_class: SB_CLASS
			l_types: SB_TYPE_LIST
			l_subtype: SB_TYPE
			l_count: INTEGER_32
			l_class_type1: SB_CLASS_TYPE
			l_special_reference_object: SB_SPECIAL_REFERENCE_OBJECT
			l_special_expanded_object: SB_SPECIAL_EXPANDED_OBJECT
			l_special_integer_32_object: SB_SPECIAL_INTEGER_32_OBJECT
			l_special_integer_8_object: SB_SPECIAL_INTEGER_8_OBJECT
			l_special_integer_16_object: SB_SPECIAL_INTEGER_16_OBJECT
			l_special_integer_64_object: SB_SPECIAL_INTEGER_64_OBJECT
			l_special_natural_8_object: SB_SPECIAL_NATURAL_8_OBJECT
			l_special_natural_16_object: SB_SPECIAL_NATURAL_16_OBJECT
			l_special_natural_32_object: SB_SPECIAL_NATURAL_32_OBJECT
			l_special_natural_64_object: SB_SPECIAL_NATURAL_64_OBJECT
			l_special_boolean_object: SB_SPECIAL_BOOLEAN_OBJECT
			l_special_character_8_object: SB_SPECIAL_CHARACTER_8_OBJECT
			l_special_character_32_object: SB_SPECIAL_CHARACTER_32_OBJECT
			l_special_real_32_object: SB_SPECIAL_REAL_32_OBJECT
			l_special_real_64_object: SB_SPECIAL_REAL_64_OBJECT
			l_special_pointer_object: SB_SPECIAL_POINTER_OBJECT
			l_regular_object: SB_REGULAR_OBJECT
			l_tuple_object: SB_TUPLE_OBJECT
			l_objects: DS_MULTIARRAYED_HASH_TABLE [SB_REFERENCE_OBJECT, NATURAL_64]
		do
				-- Read attributes.
			l_objects := a_objects.objects
			if attached {SB_CLASS_TYPE} a_type as l_class_type then
				if (a_flags & Eo_spec) = Eo_spec then
						-- Object is special.
						-- Read number of items in SPECIAL object.
					a_file.read_integer_32
					l_count := a_file.last_integer_32
					l_class := l_class_type.storable_class
					l_types := l_class.formal_parameters
					if l_types.count /= 1 then
						error_handler.report_error_message ("Invalid SPECIAL object, type SPECIAL should have exactly one generic parameter: " + l_class_type.name)
					else
						l_subtype := l_types.item (1)
						if l_subtype.is_expanded then
							if l_subtype.is_boolean then
								create l_special_boolean_object.make (l_class_type, a_flags, an_address, l_count)
								read_special_elem_size (l_special_boolean_object, a_file)
								read_special_capacity (l_special_boolean_object, a_file)
								if a_parent /= Void then
									a_parent.put (l_special_boolean_object, a_parent_index)
								else
									l_objects.put_last (l_special_boolean_object, an_address)
								end
								read_special_boolean_object (l_special_boolean_object, a_file)
							elseif l_subtype.is_character_8 then
								create l_special_character_8_object.make (l_class_type, a_flags, an_address, l_count)
								read_special_elem_size (l_special_character_8_object, a_file)
								read_special_capacity (l_special_character_8_object, a_file)
								if a_parent /= Void then
									a_parent.put (l_special_character_8_object, a_parent_index)
								else
									l_objects.put_last (l_special_character_8_object, an_address)
								end
								read_special_character_8_object (l_special_character_8_object, a_file)
							elseif l_subtype.is_character_32 then
								create l_special_character_32_object.make (l_class_type, a_flags, an_address, l_count)
								read_special_elem_size (l_special_character_32_object, a_file)
								read_special_capacity (l_special_character_32_object, a_file)
								if a_parent /= Void then
									a_parent.put (l_special_character_32_object, a_parent_index)
								else
									l_objects.put_last (l_special_character_32_object, an_address)
								end
								read_special_character_32_object (l_special_character_32_object, a_file)
							elseif l_subtype.is_integer_32 then
								create l_special_integer_32_object.make (l_class_type, a_flags, an_address, l_count)
								read_special_elem_size (l_special_integer_32_object, a_file)
								read_special_capacity (l_special_integer_32_object, a_file)
								if a_parent /= Void then
									a_parent.put (l_special_integer_32_object, a_parent_index)
								else
									l_objects.put_last (l_special_integer_32_object, an_address)
								end
								read_special_integer_32_object (l_special_integer_32_object, a_file)
							elseif l_subtype.is_integer_8 then
								create l_special_integer_8_object.make (l_class_type, a_flags, an_address, l_count)
								read_special_elem_size (l_special_integer_8_object, a_file)
								read_special_capacity (l_special_integer_8_object, a_file)
								if a_parent /= Void then
									a_parent.put (l_special_integer_8_object, a_parent_index)
								else
									l_objects.put_last (l_special_integer_8_object, an_address)
								end
								read_special_integer_8_object (l_special_integer_8_object, a_file)
							elseif l_subtype.is_integer_16 then
								create l_special_integer_16_object.make (l_class_type, a_flags, an_address, l_count)
								read_special_elem_size (l_special_integer_16_object, a_file)
								read_special_capacity (l_special_integer_16_object, a_file)
								if a_parent /= Void then
									a_parent.put (l_special_integer_16_object, a_parent_index)
								else
									l_objects.put_last (l_special_integer_16_object, an_address)
								end
								read_special_integer_16_object (l_special_integer_16_object, a_file)
							elseif l_subtype.is_integer_64 then
								create l_special_integer_64_object.make (l_class_type, a_flags, an_address, l_count)
								read_special_elem_size (l_special_integer_64_object, a_file)
								read_special_capacity (l_special_integer_64_object, a_file)
								if a_parent /= Void then
									a_parent.put (l_special_integer_64_object, a_parent_index)
								else
									l_objects.put_last (l_special_integer_64_object, an_address)
								end
								read_special_integer_64_object (l_special_integer_64_object, a_file)
							elseif l_subtype.is_natural_8 then
								create l_special_natural_8_object.make (l_class_type, a_flags, an_address, l_count)
								read_special_elem_size (l_special_natural_8_object, a_file)
								read_special_capacity (l_special_natural_8_object, a_file)
								if a_parent /= Void then
									a_parent.put (l_special_natural_8_object, a_parent_index)
								else
									l_objects.put_last (l_special_natural_8_object, an_address)
								end
								read_special_natural_8_object (l_special_natural_8_object, a_file)
							elseif l_subtype.is_natural_16 then
								create l_special_natural_16_object.make (l_class_type, a_flags, an_address, l_count)
								read_special_elem_size (l_special_natural_16_object, a_file)
								read_special_capacity (l_special_natural_16_object, a_file)
								if a_parent /= Void then
									a_parent.put (l_special_natural_16_object, a_parent_index)
								else
									l_objects.put_last (l_special_natural_16_object, an_address)
								end
								read_special_natural_16_object (l_special_natural_16_object, a_file)
							elseif l_subtype.is_natural_32 then
								create l_special_natural_32_object.make (l_class_type, a_flags, an_address, l_count)
								read_special_elem_size (l_special_natural_32_object, a_file)
								read_special_capacity (l_special_natural_32_object, a_file)
								if a_parent /= Void then
									a_parent.put (l_special_natural_32_object, a_parent_index)
								else
									l_objects.put_last (l_special_natural_32_object, an_address)
								end
								read_special_natural_32_object (l_special_natural_32_object, a_file)
							elseif l_subtype.is_natural_64 then
								create l_special_natural_64_object.make (l_class_type, a_flags, an_address, l_count)
								read_special_elem_size (l_special_natural_64_object, a_file)
								read_special_capacity (l_special_natural_64_object, a_file)
								if a_parent /= Void then
									a_parent.put (l_special_natural_64_object, a_parent_index)
								else
									l_objects.put_last (l_special_natural_64_object, an_address)
								end
								read_special_natural_64_object (l_special_natural_64_object, a_file)
							elseif l_subtype.is_real_32 then
								create l_special_real_32_object.make (l_class_type, a_flags, an_address, l_count)
								read_special_elem_size (l_special_real_32_object, a_file)
								read_special_capacity (l_special_real_32_object, a_file)
								if a_parent /= Void then
									a_parent.put (l_special_real_32_object, a_parent_index)
								else
									l_objects.put_last (l_special_real_32_object, an_address)
								end
								read_special_real_32_object (l_special_real_32_object, a_file)
							elseif l_subtype.is_real_64 then
								create l_special_real_64_object.make (l_class_type, a_flags, an_address, l_count)
								read_special_elem_size (l_special_real_64_object, a_file)
								read_special_capacity (l_special_real_64_object, a_file)
								if a_parent /= Void then
									a_parent.put (l_special_real_64_object, a_parent_index)
								else
									l_objects.put_last (l_special_real_64_object, an_address)
								end
								read_special_real_64_object (l_special_real_64_object, a_file)
							elseif l_subtype.is_pointer then
								create l_special_pointer_object.make (l_class_type, a_flags, an_address, l_count)
								read_special_elem_size (l_special_pointer_object, a_file)
								read_special_capacity (l_special_pointer_object, a_file)
								if a_parent /= Void then
									a_parent.put (l_special_pointer_object, a_parent_index)
								else
									l_objects.put_last (l_special_pointer_object, an_address)
								end
								read_special_pointer_object (l_special_pointer_object, a_file)
							else
								create l_special_expanded_object.make (l_class_type, a_flags, an_address, l_count)
								read_special_elem_size (l_special_expanded_object, a_file)
								read_special_capacity (l_special_expanded_object, a_file)
								if a_parent /= Void then
									a_parent.put (l_special_expanded_object, a_parent_index)
								else
									l_objects.put_last (l_special_expanded_object, an_address)
								end
								read_special_expanded_object (l_special_expanded_object, a_objects, a_schema, a_file, a_unresolved)
							end
						else
							create l_special_reference_object.make (l_class_type, a_flags, an_address, l_count)
							read_special_elem_size (l_special_reference_object, a_file)
							read_special_capacity (l_special_reference_object, a_file)
							if a_parent /= Void then
								a_parent.put (l_special_reference_object, a_parent_index)
							else
								l_objects.put_last (l_special_reference_object, an_address)
							end
							read_special_reference_object (l_special_reference_object, a_objects, a_file, a_unresolved)
						end
					end
				else
						-- Object is regular.
					create l_regular_object.make (l_class_type, a_flags, an_address)
					if a_parent /= Void then
						a_parent.put (l_regular_object, a_parent_index)
					else
						l_objects.put_last (l_regular_object, an_address)
					end
					read_regular_object (l_regular_object, a_objects, a_schema, a_file, a_unresolved)
				end
			elseif attached {SB_TUPLE_TYPE} a_type as l_tuple_type then
				if (a_flags & Eo_spec) = Eo_spec then
						-- Object is tuple.
						-- Read number of items in TUPLE object.
					a_file.read_integer_32
						-- The first item of the tuple (at position 0) is
						-- a padding and is not stored in STORABLE.
					l_count := a_file.last_integer_32 - 1
					create l_tuple_object.make (l_tuple_type, a_flags, an_address, l_count)
					read_tuple_elem_size (l_tuple_object, a_file)
					read_tuple_capacity (l_tuple_object, a_file)
					if a_parent /= Void then
						a_parent.put (l_tuple_object, a_parent_index)
					else
						l_objects.put_last (l_tuple_object, an_address)
					end
					read_tuple_object (l_tuple_object, a_objects, a_schema, a_file, a_unresolved)
				else
						-- Object is tuple stored as regular.
					create l_class_type1.make (l_tuple_type.storable_class)
					l_class_type1.set_actual_parameters (l_tuple_type.actual_parameters)
					create l_regular_object.make (l_class_type1, a_flags, an_address)
					if a_parent /= Void then
						a_parent.put (l_regular_object, a_parent_index)
					else
						l_objects.put_last (l_regular_object, an_address)
					end
					read_regular_object (l_regular_object, a_objects, a_schema, a_file, a_unresolved)
				end
			else
				error_handler.report_error_message ("Object type either invalid or not supported: " + a_type.name)
			end
		end

	read_regular_object (a_regular_object: SB_REGULAR_OBJECT; a_objects: SB_OBJECTS;
		a_schema: SB_SCHEMA; a_file: SB_INPUT_FILE;
		a_unresolved: DS_ARRAYED_LIST [SB_UNRESOLVED_ADDRESS])
			-- Read attributes of `a_regular_object' from `a_file'.
			-- Store unresolved addresses in `a_unresolved'.
		require
			a_regular_object_not_void: a_regular_object /= Void
			a_objects_not_void: a_objects /= Void
			a_schema_not_void: a_schema /= Void
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
			a_unresolved_not_void: a_unresolved /= Void
		local
			l_class: SB_CLASS
			l_attributes: SB_ATTRIBUTE_LIST
			l_attribute: SB_ATTRIBUTE
			l_type: SB_TYPE
--			l_index: INTEGER
--			l_actual_parameters: SB_TYPE_LIST
			i, nb: INTEGER
			l_address: NATURAL_64
			l_reference_object: SB_REFERENCE_OBJECT
			l_unresolved: SB_UNRESOLVED_ADDRESS
			l_objects: DS_MULTIARRAYED_HASH_TABLE [SB_REFERENCE_OBJECT, NATURAL_64]
			l_boolean_objects: DS_HASH_TABLE [SB_BOOLEAN_OBJECT, BOOLEAN]
			l_boolean_object: SB_BOOLEAN_OBJECT
			l_boolean_value: BOOLEAN
			l_character_8_objects: DS_HASH_TABLE [SB_CHARACTER_8_OBJECT, CHARACTER_8]
			l_character_8_object: SB_CHARACTER_8_OBJECT
			l_character_8_value: CHARACTER_8
			l_character_32_objects: DS_HASH_TABLE [SB_CHARACTER_32_OBJECT, NATURAL_32]
			l_character_32_object: SB_CHARACTER_32_OBJECT
			l_character_32_value: NATURAL_32
			l_integer_32_objects: DS_MULTIARRAYED_HASH_TABLE [SB_INTEGER_32_OBJECT, INTEGER_32]
			l_integer_32_object: SB_INTEGER_32_OBJECT
			l_integer_32_value: INTEGER_32
			l_integer_8_objects: DS_HASH_TABLE [SB_INTEGER_8_OBJECT, INTEGER_8]
			l_integer_8_object: SB_INTEGER_8_OBJECT
			l_integer_8_value: INTEGER_8
			l_integer_16_objects: DS_MULTIARRAYED_HASH_TABLE [SB_INTEGER_16_OBJECT, INTEGER_16]
			l_integer_16_object: SB_INTEGER_16_OBJECT
			l_integer_16_value: INTEGER_16
			l_integer_64_objects: DS_MULTIARRAYED_HASH_TABLE [SB_INTEGER_64_OBJECT, INTEGER_64]
			l_integer_64_object: SB_INTEGER_64_OBJECT
			l_integer_64_value: INTEGER_64
			l_natural_8_objects: DS_HASH_TABLE [SB_NATURAL_8_OBJECT, NATURAL_8]
			l_natural_8_object: SB_NATURAL_8_OBJECT
			l_natural_8_value: NATURAL_8
			l_natural_16_objects: DS_MULTIARRAYED_HASH_TABLE [SB_NATURAL_16_OBJECT, NATURAL_16]
			l_natural_16_object: SB_NATURAL_16_OBJECT
			l_natural_16_value: NATURAL_16
			l_natural_32_objects: DS_MULTIARRAYED_HASH_TABLE [SB_NATURAL_32_OBJECT, NATURAL_32]
			l_natural_32_object: SB_NATURAL_32_OBJECT
			l_natural_32_value: NATURAL_32
			l_natural_64_objects: DS_MULTIARRAYED_HASH_TABLE [SB_NATURAL_64_OBJECT, NATURAL_64]
			l_natural_64_object: SB_NATURAL_64_OBJECT
			l_natural_64_value: NATURAL_64
			l_pointer_objects: DS_MULTIARRAYED_HASH_TABLE [SB_POINTER_OBJECT, NATURAL_64]
			l_pointer_object: SB_POINTER_OBJECT
			l_pointer_value: NATURAL_64
			l_real_32_objects: DS_MULTIARRAYED_HASH_TABLE [SB_REAL_32_OBJECT, REAL_32]
			l_real_32_object: SB_REAL_32_OBJECT
			l_real_32_value: REAL_32
			l_real_64_objects: DS_MULTIARRAYED_HASH_TABLE [SB_REAL_64_OBJECT, REAL_64]
			l_real_64_object: SB_REAL_64_OBJECT
			l_real_64_value: REAL_64
		do
			l_class := a_regular_object.type.storable_class
			l_class.set_instance_count (l_class.instance_count + 1)
			l_objects := a_objects.objects
			l_attributes := l_class.attributes
			nb := l_attributes.count
				-- Note: attributes are stored in reverse order
				-- in the Storable file!
			from i := nb until i < 1 loop
				l_attribute := l_attributes.item (i)
				l_type := l_attribute.type
--				if l_type.is_formal then
--						-- Resolve formal type.
--					if attached {SB_FORMAL_TYPE} l_type as l_formal_type then
--						l_actual_parameters := a_regular_object.storable_class.formal_parameters
--						l_index := l_formal_type.index
--						if l_index <= l_actual_parameters.count then
--							l_type := l_actual_parameters.item (l_index)
--						end
--					end
--				end
				if l_type.is_expanded then
					if l_type.is_boolean then
						a_file.read_character_8
						l_boolean_value := (a_file.last_character_8 /= '%U')
						l_boolean_objects := a_objects.boolean_objects
						l_boolean_objects.search (l_boolean_value)
						if l_boolean_objects.found then
							l_boolean_object := l_boolean_objects.found_item
						else
							create l_boolean_object.make (l_type, l_boolean_value)
							l_boolean_objects.force_last (l_boolean_object, l_boolean_value)
						end
						a_regular_object.put (l_boolean_object, i)
					elseif l_type.is_character_8 then
						a_file.read_character_8
						l_character_8_value := a_file.last_character_8
						l_character_8_objects := a_objects.character_8_objects
						l_character_8_objects.search (l_character_8_value)
						if l_character_8_objects.found then
							l_character_8_object := l_character_8_objects.found_item
						else
							create l_character_8_object.make (l_type, l_character_8_value)
							l_character_8_objects.force_last (l_character_8_object, l_character_8_value)
						end
						a_regular_object.put (l_character_8_object, i)
					elseif l_type.is_character_32 then
						a_file.read_natural_32
						l_character_32_value := a_file.last_natural_32
						l_character_32_objects := a_objects.character_32_objects
						l_character_32_objects.search (l_character_32_value)
						if l_character_32_objects.found then
							l_character_32_object := l_character_32_objects.found_item
						else
							create l_character_32_object.make (l_type, l_character_32_value)
							l_character_32_objects.force_last (l_character_32_object, l_character_32_value)
						end
						a_regular_object.put (l_character_32_object, i)
					elseif l_type.is_integer_32 then
						a_file.read_integer_32
						l_integer_32_value := a_file.last_integer_32
						l_integer_32_objects := a_objects.integer_32_objects
						l_integer_32_objects.search (l_integer_32_value)
						if l_integer_32_objects.found then
							l_integer_32_object := l_integer_32_objects.found_item
						else
							create l_integer_32_object.make (l_type, l_integer_32_value)
							l_integer_32_objects.force_last (l_integer_32_object, l_integer_32_value)
						end
						a_regular_object.put (l_integer_32_object, i)
					elseif l_type.is_integer_8 then
						a_file.read_integer_8
						l_integer_8_value := a_file.last_integer_8
						l_integer_8_objects := a_objects.integer_8_objects
						l_integer_8_objects.search (l_integer_8_value)
						if l_integer_8_objects.found then
							l_integer_8_object := l_integer_8_objects.found_item
						else
							create l_integer_8_object.make (l_type, l_integer_8_value)
							l_integer_8_objects.force_last (l_integer_8_object, l_integer_8_value)
						end
						a_regular_object.put (l_integer_8_object, i)
					elseif l_type.is_integer_16 then
						a_file.read_integer_16
						l_integer_16_value := a_file.last_integer_16
						l_integer_16_objects := a_objects.integer_16_objects
						l_integer_16_objects.search (l_integer_16_value)
						if l_integer_16_objects.found then
							l_integer_16_object := l_integer_16_objects.found_item
						else
							create l_integer_16_object.make (l_type, l_integer_16_value)
							l_integer_16_objects.force_last (l_integer_16_object, l_integer_16_value)
						end
						a_regular_object.put (l_integer_16_object, i)
					elseif l_type.is_integer_64 then
						a_file.read_integer_64
						l_integer_64_value := a_file.last_integer_64
						l_integer_64_objects := a_objects.integer_64_objects
						l_integer_64_objects.search (l_integer_64_value)
						if l_integer_64_objects.found then
							l_integer_64_object := l_integer_64_objects.found_item
						else
							create l_integer_64_object.make (l_type, l_integer_64_value)
							l_integer_64_objects.force_last (l_integer_64_object, l_integer_64_value)
						end
						a_regular_object.put (l_integer_64_object, i)
					elseif l_type.is_natural_8 then
						a_file.read_natural_8
						l_natural_8_value := a_file.last_natural_8
						l_natural_8_objects := a_objects.natural_8_objects
						l_natural_8_objects.search (l_natural_8_value)
						if l_natural_8_objects.found then
							l_natural_8_object := l_natural_8_objects.found_item
						else
							create l_natural_8_object.make (l_type, l_natural_8_value)
							l_natural_8_objects.force_last (l_natural_8_object, l_natural_8_value)
						end
						a_regular_object.put (l_natural_8_object, i)
					elseif l_type.is_natural_16 then
						a_file.read_natural_16
						l_natural_16_value := a_file.last_natural_16
						l_natural_16_objects := a_objects.natural_16_objects
						l_natural_16_objects.search (l_natural_16_value)
						if l_natural_16_objects.found then
							l_natural_16_object := l_natural_16_objects.found_item
						else
							create l_natural_16_object.make (l_type, l_natural_16_value)
							l_natural_16_objects.force_last (l_natural_16_object, l_natural_16_value)
						end
						a_regular_object.put (l_natural_16_object, i)
					elseif l_type.is_natural_32 then
						a_file.read_natural_32
						l_natural_32_value := a_file.last_natural_32
						l_natural_32_objects := a_objects.natural_32_objects
						l_natural_32_objects.search (l_natural_32_value)
						if l_natural_32_objects.found then
							l_natural_32_object := l_natural_32_objects.found_item
						else
							create l_natural_32_object.make (l_type, l_natural_32_value)
							l_natural_32_objects.force_last (l_natural_32_object, l_natural_32_value)
						end
						a_regular_object.put (l_natural_32_object, i)
					elseif l_type.is_natural_64 then
						a_file.read_natural_64
						l_natural_64_value := a_file.last_natural_64
						l_natural_64_objects := a_objects.natural_64_objects
						l_natural_64_objects.search (l_natural_64_value)
						if l_natural_64_objects.found then
							l_natural_64_object := l_natural_64_objects.found_item
						else
							create l_natural_64_object.make (l_type, l_natural_64_value)
							l_natural_64_objects.force_last (l_natural_64_object, l_natural_64_value)
						end
						a_regular_object.put (l_natural_64_object, i)
					elseif l_type.is_real_32 then
						a_file.read_real_32
						l_real_32_value := a_file.last_real_32
						if l_real_32_value.is_nan then
								-- There is a problem when storing NaN values in a hash-table
								-- because they are not equal to each others.
							l_real_32_object := a_objects.nan_real_32_object
							if l_real_32_object = Void then
								create l_real_32_object.make (a_schema.real_32_type, l_real_32_value)
								a_objects.set_nan_real_32_object (l_real_32_object)
							end
						else
							l_real_32_objects := a_objects.real_32_objects
							l_real_32_objects.search (l_real_32_value)
							if l_real_32_objects.found then
								l_real_32_object := l_real_32_objects.found_item
							else
								create l_real_32_object.make (l_type, l_real_32_value)
								l_real_32_objects.force_last (l_real_32_object, l_real_32_value)
							end
						end
						a_regular_object.put (l_real_32_object, i)
					elseif l_type.is_real_64 then
						a_file.read_real_64
						l_real_64_value := a_file.last_real_64
						if l_real_64_value.is_nan then
								-- There is a problem when storing NaN values in a hash-table
								-- because they are not equal to each others.
							l_real_64_object := a_objects.nan_real_64_object
							if l_real_64_object = Void then
								create l_real_64_object.make (a_schema.real_64_type, l_real_64_value)
								a_objects.set_nan_real_64_object (l_real_64_object)
							end
						else
							l_real_64_objects := a_objects.real_64_objects
							l_real_64_objects.search (l_real_64_value)
							if l_real_64_objects.found then
								l_real_64_object := l_real_64_objects.found_item
							else
								create l_real_64_object.make (l_type, l_real_64_value)
								l_real_64_objects.force_last (l_real_64_object, l_real_64_value)
							end
						end
						a_regular_object.put (l_real_64_object, i)
					elseif l_type.is_pointer then
							-- Number of bytes to encode an address:
						a_file.read_integer_8
						inspect a_file.last_integer_8
						when 4 then
								-- Address on 4 bytes.
							a_file.read_natural_32
							l_pointer_value := a_file.last_natural_32
							l_pointer_objects := a_objects.pointer_objects
							l_pointer_objects.search (l_pointer_value)
							if l_pointer_objects.found then
								l_pointer_object := l_pointer_objects.found_item
							else
								create l_pointer_object.make (l_type, l_pointer_value)
								l_pointer_objects.force_last (l_pointer_object, l_pointer_value)
							end
							a_regular_object.put (l_pointer_object, i)
						when 8 then
								-- Address on 8 bytes.
							a_file.read_natural_64
							l_pointer_value := a_file.last_natural_64
							l_pointer_objects := a_objects.pointer_objects
							l_pointer_objects.search (l_pointer_value)
							if l_pointer_objects.found then
								l_pointer_object := l_pointer_objects.found_item
							else
								create l_pointer_object.make (l_type, l_pointer_value)
								l_pointer_objects.force_last (l_pointer_object, l_pointer_value)
							end
							a_regular_object.put (l_pointer_object, i)
						else
							error_handler.report_error_message ("Invalid number of bytes to encode address: " + a_file.last_integer_8.out)
							i := 0 -- jump out of the loop.
						end
					else
							-- Expanded object.
						read_object (a_regular_object, i, a_objects, a_schema, a_file, a_unresolved)
					end
				else
						-- Reference.
						-- Number of bytes to encode an address:
					a_file.read_integer_8
					inspect a_file.last_integer_8
					when 4 then
							-- Address on 4 bytes.
						a_file.read_natural_32
						l_address := a_file.last_natural_32
					when 8 then
							-- Address on 8 bytes.
						a_file.read_natural_64
						l_address := a_file.last_natural_64
					else
						l_address := 0
						error_handler.report_error_message ("Invalid number of bytes to encode address: " + a_file.last_integer_8.out)
						i := 0 -- jump out of the loop.
					end
					if i /= 0 then
						if l_address = 0 then
							a_regular_object.put (Void, i)
						else
							l_objects.search (l_address)
							if l_objects.found then
								l_reference_object := l_objects.found_item
								l_reference_object.set_reference_count (l_reference_object.reference_count + 1)
								a_regular_object.put (l_reference_object, i)
							else
								create l_unresolved.make (l_address, a_regular_object, i)
								a_unresolved.force_last (l_unresolved)
							end
						end
					end
				end
				i := i - 1
			end
		end

	read_special_reference_object (a_special_object: SB_SPECIAL_REFERENCE_OBJECT; a_objects: SB_OBJECTS;
		a_file: SB_INPUT_FILE; a_unresolved: DS_ARRAYED_LIST [SB_UNRESOLVED_ADDRESS])
			-- Read items of `a_special_object' from `a_file'.
			-- Store unresolved addresses in `a_unresolved'.
		require
			a_special_object_not_void: a_special_object /= Void
			a_objects_not_void: a_objects /= Void
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
			a_unresolved_not_void: a_unresolved /= Void
		local
			i, nb: INTEGER
			l_class: SB_CLASS
			l_address: NATURAL_64
			l_reference_object: SB_REFERENCE_OBJECT
			l_unresolved: SB_UNRESOLVED_ADDRESS
			l_objects: DS_MULTIARRAYED_HASH_TABLE [SB_REFERENCE_OBJECT, NATURAL_64]
		do
			l_class := a_special_object.type.storable_class
			l_class.set_instance_count (l_class.instance_count + 1)
			nb := a_special_object.count - 1
			l_objects := a_objects.objects
				-- Number of bytes to encode an address:
			a_file.read_integer_8
			inspect a_file.last_integer_8
			when 4 then
					-- Address on 4 bytes.
				from i := 0 until i > nb loop
					a_file.read_natural_32
					l_address := a_file.last_natural_32
					if l_address = 0 then
						a_special_object.put (Void, i)
					else
						l_objects.search (l_address)
						if l_objects.found then
							l_reference_object := l_objects.found_item
							l_reference_object.set_reference_count (l_reference_object.reference_count + 1)
							a_special_object.put (l_reference_object, i)
						else
							create l_unresolved.make (l_address, a_special_object, i)
							a_unresolved.force_last (l_unresolved)
						end
					end
					i := i + 1
				end
			when 8 then
					-- Address on 8 bytes.
				from i := 0 until i > nb loop
					a_file.read_natural_64
					l_address := a_file.last_natural_64
					if l_address = 0 then
						a_special_object.put (Void, i)
					else
						l_objects.search (l_address)
						if l_objects.found then
							l_reference_object := l_objects.found_item
							l_reference_object.set_reference_count (l_reference_object.reference_count + 1)
							a_special_object.put (l_reference_object, i)
						else
							create l_unresolved.make (l_address, a_special_object, i)
							a_unresolved.force_last (l_unresolved)
						end
					end
					i := i + 1
				end
			else
				error_handler.report_error_message ("Invalid number of bytes to encode address: " + a_file.last_integer_8.out)
			end
		end

	read_special_integer_32_object (a_special_object: SB_SPECIAL_INTEGER_32_OBJECT; a_file: SB_INPUT_FILE)
			-- Read items of `a_special_object' from `a_file'.
		require
			a_special_object_not_void: a_special_object /= Void
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			i, nb: INTEGER
			l_class: SB_CLASS
		do
			l_class := a_special_object.type.storable_class
			l_class.set_instance_count (l_class.instance_count + 1)
			nb := a_special_object.count - 1
			from i := 0 until i > nb loop
				a_file.read_integer_32
				a_special_object.put (a_file.last_integer_32, i)
				i := i + 1
			end
		end

	read_special_integer_8_object (a_special_object: SB_SPECIAL_INTEGER_8_OBJECT; a_file: SB_INPUT_FILE)
			-- Read items of `a_special_object' from `a_file'.
		require
			a_special_object_not_void: a_special_object /= Void
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			i, nb: INTEGER
			l_class: SB_CLASS
		do
			l_class := a_special_object.type.storable_class
			l_class.set_instance_count (l_class.instance_count + 1)
			nb := a_special_object.count - 1
			from i := 0 until i > nb loop
				a_file.read_integer_8
				a_special_object.put (a_file.last_integer_8, i)
				i := i + 1
			end
		end

	read_special_integer_16_object (a_special_object: SB_SPECIAL_INTEGER_16_OBJECT; a_file: SB_INPUT_FILE)
			-- Read items of `a_special_object' from `a_file'.
		require
			a_special_object_not_void: a_special_object /= Void
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			i, nb: INTEGER
			l_class: SB_CLASS
		do
			l_class := a_special_object.type.storable_class
			l_class.set_instance_count (l_class.instance_count + 1)
			nb := a_special_object.count - 1
			from i := 0 until i > nb loop
				a_file.read_integer_16
				a_special_object.put (a_file.last_integer_16, i)
				i := i + 1
			end
		end

	read_special_integer_64_object (a_special_object: SB_SPECIAL_INTEGER_64_OBJECT; a_file: SB_INPUT_FILE)
			-- Read items of `a_special_object' from `a_file'.
		require
			a_special_object_not_void: a_special_object /= Void
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			i, nb: INTEGER
			l_class: SB_CLASS
		do
			l_class := a_special_object.type.storable_class
			l_class.set_instance_count (l_class.instance_count + 1)
			nb := a_special_object.count - 1
			from i := 0 until i > nb loop
				a_file.read_integer_64
				a_special_object.put (a_file.last_integer_64, i)
				i := i + 1
			end
		end

	read_special_natural_8_object (a_special_object: SB_SPECIAL_NATURAL_8_OBJECT; a_file: SB_INPUT_FILE)
			-- Read items of `a_special_object' from `a_file'.
		require
			a_special_object_not_void: a_special_object /= Void
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			i, nb: INTEGER
			l_class: SB_CLASS
		do
			l_class := a_special_object.type.storable_class
			l_class.set_instance_count (l_class.instance_count + 1)
			nb := a_special_object.count - 1
			from i := 0 until i > nb loop
				a_file.read_natural_8
				a_special_object.put (a_file.last_natural_8, i)
				i := i + 1
			end
		end

	read_special_natural_16_object (a_special_object: SB_SPECIAL_NATURAL_16_OBJECT; a_file: SB_INPUT_FILE)
			-- Read items of `a_special_object' from `a_file'.
		require
			a_special_object_not_void: a_special_object /= Void
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			i, nb: INTEGER
			l_class: SB_CLASS
		do
			l_class := a_special_object.type.storable_class
			l_class.set_instance_count (l_class.instance_count + 1)
			nb := a_special_object.count - 1
			from i := 0 until i > nb loop
				a_file.read_natural_16
				a_special_object.put (a_file.last_natural_16, i)
				i := i + 1
			end
		end

	read_special_natural_32_object (a_special_object: SB_SPECIAL_NATURAL_32_OBJECT; a_file: SB_INPUT_FILE)
			-- Read items of `a_special_object' from `a_file'.
		require
			a_special_object_not_void: a_special_object /= Void
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			i, nb: INTEGER
			l_class: SB_CLASS
		do
			l_class := a_special_object.type.storable_class
			l_class.set_instance_count (l_class.instance_count + 1)
			nb := a_special_object.count - 1
			from i := 0 until i > nb loop
				a_file.read_natural_32
				a_special_object.put (a_file.last_natural_32, i)
				i := i + 1
			end
		end

	read_special_natural_64_object (a_special_object: SB_SPECIAL_NATURAL_64_OBJECT; a_file: SB_INPUT_FILE)
			-- Read items of `a_special_object' from `a_file'.
		require
			a_special_object_not_void: a_special_object /= Void
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			i, nb: INTEGER
			l_class: SB_CLASS
		do
			l_class := a_special_object.type.storable_class
			l_class.set_instance_count (l_class.instance_count + 1)
			nb := a_special_object.count - 1
			from i := 0 until i > nb loop
				a_file.read_natural_64
				a_special_object.put (a_file.last_natural_64, i)
				i := i + 1
			end
		end

	read_special_boolean_object (a_special_object: SB_SPECIAL_BOOLEAN_OBJECT; a_file: SB_INPUT_FILE)
			-- Read items of `a_special_object' from `a_file'.
		require
			a_special_object_not_void: a_special_object /= Void
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			i, nb: INTEGER
			l_class: SB_CLASS
		do
			l_class := a_special_object.type.storable_class
			l_class.set_instance_count (l_class.instance_count + 1)
			nb := a_special_object.count - 1
			from i := 0 until i > nb loop
				a_file.read_character_8
				a_special_object.put (a_file.last_character_8 /= '%U', i)
				i := i + 1
			end
		end

	read_special_character_8_object (a_special_object: SB_SPECIAL_CHARACTER_8_OBJECT; a_file: SB_INPUT_FILE)
			-- Read items of `a_special_object' from `a_file'.
		require
			a_special_object_not_void: a_special_object /= Void
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			i, nb: INTEGER
			l_class: SB_CLASS
		do
			l_class := a_special_object.type.storable_class
			l_class.set_instance_count (l_class.instance_count + 1)
			nb := a_special_object.count - 1
			from i := 0 until i > nb loop
				a_file.read_character_8
				a_special_object.put (a_file.last_character_8, i)
				i := i + 1
			end
		end

	read_special_character_32_object (a_special_object: SB_SPECIAL_CHARACTER_32_OBJECT; a_file: SB_INPUT_FILE)
			-- Read items of `a_special_object' from `a_file'.
		require
			a_special_object_not_void: a_special_object /= Void
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			i, nb: INTEGER
			l_class: SB_CLASS
		do
			l_class := a_special_object.type.storable_class
			l_class.set_instance_count (l_class.instance_count + 1)
			nb := a_special_object.count - 1
			from i := 0 until i > nb loop
				a_file.read_natural_32
				a_special_object.put (a_file.last_natural_32, i)
				i := i + 1
			end
		end

	read_special_real_32_object (a_special_object: SB_SPECIAL_REAL_32_OBJECT; a_file: SB_INPUT_FILE)
			-- Read items of `a_special_object' from `a_file'.
		require
			a_special_object_not_void: a_special_object /= Void
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			i, nb: INTEGER
			l_class: SB_CLASS
		do
			l_class := a_special_object.type.storable_class
			l_class.set_instance_count (l_class.instance_count + 1)
			nb := a_special_object.count - 1
			from i := 0 until i > nb loop
				a_file.read_real_32
				a_special_object.put (a_file.last_real_32, i)
				i := i + 1
			end
		end

	read_special_real_64_object (a_special_object: SB_SPECIAL_REAL_64_OBJECT; a_file: SB_INPUT_FILE)
			-- Read items of `a_special_object' from `a_file'.
		require
			a_special_object_not_void: a_special_object /= Void
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			i, nb: INTEGER
			l_class: SB_CLASS
		do
			l_class := a_special_object.type.storable_class
			l_class.set_instance_count (l_class.instance_count + 1)
			nb := a_special_object.count - 1
			from i := 0 until i > nb loop
				a_file.read_real_64
				a_special_object.put (a_file.last_real_64, i)
				i := i + 1
			end
		end

	read_special_pointer_object (a_special_object: SB_SPECIAL_POINTER_OBJECT; a_file: SB_INPUT_FILE)
			-- Read items of `a_special_object' from `a_file'.
		require
			a_special_object_not_void: a_special_object /= Void
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			i, nb: INTEGER
			l_class: SB_CLASS
		do
			l_class := a_special_object.type.storable_class
			l_class.set_instance_count (l_class.instance_count + 1)
			nb := a_special_object.count - 1
				-- Number of bytes to encode an address:
			a_file.read_integer_8
			inspect a_file.last_integer_8
			when 4 then
					-- Address on 4 bytes.
				from i := 0 until i > nb loop
					a_file.read_natural_32
					a_special_object.put (a_file.last_natural_32, i)
					i := i + 1
				end
			when 8 then
					-- Address on 8 bytes.
				from i := 0 until i > nb loop
					a_file.read_natural_64
					a_special_object.put (a_file.last_natural_64, i)
					i := i + 1
				end
			else
				error_handler.report_error_message ("Invalid number of bytes to encode address: " + a_file.last_integer_8.out)
			end
		end

	read_special_expanded_object (a_special_object: SB_SPECIAL_EXPANDED_OBJECT; a_objects: SB_OBJECTS;
		a_schema: SB_SCHEMA; a_file: SB_INPUT_FILE; a_unresolved: DS_ARRAYED_LIST [SB_UNRESOLVED_ADDRESS])
			-- Read items of `a_special_object' from `a_file'.
			-- Store unresolved addresses in `a_unresolved'.
		require
			a_special_object_not_void: a_special_object /= Void
			a_objects_not_void: a_objects /= Void
			a_schema_not_void: a_schema /= Void
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
			a_unresolved_not_void: a_unresolved /= Void
		local
			i, nb: INTEGER
			l_class: SB_CLASS
			l_flags: NATURAL_32
			l_type: SB_TYPE
		do
			l_class := a_special_object.type.storable_class
			l_class.set_instance_count (l_class.instance_count + 1)
				-- Read flags.
			a_file.read_natural_32
			l_flags := a_file.last_natural_32
			a_special_object.set_subobject_flags (l_flags)
			l_type := read_object_type (l_flags, a_schema, a_file)
				-- Read subobjects.
			if l_type /= Void then
				a_special_object.set_subobject_type (l_type)
				nb := a_special_object.count - 1
				from i := 0 until i > nb loop
					read_subobject (i.to_natural_64, l_flags, l_type, a_special_object, i, a_objects, a_schema, a_file, a_unresolved)
					i := i + 1
				end
			end
		end

	read_special_elem_size (a_special_object: SB_SPECIAL_OBJECT; a_file: SB_INPUT_FILE)
			-- Read 'elem_size' of `a_special_object' from `a_file'.
		require
			a_special_object_not_void: a_special_object /= Void
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		deferred
		end

	read_special_capacity (a_special_object: SB_SPECIAL_OBJECT; a_file: SB_INPUT_FILE)
			-- Read 'capacity' of `a_special_object' from `a_file'.
		require
			a_special_object_not_void: a_special_object /= Void
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		deferred
		end

	read_tuple_object (a_tuple_object: SB_TUPLE_OBJECT; a_objects: SB_OBJECTS; a_schema: SB_SCHEMA;
		a_file: SB_INPUT_FILE; a_unresolved: DS_ARRAYED_LIST [SB_UNRESOLVED_ADDRESS])
			-- Read items of `a_tuple_object' from `a_file'.
			-- Store unresolved addresses in `a_unresolved'.
		require
			a_tuple_object_not_void: a_tuple_object /= Void
			a_objects_not_void: a_objects /= Void
			a_schema_not_void: a_schema /= Void
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
			a_unresolved_not_void: a_unresolved /= Void
		deferred
		end

	read_tuple_elem_size (a_tuple_object: SB_TUPLE_OBJECT; a_file: SB_INPUT_FILE)
			-- Read 'elem_size' of `a_tuple_object' from `a_file'.
		require
			a_tuple_object_not_void: a_tuple_object /= Void
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		deferred
		end

	read_tuple_capacity (a_tuple_object: SB_TUPLE_OBJECT; a_file: SB_INPUT_FILE)
			-- Read 'capacity' of `a_tuple_object' from `a_file'.
		require
			a_tuple_object_not_void: a_tuple_object /= Void
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		deferred
		end

feature {NONE} -- Object type input

	resolved_object_type (a_type_list: SB_TYPE_LIST): detachable SB_TYPE
			-- Type corresponding to the "flat" list of types in `a_type_list';
			-- Void if an error occurred
		require
			a_type_list_not_void: a_type_list /= Void
			a_type_list_not_empty: not a_type_list.is_empty
			no_unknown_type: not a_type_list.has_unknown
		local
			i, nb: INTEGER
			l_type: SB_TYPE
		do
			nb := a_type_list.count
			type_list_index.put (1)
			Result := resolved_object_subtype (a_type_list, type_list_index)
			i := type_list_index.item
			if i <= 0 then
				-- Error already reported.
			elseif i /= nb + 1 then
				if Result /= Void then
					l_type := Result
				else
					l_type := a_type_list.first
				end
				error_handler.report_error_message ("Invalid number of generic parameters in object type: " + l_type.name)
			end
		end

	resolved_object_subtype (a_type_list: SB_TYPE_LIST; an_index: DS_CELL [INTEGER]): detachable SB_TYPE
			-- Type corresponding to the "flat" list of types in `a_type_list'
			-- starting at index `an_index'; Void if an error occurred
		require
			a_type_list_not_void: a_type_list /= Void
			a_type_list_not_empty: not a_type_list.is_empty
			no_unknown_type: not a_type_list.has_unknown
			an_index_not_void: an_index /= Void
			an_index_large_enough: an_index.item >= 1
			an_index_small_enough: an_index.item <= a_type_list.count
		local
			l_type: SB_TYPE
			l_class: SB_CLASS
			l_class_type: SB_CLASS_TYPE
			l_tuple_type: SB_TUPLE_TYPE
			l_class_type_derivations: DS_ARRAYED_LIST [SB_CLASS_TYPE]
			l_tuple_type_derivations: DS_ARRAYED_LIST [SB_TUPLE_TYPE]
			l_actuals: SB_TYPE_LIST
			l_is_attached: BOOLEAN
			l_is_detachable: BOOLEAN
			i, nb: INTEGER
			j, nb2: INTEGER
			k, nb3: INTEGER
		do
			i := an_index.item
			nb := a_type_list.count
			l_type := a_type_list.item (i)
			if attached {SB_CLASS_TYPE} l_type as l_class_type1 then
				l_class_type := l_class_type1
				l_class := l_class_type.storable_class
				l_is_attached := l_class_type.is_attached
				l_is_detachable := l_class_type.is_detachable
				nb2 := l_class.formal_parameters.count
				if nb2 = 0 then
					if l_is_attached then
						Result := l_class.attached_class_type_template
					elseif l_is_detachable then
						Result := l_class.detachable_class_type_template
					else
						Result := l_class.class_type_template
					end
					i := i + 1
					an_index.put (i)
				else
					l_class_type_derivations := l_class.class_type_derivations
					if l_class_type_derivations /= Void then
						nb3 := l_class_type_derivations.count
						from k := 1 until k > nb3 loop
							l_class_type := l_class_type_derivations.item (k)
							an_index.put (i)
							if object_subtype_matched (l_class_type, a_type_list, an_index)  then
								Result := l_class_type
								i := an_index.item
								k := nb3 + 1 -- Jump out of the loop.
							else
								k := k + 1
							end
						end
					end
					if Result = Void then
						i := i + 1
						create l_class_type.make (l_class)
						l_class_type.set_attached (l_is_attached)
						l_class_type.set_detachable (l_is_detachable)
						create l_actuals.make_with_capacity (nb2)
						l_class_type.set_actual_parameters (l_actuals)
						Result := l_class_type
						from j := 1 until j > nb2 loop
							if i <= 0 then
									-- Error already reported.
								Result := Void
								j := nb2 + 1 -- Jump out of the loop.
							elseif i > nb then
								error_handler.report_error_message ("Invalid number of generic parameters in class subtype of object type: " + l_class_type.name)
								Result := Void
								i := -1
								j := nb2 + 1 -- Jump out of the loop.
							else
								an_index.put (i)
								l_type := resolved_object_subtype (a_type_list, an_index)
								i := an_index.item
								if l_type /= Void then
									l_actuals.put_last (l_type)
								end
								j := j + 1
							end
						end
						if Result /= Void then
							l_class.add_class_type_derivation (l_class_type)
						end
					end
				end
			elseif attached {SB_TUPLE_TYPE} l_type as l_tuple_type1 then
				l_tuple_type := l_tuple_type1
				l_class := l_tuple_type.storable_class
				l_is_attached := l_tuple_type.is_attached
				l_is_detachable := l_tuple_type.is_detachable
				nb2 := l_tuple_type.actual_parameters_count
				if nb2 = 0 then
					if l_is_attached then
						Result := l_class.attached_tuple_type_template (0)
					elseif l_is_detachable then
						Result := l_class.detachable_tuple_type_template (0)
					else
						Result := l_class.tuple_type_template (0)
					end
					i := i + 1
					an_index.put (i)
				else
					l_tuple_type_derivations := l_class.tuple_type_derivations
					if l_tuple_type_derivations /= Void then
						nb3 := l_tuple_type_derivations.count
						from k := 1 until k > nb3 loop
							l_tuple_type := l_tuple_type_derivations.item (k)
							an_index.put (i)
							if object_subtype_matched (l_tuple_type, a_type_list, an_index)  then
								Result := l_tuple_type
								i := an_index.item
								k := nb3 + 1 -- Jump out of the loop.
							else
								k := k + 1
							end
						end
					end
					if Result = Void then
						i := i + 1
						create l_tuple_type.make (l_class, nb2)
						l_tuple_type.set_attached (l_is_attached)
						l_tuple_type.set_detachable (l_is_detachable)
						create l_actuals.make_with_capacity (nb2)
						l_tuple_type.set_actual_parameters (l_actuals)
						Result := l_tuple_type
						from j := 1 until j > nb2 loop
							if i <= 0 then
									-- Error already reported.
								Result := Void
								j := nb2 + 1 -- Jump out of the loop.
							elseif i > nb then
								error_handler.report_error_message ("Invalid number of generic parameters in class subtype of object type: " + l_tuple_type.name)
								Result := Void
								i := -1
								j := nb2 + 1 -- Jump out of the loop.
							else
								an_index.put (i)
								l_type := resolved_object_subtype (a_type_list, an_index)
								i := an_index.item
								if l_type /= Void then
									l_actuals.put_last (l_type)
								end
								j := j + 1
							end
						end
						if Result /= Void then
							l_class.add_tuple_type_derivation (l_tuple_type)
						end
					end
				end
			else
				Result := l_type
				i := i + 1
				an_index.put (i)
			end
			an_index.put (i)
		end

	object_subtype_matched (a_type: SB_TYPE; a_type_list: SB_TYPE_LIST; an_index: DS_CELL [INTEGER]): BOOLEAN
			-- Does "flat" version of a type match with the types in
			-- `a_type_list' starting at index `an_index'?
		require
			a_type_not_void: a_type /= Void
			a_type_list_not_void: a_type_list /= Void
			an_index_not_void: an_index /= Void
			an_index_large_enough: an_index.item >= 1
			an_index_small_enough: an_index.item <= a_type_list.count
		local
			l_actuals: SB_TYPE_LIST
			i, nb: INTEGER
			j, nb2: INTEGER
		do
			i := an_index.item
			nb := a_type_list.count
			if attached {SB_CLASS_TYPE} a_type as l_class_type1 then
				if not attached {SB_CLASS_TYPE} a_type_list.item (i) as l_class_type2 then
					Result := False
				elseif l_class_type1.storable_class /= l_class_type2.storable_class then
					Result := False
				elseif l_class_type1.is_attached /= l_class_type2.is_attached then
					Result := False
				elseif l_class_type1.is_detachable /= l_class_type2.is_detachable then
					Result := False
				else
					i := i + 1
					l_actuals := l_class_type1.actual_parameters
					from
						j := 1
						nb2 := l_actuals.count
						Result := True
					until
						j > nb2 or not Result
					loop
						if i > nb then
							Result := False
						else
							an_index.put (i)
							Result := object_subtype_matched (l_actuals.item (j), a_type_list, an_index)
							i := an_index.item
						end
						j := j + 1
					end
				end
			elseif attached {SB_TUPLE_TYPE} a_type as l_tuple_type1 then
				if not attached {SB_TUPLE_TYPE} a_type_list.item (i) as l_tuple_type2 then
					Result := False
				elseif l_tuple_type1.actual_parameters_count /= l_tuple_type2.actual_parameters_count then
					Result := False
				elseif l_tuple_type1.is_attached /= l_tuple_type2.is_attached then
					Result := False
				elseif l_tuple_type1.is_detachable /= l_tuple_type2.is_detachable then
					Result := False
				else
					i := i + 1
					l_actuals := l_tuple_type1.actual_parameters
					from
						j := 1
						nb2 := l_actuals.count
						Result := True
					until
						j > nb2 or not Result
					loop
						if i > nb then
							Result := False
						else
							an_index.put (i)
							Result := object_subtype_matched (l_actuals.item (j), a_type_list, an_index)
							i := an_index.item
						end
						j := j + 1
					end
				end
			elseif a_type = a_type_list.item (i) then
				i := i + 1
				Result := True
			elseif a_type.is_none and then a_type_list.item (i).is_none then
				i := i + 1
				Result := True
			end
			an_index.put (i)
		end

	type_list: SB_TYPE_LIST
			-- Shared type list

	type_list_index: DS_CELL [INTEGER]
			-- Shared index

feature {NONE} -- Constants

	Sk_formal: NATURAL_32
			-- Code for formal parameters
		deferred
		end

invariant

	type_list_not_void: type_list /= Void
	type_list_index_not_void: type_list_index /= Void

end
