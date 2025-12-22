note

	description:
	"[
		LSP arrays.
		An array is an ordered list of values.
	]"
	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_ARRAY

inherit

	LS_LIST [LS_ANY]

	LS_CONFIGURATION_RESULT

create

	make,
	make_with_capacity

feature -- Access

	to_array: LS_ARRAY
			-- Array representation
		do
			Result := Current
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_array (Current)
		end

end
