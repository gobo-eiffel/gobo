note

	description:
	
		"LSP special text edits to provide an insert and a replace operation"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_INSERT_REPLACE_EDIT

inherit

	LS_EDIT

create

	make

feature {NONE} -- Initialization

	make (a_new_text: like new_text; a_insert: like insert; a_replace: like replace)
			-- Create a new insert replace edit.
		require
			a_new_text_not_void: a_new_text /= Void
			a_insert_not_void: a_insert /= Void
			a_replace_not_void: a_replace /= Void
		do
			new_text := a_new_text
			insert := a_insert
			replace := a_replace
		ensure
			new_text_set: new_text = a_new_text
			range_set: insert = a_insert
			replace_set: replace = a_replace
		end

feature -- Access

	new_text: LS_STRING
			-- The string to be inserted.

	insert: LS_RANGE
			-- The range if the insert is requested

	replace: LS_RANGE
			-- The range if the replace is requested.

feature -- Field names

	new_text_name: STRING_8 = "newText"
	insert_name: STRING_8 = "insert"
	replace_name: STRING_8 = "replace"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_insert_replace_edit (Current)
		end

invariant

	new_text_not_void: new_text /= Void
	insert_not_void: insert /= Void
	replace_not_void: replace /= Void

end
