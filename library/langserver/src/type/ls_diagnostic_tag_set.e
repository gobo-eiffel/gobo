note

	description:
	
		"LSP diagnostic tag sets"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_DIAGNOSTIC_TAG_SET

inherit

	LS_ANY

create

	make

feature {NONE} -- Initialization

	make (a_value_set: like value_set)
			-- Create a new diagnostic tag set.
		do
			value_set := a_value_set
		ensure
			value_set_set: value_set = a_value_set
		end

feature -- Access

	value_set: detachable LS_DIAGNOSTIC_TAG_LIST
			-- The tags supported by the client.

feature -- Field names

	value_set_name: STRING_8 = "valueSet"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_diagnostic_tag_set (Current)
		end

end
