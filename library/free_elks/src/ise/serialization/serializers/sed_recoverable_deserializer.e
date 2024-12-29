note
	description: "[
		Decoding of arbitrary objects graphs between sessions of programs
		containing the same types or potentially different types (which can
		be mapped to the new type system via a correction mechanism,). It
		also basically takes care of potential reordering of attributes
		from one system to the other.
		]"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date: 2020-05-19 14:29:33 +0000 (Tue, 19 May 2020) $"
	revision: "$Revision: 104259 $"

class
	SED_RECOVERABLE_DESERIALIZER

inherit
	SED_BASIC_DESERIALIZER
		redefine
			make,
			read_header,
			read_persistent_field_count,
			new_attribute_offset,
			is_transient_retrieval_required,
			clear_internal_data,
			decode_normal_object,
			decode_objects
		end

	MISMATCH_CORRECTOR

create
	make

feature {NONE} -- Initialization

	make (a_deserializer: SED_READER_WRITER)
		do
			Precursor (a_deserializer)
			create mismatches.make (0)
			create mismatched_object.make (0)
		end

feature -- Settings

	set_class_type_translator (a_translator: like class_type_translator)
			-- Set `class_type_translator' with `a_translator'.
		do
			class_type_translator := a_translator
		ensure
			class_type_translator_set: class_type_translator = a_translator
		end

	set_attribute_name_translator (a_translator: like attribute_name_translator)
			-- Set `attribute_name_translator' with `a_translator'.
		do
			attribute_name_translator := a_translator
		ensure
			attribute_name_translator_set: attribute_name_translator = a_translator
		end

	allow_conforming_mismatches
			-- Set `is_conforming_mismatch_allowed' to True.
		do
			is_conforming_mismatch_allowed := True
		ensure
			is_conforming_mismatch_allowed_set: is_conforming_mismatch_allowed
		end

	disallow_conforming_mismatches
			-- Set `is_conforming_mismatch_allowed' to False.
		do
			is_conforming_mismatch_allowed := False
		ensure
			is_conforming_mismatch_allowed_set: not is_conforming_mismatch_allowed
		end

	allow_attribute_removal
			-- Set `is_attribute_removal_allowed' to True.
		do
			is_attribute_removal_allowed := True
		ensure
			is_attribute_removal_allowed_set: is_attribute_removal_allowed
		end

	disallow_attribute_removal
			-- Set `is_attribute_removal_allowed' to False.
		do
			is_attribute_removal_allowed := False
		ensure
			is_attribute_removal_allowed_set: not is_attribute_removal_allowed
		end

	stop_on_data_retrieval_error
			-- Set `is_stopping_on_data_retrieval_error' to False.
		do
			is_stopping_on_data_retrieval_error := True
		ensure
			is_stopping_on_data_retrieval_error_set: is_stopping_on_data_retrieval_error
		end

	continue_on_data_retrieval_error
			-- Set `is_attribute_removal_allowed' to False.
		do
			is_stopping_on_data_retrieval_error := False
		ensure
			is_stopping_on_data_retrieval_error_set: not is_stopping_on_data_retrieval_error
		end

	set_is_checking_data_consistency (v: like is_checking_data_consistency)
			-- Set `is_checking_data_consistency' with `v'.
		do
			is_checking_data_consistency := v
		ensure
			is_checking_data_consistency_set: is_checking_data_consistency = v
		end

