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

	make

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
		ensure
			transformer_set: transformer = a_transformer
		end

feature -- Access

	transformer: XM_XSLT_TRANSFORMER
			-- Transformer

	last_parsed_document: XM_XPATH_DOCUMENT
			-- Result from last call to `build_document'

	available_functions: XM_XPATH_FUNCTION_LIBRARY is
			-- Available functions
		do
			Result := transformer.executable.function_library
		end

	available_documents: XM_XPATH_DOCUMENT_POOL is
			-- Available documents
		do
			Result := transformer.document_pool
		end

	current_date_time: DT_DATE_TIME is
			-- Current date-time
		do
			Result := transformer.current_date_time
		end

	is_current_item_available: BOOLEAN is
			-- May `current()' be called without error?
		do
			Result := transformer.current_iterator /= Void and then not transformer.current_iterator.off
		end

	current_stylesheet_item: XM_XPATH_ITEM is
			-- Item returned by `current()'
		require
			current_item_avaiable: is_current_item_available
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

	transformer_not_void: transformer /= Void

end
	
