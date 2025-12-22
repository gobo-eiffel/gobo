note

	description:

		"LSP completion item capabilities"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_COMPLETION_ITEM_CAPABILITIES

inherit

	LS_ANY

create

	make

feature {NONE} -- Initialization

	make (a_snippet_support: like snippet_support;
		a_commit_characters_support: like commit_characters_support;
		a_documentation_format: like documentation_format;
		a_deprecated_support: like deprecated_support;
		a_preselect_support: like preselect_support;
		a_tag_support: like tag_support;
		a_insert_replace_support: like insert_replace_support;
		a_resolve_support: like resolve_support;
		a_insert_text_mode_support: like insert_text_mode_support;
		a_label_details_support: like label_details_support)
			-- Create a new client capabilities.
		do
			snippet_support := a_snippet_support
			commit_characters_support := a_commit_characters_support
			documentation_format := a_documentation_format
			deprecated_support := a_deprecated_support
			preselect_support := a_preselect_support
			tag_support := a_tag_support
			insert_replace_support := a_insert_replace_support
			resolve_support := a_resolve_support
			insert_text_mode_support := a_insert_text_mode_support
			label_details_support := a_label_details_support
		ensure
			snippet_support_set: snippet_support = a_snippet_support
			commit_characters_support_set: commit_characters_support = a_commit_characters_support
			documentation_format_set: documentation_format = a_documentation_format
			deprecated_support_set: deprecated_support = a_deprecated_support
			preselect_support_set: preselect_support = a_preselect_support
			tag_support_set: tag_support = a_tag_support
			insert_replace_support_set: insert_replace_support = a_insert_replace_support
			resolve_support_set: resolve_support = a_resolve_support
			insert_text_mode_support_set: insert_text_mode_support = a_insert_text_mode_support
			label_details_support_set: label_details_support = a_label_details_support
		end

feature -- Access

	snippet_support: detachable LS_BOOLEAN
				-- Client supports snippets as insert text.
				--
				-- A snippet can define tab stops and placeholders with `$1`, `$2`
				-- and `${3:foo}`. `$0` defines the final tab stop, it defaults to
				-- the end of the snippet. Placeholders with equal identifiers are
				-- linked, that is typing in one will update others too.

	commit_characters_support: detachable LS_BOOLEAN
				-- Client supports commit characters on a completion item.

	documentation_format: detachable LS_MARKUP_KIND_LIST
				-- Client supports the follow content formats for the documentation
				-- property. The order describes the preferred format of the client.

	deprecated_support: detachable LS_BOOLEAN
				-- Client supports the deprecated property on a completion item.

	preselect_support: detachable LS_BOOLEAN
				-- Client supports the preselect property on a completion item.

	tag_support: detachable LS_COMPLETION_ITEM_TAG_SET
				-- Client supports the tag property on a completion item. Clients
				-- supporting tags have to handle unknown tags gracefully. Clients
				-- especially need to preserve unknown tags when sending a completion
				-- item back to the server in a resolve call.

	insert_replace_support: detachable LS_BOOLEAN
				-- Client supports insert replace edit to control different behavior if
				-- a completion item is inserted in the text or should replace text.

	resolve_support: detachable LS_COMPLETION_ITEM_RESOLVE_CAPABILITIES
				-- Indicates which properties a client can resolve lazily on a
				-- completion item. Before version 3.16.0 only the predefined properties
				-- `documentation` and `detail` could be resolved lazily.

	insert_text_mode_support: detachable LS_INSERT_TEXT_MODE_SET
				-- The client supports the `insertTextMode` property on
				-- a completion item to override the whitespace handling mode
				-- as defined by the client (see `insertTextMode`).

	label_details_support: detachable LS_BOOLEAN
				-- The client has support for completion item label
				-- details (see also `CompletionItemLabelDetails`).

feature -- Field names

	snippet_support_name: STRING_8 = "snippetSupport"
	commit_characters_support_name: STRING_8 = "commitCharactersSupport"
	documentation_format_name: STRING_8 = "documentationFormat"
	deprecated_support_name: STRING_8 = "deprecatedSupport"
	preselect_support_name: STRING_8 = "preselectSupport"
	tag_support_name: STRING_8 = "tagSupport"
	insert_replace_support_name: STRING_8 = "insertReplaceSupport"
	resolve_support_name: STRING_8 = "resolveSupport"
	insert_text_mode_support_name: STRING_8 = "insertTextModeSupport"
	label_details_support_name: STRING_8 = "labelDetailsSupport"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_completion_item_capabilities (Current)
		end

end
