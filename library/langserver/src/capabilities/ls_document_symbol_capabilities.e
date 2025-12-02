note

	description:

		"LSP 'textDocument/documentSymbol' capabilities"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_DOCUMENT_SYMBOL_CAPABILITIES

inherit

	LS_DYNAMIC_REGISTRATION_CAPABILITIES
		rename
			make as make_dynamic_registration_capabilities
		end

create

	make

feature {NONE} -- Initialization

	make (a_dynamic_registration: like dynamic_registration; a_symbol_kind: like symbol_kind;
		a_hierarchical_document_symbol_support: like hierarchical_document_symbol_support;
		a_tag_support: like tag_support; a_label_support: like label_support)
			-- Create a new client capabilities.
		do
			dynamic_registration := a_dynamic_registration
			symbol_kind := a_symbol_kind
			hierarchical_document_symbol_support := a_hierarchical_document_symbol_support
			tag_support := a_tag_support
			label_support := a_label_support
		ensure
			dynamic_registration_set: dynamic_registration = a_dynamic_registration
			symbol_kind_set: symbol_kind = a_symbol_kind
			hierarchical_document_symbol_support_set: hierarchical_document_symbol_support = a_hierarchical_document_symbol_support
			tag_support_set: tag_support = a_tag_support
			label_support_set: label_support = a_label_support
		end

feature -- Access

	symbol_kind: detachable LS_SYMBOL_KIND_SET
			-- Specific capabilities for the `SymbolKind` in the
			-- `textDocument/documentSymbol` request.

	hierarchical_document_symbol_support: detachable LS_BOOLEAN
			-- The client supports hierarchical document symbols.

	tag_support: detachable LS_SYMBOL_TAG_SET
			-- The client supports tags on `SymbolInformation`. Tags are supported on
			-- `DocumentSymbol` if `hierarchicalDocumentSymbolSupport` is set to true.
			-- Clients supporting tags have to handle unknown tags gracefully.

	label_support: detachable LS_BOOLEAN
			-- The client supports an additional label presented in the UI when
			-- registering a document symbol provider.

feature -- Field names

	symbol_kind_name: STRING_8 = "symbolKind"
	hierarchical_document_symbol_support_name: STRING_8 = "hierarchicalDocumentSymbolSupport"
	tag_support_name: STRING_8 = "tagSupport"
	label_support_name: STRING_8 = "labelSupport"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_document_symbol_capabilities (Current)
		end

end
