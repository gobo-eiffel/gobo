note
	description: "System encodings, windows implementation"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	SYSTEM_ENCODINGS_IMP

inherit
	SYSTEM_ENCODINGS_I

feature -- Access

	system_code_page: STRING_8
			-- System code page
			-- Take oem as default
		local
			l_result: STRING_32
		do
			l_result := extract_locale_string (system_locale,
											LOCALE_IDEFAULTANSICODEPAGE,
											locale_idefaultansicodepage_maxlen)
			check valid_string_8: l_result.is_valid_as_string_8 end
			create Result.make (l_result.count)
			Result.append_string_general (l_result)
		end

	console_code_page: STRING_8
			-- Console code page
		local
			code_page: like console_input_code_page
		do
			code_page := console_output_code_page
			if code_page = 0 then
				code_page := console_input_code_page
				if code_page = 0 then
					code_page := oem_code_page
				end
			end
			create Result.make (5)
			Result.append_natural_32 (code_page)
		end

	iso_8859_1_code_page: STRING_8 = "28591"

feature {NONE} -- NLS LC CTYPE CONSTANTS

	LOCALE_IDEFAULTCODEPAGE: INTEGER 			=  	0x0000000B   -- default oem code page
	locale_idefaultcodepage_maxlen: INTEGER 	= 	6
	LOCALE_IDEFAULTANSICODEPAGE: INTEGER 		= 	0x00001004   -- default ansi code page
	locale_idefaultansicodepage_maxlen: INTEGER = 	6
	LOCALE_IDEFAULTMACCODEPAGE: INTEGER 		=	0x00001011   -- default mac code page
	locale_idefaultmaccodepage_maxlen: INTEGER 	= 	6

feature -- Code pages

	console_input_code_page: NATURAL_32
			-- Input code page of the console.
		external
			"C inline use <windows.h>"
		alias
			"return (EIF_NATURAL_32) GetConsoleCP ();"
		ensure
			is_class: class
		end

	console_output_code_page: NATURAL_32
			-- Output code page of the console.
		external
			"C inline use <windows.h>"
		alias
			"return (EIF_NATURAL_32) GetConsoleOutputCP ();"
		ensure
			is_class: class
		end

	set_console_input_code_page (cp: NATURAL_32): BOOLEAN
			-- Set input code page of the console to `cp`.
			-- Return True on success and False on error.
			-- Use `get_last_error` to get extended error information.
		external
			"C inline use <windows.h>"
		alias
			"return EIF_TEST (SetConsoleCP ((UINT) $cp));"
		ensure
			is_class: class
		end

	set_console_output_code_page (cp: NATURAL_32): BOOLEAN
			-- Set output code page of the console to `cp`.
			-- Return True on success and False on error.
			-- Use `get_last_error` to get extended error information.
		external
			"C inline use <windows.h>"
		alias
			"return EIF_TEST (SetConsoleOutputCP ((UINT) $cp));"
		ensure
			is_class: class
		end


	oem_code_page: NATURAL_32
			-- The current OEM code page identifier for the operating system.
			-- The OEM code page is used for conversion from MS-DOS-based, text-mode applications.
		external
			"C inline use <Winnls.h>"
		alias
			"return (EIF_NATURAL_32) GetOEMCP ();"
		ensure
			is_class: class
		end

	ansi_code_page: NATURAL_32
			-- The current Windows ANSI code page (ACP) identifier for the operating system.
		external
			"C inline use <Winnls.h>"
		alias
			"return (EIF_NATURAL_32) GetACP ();"
		ensure
			is_class: class
		end

feature {NONE} -- Implementation

	extract_locale_string(lcid: INTEGER; lc_ctype: INTEGER; bufferlen: INTEGER): STRING_32
		local
			l_pointer: MANAGED_POINTER
			l_int: INTEGER
		do
			create l_pointer.make (c_tchar_length * bufferlen)
			l_int := c_extract_locale_string(lcid, lc_ctype, l_pointer.item, l_pointer.count)
			Result := {ENCODING_HELPER}.pointer_to_wide_string (l_pointer.item, l_int * c_tchar_length)
			if Result [Result.count].code = 0 then
					-- Remove trailing zero.
				Result.remove (Result.count)
			end
		end

	c_extract_locale_string(lcid: INTEGER; lc_ctype: INTEGER; a_pointer: POINTER; a_len: INTEGER): INTEGER
		external
			"C inline use <windows.h>"
		alias
			"return GetLocaleInfo((LCID) $lcid, (LCTYPE) $lc_ctype, $a_pointer, (int) $a_len);"
		end

	c_tchar_length: INTEGER
			-- Lenth of TCHAR.
		external
			"C inline use <windows.h>"
		alias
			"return sizeof(TCHAR);"
		end

	system_locale: INTEGER
			-- Encapsulation of GetSystemDefaultLCID
		external
			"C (): LCID | <windows.h>"
		alias
			"GetSystemDefaultLCID"
		end

	user_locale: INTEGER
			-- Encapsulation of GetUserDefaultLCID
		external
			"C (): LCID| <windows.h>"
		alias
			"GetUserDefaultLCID"
		end

invariant
	correct_locale_idefaultcodepage_maxlen:
		c_extract_locale_string (system_locale, LOCALE_IDEFAULTCODEPAGE, default_pointer, 0) <= locale_idefaultcodepage_maxlen
	correct_locale_idefaultansicodepage_maxlen:
		c_extract_locale_string (system_locale, LOCALE_IDEFAULTANSICODEPAGE, default_pointer, 0) <= locale_idefaultansicodepage_maxlen
	correct_locale_idefaultmaccodepage_maxlen:
		c_extract_locale_string (system_locale, LOCALE_IDEFAULTMACCODEPAGE, default_pointer, 0) <= locale_idefaultmaccodepage_maxlen

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
