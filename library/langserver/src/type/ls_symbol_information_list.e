note

	description:

		"LSP lists of symbol informations"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_SYMBOL_INFORMATION_LIST

inherit

	LS_LIST [LS_SYMBOL_INFORMATION]

	LS_OPTIONAL_DOCUMENT_SYMBOL_RESULT

create

	make,
	make_with_capacity

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_symbol_information_list (Current)
		end

end
