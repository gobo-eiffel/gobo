note

	description:

		"Eiffel Storable file readers using independent store format 6.6"

	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class SB_INDEPENDENT_STORE_6_6_READER

inherit

	SB_INDEPENDENT_STORE_READER

	SB_INDEPENDENT_STORE_6_6_CONSTANTS
		export {NONE} all end

create

	make

feature {NONE} -- Schema input

	read_storable_properties (a_schema: SB_SCHEMA; a_file: SB_INPUT_FILE)
			-- Read storable properties of `a_schema' from `a_file'.
		do
			a_file.read_unbuffered_character_8
			a_schema.set_storable_properties (a_file.last_character_8)
		end

	read_class_flags (a_file: SB_INPUT_FILE): NATURAL_32
			-- Read class's flags (about expandedness etc.) from `a_file'.
		do
			a_file.read_natural_32
			Result := a_file.last_natural_32
		end

	set_class_flags (a_class: SB_CLASS; a_flags: NATURAL_32)
			-- Set `a_flags' flags of `a_class'.
		do
			a_class.set_flags (a_flags)
		end

	read_storable_version (a_class: SB_CLASS; a_file: SB_INPUT_FILE)
			-- Read `a_class''s storable version from `a_file'.
		local
			i, nb: NATURAL_32
			l_storable_version: STRING
		do
				-- Read number of characters.
			a_file.read_natural_32
			nb := a_file.last_natural_32
			if nb > 0 then
					-- Read storable version characters.
				create l_storable_version.make (nb.as_integer_32)
				from i := 1 until i > nb loop
					a_file.read_character_8
					l_storable_version.append_character (a_file.last_character_8)
					i := i + 1
				end
				a_class.set_storable_version (l_storable_version)
			end
		end

	read_attribute (a_class: SB_CLASS; a_schema: SB_SCHEMA; a_file: SB_INPUT_FILE)
			-- Read an attribute from `a_file' and put it in `a_class'.
		local
			i, nb: INTEGER
			l_name: STRING
			l_other_class: SB_CLASS
			l_type_list: SB_TYPE_LIST
			l_type, l_subtype: SB_TYPE
			l_attribute: SB_ATTRIBUTE
			l_basic_type: NATURAL_8
			l_gen_type: INTEGER_16
			l_gen_nb: INTEGER_16
			l_class_type: SB_CLASS_TYPE
			l_tuple_type: SB_TUPLE_TYPE
			l_none_type: SB_NONE_TYPE
			l_classes: ARRAY [detachable SB_CLASS]
			l_max_index: INTEGER
			l_formal_index: INTEGER_16
			l_formal_type: SB_FORMAL_TYPE
			l_is_attached: BOOLEAN
			l_is_detachable: BOOLEAN
			l_is_frozen: BOOLEAN
			l_is_first_type: BOOLEAN
		do
				-- Read attribute name.
				-- Read number of characters.
			a_file.read_integer_16
			nb := a_file.last_integer_16
			if nb <= 0 then
				error_handler.report_error_message ("Invalid number of character in name of attribute #" + (a_class.attributes.count + 1).out + " in class " + a_class.name + ": " + nb.out)
			else
					-- Read attribute name characters.
				create l_name.make (nb)
				from i := 1 until i > nb loop
					a_file.read_character_8
					l_name.append_character (a_file.last_character_8)
					i := i + 1
				end
					-- Read attribute type.
				l_classes := a_schema.classes
				l_max_index := a_schema.maximum_class_index
					-- Read attribute type.
					-- Read basic type.
				a_file.read_natural_8
				l_basic_type := a_file.last_natural_8
				inspect l_basic_type
				when Skh_bool then
					l_type := a_schema.boolean_type
						-- Read type ids and actual generic parameter ids.
						-- Read number of subtypes.
					a_file.read_integer_16
					nb := a_file.last_integer_16
					if nb /= 1 then
						l_type := Void
						error_handler.report_error_message ("Invalid number of subtypes for basic type of attribute `" + l_name + "' in class " +  a_class.name + ": " + nb.out)
					else
							-- Read subtypes.
							-- Read subtype class index.
						a_file.read_integer_16
						l_gen_type := a_file.last_integer_16
						if l_gen_type < 0 or l_gen_type > l_max_index then
							l_type := Void
							error_handler.report_error_message ("Invalid class index in subtype #" + i.out + " of attribute `" + l_name + "' in class " + a_class.name+ ": " + l_gen_type.out)
						else
							l_other_class := l_classes.item (l_gen_type)
							if l_other_class = Void then
								create l_other_class.make_unknown (l_gen_type)
								l_classes.put (l_other_class, l_gen_type)
							end
							l_other_class.set_expanded (True)
							l_other_class.set_declared_expanded (True)
							l_other_class.set_boolean (True)
							a_schema.boolean_type.set_storable_class (l_other_class)
						end
					end
				when Skh_char then
					l_type := a_schema.character_8_type
						-- Read type ids and actual generic parameter ids.
						-- Read number of subtypes.
					a_file.read_integer_16
					nb := a_file.last_integer_16
					if nb /= 1 then
						l_type := Void
						error_handler.report_error_message ("Invalid number of subtypes for basic type of attribute `" + l_name + "' in class " +  a_class.name + ": " + nb.out)
					else
							-- Read subtypes.
							-- Read subtype class index.
						a_file.read_integer_16
						l_gen_type := a_file.last_integer_16
						if l_gen_type < 0 or l_gen_type > l_max_index then
							l_type := Void
							error_handler.report_error_message ("Invalid class index in subtype #" + i.out + " of attribute `" + l_name + "' in class " + a_class.name+ ": " + l_gen_type.out)
						else
							l_other_class := l_classes.item (l_gen_type)
							if l_other_class = Void then
								create l_other_class.make_unknown (l_gen_type)
								l_classes.put (l_other_class, l_gen_type)
							end
							l_other_class.set_expanded (True)
							l_other_class.set_declared_expanded (True)
							l_other_class.set_character_8 (True)
							a_schema.character_8_type.set_storable_class (l_other_class)
						end
					end
				when Skh_int8 then
					l_type := a_schema.integer_8_type
						-- Read type ids and actual generic parameter ids.
						-- Read number of subtypes.
					a_file.read_integer_16
					nb := a_file.last_integer_16
					if nb /= 1 then
						l_type := Void
						error_handler.report_error_message ("Invalid number of subtypes for basic type of attribute `" + l_name + "' in class " +  a_class.name + ": " + nb.out)
					else
							-- Read subtypes.
							-- Read subtype class index.
						a_file.read_integer_16
						l_gen_type := a_file.last_integer_16
						if l_gen_type < 0 or l_gen_type > l_max_index then
							l_type := Void
							error_handler.report_error_message ("Invalid class index in subtype #" + i.out + " of attribute `" + l_name + "' in class " + a_class.name+ ": " + l_gen_type.out)
						else
							l_other_class := l_classes.item (l_gen_type)
							if l_other_class = Void then
								create l_other_class.make_unknown (l_gen_type)
								l_classes.put (l_other_class, l_gen_type)
							end
							l_other_class.set_expanded (True)
							l_other_class.set_declared_expanded (True)
							l_other_class.set_integer_8 (True)
							a_schema.integer_8_type.set_storable_class (l_other_class)
						end
					end
				when Skh_int32 then
					l_type := a_schema.integer_32_type
						-- Read type ids and actual generic parameter ids.
						-- Read number of subtypes.
					a_file.read_integer_16
					nb := a_file.last_integer_16
					if nb /= 1 then
						l_type := Void
						error_handler.report_error_message ("Invalid number of subtypes for basic type of attribute `" + l_name + "' in class " +  a_class.name + ": " + nb.out)
					else
							-- Read subtypes.
							-- Read subtype class index.
						a_file.read_integer_16
						l_gen_type := a_file.last_integer_16
						if l_gen_type < 0 or l_gen_type > l_max_index then
							l_type := Void
							error_handler.report_error_message ("Invalid class index in subtype #" + i.out + " of attribute `" + l_name + "' in class " + a_class.name+ ": " + l_gen_type.out)
						else
							l_other_class := l_classes.item (l_gen_type)
							if l_other_class = Void then
								create l_other_class.make_unknown (l_gen_type)
								l_classes.put (l_other_class, l_gen_type)
							end
							l_other_class.set_expanded (True)
							l_other_class.set_declared_expanded (True)
							l_other_class.set_integer_32 (True)
							a_schema.integer_32_type.set_storable_class (l_other_class)
						end
					end
				when Skh_int16 then
					l_type := a_schema.integer_16_type
						-- Read type ids and actual generic parameter ids.
						-- Read number of subtypes.
					a_file.read_integer_16
					nb := a_file.last_integer_16
					if nb /= 1 then
						l_type := Void
						error_handler.report_error_message ("Invalid number of subtypes for basic type of attribute `" + l_name + "' in class " +  a_class.name + ": " + nb.out)
					else
							-- Read subtypes.
							-- Read subtype class index.
						a_file.read_integer_16
						l_gen_type := a_file.last_integer_16
						if l_gen_type < 0 or l_gen_type > l_max_index then
							l_type := Void
							error_handler.report_error_message ("Invalid class index in subtype #" + i.out + " of attribute `" + l_name + "' in class " + a_class.name+ ": " + l_gen_type.out)
						else
							l_other_class := l_classes.item (l_gen_type)
							if l_other_class = Void then
								create l_other_class.make_unknown (l_gen_type)
								l_classes.put (l_other_class, l_gen_type)
							end
							l_other_class.set_expanded (True)
							l_other_class.set_declared_expanded (True)
							l_other_class.set_integer_16 (True)
							a_schema.integer_16_type.set_storable_class (l_other_class)
						end
					end
				when Skh_real_32 then
					l_type := a_schema.real_32_type
						-- Read type ids and actual generic parameter ids.
						-- Read number of subtypes.
					a_file.read_integer_16
					nb := a_file.last_integer_16
					if nb /= 1 then
						l_type := Void
						error_handler.report_error_message ("Invalid number of subtypes for basic type of attribute `" + l_name + "' in class " +  a_class.name + ": " + nb.out)
					else
							-- Read subtypes.
							-- Read subtype class index.
						a_file.read_integer_16
						l_gen_type := a_file.last_integer_16
						if l_gen_type < 0 or l_gen_type > l_max_index then
							l_type := Void
							error_handler.report_error_message ("Invalid class index in subtype #" + i.out + " of attribute `" + l_name + "' in class " + a_class.name+ ": " + l_gen_type.out)
						else
							l_other_class := l_classes.item (l_gen_type)
							if l_other_class = Void then
								create l_other_class.make_unknown (l_gen_type)
								l_classes.put (l_other_class, l_gen_type)
							end
							l_other_class.set_expanded (True)
							l_other_class.set_declared_expanded (True)
							l_other_class.set_real_32 (True)
							a_schema.real_32_type.set_storable_class (l_other_class)
						end
					end
				when Skh_wchar then
					l_type := a_schema.character_32_type
						-- Read type ids and actual generic parameter ids.
						-- Read number of subtypes.
					a_file.read_integer_16
					nb := a_file.last_integer_16
					if nb /= 1 then
						l_type := Void
						error_handler.report_error_message ("Invalid number of subtypes for basic type of attribute `" + l_name + "' in class " +  a_class.name + ": " + nb.out)
					else
							-- Read subtypes.
							-- Read subtype class index.
						a_file.read_integer_16
						l_gen_type := a_file.last_integer_16
						if l_gen_type < 0 or l_gen_type > l_max_index then
							l_type := Void
							error_handler.report_error_message ("Invalid class index in subtype #" + i.out + " of attribute `" + l_name + "' in class " + a_class.name+ ": " + l_gen_type.out)
						else
							l_other_class := l_classes.item (l_gen_type)
							if l_other_class = Void then
								create l_other_class.make_unknown (l_gen_type)
								l_classes.put (l_other_class, l_gen_type)
							end
							l_other_class.set_expanded (True)
							l_other_class.set_declared_expanded (True)
							l_other_class.set_character_32 (True)
							a_schema.character_32_type.set_storable_class (l_other_class)
						end
					end
				when Skh_real_64 then
					l_type := a_schema.real_64_type
						-- Read type ids and actual generic parameter ids.
						-- Read number of subtypes.
					a_file.read_integer_16
					nb := a_file.last_integer_16
					if nb /= 1 then
						l_type := Void
						error_handler.report_error_message ("Invalid number of subtypes for basic type of attribute `" + l_name + "' in class " +  a_class.name + ": " + nb.out)
					else
							-- Read subtypes.
							-- Read subtype class index.
						a_file.read_integer_16
						l_gen_type := a_file.last_integer_16
						if l_gen_type < 0 or l_gen_type > l_max_index then
							l_type := Void
							error_handler.report_error_message ("Invalid class index in subtype #" + i.out + " of attribute `" + l_name + "' in class " + a_class.name+ ": " + l_gen_type.out)
						else
							l_other_class := l_classes.item (l_gen_type)
							if l_other_class = Void then
								create l_other_class.make_unknown (l_gen_type)
								l_classes.put (l_other_class, l_gen_type)
							end
							l_other_class.set_expanded (True)
							l_other_class.set_declared_expanded (True)
							l_other_class.set_real_64 (True)
							a_schema.real_64_type.set_storable_class (l_other_class)
						end
					end
				when Skh_int64 then
					l_type := a_schema.integer_64_type
						-- Read type ids and actual generic parameter ids.
						-- Read number of subtypes.
					a_file.read_integer_16
					nb := a_file.last_integer_16
					if nb /= 1 then
						l_type := Void
						error_handler.report_error_message ("Invalid number of subtypes for basic type of attribute `" + l_name + "' in class " +  a_class.name + ": " + nb.out)
					else
							-- Read subtypes.
							-- Read subtype class index.
						a_file.read_integer_16
						l_gen_type := a_file.last_integer_16
						if l_gen_type < 0 or l_gen_type > l_max_index then
							l_type := Void
							error_handler.report_error_message ("Invalid class index in subtype #" + i.out + " of attribute `" + l_name + "' in class " + a_class.name+ ": " + l_gen_type.out)
						else
							l_other_class := l_classes.item (l_gen_type)
							if l_other_class = Void then
								create l_other_class.make_unknown (l_gen_type)
								l_classes.put (l_other_class, l_gen_type)
							end
							l_other_class.set_expanded (True)
							l_other_class.set_declared_expanded (True)
							l_other_class.set_integer_64 (True)
							a_schema.integer_64_type.set_storable_class (l_other_class)
						end
					end
				when Skh_uint8 then
					l_type := a_schema.natural_8_type
						-- Read type ids and actual generic parameter ids.
						-- Read number of subtypes.
					a_file.read_integer_16
					nb := a_file.last_integer_16
					if nb /= 1 then
						l_type := Void
						error_handler.report_error_message ("Invalid number of subtypes for basic type of attribute `" + l_name + "' in class " +  a_class.name + ": " + nb.out)
					else
							-- Read subtypes.
							-- Read subtype class index.
						a_file.read_integer_16
						l_gen_type := a_file.last_integer_16
						if l_gen_type < 0 or l_gen_type > l_max_index then
							l_type := Void
							error_handler.report_error_message ("Invalid class index in subtype #" + i.out + " of attribute `" + l_name + "' in class " + a_class.name+ ": " + l_gen_type.out)
						else
							l_other_class := l_classes.item (l_gen_type)
							if l_other_class = Void then
								create l_other_class.make_unknown (l_gen_type)
								l_classes.put (l_other_class, l_gen_type)
							end
							l_other_class.set_expanded (True)
							l_other_class.set_declared_expanded (True)
							l_other_class.set_natural_8 (True)
							a_schema.natural_8_type.set_storable_class (l_other_class)
						end
					end
				when Skh_uint16 then
					l_type := a_schema.natural_16_type
						-- Read type ids and actual generic parameter ids.
						-- Read number of subtypes.
					a_file.read_integer_16
					nb := a_file.last_integer_16
					if nb /= 1 then
						l_type := Void
						error_handler.report_error_message ("Invalid number of subtypes for basic type of attribute `" + l_name + "' in class " +  a_class.name + ": " + nb.out)
					else
							-- Read subtypes.
							-- Read subtype class index.
						a_file.read_integer_16
						l_gen_type := a_file.last_integer_16
						if l_gen_type < 0 or l_gen_type > l_max_index then
							l_type := Void
							error_handler.report_error_message ("Invalid class index in subtype #" + i.out + " of attribute `" + l_name + "' in class " + a_class.name+ ": " + l_gen_type.out)
						else
							l_other_class := l_classes.item (l_gen_type)
							if l_other_class = Void then
								create l_other_class.make_unknown (l_gen_type)
								l_classes.put (l_other_class, l_gen_type)
							end
							l_other_class.set_expanded (True)
							l_other_class.set_declared_expanded (True)
							l_other_class.set_natural_16 (True)
							a_schema.natural_16_type.set_storable_class (l_other_class)
						end
					end
				when Skh_uint32 then
					l_type := a_schema.natural_32_type
						-- Read type ids and actual generic parameter ids.
						-- Read number of subtypes.
					a_file.read_integer_16
					nb := a_file.last_integer_16
					if nb /= 1 then
						l_type := Void
						error_handler.report_error_message ("Invalid number of subtypes for basic type of attribute `" + l_name + "' in class " +  a_class.name + ": " + nb.out)
					else
							-- Read subtypes.
							-- Read subtype class index.
						a_file.read_integer_16
						l_gen_type := a_file.last_integer_16
						if l_gen_type < 0 or l_gen_type > l_max_index then
							l_type := Void
							error_handler.report_error_message ("Invalid class index in subtype #" + i.out + " of attribute `" + l_name + "' in class " + a_class.name+ ": " + l_gen_type.out)
						else
							l_other_class := l_classes.item (l_gen_type)
							if l_other_class = Void then
								create l_other_class.make_unknown (l_gen_type)
								l_classes.put (l_other_class, l_gen_type)
							end
							l_other_class.set_expanded (True)
							l_other_class.set_declared_expanded (True)
							l_other_class.set_natural_32 (True)
							a_schema.natural_32_type.set_storable_class (l_other_class)
						end
					end
				when Skh_uint64 then
					l_type := a_schema.natural_64_type
						-- Read type ids and actual generic parameter ids.
						-- Read number of subtypes.
					a_file.read_integer_16
					nb := a_file.last_integer_16
					if nb /= 1 then
						l_type := Void
						error_handler.report_error_message ("Invalid number of subtypes for basic type of attribute `" + l_name + "' in class " +  a_class.name + ": " + nb.out)
					else
							-- Read subtypes.
							-- Read subtype class index.
						a_file.read_integer_16
						l_gen_type := a_file.last_integer_16
						if l_gen_type < 0 or l_gen_type > l_max_index then
							l_type := Void
							error_handler.report_error_message ("Invalid class index in subtype #" + i.out + " of attribute `" + l_name + "' in class " + a_class.name+ ": " + l_gen_type.out)
						else
							l_other_class := l_classes.item (l_gen_type)
							if l_other_class = Void then
								create l_other_class.make_unknown (l_gen_type)
								l_classes.put (l_other_class, l_gen_type)
							end
							l_other_class.set_expanded (True)
							l_other_class.set_declared_expanded (True)
							l_other_class.set_natural_64 (True)
							a_schema.natural_64_type.set_storable_class (l_other_class)
						end
					end
				when Skh_pointer then
					l_type := a_schema.pointer_type
						-- Read type ids and actual generic parameter ids.
						-- Read number of subtypes.
					a_file.read_integer_16
					nb := a_file.last_integer_16
					if nb /= 1 then
						l_type := Void
						error_handler.report_error_message ("Invalid number of subtypes for basic type of attribute `" + l_name + "' in class " +  a_class.name + ": " + nb.out)
					else
							-- Read subtypes.
							-- Read subtype class index.
						a_file.read_integer_16
						l_gen_type := a_file.last_integer_16
						if l_gen_type < 0 or l_gen_type > l_max_index then
							l_type := Void
							error_handler.report_error_message ("Invalid class index in subtype #" + i.out + " of attribute `" + l_name + "' in class " + a_class.name+ ": " + l_gen_type.out)
						else
							l_other_class := l_classes.item (l_gen_type)
							if l_other_class = Void then
								create l_other_class.make_unknown (l_gen_type)
								l_classes.put (l_other_class, l_gen_type)
							end
							l_other_class.set_expanded (True)
							l_other_class.set_declared_expanded (True)
							l_other_class.set_pointer (True)
							a_schema.pointer_type.set_storable_class (l_other_class)
						end
					end
				when Skh_void then
					l_type := a_schema.none_type
						-- Read type ids and actual generic parameter ids.
						-- Read number of subtypes.
					a_file.read_integer_16
					nb := a_file.last_integer_16
					if nb /= 1 then
						l_type := Void
						error_handler.report_error_message ("Invalid number of subtypes for basic type of attribute `" + l_name + "' in class " +  a_class.name + ": " + nb.out)
					else
							-- Read subtypes.
							-- Read subtype class index.
						a_file.read_integer_16
						l_gen_type := a_file.last_integer_16
						if l_gen_type < 0 or l_gen_type > l_max_index then
							l_type := Void
							error_handler.report_error_message ("Invalid class index in subtype #" + i.out + " of attribute `" + l_name + "' in class " + a_class.name+ ": " + l_gen_type.out)
						else
							l_other_class := l_classes.item (l_gen_type)
							if l_other_class = Void then
								create l_other_class.make_unknown (l_gen_type)
								l_classes.put (l_other_class, l_gen_type)
							end
							l_other_class.set_none (True)
						end
					end
				when Skh_ref, Skh_exp then
						-- Read type ids and actual generic parameter ids.
						-- Read number of subtypes.
					a_file.read_integer_16
					nb := a_file.last_integer_16
					if nb < 1 then
						error_handler.report_error_message ("Invalid number of subtypes for type of attribute `" + l_name + "' in class " +  a_class.name + ": " + nb.out)
					else
							-- Read subtypes.
							-- Read subtype class index.
						if nb > 1 then
							create l_type_list.make_with_capacity (nb - 1)
						else
							l_type_list := Void
						end
						l_is_first_type := True
						from i := 1 until i > nb loop
								-- Read type annotations.
							from
								l_is_attached := False
								l_is_detachable := False
								l_is_frozen := False
								a_file.read_integer_16
								l_gen_type := a_file.last_integer_16
							until
								i > nb or not has_annotation_type (l_gen_type)
							loop
								l_is_attached := is_attached_type (l_gen_type)
								l_is_detachable := is_detachable_type (l_gen_type)
								l_is_frozen := is_frozen_type (l_gen_type)
								i := i + 1
								if i > nb then
									error_handler.report_error_message ("Missing type after type annotation in type of attribute `" + l_name + "' in class " + a_class.name)
								else
									a_file.read_integer_16
									l_gen_type := a_file.last_integer_16
								end
							end
								-- Read actual type now.
							if i > nb then
								-- Error already reported.
							elseif l_gen_type = Attr_tuple_type then
									-- Encoded as: 0xFFF9 n Dtype_tuple ...
									-- Where:
									--    Attr_tuple_type = 0xFFF9
									--    n: number of actual generic parameters
									--    Dtype_tuple: index of class TUPLE in schema
								if i + 2 > nb then
									l_type := Void
									error_handler.report_error_message ("Invalid TUPLE in type of attribute `" + l_name + "' in class " + a_class.name)
									i := nb + 1 -- Jump out of the loop.
								else
										-- Read number of actual generic parameters.
									a_file.read_integer_16
									l_gen_nb := a_file.last_integer_16
									if l_gen_nb < 0 then
										l_type := Void
										error_handler.report_error_message ("Invalid number of actual generic parameters in Tuple type in type of attribute `" + l_name + "' in class " + a_class.name + ": " + l_gen_nb.out)
										i := nb + 1 -- Jump out of the loop.
									else
											-- Read TUPLE index in schema.
										a_file.read_integer_16
										l_gen_type := a_file.last_integer_16
										if l_gen_type < 0 or l_gen_type > l_max_index then
											l_type := Void
											error_handler.report_error_message ("Invalid tuple class index in subtype #" + i.out + " of attribute `" + l_name + "' in class " + a_class.name + ": " + l_gen_type.out)
											i := nb + 1 -- Jump out of the loop.
										else
											l_other_class := l_classes.item (l_gen_type)
											if l_other_class = Void then
												create l_other_class.make_unknown (l_gen_type)
												l_classes.put (l_other_class, l_gen_type)
											end
											if l_is_frozen then
												l_other_class.set_frozen (True)
											end
											create l_tuple_type.make (l_other_class, l_gen_nb)
											l_tuple_type.set_attached (l_is_attached)
											l_tuple_type.set_detachable (l_is_detachable)
											if l_is_first_type then
												l_type := l_tuple_type
												if l_type_list /= Void then
													l_tuple_type.set_actual_parameters (l_type_list)
												end
											else
												check l_type_list_not_void: l_type_list /= Void then
													l_subtype := l_tuple_type
													l_type_list.put_last (l_subtype)
												end
											end
											i := i + 2
										end
									end
								end
							elseif l_gen_type = Attr_none_type then
								if l_is_attached then
									l_none_type := a_schema.attached_none_type
								elseif l_is_detachable then
									l_none_type := a_schema.detachable_none_type
								else
									l_none_type := a_schema.none_type
								end
								if l_is_first_type then
									if i = nb then
										l_type := l_none_type
									else
										l_type := Void
										error_handler.report_error_message ("Type NONE cannot be generic in attribute `" + l_name + "' in class " + a_class.name)
										i := nb + 1 -- Jump out of the loop.
									end
								else
									check l_type_list_not_void: l_type_list /= Void then
										l_subtype := l_none_type
										l_type_list.put_last (l_subtype)
									end
								end
							elseif l_gen_type = Attr_formal_type then
									-- Subtype formal generic parameter.
								if i + 1 > nb then
									l_type := Void
									error_handler.report_error_message ("Invalid formal generic in type of attribute `" + l_name + "' in class " + a_class.name)
									i := nb + 1 -- Jump out of the loop.
								else
										-- Read formal generic index.
									a_file.read_integer_16
									l_formal_index := a_file.last_integer_16
									create l_formal_type.make (l_formal_index)
									l_formal_type.set_attached (l_is_attached)
									l_formal_type.set_detachable (l_is_detachable)
									if l_is_first_type then
										if i + 1 /= nb then
											l_type := Void
											error_handler.report_error_message ("Formal generic parameters cannot have actual generic parameters, in subtype #" + i.out + " of attribute `" + l_name + "' in class " + a_class.name)
											i := nb + 1 -- Jump out of the loop.
										else
											l_type := l_formal_type
											if l_basic_type = Skh_exp then
												l_formal_type.set_expanded (True)
											end
										end
									else
										check l_type_list_not_void: l_type_list /= Void then
											l_subtype := l_formal_type
											l_type_list.put_last (l_subtype)
										end
									end
									i := i + 1
								end
							else
								if l_gen_type < 0 or l_gen_type > l_max_index then
									l_type := Void
									error_handler.report_error_message ("Invalid class index in subtype #" + i.out + " of attribute `" + l_name + "' in class " + a_class.name + ": " + l_gen_type.out)
									i := nb + 1 -- Jump out of the loop.
								else
									l_other_class := l_classes.item (l_gen_type)
									if l_other_class = Void then
										create l_other_class.make_unknown (l_gen_type)
										l_classes.put (l_other_class, l_gen_type)
									end
									if l_is_frozen then
										l_other_class.set_frozen (True)
									end
									if l_is_attached then
										l_class_type := l_other_class.attached_class_type
									elseif l_is_detachable then
										l_class_type := l_other_class.detachable_class_type
									else
										l_class_type := l_other_class.class_type
									end
									if l_is_first_type then
										if l_basic_type = Skh_exp then
											l_other_class.set_expanded (True)
										end
										l_type := l_class_type
										if l_type_list /= Void then
											l_class_type.set_actual_parameters (l_type_list)
										end
									else
										check l_type_list_not_void: l_type_list /= Void then
											l_subtype := l_class_type
											l_type_list.put_last (l_subtype)
										end
									end
								end
							end
							l_is_first_type := False
							i := i + 1
						end
					end
				else
					l_type := Void
					error_handler.report_error_message ("Attribute type either invalid or not supported: 0x" + l_basic_type.to_hex_string)
				end
				if l_type /= Void then
					create l_attribute.make (l_name, l_type)
					a_class.attributes.put_last (l_attribute)
				end
			end
		end

