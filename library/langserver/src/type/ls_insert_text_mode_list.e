note

	description:

		"LSP lists of insert text modes"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_INSERT_TEXT_MODE_LIST

inherit

	LS_LIST [LS_INSERT_TEXT_MODE]

create

	make,
	make_with_capacity

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_insert_text_mode_list (Current)
		end

end
