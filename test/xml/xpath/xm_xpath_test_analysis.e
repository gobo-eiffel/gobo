indexing
	
	description:
	
		"Test static analysis"
		
	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
	
deferred class XM_XPATH_TEST_ANALYSIS

inherit

	TS_TEST_CASE
		redefine
			set_up
		end

	XM_XPATH_SHARED_EXPRESSION_FACTORY
	
	XM_XPATH_SHARED_FUNCTION_FACTORY

	XM_XPATH_TYPE

	XM_XPATH_AXIS

feature -- Access

	shared_pool: XM_XPATH_SHARED_NAME_POOL is
			-- The shared name pool
		once
			create Result.make
		end

	default_pool: XM_XPATH_NAME_POOL
			-- The default name pool

feature -- Test

	test_filtered_path_two is
		local
			an_expression: XM_XPATH_EXPRESSION
			a_path: XM_XPATH_PATH_EXPRESSION
			an_axis: XM_XPATH_AXIS_EXPRESSION
			a_filter: XM_XPATH_FILTER_EXPRESSION
			a_root: XM_XPATH_ROOT_EXPRESSION
			an_is_last: XM_XPATH_IS_LAST_EXPRESSION
			sub_exprs, sub_exprs_2, sub_exprs_3, sub_exprs_4: DS_LIST [XM_XPATH_EXPRESSION]
			a_context: XM_XPATH_STAND_ALONE_CONTEXT
			tokenizer: XM_XPATH_TOKENIZER
			a_string: STRING
			a_string_value: XM_XPATH_STRING_VALUE
			a_system_function_factory: XM_XPATH_SYSTEM_FUNCTION_FACTORY
		do
			create a_system_function_factory
			function_factory.register_system_function_factory (a_system_function_factory)
			a_string := "//fred[position() = last()]"
			create a_context.make (default_pool, False, False)
			expression_factory.make_expression (a_string, a_context)
			if expression_factory.is_parse_error then
				-- Shouldn't happen
				std.error.put_string (expression_factory.parsed_error_value.error_message)
				std.error.put_new_line
			else
				an_expression := expression_factory.parsed_expression
			end
			assert ("Parse sucessful", an_expression /= Void)
			an_expression.analyze (a_context)
			if an_expression.was_expression_replaced then
				an_expression := an_expression.replacement_expression
			end
			assert ("Analysis sucessfull", not an_expression.is_error)
			debug ("XPath expression factory")
				print ("After analysis: %N")
				an_expression.display (1, default_pool)
			end
			a_path ?= an_expression
			assert ("Path expression", a_path /= Void)
			sub_exprs := a_path.sub_expressions
			assert ("Sub-expression", sub_exprs /= Void)
			assert ("Two sub-expressions", sub_exprs.count = 2)
			an_expression := sub_exprs.item (1)
			assert ("First sub-expression not void", an_expression /= Void)
			a_path ?= an_expression
			assert ("Path expression 2", a_path /= Void)
			sub_exprs_2 := a_path.sub_expressions
			assert ("Sub-expression 2", sub_exprs_2 /= Void)
			assert ("Two sub-expressions 2", sub_exprs_2.count = 2)
			an_expression := sub_exprs_2.item (1)
			a_root ?= an_expression
			assert ("Root expression not void", a_root /= Void) -- /
			an_expression := sub_exprs_2.item (2)
			an_axis ?= an_expression
			assert ("Axis expression not void", an_axis /= Void)
			assert ("Descendant-or-self-axis", an_axis.axis = Descendant_or_self_axis) -- Descendant-or-self::node()
			an_expression := sub_exprs.item (2)
			assert ("Second sub-expression not void", an_expression /= Void)
			a_filter ?= an_expression
			assert ("Filter expression", a_filter /= Void) -- fred[...]
			sub_exprs_3 := a_filter.sub_expressions
			assert ("Sub-expression 3", sub_exprs_3 /= Void)
			assert ("Two sub-expressions 3", sub_exprs_3.count = 2)
			an_expression := sub_exprs_3.item (1)
			an_axis ?= an_expression
			assert ("Axis expression 2 not void", an_axis /= Void) -- child::fred
			assert ("Axis selects child::fred", an_axis.axis = Child_axis
					  and an_axis.node_test /= Void and then STRING_.same_string (an_axis.node_test.original_text, "fred")) -- child::fred
			an_expression := sub_exprs_3.item (2)
			an_is_last ?= an_expression
			assert ("Islast()", an_is_last /= Void)
		end

feature -- Setting

	set_up is
		do
			initialize_type_tables
			default_pool := shared_pool.default_pool
		end

end
