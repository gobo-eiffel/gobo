indexing
	
	description:
	
		"Test xpointer evaluation for the event implementation"
		
	library: "Gobo Eiffel XPointer Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
	
deferred class XM_XPOINTER_TEST_EVENT_FILTER

inherit

	TS_TEST_CASE

	KL_IMPORTED_STRING_ROUTINES

	XM_EIFFEL_PARSER_FACTORY

	XM_RESOLVER_FACTORY

feature -- Test

	test_shorthand_with_xml_id is
			-- Test parsing shorthand pointer
		local
			a_filter: XM_XPOINTER_EVENT_FILTER
			system_id: STRING
			a_parser: XM_PARSER
			a_dtd_filter: XM_DTD_CALLBACKS_NULL
			a_sink: XM_PRETTY_PRINT_FILTER
		do
			system_id := "./test_event.xml"
			a_parser := new_eiffel_parser
			a_parser.set_resolver (new_resolver_current_directory)
			create a_dtd_filter.make
			create a_sink.make_null
			a_sink.set_output_to_string
			create default_media_type.make ("application", "xml")
			create a_filter.make ("an-id", default_media_type, a_sink, a_dtd_filter)
			a_parser.set_callbacks (a_filter)
			a_parser.set_dtd_callbacks (a_filter)
			a_parser.parse_from_system (system_id)
			assert ("Correct output", a_sink.last_output.count = 385)
		end

	test_shorthand_with_dtd_declared_id is
			-- Test parsing shorthand pointer, and changing the xpointer
		local
			a_filter: XM_XPOINTER_EVENT_FILTER
			system_id: STRING
			a_parser: XM_PARSER
			a_dtd_filter: XM_DTD_CALLBACKS_NULL
			a_sink: XM_PRETTY_PRINT_FILTER
		do
			system_id := "./test_event.xml"
			a_parser := new_eiffel_parser
			a_parser.set_resolver (new_resolver_current_directory)
			create a_dtd_filter.make
			create a_sink.make_null
			a_sink.set_output_to_string
			create default_media_type.make ("application", "xml")
			create a_filter.make ("fred", default_media_type, a_sink, a_dtd_filter)
			a_filter.set_no_filtering -- immediately overridden!
			a_filter.set_xpointer ("S")
			a_parser.set_callbacks (a_filter)
			a_parser.set_dtd_callbacks (a_filter)
			a_parser.parse_from_system (system_id)
			assert ("Correct output", a_sink.last_output.count = 291)
		end

	test_pass_through is
			-- Test as pure pass through filter
		local
			a_filter: XM_XPOINTER_EVENT_FILTER
			system_id: STRING
			a_parser: XM_PARSER
			a_dtd_filter: XM_DTD_CALLBACKS_NULL
			a_sink: XM_PRETTY_PRINT_FILTER
		do
			system_id := "./test_event.xml"
			a_parser := new_eiffel_parser
			a_parser.set_resolver (new_resolver_current_directory)
			create a_dtd_filter.make
			create a_sink.make_null
			a_sink.set_output_to_string
			create default_media_type.make ("application", "xml")
			create a_filter.make ("fred", default_media_type, a_sink, a_dtd_filter)
			a_filter.set_no_filtering
			a_parser.set_callbacks (a_filter)
			a_parser.set_dtd_callbacks (a_filter)
			a_parser.parse_from_system (system_id)
			assert ("Correct output", a_sink.last_output.count = 2606)
		end


	default_media_type: UT_MEDIA_TYPE
			-- Default media type

end
			
