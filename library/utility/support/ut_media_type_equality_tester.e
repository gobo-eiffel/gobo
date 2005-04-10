indexing

	description:

	"Equality testers for media types"

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class UT_MEDIA_TYPE_EQUALITY_TESTER

inherit

	KL_EQUALITY_TESTER [UT_MEDIA_TYPE]
		redefine
			test
		end

feature -- Status report

	test (v, u: UT_MEDIA_TYPE): BOOLEAN is
			-- Are `v' and `u' considered equal?
			-- This version ignores all parameters.
		do
			if v = Void then
				Result := (u = Void)
			elseif u = Void then
				Result := False
			else
				Result := v.type.is_equal (u.type) and then v.subtype.is_equal (u.subtype)
			end
		end

end
