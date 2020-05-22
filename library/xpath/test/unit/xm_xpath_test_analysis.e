note

	description:

		"Test static analysis"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2020, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TEST_ANALYSIS

inherit

	TS_TEST_CASE
		redefine
			set_up
		end

	XM_XPATH_SHARED_EXPRESSION_FACTORY

	XM_XPATH_SHARED_ANY_ITEM_TYPE

	XM_XPATH_TYPE

	XM_XPATH_AXIS

	XM_XPATH_TOKENS

	XM_XPATH_SHARED_CONFORMANCE

	KL_SHARED_STANDARD_FILES

	XM_XPATH_SHARED_NAME_POOL

create

	make_default

feature -- Test

	test_filtered_path_two
		-- Test evaluation of "//fred[position() = last()".
		local
			l_expression: detachable XM_XPATH_EXPRESSION
			l_context: XM_XPATH_STAND_ALONE_CONTEXT
			l_string: STRING
			l_base_uri: UT_URI
			l_function_library: XM_XPATH_CORE_FUNCTION_LIBRARY
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
			l_parsed_error_value: detachable XM_XPATH_ERROR_VALUE
		do
			l_string := "//fred[position() = last()]"
			create l_base_uri.make ("test:/test-path")
			create l_function_library.make
			create l_context.make (False, False, l_base_uri, l_function_library)
			expression_factory.make_expression (l_string, l_context, 1, Eof_token, 1, "unknown:")
			if expression_factory.is_parse_error then
				-- Shouldn't happen
				l_parsed_error_value := expression_factory.parsed_error_value
				assert ("Parse failed", l_parsed_error_value /= Void)
				check asserted_above: l_parsed_error_value /= Void then end
				std.error.put_string (l_parsed_error_value.error_message)
				std.error.put_new_line
			else
				l_expression := expression_factory.parsed_expression
			end
			assert ("Parse sucessful", l_expression /= Void)
			check asserted_above: l_expression /= Void then end
			create l_replacement.make (Void)
			l_expression.check_static_type (l_replacement, l_context, any_item)
			l_expression := l_replacement.item
			assert ("postcondition_of_check_static_type", l_expression /= Void)
			check asserted_above: l_expression /= Void then end
			assert ("Type checking sucessfull", not l_expression.is_error)
			l_replacement.put (Void)
			l_expression.optimize (l_replacement, l_context, any_item)
			l_expression := l_replacement.item
			assert ("postcondition_of_optimize", l_expression /= Void)
			check asserted_above: l_expression /= Void then end
			assert ("Optimization sucessfull", not l_expression.is_error)
			debug ("XPath expression factory")
				std.output.put_line ("After analysis: ")
				l_expression.display (1)
			end
		end

feature -- Setting

	set_up
		do
			conformance.set_basic_xslt_processor
		end

end
