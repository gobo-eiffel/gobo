indexing

	description:

		"Callbacks filter producing an instance of the data model"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_BUILDER

inherit

	XM_XPATH_RECEIVER
		redefine
			is_builder, as_builder
		end

	KL_SHARED_STANDARD_FILES
		export {NONE} all end

	DT_SHARED_SYSTEM_CLOCK
		export {NONE} all end

feature -- Access

	current_root: XM_XPATH_NODE
			-- Resulting document node or root element node

feature -- Status report

	has_error: BOOLEAN
			-- Has an error occurred?

	last_error: STRING
			-- Error message

	is_timing: BOOLEAN
			-- Is timing active?

	is_line_numbering: BOOLEAN
			-- Is line-numbering turned on?

	is_builder: BOOLEAN is
			-- Is `Current' an `XM_XPATH_BUILDER'?
		do
			Result := True
		end

	show_size is
			-- Print tree size information.
		do
			-- Default does nothing.
		end

feature -- Status setting

	set_line_numbering (on_or_off: BOOLEAN) is
			-- Turn line numbering `on_or_off'.
		do
			is_line_numbering := on_or_off
		ensure
			set: is_line_numbering = on_or_off
		end

	set_timing (on_or_off: BOOLEAN) is
			-- Turn timing `on_or_off'.
		do
			is_timing := on_or_off
		ensure
			timing_set: is_timing = on_or_off
		end

feature -- Events

	open is
			-- Notify start of event stream.
		do
			is_open := True
			if is_timing then
				std.error.put_string ("Building tree for " + system_id)
				std.error.put_new_line
				start_time := utc_system_clock.time_now
			end
		end

	close is
			-- Notify end of event stream.
		do
			is_open := False
			if is_timing then
				std.error.put_string ("Tree build for " + system_id + " took " + utc_system_clock.time_now.canonical_duration (start_time).precise_time_out)
				std.error.put_new_line
				show_size
			end
		end

feature -- Element change

	set_system_id (a_system_id: STRING) is
			-- Set the system-id of the destination tree.
		do
			system_id := a_system_id
		ensure then
			system_id_set: system_id = a_system_id
		end

	set_document_locator (a_locator: XM_XPATH_LOCATOR) is
			-- Set the locator.
		do
			locator := a_locator
		ensure then
			locator_set: locator = a_locator
		end

feature -- Conversion

	as_builder: XM_XPATH_BUILDER is
			-- `Current' as a builder
		do
			Result := Current
		end

feature {NONE} -- Implementation

	locator: XM_XPATH_LOCATOR
			-- Event locator

	start_time: DT_TIME
			-- Start of timed period

invariant

	locator_not_void: locator /= Void
	document_or_element_root: current_root /= Void implies current_root.is_document or else current_root.is_element

end

		
