indexing

	description:

		"Objects that represent XML comment nodes"

	library:	"Gobo Eiffel XML Library"
	author:		"Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:	"Copyright (c) 2001, Andreas Leitner and others"
	license:	"Eiffel Forum Freeware License v1 (see forum.txt)"
	date:		"$Date$"
	revision:	"$Revision$"

deferred class XI_COMMENT

inherit

	XI_NODE

feature {ANY} -- Access

	data: UC_STRING is
			-- Actual character data of this comment.
		deferred
		end

invariant

	data_not_void: data /= Void

end -- class XI_COMMENT
