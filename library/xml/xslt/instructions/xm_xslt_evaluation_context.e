indexing

	description:

		"Objects that represent an XSLT evaluation context"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_EVALUATION_CONTEXT

inherit

		XM_XPATH_CONTEXT
		redefine
			current_date_time
		end

creation

	make, make_restricted

feature {NONE} -- Initialization

	make (a_transformer: XM_XSLT_TRANSFORMER) is
			-- Establish invariant
		require
			transformer_not_void: a_transformer /= Void
			bindery_not_void: a_transformer.bindery /= Void
		do
			transformer := a_transformer
			current_iterator := transformer.current_iterator
			local_variable_frame := transformer.bindery.current_stack_frame
			reserved_slot_count := 2
			cached_last := -1
			collation_map := transformer.executable.collation_map
		ensure
			transformer_set: transformer = a_transformer
			not_restricted: not is_restricted
		end

	make_restricted (a_static_context: XM_XSLT_EXPRESSION_CONTEXT; a_collation_map: like collation_map) is
			-- Create a restricted context for [xsl:]use-when
		require
			static_context_not_void: a_static_context /= Void
		do
			is_restricted := True
			static_context := a_static_context
			collation_map := a_collation_map
			create internal_date_time.make_from_epoch (0)
			create local_variable_frame.make (0, 0)
		ensure
			restricted: is_restricted
			static_context_set: static_context = a_static_context
			collation_map_set: collation_map = a_collation_map
		end

feature -- Access

	transformer: XM_XSLT_TRANSFORMER
			-- Transformer

	static_context: XM_XSLT_EXPRESSION_CONTEXT
			-- Static context

	last_parsed_document: XM_XPATH_DOCUMENT
			-- Result from last call to `build_document'

	available_functions: XM_XPATH_FUNCTION_LIBRARY is
			-- Available functions
		do
			if is_restricted then
				Result := static_context.available_functions
			else
				Result := transformer.executable.function_library
			end
		end

	available_documents: XM_XPATH_DOCUMENT_POOL is
			-- Available documents
		do
			if not is_restricted then
				Result := transformer.document_pool
			end
		end
	
	security_manager: XM_XPATH_SECURITY_MANAGER is
			-- Security manager
		do
			Result := transformer.configuration.output_resolver.security_manager
		end

	current_date_time: DT_DATE_TIME is
			-- Current date-time
		do
			if not is_restricted then
				Result := transformer.current_date_time
			else
				Result := internal_date_time
			end
		end

	is_current_item_available: BOOLEAN is
			-- May `current()' be called without error?
		do
			if not is_restricted then
				Result := transformer.current_iterator /= Void and then not transformer.current_iterator.off
			end
		end

	current_stylesheet_item: XM_XPATH_ITEM is
			-- Item returned by `current()'
		require
			current_item_available: is_current_item_available
		do
			Result := transformer.current_item
		ensure
			current_stylesheet_item_not_void: Result /= Void
		end

feature -- Status report

	last_build_error: STRING
			-- Error message from last call to `build_document'

feature -- Element change

		build_document (a_uri_reference: STRING) is
			-- Build a document.
		local
			a_uri_resolver: XM_URI_REFERENCE_RESOLVER
			a_parser: XM_PARSER
			a_builder: XM_XPATH_BUILDER
			a_source: XM_XSLT_URI_SOURCE
		do
			is_build_document_error := False
			last_parsed_document := Void
			a_uri_resolver := transformer.configuration.uri_resolver
			a_uri_resolver.resolve_uri (a_uri_reference)
			if a_uri_resolver.has_uri_reference_error then
				set_build_error (a_uri_resolver.last_uri_reference_error)
			else
				a_parser := transformer.new_parser
				a_builder := transformer.new_builder (a_parser)
				create a_source.make (a_uri_resolver.last_system_id.full_reference)
				a_source.send_from_stream (a_uri_resolver.last_uri_reference_stream, a_uri_resolver.last_system_id, a_parser, a_builder, False)
				if a_builder.has_error then
					set_build_error (a_builder.last_error)
				else
					last_parsed_document	:= a_builder.document
				end
			end
			transformer.configuration.reset_entity_resolver
		end

feature {NONE} -- Implementation

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

	transformer_not_void: not is_restricted implies transformer /= Void
	static_context_void: not is_restricted implies static_context = Void
	static_context_not_void: is_restricted implies static_context /= Void

end
	
