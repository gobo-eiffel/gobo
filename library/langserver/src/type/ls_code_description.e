note

	description:
	
		"LSP descriptions for error codes"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_CODE_DESCRIPTION

inherit

	LS_ANY

create

	make

feature {NONE} -- Initialization

	make (a_href: like href)
			-- Create a new text document identifier.
		require
			a_href_not_void: a_href /= Void
		do
			href := a_href
		ensure
			href_set: href = a_href
		end

feature -- Access

	href: LS_URI
			-- An URI to open with more information about the diagnostic error.

feature -- Field names

	href_name: STRING_8 = "href"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_code_description (Current)
		end

invariant

	href_not_void: href /= Void

end
