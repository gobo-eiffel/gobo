indexing

	description:

		"Eiffel verbatim strings"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_VERBATIM_STRING

inherit

	ET_MANIFEST_STRING

create

	make

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

feature -- Access

	value: STRING
			-- String value

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

	last_position: ET_POSITION is
			-- Position of last character of current node in source code
		do
			create {ET_COMPRESSED_POSITION} Result.make (line + value.occurrences ('%N') + 1, close_white_characters.count + marker.count)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_verbatim_string (Current)
		end

invariant

	marker_not_void: marker /= Void
	open_white_characters_not_void: open_white_characters /= Void
	close_white_character_not_void: close_white_characters /= Void

end
