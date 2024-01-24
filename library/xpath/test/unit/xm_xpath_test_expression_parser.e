note

	description:

		"Test expression parseer"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2018, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_TEST_EXPRESSION_PARSER

inherit

	TS_TEST_CASE

	XM_XPATH_SHARED_EXPRESSION_FACTORY

	XM_XPATH_AXIS

	XM_XPATH_TOKENS

	KL_SHARED_STANDARD_FILES

	XM_XPATH_SHARED_NAME_POOL

create

	make_default

feature -- Test

	test_simple_filtered_path
		local
			an_expression: detachable XM_XPATH_EXPRESSION
			sub_exprs, sub_exprs_2, sub_exprs_3, sub_exprs_4: detachable DS_LIST [XM_XPATH_EXPRESSION]
			a_context: XM_XPATH_STAND_ALONE_CONTEXT
			a_string: STRING
			a_base_uri: UT_URI
			a_function_library: XM_XPATH_CORE_FUNCTION_LIBRARY
			l_parsed_error_value: detachable XM_XPATH_ERROR_VALUE
		do
			a_string := "//fred[@son='Jim']"
			create a_base_uri.make ("test:/test-path")
			create a_function_library.make
			create a_context.make (True, True, a_base_uri, a_function_library)
			expression_factory.make_expression (a_string, a_context, 1, Eof_token, 1, "unknown:")
			if expression_factory.is_parse_error then
				-- Shouldn't happen
				l_parsed_error_value := expression_factory.parsed_error_value
				assert ("Parse failed", l_parsed_error_value /= Void)
				check asserted_above: l_parsed_error_value /= Void then end
				std.error.put_string (l_parsed_error_value.error_message)
				std.error.put_new_line
			else
				an_expression := expression_factory.parsed_expression
			end
			assert ("Parse sucessful", an_expression /= Void)
			check asserted_above: an_expression /= Void then end
			if not attached {XM_XPATH_PATH_EXPRESSION} an_expression as a_path then
				assert ("Path expression", False)
			else
				sub_exprs := a_path.sub_expressions
			end
			assert ("Sub-expression", sub_exprs /= Void)
			check asserted_above: sub_exprs /= Void then end
			assert ("Two sub-expressions", sub_exprs.count = 2)
			an_expression := sub_exprs.item (1)
			assert ("First sub-expression not void", an_expression /= Void)
			if not attached {XM_XPATH_PATH_EXPRESSION} an_expression as a_path then
				assert ("Path expression 2", False)
			else
				sub_exprs_2 := a_path.sub_expressions
			end
			assert ("Sub-expression 2", sub_exprs_2 /= Void)
			check asserted_above: sub_exprs_2 /= Void then end
			assert ("Two sub-expressions 2", sub_exprs_2.count = 2)
			an_expression := sub_exprs_2.item (1)
			if not attached {XM_XPATH_ROOT_EXPRESSION} an_expression then
				assert ("Root expression not void", False) -- /
			end
			an_expression := sub_exprs_2.item (2)
			if not attached {XM_XPATH_AXIS_EXPRESSION} an_expression as an_axis then
				assert ("Axis expression not void", False)
			else
				assert ("Descendant-or-self-axis", an_axis.axis = Descendant_or_self_axis) -- Descendant-or-self::node()
			end
			an_expression := sub_exprs.item (2)
			assert ("Second sub-expression not void", an_expression /= Void)
			check asserted_above: an_expression /= Void then end
			if not attached {XM_XPATH_FILTER_EXPRESSION} an_expression as a_filter then
				assert ("Filter expression", False) -- fred[...]
			else
				sub_exprs_3 := a_filter.sub_expressions
			end
			assert ("Sub-expression 3", sub_exprs_3 /= Void)
			check asserted_above: sub_exprs_3 /= Void then end
			assert ("Two sub-expressions 3", sub_exprs_3.count = 2)
			an_expression := sub_exprs_3.item (1)
			if not attached {XM_XPATH_AXIS_EXPRESSION} an_expression as an_axis then
				assert ("Axis expression 2 not void", False) -- child::fred
			else
				assert ("Axis selects child::fred", an_axis.axis = Child_axis
						  and attached an_axis.node_test as an_axis_node_test and then STRING_.same_string (an_axis_node_test.original_text, "fred")) -- child::fred
			end
			an_expression := sub_exprs_3.item (2)
			if not attached {XM_XPATH_COMPATIBLE_COMPARISON} an_expression as a_comparison then
				assert ("General comparison", False)
			else
				assert ("Binary equals", a_comparison.operator = Equals_token)
				sub_exprs_4 := a_comparison.sub_expressions
			end
			assert ("Sub-expression 4", sub_exprs_4 /= Void)
			check asserted_above: sub_exprs_4 /= Void then end
			assert ("Two sub-expressions 4", sub_exprs_4.count = 2)
			an_expression := sub_exprs_4.item (1)
			if not attached {XM_XPATH_AXIS_EXPRESSION} an_expression as an_axis then
				assert ("Axis expression2 not void", False)
			else
				assert ("Attribute axis", an_axis.axis = Attribute_axis)
			end
			an_expression := sub_exprs_4.item (2)
			if not attached {XM_XPATH_STRING_VALUE} an_expression as a_string_value then
				assert ("String-value", False)
			else
				assert ("String-value is Jim", STRING_.same_string (a_string_value.string_value, "Jim"))
			end
		end

	test_filtered_path_two
		local
			an_expression: detachable XM_XPATH_EXPRESSION
			sub_exprs, sub_exprs_2, sub_exprs_3, sub_exprs_4: detachable DS_LIST [XM_XPATH_EXPRESSION]
			a_context: XM_XPATH_STAND_ALONE_CONTEXT
			a_string: STRING
			a_function_library: XM_XPATH_CORE_FUNCTION_LIBRARY
			a_base_uri: UT_URI
			l_parsed_error_value: detachable XM_XPATH_ERROR_VALUE
		do
			a_string := "//fred[position() = last()]"
			create a_base_uri.make ("test:/test-path")
			create a_function_library.make
			create a_context.make (False, False, a_base_uri, a_function_library)
			expression_factory.make_expression (a_string, a_context, 1, Eof_token, 1, "unknown:")
			if expression_factory.is_parse_error then
				-- Shouldn't happen
				l_parsed_error_value := expression_factory.parsed_error_value
				assert ("Parse failed", l_parsed_error_value /= Void)
				check asserted_above: l_parsed_error_value /= Void then end
				std.error.put_string (l_parsed_error_value.error_message)
				std.error.put_new_line
			else
				an_expression := expression_factory.parsed_expression
			end
			assert ("Parse sucessful", an_expression /= Void)
			check asserted_above: an_expression /= Void then end
			if not attached {XM_XPATH_PATH_EXPRESSION} an_expression as a_path then
				assert ("Path expression", False)
			else
				sub_exprs := a_path.sub_expressions
			end
			assert ("Sub-expression", sub_exprs /= Void)
			check asserted_above: sub_exprs /= Void then end
			assert ("Two sub-expressions", sub_exprs.count = 2)
			an_expression := sub_exprs.item (1)
			assert ("First sub-expression not void", an_expression /= Void)
			check asserted_above: an_expression /= Void then end
			if not attached {XM_XPATH_PATH_EXPRESSION} an_expression as a_path then
				assert ("Path expression 2", False)
			else
				sub_exprs_2 := a_path.sub_expressions
			end
			assert ("Sub-expression 2", sub_exprs_2 /= Void)
			check asserted_above: sub_exprs_2 /= Void then end
			assert ("Two sub-expressions 2", sub_exprs_2.count = 2)
			an_expression := sub_exprs_2.item (1)
			if not attached {XM_XPATH_ROOT_EXPRESSION} an_expression then
				assert ("Root expression not void", False) -- /
			end
			an_expression := sub_exprs_2.item (2)
			if not attached {XM_XPATH_AXIS_EXPRESSION} an_expression as an_axis then
				assert ("Axis expression not void", False)
			else
				assert ("Descendant-or-self-axis", an_axis.axis = Descendant_or_self_axis) -- Descendant-or-self::node()
			end
			an_expression := sub_exprs.item (2)
			assert ("Second sub-expression not void", an_expression /= Void)
			check asserted_above: an_expression /= Void then end
			if not attached {XM_XPATH_FILTER_EXPRESSION} an_expression as a_filter then
				assert ("Filter expression", False) -- fred[...]
			else
				sub_exprs_3 := a_filter.sub_expressions
			end
			assert ("Sub-expression 3", sub_exprs_3 /= Void)
			check asserted_above: sub_exprs_3 /= Void then end
			assert ("Two sub-expressions 3", sub_exprs_3.count = 2)
			an_expression := sub_exprs_3.item (1)
			if not attached {XM_XPATH_AXIS_EXPRESSION} an_expression as an_axis then
				assert ("Axis expression 2 not void", False) -- child::fred
			else
				assert ("Axis selects child::fred", an_axis.axis = Child_axis
					  and attached an_axis.node_test as an_axis_node_test and then STRING_.same_string (an_axis_node_test.original_text, "fred")) -- child::fred
			end
			an_expression := sub_exprs_3.item (2)
			if not attached {XM_XPATH_GENERAL_COMPARISON} an_expression as a_comparison then
				assert ("General comparison", False)
			else
				assert ("Binary equals", a_comparison.operator = Equals_token)
				sub_exprs_4 := a_comparison.sub_expressions
			end
			assert ("Sub-expression 4", sub_exprs_4 /= Void)
			check asserted_above: sub_exprs_4 /= Void then end
			assert ("Two sub-expressions 4", sub_exprs_4.count = 2)
			an_expression := sub_exprs_4.item (1)
			if not attached {XM_XPATH_POSITION} an_expression then
				assert ("Position function", False)
			end
			an_expression := sub_exprs_4.item (2)
			if not attached {XM_XPATH_LAST} an_expression then
				assert ("Last function", False)
			end
		end

	test_parse_error
			-- Test detection of parse errors
		local
			a_context: XM_XPATH_STAND_ALONE_CONTEXT
			a_string: STRING
			a_base_uri: UT_URI
			a_function_library: XM_XPATH_CORE_FUNCTION_LIBRARY
			l_parsed_error_value: detachable XM_XPATH_ERROR_VALUE
		do
			a_string := "//fred[position()) = last()]"
			create a_base_uri.make ("test:/test-path")
			create a_function_library.make
			create a_context.make (False, False, a_base_uri, a_function_library)
			expression_factory.make_expression (a_string, a_context, 1, Eof_token, 1, "unknown:")
			assert ("Parse failed", expression_factory.is_parse_error)
			l_parsed_error_value := expression_factory.parsed_error_value
			assert ("Parse failed 2", l_parsed_error_value /= Void)
			check asserted_above: l_parsed_error_value /= Void then end
			assert ("Error text length", l_parsed_error_value.error_message.count = 118)
		end

end
