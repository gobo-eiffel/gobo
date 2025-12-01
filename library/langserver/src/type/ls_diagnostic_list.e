note

	description:

		"LSP lists of diagnostics"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_DIAGNOSTIC_LIST

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

	value (i: INTEGER): LS_DIAGNOSTIC
			-- Value at index `i`
		do
			Result := values.item (i)
		end

feature -- Removal

	wipe_out
			-- Delete all diagnostics in current list.
		do
			values.wipe_out
		ensure
			wiped_out: count = 0
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_diagnostic_list (Current)
		end

end
