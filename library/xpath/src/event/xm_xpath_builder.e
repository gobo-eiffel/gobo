note

	description:

		"Callbacks filter producing an instance of the data model"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003-2014, Colin Adams and others"
	license: "MIT License"
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

	current_root: detachable XM_XPATH_NODE
			-- Resulting document node or root element node

feature -- Status report

	has_error: BOOLEAN
			-- Has an error occurred?

	last_error: detachable STRING
			-- Error message

	is_timing: BOOLEAN
			-- Is timing active?

	is_line_numbering: BOOLEAN
			-- Is line-numbering turned on?

	is_builder: BOOLEAN
			-- Is `Current' an `XM_XPATH_BUILDER'?
		do
			Result := True
		end

	show_size
			-- Print tree size information.
		do
			-- Default does nothing.
		end

feature -- Status setting

	set_line_numbering (on_or_off: BOOLEAN)
			-- Turn line numbering `on_or_off'.
		do
			is_line_numbering := on_or_off
		ensure
			set: is_line_numbering = on_or_off
		end

	set_timing (on_or_off: BOOLEAN)
			-- Turn timing `on_or_off'.
		do
			is_timing := on_or_off
		ensure
			timing_set: is_timing = on_or_off
		end

feature -- Events

	open
			-- Notify start of event stream.
		local
			l_uri: STRING
		do
			is_open := True
			if is_timing then
				if attached document_uri as l_document_uri then
					l_uri := l_document_uri.full_reference
				elseif base_uri /= Void then
					l_uri := base_uri
				else
					l_uri := "unknown document"
				end
				-- TODO: make the timing destination configurable, for use in GUIs
				std.error.put_string ("Building tree for " + l_uri)
				std.error.put_new_line
				start_time := utc_system_clock.time_now
			end
		end

	close
			-- Notify end of event stream.
		local
			l_uri: STRING
		do
			is_open := False
			if is_timing then
				if attached document_uri as l_document_uri then
					l_uri := l_document_uri.full_reference
				elseif base_uri /= Void then
					l_uri := base_uri
				else
					l_uri := "unknown document"
				end
				check attached start_time as l_start_time then
					std.error.put_string ("Tree build for " + l_uri + " took " + utc_system_clock.time_now.canonical_duration (l_start_time).precise_time_out)
					std.error.put_new_line
				end
				show_size
			end
		end

feature -- Element change

	set_document_locator (a_locator: XM_XPATH_LOCATOR)
			-- Set the locator.
		do
			locator := a_locator
		ensure then
			locator_set: locator = a_locator
		end

feature -- Conversion

	as_builder: XM_XPATH_BUILDER
			-- `Current' as a builder
		do
			Result := Current
		end

feature {NONE} -- Implementation

	locator: XM_XPATH_LOCATOR
			-- Event locator

	start_time: detachable DT_TIME
			-- Start of timed period

invariant

	locator_not_void: locator /= Void
	document_or_element_root: attached current_root as l_current_root implies l_current_root.is_document or else l_current_root.is_element

end


