note
	description: "System encoding implementation inferfaces"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

deferred class
	SYSTEM_ENCODINGS_I

feature -- Access

	system_code_page: STRING_8
			-- System code page/charset
		deferred
		end

	console_code_page: STRING_8
			-- Console code page/charset
		deferred
		end

	iso_8859_1_code_page: STRING_8
			-- ISO-8859-1 encoding.
		deferred
		end

note
	library:   "Encoding: Library of reusable components for Eiffel."
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
