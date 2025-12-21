note

	description:

		"LSP lists of diagnostic tags"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_DIAGNOSTIC_TAG_LIST

inherit

	LS_LIST [LS_DIAGNOSTIC_TAG]

create

	make,
	make_with_capacity

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_diagnostic_tag_list (Current)
		end

end
