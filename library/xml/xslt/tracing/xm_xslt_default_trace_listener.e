indexing

	description:

		"Objects that receive notification of trace events"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_DEFAULT_TRACE_LISTENER

inherit

	XM_XSLT_TRACE_LISTENER

	XM_XSLT_TRACE_CONSTANTS

	XM_XPATH_NAME_UTILITIES

	XM_XPATH_STANDARD_NAMESPACES

	XM_XPATH_SHARED_NAME_POOL

	DT_SHARED_SYSTEM_CLOCK

create

	make

feature {NONE} -- Initialization

	make (a_trace_reporter: UT_ERROR_HANDLER; add_timings: BOOLEAN) is
			-- Establish invariant.
		do
			reporter := a_trace_reporter
			is_timing := add_timings
		ensure
			reporter_set: reporter = a_trace_reporter
			timing_set: is_timing = add_timings
		end

feature -- Access

	reporter: UT_ERROR_HANDLER
			-- Reporter

	opening_namespace_declarations: STRING is
			-- XML namespace declarations
		do
			Result := "xmlns=%"http://www.gobosoft.com/eiffel/gobo/gexslt/trace%" xmlns:xsl=%"" + Xslt_uri + "%""
		ensure
			result_not_void: Result /= Void
		end

	start_time: DT_TIME
			-- Time at start of trace

	indentation: INTEGER
			-- Number of spaces for indentation

feature -- Status report

	is_timing: BOOLEAN
			-- Are time-stamps added?

	is_tracing: BOOLEAN
			-- Is tracing active?

