indexing

	description:

		"Eiffel verbatim strings"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_VERBATIM_STRING

inherit

	ET_MANIFEST_STRING

creation

	make, make_with_position

feature {NONE} -- Initialization

	make (a_literal: like literal; a_marker: like marker; an_open, a_close: STRING) is
			-- Create a new verbatim string.
		require
			a_literal_not_void: a_literal /= Void
			a_marker_not_void: a_marker /= Void
			an_open_not_void: an_open /= Void
			a_close_not_void: a_close /= Void
		do
			value := a_literal
			marker := a_marker
			open_white_characters := an_open
			close_white_characters := a_close
			make_leaf
		ensure
			literal_set: literal = a_literal
			marker_set: marker = a_marker
			open_white_characters_set: open_white_characters = an_open
			close_white_character_set: close_white_characters = a_close
			line_set: line = no_line
			column_set: column = no_column
		end

	make_with_position (a_literal: like literal; a_marker: like marker;
		an_open, a_close: STRING; a_line, a_column: INTEGER) is
			-- Create a new verbatim string.
		require
			a_literal_not_void: a_literal /= Void
			a_marker_not_void: a_marker /= Void
			an_open_not_void: an_open /= Void
			a_close_not_void: a_close /= Void
			a_line_positive: a_line >= 0
			a_column_positive: a_column >= 0
		do
			value := a_literal
			marker := a_marker
			open_white_characters := an_open
			close_white_characters := a_close
			make_leaf_with_position (a_line, a_column)
		ensure
			literal_set: literal = a_literal
			marker_set: marker = a_marker
			open_white_characters_set: open_white_characters = an_open
			close_white_character_set: close_white_characters = a_close
			line_set: a_line <= maximum_line implies line = a_line
			no_line_set: a_line > maximum_line implies line = no_line
			column_set: a_column <= maximum_column implies column = a_column
			no_column_set: a_column > maximum_column implies column = no_column
		end

feature -- Access

	literal: STRING is
			-- Literal value
		do
			Result := value
		end

	marker: STRING
			-- xyz in "xyz[ and ]xyz"

	open_white_characters: STRING
	close_white_characters: STRING
			-- White characters after "xyz[ and before ]xyz"

feature -- Status report

	computed: BOOLEAN is True
			-- Has manifest string been succesfully computed?

feature -- Compilation

	compute (error_handler: ET_ERROR_HANDLER) is
			-- Compute manifest string, expand special characters.
			-- Make result available in `value'.
		do
			-- Do nothing.
		end

invariant

	marker_not_void: marker /= Void
	open_white_characters_not_void: open_white_characters /= Void
	close_white_character_not_void: close_white_characters /= Void

end
