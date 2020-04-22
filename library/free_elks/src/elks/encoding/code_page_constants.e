note
	description: "Code page constants for general encodings"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	CODE_PAGE_CONSTANTS

feature -- Access

	utf7: STRING = "UTF-7"

	utf8: STRING = "UTF-8"

	utf16: STRING = "UTF-16"

	utf32: STRING = "UTF-32";
		-- UCS-4 and UTF-32 are functionally identical since ISO 10646..

feature -- Little/Big endian

	utf16_le: STRING = "UTF-16LE"
	utf32_le: STRING = "UTF-32LE"

	utf16_be: STRING = "UTF-16BE"
	utf32_be: STRING = "UTF-32BE";

note
	library:   "Encoding: Library of reusable components for Eiffel."
	copyright: "Copyright (c) 1984-2009, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			 Eiffel Software
			 5949 Hollister Ave., Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"



end
