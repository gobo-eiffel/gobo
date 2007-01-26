indexing

	description:

		"Objects that receive notification of trace events"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_TRACE_LISTENER

feature -- Status report

	is_tracing: BOOLEAN is
			-- Is tracing active?
		deferred
		end

feature -- Events

	start_tracing is
			-- Start tracing.
		require
			not_tracing: not is_tracing
		deferred
		ensure
			tracing_active: is_tracing
		end

	stop_tracing is
			-- Stop tracing.
		require
			tracing_active: is_tracing
		deferred
		ensure
			not_tracing: not is_tracing
		end

	trace_instruction_entry (some_trace_details: XM_XSLT_TRACE_DETAILS) is
		--  Trace start of instruction execution.
		require
			tracing_active: is_tracing
			trace_details_not_void: some_trace_details /= Void
		deferred
		end

	trace_instruction_exit (some_trace_details: XM_XSLT_TRACE_DETAILS) is
		--  Trace end of instruction execution.
		require
			tracing_active: is_tracing
			trace_details_not_void: some_trace_details /= Void
		deferred
		end

	trace_current_item_start (a_current_item: XM_XPATH_ITEM) is
			-- Trace making new item current.
		require
			tracing_active: is_tracing
			current_item_not_void: a_current_item /= Void
		deferred
		end

	trace_current_item_finish (a_current_item: XM_XPATH_ITEM) is
			-- Trace leaving current item.
		require
			tracing_active: is_tracing
			current_item_not_void: a_current_item /= Void
		deferred
		end

	trace_user_entry (a_label, a_value: STRING) is
			-- Trace user entry (e.g. XPath trace() function).
		require
			tracing_enabled: is_tracing
			value_not_void: a_value /= Void
			label_not_void: a_label /= Void
		deferred
		end

end
	
