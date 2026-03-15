note

	description:

		"LSP lists of selection ranges"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class LS_SELECTION_RANGE_LIST

inherit

	LS_LIST [LS_SELECTION_RANGE]

	LS_SELECTION_RANGE_RESULT

create

	make,
	make_with_capacity

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_selection_range_list (Current)
		end

end
