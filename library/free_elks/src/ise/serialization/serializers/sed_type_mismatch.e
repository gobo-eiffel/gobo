note
	description: "Store all information about a mismatch in a type."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date: 2020-05-19 14:29:33 +0000 (Tue, 19 May 2020) $"
	revision: "$Revision: 104259 $"

class
	SED_TYPE_MISMATCH

create
	make

feature {NONE} -- Initialization

	make (a_type_id: INTEGER)
			-- Mismatch for dynamic type `a_type_id' in retrieving system.
		require
			type_id_non_negative: a_type_id >= 0
		local
			l_attribute_count: INTEGER
		do
			type_id := a_type_id
				-- Assume that all attributes have a mismatch
			l_attribute_count := internal.field_count_of_type (type_id)
			create mismatches_by_name.make (l_attribute_count)
			create mismatches_by_stored_position.make (l_attribute_count)
		ensure
			type_id_set: type_id = a_type_id
		end

feature -- Element change

	add_new_attribute_mismatch (a_added_attribute_count: INTEGER)
			-- Mismatch when new attributes have been added
		require
			a_added_attribute_count_positive: a_added_attribute_count > 0
		do
			has_new_attribute := True
		end

	add_attribute_count_mismatch (a_old_count, a_new_count: INTEGER)
			-- Mismatch where there is `a_old_count' attributes in the original system
			-- and `a_new_count' attributes in the retrieving system.
		require
			old_count_non_negative: a_old_count >= 0
			new_count_non_negative: a_new_count >= 0
		do
			old_count := a_old_count
			new_count := a_new_count
		ensure
			old_count_set: old_count = a_old_count
			new_count_set: new_count = a_new_count
		end

	add_version_mismatch (a_old_version, a_new_version: detachable IMMUTABLE_STRING_8)
			-- Mismatch where the original system as a version `a_old_version' which differs
			-- from the version `a_new_version' in the retrieving system.
		require
			different_version: a_old_version /~ a_new_version
		do
			old_version := a_old_version
			new_version := a_new_version
			has_version_mismatch := True
		ensure
			old_version_set: old_version = a_old_version
			new_version_set: new_version = a_new_version
			version_mismatched: has_version_mismatch
		end

	add_attribute_mismatch (a_old_attr_type, a_new_attr_type: INTEGER; a_old_name, a_new_name: STRING_8; a_old_pos, a_new_pos: INTEGER)
			-- Mismatch for `a_old_name' where the new name is `a_new_name', the new type
			-- `a_new_attr_type' is different from `a_old_attr_type' stored at position
			-- `a_old_pos' in the stored system for a `a_new_pos' in the retrieving system.
		require
			a_old_attr_type_non_negative: a_old_attr_type >= 0
			a_new_attr_type_non_negative: a_new_attr_type >= 0
			a_old_name_attached: a_old_name /= Void
			a_new_name_attached: a_new_name /= Void
			a_old_pos_positive: a_old_pos > 0
			a_new_pos_positive: a_new_pos > 0
		local
			l_info: like attribute_info
		do
			l_info := [a_old_name, a_new_name, a_old_attr_type, a_new_attr_type, a_old_pos, a_new_pos, True, False, False]
			mismatches_by_name.put (l_info, a_new_name)
			mismatches_by_stored_position.put (l_info, a_old_pos)
		end

	add_void_safe_mismatch (a_old_attr_type, a_new_attr_type: INTEGER; a_old_name, a_new_name: STRING_8; a_old_pos, a_new_pos: INTEGER)
			-- Mismatch for `a_old_name' where the new name is `a_new_name', the new type
			-- `a_new_attr_type' is attached and `a_old_attr_type' is detachable stored at position
			-- `a_old_pos' in the stored system for a `a_new_pos' in the retrieving system.
		require
			a_old_attr_type_non_negative: a_old_attr_type >= 0
			a_new_attr_type_non_negative: a_new_attr_type >= 0
			a_old_name_attached: a_old_name /= Void
			a_new_name_attached: a_new_name /= Void
			a_old_pos_positive: a_old_pos > 0
			a_new_pos_positive: a_new_pos > 0
		local
			l_info: like attribute_info
		do
			l_info := [a_old_name, a_new_name, a_old_attr_type, a_new_attr_type, a_old_pos, a_new_pos, False, False, True]
			mismatches_by_name.put (l_info, a_new_name)
			mismatches_by_stored_position.put (l_info, a_old_pos)
		end

	add_removed_attribute (a_old_attr_type: INTEGER; a_old_name, a_new_name: STRING_8; a_old_pos: INTEGER)
			-- Attribute `a_name' of type `a_old_attr_type' at position `a_old_pos' in
			-- the stored system is now missing from Current.
		require
			a_old_attr_type_non_negative: a_old_attr_type >= 0
			a_old_name_attached: a_old_name /= Void
			a_new_name_attached: a_new_name /= Void
			a_old_pos_positive: a_old_pos > 0
		local
			l_info: like attribute_info
		do
			l_info := [a_old_name, a_new_name, a_old_attr_type, -1, a_old_pos, -1, False, True, False]
			mismatches_by_name.put (l_info, a_new_name)
			mismatches_by_stored_position.put (l_info, a_old_pos)
		end

feature -- Status report

	has_version_mismatch: BOOLEAN
			-- Do we have a mismatch in versioning?

	has_new_attribute: BOOLEAN
			-- Do we have new attributes that did not exist in the stored system?

	has_new_attached_attribute: BOOLEAN
			-- Do we have new attached attributes that did not exist in the stored system?

feature -- Access

	type_id: INTEGER
			-- Type ID for type having the mismatch

	old_count, new_count: INTEGER
			-- Number of attributes in original system and retrieving system.

	old_version, new_version: detachable IMMUTABLE_STRING_8
			-- Version in stored system and retrieving system.

	mismatches_by_name: HASH_TABLE [like attribute_info, STRING_8]
			-- Store information about mismatch based on the attribute name.

	mismatches_by_stored_position: HASH_TABLE [like attribute_info, INTEGER]
			-- Store information about mismatch based on the store position.

	attribute_info: TUPLE [old_name, new_name: STRING_8; old_attribute_type, new_attribute_type, old_position, new_position: INTEGER; is_changed, is_removed, is_attachment_check_required: BOOLEAN]
			-- For typing purposes.
		require
			callable: False
		do
			check False then
			end
		end

feature {NONE} -- Implementation

	internal: REFLECTOR
			-- To query type properties.
		once
			create Result
		end

invariant
	type_id_non_negative: type_id >= 0
	counts_non_negative: old_count >= 0 and new_count >= 0

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
