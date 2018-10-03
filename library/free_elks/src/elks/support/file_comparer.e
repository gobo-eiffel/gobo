note
	description: "Find out if two paths corresponds to exactly the same file."
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	FILE_COMPARER

obsolete
	"Use `{PATH}.is_same_file_as' instead."

inherit
	NATIVE_STRING_HANDLER

feature -- Comparison

	same_files (a_path1, a_path2: READABLE_STRING_GENERAL): BOOLEAN
			-- Are `a_path1' and `a_path1'
		obsolete
			"Use `{PATH}.is_same_file_as' instead. [2017-05-31]"
		require
			a_path1_not_void: a_path1 /= Void
			a_path1_not_empty: not a_path1.is_empty
			a_path2_not_void: a_path2 /= Void
			a_path2_not_empty: not a_path2.is_empty
		do
			Result := (create {PATH}.make_from_string (a_path1)).is_same_file_as (create {PATH}.make_from_string (a_path2))
		ensure
			instance_free: class
		end

note
	copyright: "Copyright (c) 1984-2018, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
