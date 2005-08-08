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
	
	XM_XPATH_TYPE

	XM_XPATH_AXIS

	XM_XPATH_TOKENS

	XM_XPATH_SHARED_CONFORMANCE

	KL_SHARED_STANDARD_FILES

	XM_XPATH_SHARED_NAME_POOL
	

feature -- Test

	test_filtered_path_two is
		local
			an_expression: XM_XPATH_EXPRESSION
			a_context: XM_XPATH_STAND_ALONE_CONTEXT
			a_string: STRING
			a_base_uri: UT_URI
			a_function_library: XM_XPATH_CORE_FUNCTION_LIBRARY
		do
			a_string := "//fred[position() = last()]"
			create a_base_uri.make ("test:/test-path")
			create a_function_library.make
			create a_context.make (False, False, a_base_uri, a_function_library)
			expression_factory.make_expression (a_string, a_context, 1, Eof_token, 1)
			if expression_factory.is_parse_error then
				-- Shouldn't happen
				std.error.put_string (expression_factory.parsed_error_value.error_message)
				std.error.put_new_line
			else
				an_expression := expression_factory.parsed_expression
			end
			assert ("Parse sucessful", an_expression /= Void)
			an_expression.check_static_type (a_context)
			if an_expression.was_expression_replaced then
				an_expression := an_expression.replacement_expression
			end
			assert ("Type checking sucessfull", not an_expression.is_error)
			an_expression.optimize (a_context)
			if an_expression.was_expression_replaced then
				an_expression := an_expression.replacement_expression
			end
			assert ("Optimization sucessfull", not an_expression.is_error)
			debug ("XPath expression factory")
				print ("After analysis: %N")
				an_expression.display (1)
			end
		end

feature -- Setting

	set_up is
		do
			conformance.set_basic_xslt_processor
		end

end
