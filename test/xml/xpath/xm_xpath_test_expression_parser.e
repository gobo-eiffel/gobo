indexing
	
	description:
	
		"Test expression parseer"
		
	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
	
deferred class XM_XPATH_TEST_EXPRESSION_PARSER

inherit

	TS_TEST_CASE
	
feature -- Access

	shared_pool: XM_XPATH_SHARED_NAME_POOL is
			-- The shared name pool
		once
			create Result.make
		end

feature -- Test

	test_simple is
		local
			expression_tool: XM_XPATH_EXPRESSION_TOOL
			expr1: XM_XPATH_EXPRESSION
			expr2: XM_XPATH_PATH_EXPRESSION
			sub_exprs: DS_LIST [XM_XPATH_EXPRESSION]
			context: XM_XPATH_STAND_ALONE_CONTEXT
			tokenizer: XM_XPATH_TOKENIZER
			a_string: STRING
		do
			a_string := "//fred[@son='Jim']"
			create expression_tool.make
			create context.make (shared_pool.default_pool, False)
			expr1 := expression_tool.make_expression (a_string, context)
			assert ("Parse sucessful", expr1 /= Void)
			expr2 ?= expr1
			assert ("Path expression", expr2 /= Void)
			sub_exprs := expr2.sub_expressions
			assert ("Sub-expression", sub_exprs /= Void)
			--print (sub_exprs.count)
			--expr1 := sub_exprs.item (1)
		end

end
