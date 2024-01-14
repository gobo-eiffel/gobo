note

	description:

		"Identifier equality testers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"

class ET_IDENTIFIER_TESTER

inherit

	KL_EQUALITY_TESTER [ET_IDENTIFIER]
		redefine
			test
		end

feature -- Status report

	test (v, u: ET_IDENTIFIER): BOOLEAN
			-- Are `v' and `u' considered equal?
		do
			if v = u then
				Result := True
			elseif v = Void then
				Result := False
			elseif u = Void then
				Result := False
			else
				Result := v.same_identifier (u)
			end
		end

end
