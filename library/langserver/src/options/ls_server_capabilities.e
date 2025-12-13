note

	description:

		"LSP server capabilities"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_SERVER_CAPABILITIES

inherit

	LS_ANY

create

	make

feature {NONE} -- Initialization

	make
			-- Create new server capabilities.
		do
		end

feature -- Access

	text_document_sync: detachable LS_TEXT_DOCUMENT_SYNC_GENERAL_OPTIONS
			-- Defines how text documents are synced. Is either a detailed structure
			-- defining each notification or for backwards compatibility the
			-- LS_TEXT_DOCUMENT_SYNC_KIND number. If omitted it defaults to
			-- `LS_TEXT_DOCUMENT_SYNC_KINDS.none`.

	hover_provider: detachable LS_OPTIONAL_HOVER_OPTIONS
			-- The server provides hover support.

	declaration_provider: detachable LS_OPTIONAL_DECLARATION_OPTIONS
			-- The server provides go to declaration support.

	definition_provider: detachable LS_OPTIONAL_DEFINITION_OPTIONS
			-- The server provides go to definition support.

	type_definition_provider: detachable LS_OPTIONAL_TYPE_DEFINITION_OPTIONS
			-- The server provides go to type definition support.

	implementation_provider: detachable LS_OPTIONAL_IMPLEMENTATION_OPTIONS
			-- The server provides go to implementation support.

	document_symbol_provider: detachable LS_OPTIONAL_DOCUMENT_SYMBOL_OPTIONS
			-- The server provides document symbol support.

feature -- Setting

	set_text_document_sync (a_text_document_sync: like text_document_sync)
			-- Set `text_document_sync` to `a_text_document_sync`.O
		do
			text_document_sync := a_text_document_sync
		ensure
			text_document_sync_set: text_document_sync = a_text_document_sync
		end
	
	set_hover_provider (a_hover_provider: like hover_provider)
			-- Set `hover_provider` to `a_hover_provider`.
		do
			hover_provider := a_hover_provider
		ensure
			hover_provider_set: hover_provider = a_hover_provider
		end

	set_declaration_provider (a_declaration_provider: like declaration_provider)
			-- Set `declaration_provider` to `a_declaration_provider`.
		do
			declaration_provider := a_declaration_provider
		ensure
			declaration_provider_set: declaration_provider = a_declaration_provider
		end

	set_definition_provider (a_definition_provider: like definition_provider)
			-- Set `definition_provider` to `a_definition_provider`.
		do
			definition_provider := a_definition_provider
		ensure
			definition_provider_set: definition_provider = a_definition_provider
		end

	set_type_definition_provider (a_type_definition_provider: like type_definition_provider)
			-- Set `type_definition_provider` to `a_type_definition_provider`.
		do
			type_definition_provider := a_type_definition_provider
		ensure
			type_definition_provider_set: type_definition_provider = a_type_definition_provider
		end

	set_implementation_provider (a_implementation_provider: like implementation_provider)
			-- Set `implementation_provider` to `a_implementation_provider`.
		do
			implementation_provider := a_implementation_provider
		ensure
			implementation_provider_set: implementation_provider = a_implementation_provider
		end

	set_document_symbol_provider (a_document_symbol_provider: like document_symbol_provider)
			-- Set `document_symbol_provider` to `a_document_symbol_provider`.
		do
			document_symbol_provider := a_document_symbol_provider
		ensure
			document_symbol_provider_set: document_symbol_provider = a_document_symbol_provider
		end

feature -- Field names

	text_document_sync_name: STRING_8 = "textDocumentSync"
	hover_provider_name: STRING_8 = "hoverProvider"
	declaration_provider_name: STRING_8 = "declarationProvider"
	definition_provider_name: STRING_8 = "definitionProvider"
	type_definition_provider_name: STRING_8 = "typeDefinitionProvider"
	implementation_provider_name: STRING_8 = "implementationProvider"
	document_symbol_provider_name: STRING_8 = "documentSymbolProvider"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_server_capabilities (Current)
		end

end
