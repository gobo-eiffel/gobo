note

	description:

		"LSP text document specific client capabilities"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_TEXT_DOCUMENT_CAPABILITIES

inherit

	LS_CLIENT_CAPABILITIES

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new client capabilities.
		do
		end

feature -- Access

	synchronization: detachable LS_TEXT_DOCUMENT_SYNC_CAPABILITIES
			-- Capabilities specific to text document synchronization

	completion: detachable LS_COMPLETION_CAPABILITIES
			-- Capabilities specific to the 'textDocument/completion' request.

	hover: detachable LS_HOVER_CAPABILITIES
			-- Capabilities specific to the 'textDocument/hover' request.

	declaration: detachable LS_DECLARATION_CAPABILITIES
			-- Capabilities specific to the `textDocument/declaration` request.

	definition: detachable LS_DEFINITION_CAPABILITIES
			-- Capabilities specific to the `textDocument/definition` request.

	type_definition: detachable LS_TYPE_DEFINITION_CAPABILITIES
			-- Capabilities specific to the `textDocument/typeDefinition` request.

	implementation: detachable LS_IMPLEMENTATION_CAPABILITIES
			-- Capabilities specific to the `textDocument/implementation` request.

	document_symbol: detachable LS_DOCUMENT_SYMBOL_CAPABILITIES
			-- Capabilities specific to the `textDocument/documentSymbol` request.

	publish_diagnostics: detachable LS_PUBLISH_DIAGNOSTICS_CAPABILITIES
			-- Capabilities specific to the 'textDocument/publishDiagnostics' notification.

feature -- Setting

	set_synchronization (a_synchronization: like synchronization)
			-- Set `synchronization` to `a_synchronization`.
		do
			synchronization := a_synchronization
		ensure
			synchronization_set: synchronization = a_synchronization
		end

	set_completion (a_completion: like completion)
			-- Set `completion` to `a_completion`.
		do
			completion := a_completion
		ensure
			completion_set: completion = a_completion
		end

	set_hover (a_hover: like hover)
			-- Set `hover` to `a_hover`.
		do
			hover := a_hover
		ensure
			hover_set: hover = a_hover
		end

	set_declaration (a_declaration: like declaration)
			-- Set `declaration` to `a_declaration`.
		do
			declaration := a_declaration
		ensure
			declaration_set: declaration = a_declaration
		end

	set_definition (a_definition: like definition)
			-- Set `definition` to `a_definition`.
		do
			definition := a_definition
		ensure
			definition_set: definition = a_definition
		end

	set_type_definition (a_type_definition: like type_definition)
			-- Set `type_definition` to `a_type_definition`.
		do
			type_definition := a_type_definition
		ensure
			type_definition_set: type_definition = a_type_definition
		end

	set_implementation (a_implementation: like implementation)
			-- Set `implementation` to `a_implementation`.
		do
			implementation := a_implementation
		ensure
			implementation_set: implementation = a_implementation
		end

	set_document_symbol (a_document_symbol: like document_symbol)
			-- Set `document_symbol` to `a_document_symbol`.
		do
			document_symbol := a_document_symbol
		ensure
			document_symbol_set: document_symbol = a_document_symbol
		end

	set_publish_diagnostics (a_publish_diagnostics: like publish_diagnostics)
			-- Set `publish_diagnostics` to `a_publish_diagnostics`.
		do
			publish_diagnostics := a_publish_diagnostics
		ensure
			publish_diagnostics_set: publish_diagnostics = a_publish_diagnostics
		end

feature -- Field names

	synchronization_name: STRING_8 = "synchronization"
	completion_name: STRING_8 = "completion"
	hover_name: STRING_8 = "hover"
	declaration_name: STRING_8 = "declaration"
	definition_name: STRING_8 = "definition"
	type_definition_name: STRING_8 = "typeDefinition"
	implementation_name: STRING_8 = "implementation"
	document_symbol_name: STRING_8 = "documentSymbol"
	publish_diagnostics_name: STRING_8 = "publishDiagnostics"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_text_document_capabilities (Current)
		end

end
