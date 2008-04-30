indexing

	description:

		"Equality testers for Eiffel features with their target base type"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_TARGETED_FEATURE_TESTER

inherit

	KL_EQUALITY_TESTER [ET_TARGETED_FEATURE]
		redefine
			test
		end

feature -- Status report

	test (v, u: ET_TARGETED_FEATURE): BOOLEAN is
			-- Are `v' and `u' considered equal?
		do
			if v = u then
				Result := True
			elseif v = Void then
				Result := False
			elseif u = Void then
				Result := False
			else
				Result := v.same_targeted_feature (u)
			end
		end

end
