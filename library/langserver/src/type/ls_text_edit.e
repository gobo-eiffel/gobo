note

	description:

		"LSP textual edits applicable to a text document"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_TEXT_EDIT

inherit

	LS_EDIT

create

	make

feature {NONE} -- Initialization

	make (a_range: like range; a_new_text: like new_text)
			-- Create a new text edit.
		require
			a_range_not_void: a_range /= Void
			a_new_text_not_void: a_new_text /= Void
		do
			range := a_range
			new_text := a_new_text
		ensure
			range_set: range = a_range
			new_text_set: new_text = a_new_text
		end

feature -- Access

	range: LS_RANGE
			-- The range of the text document to be manipulated. To insert
			-- text into a document create a range where start = end.

	new_text: LS_STRING
			-- The string to be inserted.
			-- For delete operations use an empty string.

feature -- Field names

	range_name: STRING_8 = "range"
	new_text_name: STRING_8 = "newText"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_text_edit (Current)
		end

invariant

	range_not_void: range /= Void
	new_text_not_void: new_text /= Void

end
