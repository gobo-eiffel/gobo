note

	description:

		"LSP lists of registrations"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_REGISTRATION_LIST

inherit

	LS_LIST [LS_REGISTRATION]

create

	make,
	make_with_capacity

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_registration_list (Current)
		end

end
