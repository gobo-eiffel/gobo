note

	description:

		"Alias name equality testers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ALIAS_NAME_TESTER

inherit

	KL_EQUALITY_TESTER [ET_ALIAS_NAME]
		redefine
			test
		end

feature -- Status report

	test (v, u: ET_ALIAS_NAME): BOOLEAN
			-- Are `v' and `u' considered equal?
			-- (Take infix and prefix properties into account.)
		do
			if v = u then
				Result := True
			elseif v = Void then
				Result := False
			elseif u = Void then
				Result := False
			else
				Result := v.same_call_name (u)
			end
		end

end
