note
	description: "Decoding of arbitrary objects graphs within a session of a same program."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date: 2017-03-23 19:18:26 +0000 (Thu, 23 Mar 2017) $"
	revision: "$Revision: 100033 $"

class
	SED_SESSION_DESERIALIZER

inherit
	SED_UTILITIES

	EXCEPTION_MANAGER

create
	make

feature {NONE} -- Initialization

	make (a_deserializer: SED_READER_WRITER)
			-- Initialize current instance
		require
			a_deserializer_not_void: a_deserializer /= Void
			a_deserializer_ready: a_deserializer.is_ready_for_reading
		do
			create reflector
				-- Create an empty instance of `reflected_object' using `reflector' to satisfy
				-- the creation procedure. We will use `set_object' to update with the appropriate
				-- object.
			create reflected_object.make (reflector)
			create object_references.make_empty (0)
			deserializer := a_deserializer
		ensure
			deserializer_set: deserializer = a_deserializer
		end

feature -- Access

	deserializer: SED_READER_WRITER
			-- Serializer used to decode data

	last_decoded_object: detachable ANY
			-- Object decoded during last call to `decode'

feature -- Status report

	error: detachable SED_ERROR
			-- Last error encountered during retrieval
		obsolete
			"Use `errors' directly to find out errors encountered during retrieval. [2017-05-31]"
		do
			if attached errors as l_errors and then not l_errors.is_empty then
				Result := l_errors.last
			end
		end

	errors: detachable ARRAYED_LIST [SED_ERROR]

	has_error: BOOLEAN
			-- Did we encounter an error during retrieval?
		do
			Result := attached errors as l_errors and then not l_errors.is_empty
		end

feature -- Settings

	set_deserializer (a_deserializer: like deserializer)
			-- Set `deserializer' with `a_deserializer'.
		require
			a_deserializer_not_void: a_deserializer /= Void
			a_deserializer_ready: a_deserializer.is_ready_for_reading
		do
			deserializer := a_deserializer
		ensure
			deserializer_set: deserializer = a_deserializer
		end

feature -- Basic operations

	frozen decode (a_is_gc_enabled: BOOLEAN)
			-- Decode object graph stored in `deserializer'.
		local
			l_count: NATURAL_32
			l_mem: detachable like memory
			l_is_collecting: BOOLEAN
			retried: BOOLEAN
		do
			if not retried then
				reset_errors

					-- Disable GC as only new memory will be allocated.
				if not a_is_gc_enabled then
					l_mem := memory
					l_is_collecting := l_mem.collecting
					l_mem.collection_off
				end

					-- Read number of objects we are retrieving
				l_count := deserializer.read_compressed_natural_32
				create object_references.make_empty (l_count.to_integer_32 + 1)


					-- Read header of serialized data.
				read_header (l_count)

				if not has_error then
						-- Read data from `deserializer' in store it in `object_references'.
					decode_objects (l_count)
				end
			else
					-- An exception occurred, let's create an error so that the exception
					-- is not silenced.
				if attached last_exception as l_exception then
					add_error (error_factory.new_exception_error (l_exception))
				else
					add_error (error_factory.new_internal_error ("An Unknown exception occurred in `decode'."))
				end

				last_decoded_object := Void
			end
				-- Restore GC status
			if l_is_collecting and then l_mem /= Void then
				l_mem.collection_on
			end

				-- Clean data
			clear_internal_data
		rescue
			retried := True
			retry
		end

feature {NONE} -- Implementation: Access

	reflector: REFLECTOR
			-- Facilities to inspect.

	reflected_object: REFLECTED_REFERENCE_OBJECT
			-- Facilities to inspect objects.

	object_references: SPECIAL [ANY]
			-- Mapping between reference ID and the associated object.

	is_transient_retrieval_required: BOOLEAN
			-- Do we need to retrieve transient attribute with their default value?
			-- This is necessary for Session/Basic storing where we expect the same
			-- object layout.
		do
			Result := True
		end

	is_store_settings_enabled: BOOLEAN
			-- Are settings stored?
			-- By default not for SED_INDEPENDENT_DESERIALIZER.
		do
			Result := True
		end

	has_reference_with_copy_semantics: BOOLEAN
			-- Does retrieved data contain references with copy semantics?

	error_factory: SED_ERROR_FACTORY
			-- Once access to the error factory.
		once
			create Result
		ensure
			result_not_void: Result /= Void
		end

	version: NATURAL_32
			-- Internal version of the storable being retrieved (See SED_VERSIONS for possible values).

	dynamic_type_table: detachable SPECIAL [INTEGER]
			-- Mapping between old dynamic types and new ones.

	frozen new_dynamic_type_id (a_old_type_id: INTEGER): INTEGER
			-- Given `a_old_type_id', dynamic type id in stored system, retrieve dynamic
			-- type id in current system. Return -1 if not found.
		require
			a_old_type_id_non_negative: a_old_type_id >= 0
		do
				-- If `dynamic_type_table' was provided, use it.
			if attached dynamic_type_table as t then
				if a_old_type_id < t.count then
					Result := t.item (a_old_type_id)
				else
						-- Mapping was not found, most likely what we are retrieving has been corrupted
						-- since serialization ensures that this could not happen.
					Result := -1
				end
			else
				Result := a_old_type_id
			end
		ensure
			minus_one_of_non_negative: Result >= -1
		end

