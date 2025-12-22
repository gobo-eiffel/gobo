note

	description:

		"LSP lists of marked strings"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_MARKED_STRING_LIST

inherit

	LS_LIST [LS_MARKED_STRING]

	LS_STRING_CONTENTS

create

	make,
	make_with_capacity

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_marked_string_list (Current)
		end

end
