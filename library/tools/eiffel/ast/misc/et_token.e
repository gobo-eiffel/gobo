note

	description:

		"Eiffel tokens"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_TOKEN

inherit

	ET_AST_LEAF
		rename
			make as make_leaf,
			make_with_position as make_leaf_with_position
		end

feature {NONE} -- Initialization

	make (a_text: like text) is
			-- Create a new token.
		require
			a_text_not_void: a_text /= Void
			a_text_not_empty: a_text.count > 0
		do
			text := a_text
			make_leaf
		ensure
			text_set: text = a_text
			line_set: line = no_line
			column_set: column = no_column
		end

feature -- Access

	text: STRING
			-- Text of token

	last_position: ET_POSITION is
			-- Position of last character of current node in source code
		do
			create {ET_COMPRESSED_POSITION} Result.make (line, column + text.count - 1)
		end

feature -- Setting

	set_text (a_text: like text) is
			-- Set `text' to `a_text'.
		require
			a_text_not_void: a_text /= Void
			a_text_not_empty: a_text.count > 0
		do
			text := a_text
		ensure
			text_set: text = a_text
		end

invariant

	text_not_void: text /= Void
	text_not_empty: text.count > 0

end
