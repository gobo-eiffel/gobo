indexing

	description:

		"Helper routines for creating expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_EXPRESSION_TOOL

creation

	make

feature {NONE} -- Initialization

	make is
		do
			do_nothing
		end

feature -- Expression creation

	make_expression (expression: STRING; context: XM_XPATH_STATIC_CONTEXT): XM_XPATH_EXPRESSION is
			-- Parse an expression;
			-- This performs the basic analysis of the expression against the grammar,
			--  it binds variable references and function calls to variable definitions and
			--  function definitions, and it performs context-independent expression
			--  rewriting for optimization purposes.
		require
			expression_not_void: expression /= Void
			context_not_void: context /= Void
		local
			parser: XM_XPATH_EXPRESSION_PARSER
			expr1: XM_XPATH_EXPRESSION
		do
			create parser.make
			parser.parse (expression, context)
			if not parser.is_parse_error then
				expr1 := parser.last_parsed_expression
				Result := expr1.simplify
				if expr1.is_static_type_error then
					-- TODO
				end
			else
				print (parser.last_parse_error)
				-- TODO - above should be an XM_XPATH_ERROR_EXPRESSION??
			end
		ensure
			dont_know_yet: True
		end
end

