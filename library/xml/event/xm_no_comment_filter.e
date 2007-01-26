indexing
	
	description:
	
		"Event filter that removes comment events"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
		
class XM_NO_COMMENT_FILTER

inherit

	XM_CALLBACKS_FILTER
		redefine
			on_comment
		end
		
create

	make_null,
	set_next
	
feature -- Event(s)

	on_comment (a: STRING) is
			-- Do not forward comment event.
		do
		end
		
end
