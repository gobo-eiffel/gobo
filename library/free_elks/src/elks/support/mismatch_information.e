note
	description: "Original values of the attributes of a mismatched object."
	instructions: "[
		This object will contain the original values of the attributes
		of a retrieved object for which a mismatched was detected at
		retrieval time. The value are indexed by the name of the attribute
		in the stored object. One extra entry is provided to contain the
		original name of the class in the storing system, indexed by the
		string 'class'. This allows `correct_mismatch' to determine the
		original name of its generating class in case class-name
		translation is in effect.
		]"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class MISMATCH_INFORMATION

inherit
	HASH_TABLE [detachable ANY, STRING_8]
		redefine
			default_create,
			out
		end

create {MISMATCH_CORRECTOR}
	default_create

create
	make

feature -- Initialization

	default_create
			-- Make container with default size
		do
			make (5)
			set_callback_pointers
		end

feature -- Access

	class_name: STRING_8
			-- Name of generating class which held attribute values
		do
			check
				has_class_entry: has (type_name_key)
			end
			check attached {STRING_8} item (type_name_key) as r then
				Result := r
			end
		ensure
			result_exists: Result /= Void
		end

	stored_version: detachable IMMUTABLE_STRING_8
			-- Version associated to `class_name' in the stored system.

	current_version: detachable IMMUTABLE_STRING_8
			-- Version associated to `class_name' in the current system.

	type_name_key: STRING_8 = "_type_name"
			-- Associated key for retrieving the type name of a mismatch.

feature -- Status report

	is_version_mismatched: BOOLEAN
			-- Is the `stored_version' different from the current system version?
		do
			Result := stored_version /~ current_version
		end

feature -- Settings

	set_versions (a_stored_version: like stored_version; a_current_version: like current_version)
			-- Set `stored_version' with `a_stored_version'.
			-- Set `current_version' with `a_current_version'.
		do
			stored_version := a_stored_version
			current_version := a_current_version
		ensure
			stored_version_set: stored_version = a_stored_version
			current_version_set: current_version = a_current_version
		end

feature -- Output

	out: STRING
			-- Printable representation of attributes values
		local
			i: detachable ANY
			k: detachable STRING
		do
			from
				create Result.make (20 + class_name.count + 40 * count)
				Result.append ("Attributes of original class ")
				Result.append (class_name)
				Result.append (": ")
				Result.append_integer (count - 1)
				Result.append (" item")
				if count - 1 /= 1 then Result.append_character ('s') end
				Result.append_character ('%N')
				start
			until
				after
			loop
				k := key_for_iteration
				if k /~ type_name_key then
					Result.append ("  ")
					if k = Void then
						Result.append ("Void")
					else
						Result.append (k)
					end
					Result.append (": ")
					i := item_for_iteration
					if i = Void then
						Result.append ("Void")
					else
						Result.append (i.out)
					end
					Result.append_character ('%N')
				end
				forth
			end
		end

feature {NONE} -- Implementation

	internal_put (value: ANY; ckey: POINTER)
			-- Allows run-time to insert items into table
		do
			put (value, create {STRING_8}.make_from_c (ckey))
		end

	set_string_versions (a_stored_version, a_current_version: POINTER)
			-- Set `stored_version' with `a_stored_version'.
			-- Set `current_version' with `a_current_version'.
		local
			l_imm: IMMUTABLE_STRING_8
		do
			if a_stored_version = default_pointer then
				stored_version := Void
			else
				create l_imm.make_from_c (a_stored_version)
				if l_imm.is_empty then
					stored_version := Void
				else
					stored_version := l_imm
				end
			end
			if a_current_version = default_pointer then
				current_version := Void
			else
				create l_imm.make_from_c (a_current_version)
				if l_imm.is_empty then
					current_version := Void
				else
					current_version := l_imm
				end
			end
		end

	set_callback_pointers
			-- Sets call-back pointers in the run-time
		once
			set_mismatch_information_access (Current, $wipe_out, $internal_put, $set_string_versions)
		end

feature {NONE} -- Externals

	set_mismatch_information_access (obj: ANY; init, add, set_vers: POINTER)
		external
			"C signature (EIF_OBJECT, EIF_PROCEDURE, EIF_PROCEDURE, EIF_PROCEDURE) use <eif_retrieve.h>"
		end

note
	copyright: "Copyright (c) 1984-2020, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
