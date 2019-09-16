note

	description:

		"Eiffel verbatim strings"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_VERBATIM_STRING

inherit

	ET_MANIFEST_STRING

create

	make

feature {NONE} -- Initialization

	make (a_literal: like literal; a_value: like value; a_marker: like marker; an_open, a_close: STRING; a_left_aligned: BOOLEAN)
			-- Create a new verbatim string.
		require
			a_literal_not_void: a_literal /= Void
			a_literal_is_string_8: a_literal.same_type ({STRING_8} "")
			valid_utf8_literal: {UC_UTF8_ROUTINES}.valid_utf8 (a_literal)
			a_value_not_void: a_value /= Void
			a_value_is_string_8: a_value.same_type ({STRING_8} "")
			valid_utf8_value: {UC_UTF8_ROUTINES}.valid_utf8 (a_value)
			a_marker_not_void: a_marker /= Void
			a_marker_is_string_8: a_marker.same_type ({STRING_8} "")
			valid_utf8_marker: {UC_UTF8_ROUTINES}.valid_utf8 (a_marker)
			an_open_not_void: an_open /= Void
			an_open_is_string_8: an_open.same_type ({STRING_8} "")
			valid_utf8_open: {UC_UTF8_ROUTINES}.valid_utf8 (an_open)
			a_close_not_void: a_close /= Void
			a_close_is_string_8: a_close.same_type ({STRING_8} "")
			valid_utf8_close: {UC_UTF8_ROUTINES}.valid_utf8 (a_close)
		do
			literal := a_literal
			value := a_value
			marker := a_marker
			open_white_characters := an_open
			close_white_characters := a_close
			is_left_aligned := a_left_aligned
			make_leaf
		ensure
			literal_set: literal = a_literal
			value_set: value = a_value
			marker_set: marker = a_marker
			open_white_characters_set: open_white_characters = an_open
			close_white_character_set: close_white_characters = a_close
			is_left_aligned_set: is_left_aligned = a_left_aligned
			line_set: line = no_line
			column_set: column = no_column
		end

feature -- Access

	value: STRING_8
			-- String value
			-- (using UTF-8 encoding)

	literal: STRING_8
			-- Literal value
			-- (using UTF-8 encoding)

	is_left_aligned: BOOLEAN
			-- Is the verbatim string of the form "xyz[ ... ]xyz"?
			-- (Otherwise it is of the form "xyz{ ... }xyz")

	marker: STRING_8
			-- xyz in "xyz[ and ]xyz"
			-- (using UTF-8 encoding)

	open_white_characters: STRING_8
	close_white_characters: STRING_8
			-- White characters after "xyz[ and before ]xyz"
			-- (using UTF-8 encoding)

	last_position: ET_POSITION
			-- Position of last character of current node in source code
		do
			create {ET_COMPRESSED_POSITION} Result.make (line + value.occurrences ('%N') + 1, {UC_UTF8_ROUTINES}.unicode_character_count (close_white_characters) + {UC_UTF8_ROUTINES}.unicode_character_count (marker))
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_verbatim_string (Current)
		end

invariant

	marker_not_void: marker /= Void
	marker_is_string_8: marker.same_type ({STRING_8} "")
	valid_utf8_marker: {UC_UTF8_ROUTINES}.valid_utf8 (marker)
	open_white_characters_not_void: open_white_characters /= Void
	open_white_characters_is_string_8: open_white_characters.same_type ({STRING_8} "")
	valid_utf8_open_white_characters: {UC_UTF8_ROUTINES}.valid_utf8 (open_white_characters)
	close_white_characters_not_void: close_white_characters /= Void
	close_white_characters_is_string_8: close_white_characters.same_type ({STRING_8} "")
	valid_utf8_close_white_characters: {UC_UTF8_ROUTINES}.valid_utf8 (close_white_characters)

end
