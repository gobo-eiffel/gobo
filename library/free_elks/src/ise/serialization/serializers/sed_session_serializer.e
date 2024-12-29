note
	description: "[
		Encoding of arbitrary objects graphs within a session of a same program.
		
		Some routines are explicitely frozen, not because we do not want them to be redefined
		but if they are frozen, it saves us having to look at all possible descendants whenever
		we do a change.
		]"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date: 2017-03-28 12:36:24 +0000 (Tue, 28 Mar 2017) $"
	revision: "$Revision: 100064 $"

class
	SED_SESSION_SERIALIZER

inherit
	SED_UTILITIES

create
	make

feature {NONE} -- Initialization

	make (a_serializer: SED_READER_WRITER)
			-- Initialize current instance
		require
			a_serializer_not_void: a_serializer /= Void
			a_serializer_ready: a_serializer.is_ready_for_writing
		do
			create reflector
				-- Create an empty instance of `reflected_object' using `reflector' to satisfy
				-- the creation procedure. We will use `set_object' to update with the appropriate
				-- object.
			create reflected_object.make (reflector)
			create object_indexes.make (1)
			traversable := breadth_first_traversable
			serializer := a_serializer
			set_version ({SED_VERSIONS}.version_7_3)
		ensure
			serializer_set: serializer = a_serializer
		end

feature -- Access

	root_object: detachable ANY
			-- Root object of object graph
		do
			Result := traversable.root_object
		end

	serializer: SED_READER_WRITER
			-- Serializer used to encode data

feature -- Status report

	is_traversing_mode_set: BOOLEAN
			-- Is traversing mode set?
		do
			Result := traversable /= Void
		end

	is_root_object_set: BOOLEAN
			-- Is root object of object graph set?

feature -- Element change

	set_breadth_first_traversing_mode
			-- Change graph traversing to breadth first.
		do
			traversable := breadth_first_traversable
		ensure
			traversing_mode_set: is_traversing_mode_set
			breadth_first_mode: attached {OBJECT_GRAPH_BREADTH_FIRST_TRAVERSABLE} traversable
		end

	set_depth_first_traversing_mode
			-- Change graph traversing to depth first.
		do
			traversable := depth_first_traversable
		ensure
			traversing_mode_set: is_traversing_mode_set
			depth_first_mode: attached {OBJECT_GRAPH_DEPTH_FIRST_TRAVERSABLE} traversable
		end

	set_root_object (an_object: like root_object)
			-- Make 'an_object' the root_object.
		require
			an_object_not_void: an_object /= Void
			traversing_mode_set: is_traversing_mode_set
		do
			traversable.set_root_object (an_object)
			is_root_object_set := True
		ensure
			root_object_set: root_object = an_object and is_root_object_set
			root_object_identity: root_object = traversable.root_object
		end

	set_serializer (a_serializer: like serializer)
			-- Set `serializer' with `a_serializer'.
		require
			a_serializer_not_void: a_serializer /= Void
			a_serializer_ready: a_serializer.is_ready_for_writing
		do
			serializer := a_serializer
		ensure
			serializer_set: serializer = a_serializer
		end

feature -- Basic operations

	frozen encode
			-- Encode object graph starting with the root object.
		require
			traversing_mode_set: is_traversing_mode_set
			root_object_set: is_root_object_set
		local
			l_mem: detachable MEMORY
			l_is_collecting: BOOLEAN
			l_list_count: NATURAL_32
		do
			if not {PLATFORM}.is_dotnet then
				create l_mem
				l_is_collecting := l_mem.collecting
				l_mem.collection_off
			end

				-- We ignore transient attributes for storing.
			traversable.set_is_skip_transient (True)
			traversable.set_is_skip_copy_semantics_reference (True)
			traversable.traverse
			if attached traversable.visited_objects as l_list and then attached traversable.visited_types as l_type_table then
					-- Get some results of the traversal
				has_reference_with_copy_semantics := traversable.has_reference_with_copy_semantics

				l_list_count := l_list.count.to_natural_32

				if l_list.count > object_indexes.capacity then
					create object_indexes.make (l_list_count)
				end

					-- Write number of objects we are storing
				serializer.write_compressed_natural_32 (l_list_count)

					-- Write header of encoding
				write_header (l_list, l_type_table)

					-- Write objects
				encode_objects (l_list)
			end

			traversable.wipe_out
			object_indexes.wipe_out

			if l_mem /= Void and then l_is_collecting then
				l_mem.collection_on
			end
		end

