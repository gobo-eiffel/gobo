note
	description: "Available encodings in the operating system."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	SYSTEM_ENCODINGS

feature -- Access

	system_encoding: ENCODING
			-- System encoding.
		once
			create Result.make (system_encodings_i.system_code_page)
		ensure
			instance_free: class
			system_encoding_not_void: Result /= Void
		end

	console_encoding: ENCODING
			-- Console encoding.
		once
			create Result.make (system_encodings_i.console_code_page)
		ensure
			instance_free: class
			console_encoding_not_void: Result /= Void
		end

	utf8: ENCODING
			-- UTF8 Encoding.
		once
			create Result.make ({CODE_PAGE_CONSTANTS}.utf8)
		ensure
			instance_free: class
			utf8_not_void: Result /= Void
		end

	utf16: ENCODING
			-- UTF16 Encoding.
		once
			create Result.make ({CODE_PAGE_CONSTANTS}.utf16)
		ensure
			instance_free: class
			utf16_not_void: Result /= Void
		end

	utf32: ENCODING
			-- UTF32 Encoding.
		once
			create Result.make ({CODE_PAGE_CONSTANTS}.utf32)
		ensure
			instance_free: class
			utf32_not_void: Result /= Void
		end

	iso_8859_1: ENCODING
			-- ISO-8859-1 encoding.
		once
			create Result.make (system_encodings_i.iso_8859_1_code_page)
		ensure
			instance_free: class
		end

feature {NONE} -- Implementation

	system_encodings_i: SYSTEM_ENCODINGS_I
			-- Implementation bridge.
		once
			create {SYSTEM_ENCODINGS_IMP} Result
		ensure
			instance_free: class
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
