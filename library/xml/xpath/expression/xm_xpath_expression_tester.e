note

	description:

		"XPath expression equality testers"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_EXPRESSION_TESTER

inherit

	KL_EQUALITY_TESTER [XM_XPATH_EXPRESSION]
		redefine
			test
		end

feature -- Status report

	test (v, u: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `v' and `u' considered equal?
		do
			if v = u then
				Result := True
			elseif v = Void then
				Result := False
			elseif u = Void then
				Result := False
			else
				Result := v.same_expression (u)
			end
		end

end
