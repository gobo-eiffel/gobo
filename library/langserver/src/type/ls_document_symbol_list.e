note

	description:

		"LSP lists of document symbols"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_DOCUMENT_SYMBOL_LIST

inherit

	LS_LIST [LS_DOCUMENT_SYMBOL]

	LS_OPTIONAL_DOCUMENT_SYMBOL_RESULT

create

	make,
	make_with_capacity

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_document_symbol_list (Current)
		end

end