feature {NONE} -- Implementation: Settings

	set_error (a_error: SED_ERROR)
			-- Assign `a_error' to `error'.
		obsolete
			"Use `add_error' instead. [2017-05-31]"
		do
			add_error (a_error)
		ensure
			error_set: error = a_error
		end

	add_error (a_error: SED_ERROR)
			-- Assign `a_error' to `error'.
		local
			l_new_errors: like errors
		do
			if attached errors as l_errors then
				l_errors.extend (a_error)
			else
				create l_new_errors.make (10)
				l_new_errors.extend (a_error)
				errors := l_new_errors
			end
		ensure
			error_set: attached errors as l_errors and then l_errors.has (a_error)
		end

	raise_fatal_error (a_error: SED_ERROR)
			-- Add `a_error' to `errors' and raise an exception to terminate retrieval
			-- because the error is beyond recovery.
		local
			l_failure: SERIALIZATION_FAILURE
		do
			add_error (a_error)
			create l_failure
			l_failure.set_description (a_error.message)
			l_failure.raise
		ensure
			error_set: attached errors as l_errors and then l_errors.has (a_error)
		end

	reset_errors
			-- Remove all errors for a new retrieval
		do
			errors := Void
		ensure
			errors_reset: errors = Void
		end

feature {NONE} -- Cleaning

	clear_internal_data
			-- Clear all allocated data
		do
			create object_references.make_empty (0)
				-- Consume any remaining bytes if any
			if deserializer.is_ready_for_reading then
				deserializer.cleanup
			end
			dynamic_type_table := Void
		end

