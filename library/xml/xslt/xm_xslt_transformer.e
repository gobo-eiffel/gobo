indexing

	description:

		"XSLT transformers"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_TRANSFORMER

creation

	make

feature {NONE} -- Initialization

	make (a_configuration: XM_XSLT_CONFIGURATION) is
			-- Establish invariant.
		require
			configuration_not_void: a_configuration /= Void
		do
			configuration := a_configuration
			-- TODO
		ensure
			configuration_set: configuration = a_configuration
		end
			
feature -- Access

	executable: XM_XSLT_EXECUTABLE
			-- Executable form of the stylesheet

	configuration: XM_XSLT_CONFIGURATION
			-- User-selectable configuration parameters

	key_manager: XM_XSLT_KEY_MANAGER
			-- Key manager

	current_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			--Current iterator

	name_pool: XM_XPATH_NAME_POOL
			-- Name pool

feature -- Status report

	is_tracing: BOOLEAN
			-- Is tracing enabled?

feature -- Creation

	new_xpath_context: XM_XPATH_CONTEXT is
			-- Created evaluation context
		do
			-- TODO
		end

feature -- Element change

	set_current_iterator (an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]) is
			-- Set `current_iterator'.
		do
			current_iterator := an_iterator
		ensure
			iterator_set: current_iterator = an_iterator
		end

feature {NONE} -- Implementation

	prepared_stylesheet: XM_XSLT_PREPARED_STYLESHEET
			-- Compiled stylesheet

invariant

	configuration_not_void: configuration /= Void

end
	
