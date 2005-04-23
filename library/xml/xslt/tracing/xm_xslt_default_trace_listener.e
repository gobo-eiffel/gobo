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

	DT_SHARED_SYSTEM_CLOCK

	KL_IMPORTED_STRING_ROUTINES

creation

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

	default_namespace_declaration: STRING is "xmlns=%"http://www.gobosoft.com/eiffel/gobo/gexslt/trace%""
			-- XML default namespace declaration

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
			if is_timing then
				start_time := utc_system_clock.time_now
				reporter.report_info_message ("<trace " + default_namespace_declaration + " timing=%"true%">" )
			else
				reporter.report_info_message ("<trace " + default_namespace_declaration + " timing=%"false%">" )
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
				reporter.report_info_message (" <end time=%"" + a_duration.millisecond_count.out + "%"/>")
			end
			reporter.report_info_message ("</trace>")
			is_tracing := False
		end

	trace_instruction_entry (some_trace_details: XM_XSLT_TRACE_DETAILS) is
			--  Trace start of instruction execution.
		local
			a_message: STRING
			a_duration: DT_TIME_DURATION
			a_time: DT_TIME
		do
			indentation := indentation + 1
			a_message := STRING_.concat (spaces (indentation), "<instruction element=%"")
			a_message := STRING_.appended_string (a_message, some_trace_details.instruction_name)
			if some_trace_details.properties.has ("name") then
				a_message := STRING_.appended_string (a_message, "%" name=%"")
				a_message := STRING_.appended_string (a_message, some_trace_details.properties.item ("name"))
			end
			if some_trace_details.properties.has ("mode") then
				a_message := STRING_.appended_string (a_message, "%" mode=%"")
				a_message := STRING_.appended_string (a_message, some_trace_details.properties.item ("mode"))
			end
			a_message := STRING_.appended_string (a_message, "%" line=%"")
			a_message := STRING_.appended_string (a_message, some_trace_details.line_number.out)
			a_message := STRING_.appended_string (a_message, "%" base_uri=%"")
			a_message := STRING_.appended_string (a_message, some_trace_details.system_id)
			if is_timing then
				a_time := utc_system_clock.time_now
				a_duration := a_time.canonical_duration (start_time)
				a_message := STRING_.appended_string (a_message, "%" time=%"")
				a_message := STRING_.appended_string (a_message, a_duration.millisecond_count.out)
			end
			a_message := STRING_.appended_string (a_message, "%">")
			reporter.report_info_message (a_message)
		end

	trace_instruction_exit (some_trace_details: XM_XSLT_TRACE_DETAILS) is
			--  Trace end of instruction execution.
		local
			a_message: STRING
			a_duration: DT_TIME_DURATION
			a_time: DT_TIME
		do
			if is_timing then
				a_time := utc_system_clock.time_now
				a_duration := a_time.canonical_duration (start_time)
				reporter.report_info_message (STRING_.concat (spaces (indentation + 1), "<end time=%"" + a_duration.millisecond_count.out + "%"/>"))
			end
			a_message := STRING_.concat (spaces (indentation), "</instruction><!-- ")
			a_message := STRING_.appended_string (a_message, some_trace_details.instruction_name)
			a_message := STRING_.appended_string (a_message, " -->")
			reporter.report_info_message (a_message)
			indentation := indentation - 1
		end

	trace_current_item_start (a_current_item: XM_XPATH_ITEM) is
			-- Trace making new item current.
		local
			a_node: XM_XPATH_NODE
			a_message: STRING
			a_duration: DT_TIME_DURATION
			a_time: DT_TIME
		do
			if is_timing then
				a_time := utc_system_clock.time_now
				a_duration := a_time.canonical_duration (start_time)
			end
			indentation := indentation + 1
			if not a_current_item.is_node then
				if is_timing then
					a_message := STRING_.concat (spaces (indentation), "<item time=%"")
					a_message := STRING_.appended_string (a_message, a_duration.millisecond_count.out)
					a_message := STRING_.appended_string (a_message, "%">")
				else
					a_message := STRING_.concat (spaces (indentation), "<item>")
				end
			else
				a_node := a_current_item.as_node
				a_message := STRING_.concat (spaces (indentation), "<node path=%"")
				a_message := STRING_.appended_string (a_message, a_node.path)
				a_message := STRING_.appended_string (a_message, "%" line=%"")
				a_message := STRING_.appended_string (a_message, a_node.line_number.out)
				a_message := STRING_.appended_string (a_message, "%" base_uri=%"")
				a_message := STRING_.appended_string (a_message, a_node.base_uri)
				if is_timing then
					a_message := STRING_.appended_string (a_message, "%" time=%"")
					a_message := STRING_.appended_string (a_message, a_duration.millisecond_count.out)
				end
				a_message := STRING_.appended_string (a_message, "%">")
			end
			reporter.report_info_message (a_message)
		end

	trace_current_item_finish (a_current_item: XM_XPATH_ITEM) is
			-- Trace leaving current item.
		local
			a_message: STRING
			a_duration: DT_TIME_DURATION
			a_time: DT_TIME		
		do
			if is_timing then
				a_time := utc_system_clock.time_now
				a_duration := a_time.canonical_duration (start_time)
				reporter.report_info_message (STRING_.concat (spaces (indentation + 1), "<end time=%"" + a_duration.millisecond_count.out + "%"/>"))
			end
			if not a_current_item.is_node then
				a_message := STRING_.concat (spaces (indentation), "</item>")
			else
				a_message := STRING_.concat (spaces (indentation), "</node><!-- ")
				a_message := STRING_.appended_string (a_message, a_current_item.as_node.path)
				a_message := STRING_.appended_string (a_message, " -->")
			end
			reporter.report_info_message (a_message)
			indentation := indentation - 1
		end

feature {NONE} -- Implementation

	spaces (a_number: INTEGER): STRING is
			-- produce `a_number' spaces
		do
			create Result.make_filled (' ', a_number)
		ensure
			correct_number: Result /= Void and then Result.count = a_number
		end

	
invariant

	reporter_not_void: reporter /= Void

end
	
