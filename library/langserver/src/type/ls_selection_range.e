note

	description:

		"LSP results for 'textDocument/selectionRange' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class LS_SELECTION_RANGE

inherit

	LS_ANY

create

	make,
	make_with_parent

feature {NONE} -- Initialization

	make (a_range: like range)
			-- Create a new result.
		require
			a_range_not_void: a_range /= Void
		do
			range := a_range
		ensure
			range_set: range = a_range
		end

	make_with_parent (a_range: like range; a_parent: like parent)
			-- Create a new result with optional parent.
		require
			a_range_not_void: a_range /= Void
		do
			range := a_range
			parent := a_parent
		ensure
			range_set: range = a_range
			parent_set: parent = a_parent
		end

feature -- Access

	range: LS_RANGE
			-- The [range](#Range) of this selection range.

	parent: detachable LS_SELECTION_RANGE
			-- The parent selection range containing this range. Therefore
			-- `parent.range` must contain `this.range`.

feature -- Field names

	range_name: STRING_8 = "range"
	parent_name: STRING_8 = "parent"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_selection_range (Current)
		end

invariant

	range_not_void: range /= Void

end
