note
	description: "[
		Ancestor of all classes that need facility to retrieve an older version of an instance of current
		class through storable.
		Redefine `correct_mismatch' to get data from `mismatch_information' about found mismatch. A mismatch
		might be the addition or the removal of an attribute as well as an attribute type change.
		]"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	MISMATCH_CORRECTOR

feature -- Correction

	correct_mismatch
			-- Attempt to correct object mismatch using `mismatch_information'.
		local
			l_msg: STRING_32
			l_exc: EXCEPTIONS
		do
				-- If it is not redefined then we raise an exception.
			create l_msg.make_from_string_general ("Mismatch: ")
			create l_exc
			l_msg.append (generating_type.name_32)
			l_exc.raise_retrieval_exception (l_msg)
		end

	mismatch_information: MISMATCH_INFORMATION
			-- Original attribute values of mismatched object
		once
			create Result
		end

note
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
