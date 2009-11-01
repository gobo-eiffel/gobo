indexing

	description:

		"Test parser stop on error filter"

	test_status: "ok_to_run"
	library: "Gobo Eiffel XML Tests"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_TEST_STOP_FILTER

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_stop is
			-- Test stop filter stops the parser.
		local
			error_filter: XM_STOP_ON_ERROR_FILTER
			result_filter: XM_RESULT_FILTER
			ns_filter: XM_NAMESPACE_RESOLVER
		do
			create parser.make

				-- ns -> result -> error pipe
			error_filter := parser.new_stop_on_error_filter
			create result_filter.set_next (error_filter)
			create ns_filter.set_next (result_filter)

			parser.set_callbacks (ns_filter)
			parser.parse_from_string ("<doc broken:attr=''>hello</doc>")

			assert ("error", not parser.is_correct)
			assert_equal ("no_content", "", result_filter.content)
			assert_equal ("ns_error", "Undeclared namespace error", parser.last_error_description)
		end

feature {NONE} -- Implementation

	parser: XM_EIFFEL_PARSER
			-- XML parser

end