feature {NONE} -- Implementation: access

	attributes_mapping: detachable SPECIAL [detachable SPECIAL [INTEGER]]
			-- Mapping for each dynamic type id between old attribute location
			-- and new attribute location.

	new_attribute_offset (a_new_type_id, a_old_offset: INTEGER): INTEGER
			-- Given attribute offset `a_old_offset' in the stored object whose dynamic type id
			-- is now `a_new_type_id', retrieve new offset in `a_new_type_id'.
		do
			if
				attached attributes_mapping as l_map and then l_map.valid_index (a_new_type_id) and then
				attached l_map.item (a_new_type_id) as l_entry and then l_entry.valid_index (a_old_offset)
			then
				Result := l_entry.item (a_old_offset)
			end
		end

	class_type_translator: detachable FUNCTION [STRING_8, STRING_8]
			-- Provide a mapping between a class type from the storable to a class type
			-- in the retrieving system.

	attribute_name_translator: detachable FUNCTION [STRING_8, INTEGER, STRING_8]
			-- Provide a mapping for an attribute name for a give type ID.

	mismatches: HASH_TABLE [SED_TYPE_MISMATCH, INTEGER]
			-- Set of mismatches recorded during retrieval indexed by dynamic types.

	mismatched_object: ARRAYED_LIST [TUPLE [object: ANY; info: MISMATCH_INFORMATION]]
			-- List of all mismatched objects found during retrieval.

feature {NONE} -- Status report

	is_conforming_mismatch_allowed: BOOLEAN
			-- Do we not trigger a mismatch when an attribute type in the stored system is
			-- different from the retrieving system but conforming?

	is_attribute_removal_allowed: BOOLEAN
			-- Do we not trigger a mismatch when an attribute has been removed?

	is_stopping_on_data_retrieval_error: BOOLEAN
			-- When retrieving objects, should we stop at the first occurrence of a mismatch?

	is_checking_data_consistency: BOOLEAN
			-- After retrieving objects, should we check that all objects are consistent?

	is_transient_retrieval_required: BOOLEAN
			-- <Precursor>
		do
				-- We do not need transient attribute to be retrieved, only persistent one.			
			Result := False
		end

