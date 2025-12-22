note

	description:

		"LSP suggestions for completion"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_COMPLETION_ITEM

inherit

	LS_RESPONSE_RESULT

create

	make

feature {NONE} -- Initialization

	make (a_label: like label)
			-- Create a new completion item.
		require
			a_label_not_void: a_label /= Void
		do
			label := a_label
		ensure
			label_set: label = a_label
		end

feature -- Access

	label: LS_STRING
			-- The label of this completion item.
			--
			-- The label property is also by default the text that
			-- is inserted when selecting this completion.
			--
			-- If label details are provided the label itself should
			-- be an unqualified name of the completion item.

	label_details: detachable LS_COMPLETION_ITEM_LABEL_DETAILS
			-- Additional details for the label

	kind: detachable LS_COMPLETION_ITEM_KIND
			-- The kind of this completion item. Based of the kind
			-- an icon is chosen by the editor. The standardized set
			-- of available values is defined in `CompletionItemKind`.

	tags: detachable LS_COMPLETION_ITEM_TAG_LIST
			-- Tags for this completion item.

	detail: detachable LS_STRING
			-- A human-readable string with additional information
			-- about this item, like type or symbol information.

	documentation: detachable LS_STRING_CONTENT
			-- A human-readable string that represents a doc-comment.

	deprecated: detachable LS_BOOLEAN
			-- Indicates if this item is deprecated.
			--
			-- @deprecated Use `tags` instead if supported.

	preselect: detachable LS_BOOLEAN
			-- Select this item when showing.
			--
			-- *Note* that only one completion item can be selected and that the
			-- tool / client decides which item that is. The rule is that the *first*
			-- item of those that match best is selected.

	sort_text: detachable LS_STRING
			-- A string that should be used when comparing this item
			-- with other items. When omitted the label is used
			-- as the sort text for this item.

	filter_text: detachable LS_STRING
			-- A string that should be used when filtering a set of
			-- completion items. When omitted the label is used as the
			-- filter text for this item.

	insert_text: detachable LS_STRING
			-- A string that should be inserted into a document when selecting
			-- this completion. When omitted the label is used as the insert text
			-- for this item.
			--
			-- The `insertText` is subject to interpretation by the client side.
			-- Some tools might not take the string literally. For example
			-- VS Code when code complete is requested in this example
			-- `con<cursor position>` and a completion item with an `insertText` of
			-- `console` is provided it will only insert `sole`. Therefore it is
			-- recommended to use `textEdit` instead since it avoids additional client
			-- side interpretation.

	insert_text_format: detachable LS_INSERT_TEXT_FORMAT
			-- The format of the insert text. The format applies to both the
			-- `insertText` property and the `newText` property of a provided
			-- `textEdit`. If omitted defaults to `InsertTextFormat.PlainText`.
			--
			--  Please note that the insertTextFormat doesn't apply to
			-- `additionalTextEdits`.

	insert_text_mode: detachable LS_INSERT_TEXT_MODE
			-- How whitespace and indentation is handled during completion
			-- item insertion. If not provided the client's default value depends on
			-- the `textDocument.completion.insertTextMode` client capability.

	text_edit: detachable LS_EDIT
			-- An edit which is applied to a document when selecting this completion.
			-- When an edit is provided the value of `insertText` is ignored.
			--
			-- *Note:* The range of the edit must be a single line range and it must
			-- contain the position at which completion has been requested.
			--
			-- Most editors support two different operations when accepting a completion
			-- item. One is to insert a completion text and the other is to replace an
			-- existing text with a completion text. Since this can usually not be
			-- predetermined by a server it can report both ranges. Clients need to
			-- signal support for `InsertReplaceEdit`s via the
			-- `textDocument.completion.completionItem.insertReplaceSupport` client
			-- capability property.
			--
			-- *Note 1:* The text edit's range as well as both ranges from an insert
			-- replace edit must be a [single line] and they must contain the position
			-- at which completion has been requested.
			-- *Note 2:* If an `InsertReplaceEdit` is returned the edit's insert range
			-- must be a prefix of the edit's replace range, that means it must be
			-- contained and starting at the same position.

	text_edit_text: detachable LS_STRING
			-- The edit text used if the completion item is part of a CompletionList and
			-- CompletionList defines an item default for the text edit range.
			--
			-- Clients will only honor this property if they opt into completion list
			-- item defaults using the capability `completionList.itemDefaults`.
			--
			-- If not provided and a list's default range is provided the label
			-- property is used as a text.

	additional_text_edits: detachable LS_TEXT_EDIT_LIST
			-- An optional array of additional text edits that are applied when
			-- selecting this completion. Edits must not overlap (including the same
			-- insert position) with the main edit nor with themselves.
			--
			-- Additional text edits should be used to change text unrelated to the
			-- current cursor position (for example adding an import statement at the
			-- top of the file if the completion item will insert an unqualified type).

	commit_characters: detachable LS_STRING_LIST
			-- An optional set of characters that when pressed while this completion is
			-- active will accept it first and then type that character. *Note* that all
			-- commit characters should have `length=1` and that superfluous characters
			-- will be ignored.

	command: detachable LS_COMMAND
			-- An optional command that is executed *after* inserting this completion.
			-- *Note* that additional modifications to the current document should be
			-- described with the additionalTextEdits-property.

	data: detachable LS_ANY
			-- A data entry field that is preserved on a completion item between
			-- a completion and a completion resolve request.