feature {NONE} -- Implementation: Access

	reflector: REFLECTOR
			-- Facilities to inspect.

	reflected_object: REFLECTED_REFERENCE_OBJECT
			-- Facility to inspect object.

	traversable: OBJECT_GRAPH_TRAVERSABLE
			-- Object used for traversing object graph

	object_indexes: SED_OBJECTS_TABLE
			-- Mapping between object and their associated index.

	breadth_first_traversable: OBJECT_GRAPH_BREADTH_FIRST_TRAVERSABLE
			-- Return an instance of OBJECT_GRAPH_BREADTH_FIRST_TRAVERSABLE.
		once
			Result := create {OBJECT_GRAPH_BREADTH_FIRST_TRAVERSABLE}
		end

	depth_first_traversable: OBJECT_GRAPH_DEPTH_FIRST_TRAVERSABLE
			-- Return an instance of OBJECT_GRAPH_DEPTH_FIRST_TRAVERSABLE.
		once
			Result := create {OBJECT_GRAPH_DEPTH_FIRST_TRAVERSABLE}
		end

	version: NATURAL_32
			-- Internal version of the format (See SED_VERSIONS for possible values).

feature {NONE} -- Implementation: Setting

	set_version (v: like version)
			-- Set `version' with `v'.
			--| No contracts because it can be redefined in descendants to not do anything.
		do
			version := v
		end

feature {NONE} -- Status report

	is_store_settings_enabled: BOOLEAN
			-- Are settings stored?
			-- By default not for SED_INDEPENDENT_SERIALIZER.
		do
			Result := True
		end

	has_reference_with_copy_semantics: BOOLEAN
			-- Does serialized data have some reference with copy semantics?
			-- If none, we optimize the serialization of references by not emitting
			-- a boolean switch each time we refer to an object.

