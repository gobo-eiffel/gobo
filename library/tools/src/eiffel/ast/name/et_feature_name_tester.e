note

	description:

		"Feature name equality testers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_FEATURE_NAME_TESTER

inherit

	KL_EQUALITY_TESTER [ET_FEATURE_NAME]
		redefine
			test
		end

feature -- Status report

	test (v, u: ET_FEATURE_NAME): BOOLEAN
			-- Are `v' and `u' considered equal?
		do
			if v = u then
				Result := True
			elseif v = Void then
				Result := False
			elseif u = Void then
				Result := False
			else
				Result := v.same_feature_name (u)
			end
		end

end
