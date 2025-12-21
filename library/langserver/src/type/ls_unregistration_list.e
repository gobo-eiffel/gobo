note

	description:

		"LSP lists of unregistrations"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_UNREGISTRATION_LIST

inherit

	LS_LIST [LS_UNREGISTRATION]

create

	make,
	make_with_capacity

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_unregistration_list (Current)
		end

end
