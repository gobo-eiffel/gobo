note

	description:

		"LSP lists of configuration items"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_CONFIGURATION_ITEM_LIST

inherit

	LS_ARRAY
		redefine
			value,
			process
		end

create

	make,
	make_with_capacity

feature -- Access

	value (i: INTEGER): LS_CONFIGURATION_ITEM
			-- Value at index `i`
		do
			Result := values.item (i)
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_configuration_item_list (Current)
		end

end
