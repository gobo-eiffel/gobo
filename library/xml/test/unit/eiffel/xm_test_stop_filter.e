note

	description:

		"Test parser stop on error filter"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004-2018, Eric Bezault and others"
	license: "MIT License"

class XM_TEST_STOP_FILTER

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_stop
			-- Test stop filter stops the parser.
		local
			l_parser: XM_EIFFEL_PARSER
			error_filter: XM_STOP_ON_ERROR_FILTER
			result_filter: XM_RESULT_FILTER
			ns_filter: XM_NAMESPACE_RESOLVER
		do
			create l_parser.make

				-- ns -> result -> error pipe
			error_filter := l_parser.new_stop_on_error_filter
			create result_filter.make_next (error_filter)
			create ns_filter.make_next (result_filter)

			l_parser.set_callbacks (ns_filter)
			l_parser.parse_from_string ("<doc broken:attr=''>hello</doc>")

			assert ("error", not l_parser.is_correct)
			assert_equal ("no_content", "", result_filter.content)
			assert_equal ("ns_error", "Undeclared namespace error", l_parser.last_error_description)
		end

end
