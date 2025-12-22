note

	description:
	
		"LSP ranges for an insert and a replace operation"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_INSERT_REPLACE_RANGES

inherit

	LS_EDIT_RANGE

create

	make

feature {NONE} -- Initialization

	make (a_insert: like insert; a_replace: like replace)
			-- Create a new insert replace ranges.
		require
			a_insert_not_void: a_insert /= Void
			a_replace_not_void: a_replace /= Void
		do
			insert := a_insert
			replace := a_replace
		ensure
			range_set: insert = a_insert
			replace_set: replace = a_replace
		end

feature -- Access

	insert: LS_RANGE
			-- The range if the insert is requested

	replace: LS_RANGE
			-- The range if the replace is requested.

feature -- Field names

	insert_name: STRING_8 = "insert"
	replace_name: STRING_8 = "replace"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_insert_replace_ranges (Current)
		end

invariant

	insert_not_void: insert /= Void
	replace_not_void: replace /= Void

end
