note
	description: "Simple representation of a SED error"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	author: "Julian Rogers"
	last_editor: "$Author: alexk $"
	date: "$Date: 2017-03-23 19:18:26 +0000 (Thu, 23 Mar 2017) $"
	revision: "$Revision: 100033 $"

class
	SED_ERROR

create {SED_ERROR_FACTORY}
	make_with_string

feature {NONE} -- Initialization

	make_with_string (a_string: READABLE_STRING_GENERAL)
			-- Create `Current' and set `error' to `a_string'.
		do
			create message.make_from_string_general (a_string)
		ensure
			error_set: message.same_string_general (a_string)
		end

feature -- Access

	error: STRING
			-- Error
		obsolete
			"Use `message' instead. [2017-05-31]"
		do
			Result := message.as_string_8
		end

	message: STRING_32;
			-- Message of the error.

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