feature {NONE} -- Object input

	read_object_type (a_flags: NATURAL_32; a_schema: SB_SCHEMA; a_file: SB_INPUT_FILE): detachable SB_TYPE
			-- Read object type from `a_file', using `a_schema'.
		local
			i, nb: NATURAL_32
			l_class_id: INTEGER
			l_class: SB_CLASS
			l_other_class: SB_CLASS
			l_type_list: SB_TYPE_LIST
			l_subtype: SB_TYPE
			l_type: SB_TYPE
			l_gen_type: INTEGER_32
			l_gen_nb: INTEGER_16
			l_classes: ARRAY [detachable SB_CLASS]
			l_max_index: INTEGER
			l_is_attached: BOOLEAN
			l_is_detachable: BOOLEAN
			l_is_frozen: BOOLEAN
		do
				-- Class id.
			l_class_id := (a_flags & Eo_type).as_integer_32
			l_max_index := a_schema.maximum_class_index
			if l_class_id < 0 or l_class_id > l_max_index then
				error_handler.report_error_message ("Invalid class id " + l_class_id.out)
			else
				l_classes := a_schema.classes
				l_class := l_classes.item (l_class_id)
				if l_class = Void then
					error_handler.report_error_message ("No class with class id " + l_class_id.out)
				else
						-- Read type ids and actual generic parameter ids.
						-- Read number of subtypes.
					a_file.read_natural_32
					nb := a_file.last_natural_32
					if nb < 1 then
						l_type := Void
						error_handler.report_error_message ("Invalid number of subtypes for object type: " + nb.out)
					elseif nb = 1 then
							-- The type is not encoded if nb=1.
						l_type := l_class.class_type_template
					else
							-- Read subtypes.
						l_type := Void
						l_type_list := type_list
						from i := 1 until i > nb loop
							check l_type_list_not_void: l_type_list /= Void then end
								-- Read type annotations.
							from
								l_is_attached := False
								l_is_detachable := False
								l_is_frozen := False
								a_file.read_integer_32
								l_gen_type := a_file.last_integer_32
							until
								i > nb or not has_annotation_type (l_gen_type.as_integer_16)
							loop
								l_is_attached := is_attached_type (l_gen_type.as_integer_16)
								l_is_detachable := is_detachable_type (l_gen_type.as_integer_16)
								l_is_frozen := is_frozen_type (l_gen_type.as_integer_16)
								i := i + 1
								if i > nb then
									error_handler.report_error_message ("Missing type after type annotation in subtype #" + i.out + " of object type")
								else
									a_file.read_integer_32
									l_gen_type := a_file.last_integer_32
								end
							end
								-- Read actual type now.
							if i > nb then
								-- Error already reported.
							elseif l_gen_type.as_integer_16 = Attr_tuple_type then
									-- Note that we needed to convert `l_gen_type' to an INTEGER_16
									-- above so that the reader could read both the independent_store_6.0
									-- and independent_store_6.2 or greater formats. They both use code 0xFFF9
									-- but the 6.0 uses it as INTEGER_16 and 6.2 (and greater) as NATURAL_32, which
									-- results as one being negative and the other positive.
								if l_gen_type > 0 and a_schema.storable_format = Independent_store_6_0 then
										-- The storable reader for the format 6.0 is able to read the
										-- format 6.2 (or greater). Here it has been detected that the storable file
										-- is using the format 6.2 (or greater), so we set `a_schema.storable_format'
										-- accordingly. Note that the 6.0 and 6.2 (or greater) formats share the
										-- same code in ISE's STORABLE. See indexing clause in
										-- SB_INDEPENDENT_STORE_6_2_WRITER for more detail.
									a_schema.set_storable_format (Independent_store_6_2)
								end
									-- Encoded as: 0xFFF9 n Dtype_tuple ...
									-- Where:
									--    Attr_tuple_type = 0xFFF9
									--    n: number of actual generic parameters
									--    Dtype_tuple: index of class TUPLE in schema
								if i + 2 > nb then
									l_type_list := Void
									error_handler.report_error_message ("Invalid TUPLE in subtype #" + i.out + " of object type")
									i := nb + 1 -- Jump out of the loop.
								else
										-- Read number of actual generic parameters.
									a_file.read_integer_32
									l_gen_nb := a_file.last_integer_32.to_integer_16
									if l_gen_nb < 0 then
										l_type_list := Void
										error_handler.report_error_message ("Invalid number of actual generic parameters in Tuple type in object type: " + l_gen_nb.out)
										i := nb + 1 -- Jump out of the loop.
									else
											-- Read TUPLE index in schema.
										a_file.read_integer_32
										l_gen_type := a_file.last_integer_32
										if l_gen_type < 0 or l_gen_type > l_max_index then
											l_type_list := Void
											error_handler.report_error_message ("Invalid tuple class index in subtype #" + i.out + " of object type: " + l_gen_type.out)
											i := nb + 1 -- Jump out of the loop.
										else
											l_other_class := l_classes.item (l_gen_type)
											if l_other_class = Void then
												l_type_list := Void
												error_handler.report_error_message ("Invalid Tuple subtype #" + i.out + " in object type: no class with class index " + l_gen_type.out)
												i := nb + 1 -- Jump out of the loop.
											else
												if l_is_frozen then
													l_other_class.set_frozen (True)
												end
												if l_is_attached then
													l_subtype := l_other_class.attached_tuple_type_template (l_gen_nb)
												elseif l_is_detachable then
													l_subtype := l_other_class.detachable_tuple_type_template (l_gen_nb)
												else
													l_subtype := l_other_class.tuple_type_template (l_gen_nb)
												end
												l_type_list.force_last (l_subtype)
											end
											i := i + 2
										end
									end
								end
							elseif l_gen_type.as_integer_16 = Attr_none_type then
									-- Note that we needed to convert `l_gen_type' to an INTEGER_16
									-- above so that the reader could read both the independent_store_6.0
									-- and independent_store_6.2 or greater formats. They both use code 0xFFFE
									-- but the 6.0 uses it as INTEGER_16 and 6.2 (and greater) as NATURAL_32, which
									-- results as one being negative and the other positive.
								if l_gen_type > 0 and a_schema.storable_format = Independent_store_6_0 then
										-- The storable reader for the format 6.0 is able to read the
										-- format 6.2 (or greater). Here it has been detected that the storable file
										-- is using the format 6.2 (or greater), so we set `a_schema.storable_format'
										-- accordingly. Note that the 6.0 and 6.2 (or greater) formats share the
										-- same code in ISE's STORABLE. See indexing clause in
										-- STORABLE_INDEPENDENT_STORE_6_2_WRITER for more detail.
									a_schema.set_storable_format (Independent_store_6_2)
								end
								if i = 1 then
									l_type_list := Void
									error_handler.report_error_message ("Objects cannot be of NONE type")
									i := nb + 1 -- Jump out of the loop.
								else
									if l_is_attached then
										l_subtype := a_schema.attached_none_type
									elseif l_is_detachable then
										l_subtype := a_schema.detachable_none_type
									else
										l_subtype := a_schema.none_type
									end
									l_type_list.force_last (l_subtype)
								end
							elseif l_gen_type.as_integer_16 = Attr_formal_type then
									-- Note that we needed to convert `l_gen_type' to an INTEGER_16
									-- above so that the reader could read both the independent_store_6.0
									-- and independent_store_6.2 or greater formats. They both use code 0xFFF8
									-- but the 6.0 uses it as INTEGER_16 and 6.2 (and greater) as NATURAL_32, which
									-- results as one being negative and the other positive.
								if l_gen_type > 0 and a_schema.storable_format = Independent_store_6_0 then
										-- The storable reader for the format 6.0 is able to read the
										-- format 6.2 (or greater). Here it has been detected that the storable file
										-- is using the format 6.2 (or greater), so we set `a_schema.storable_format'
										-- accordingly. Note that the 6.0 and 6.2 (or greater) formats share the
										-- same code in ISE's STORABLE. See indexing clause in
										-- SB_INDEPENDENT_STORE_6_2_WRITER for more detail.
									a_schema.set_storable_format (Independent_store_6_2)
								end
								l_type_list := Void
								error_handler.report_error_message ("Formal generic patemeter in subtype #" + i.out + " of object type is not supported")
								i := nb + 1 -- Jump out of the loop.
							else
								if l_gen_type < 0 or l_gen_type > l_max_index then
									l_type_list := Void
									error_handler.report_error_message ("Invalid class index " + l_gen_type.out + " in subtype #" + i.out + " of object type")
									i := nb + 1 -- Jump out of the loop.
								else
									l_other_class := l_classes.item (l_gen_type)
									if l_other_class = Void then
										l_type_list := Void
										error_handler.report_error_message ("Invalid subtype #" + i.out + " in object type: no class with class index " + l_gen_type.out)
										i := nb + 1 -- Jump out of the loop.
									else
										if l_is_frozen then
											l_other_class.set_frozen (True)
										end
										if l_is_attached then
											l_subtype := l_other_class.attached_class_type_template
										elseif l_is_detachable then
											l_subtype := l_other_class.detachable_class_type_template
										else
											l_subtype := l_other_class.class_type_template
										end
										l_type_list.force_last (l_subtype)
									end
								end
							end
							i := i + 1
						end
						if l_type_list /= Void and then not l_type_list.is_empty then
							if l_type_list.has_unknown then
								error_handler.report_error_message ("Unknown object type: " + l_type_list.names)
								l_type := Void
							else
								l_type := resolved_object_type (l_type_list)
								if error_handler.has_error then
									l_type := Void
								end
							end
						end
						type_list.wipe_out
					end
				end
			end
			Result := l_type
		end

	read_special_elem_size (a_special_object: SB_SPECIAL_OBJECT; a_file: SB_INPUT_FILE)
			-- Read 'elem_size' of `a_special_object' from `a_file'.
		do
		end

	read_special_capacity (a_special_object: SB_SPECIAL_OBJECT; a_file: SB_INPUT_FILE)
			-- Read 'capacity' of `a_special_object' from `a_file'.
		local
			l_capacity: INTEGER_32
		do
				-- Read capacity of SPECIAL object.
			a_file.read_integer_32
			l_capacity := a_file.last_integer_32
			a_special_object.set_capacity (l_capacity)
		end

	read_tuple_object (a_tuple_object: SB_TUPLE_OBJECT; a_objects: SB_OBJECTS; a_schema: SB_SCHEMA;
		a_file: SB_INPUT_FILE; a_unresolved: DS_ARRAYED_LIST [SB_UNRESOLVED_ADDRESS])
			-- Read items of `a_tuple_object' from `a_file'.
			-- Store unresolved addresses in `a_unresolved'.
		local
			i, nb: INTEGER
			l_class: SB_CLASS
			l_type_code: NATURAL_8
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
			l_class := a_tuple_object.type.storable_class
			l_class.set_instance_count (l_class.instance_count + 1)
			read_tuple_object_comparison_subobject (a_tuple_object, a_objects, a_schema, a_file)
			l_objects := a_objects.objects
			nb := a_tuple_object.count
			from i := 1 until i > nb loop
				a_file.read_natural_8
				l_type_code := a_file.last_natural_8
				inspect l_type_code
				when Eif_boolean_code then
					a_file.read_character_8
					l_boolean_value := (a_file.last_character_8 /= '%U')
					l_boolean_objects := a_objects.boolean_objects
					l_boolean_objects.search (l_boolean_value)
					if l_boolean_objects.found then
						l_boolean_object := l_boolean_objects.found_item
					else
						create l_boolean_object.make (a_schema.boolean_type, l_boolean_value)
						l_boolean_objects.force_last (l_boolean_object, l_boolean_value)
					end
					a_tuple_object.put (l_boolean_object, i)
				when Eif_character_code then
					a_file.read_character_8
					l_character_8_value := a_file.last_character_8
					l_character_8_objects := a_objects.character_8_objects
					l_character_8_objects.search (l_character_8_value)
					if l_character_8_objects.found then
						l_character_8_object := l_character_8_objects.found_item
					else
						create l_character_8_object.make (a_schema.character_8_type, l_character_8_value)
						l_character_8_objects.force_last (l_character_8_object, l_character_8_value)
					end
					a_tuple_object.put (l_character_8_object, i)
				when Eif_double_code then
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
							create l_real_64_object.make (a_schema.real_64_type, l_real_64_value)
							l_real_64_objects.force_last (l_real_64_object, l_real_64_value)
						end
					end
					a_tuple_object.put (l_real_64_object, i)
				when Eif_real_code then
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
							create l_real_32_object.make (a_schema.real_32_type, l_real_32_value)
							l_real_32_objects.force_last (l_real_32_object, l_real_32_value)
						end
					end
					a_tuple_object.put (l_real_32_object, i)
				when Eif_integer_32_code then
					a_file.read_integer_32
					l_integer_32_value := a_file.last_integer_32
					l_integer_32_objects := a_objects.integer_32_objects
					l_integer_32_objects.search (l_integer_32_value)
					if l_integer_32_objects.found then
						l_integer_32_object := l_integer_32_objects.found_item
					else
						create l_integer_32_object.make (a_schema.integer_32_type, l_integer_32_value)
						l_integer_32_objects.force_last (l_integer_32_object, l_integer_32_value)
					end
					a_tuple_object.put (l_integer_32_object, i)
				when Eif_pointer_code then
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
							create l_pointer_object.make (a_schema.pointer_type, l_pointer_value)
							l_pointer_objects.force_last (l_pointer_object, l_pointer_value)
						end
						a_tuple_object.put (l_pointer_object, i)
					when 8 then
							-- Address on 8 bytes.
						a_file.read_natural_64
						l_pointer_value := a_file.last_natural_64
						l_pointer_objects := a_objects.pointer_objects
						l_pointer_objects.search (l_pointer_value)
						if l_pointer_objects.found then
							l_pointer_object := l_pointer_objects.found_item
						else
							create l_pointer_object.make (a_schema.pointer_type, l_pointer_value)
							l_pointer_objects.force_last (l_pointer_object, l_pointer_value)
						end
						a_tuple_object.put (l_pointer_object, i)
					else
						error_handler.report_error_message ("Invalid number of bytes to encode address: " + a_file.last_integer_8.out)
						i := nb + 1 -- jump out of the loop.
					end
				when Eif_reference_code then
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
						i := nb + 1 -- jump out of the loop.
					end
					if l_address = 0 then
						a_tuple_object.put (Void, i)
					else
						l_objects.search (l_address)
						if l_objects.found then
							l_reference_object := l_objects.found_item
							l_reference_object.set_reference_count (l_reference_object.reference_count + 1)
							a_tuple_object.put (l_reference_object, i)
						else
							create l_unresolved.make (l_address, a_tuple_object, i)
							a_unresolved.force_last (l_unresolved)
						end
					end
				when Eif_integer_8_code then
					a_file.read_integer_8
					l_integer_8_value := a_file.last_integer_8
					l_integer_8_objects := a_objects.integer_8_objects
					l_integer_8_objects.search (l_integer_8_value)
					if l_integer_8_objects.found then
						l_integer_8_object := l_integer_8_objects.found_item
					else
						create l_integer_8_object.make (a_schema.integer_8_type, l_integer_8_value)
						l_integer_8_objects.force_last (l_integer_8_object, l_integer_8_value)
					end
					a_tuple_object.put (l_integer_8_object, i)
				when Eif_integer_16_code then
					a_file.read_integer_16
					l_integer_16_value := a_file.last_integer_16
					l_integer_16_objects := a_objects.integer_16_objects
					l_integer_16_objects.search (l_integer_16_value)
					if l_integer_16_objects.found then
						l_integer_16_object := l_integer_16_objects.found_item
					else
						create l_integer_16_object.make (a_schema.integer_16_type, l_integer_16_value)
						l_integer_16_objects.force_last (l_integer_16_object, l_integer_16_value)
					end
					a_tuple_object.put (l_integer_16_object, i)
				when Eif_integer_64_code then
					a_file.read_integer_64
					l_integer_64_value := a_file.last_integer_64
					l_integer_64_objects := a_objects.integer_64_objects
					l_integer_64_objects.search (l_integer_64_value)
					if l_integer_64_objects.found then
						l_integer_64_object := l_integer_64_objects.found_item
					else
						create l_integer_64_object.make (a_schema.integer_64_type, l_integer_64_value)
						l_integer_64_objects.force_last (l_integer_64_object, l_integer_64_value)
					end
					a_tuple_object.put (l_integer_64_object, i)
				when Eif_natural_8_code then
					a_file.read_natural_8
					l_natural_8_value := a_file.last_natural_8
					l_natural_8_objects := a_objects.natural_8_objects
					l_natural_8_objects.search (l_natural_8_value)
					if l_natural_8_objects.found then
						l_natural_8_object := l_natural_8_objects.found_item
					else
						create l_natural_8_object.make (a_schema.natural_8_type, l_natural_8_value)
						l_natural_8_objects.force_last (l_natural_8_object, l_natural_8_value)
					end
					a_tuple_object.put (l_natural_8_object, i)
				when Eif_natural_16_code then
					a_file.read_natural_16
					l_natural_16_value := a_file.last_natural_16
					l_natural_16_objects := a_objects.natural_16_objects
					l_natural_16_objects.search (l_natural_16_value)
					if l_natural_16_objects.found then
						l_natural_16_object := l_natural_16_objects.found_item
					else
						create l_natural_16_object.make (a_schema.natural_16_type, l_natural_16_value)
						l_natural_16_objects.force_last (l_natural_16_object, l_natural_16_value)
					end
					a_tuple_object.put (l_natural_16_object, i)
				when Eif_natural_32_code then
					a_file.read_natural_32
					l_natural_32_value := a_file.last_natural_32
					l_natural_32_objects := a_objects.natural_32_objects
					l_natural_32_objects.search (l_natural_32_value)
					if l_natural_32_objects.found then
						l_natural_32_object := l_natural_32_objects.found_item
					else
						create l_natural_32_object.make (a_schema.natural_32_type, l_natural_32_value)
						l_natural_32_objects.force_last (l_natural_32_object, l_natural_32_value)
					end
					a_tuple_object.put (l_natural_32_object, i)
				when Eif_natural_64_code then
					a_file.read_natural_64
					l_natural_64_value := a_file.last_natural_64
					l_natural_64_objects := a_objects.natural_64_objects
					l_natural_64_objects.search (l_natural_64_value)
					if l_natural_64_objects.found then
						l_natural_64_object := l_natural_64_objects.found_item
					else
						create l_natural_64_object.make (a_schema.natural_64_type, l_natural_64_value)
						l_natural_64_objects.force_last (l_natural_64_object, l_natural_64_value)
					end
					a_tuple_object.put (l_natural_64_object, i)
				when Eif_wide_char_code then
					a_file.read_natural_32
					l_character_32_value := a_file.last_natural_32
					l_character_32_objects := a_objects.character_32_objects
					l_character_32_objects.search (l_character_32_value)
					if l_character_32_objects.found then
						l_character_32_object := l_character_32_objects.found_item
					else
						create l_character_32_object.make (a_schema.character_32_type, l_character_32_value)
						l_character_32_objects.force_last (l_character_32_object, l_character_32_value)
					end
					a_tuple_object.put (l_character_32_object, i)
				else
					error_handler.report_error_message ("Invalid parameter type code in TUPLE object: " + l_type_code.out)
					i := nb + 1 -- Jump out of the loop.
				end
				i := i + 1
			end
		end

	read_tuple_object_comparison_subobject (a_tuple_object: SB_TUPLE_OBJECT; a_objects: SB_OBJECTS; a_schema: SB_SCHEMA; a_file: SB_INPUT_FILE)
			-- Read attribute 'object_comparison' of `a_tuple_object' from `a_file'.
		require
			a_tuple_object_not_void: a_tuple_object /= Void
			a_objects_not_void: a_objects /= Void
			a_schema_not_void: a_schema /= Void
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			l_type_code: NATURAL_8
			l_boolean_objects: DS_HASH_TABLE [SB_BOOLEAN_OBJECT, BOOLEAN]
			l_boolean_object: SB_BOOLEAN_OBJECT
			l_boolean_value: BOOLEAN
		do
			a_file.read_natural_8
			l_type_code := a_file.last_natural_8
			if l_type_code = Eif_boolean_code then
				a_file.read_character_8
				l_boolean_value := (a_file.last_character_8 /= '%U')
				l_boolean_objects := a_objects.boolean_objects
				l_boolean_objects.search (l_boolean_value)
				if l_boolean_objects.found then
					l_boolean_object := l_boolean_objects.found_item
				else
					create l_boolean_object.make (a_schema.boolean_type, l_boolean_value)
					l_boolean_objects.force_last (l_boolean_object, l_boolean_value)
				end
				a_tuple_object.set_object_comparison_attribute (l_boolean_object)
			else
				error_handler.report_error_message ("Invalid parameter type code for TUPLE's 'object_comparison'(BOOLEAN expected): " + l_type_code.out)
			end
		end

	read_tuple_elem_size (a_tuple_object: SB_TUPLE_OBJECT; a_file: SB_INPUT_FILE)
			-- Read 'elem_size' of `a_tuple_object' from `a_file'.
		do
		end

	read_tuple_capacity (a_tuple_object: SB_TUPLE_OBJECT; a_file: SB_INPUT_FILE)
			-- Read 'capacity' of `a_tuple_object' from `a_file'.
		local
			l_capacity: INTEGER_32
		do
				-- Read capacity of TUPLE object.
			a_file.read_integer_32
			l_capacity := a_file.last_integer_32
			a_tuple_object.set_capacity (l_capacity)
		end

end
