note
	description: "Objects that represent encodings and that provide conversion methods."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	ENCODING

create
	make

feature {NONE} -- Initialization

	make (a_code_page: READABLE_STRING_8)
			-- Set `code_page` with `a_code_page`
			-- `a_code_page` should be valid, either it is from CODE_PAGE_CONSTANTS
			-- or dynamically from i18n library.
			-- Other names of code page/character set are not guaranteed valid for all platforms,
			-- though they would work on certain platforms.
		require
			a_code_page_not_void: a_code_page /= Void
			a_code_page_not_empty: not a_code_page.is_empty
		do
			code_page := a_code_page
			encoding_i := regular_encoding_imp
		end

feature -- Access

	code_page: READABLE_STRING_8
			-- Code page/Character set name.
			-- Immutable name.	

	last_converted_stream: STRING_8
			-- Stream representation of last converted string.
			-- Note: Original string object could be returned directly.
		require
			last_conversion_successful: last_conversion_successful
		do
			Result := encoding_i.last_converted_stream
		ensure
			last_converted_stream_not_void: Result /= Void
		end

	last_converted_string_8: STRING_8
			-- Last converted string.
			-- Note: Original string object could be returned directly.
		require
			last_conversion_successful: last_conversion_successful
		do
				-- Implied from the precondition and postcondition of `encoding_i.convert_to`
			Result := last_converted_stream
		ensure
			last_converted_string_not_void: Result /= Void
		end

	last_converted_string_32: STRING_32
			-- Last converted string.
			-- Note: Original string object could be returned directly.
		require
			last_conversion_successful: last_conversion_successful
		do
				-- Implied from the precondition and postcondition of `encoding_i.convert_to`
			Result := last_converted_string.as_string_32
		ensure
			last_converted_string_not_void: Result /= Void
		end

	last_converted_string: READABLE_STRING_GENERAL
			-- Last converted string.
			-- Note: Original string object could be returned directly.
		require
			last_conversion_successful: last_conversion_successful
		do
			check attached encoding_i.last_converted_string as str then
					-- Implied from the precondition and postcondition of `encoding_i.convert_to`
				Result := str
			end
		ensure
			last_converted_string_not_void: Result /= Void
		end

feature -- Conversion

	convert_to (a_to_encoding: ENCODING; a_string: READABLE_STRING_GENERAL)
			-- Convert `a_string` from current encoding to `a_to_encoding`.
			-- If either current or `a_to_encoding` is not `is_valid`, or an error occurs during conversion,
			-- `last_conversion_successful` is unset.
			-- Conversion result can be retrieved via `last_converted_string` or `last_converted_stream`.
		require
			a_to_encoding_not_void: a_to_encoding /= Void
			a_string_not_void: a_string /= Void
		local
			l_is_unicode_conversion: BOOLEAN
			l_unicode_conversion: ENCODING_I
		do
			l_unicode_conversion := unicode_conversion
			if
				l_unicode_conversion.is_code_page_convertible (code_page, a_to_encoding.code_page)
			then
				encoding_i := l_unicode_conversion
				l_is_unicode_conversion := True
			else
				encoding_i := regular_encoding_imp
			end

			encoding_i.reset
			if l_is_unicode_conversion then
				encoding_i.convert_to (code_page, a_string, a_to_encoding.code_page)
			elseif a_to_encoding.is_valid and then is_valid and then is_conversion_possible (a_to_encoding) then
				encoding_i.convert_to (code_page, a_string, a_to_encoding.code_page)
			end
		end

feature -- Status report

	last_conversion_successful: BOOLEAN
			-- Was last conversion successful?
		do
			Result := encoding_i.last_conversion_successful
		end

	last_conversion_lost_data: BOOLEAN
			-- Has last conversion between two encodings lost data?
		do
			Result := encoding_i.last_conversion_lost_data
		end

feature -- Comparison

	same_as (other: ENCODING): BOOLEAN
			-- Is Current same encoding as `other`?
		do
			Result := code_page.is_case_insensitive_equal (other.code_page)
		end

feature {ENCODING} -- Status report

	is_valid: BOOLEAN
			-- Is current valid?
		do
			Result := regular_encoding_imp.is_code_page_valid (code_page)
		end

	is_conversion_possible (a_to_encoding: ENCODING): BOOLEAN
			-- Is conversion possible?
		require
			a_to_encoding_not_void: a_to_encoding /= Void
			a_to_encoding_valid: a_to_encoding.is_valid
			is_valid: is_valid
		do
			Result := regular_encoding_imp.is_code_page_convertible (code_page, a_to_encoding.code_page)
		end

feature {NONE} -- Implementation

	encoding_i: ENCODING_I
			-- Current encoding implementation

	unicode_conversion: ENCODING_I
			-- Unicode conversion
		once
			create {UNICODE_CONVERSION} Result
		end

	regular_encoding_imp: ENCODING_I
			-- Regular encoding implementation (Distinguished from Unicode conversion)
		once
			create {ENCODING_IMP} Result
		end

invariant
	code_page_not_void: code_page /= Void
	encoding_i_not_void: encoding_i /= Void

note
	library:   "Base: Library of reusable components for Eiffel."
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
