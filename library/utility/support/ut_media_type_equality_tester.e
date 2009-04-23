indexing

	description:

		"Equality testers for media types"

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class UT_MEDIA_TYPE_EQUALITY_TESTER

inherit

	KL_EQUALITY_TESTER [UT_MEDIA_TYPE]
		redefine
			test
		end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

feature -- Status report

	test (v, u: ?UT_MEDIA_TYPE): BOOLEAN is
			-- Are `v' and `u' considered equal?
			-- This version ignores all parameters.
		do
			if v = u then
				Result := True
			elseif v = Void then
				Result := False
			elseif u = Void then
				Result := False
			else
				Result := STRING_.same_string (v.type, u.type) and then STRING_.same_string (v.subtype, u.subtype)
			end
		end

end
