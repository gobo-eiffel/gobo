note

	description:

		"LSP completion item defaults"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_COMPLETION_ITEM_DEFAULTS

inherit

	LS_ANY

create

	make

feature {NONE} -- Initialization

	make (a_commit_characters: like commit_characters;
		a_edit_range: like edit_range;
		a_insert_text_format: like insert_text_format;
		a_insert_text_mode: like insert_text_mode;
		a_data: like data)
			-- Create a new completion item defaults.
		do
			commit_characters := a_commit_characters
			edit_range := a_edit_range
			insert_text_format := a_insert_text_format
			insert_text_mode := a_insert_text_mode
			data := a_data
		ensure
			commit_characters_set: commit_characters = a_commit_characters
			edit_range_set: edit_range = a_edit_range
			insert_text_format_set: insert_text_format = a_insert_text_format
			insert_text_mode_set: insert_text_mode = a_insert_text_mode
			data_set: data = a_data
		end

feature -- Access

	commit_characters: detachable LS_STRING_LIST
			-- A default commit character set.

	edit_range: detachable LS_STRING
			-- A default edit range

	insert_text_format: detachable LS_INSERT_TEXT_FORMAT
			-- A default insert text format

	insert_text_mode: detachable LS_INSERT_TEXT_MODE
			-- A default insert text mode

	data: detachable LS_ANY
			-- A default data value.

feature -- Field names

	commit_characters_name: STRING_8 = "commitCharacters"
	edit_range_name: STRING_8 = "editRange"
	insert_text_format_name: STRING_8 = "insertTextFormat"
	insert_text_mode_name: STRING_8 = "insertTextMode"
	data_name: STRING_8 = "data"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_completion_item_defaults (Current)
		end

end
