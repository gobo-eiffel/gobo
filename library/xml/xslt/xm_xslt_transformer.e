indexing

	description:

		"XSLT transformers"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_TRANSFORMER

inherit

	XM_XPATH_DEBUGGING_ROUTINES

	XM_XPATH_SHARED_NAME_POOL

creation

	make

feature {NONE} -- Initialization

	make (a_configuration: XM_XSLT_CONFIGURATION; a_prepared_stylesheet: XM_XSLT_PREPARED_STYLESHEET) is
			-- Establish invariant.
		require
			configuration_not_void: a_configuration /= Void
			stylesheet_not_void: a_prepared_stylesheet /= Void
		do
			configuration := a_configuration
			prepared_stylesheet := a_prepared_stylesheet
			name_pool := default_pool.default_pool
			create document_pool.make
		ensure
			configuration_set: configuration = a_configuration
			prepared_stylesheet_set: prepared_stylesheet = a_prepared_stylesheet
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

	document_pool: XM_XSLT_DOCUMENT_POOL
			-- Document pool

	prepared_stylesheet: XM_XSLT_PREPARED_STYLESHEET
			-- Compiled stylesheet

feature -- Status report

	is_tracing: BOOLEAN
			-- Is tracing enabled?

feature -- Creation

	new_xpath_context: XM_XPATH_CONTEXT is
			-- Created evaluation context
		do
			todo ("new_xpath_context", False)
		end

	new_stripper (a_builder: XM_XPATH_BUILDER): XM_XSLT_STRIPPER is
			-- Stripper configured to implement the whitespace stripping rules
		require
			builder_not_void: a_builder /= Void
		local
			a_stripper_mode: XM_XSLT_MODE
		do
			if configuration.is_strip_all_white_space then
				todo ("new_stripper", true)
				-- create {XM_XSLT_ALL_ELEMENT_STRIPPER} Result.make (Current, a_builder)
			elseif executable = Void then
				create a_stripper_mode.make
				create {XM_XSLT_STRIPPER} Result.make (Current, a_stripper_mode, a_builder)
			else
				Result := executable.new_stripper (Current, a_builder)
			end
		ensure
			stripper_not_void: Result /= Void
		end	

	new_builder: XM_XPATH_BUILDER is
			-- Builder for XML source.
		local
			a_parser: XM_EIFFEL_PARSER
			a_node_factory: XM_XPATH_NODE_FACTORY
		do
			create a_parser.make
			a_parser.set_resolver (configuration.entity_resolver)
			a_parser.copy_string_mode (configuration)
			if configuration.is_tiny_tree_model then
				create {XM_XPATH_TINY_BUILDER} Result.make (a_parser, name_pool)
			else
				create a_node_factory
				create {XM_XPATH_TREE_BUILDER} Result.make (a_parser, name_pool, a_node_factory)
			end
		ensure
			builder_not_void: Result /= Void
		end

feature -- Element change

	set_current_iterator (an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]) is
			-- Set `current_iterator'.
		do
			current_iterator := an_iterator
		ensure
			iterator_set: current_iterator = an_iterator
		end

	create_new_context (an_item: XM_XPATH_ITEM) is
			-- Create new context with `an_item' as the context item and the only node in the current node list.
		require
			context_item_not_void: an_item /= Void
		local
			a_singleton_iterator: XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ITEM]
		do
			create a_singleton_iterator.make (an_item)
			set_current_iterator (a_singleton_iterator)
			current_iterator.start
		ensure
			context_item: current_iterator.item = an_item
		end
			
	clear_document_pool is
			-- Empty `document_pool'.
		do
			create document_pool.make
		end

	register_document (a_document: XM_XPATH_DOCUMENT; a_uri: STRING) is
			-- Register a document.
		require
			document_not_void: a_document /= Void
			uri_not_void: a_uri /= Void
			document_not_registered: not document_pool.is_mapped (a_uri)
		do
			document_pool.add (a_document, a_uri)
			if not name_pool.is_document_allocated (a_document) then
				name_pool.allocate_document_number (a_document)
			end
		ensure
			document_mapped: document_pool.is_mapped (a_uri)
			document_allocated: name_pool.is_document_allocated (a_document)
		end

invariant

	configuration_not_void: configuration /= Void
	stylesheet_not_void: prepared_stylesheet /= Void
	document_pool_not_void: document_pool /= Void
	name_pool_not_void: name_pool /= Void

end
	
