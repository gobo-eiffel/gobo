note
	description: "Factory for creating SYSTEM_STRING instances."
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date: 2012-11-30 00:31:24 +0100 (Fri, 30 Nov 2012) $"
	revision: "$Revision: 628 $"

class
	SYSTEM_STRING_FACTORY

feature -- Conversion

	from_string_to_system_string (a_str: READABLE_STRING_GENERAL): SYSTEM_STRING
			-- Convert `a_str' to an instance of SYSTEM_STRING.
		require
			is_dotnet: {PLATFORM}.is_dotnet
			a_str_not_void: a_str /= Void
		do
			create Result
		ensure
			from_string_to_system_string_not_void: Result /= Void
		end

	read_system_string_into (a_str: SYSTEM_STRING; a_result: STRING_GENERAL)
			-- Fill `a_result' with `a_str' content.
		require
			is_dotnet: {PLATFORM}.is_dotnet
			a_str_not_void: a_str /= Void
			a_result_not_void: a_result /= Void
			a_result_valid: a_result.count = a_str.length
		do
		end

	read_system_string_into_area_8 (a_str: SYSTEM_STRING; a_area: SPECIAL [CHARACTER_8])
			-- Fill `a_result' with `a_str' content.
		require
			is_dotnet: {PLATFORM}.is_dotnet
			a_str_not_void: a_str /= Void
			a_area_not_void: a_area /= Void
			a_area_valid: a_area.count >= a_str.length
		do
		end

	read_system_string_into_area_32 (a_str: SYSTEM_STRING; a_area: SPECIAL [CHARACTER_32])
			-- Fill `a_area' with `a_str' content.
		require
			is_dotnet: {PLATFORM}.is_dotnet
			a_str_not_void: a_str /= Void
			a_area_not_void: a_area /= Void
			a_area_valid: a_area.count >= a_str.length
		do
		end

	escape_count (a_str: SYSTEM_STRING): INTEGER
			-- Number of `escape_character' in `a_str'.
		require
			is_dotnet: {PLATFORM}.is_dotnet
		do
		end

note
	copyright: "Copyright (c) 1984-2012, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
