indexing

	description:

		"Lexical analyzer input buffers"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
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
			index := 1
		ensure
			content_set: content = a_string
		end

feature -- Access

	content: STRING
			-- Input buffer characters

	index: INTEGER
			-- Current index in `content'

feature -- Setting

	set_index (i: INTEGER) is
			-- Set `index' to `i'.
		require
			i_large_enough: i >= 1
		do
			index := i
		ensure
			index_set: index = i
		end

feature -- Element change

	refill is
			-- Refill buffer.
		do
			index := content.count + 1
		end

invariant

	content_not_void: content /= Void
	valid_index: index >= 1

end -- class LX_BUFFER
