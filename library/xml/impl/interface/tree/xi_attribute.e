indexing

	description:

		"Objects that represent XML attribute nodes"

	library:	"Gobo Eiffel XML Library"
	author:		"Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:	"Copyright (c) 2001, Andreas Leitner and others"
	license:	"Eiffel Forum Freeware License v1 (see forum.txt)"
	date:		"$Date$"
	revision:	"$Revision$"

deferred class XI_ATTRIBUTE

inherit

	XI_NAMED_NODE

feature {ANY} -- Access

	value: UC_STRING is
			-- The value of this attribute.
		deferred
		end

feature {ANY} -- Basic routines

	set_value (a_value: UC_STRING) is
			-- Set `value' to `a_value'
		require
			a_value_not_void: a_value /= Void
		deferred
		ensure
			value_set: value = a_value
		end

invariant

	value_not_void: value /= Void

end -- class XI_ATTRIBUTE

