indexing

	description:

		"Feature name equality testers"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_FEATURE_NAME_TESTER

inherit

	DS_EQUALITY_TESTER [ET_FEATURE_NAME]
		redefine
			test
		end

feature -- Status report

	test (v, u: ET_FEATURE_NAME): BOOLEAN is
			-- Are `v' and `u' considered equal?
		do
			if v = Void then
				Result := (u = Void)
			elseif u = Void then
				Result := False
			else
				Result := v.same_feature_name (u)
			end
		end

end -- class ET_FEATURE_NAME_TESTER