feature {NONE} -- Implementation

	read_header (a_count: NATURAL_32)
			-- Read header of serialized data which has `a_count' objects.
		do
			read_settings
			read_object_table (a_count)
		end

	frozen read_settings
			-- Read various settings of serialized data.
		do
			if is_store_settings_enabled then
				version := deserializer.read_compressed_natural_32
				if version >= {SED_VERSIONS}.version_7_3 then
					has_reference_with_copy_semantics := deserializer.read_boolean
				else
						-- Old versions did not support reference with copy semantics.
					has_reference_with_copy_semantics := False
				end
			else
				version := {SED_VERSIONS}.version_5_6
					-- By default we assume there will be no references with copy semantics.				
				has_reference_with_copy_semantics := False
			end
		end

	frozen read_object_table (a_count: NATURAL_32)
			-- Read object table if any, which has `a_count' objects.
		local
			l_objs: like object_references
			l_deser: like deserializer
			l_reflector: like reflector
			l_mem: like memory
			l_is_collecting: BOOLEAN
			l_nat32: NATURAL_32
			l_dtype, l_old_dtype: INTEGER
			i, nb: INTEGER
			l_obj: ANY
		do
				-- Reading the `is_for_fast_retrieval' flag which is now obsolete and not referenced
				-- anymore in the code. We could skip it but it would prevent storable made with this
				-- setting to be retrieved due to a format mismatch.
			if deserializer.read_boolean then
				l_mem := memory
				l_is_collecting := l_mem.collecting
				l_deser := deserializer
				l_reflector := reflector
				l_objs := object_references
					-- Create a fake entry for item at index `0' in SPECIAL since our indexing starts at 1.
				l_objs.extend (Current)
				from
					i := 0
					nb := a_count.to_integer_32
				until
					i = nb
				loop
					if l_is_collecting and then i // 2000 = 0 then
						l_mem.collection_off
					end
						-- Read dynamic type
					l_old_dtype := l_deser.read_compressed_natural_32.to_integer_32
					l_dtype := new_dynamic_type_id (l_old_dtype)
					if l_dtype >= 0 then
							-- Read reference id
						l_nat32 := deserializer.read_compressed_natural_32
						check
							l_nat32_valid: l_nat32 > 0 and l_nat32 < {INTEGER}.max_value.as_natural_32
						end
						check valid_id: l_nat32.to_integer_32 = i + 1 end

							-- Read object flags
						if l_deser.read_natural_8 = is_special_flag then
								-- We need to first read the `item_type' of the SPECIAL,
								-- and then its count.
							l_obj := new_special_instance (l_dtype,
								l_deser.read_compressed_integer_32,
								l_deser.read_compressed_integer_32)
						else
							l_obj := l_reflector.new_instance_of (l_dtype)
						end

						l_objs.extend (l_obj)
					else
							-- Data is visibly corrupted, stop here.
						raise_fatal_error (error_factory.new_internal_error ("Cannot read object type. Corrupted data!"))
					end
					i := i + 1
				end
				if l_is_collecting then
					l_mem.collection_on
				end
			else
					-- Data is not using `is_for_fast_retrieval', we cannot continue.
				raise_fatal_error (error_factory.new_format_mismatch_66)
			end
		end

	frozen read_default_value (a_abstract_type: INTEGER)
			-- Read from the stream the default value that corresponds to `a_abstract_type'.
		local
			l_deser: like deserializer
		do
			l_deser := deserializer
			inspect a_abstract_type
			when {REFLECTOR_CONSTANTS}.boolean_type then l_deser.read_boolean.do_nothing
			when {REFLECTOR_CONSTANTS}.character_8_type then l_deser.read_character_8.do_nothing
			when {REFLECTOR_CONSTANTS}.character_32_type then l_deser.read_character_32.do_nothing
			when {REFLECTOR_CONSTANTS}.natural_8_type then l_deser.read_natural_8.do_nothing
			when {REFLECTOR_CONSTANTS}.natural_16_type then l_deser.read_natural_16.do_nothing
			when {REFLECTOR_CONSTANTS}.natural_32_type then l_deser.read_natural_32.do_nothing
			when {REFLECTOR_CONSTANTS}.natural_64_type then l_deser.read_natural_64.do_nothing
			when {REFLECTOR_CONSTANTS}.integer_8_type then l_deser.read_integer_8.do_nothing
			when {REFLECTOR_CONSTANTS}.integer_16_type then l_deser.read_integer_16.do_nothing
			when {REFLECTOR_CONSTANTS}.integer_32_type then l_deser.read_integer_32.do_nothing
			when {REFLECTOR_CONSTANTS}.integer_64_type then l_deser.read_integer_64.do_nothing
			when {REFLECTOR_CONSTANTS}.real_32_type then l_deser.read_real_32.do_nothing
			when {REFLECTOR_CONSTANTS}.real_64_type then l_deser.read_real_64.do_nothing
			when {REFLECTOR_CONSTANTS}.pointer_type then l_deser.read_pointer.do_nothing
			when {REFLECTOR_CONSTANTS}.reference_type then l_deser.read_compressed_natural_32.do_nothing
			when {REFLECTOR_CONSTANTS}.expanded_type then l_deser.read_natural_8.do_nothing

			else
				check False end
			end
		end

	frozen read_reference: detachable ANY
			-- Read reference from the stream.
		local
			l_nat32: NATURAL_32
		do
			l_nat32 := deserializer.read_compressed_natural_32
			if l_nat32 /= 0 then
				check
					l_nat32_valid: l_nat32 < {INTEGER}.max_value.as_natural_32
				end
				Result := object_references.item (l_nat32.to_integer_32)
			end
		end

	read_persistent_field_count (a_reflected_object: REFLECTED_OBJECT): INTEGER
			-- Number of fields we are going to read from `a_reflected_object' in the the retrieved system.
		do
				-- We read the same number of fields because the transient fields are serialized.
			Result := a_reflected_object.field_count
		end

	new_attribute_offset (a_new_type_id, a_old_offset: INTEGER): INTEGER
			-- Given attribute offset `a_old_offset' in the stored object whose dynamic type id
			-- is now `a_new_type_id', retrieve new offset in `a_new_type_id'.
			-- If not found 0 in which case it is an error.
		require
			a_new_type_id_non_negative: a_new_type_id >= 0
			a_old_offset_positive: a_old_offset > 0
		do
			Result := a_old_offset
		ensure
			new_attribute_offset_non_negative: Result >= 0
		end

	decode_objects (a_count: NATURAL_32)
			-- Decode `a_count' object from `deserializer' and store root object in `last_decoded_object'.
		require
			a_count_positive: a_count > 0
		local
			i: NATURAL_32
		do
					-- Decode root object
			decode_object (True)
					-- Decode remaining objects
			from
				i := 1
			until
				i = a_count
			loop
				decode_object (False)
				i := i + 1
			end
		end

	frozen decode_object (is_root: BOOLEAN)
			-- Decode one object and store it in `last_decoded_object' if `is_root'.
		local
			l_deser: like deserializer
			l_reflected_object: like reflected_object
			l_obj: detachable ANY
			l_nat32: NATURAL_32
		do
			l_deser := deserializer
			l_reflected_object := reflected_object

				-- Read reference ID.
			l_nat32 := l_deser.read_compressed_natural_32
			check
				l_nat32_valid: l_nat32 < {INTEGER}.max_value.as_natural_32
			end

			l_obj := object_references.item (l_nat32.to_integer_32)
			l_reflected_object.set_object (l_obj)

			if l_reflected_object.is_special then
					-- Get the abstract element type of the SPECIAL.
				decode_special (l_obj, abstract_type (l_reflected_object.generic_dynamic_type (1)))
			elseif l_reflected_object.is_tuple then
				decode_tuple (l_obj)
			else
				decode_normal_object (l_reflected_object)
			end
			if is_root then
				last_decoded_object := l_obj
			end
		end

	decode_normal_object (a_reflected_object: REFLECTED_OBJECT)
			-- Decode an object represented by `a_reflected_object'.
		require
			an_obj_not_void: a_reflected_object /= Void
		local
			l_deser: like deserializer
			i, nb: INTEGER
			l_dtype, l_exp_dtype, l_new_offset: INTEGER
			l_exp: REFLECTED_REFERENCE_OBJECT
		do
			l_deser := deserializer
			from
				i := 1
				l_dtype := a_reflected_object.dynamic_type
				nb := read_persistent_field_count (a_reflected_object) + 1
			until
				i = nb
			loop
				l_new_offset := new_attribute_offset (l_dtype, i)
				check l_new_offset_positive: l_new_offset > 0 end
				if not a_reflected_object.is_field_transient (l_new_offset) then
					inspect a_reflected_object.field_type (l_new_offset)
					when {REFLECTOR_CONSTANTS}.boolean_type then
						a_reflected_object.set_boolean_field (l_new_offset, l_deser.read_boolean)

					when {REFLECTOR_CONSTANTS}.character_8_type then
						a_reflected_object.set_character_8_field (l_new_offset, l_deser.read_character_8)
					when {REFLECTOR_CONSTANTS}.character_32_type then
						a_reflected_object.set_character_32_field (l_new_offset, l_deser.read_character_32)

					when {REFLECTOR_CONSTANTS}.natural_8_type then
						a_reflected_object.set_natural_8_field (l_new_offset, l_deser.read_natural_8)
					when {REFLECTOR_CONSTANTS}.natural_16_type then
						a_reflected_object.set_natural_16_field (l_new_offset, l_deser.read_natural_16)
					when {REFLECTOR_CONSTANTS}.natural_32_type then
						a_reflected_object.set_natural_32_field (l_new_offset, l_deser.read_natural_32)
					when {REFLECTOR_CONSTANTS}.natural_64_type then
						a_reflected_object.set_natural_64_field (l_new_offset, l_deser.read_natural_64)

					when {REFLECTOR_CONSTANTS}.integer_8_type then
						a_reflected_object.set_integer_8_field (l_new_offset, l_deser.read_integer_8)
					when {REFLECTOR_CONSTANTS}.integer_16_type then
						a_reflected_object.set_integer_16_field (l_new_offset, l_deser.read_integer_16)
					when {REFLECTOR_CONSTANTS}.integer_32_type then
						a_reflected_object.set_integer_32_field (l_new_offset, l_deser.read_integer_32)
					when {REFLECTOR_CONSTANTS}.integer_64_type then
						a_reflected_object.set_integer_64_field (l_new_offset, l_deser.read_integer_64)

					when {REFLECTOR_CONSTANTS}.real_32_type then
						a_reflected_object.set_real_32_field (l_new_offset, l_deser.read_real_32)
					when {REFLECTOR_CONSTANTS}.real_64_type then
						a_reflected_object.set_real_64_field (l_new_offset, l_deser.read_real_64)

					when {REFLECTOR_CONSTANTS}.pointer_type then
						a_reflected_object.set_pointer_field (l_new_offset, l_deser.read_pointer)

					when {REFLECTOR_CONSTANTS}.reference_type then
						if has_reference_with_copy_semantics then
							if l_deser.read_boolean then
									-- Reading a reference to an object with copy semantics. First
									-- get its dynamic type to create it.
								l_exp_dtype := new_dynamic_type_id (l_deser.read_compressed_integer_32)
								if l_exp_dtype < 0 then
										-- Data is visibly corrupted, stop here.
									raise_fatal_error (error_factory.new_internal_error ("Cannot read object type. Corrupted data!"))
								else
									create l_exp.make (reflector.new_instance_of (l_exp_dtype))
									decode_normal_object (l_exp)
										-- Ideally we want to directly set the reference with copy semantics
										-- without triggering a copy.
									-- {ISE_RUNTIME}.set_reference_field (l_new_offset, a_reflected_object.object_address, a_reflected_object.physical_offset, l_exp.object_address)
									a_reflected_object.set_reference_field (l_new_offset, l_exp.object)
								end
							else
								a_reflected_object.set_reference_field (l_new_offset, read_reference)
							end
						else
							a_reflected_object.set_reference_field (l_new_offset, read_reference)
						end

					when {REFLECTOR_CONSTANTS}.expanded_type then
							-- No need for the dynamic type by default, so we skip it.
						l_deser.read_compressed_integer_32.do_nothing
						decode_normal_object (a_reflected_object.expanded_field (l_new_offset))

					else
						check
							False
						end
					end
				end
				i := i + 1
			end
		end

	frozen decode_tuple (an_obj: ANY)
			-- Decode TUPLE object.
		require
			an_obj_not_void: an_obj /= Void
			an_obj_is_tuple: attached {TUPLE} an_obj
		local
			l_deser: like deserializer
			i, nb: INTEGER
		do
			l_deser := deserializer
			if attached {TUPLE} an_obj as l_tuple then
				from
					i := 1
					nb := l_tuple.count + 1
				until
					i = nb
				loop
					inspect l_deser.read_natural_8
					when {TUPLE}.boolean_code then l_tuple.put_boolean (l_deser.read_boolean, i)

					when {TUPLE}.character_8_code then l_tuple.put_character_8 (l_deser.read_character_8, i)
					when {TUPLE}.character_32_code then l_tuple.put_character_32 (l_deser.read_character_32, i)

					when {TUPLE}.natural_8_code then l_tuple.put_natural_8 (l_deser.read_natural_8, i)
					when {TUPLE}.natural_16_code then l_tuple.put_natural_16 (l_deser.read_natural_16, i)
					when {TUPLE}.natural_32_code then l_tuple.put_natural_32 (l_deser.read_natural_32, i)
					when {TUPLE}.natural_64_code then l_tuple.put_natural_64 (l_deser.read_natural_64, i)

					when {TUPLE}.integer_8_code then l_tuple.put_integer_8 (l_deser.read_integer_8, i)
					when {TUPLE}.integer_16_code then l_tuple.put_integer_16 (l_deser.read_integer_16, i)
					when {TUPLE}.integer_32_code then l_tuple.put_integer_32 (l_deser.read_integer_32, i)
					when {TUPLE}.integer_64_code then l_tuple.put_integer_64 (l_deser.read_integer_64, i)

					when {TUPLE}.real_32_code then l_tuple.put_real_32 (l_deser.read_real_32, i)
					when {TUPLE}.real_64_code then l_tuple.put_real_64 (l_deser.read_real_64, i)

					when {TUPLE}.pointer_code then l_tuple.put_pointer (l_deser.read_pointer, i)

					when {TUPLE}.reference_code then l_tuple.put_reference (read_reference, i)
					else
						check
							False
						end
					end
					i := i + 1
				end
			end
		end

	frozen new_special_instance (a_dtype, a_item_type, a_count: INTEGER): SPECIAL [detachable ANY]
			-- Create new special instance of a special object whose dynamic
			-- type is `a_dtype', whose element abstract type is `a_item_type'
			-- and of count `a_count'.
		require
			a_dtype_non_negative: a_dtype >= 0
			a_item_type_non_negative: a_item_type >= 0
			a_count_non_negative: a_count >= 0
		do
			inspect a_item_type
			when {REFLECTOR_CONSTANTS}.boolean_type then create {SPECIAL [BOOLEAN]} Result.make_empty (a_count)

			when {REFLECTOR_CONSTANTS}.character_8_type then create {SPECIAL [CHARACTER_8]} Result.make_empty (a_count)
			when {REFLECTOR_CONSTANTS}.character_32_type then create {SPECIAL [CHARACTER_32]} Result.make_empty (a_count)

			when {REFLECTOR_CONSTANTS}.natural_8_type then create {SPECIAL [NATURAL_8]} Result.make_empty (a_count)
			when {REFLECTOR_CONSTANTS}.natural_16_type then create {SPECIAL [NATURAL_16]} Result.make_empty (a_count)
			when {REFLECTOR_CONSTANTS}.natural_32_type then create {SPECIAL [NATURAL_32]} Result.make_empty (a_count)
			when {REFLECTOR_CONSTANTS}.natural_64_type then create {SPECIAL [NATURAL_64]} Result.make_empty (a_count)

			when {REFLECTOR_CONSTANTS}.integer_8_type then create {SPECIAL [INTEGER_8]} Result.make_empty (a_count)
			when {REFLECTOR_CONSTANTS}.integer_16_type then create {SPECIAL [INTEGER_16]} Result.make_empty (a_count)
			when {REFLECTOR_CONSTANTS}.integer_32_type then create {SPECIAL [INTEGER]} Result.make_empty (a_count)
			when {REFLECTOR_CONSTANTS}.integer_64_type then create {SPECIAL [INTEGER_64]} Result.make_empty (a_count)

			when {REFLECTOR_CONSTANTS}.real_32_type then create {SPECIAL [REAL_32]} Result.make_empty (a_count)
			when {REFLECTOR_CONSTANTS}.real_64_type then create {SPECIAL [REAL_64]} Result.make_empty (a_count)

			when {REFLECTOR_CONSTANTS}.pointer_type then create {SPECIAL [POINTER]} Result.make_empty (a_count)
			else
				Result := reflector.new_special_any_instance (a_dtype, a_count)
			end
		ensure
			new_special_instance_not_void: Result /= Void
		end

	frozen decode_special (an_obj: ANY; an_item_type: INTEGER)
			-- Decode SPECIAL object of element type `an_item_type' in `an_obj'.
		require
			an_obj_not_void: an_obj /= Void
			an_obj_is_special: attached {SPECIAL [detachable ANY]} an_obj
		local
			nb: INTEGER
		do
				-- Read number of elements in SPECIAL.
			nb := deserializer.read_compressed_integer_32
			inspect an_item_type
			when {REFLECTOR_CONSTANTS}.boolean_type then
				if attached {SPECIAL [BOOLEAN]} an_obj as l_spec_boolean then
					decode_special_boolean (l_spec_boolean, nb)
				else
					check l_spec_boolean_not_void: False end
				end

			when {REFLECTOR_CONSTANTS}.character_8_type then
				if attached {SPECIAL [CHARACTER_8]} an_obj as l_spec_character_8 then
					decode_special_character_8 (l_spec_character_8, nb)
				else
					check l_spec_character_8_not_void: False end
				end

			when {REFLECTOR_CONSTANTS}.character_32_type then
				if attached {SPECIAL [CHARACTER_32]} an_obj as l_spec_character_32 then
					decode_special_character_32 (l_spec_character_32, nb)
				else
					check l_spec_character_32_not_void: False end
				end

			when {REFLECTOR_CONSTANTS}.natural_8_type then
				if attached {SPECIAL [NATURAL_8]} an_obj as l_spec_natural_8 then
					decode_special_natural_8 (l_spec_natural_8, nb)
				else
					check l_spec_natural_8_not_void: False end
				end

			when {REFLECTOR_CONSTANTS}.natural_16_type then
				if attached {SPECIAL [NATURAL_16]} an_obj as l_spec_natural_16 then
					decode_special_natural_16 (l_spec_natural_16, nb)
				else
					check l_spec_natural_16_not_void: False end
				end

			when {REFLECTOR_CONSTANTS}.natural_32_type then
				if attached {SPECIAL [NATURAL_32]} an_obj as l_spec_natural_32 then
					decode_special_natural_32 (l_spec_natural_32, nb)
				else
					check l_spec_natural_32_not_void: False end
				end

			when {REFLECTOR_CONSTANTS}.natural_64_type then
				if attached {SPECIAL [NATURAL_64]} an_obj as l_spec_natural_64 then
					decode_special_natural_64 (l_spec_natural_64, nb)
				else
					check l_spec_natural_64_not_void: False end
				end

			when {REFLECTOR_CONSTANTS}.integer_8_type then
				if attached {SPECIAL [INTEGER_8]} an_obj as l_spec_integer_8 then
					decode_special_integer_8 (l_spec_integer_8, nb)
				else
					check l_spec_integer_8_not_void: False end
				end

			when {REFLECTOR_CONSTANTS}.integer_16_type then
				if attached {SPECIAL [INTEGER_16]} an_obj as l_spec_integer_16 then
					decode_special_integer_16 (l_spec_integer_16, nb)
				else
					check l_spec_integer_16_not_void: False end
				end

			when {REFLECTOR_CONSTANTS}.integer_32_type then
				if attached {SPECIAL [INTEGER]} an_obj as l_spec_integer_32 then
					decode_special_integer_32 (l_spec_integer_32, nb)
				else
					check l_spec_integer_32_not_void: False end
				end

			when {REFLECTOR_CONSTANTS}.integer_64_type then
				if attached {SPECIAL [INTEGER_64]} an_obj as l_spec_integer_64 then
					decode_special_integer_64 (l_spec_integer_64, nb)
				else
					check l_spec_integer_64_not_void: False end
				end

			when {REFLECTOR_CONSTANTS}.real_32_type then
				if attached {SPECIAL [REAL_32]} an_obj as l_spec_real_32 then
					decode_special_real_32 (l_spec_real_32, nb)
				else
					check l_spec_real_32_not_void: False end
				end

			when {REFLECTOR_CONSTANTS}.real_64_type then
				if attached {SPECIAL [REAL_64]} an_obj as l_spec_real_64 then
					decode_special_real_64 (l_spec_real_64, nb)
				else
					check l_spec_real_64_not_void: False end
				end

			when {REFLECTOR_CONSTANTS}.pointer_type then
				if attached {SPECIAL [POINTER]} an_obj as l_spec_pointer then
					decode_special_pointer (l_spec_pointer, nb)
				else
					check l_spec_pointer_not_void: False end
				end

			else
				check an_item_type_valid: an_item_type = {REFLECTOR_CONSTANTS}.reference_type end
				if attached {SPECIAL [detachable ANY]} an_obj as l_spec_any then
					decode_special_reference (l_spec_any, nb)
				else
					check l_spec_any_not_void: False end
				end
			end
		end

	frozen decode_special_boolean (a_spec: SPECIAL [BOOLEAN]; a_count: INTEGER)
			-- Decode SPECIAL [BOOLEAN].
		require
			a_spec_not_void: a_spec /= Void
		local
			i: INTEGER
			l_deser: like deserializer
		do
			from
				l_deser := deserializer
			until
				i = a_count
			loop
				a_spec.extend (l_deser.read_boolean)
				i := i + 1
			end
		end

	frozen decode_special_character_8 (a_spec: SPECIAL [CHARACTER_8]; a_count: INTEGER)
			-- Decode SPECIAL [CHARACTER_8].
		require
			a_spec_not_void: a_spec /= Void
		local
			i: INTEGER
			l_deser: like deserializer
		do
			from
				l_deser := deserializer
			until
				i = a_count
			loop
				a_spec.extend (l_deser.read_character_8)
				i := i + 1
			end
		end

	frozen decode_special_character_32 (a_spec: SPECIAL [CHARACTER_32]; a_count: INTEGER)
			-- Decode SPECIAL [CHARACTER_32].
		require
			a_spec_not_void: a_spec /= Void
		local
			i: INTEGER
			l_deser: like deserializer
		do
			from
				l_deser := deserializer
			until
				i = a_count
			loop
				a_spec.extend (l_deser.read_character_32)
				i := i + 1
			end
		end

	frozen decode_special_natural_8 (a_spec: SPECIAL [NATURAL_8]; a_count: INTEGER)
			-- Decode SPECIAL [NATURAL_8].
		require
			a_spec_not_void: a_spec /= Void
		local
			i: INTEGER
			l_deser: like deserializer
		do
			from
				l_deser := deserializer
			until
				i = a_count
			loop
				a_spec.extend (l_deser.read_natural_8)
				i := i + 1
			end
		end

	frozen decode_special_natural_16 (a_spec: SPECIAL [NATURAL_16]; a_count: INTEGER)
			-- Decode SPECIAL [NATURAL_16].
		require
			a_spec_not_void: a_spec /= Void
		local
			i: INTEGER
			l_deser: like deserializer
		do
			from
				l_deser := deserializer
			until
				i = a_count
			loop
				a_spec.extend (l_deser.read_natural_16)
				i := i + 1
			end
		end

	frozen decode_special_natural_32 (a_spec: SPECIAL [NATURAL_32]; a_count: INTEGER)
			-- Decode SPECIAL [NATURAL_32].
		require
			a_spec_not_void: a_spec /= Void
		local
			i: INTEGER
			l_deser: like deserializer
		do
			from
				l_deser := deserializer
			until
				i = a_count
			loop
				a_spec.extend (l_deser.read_natural_32)
				i := i + 1
			end
		end

	frozen decode_special_natural_64 (a_spec: SPECIAL [NATURAL_64]; a_count: INTEGER)
			-- Decode SPECIAL [NATURAL_64].
		require
			a_spec_not_void: a_spec /= Void
		local
			i: INTEGER
			l_deser: like deserializer
		do
			from
				l_deser := deserializer
			until
				i = a_count
			loop
				a_spec.extend (l_deser.read_natural_64)
				i := i + 1
			end
		end

	frozen decode_special_integer_8 (a_spec: SPECIAL [INTEGER_8]; a_count: INTEGER)
			-- Decode SPECIAL [INTEGER_8].
		require
			a_spec_not_void: a_spec /= Void
		local
			i: INTEGER
			l_deser: like deserializer
		do
			from
				l_deser := deserializer
			until
				i = a_count
			loop
				a_spec.extend (l_deser.read_integer_8)
				i := i + 1
			end
		end

	frozen decode_special_integer_16 (a_spec: SPECIAL [INTEGER_16]; a_count: INTEGER)
			-- Decode SPECIAL [INTEGER_16].
		require
			a_spec_not_void: a_spec /= Void
		local
			i: INTEGER
			l_deser: like deserializer
		do
			from
				l_deser := deserializer
			until
				i = a_count
			loop
				a_spec.extend (l_deser.read_integer_16)
				i := i + 1
			end
		end

	frozen decode_special_integer_32 (a_spec: SPECIAL [INTEGER]; a_count: INTEGER)
			-- Decode SPECIAL [INTEGER].
		require
			a_spec_not_void: a_spec /= Void
		local
			i: INTEGER
			l_deser: like deserializer
		do
			from
				l_deser := deserializer
			until
				i = a_count
			loop
				a_spec.extend (l_deser.read_integer_32)
				i := i + 1
			end
		end

	frozen decode_special_integer_64 (a_spec: SPECIAL [INTEGER_64]; a_count: INTEGER)
			-- Decode SPECIAL [INTEGER_64].
		require
			a_spec_not_void: a_spec /= Void
		local
			i: INTEGER
			l_deser: like deserializer
		do
			from
				l_deser := deserializer
			until
				i = a_count
			loop
				a_spec.extend (l_deser.read_integer_64)
				i := i + 1
			end
		end

	frozen decode_special_real_32 (a_spec: SPECIAL [REAL_32]; a_count: INTEGER)
			-- Decode SPECIAL [REAL_32].
		require
			a_spec_not_void: a_spec /= Void
		local
			i: INTEGER
			l_deser: like deserializer
		do
			from
				l_deser := deserializer
			until
				i = a_count
			loop
				a_spec.extend (l_deser.read_real_32)
				i := i + 1
			end
		end

	frozen decode_special_real_64 (a_spec: SPECIAL [REAL_64]; a_count: INTEGER)
			-- Decode SPECIAL [REAL_64].
		require
			a_spec_not_void: a_spec /= Void
		local
			i: INTEGER
			l_deser: like deserializer
		do
			from
				l_deser := deserializer
			until
				i = a_count
			loop
				a_spec.extend (l_deser.read_real_64)
				i := i + 1
			end
		end

	frozen decode_special_pointer (a_spec: SPECIAL [POINTER]; a_count: INTEGER)
			-- Decode SPECIAL [POINTER].
		require
			a_spec_not_void: a_spec /= Void
		local
			i: INTEGER
			l_deser: like deserializer
		do
			from
				l_deser := deserializer
			until
				i = a_count
			loop
				a_spec.extend (l_deser.read_pointer)
				i := i + 1
			end
		end

	frozen decode_special_reference (a_spec: SPECIAL [detachable ANY]; a_count: INTEGER)
			-- Decode SPECIAL of reference.
		local
			i: INTEGER
			l_has_copy_semantics_item: BOOLEAN
			l_deser: like deserializer
			l_exp_dtype: INTEGER
			l_exp: REFLECTED_REFERENCE_OBJECT
		do
			l_deser := deserializer
			if version >= {SED_VERSIONS}.version_7_3 then
				l_has_copy_semantics_item := l_deser.read_boolean
			end

			if not l_has_copy_semantics_item then
					-- Efficient retrieval of a special with normal references
				from
				until
					i = a_count
				loop
					a_spec.force (read_reference, i)
					i := i + 1
				end
			else
					-- Retrieval of a special containing some references with copy semantics.
				from
				until
					i = a_count
				loop
					if l_deser.read_boolean then
							-- Reading a reference to an object with copy semantics. First
							-- get its dynamic type to create it.
						l_exp_dtype := new_dynamic_type_id (l_deser.read_compressed_integer_32)
						if l_exp_dtype < 0 then
								-- Data is visibly corrupted, stop here.
							raise_fatal_error (error_factory.new_internal_error ("Cannot read object type. Corrupted data!"))
						else
							create l_exp.make (reflector.new_instance_of (l_exp_dtype))
							decode_normal_object (l_exp)
								-- Ideally we want to directly set the reference with copy semantics
								-- without triggering a copy.
							-- {ISE_RUNTIME}.set_reference_field (l_new_offset, a_reflected_object.object_address, a_reflected_object.physical_offset, l_exp.object_address)
							a_spec.force (l_exp.object, i)
						end
					else
						a_spec.force (read_reference, i)
					end
					i := i + 1
				end
			end
		end

	memory: MEMORY
			-- Access to MEMORY features without having to create a new instance each time.
		once
			create Result
		ensure
			memory_not_void: Result /= Void
		end

invariant
	reflector_not_void: reflector /= Void
	reflected_object_not_void: reflected_object /= Void
	deserializer_not_void: deserializer /= Void
	object_references_not_void: object_references /= Void

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


end
