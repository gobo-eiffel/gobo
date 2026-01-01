note

	description:

		"LSP lists of workspace symbols"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_WORKSPACE_SYMBOL_LIST

inherit

	LS_LIST [LS_WORKSPACE_SYMBOL]

	LS_OPTIONAL_WORKSPACE_SYMBOL_RESULT

create

	make,
	make_with_capacity

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_workspace_symbol_list (Current)
		end

end
