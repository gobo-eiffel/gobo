indexing

	description:

		"Objects that represent an executable stylesheet"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_EXECUTABLE

inherit

	XM_XSLT_INSTRUCTION

feature --Access

	configuration: XM_XSLT_CONFIGURATION
			-- User configuration options

feature -- Evaluation

	process_leaving_tail (a_context: XM_XSLT_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		do

			-- This is called to initialize processing, but currently does nothing.
			-- The transformer takes charge of finding the initial template.
			
			last_tail_call := Void
		end

feature -- Element change

	set_configuration (a_configuration: XM_XSLT_CONFIGURATION) is
			-- Set `configuration'.
		require
			configuration_not_void: a_configuration /= Void
		do
			configuration := a_configuration
		ensure
			configuration_set: configuration = a_configuration
		end

end
	