feature -- Events

	start_tracing is
			-- Start tracing.
		do
			is_tracing := True
			reporter.info_file.put_string ("<trace ")
			reporter.report_info_message (opening_namespace_declarations)
			if is_timing then
				start_time := utc_system_clock.time_now
				reporter.report_info_message (" timing=%"true%">")
			else
				reporter.report_info_message (" timing=%"false%">" )
			end
		end

	stop_tracing is
			-- Stop tracing.
		local
			a_duration: DT_TIME_DURATION
			a_time: DT_TIME
		do
			if is_timing then
				a_time := utc_system_clock.time_now
				a_duration := a_time.canonical_duration (start_time)
				reporter.info_file.put_string (" <end time=%"")
				reporter.info_file.put_string (a_duration.millisecond_count.out)
				reporter.report_info_message ("%"/>")
			end
			reporter.report_info_message ("</trace>")
			is_tracing := False
		end

	trace_instruction_entry (some_trace_details: XM_XSLT_TRACE_DETAILS) is
			--  Trace start of instruction execution.
		local
			a_property_name: STRING
			a_duration: DT_TIME_DURATION
			a_time: DT_TIME
			a_cursor: DS_LIST_CURSOR [STRING]
		do
			indentation := indentation + 1
			reporter.info_file.put_string (spaces (indentation))
			reporter.info_file.put_string ("<")
			reporter.info_file.put_string (tag_name (some_trace_details))
			reporter.info_file.put_string (" ")
			if some_trace_details.construct_type >= 1024 then
				reporter.info_file.put_string (Gexslt_name_pseudo_attribute)
				reporter.info_file.put_string ("=%"")
				reporter.info_file.put_string (some_trace_details.trace_property (Gexslt_name_pseudo_attribute))
				reporter.info_file.put_string ("%" ")
			end
			from
				a_cursor := some_trace_details.trace_properties.new_cursor; a_cursor.start
			variant
				some_trace_details.trace_properties.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				a_property_name := a_cursor.item
				reporter.info_file.put_string (local_name_from_expanded_name (a_property_name))
				reporter.info_file.put_string ("=%"")
				reporter.info_file.put_string (some_trace_details.trace_property (a_property_name))
				reporter.info_file.put_string ("%" ")
				a_cursor.forth
			end
			reporter.info_file.put_string (" line=%"")
			reporter.info_file.put_string (some_trace_details.line_number.out)
			reporter.info_file.put_string ("%" base_uri=%"")
			reporter.info_file.put_string (some_trace_details.system_id)
			if is_timing then
				a_time := utc_system_clock.time_now
				a_duration := a_time.canonical_duration (start_time)
				reporter.info_file.put_string ("%" time=%"")
				reporter.info_file.put_string (a_duration.millisecond_count.out)
			end
			reporter.report_info_message ("%">")
		end

	trace_instruction_exit (some_trace_details: XM_XSLT_TRACE_DETAILS) is
			--  Trace end of instruction execution.
		local
			a_duration: DT_TIME_DURATION
			a_time: DT_TIME
		do
			if is_timing then
				a_time := utc_system_clock.time_now
				a_duration := a_time.canonical_duration (start_time)
				reporter.info_file.put_string (spaces (indentation + 1))
				reporter.info_file.put_string ("<end time=%"")
				reporter.info_file.put_string (a_duration.millisecond_count.out)
				reporter.report_info_message ("%"/>")
			end
			reporter.info_file.put_string (spaces (indentation))
			reporter.info_file.put_string ("</")
			reporter.info_file.put_string (tag_name (some_trace_details))
			reporter.report_info_message (">")
			indentation := indentation - 1
		end

	trace_current_item_start (a_current_item: XM_XPATH_ITEM) is
			-- Trace making new item current.
		local
			a_node: XM_XPATH_NODE
			a_duration: DT_TIME_DURATION
			a_time: DT_TIME
		do
			if is_timing then
				a_time := utc_system_clock.time_now
				a_duration := a_time.canonical_duration (start_time)
			end
			indentation := indentation + 1
			reporter.info_file.put_string (spaces (indentation))
			if not a_current_item.is_node then
				if is_timing then
					reporter.info_file.put_string ("<item time=%"")
					reporter.info_file.put_string (a_duration.millisecond_count.out)
					reporter.report_info_message ("%">")
				else
					reporter.report_info_message ("<item>")
				end
			else
				a_node := a_current_item.as_node
				reporter.info_file.put_string ("<node path=%"")
				reporter.info_file.put_string (a_node.path)
				reporter.info_file.put_string ("%" line=%"")
				reporter.info_file.put_string (a_node.line_number.out)
				reporter.info_file.put_string ("%" base_uri=%"")
				reporter.info_file.put_string (a_node.base_uri)
				if is_timing then
					reporter.info_file.put_string ("%" time=%"")
					reporter.info_file.put_string (a_duration.millisecond_count.out)
				end
				reporter.report_info_message ("%">")
			end
		end

	trace_current_item_finish (a_current_item: XM_XPATH_ITEM) is
			-- Trace leaving current item.
		local
			a_duration: DT_TIME_DURATION
			a_time: DT_TIME		
		do
			reporter.info_file.put_string (spaces (indentation + 1))
			if is_timing then
				a_time := utc_system_clock.time_now
				a_duration := a_time.canonical_duration (start_time)
				reporter.info_file.put_string ("<end time=%"")
				reporter.info_file.put_string (a_duration.millisecond_count.out)
				reporter.report_info_message ("%"/>")
			end
			reporter.info_file.put_string (spaces (indentation))
			if not a_current_item.is_node then
				reporter.report_info_message ("</item>")
			else
				reporter.info_file.put_string ("</node><!-- ")
				reporter.info_file.put_string (a_current_item.as_node.path)
				reporter.report_info_message (" -->")
			end
			indentation := indentation - 1
		end

	trace_user_entry (a_label, a_value: STRING) is
			-- Trace user entry (e.g. XPath trace() function).
		do
			reporter.info_file.put_string (spaces (indentation + 1))
			reporter.info_file.put_string ("<user-entry label=%"")
			reporter.info_file.put_string (a_label)
			reporter.info_file.put_string ("%" value=%"")
			reporter.info_file.put_string (a_value)
			reporter.report_info_message ("%"/>")
		end

feature {NONE} -- Implementation

	spaces (a_number: INTEGER): STRING is
			-- produce `a_number' spaces
		do
			create Result.make_filled (' ', a_number)
		ensure
			correct_number: Result /= Void and then Result.count = a_number
		end

feature {NONE} -- Implementation

	tag_name (some_trace_details: XM_XSLT_TRACE_DETAILS): STRING is
			-- Tag name
		require
			trace_details_not_void: some_trace_details /= Void
		do
			if some_trace_details.construct_type < 1024 then
				Result := shared_name_pool.display_name_from_name_code (some_trace_details.construct_type)
			else
				inspect
					some_trace_details.construct_type
				when Literal_result_element then
					Result := "LRE"
				else
					Result := "TODO-Unknown-tag-" + some_trace_details.construct_type.out
				end
			end
		ensure
			result_not_void: Result /= Void
		end

invariant

	reporter_not_void: reporter /= Void

end
	
