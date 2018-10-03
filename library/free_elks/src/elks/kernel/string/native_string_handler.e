note
	description: "Objects that can access low level features of `{FILE_INFO}' to access the underlying operating system encoding of file names."
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	NATIVE_STRING_HANDLER

feature {NATIVE_STRING_HANDLER} -- Access

	pointer_length_in_bytes (a_ptr: POINTER): INTEGER
			-- Length in bytes of a platform specific file name pointer, not
			-- including the null-terminating character. If size is too large
			-- to fit into an {INTEGER} instance, the size is truncated to
			-- `{INTEGER_32}.max_value'.
		require
			a_ptr_not_null: a_ptr /= default_pointer
		local
			l_length: NATURAL_64
		do
			l_length := c_pointer_length_in_bytes (a_ptr)
			if l_length <= {INTEGER_32}.max_value.to_natural_64 then
				Result := l_length.to_integer_32
			else
				Result := {INTEGER_32}.max_value
			end
		end

feature {NONE} -- Implementation

	c_pointer_length_in_bytes (a_ptr: POINTER): NATURAL_64
			-- Length in bytes of a platform specific file name pointer, not
			-- including the null-terminating character.
		require
			a_ptr_not_null: a_ptr /= default_pointer
		external
			"C inline use %"eif_eiffel.h%""
		alias
			"{
			#ifdef EIF_WINDOWS
				return (EIF_NATURAL_64) wcslen($a_ptr) * sizeof(wchar_t);
			#else
				return (EIF_NATURAL_64) strlen($a_ptr) * sizeof(char);
			#endif
			}"
		end;

note
	copyright: "Copyright (c) 1984-2012, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
