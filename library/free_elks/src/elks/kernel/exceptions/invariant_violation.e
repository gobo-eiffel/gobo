note
	description: "[
		Exception representing an invariant violation
		]"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	INVARIANT_VIOLATION

inherit
	ASSERTION_VIOLATION

feature -- Access

	frozen code: INTEGER
			-- Exception code
		do
			Result := {EXCEP_CONST}.class_invariant
		end

feature {EXCEPTION_MANAGER} -- Element change

	frozen set_is_entry (a_is_entry: BOOLEAN)
			-- Set `is_entry' with `a_is_entry'.
		do
			is_entry := a_is_entry
		ensure
			is_entry_set: is_entry = a_is_entry
		end

	tag: IMMUTABLE_STRING_32
			-- <Precursor>
		once
			create Result.make_from_string_8 ("Class invariant violated.")
		end

feature -- Status report

	frozen is_entry: BOOLEAN;
			-- Is current invariant entry violation? Otherwise, invariant exit violation.

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
