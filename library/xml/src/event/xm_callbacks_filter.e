note

	description:

		"Event filters that can forward event to 'next' filter"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_CALLBACKS_FILTER

inherit

	XM_CALLBACKS

	XM_CALLBACKS_SOURCE
		rename
			set_callbacks as set_next
		end

	XM_FORWARD_CALLBACKS
		-- implementation of default behaviour:
		-- forwarding to 'next' processor in chain
		rename
			callbacks as next,
			set_callbacks as set_next
		end

create

	make_next,
	make_null

feature {NONE} -- Initialization

	make_next (a_next: like next)
			-- Create a new event filter with `a_next' as next filter.
		require
			a_next_not_void: a_next /= Void
		do
			initialize
			set_next (a_next)
		ensure
			next_set: next = a_next
		end

	make_null
			-- Next is null processor.
		do
			make_next (null_callbacks)
		end

	initialize
			-- Initialize current callbacks.
		do
		end

end
