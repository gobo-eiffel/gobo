note

	description:

		"LSP 'workspace/symbol' capabilities"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_WORKSPACE_SYMBOL_CAPABILITIES

inherit

	LS_DYNAMIC_REGISTRATION_CAPABILITIES
		rename
			make as make_dynamic_registration_capabilities
		end

create

	make

feature {NONE} -- Initialization

	make (a_dynamic_registration: like dynamic_registration; a_symbol_kind: like symbol_kind;
		a_tag_support: like tag_support; a_resolve_support: like resolve_support)
			-- Create a new client capabilities.
		do
			dynamic_registration := a_dynamic_registration
			symbol_kind := a_symbol_kind
			tag_support := a_tag_support
			resolve_support := a_resolve_support
		ensure
			dynamic_registration_set: dynamic_registration = a_dynamic_registration
			symbol_kind_set: symbol_kind = a_symbol_kind
			tag_support_set: tag_support = a_tag_support
			resolve_support_set: resolve_support = a_resolve_support
		end

feature -- Access

	symbol_kind: detachable LS_SYMBOL_KIND_SET
			-- Specific capabilities for the `SymbolKind` in the
			-- `workspace/symbol` request.

	tag_support: detachable LS_SYMBOL_TAG_SET
			-- The client supports tags on `SymbolInformation` and `WorkspaceSymbol`.
			-- Clients supporting tags have to handle unknown tags gracefully.

	resolve_support: detachable LS_RESOLVE_CAPABILITIES
			-- The client support partial workspace symbols. The client will send the
			-- request `workspaceSymbol/resolve` to the server to resolve additional
			-- properties.

feature -- Field names

	symbol_kind_name: STRING_8 = "symbolKind"
	tag_support_name: STRING_8 = "tagSupport"
	resolve_support_name: STRING_8 = "resolveSupport"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_workspace_symbol_capabilities (Current)
		end

end
