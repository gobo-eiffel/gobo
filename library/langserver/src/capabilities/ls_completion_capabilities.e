note

	description:

		"LSP 'textDocument/completion' capabilities"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_COMPLETION_CAPABILITIES

inherit

	LS_DYNAMIC_REGISTRATION_CAPABILITIES
		rename
			make as make_dynamic_registration_capabilities
		end

create

	make

feature {NONE} -- Initialization

	make (a_completion_item: like completion_item;
		a_completion_item_kind: like completion_item_kind;
		a_context_support: like context_support;
		a_insert_text_mode: like insert_text_mode;
		a_completion_list: like completion_list;
		a_dynamic_registration: like dynamic_registration)
			-- Create a new client capabilities.
		do
			completion_item := a_completion_item
			completion_item_kind := a_completion_item_kind
			context_support := a_context_support
			insert_text_mode := a_insert_text_mode
			completion_list := a_completion_list
			dynamic_registration := a_dynamic_registration
		ensure
			completion_item_set: completion_item = a_completion_item
			completion_item_kind_set: completion_item_kind = a_completion_item_kind
			context_support_set: context_support = a_context_support
			insert_text_mode_set: insert_text_mode = a_insert_text_mode
			completion_list_set: completion_list = a_completion_list
			dynamic_registration_set: dynamic_registration = a_dynamic_registration
		end

feature -- Access

	completion_item: detachable LS_COMPLETION_ITEM_CAPABILITIES
			-- The client supports the following `CompletionItem` specific
			-- capabilities.

	completion_item_kind: detachable LS_COMPLETION_ITEM_KIND_SET
			-- The completion item kind values the client supports. When this
			-- property exists the client also guarantees that it will
			-- handle values outside its set gracefully and falls back
			-- to a default value when unknown.
			--
			-- If this property is not present the client only supports
			-- the completion items kinds from `Text` to `Reference` as defined in
			-- the initial version of the protocol.

	context_support: detachable LS_BOOLEAN
			-- The client supports to send additional context information for a
			-- `textDocument/completion` request.

	insert_text_mode: detachable LS_INSERT_TEXT_MODE
			-- The client's default when the completion item doesn't provide a
			-- `insertTextMode` property.

	completion_list: detachable LS_COMPLETION_LIST_CAPABILITIES
			-- The client supports the following `CompletionList` specific
			-- capabilities.

feature -- Field names

	completion_item_name: STRING_8 = "completionItem"
	completion_item_kind_name: STRING_8 = "completionItemKind"
	context_support_name: STRING_8 = "contextSupport"
	insert_text_mode_name: STRING_8 = "insertTextMode"
	completion_list_name: STRING_8 = "completionList"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_completion_capabilities (Current)
		end

end
