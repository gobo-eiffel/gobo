indexing

	description:

		"Lexical analyzer input buffers"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1998, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class LX_BUFFER

creation

	make

feature {NONE} -- Initialization

	make (a_string: STRING) is
			-- Create a new buffer for `a_string'.
		require
			a_string_not_void: a_string /= Void
		do
			content := a_string
			position := 1
		ensure
			content_set: content = a_string
		end

feature -- Access

	content: STRING
			-- Input buffer characters

	position: INTEGER
			-- Current position in buffer

feature -- Setting

	set_position (pos: INTEGER) is
			-- Set `position' to `pos'.
		require
			pos_large_enough: pos >= 1
		do
			position := pos
		ensure
			position_set: position = pos
		end

feature -- Element change

	refill is
			-- Refill buffer.
		do
			position := content.count + 1
		end

invariant

	content_not_void: content /= Void
	valid_position: position >= 1

end -- class LX_BUFFER
