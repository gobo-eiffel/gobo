note
	description: "Decoding of arbitrary objects graphs between sessions of programs %
		%containing the same types. It basically takes care of potential reordering %
		%of attributes from one system to the other."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date: 2020-05-19 14:29:33 +0000 (Tue, 19 May 2020) $"
	revision: "$Revision: 104259 $"

class
	SED_INDEPENDENT_DESERIALIZER

obsolete
	"Use SED_RECOVERABLE_DESERIALIZER instead."

inherit
	SED_BASIC_DESERIALIZER
		redefine
			read_header,
			new_attribute_offset,
			read_persistent_field_count,
			clear_internal_data,
			is_transient_retrieval_required,
			is_store_settings_enabled
		end

create
	make

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

feature {NONE} -- Status report

	is_transient_retrieval_required: BOOLEAN
			-- <Precursor>
		do
				-- We do not need transient attribute to be retrieved, only persistent one.			
			Result := False
		end

	is_store_settings_enabled: BOOLEAN
			-- <Precursor>
		do
			Result := False
		end

feature {NONE} -- Implementation

	read_header (a_count: NATURAL_32)
			-- Read header which contains mapping between dynamic type and their
			-- string representation.
		local
			i, j, nb: INTEGER
			l_deser: like deserializer
			l_reflector: like reflector
			l_table: like dynamic_type_table
			l_old_dtype, l_new_dtype: INTEGER
			l_type_str: STRING_8
		do
			l_reflector := reflector
			l_deser := deserializer

				-- Read various settings.
			read_settings

				-- Number of dynamic types in storable
			nb := l_deser.read_compressed_natural_32.to_integer_32
			create l_table.make_filled (0, nb)
			create attributes_mapping.make_filled (Void, nb)

				-- Read the 2 tables which will give us mapping between the old dynamic types
				-- and the new ones.
			from
				j := 0
			until
				j = 2
			loop
				from
					i := 0
				until
					i = nb
				loop
						-- Read old dynamic type
					l_old_dtype := l_deser.read_compressed_natural_32.to_integer_32

						-- Read type string associated to `l_old_dtype' and find dynamic type
						-- in current system.
					l_type_str := l_deser.read_string_8
					l_new_dtype := l_reflector.dynamic_type_from_string (l_type_str)
					if l_new_dtype >= 0 then
						if not l_table.valid_index (l_old_dtype) then
							l_table := l_table.aliased_resized_area_with_default (0, (l_old_dtype + 1).max (l_table.count * 2))
						end
						l_table.put (l_new_dtype, l_old_dtype)
					else
							-- It is a fatal error, but we still continue to make sure
							-- we collect all errors.
						add_error (error_factory.new_missing_type_error (l_type_str, l_type_str))
					end

					i := i + 1
				end
				if j = 0 then
					nb := l_deser.read_compressed_natural_32.to_integer_32
				end
				j := j + 1
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
		require
			a_dtype_non_negative: a_dtype >= 0
			attributes_mapping_not_void: attributes_mapping /= Void
		local
			l_deser: like deserializer
			l_map: like attributes_map
			l_mapping: SPECIAL [INTEGER]
			l_name: STRING_8
			l_old_dtype, l_dtype: INTEGER
			i, nb: INTEGER
			a: like attributes_mapping
			l_attribute_type: INTEGER
		do
			l_deser := deserializer

				-- Compare count of attributes
			nb := l_deser.read_compressed_natural_32.to_integer_32
			if nb = reflector.persistent_field_count_of_type (a_dtype) then
				from
					i := 1
					l_map := attributes_map (a_dtype)
					nb := nb + 1
					create l_mapping.make_empty (nb)
					l_mapping.extend (0)
				until
					i = nb
				loop
						-- Read attribute static type
					l_old_dtype := l_deser.read_compressed_natural_32.to_integer_32
					l_dtype := new_dynamic_type_id (l_old_dtype)
						-- Read attribute name
					l_name := l_deser.read_string_8
					if l_dtype >= 0 then
						if attached l_map.item (l_name) as l_item then
							l_attribute_type := l_item.dtype
							if l_attribute_type = l_dtype then
								l_mapping.extend (l_item.position)
							else
								add_error (error_factory.new_attribute_mismatch (a_dtype, l_name, l_attribute_type, l_dtype))
							end
						else
							add_error (error_factory.new_missing_attribute_error (a_dtype, l_name))
						end
					else
						add_error (error_factory.new_unknown_attribute_type_error (a_dtype, l_name))
					end
					i := i + 1
				end
				if not has_error then
					a := attributes_mapping
					if a /= Void then
						if not a.valid_index (a_dtype) then
							a := a.aliased_resized_area_with_default (Void, (a_dtype + 1).max (a.count * 2))
							attributes_mapping := a
						end
						a.put (l_mapping, a_dtype)
					end
				end
			else
					-- Stored type has a different number of attributes than the type
					-- from the retrieving system.
				add_error (error_factory.new_attribute_count_mismatch (a_dtype, nb))
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

feature {NONE} -- Cleaning

	clear_internal_data
			-- Clear all allocated data
		do
			Precursor {SED_BASIC_DESERIALIZER}
			attributes_mapping := Void
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
