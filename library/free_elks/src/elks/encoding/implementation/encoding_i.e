note
	description: "Interfaces of encoding conversion."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

deferred class
	ENCODING_I

inherit
	ANY

	ENCODING_HELPER
		export
			{NONE} all
		end

feature {ENCODING} -- String encoding convertion

	convert_to (a_from_code_page: READABLE_STRING_8; a_from_string: READABLE_STRING_GENERAL; a_to_code_page: READABLE_STRING_8)
			-- Convert `a_from_string` of `a_from_code_page` to a string of `a_to_code_page`.
		require
			a_from_code_page_valid: is_code_page_valid (a_from_code_page)
			a_to_code_page_valid: is_code_page_valid (a_to_code_page)
			code_page_convertible: is_code_page_convertible (a_from_code_page, a_to_code_page)
			a_from_string_not_void: a_from_string /= Void
		deferred
		ensure
			success_implies_not_void: last_conversion_successful implies last_converted_stream /= Void
			success_implies_not_void: last_conversion_successful implies last_converted_string /= Void
		end

feature {ENCODING} -- Reset

	reset
			-- Reset
		do
			last_converted_string := Void
			last_conversion_successful := False
			last_was_wide_string := False
		ensure
			last_converted_string_reset: last_converted_string = Void
			last_conversion_successful_reset: not last_conversion_successful
		end

feature {ENCODING} -- Access

	last_converted_stream: STRING_8
			-- Stream prepresentation of last converted string.
		require
			last_conversion_successful: last_conversion_successful
		do
			check
				from_precondition: attached last_converted_string as l_last
			then
				if last_was_wide_string then
					Result := string_16_to_stream (l_last.as_string_32)
				else
					Result := string_general_to_stream (l_last)
				end
			end
		ensure
			last_converted_stream_not_void: Result /= Void
		end

	last_converted_string_8: STRING_8
		require
			last_conversion_successful: last_conversion_successful
			not_wide: not last_was_wide_string
		do
			check attached last_converted_string as l_string then
				Result := string_general_to_stream (l_string)
			end
		ensure
			last_converted_stream_not_void: Result /= Void
		end

	last_converted_string: detachable READABLE_STRING_GENERAL
			-- Last converted string.

feature {ENCODING} -- Status report

	is_code_page_valid (a_code_page: READABLE_STRING_8): BOOLEAN
			-- Is `a_code_page` valid?
		deferred
		end

	is_code_page_convertable (a_from_code_page, a_to_code_page: READABLE_STRING_8): BOOLEAN
			-- Is `a_from_code_page` convertible to `a_to_code_page`.
		obsolete
			"Use is_code_page_convertible [2020-04-22]"
		do
			Result := is_code_page_convertible (a_from_code_page, a_to_code_page)
		end

	is_code_page_convertible (a_from_code_page, a_to_code_page: READABLE_STRING_8): BOOLEAN
			-- Is `a_from_code_page` convertible to `a_to_code_page`.
		deferred
		end

	last_conversion_lost_data: BOOLEAN
			-- Has last conversion between two encodings lost data?
		deferred
		end

	last_conversion_successful: BOOLEAN
			-- Was last conversion successful?

	last_was_wide_string: BOOLEAN
			-- Last conversion result was wide string?

;note
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
