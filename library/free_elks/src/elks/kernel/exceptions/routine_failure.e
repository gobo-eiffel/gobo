note
	description: "[
		Exception representing a routine failure.
		]"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date: 2012-12-26 18:57:50 -0800 (Wed, 26 Dec 2012) $"
	revision: "$Revision: 92096 $"

class
	ROUTINE_FAILURE

inherit
	LANGUAGE_EXCEPTION

feature -- Access

	routine_name: detachable STRING
			-- Name of the failing routine

	class_name: detachable STRING
			-- Class of the failure

	frozen code: INTEGER
			-- Exception code
		do
			Result := {EXCEP_CONST}.routine_failure
		end

	tag: IMMUTABLE_STRING_32
			-- <Precursor>
		once
			create Result.make_from_string_8 ("Routine failure.")
		end

feature {EXCEPTION_MANAGER} -- Element change

	frozen set_routine_name (a_routine_name: like routine_name)
			-- Set `routine_name' with `a_routine_name'
		do
			routine_name := a_routine_name
		ensure
			routine_name_set: routine_name = a_routine_name
		end

	frozen set_class_name (a_class_name: like class_name)
			-- Set `class_name' with `a_class_name'
		do
			class_name := a_class_name
		ensure
			class_name_set: class_name = a_class_name
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