feature {NONE} -- Implementation

	read_header (a_count: NATURAL_32)
			-- Read header which contains mapping between dynamic type and their
			-- string representation.
		local
			i, nb: INTEGER
			l_deser: like deserializer
			l_reflector: like reflector
			l_table: like dynamic_type_table
			l_old_dtype, l_new_dtype: INTEGER
			l_old_type_str, l_new_type_str: STRING_8
			l_old_version, l_new_version: detachable IMMUTABLE_STRING_8
		do
			l_reflector := reflector
			l_deser := deserializer

				-- Read various settings.
			read_settings

				-- Check proper version
			if version < {SED_VERSIONS}.version_6_6 then
					-- Unknown version read or not a independent/recoverable format.
				raise_fatal_error (error_factory.new_format_mismatch (version, {SED_VERSIONS}.version_6_6))
			end

				-- Number of dynamic types in storable
			nb := l_deser.read_compressed_natural_32.to_integer_32
			create l_table.make_filled (0, nb)
			create attributes_mapping.make_filled (Void, nb)

				-- Read table which will give us mapping between the old dynamic types
				-- and the new ones.
			from
				i := 0
			until
				i = nb
			loop
					-- Read old dynamic type
				l_old_dtype := l_deser.read_compressed_natural_32.to_integer_32

					-- Read type string associated to `l_old_dtype' and find dynamic type
					-- in current system.
				l_old_type_str := l_deser.read_string_8
				l_new_type_str :=
					if attached class_type_translator as translation then
						translation (l_old_type_str)
					else
						l_old_type_str
					end
				l_new_dtype := l_reflector.dynamic_type_from_string (l_new_type_str)
				if l_new_dtype >= 0 then
					if not l_table.valid_index (l_old_dtype) then
						l_table := l_table.aliased_resized_area_with_default (0, (l_old_dtype + 1).max (l_table.count * 2))
					end
					l_table.put (l_new_dtype, l_old_dtype)
				else
						-- It is a fatal error, but we still continue to make sure
						-- we collect all errors.
					add_error (error_factory.new_missing_type_error (l_old_type_str, l_new_type_str))
				end

					-- Do we have a version to read?
				if l_deser.read_boolean then
					l_old_version := l_deser.read_immutable_string_8
				else
					l_old_version := Void
				end
				if l_new_dtype /= -1 then
					l_new_version := l_reflector.storable_version_of_type (l_new_dtype)
					if l_old_version /~ l_new_version then
							-- We record the mismatch for later when retrieving instances of `l_new_dtype'.
						associated_mismatch (l_new_dtype).add_version_mismatch (l_old_version, l_new_version)
					end
				end
				i := i + 1
			end

				-- Read table which will give us mapping between the old dynamic types
				-- and the new ones.
			from
				i := 0
				nb := l_deser.read_compressed_natural_32.to_integer_32
			until
				i = nb
			loop
					-- Read old dynamic type
				l_old_dtype := l_deser.read_compressed_natural_32.to_integer_32

					-- Read type string associated to `l_old_dtype' and find dynamic type
					-- in current system.
				l_old_type_str := l_deser.read_string_8
				l_new_type_str :=
					if attached class_type_translator as translation then
						translation (l_old_type_str)
					else
						l_old_type_str
					end
				l_new_dtype := l_reflector.dynamic_type_from_string (l_new_type_str)
				if l_new_dtype >= 0 then
					if not l_table.valid_index (l_old_dtype) then
						l_table := l_table.aliased_resized_area_with_default (0, (l_old_dtype + 1).max (l_table.count * 2))
					end
					l_table.put (l_new_dtype, l_old_dtype)
				else
						-- It is a fatal error, but we still continue to make sure
						-- we collect all errors.
					add_error (error_factory.new_missing_type_error (l_old_type_str, l_new_type_str))
				end
				i := i + 1
			end

				-- Now set `dynamic_type_table' as all old dynamic type IDs have
				-- be read and resolved.
			dynamic_type_table := l_table

				-- Read attributes map for each dynamic type.
			from
				i := 0
				nb := l_deser.read_compressed_natural_32.to_integer_32
			until
				i = nb
			loop
					-- Read old dynamic type.
				l_old_dtype := l_deser.read_compressed_natural_32.to_integer_32

					-- Read attributes description
				if l_table.valid_index (l_old_dtype) then
					read_attributes (l_table.item (l_old_dtype))
				else
					raise_fatal_error (error_factory.new_internal_error ("Cannot read attributes data"))
				end
				i := i + 1
			end

				-- Read object_table if any.
			read_object_table (a_count)
		end

	read_persistent_field_count (a_reflected_object: REFLECTED_OBJECT): INTEGER
			-- <Precursor>
		local
			l_dtype: INTEGER
		do
			l_dtype := a_reflected_object.dynamic_type
			if
				attached attributes_mapping as l_map and then l_map.valid_index (l_dtype) and then
				attached l_map.item (l_dtype) as l_entry
			then
					-- We substract -1 because the SPECIAL have a dummy entry at position 0 since
					-- positions in INTERNAL always start at one.
				Result := l_entry.count - 1
			else
				raise_fatal_error (error_factory.new_internal_error ("Cannot retrieve stored count"))
			end
		end

	read_attributes (a_dtype: INTEGER)
			-- Read attribute description for `a_dtype' where `a_dtype' is a dynamic type
			-- from the current system.
		local
			l_deser: like deserializer
			l_reflector: like reflector
			l_map: like attributes_map
			l_mapping: SPECIAL [INTEGER]
			l_old_name, l_new_name: STRING_8
			l_old_dtype, l_dtype: INTEGER
			i, nb, l_not_founds: INTEGER
			l_old_count, l_new_count: INTEGER
			a: like attributes_mapping
			l_attribute_type: INTEGER
		do
			l_deser := deserializer
			l_reflector := reflector

				-- Compare count of attributes
			l_old_count := l_deser.read_compressed_natural_32.to_integer_32
			l_new_count := l_reflector.persistent_field_count_of_type (a_dtype)
			if l_old_count /= l_new_count then
					-- Stored type has a different number of attributes than the type
					-- from the retrieving system.
				associated_mismatch (a_dtype).add_attribute_count_mismatch (l_old_count, l_new_count)
			end

			from
				i := 1
				l_map := attributes_map (a_dtype)
				nb := l_old_count + 1
				create l_mapping.make_empty (nb)
				l_mapping.extend (0)
			until
				i = nb
			loop
					-- Read attribute static type
				l_old_dtype := l_deser.read_compressed_natural_32.to_integer_32
				l_dtype := new_dynamic_type_id (l_old_dtype)
					-- Read attribute name
				l_old_name := l_deser.read_string_8
				l_new_name :=
					if attached attribute_name_translator as translation then
						translation (l_old_name, a_dtype)
					else
						l_old_name
					end

					-- If `l_dtype' is negatif then somehow the data we read is corrupted, we
					-- skip that attribute and record the mismatch and mark it as a fatal error.
				if l_dtype >= 0 then
					if attached l_map.item (l_new_name) as l_item then
						l_attribute_type := l_item.dtype
						if l_attribute_type /= l_dtype then
								-- Case #1: types are different but we allow retrieval if the old type conforms
								-- to the new one and taking into account attachment marks.
							if is_conforming_mismatch_allowed then
								if not l_reflector.type_conforms_to (l_dtype, l_attribute_type) then
										-- No conformance, let's check if it conforms to the detachable type to
										-- have an autofix mismatch. In either case the `l_mismatch' instance
										-- has to be created
									if l_reflector.is_attached_type (l_attribute_type) and then l_reflector.type_conforms_to (l_dtype, l_reflector.detachable_type (l_attribute_type)) then
											-- We do, we do not trigger a mismatch but we let the system know
											-- that upon retrieval if the retrieved attribute is Void, we will
											-- trigger a correct mismatch.
										associated_mismatch (a_dtype).add_void_safe_mismatch (l_dtype, l_attribute_type, l_old_name, l_new_name, i, l_item.position)
									else
										associated_mismatch (a_dtype).add_attribute_mismatch (l_dtype, l_attribute_type, l_old_name, l_new_name, i, l_item.position)
									end
								end
							else
									-- Case #2: types are different but we only accept it if they only differ
									-- by their attachment mark.
								if l_reflector.is_attached_type (l_attribute_type) then
									if l_reflector.detachable_type (l_attribute_type) = l_dtype then
											-- We do, we do not trigger a mismatch but we let the system know
											-- that upon retrieval if the retrieved attribute is Void, we will
											-- trigger a correct mismatch.
										associated_mismatch (a_dtype).add_void_safe_mismatch (l_dtype, l_attribute_type, l_old_name, l_new_name, i, l_item.position)
									else
										associated_mismatch (a_dtype).add_attribute_mismatch (l_dtype, l_attribute_type, l_old_name, l_new_name, i, l_item.position)
									end
								else
									if l_reflector.is_attached_type (l_dtype) and then l_reflector.detachable_type (l_dtype) = l_attribute_type then
											-- Nothing to do, old attribute type was attached while the
											-- new one is not.
									else
										associated_mismatch (a_dtype).add_attribute_mismatch (l_dtype, l_attribute_type, l_old_name, l_new_name, i, l_item.position)
									end
								end
							end
						end
							-- Regardless of the mismatch status, we record the mapping.
						l_mapping.extend (l_item.position)
					else
						l_not_founds := l_not_founds + 1
						if not is_attribute_removal_allowed then
							associated_mismatch (a_dtype).add_removed_attribute (l_dtype, l_old_name, l_new_name, i)
						end
							-- We store a non-existent mapping, so that `l_mapping' does store the actual number of attributes
							-- that were originally stored.
						l_mapping.extend (-1)
					end
				else
					add_error (error_factory.new_unknown_attribute_type_error (a_dtype, l_new_name))
				end
				i := i + 1
			end
				-- Check if some attributes have been added.
			if l_old_count - l_not_founds < l_new_count then
				associated_mismatch (a_dtype).add_new_attribute_mismatch (l_new_count - (l_old_count - l_not_founds))
			end

			check attached attributes_mapping as l_a then
				if not l_a.valid_index (a_dtype) then
					a := l_a.aliased_resized_area_with_default (Void, (a_dtype + 1).max (l_a.count * 2))
					attributes_mapping := a
				else
					a := l_a
				end
				a.put (l_mapping, a_dtype)
			end
		end

	attributes_map (a_dtype: INTEGER): HASH_TABLE [TUPLE [position, dtype: INTEGER], STRING]
			-- Attribute map for dynamic type `a_dtype' which records
			-- position and dynamic type for a given attribute name.
		require
			a_dtype_non_negative: a_dtype >= 0
		local
			l_reflector: like reflector
			i, nb: INTEGER
		do
			l_reflector := reflector

			from
				i := 1
				nb := l_reflector.field_count_of_type (a_dtype)
				create Result.make (nb)
				nb := nb + 1
			until
				i = nb
			loop
				Result.put (
					[i, l_reflector.field_static_type_of_type (i, a_dtype)],
					l_reflector.field_name_of_type (i, a_dtype))
				i := i + 1
			end
		ensure
			attributes_map_not_void: Result /= Void
		end

	associated_mismatch (a_dtype: INTEGER): SED_TYPE_MISMATCH
			-- Associated mismatch for `a_dtype'.
		require
			a_dtype_non_negative: a_dtype >= 0
		do
			if attached mismatches.item (a_dtype) as l_mis then
				check valid_mismatch: l_mis.type_id = a_dtype end
				Result := l_mis
			else
				create Result.make (a_dtype)
				mismatches.put (Result, a_dtype)
			end
		end

	has_mismatch (a_dtype: INTEGER): BOOLEAN
			-- Is there a mismatch triggered for `a_dtype'?
		require
			a_dtype_non_negative: a_dtype >= 0
		do
			Result := mismatches.has (a_dtype)
		end

	decode_objects (a_count: NATURAL_32)
			-- <Precursor>
		local
			i, nb: INTEGER
		do
				-- Perform retrieval
			Precursor (a_count)

				-- Let's fix mismatches
			from
				mismatched_object.start
			until
				mismatched_object.after
			loop
				safe_mismatch_correction (mismatched_object.item.object, mismatched_object.item.info)
				mismatched_object.forth
			end

				-- Let's verify the consistency of our objects.
			if is_checking_data_consistency then
				from
					i := 0
					nb := object_references.upper
				until
					i > nb
				loop
					if
						attached object_references.item (i) as l_obj and then
						not is_object_valid (l_obj, True)
					then
						add_error (error_factory.new_invalid_object_error (l_obj))
					end
					i := i + 1
				end
			end
		end

	safe_mismatch_correction (an_obj: ANY; a_mismatch_information: MISMATCH_INFORMATION)
			-- Try to apply `{MISMATCH_CORRECTOR}.correct_mismatch' to `an_obj' using `a_mismatch_information'
			-- to solve the mismatch.
		local
			retried: BOOLEAN
			l_check, l_mismatch_called: BOOLEAN
		do
			if not retried then
				if attached {MISMATCH_CORRECTOR} an_obj as l_corrector then
					l_mismatch_called := True
					l_check := {ISE_RUNTIME}.check_assert (False)
					a_mismatch_information.put (an_obj.generating_type.name, {MISMATCH_INFORMATION}.type_name_key)
					mismatch_information.copy (a_mismatch_information)
					l_corrector.correct_mismatch
					l_check := {ISE_RUNTIME}.check_assert (l_check)
					if not is_object_valid (an_obj, False) then
						add_error (error_factory.new_invalid_object_error (an_obj))
					end
				else
					add_error (error_factory.new_object_mismatch_error (an_obj))
				end
			else
				if l_mismatch_called then
					l_check := {ISE_RUNTIME}.check_assert (l_check)
				end
				add_error (error_factory.new_object_mismatch_error (an_obj))
			end
		rescue
			retried := True
			retry
		end

	is_object_valid (an_obj: ANY; a_verify_invariant: BOOLEAN): BOOLEAN
			-- Is object content valid, i.e. are all attached attributes really attached?
		local
			l_reflected_object: like reflected_object
			l_reflector: like reflector
			i, nb: INTEGER
			retried: BOOLEAN
		do
			if not retried then
					-- Let's verify attachment status of our objects
				from
					l_reflected_object := reflected_object
					l_reflector := reflector
					l_reflected_object.set_object (an_obj)
					i := 1
					nb := l_reflected_object.field_count
					Result := True
				until
					i > nb or not Result
				loop
					if l_reflected_object.field_type (i) = {REFLECTOR_CONSTANTS}.reference_type then
						Result := not l_reflector.is_attached_type (l_reflected_object.field_static_type (i)) or else l_reflected_object.reference_field (i) /= Void
					end
					i := i + 1
				end
				if a_verify_invariant then
						-- Let's verify the invariant
					an_obj.do_nothing
				end
			else
				Result := False
			end
		rescue
			retried := True
			retry
		end

	decode_normal_object (a_reflected_object: REFLECTED_OBJECT)
			-- <Precursor>
		local
			l_deser: like deserializer
			i, nb: INTEGER
			l_dtype, l_exp_dtype, l_new_offset: INTEGER
			l_mismatch_info: SED_TYPE_MISMATCH
			l_info: detachable MISMATCH_INFORMATION
			l_check_for_non_void: BOOLEAN
			l_has_mismatch: BOOLEAN
			l_field_info: detachable TUPLE [old_name, new_name: STRING_8; old_attribute_type, new_attribute_type, old_position, new_position: INTEGER; is_changed, is_removed, is_attachment_check_required: BOOLEAN]
			l_exp: REFLECTED_REFERENCE_OBJECT
		do
			l_dtype := a_reflected_object.dynamic_type
			if not has_mismatch (l_dtype) then
				Precursor (a_reflected_object)
			else
				l_mismatch_info := associated_mismatch (l_dtype)
				if l_mismatch_info.has_version_mismatch then
					create l_info.make (l_mismatch_info.old_count)
					l_info.set_versions (l_mismatch_info.old_version, l_mismatch_info.new_version)
				end
				l_deser := deserializer
				from
					i := 1
						-- We read only as many attributes as stored.
					nb := read_persistent_field_count (a_reflected_object) + 1
				until
					i = nb
				loop
					l_field_info := l_mismatch_info.mismatches_by_stored_position.item (i)
					if l_field_info /= Void then
						l_check_for_non_void := l_field_info.is_attachment_check_required
						l_has_mismatch := l_field_info.is_changed or (not is_attribute_removal_allowed and then l_field_info.is_removed)
						if not l_has_mismatch then
							l_field_info := Void
						elseif l_info = Void then
							create l_info.make (l_mismatch_info.old_count)
						end
					else
						l_check_for_non_void := False
					end
					if l_field_info = Void then
						l_new_offset := new_attribute_offset (l_dtype, i)
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
										if l_check_for_non_void then
												-- No need to search for non-Void field since we just
												-- created an object.
											l_check_for_non_void := False
										end
									end
								else
									a_reflected_object.set_reference_field (l_new_offset, read_reference)
								end
							else
								a_reflected_object.set_reference_field (l_new_offset, read_reference)
							end

								-- We check now that for an attached attribute, we have indeed retrieved a non-void
								-- attribute, otherwise we will generate a mismatch.
							if l_check_for_non_void and then a_reflected_object.reference_field (l_new_offset) = Void then
								if l_info = Void then
									create l_info.make (l_mismatch_info.old_count)
								end
								l_info.put (Void, a_reflected_object.field_name (l_new_offset))
							end

						when {REFLECTOR_CONSTANTS}.expanded_type then
								-- No mismatch, so we can ignore the dynamic type that was stored
							l_deser.read_compressed_integer_32.do_nothing
							decode_normal_object (a_reflected_object.expanded_field (l_new_offset))

						else
							check
								False
							end
						end
					else
							-- We are having a mismatch, so here we are going to record the info in `l_info'.
						if l_info = Void then
							create l_info.make (l_mismatch_info.old_count)
						end
						inspect abstract_type (l_field_info.old_attribute_type)
						when {REFLECTOR_CONSTANTS}.boolean_type then l_info.put (l_deser.read_boolean, l_field_info.new_name)
						when {REFLECTOR_CONSTANTS}.character_8_type then l_info.put (l_deser.read_character_8, l_field_info.new_name)
						when {REFLECTOR_CONSTANTS}.character_32_type then l_info.put (l_deser.read_character_32, l_field_info.new_name)

						when {REFLECTOR_CONSTANTS}.natural_8_type then l_info.put (l_deser.read_natural_8, l_field_info.new_name)
						when {REFLECTOR_CONSTANTS}.natural_16_type then l_info.put (l_deser.read_natural_16, l_field_info.new_name)
						when {REFLECTOR_CONSTANTS}.natural_32_type then l_info.put (l_deser.read_natural_32, l_field_info.new_name)
						when {REFLECTOR_CONSTANTS}.natural_64_type then l_info.put (l_deser.read_natural_64, l_field_info.new_name)

						when {REFLECTOR_CONSTANTS}.integer_8_type then l_info.put (l_deser.read_integer_8, l_field_info.new_name)
						when {REFLECTOR_CONSTANTS}.integer_16_type then l_info.put (l_deser.read_integer_16, l_field_info.new_name)
						when {REFLECTOR_CONSTANTS}.integer_32_type then l_info.put (l_deser.read_integer_32, l_field_info.new_name)
						when {REFLECTOR_CONSTANTS}.integer_64_type then l_info.put (l_deser.read_integer_64, l_field_info.new_name)

						when {REFLECTOR_CONSTANTS}.real_32_type then l_info.put (l_deser.read_real_32, l_field_info.new_name)
						when {REFLECTOR_CONSTANTS}.real_64_type then l_info.put (l_deser.read_real_64, l_field_info.new_name)

						when {REFLECTOR_CONSTANTS}.pointer_type then l_info.put (l_deser.read_pointer, l_field_info.new_name)

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
										l_info.put (l_exp.object, l_field_info.new_name)
									end
								else
									l_info.put (read_reference, l_field_info.new_name)
								end
							else
								l_info.put (read_reference, l_field_info.new_name)
							end

						when {REFLECTOR_CONSTANTS}.expanded_type then
								-- Get its dynamic type to create it since there was a mismatch.
							l_exp_dtype := new_dynamic_type_id (l_deser.read_compressed_integer_32)
							if l_exp_dtype < 0 then
									-- Data is visibly corrupted, stop here.
								raise_fatal_error (error_factory.new_internal_error ("Cannot read object type. Corrupted data!"))
							else
								create l_exp.make (reflector.new_instance_of (l_exp_dtype))
								decode_normal_object (l_exp)
								l_info.put (l_exp.object, l_field_info.new_name)
							end
						else
							check
								False
							end
						end
					end
					i := i + 1
				end
			end
			if l_info /= Void then
					-- There was a mismatch, we store it for later when trying
					-- to correct mismatches.
				mismatched_object.extend ([a_reflected_object.object, l_info])
			end
		end

feature {NONE} -- Cleaning

	clear_internal_data
			-- <Precursor>
		do
			Precursor {SED_BASIC_DESERIALIZER}
			attributes_mapping := Void
			mismatches.wipe_out
			mismatched_object.wipe_out
		end

note
	library:	"EiffelBase: Library of reusable components for Eiffel."
	copyright:	"Copyright (c) 1984-2020, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
