indexing

	description:

		"UTF-16 encoding routines"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class UC_UTF16_ROUTINES

feature -- Status report

	valid_utf16 (a_string: STRING): BOOLEAN is
			-- Are the bytes in `a_string' a valid UTF-16 encoding?
			-- TODO: surrogate characters not supported yet.
		require
			a_string_not_void: a_string /= Void
			a_string_is_string: a_string.same_type ("")
		do
			Result := (a_string.count \\ 2) = 0
		end

end
