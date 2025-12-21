note

	description:

		"LSP lists of completion item kinds"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_COMPLETION_ITEM_KIND_LIST

inherit

	LS_LIST [LS_COMPLETION_ITEM_KIND]

create

	make,
	make_with_capacity

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_completion_item_kind_list (Current)
		end

end
