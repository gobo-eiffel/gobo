note

	description:

		"LSP results for 'textDocument/hover' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_HOVER_RESULT

inherit

	LS_OPTIONAL_HOVER_RESULT

create

	make,
	make_with_range

feature {NONE} -- Initialization

	make (a_contents: like contents)
			-- Create a new result.
		require
			a_contents_not_void: a_contents /= Void
		do
			contents := a_contents
		ensure
			contents_set: contents = a_contents
		end

	make_with_range (a_contents: like contents; a_range: like range)
			-- Create a new result with optional range.
		require
			a_contents_not_void: a_contents /= Void
		do
			contents := a_contents
			range := a_range
		ensure
			contents_set: contents = a_contents
			range_set: range = a_range
		end

feature -- Access

	contents: LS_STRING_CONTENTS
			-- The hover's content

	range: detachable LS_RANGE
			-- An optional range is a range inside a text document
			-- that is used to visualize a hover, e.g. by changing the background color.

feature -- Field names

	contents_name: STRING_8 = "contents"
	range_name: STRING_8 = "range"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_hover_result (Current)
		end

end
