note
	description: "[
		Exception raised when $ is applied to melted feature
		]"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2006, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2013-05-20 16:15:17 -0700 (Mon, 20 May 2013) $"
	revision: "$Revision: 92557 $"

class
	ADDRESS_APPLIED_TO_MELTED_FEATURE

inherit
	EIFFELSTUDIO_SPECIFIC_LANGUAGE_EXCEPTION

feature -- Access

	frozen code: INTEGER
			-- Exception code
		do
			Result := {EXCEP_CONST}.dollar_applied_to_melted_feature
		end

	tag: IMMUTABLE_STRING_32
			-- <Precursor>
		once
			create Result.make_from_string_8 ("CECIL cannot call melted code.")
		end

end
