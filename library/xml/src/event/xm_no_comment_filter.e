﻿note

	description:

		"Event filter that removes comment events"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003-2013, Eric Bezault and others"
	license: "MIT License"

class XM_NO_COMMENT_FILTER

inherit

	XM_CALLBACKS_FILTER
		redefine
			on_comment
		end

create

	make_null,
	make_next

feature -- Event(s)

	on_comment (a: STRING)
			-- Do not forward comment event.
		do
		end

end
