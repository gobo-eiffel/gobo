indexing

	description:

		"Objects that facilitate generating output."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_OUTPUTTER	

inherit
	
	XM_XSLT_SEQUENCE_RECEIVER

feature -- Access

	configuration: XM_XSLT_CONFIGURATION
			-- Configuration

feature -- Events

	start_document is
			-- New document
		do
			previous_atomic := False
		end

	set_unparsed_entity (a_name: STRING; a_system_id: STRING; a_public_id: STRING) is
			-- Notify an unparsed entity URI.
		do
			do_nothing
		end

feature {NONE} -- Implementation

	previous_atomic: BOOLEAN

end
	
