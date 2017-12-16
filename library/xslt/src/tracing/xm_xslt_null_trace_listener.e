note

	description:

		"Objects that ignore trace events"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_NULL_TRACE_LISTENER

inherit

	XM_XSLT_TRACE_LISTENER

	XM_XSLT_TRACE_CONSTANTS

	XM_XPATH_NAME_UTILITIES

	XM_XPATH_STANDARD_NAMESPACES

	XM_XPATH_SHARED_NAME_POOL

	DT_SHARED_SYSTEM_CLOCK

	KL_IMPORTED_STRING_ROUTINES

		-- This class is used to measure the impact of tracing, ignoring the I/O aspect.

create

	make

feature {NONE} -- Initialization

	make
			-- Do nothing.
		do
		end

feature -- Status report

	is_tracing: BOOLEAN
			-- Is tracing active?

feature -- Events

	start_tracing
			-- Start tracing.
		do
			is_tracing := True
		end

	stop_tracing
			-- Stop tracing.
		do
			is_tracing := False
		end

	trace_instruction_entry (some_trace_details: XM_XSLT_TRACE_DETAILS)
			--  Trace start of instruction execution.
		do
		end

	trace_instruction_exit (some_trace_details: XM_XSLT_TRACE_DETAILS)
			--  Trace end of instruction execution.
		do
		end

	trace_current_item_start (a_current_item: XM_XPATH_ITEM)
			-- Trace making new item current.
		do
		end

	trace_current_item_finish (a_current_item: XM_XPATH_ITEM)
			-- Trace leaving current item.
		do
		end

	trace_user_entry (a_value, a_label: STRING)
			-- Trace user entry (e.g. XPath trace() function).
		do
		end

end

