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

	XM_XPATH_SHARED_EXPRESSION_FACTORY

	XM_XPATH_AXIS

	XM_XPATH_TOKENS

	KL_SHARED_STANDARD_FILES

	XM_XPATH_SHARED_NAME_POOL

feature -- Test

	test_simple_filtered_path is
		local
			an_expression: XM_XPATH_EXPRESSION
			a_path: XM_XPATH_PATH_EXPRESSION
			an_axis: XM_XPATH_AXIS_EXPRESSION
			a_filter: XM_XPATH_FILTER_EXPRESSION
			a_root: XM_XPATH_ROOT_EXPRESSION
			a_comparison: XM_XPATH_COMPATIBLE_COMPARISON
			sub_exprs, sub_exprs_2, sub_exprs_3, sub_exprs_4: DS_LIST [XM_XPATH_EXPRESSION]
			a_context: XM_XPATH_STAND_ALONE_CONTEXT
			a_string: STRING
			a_string_value: XM_XPATH_STRING_VALUE
			a_base_uri: UT_URI
			a_function_library: XM_XPATH_CORE_FUNCTION_LIBRARY
		do
			a_string := "//fred[@son='Jim']"
			create a_base_uri.make ("test:/test-path")
			create a_function_library.make
			create a_context.make (True, True, a_base_uri, a_function_library)
			expression_factory.make_expression (a_string, a_context, 1, Eof_token, 1, "unknown:")
			if expression_factory.is_parse_error then
				-- Shouldn't happen
				std.error.put_string (expression_factory.parsed_error_value.error_message)
				std.error.put_new_line
			else
				an_expression := expression_factory.parsed_expression
			end
			assert ("Parse sucessful", an_expression /= Void)
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
			a_comparison ?= an_expression
			assert ("General comparison", a_comparison /= Void)
			assert ("Binary equals", a_comparison.operator = Equals_token)
			sub_exprs_4 := a_comparison.sub_expressions
			assert ("Sub-expression 4", sub_exprs_4 /= Void)
			assert ("Two sub-expressions 4", sub_exprs_4.count = 2)
			an_expression := sub_exprs_4.item (1)
			an_axis ?= an_expression
			assert ("Axis expression2 not void", an_axis /= Void)
			assert ("Attribute axis", an_axis.axis = Attribute_axis)
			an_expression := sub_exprs_4.item (2)
			a_string_value ?= an_expression
			assert ("String-value is Jim", a_string_value /= Void and then STRING_.same_string (a_string_value.string_value, "Jim"))
			
		end

	test_filtered_path_two is
		local
			an_expression: XM_XPATH_EXPRESSION
			a_path: XM_XPATH_PATH_EXPRESSION
			an_axis: XM_XPATH_AXIS_EXPRESSION
			a_filter: XM_XPATH_FILTER_EXPRESSION
			a_root: XM_XPATH_ROOT_EXPRESSION
			a_comparison: XM_XPATH_GENERAL_COMPARISON
			a_position_function: XM_XPATH_POSITION
			a_last_function: XM_XPATH_LAST
			sub_exprs, sub_exprs_2, sub_exprs_3, sub_exprs_4: DS_LIST [XM_XPATH_EXPRESSION]
			a_context: XM_XPATH_STAND_ALONE_CONTEXT
			a_string: STRING
			a_function_library: XM_XPATH_CORE_FUNCTION_LIBRARY
			a_base_uri: UT_URI
		do
			a_string := "//fred[position() = last()]"
			create a_base_uri.make ("test:/test-path")
			create a_function_library.make
			create a_context.make (False, False, a_base_uri, a_function_library)
			expression_factory.make_expression (a_string, a_context, 1, Eof_token, 1, "unknown:")
			if expression_factory.is_parse_error then
				-- Shouldn't happen
				std.error.put_string (expression_factory.parsed_error_value.error_message)
				std.error.put_new_line
			else
				an_expression := expression_factory.parsed_expression
			end
			assert ("Parse sucessful", an_expression /= Void)
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
			a_comparison ?= an_expression
			assert ("General comparison", a_comparison /= Void)
			assert ("Binary equals", a_comparison.operator = Equals_token)
			sub_exprs_4 := a_comparison.sub_expressions
			assert ("Sub-expression 4", sub_exprs_4 /= Void)
			assert ("Two sub-expressions 4", sub_exprs_4.count = 2)
			an_expression := sub_exprs_4.item (1)
			a_position_function ?= an_expression
			assert ("Position function", a_position_function /= Void)
			an_expression := sub_exprs_4.item (2)
			a_last_function ?= an_expression
			assert ("Last function", a_last_function /= Void)
		end

	test_parse_error is
			-- Test detection of parse errors
		local
			a_context: XM_XPATH_STAND_ALONE_CONTEXT
			a_string: STRING
			a_base_uri: UT_URI
			a_function_library: XM_XPATH_CORE_FUNCTION_LIBRARY
		do
			a_string := "//fred[position()) = last()]"
			create a_base_uri.make ("test:/test-path")
			create a_function_library.make
			create a_context.make (False, False, a_base_uri, a_function_library)
			expression_factory.make_expression (a_string, a_context, 1, Eof_token, 1, "unknown:")
			assert ("Parse failed", expression_factory.is_parse_error)
			assert ("Error text length", expression_factory.parsed_error_value.error_message.count = 122)
		end


end
