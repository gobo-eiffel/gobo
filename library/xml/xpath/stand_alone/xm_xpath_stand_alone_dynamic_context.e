indexing

	description:

		"Objects that provide a dynamic context"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_STAND_ALONE_DYNAMIC_CONTEXT

inherit

	XM_XPATH_CONTEXT

	XM_RESOLVER_FACTORY

	XM_STRING_MODE

	UC_SHARED_STRING_EQUALITY_TESTER

creation

	make

feature {NONE} -- Initialization

	make (a_context_item: XM_XPATH_ITEM; a_document_pool: like available_documents; a_function_library: like available_functions) is
			-- Establish invariant.
		require
			context_item_not_void: a_context_item /= Void
			document_pool_not_void: a_document_pool /= Void
		local
			a_file_resolver: XM_FILE_URI_RESOLVER
			a_collator: ST_COLLATOR
		do
			make_dynamic_context (a_context_item)
			available_documents := a_document_pool
			available_functions := a_function_library
			create {XM_XPATH_DEFAULT_SECURITY_MANAGER} security_manager
			create uri_resolver.make
			create a_file_resolver.make
			uri_resolver.register_scheme (a_file_resolver)
			create collation_map.make_with_equality_testers (1, Void, string_equality_tester)
			create a_collator
			collation_map.put (a_collator, Unicode_codepoint_collation_uri)
		ensure
			reserved_slot_count_zero: reserved_slot_count = 0
			context_item_set: current_iterator /= Void and then current_iterator.item = a_context_item
			available_documents_set: available_documents = a_document_pool
			available_functions_set: available_functions = a_function_library
		end

feature -- Access

	available_functions: XM_XPATH_FUNCTION_LIBRARY
			-- Available functions

	available_documents: XM_XPATH_DOCUMENT_POOL
			-- Available documents

	last_parsed_document: XM_XPATH_DOCUMENT
		-- Result from last call to `build_document'

	last_parsed_media_type: UT_MEDIA_TYPE
			-- Auxiliary result from last call to `build_document'
	
	security_manager: XM_XPATH_SECURITY_MANAGER
			-- Security manager

feature -- Status report

	last_build_error: STRING
			-- Error message from last call to `build_document'

feature 	-- Element change

	build_document (a_uri_reference: STRING) is
			-- Build a document.
		local
			an_entity_resolver: XM_URI_EXTERNAL_RESOLVER
			a_parser: XM_EIFFEL_PARSER
			a_tree_pipe: XM_XPATH_TREE_CALLBACKS_PIPE
		do
			is_build_document_error := False
			last_parsed_document := Void
			last_parsed_media_type := Void
			uri_resolver.resolve_uri (a_uri_reference)
			if uri_resolver.has_uri_reference_error then
				set_build_error (uri_resolver.last_uri_reference_error)
			else
				an_entity_resolver := new_file_resolver_current_directory
				create a_parser.make
				a_parser.copy_string_mode (Current)
				a_parser.set_resolver (an_entity_resolver)
				create a_tree_pipe.make (a_parser, True)
				a_parser.set_callbacks (a_tree_pipe.start)
				a_parser.set_dtd_callbacks (a_tree_pipe.emitter)
				an_entity_resolver.push_uri (uri_resolver.last_system_id)
				a_parser.parse_from_stream (uri_resolver.last_uri_reference_stream)
				a_parser.entity_resolver.resolve_finish
				uri_resolver.last_uri_reference_stream.close
				if a_tree_pipe.tree.has_error then
					set_build_error (a_tree_pipe.tree.last_error)
				else
					last_parsed_document	:= a_tree_pipe.document
				end
			end
		end

feature {NONE} -- Implementation

	uri_resolver: XM_SIMPLE_URI_EXTERNAL_RESOLVER
			-- URI reference resolver
		
	set_build_error (a_message: STRING) is
			-- Set `last_build_error'.
		require
			message_not_void: a_message /= Void
		do
			last_build_error := a_message
			is_build_document_error := True
		ensure
			error_set: last_build_error = a_message
			is_build_document_error: is_build_document_error
		end

invariant

	not_restricted: not is_restricted

end