feature -- Setting

	set_label_details (a_label_details: like label_details)
			-- Set `label_details` to `a_label_details`.
		do
			label_details := a_label_details
		ensure
			label_details_set: label_details = a_label_details
		end

	set_kind (a_kind: like kind)
			-- Set `kind` to `a_kind`.
		do
			kind := a_kind
		ensure
			kind_set: kind = a_kind
		end

	set_tags (a_tags: like tags)
			-- Set `tags` to `a_tags`.
		do
			tags := a_tags
		ensure
			tags_set: tags = a_tags
		end

	set_detail (a_detail: like detail)
			-- Set `detail` to `a_detail`.
		do
			detail := a_detail
		ensure
			detail_set: detail = a_detail
		end

	set_documentation (a_documentation: like documentation)
			-- Set `documentation` to `a_documentation`.
		do
			documentation := a_documentation
		ensure
			documentation_set: documentation = a_documentation
		end

	set_deprecated (a_deprecated: like deprecated)
			-- Set `deprecated` to `a_deprecated`.
		do
			deprecated := a_deprecated
		ensure
			deprecated_set: deprecated = a_deprecated
		end

	set_preselect (a_preselect: like preselect)
			-- Set `preselect` to `a_preselect`.
		do
			preselect := a_preselect
		ensure
			preselect_set: preselect = a_preselect
		end

	set_sort_text (a_sort_text: like sort_text)
			-- Set `sort_text` to `a_sort_text`.
		do
			sort_text := a_sort_text
		ensure
			sort_text_set: sort_text = a_sort_text
		end

	set_filter_text (a_filter_text: like filter_text)
			-- Set `filter_text` to `a_filter_text`.
		do
			filter_text := a_filter_text
		ensure
			filter_text_set: filter_text = a_filter_text
		end

	set_insert_text (a_insert_text: like insert_text)
			-- Set `insert_text` to `a_insert_text`.
		do
			insert_text := a_insert_text
		ensure
			insert_text_set: insert_text = a_insert_text
		end

	set_insert_text_format (a_insert_text_format: like insert_text_format)
			-- Set `insert_text_format` to `a_insert_text_format`.
		do
			insert_text_format := a_insert_text_format
		ensure
			insert_text_format_set: insert_text_format = a_insert_text_format
		end

	set_insert_text_mode (a_insert_text_mode: like insert_text_mode)
			-- Set `insert_text_mode` to `a_insert_text_mode`.
		do
			insert_text_mode := a_insert_text_mode
		ensure
			insert_text_mode_set: insert_text_mode = a_insert_text_mode
		end

	set_text_edit (a_text_edit: like text_edit)
			-- Set `text_edit` to `a_text_edit`.
		do
			text_edit := a_text_edit
		ensure
			text_edit_set: text_edit = a_text_edit
		end

	set_text_edit_text (a_text_edit_text: like text_edit_text)
			-- Set `text_edit` to `a_text_edit`.
		do
			text_edit_text := a_text_edit_text
		ensure
			text_edit_text_set: text_edit_text = a_text_edit_text
		end

	set_additional_text_edits (a_additional_text_edits: like additional_text_edits)
			-- Set `additional_text_edits` to `a_additional_text_edits`.
		do
			additional_text_edits := a_additional_text_edits
		ensure
			additional_text_edits_set: additional_text_edits = a_additional_text_edits
		end

	set_commit_characters (a_commit_characters: like commit_characters)
			-- Set `commit_characters` to `a_commit_characters`.
		do
			commit_characters := a_commit_characters
		ensure
			commit_characters_set: commit_characters = a_commit_characters
		end

	set_command (a_command: like command)
			-- Set `command` to `a_command`.
		do
			command := a_command
		ensure
			command_set: command = a_command
		end

	set_data (a_data: like data)
			-- Set `data` to `a_data`.
		do
			data := a_data
		ensure
			data_set: data = a_data
		end

feature -- Field names

	label_name: STRING_8 = "label"
	label_details_name: STRING_8 = "labelDetails"
	kind_name: STRING_8 = "kind"
	tags_name: STRING_8 = "tags"
	detail_name: STRING_8 = "detail"
	documentation_name: STRING_8 = "documentation"
	deprecated_name: STRING_8 = "deprecated"
	preselect_name: STRING_8 = "preselect"
	sort_text_name: STRING_8 = "sortText"
	filter_text_name: STRING_8 = "filterText"
	insert_text_name: STRING_8 = "insertText"
	insert_text_format_name: STRING_8 = "insertTextFormat"
	insert_text_mode_name: STRING_8 = "insertTextMode"
	text_edit_name: STRING_8 = "textEdit"
	text_edit_text_name: STRING_8 = "textEditText"
	additional_text_edits_name: STRING_8 = "additionalTextEdits"
	commit_characters_name: STRING_8 = "commitCharacters"
	command_name: STRING_8 = "command"
	data_name: STRING_8 = "data"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_completion_item (Current)
		end

invariant

	label_not_void: label /= Void

end