feature {NONE} -- Implementation

	write_header (a_list: ARRAYED_LIST [separate ANY]; a_type_table: HASH_TABLE [INTEGER, INTEGER])
			-- Operation performed before `encoding_objects'.
		require
			a_list_not_void: a_list /= Void
			a_list_not_empty: not a_list.is_empty
		do
			write_settings
			write_object_table (a_list)
		end

	frozen write_settings
		do
				-- Write the version of storable used to create it.
				-- This is useful for versioning of formats upon retrieval to
				-- quickly detect incompatibilities.	
				--| Note:
				--| Because versioning was added after the initial release of SED, in order
				--| to not break existing storables, SED_INDEPENDENT_DESERIALIZER does not support
				--| the reading of a version by redefining `is_store_settings_enabled' accordingly.
			if is_store_settings_enabled then
				serializer.write_compressed_natural_32 (version)
					-- Store whether or not we have some reference with copy semantics.
				serializer.write_boolean (has_reference_with_copy_semantics)
			end
		end

	frozen write_object_table (a_list: ARRAYED_LIST [separate ANY])
			-- Write mapping between object's reference ID in `a_list' with
			-- all the necessary information necessary to recreate it at a
			-- later time.
		require
			a_list_not_void: a_list /= Void
			a_list_not_empty: not a_list.is_empty
		local
			l_reflected_object: like reflected_object
			l_ser: like serializer
			l_object_indexes: like object_indexes
			i, nb: INTEGER
			l_obj: separate ANY
			l_area: SPECIAL [separate ANY]
		do
			l_ser := serializer
				-- To preserve backward compatibility of storable using the `is_for_fast_retrieval' setting
				-- we always write `True' to mark data with information that shows we have a mapping
				-- between reference IDs and objects.
			l_ser.write_boolean (True)
			l_reflected_object := reflected_object
			l_object_indexes := object_indexes

			from
				l_area := a_list.area
				i := 0
				nb := a_list.count
			until
				i = nb
			loop
				l_obj := l_area.item (i)
				l_reflected_object.set_object (l_obj)
				i := i + 1

					-- Write object dtype.
				l_ser.write_compressed_natural_32 (l_reflected_object.dynamic_type.to_natural_32)

					-- Write object reference ID.
				l_ser.write_compressed_natural_32 (l_object_indexes.index (l_obj))

					-- Write object flags, then data.
				if l_reflected_object.is_special then
						-- Write special flag.
					l_ser.write_natural_8 (is_special_flag)

						-- Get the abstract element type of the SPECIAL and write it.
					l_ser.write_compressed_integer_32 (
						abstract_type (l_reflected_object.generic_dynamic_type (1)))

						-- Write number of elements in SPECIAL
					if attached {ABSTRACT_SPECIAL} l_obj as l_abstract_spec then
						l_ser.write_compressed_integer_32 (l_abstract_spec.capacity)
					else
						check
							l_abstract_spec_attached: False
						end
					end

				elseif l_reflected_object.is_tuple then
					l_ser.write_natural_8 (is_tuple_flag)
				else
					l_ser.write_natural_8 (0)
				end
			end
		end

	frozen encode_objects (a_list: ARRAYED_LIST [separate ANY])
			-- Encode all objects referenced in `a_list'.
		require
			a_list_not_void: a_list /= Void
			a_list_not_empty: not a_list.is_empty
		local
			l_reflected_object: like reflected_object
			l_ser: like serializer
			l_object_indexes: like object_indexes
			l_obj: separate ANY
			i, nb: INTEGER
			l_area: SPECIAL [separate ANY]
			l_obj_index: NATURAL_32
		do
			l_reflected_object := reflected_object
			l_ser := serializer
			l_object_indexes := object_indexes
			from
				l_area := a_list.area
				i := 0
				nb := a_list.count
			until
				i = nb
			loop
				l_obj := l_area.item (i)
				l_reflected_object.set_object (l_obj)
				i := i + 1

					-- Write object reference ID.
				l_obj_index := l_object_indexes.index (l_obj)
				l_ser.write_compressed_natural_32 (l_obj_index)
					-- Index should be incremented by one and follow the order in the object list.
				check l_obj_index = i.as_natural_32 end

					-- Write object flags if in slow retrieval mode, then data.
				if l_reflected_object.is_special then
						-- Get the abstract element type of the SPECIAL.
					encode_special (l_obj, abstract_type (l_reflected_object.generic_dynamic_type (1)))
				elseif l_reflected_object.is_tuple then
					if attached {TUPLE} l_obj as l_tuple then
						encode_tuple_object (l_tuple)
					else
						check
							l_tuple_attached: False
						end
					end
				else
					encode_normal_object (l_reflected_object)
				end
			end
		end

	frozen encode_reference (an_object: detachable separate ANY)
			-- Encode reference to `an_object'.
		do
			if an_object /= Void then
				serializer.write_compressed_natural_32 (object_indexes.index (an_object))
			else
				serializer.write_compressed_natural_32 (0)
			end
		end

	frozen encode_normal_object (a_reflected_object: REFLECTED_OBJECT)
			-- Encode normal object `a_reflected_object'.
		local
			i, nb: INTEGER
			l_ser: like serializer
			l_exp: REFLECTED_COPY_SEMANTICS_OBJECT
		do
			from
				l_ser := serializer
				i := 1
				nb := a_reflected_object.field_count + 1
			until
				i = nb
			loop
				if not a_reflected_object.is_field_transient (i) then
					inspect a_reflected_object.field_type (i)
					when {REFLECTOR_CONSTANTS}.boolean_type then
						l_ser.write_boolean (a_reflected_object.boolean_field (i))

					when {REFLECTOR_CONSTANTS}.character_8_type then
						l_ser.write_character_8 (a_reflected_object.character_8_field (i))
					when {REFLECTOR_CONSTANTS}.character_32_type then
						l_ser.write_character_32 (a_reflected_object.character_32_field (i))

					when {REFLECTOR_CONSTANTS}.natural_8_type then
						l_ser.write_natural_8 (a_reflected_object.natural_8_field (i))
					when {REFLECTOR_CONSTANTS}.natural_16_type then
						l_ser.write_natural_16 (a_reflected_object.natural_16_field (i))
					when {REFLECTOR_CONSTANTS}.natural_32_type then
						l_ser.write_natural_32 (a_reflected_object.natural_32_field (i))
					when {REFLECTOR_CONSTANTS}.natural_64_type then
						l_ser.write_natural_64 (a_reflected_object.natural_64_field (i))

					when {REFLECTOR_CONSTANTS}.integer_8_type then
						l_ser.write_integer_8 (a_reflected_object.integer_8_field (i))
					when {REFLECTOR_CONSTANTS}.integer_16_type then
						l_ser.write_integer_16 (a_reflected_object.integer_16_field (i))
					when {REFLECTOR_CONSTANTS}.integer_32_type then
						l_ser.write_integer_32 (a_reflected_object.integer_32_field (i))
					when {REFLECTOR_CONSTANTS}.integer_64_type then
						l_ser.write_integer_64 (a_reflected_object.integer_64_field (i))

					when {REFLECTOR_CONSTANTS}.real_32_type then
						l_ser.write_real_32 (a_reflected_object.real_32_field (i))
					when {REFLECTOR_CONSTANTS}.real_64_type then
						l_ser.write_real_64 (a_reflected_object.real_64_field (i))

					when {REFLECTOR_CONSTANTS}.pointer_type then
						l_ser.write_pointer (a_reflected_object.pointer_field (i))

					when {REFLECTOR_CONSTANTS}.reference_type then
						if has_reference_with_copy_semantics then
							if a_reflected_object.is_copy_semantics_field (i) then
									-- Mark that it is a reference with copy semantics.
								l_ser.write_boolean (True)
									-- Provide the dynamic type for that reference.
								l_exp := a_reflected_object.copy_semantics_field (i)
									-- We encode the object as if it was an expanded one.
									-- To ensure retrieval in case of a mismatch, we store the dynamic type too.
								l_ser.write_compressed_integer_32 (l_exp.dynamic_type)
								encode_normal_object (l_exp)
							else
								l_ser.write_boolean (False)
								encode_reference (a_reflected_object.reference_field (i))
							end
						else
							encode_reference (a_reflected_object.reference_field (i))
						end

					when {REFLECTOR_CONSTANTS}.expanded_type then
							-- To ensure retrieval in case of a mismatch, we store the dynamic type too.
						l_ser.write_compressed_integer_32 (a_reflected_object.dynamic_type)
						encode_normal_object (a_reflected_object.expanded_field (i))

					else
						check
							False
						end
					end
				end
				i := i + 1
			end
		end

	frozen encode_tuple_object (a_tuple: TUPLE)
			-- Encode a TUPLE object.
		require
			a_tuple_not_void: a_tuple /= Void
		local
			i, nb: INTEGER
			l_code: NATURAL_8
			l_ser: like serializer
		do
			from
				l_ser := serializer
				i := 1
				nb := a_tuple.count + 1
			until
				i = nb
			loop
				l_code := a_tuple.item_code (i)
				l_ser.write_natural_8 (l_code)
				inspect l_code
				when {TUPLE}.boolean_code then l_ser.write_boolean (a_tuple.boolean_item (i))

				when {TUPLE}.character_8_code then l_ser.write_character_8 (a_tuple.character_8_item (i))
				when {TUPLE}.character_32_code then l_ser.write_character_32 (a_tuple.character_32_item (i))

				when {TUPLE}.natural_8_code then l_ser.write_natural_8 (a_tuple.natural_8_item (i))
				when {TUPLE}.natural_16_code then l_ser.write_natural_16 (a_tuple.natural_16_item (i))
				when {TUPLE}.natural_32_code then l_ser.write_natural_32 (a_tuple.natural_32_item (i))
				when {TUPLE}.natural_64_code then l_ser.write_natural_64 (a_tuple.natural_64_item (i))

				when {TUPLE}.integer_8_code then l_ser.write_integer_8 (a_tuple.integer_8_item (i))
				when {TUPLE}.integer_16_code then l_ser.write_integer_16 (a_tuple.integer_16_item (i))
				when {TUPLE}.integer_32_code then l_ser.write_integer_32 (a_tuple.integer_32_item (i))
				when {TUPLE}.integer_64_code then l_ser.write_integer_64 (a_tuple.integer_64_item (i))

				when {TUPLE}.real_32_code then l_ser.write_real_32 (a_tuple.real_32_item (i))
				when {TUPLE}.real_64_code then l_ser.write_real_64 (a_tuple.real_64_item (i))

				when {TUPLE}.pointer_code then l_ser.write_pointer (a_tuple.pointer_item (i))

				when {TUPLE}.reference_code then encode_reference (a_tuple.reference_item (i))

				else
					check
						False
					end
				end
				i := i + 1
			end
		end

	frozen encode_special (an_object: separate ANY; a_item_type: INTEGER)
			-- Encode an object which is a special object.
		require
			an_object_not_void: an_object /= Void
			an_object_is_special: attached {separate SPECIAL [detachable ANY]} an_object
			a_item_type_non_negative: a_item_type >= 0
		do
			inspect a_item_type
			when {REFLECTOR_CONSTANTS}.boolean_type then
				if attached {SPECIAL [BOOLEAN]} an_object as l_spec_boolean then
					encode_special_boolean (l_spec_boolean)
				else
					check l_spec_boolean_not_void: False end
				end

			when {REFLECTOR_CONSTANTS}.character_8_type then
				if attached {SPECIAL [CHARACTER_8]} an_object as l_spec_character_8 then
					encode_special_character_8 (l_spec_character_8)
				else
					check l_spec_character_8_not_void: False end
				end

			when {REFLECTOR_CONSTANTS}.character_32_type, {REFLECTOR_CONSTANTS}.natural_32_type then
				if attached {SPECIAL [CHARACTER_32]} an_object as l_spec_character_32 then
					encode_special_character_32 (l_spec_character_32)
				elseif attached {SPECIAL [NATURAL_32]} an_object as l_spec_natural_32 then
					encode_special_natural_32 (l_spec_natural_32)
				else
					check l_spec_natural_32_not_void: False end
				end

			when {REFLECTOR_CONSTANTS}.natural_8_type then
				if attached {SPECIAL [NATURAL_8]} an_object as l_spec_natural_8 then
					encode_special_natural_8 (l_spec_natural_8)
				else
					check l_spec_natural_8_not_void: False end
				end

			when {REFLECTOR_CONSTANTS}.natural_16_type then
				if attached {SPECIAL [NATURAL_16]} an_object as l_spec_natural_16 then
					encode_special_natural_16 (l_spec_natural_16)
				else
					check l_spec_natural_16_not_void: False end
				end

			when {REFLECTOR_CONSTANTS}.natural_64_type then
				if attached {SPECIAL [NATURAL_64]} an_object as l_spec_natural_64 then
					encode_special_natural_64 (l_spec_natural_64)
				else
					check l_spec_natural_64_not_void: False end
				end

			when {REFLECTOR_CONSTANTS}.integer_8_type then
				if attached {SPECIAL [INTEGER_8]} an_object as l_spec_integer_8 then
					encode_special_integer_8 (l_spec_integer_8)
				else
					check l_spec_integer_8_not_void: False end
				end

			when {REFLECTOR_CONSTANTS}.integer_16_type then
				if attached {SPECIAL [INTEGER_16]} an_object as l_spec_integer_16 then
					encode_special_integer_16 (l_spec_integer_16)
				else
					check l_spec_integer_16_not_void: False end
				end

			when {REFLECTOR_CONSTANTS}.integer_32_type then
				if attached {SPECIAL [INTEGER]} an_object as l_spec_integer_32 then
					encode_special_integer_32 (l_spec_integer_32)
				else
					check l_spec_integer_32_not_void: False end
				end

			when {REFLECTOR_CONSTANTS}.integer_64_type then
				if attached {SPECIAL [INTEGER_64]} an_object as l_spec_integer_64 then
					encode_special_integer_64 (l_spec_integer_64)
				else
					check l_spec_integer_64_not_void: False end
				end

			when {REFLECTOR_CONSTANTS}.real_32_type then
				if attached {SPECIAL [REAL_32]} an_object as l_spec_real_32 then
					encode_special_real_32 (l_spec_real_32)
				else
					check l_spec_real_32_not_void: False end
				end

			when {REFLECTOR_CONSTANTS}.real_64_type then
				if attached {SPECIAL [REAL_64]} an_object as l_spec_real_64 then
					encode_special_real_64 (l_spec_real_64)
				else
					check l_spec_real_64_not_void: False end
				end

			when {REFLECTOR_CONSTANTS}.pointer_type then
				if attached {SPECIAL [POINTER]} an_object as l_spec_pointer then
					encode_special_pointer (l_spec_pointer)
				else
					check l_spec_pointer_not_void: False end
				end

			else
				check
					a_item_type_valid: a_item_type = {REFLECTOR_CONSTANTS}.reference_type
				end
				if attached {SPECIAL [detachable ANY]} an_object as l_spec_any then
					encode_special_reference (l_spec_any)
				else
					check l_spec_any_not_void: False end
				end
			end
		end

	frozen encode_special_boolean (a_spec: SPECIAL [BOOLEAN])
			-- Encode `a_spec'.
		require
			a_spec_not_void: a_spec /= Void
		local
			i, nb: INTEGER
			l_ser: like serializer
		do
			from
				nb := a_spec.count
				l_ser := serializer
				l_ser.write_compressed_integer_32 (nb)
			until
				i = nb
			loop
				l_ser.write_boolean (a_spec.item (i))
				i := i + 1
			end
		end

	frozen encode_special_character_8 (a_spec: SPECIAL [CHARACTER_8])
			-- Encode `a_spec'.
		require
			a_spec_not_void: a_spec /= Void
		local
			i, nb: INTEGER
			l_ser: like serializer
		do
			from
				nb := a_spec.count
				l_ser := serializer
				l_ser.write_compressed_integer_32 (nb)
			until
				i = nb
			loop
				l_ser.write_character_8 (a_spec.item (i))
				i := i + 1
			end
		end

	frozen encode_special_character_32 (a_spec: SPECIAL [CHARACTER_32])
			-- Encode `a_spec'.
		require
			a_spec_not_void: a_spec /= Void
		local
			i, nb: INTEGER
			l_ser: like serializer
		do
			from
				nb := a_spec.count
				l_ser := serializer
				l_ser.write_compressed_integer_32 (nb)
			until
				i = nb
			loop
				l_ser.write_character_32 (a_spec.item (i))
				i := i + 1
			end
		end

	frozen encode_special_natural_8 (a_spec: SPECIAL [NATURAL_8])
			-- Encode `a_spec'.
		require
			a_spec_not_void: a_spec /= Void
		local
			i, nb: INTEGER
			l_ser: like serializer
		do
			from
				nb := a_spec.count
				l_ser := serializer
				l_ser.write_compressed_integer_32 (nb)
			until
				i = nb
			loop
				l_ser.write_natural_8 (a_spec.item (i))
				i := i + 1
			end
		end

	frozen encode_special_natural_16 (a_spec: SPECIAL [NATURAL_16])
			-- Encode `a_spec'.
		require
			a_spec_not_void: a_spec /= Void
		local
			i, nb: INTEGER
			l_ser: like serializer
		do
			from
				nb := a_spec.count
				l_ser := serializer
				l_ser.write_compressed_integer_32 (nb)
			until
				i = nb
			loop
				l_ser.write_natural_16 (a_spec.item (i))
				i := i + 1
			end
		end

	frozen encode_special_natural_32 (a_spec: SPECIAL [NATURAL_32])
			-- Encode `a_spec'.
		require
			a_spec_not_void: a_spec /= Void
		local
			i, nb: INTEGER
			l_ser: like serializer
		do
			from
				nb := a_spec.count
				l_ser := serializer
				l_ser.write_compressed_integer_32 (nb)
			until
				i = nb
			loop
				l_ser.write_natural_32 (a_spec.item (i))
				i := i + 1
			end
		end

	frozen encode_special_natural_64 (a_spec: SPECIAL [NATURAL_64])
			-- Encode `a_spec'.
		require
			a_spec_not_void: a_spec /= Void
		local
			i, nb: INTEGER
			l_ser: like serializer
		do
			from
				nb := a_spec.count
				l_ser := serializer
				l_ser.write_compressed_integer_32 (nb)
			until
				i = nb
			loop
				l_ser.write_natural_64 (a_spec.item (i))
				i := i + 1
			end
		end

	frozen encode_special_integer_8 (a_spec: SPECIAL [INTEGER_8])
			-- Encode `a_spec'.
		require
			a_spec_not_void: a_spec /= Void
		local
			i, nb: INTEGER
			l_ser: like serializer
		do
			from
				nb := a_spec.count
				l_ser := serializer
				l_ser.write_compressed_integer_32 (nb)
			until
				i = nb
			loop
				l_ser.write_integer_8 (a_spec.item (i))
				i := i + 1
			end
		end

	frozen encode_special_integer_16 (a_spec: SPECIAL [INTEGER_16])
			-- Encode `a_spec'.
		require
			a_spec_not_void: a_spec /= Void
		local
			i, nb: INTEGER
			l_ser: like serializer
		do
			from
				nb := a_spec.count
				l_ser := serializer
				l_ser.write_compressed_integer_32 (nb)
			until
				i = nb
			loop
				l_ser.write_integer_16 (a_spec.item (i))
				i := i + 1
			end
		end

	frozen encode_special_integer_32 (a_spec: SPECIAL [INTEGER])
			-- Encode `a_spec'.
		require
			a_spec_not_void: a_spec /= Void
		local
			i, nb: INTEGER
			l_ser: like serializer
		do
			from
				nb := a_spec.count
				l_ser := serializer
				l_ser.write_compressed_integer_32 (nb)
			until
				i = nb
			loop
				l_ser.write_integer_32 (a_spec.item (i))
				i := i + 1
			end
		end

	frozen encode_special_integer_64 (a_spec: SPECIAL [INTEGER_64])
			-- Encode `a_spec'.
		require
			a_spec_not_void: a_spec /= Void
		local
			i, nb: INTEGER
			l_ser: like serializer
		do
			from
				nb := a_spec.count
				l_ser := serializer
				l_ser.write_compressed_integer_32 (nb)
			until
				i = nb
			loop
				l_ser.write_integer_64 (a_spec.item (i))
				i := i + 1
			end
		end

	frozen encode_special_real_32 (a_spec: SPECIAL [REAL_32])
			-- Encode `a_spec'.
		require
			a_spec_not_void: a_spec /= Void
		local
			i, nb: INTEGER
			l_ser: like serializer
		do
			from
				nb := a_spec.count
				l_ser := serializer
				l_ser.write_compressed_integer_32 (nb)
			until
				i = nb
			loop
				l_ser.write_real_32 (a_spec.item (i))
				i := i + 1
			end
		end

	frozen encode_special_real_64 (a_spec: SPECIAL [REAL_64])
			-- Encode `a_spec'.
		require
			a_spec_not_void: a_spec /= Void
		local
			i, nb: INTEGER
			l_ser: like serializer
		do
			from
				nb := a_spec.count
				l_ser := serializer
				l_ser.write_compressed_integer_32 (nb)
			until
				i = nb
			loop
				l_ser.write_real_64 (a_spec.item (i))
				i := i + 1
			end
		end

	frozen encode_special_pointer (a_spec: SPECIAL [POINTER])
			-- Encode `a_spec'.
		require
			a_spec_not_void: a_spec /= Void
		local
			i, nb: INTEGER
			l_ser: like serializer
		do
			from
				nb := a_spec.count
				l_ser := serializer
				l_ser.write_compressed_integer_32 (nb)
			until
				i = nb
			loop
				l_ser.write_pointer (a_spec.item (i))
				i := i + 1
			end
		end

	frozen encode_special_reference (a_spec: SPECIAL [detachable ANY])
			-- Encode `a_spec'.
		require
			a_spec_not_void: a_spec /= Void
		local
			i, nb: INTEGER
			l_reflected_object: like reflected_object
			l_exp: REFLECTED_COPY_SEMANTICS_OBJECT
			l_ser: like serializer
			l_has_copy_semantics: BOOLEAN
		do
			l_ser := serializer
			nb := a_spec.count
			l_ser.write_compressed_integer_32 (nb)

			if version >= {SED_VERSIONS}.version_7_3 then
					-- Check if there are any references with copy semantics
				from
					l_reflected_object := reflected_object
					l_reflected_object.set_object (a_spec)
				until
					i = nb
				loop
					if l_reflected_object.is_special_copy_semantics_item (i) then
						l_has_copy_semantics := True
							-- Jump out of loop
						i := nb - 1
					end
					i := i + 1
				end

				l_ser.write_boolean (l_has_copy_semantics)
				if l_has_copy_semantics then
					from
						i := 0
					until
						i = nb
					loop
						if l_reflected_object.is_special_copy_semantics_item (i) then
								-- Mark that it is a reference with copy semantics.
							l_ser.write_boolean (True)
								-- Provide the dynamic type for that reference.
							l_exp := l_reflected_object.special_copy_semantics_item (i)
								-- We encode the object as if it was an expanded one.
								-- To ensure retrieval in case of a mismatch, we store the dynamic type too.
							l_ser.write_compressed_integer_32 (l_exp.dynamic_type)
							encode_normal_object (l_exp)
						else
							l_ser.write_boolean (False)
							encode_reference (a_spec.item (i))
						end
						i := i + 1
					end
				end
			end
			if not l_has_copy_semantics then
					-- More compact way to write a special of reference
					-- that contains no references with copy semantics.
				from
					i := 0
				until
					i = nb
				loop
					encode_reference (a_spec.item (i))
					i := i + 1
				end
			end
		end

invariant
	reflector_not_void: reflector /= Void
	reflected_object_not_void: reflected_object /= Void
	traversable_not_void: traversable /= Void
	serializer_not_void: serializer /= Void
	object_indexes_not_void: object_indexes /= Void

note
	library:	"EiffelBase: Library of reusable components for Eiffel."
	copyright:	"Copyright (c) 1984-2017, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end -- class SED_SESSION_SERIALIZER
