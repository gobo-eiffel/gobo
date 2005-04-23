indexing

	description:

		"XPath expression equality testers"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
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
		local
			an_expression, another_expression: XM_XPATH_EXPRESSION
		do
			if v = u then
				Result := True
			elseif v = Void then
				Result := False
			elseif u = Void then
				Result := False
			else
				if v.was_expression_replaced then
					an_expression := v.replacement_expression
				else
					an_expression := v
				end
				if u.was_expression_replaced then
					another_expression := u.replacement_expression
				else
					another_expression := u
				end
				Result := an_expression.same_expression (another_expression)
			end
		end

end
