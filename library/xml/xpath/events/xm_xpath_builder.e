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


feature -- Access

	document: XM_XPATH_DOCUMENT
			-- Resulting document

feature -- Status report

	has_error: BOOLEAN
			-- Has an error occurred?

	last_error: STRING
			-- Error message


	is_line_numbering: BOOLEAN
			-- Is line-numbering turned on?

feature -- Status setting

	set_line_numbering (on_or_off: BOOLEAN) is
			-- Turn line numbering `on_or_off'.
		do
			is_line_numbering := on_or_off
		ensure
			set: is_line_numbering = on_or_off
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

feature {NONE} -- Implementation

	locator: XM_XPATH_LOCATOR
			-- Event locator

invariant

	locator_not_void: locator /= Void

end

		
