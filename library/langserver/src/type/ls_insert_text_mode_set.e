note

	description:
	
		"LSP insert text mode sets"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_INSERT_TEXT_MODE_SET

inherit

	LS_ANY

create

	make

feature {NONE} -- Initialization

	make (a_value_set: like value_set)
			-- Create a new symbol tag set.
		require
			a_value_set_not_void: a_value_set /= Void
		do
			value_set := a_value_set
		ensure
			value_set_set: value_set = a_value_set
		end

feature -- Access

	value_set: LS_INSERT_TEXT_MODE_LIST
			-- The insert text modes supported by the client.

feature -- Field names

	value_set_name: STRING_8 = "valueSet"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_insert_text_mode_set (Current)
		end

invariant

	value_set_not_void: value_set /= Void

end
