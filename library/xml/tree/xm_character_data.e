indexing

	description:

		"Objects that represent character data XML nodes (plain text)"

	library:	"Gobo Eiffel Kernel Library"
	author:		"Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:	"Copyright (c) 2001, Andreas Leitner and others"
	license:	"Eiffel Forum Freeware License v1 (see forum.txt)"
	date:		"$Date$"
	revision:	"$Revision$"

class XM_CHARACTER_DATA

inherit

	XM_NODE
		redefine
			implementation
		end

creation

	make_from_implementation

feature {ANY} -- Access

	content: UC_STRING is
			-- the actual character data of this node.
		do
			Result := implementation.content
		end

feature {ANY} -- Basic routines

	process (x: XM_NODE_PROCESSOR) is
		do
			x.process_character_data (Current)
		end

feature {ANY} -- Element change

	append_content (other: like Current) is
			-- append the content of 'other' to
			-- the content of Current
		require
			other /= Void
		do
			implementation.append_content (other)
		end

feature {DP_IMPLEMENTATION, DP_INTERFACE} -- Implementation

	implementation: XI_CHARACTER_DATA

invariant

	content_not_void: content /= Void

end -- class XM_CHARACTER_DATA

