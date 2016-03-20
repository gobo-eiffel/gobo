note
	description: "[
			Exception for retrieval error, 
			may be raised by `retrieved' in `IO_MEDIUM'.
		]"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2006, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2013-05-20 16:15:17 -0700 (Mon, 20 May 2013) $"
	revision: "$Revision: 92557 $"

class
	SERIALIZATION_FAILURE

inherit
	DATA_EXCEPTION

feature -- Access

	frozen code: INTEGER
			-- Exception code
		do
			Result := {EXCEP_CONST}.serialization_exception
		end

	tag: IMMUTABLE_STRING_32
			-- <Precursor>
		once
			create Result.make_from_string_8 ("Serialization failed.")
		end

end
