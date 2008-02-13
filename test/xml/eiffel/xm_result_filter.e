indexing

	description:

		"Filter collecting content events"

	library: "Gobo Eiffel XML Tests"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_RESULT_FILTER

inherit
	
	XM_CALLBACKS_FILTER
		redefine
			on_start,
			on_content
		end
		
	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make_null,
	set_next

feature

	content: STRING
			-- Collected content
	
	on_start is
			-- Initialize.
		do
			create content.make_empty
		end
		
	on_content (a_string: STRING) is
			-- Append to content.
		do
			content := STRING_.appended_string (content, a_string)
		end

end
