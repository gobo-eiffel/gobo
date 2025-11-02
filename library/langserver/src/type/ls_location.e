note

	description:
	
		"LSP locations inside a resource, such as a line inside a text file"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_LOCATION

inherit

	LS_ANY

create

	make

feature {NONE} -- Initialization

	make (a_uri: like uri; a_range: like range)
			-- Create a new location.
		require
			a_uri_not_void: a_uri /= Void
			a_range_not_void: a_range /= Void
		do
			uri := a_uri
			range := a_range
		ensure
			uri_set: uri = a_uri
			range_set: range = a_range
		end

feature -- Access

	uri: LS_DOCUMENT_URI
			-- The text document's URI

	range: LS_RANGE
			-- Position range

feature -- Field names

	uri_name: STRING_8 = "uri"
	range_name: STRING_8 = "range"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_location (Current)
		end

invariant

	uri_not_void: uri /= Void
	range_not_void: range /= Void

end
