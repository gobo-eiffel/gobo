indexing

	description:

		"Objects that represent character data XML nodes (plain text)"

	library:	"Gobo Eiffel XML Library"
	author:		"Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:	"Copyright (c) 2001, Andreas Leitner and others"
	license:	"Eiffel Forum Freeware License v1 (see forum.txt)"
	date:		"$Date$"
	revision:	"$Revision$"

deferred class XI_CHARACTER_DATA

inherit

	XI_NODE

feature {ANY} -- Access

	content: UC_STRING is
			-- Actual character data of this node.
		deferred
		end

feature {ANY} -- Element change

	append_content (other: XM_CHARACTER_DATA) is
			-- Append the content of 'other' to
			-- the content of Current.
		require
			other /= Void
		deferred
		end

invariant

	content_not_void: content /= Void

end -- class XI_CHARACTER_DATA
