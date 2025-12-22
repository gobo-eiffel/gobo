note

	description:

		"LSP lists of location links"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_LOCATION_LINK_LIST

inherit

	LS_LIST [LS_LOCATION_LINK]

	LS_OPTIONAL_DEFINITION_RESULT

	LS_OPTIONAL_TYPE_DEFINITION_RESULT

	LS_OPTIONAL_DECLARATION_RESULT

	LS_OPTIONAL_IMPLEMENTATION_RESULT

create

	make,
	make_with_capacity

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_location_link_list (Current)
		end

end
