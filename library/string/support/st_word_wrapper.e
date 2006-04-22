indexing

	description:

		"Word-warp a text document to a fixed column width."

	remark:

		"This implementation replaces all existing whitespace either a %
		%single space or a single newline character. Words that are %
		%longer than a single line will be forcefully broken at the %
		%line length."
		
	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2006, Bernd Schoeller and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ST_WORD_WRAPPER

inherit

	KL_IMPORTED_STRING_ROUTINES

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a new word-wrapper.
		do
			maximum_text_width := Default_maximum_text_width
			new_line_indentation := Default_new_line_indentation
			text := ""
		ensure
			width_set: maximum_text_width = Default_maximum_text_width
			indentation_set: new_line_indentation = Default_new_line_indentation
		end

feature -- Access

	Default_maximum_text_width: INTEGER is 79
			-- Default value for `maximum_text_width'

	Default_new_line_indentation: INTEGER is 0
			-- Default value for `new_line_indentation'

	maximum_text_width: INTEGER
			-- Maximum number of characters per line

	new_line_indentation: INTEGER
			-- Indentation for all lines except for the first one

	text: STRING
			-- The text for the wrapper to operate on

feature -- Statistics

	forced_breaks: INTEGER
			-- Number of times the wrapper was forced to break a word
			-- in two during the last wrapping operation.

feature -- Configuration

	set_maximum_text_width (a_value: INTEGER) is
			-- Set `maximum_text_width' to `a_value'.
		require
			larger_than_indentation: a_value > new_line_indentation
		do
			maximum_text_width := a_value
		ensure
			value_set: maximum_text_width = a_value
		end

	set_new_line_indentation (a_value: INTEGER) is
			-- Set `new_line_indendation' to `a_value'.
		require
			not_too_small: a_value >= 0
			not_too_large: a_value < maximum_text_width
		do
			new_line_indentation := a_value
		ensure
			value_set: new_line_indentation = a_value
		end

	set_text (a_text: STRING) is
			-- Set `text' to `a_text'.
		require
			not_void: a_text /= Void
		do
			text := a_text
		ensure
			text_set: text = a_text
		end

feature -- Operations

	wrap is
			-- Wrap the `text'.
		local
			unwrapped_text: STRING
			text_length: INTEGER
			line_length: INTEGER
			position: INTEGER
			search_position: INTEGER
			fill_string: STRING
		do
			unwrapped_text := STRING_.cloned_string (text)
			canonify_whitespace (unwrapped_text)
			text_length := unwrapped_text.count
			create fill_string.make_filled (' ', new_line_indentation)
			create text.make_empty
			forced_breaks := 0
			from
				position := 1
				line_length := maximum_text_width
			until
				position > unwrapped_text.count
			loop
				if position + line_length <= text_length then
					from
						search_position := position + line_length
					until
						search_position = position or
						unwrapped_text.item (search_position) = ' '
					loop
						search_position := search_position - 1
					end
				else
					search_position := text_length + 1
				end
				if search_position = position then
					forced_breaks := forced_breaks + 1
					search_position := position + line_length - 1
					text.append_string (unwrapped_text.substring (position, search_position))
				else
					text.append_string (unwrapped_text.substring (position, search_position - 1))
				end
				position := search_position + 1
				if position <= unwrapped_text.count then
					text.append_character ('%N')
					text.append_string (fill_string)
				end
				line_length := maximum_text_width - new_line_indentation
			end
		ensure
			correct_length: text.count = forced_breaks * (new_line_indentation + 1) + old text.count
		end

feature {NONE} -- Implementation

	canonify_whitespace (a_text: STRING) is
			-- Replace all whitespace characters by ' ' in `a_text'.
		require
			not_void: a_text /= Void
		local
			position: INTEGER
			text_length: INTEGER
			char: CHARACTER
		do
			from
				text_length := a_text.count
				position := 1
			until
				position > text_length
			loop
				char := a_text.item (position)
				if is_space (char) then
					a_text.put (' ', position)
				end
				position := position + 1
			end
		ensure
			string_same_size: a_text.count = old a_text.count
		end

	is_space (a_character: CHARACTER):BOOLEAN is
			-- Is `a_character' a tab, a newline, a linefeed or a space?
		do
			Result := (a_character = ' ') or
				(a_character = '%T') or
				(a_character = '%N') or
				(a_character = '%R')
		end

invariant

	maximum_text_width_positive: maximum_text_width >= 0
	new_line_indentation_positive: new_line_indentation >= 0
	indentation_smaller_than_width: new_line_indentation < maximum_text_width
	text_not_void: text /= Void
	forced_breaks_positive: forced_breaks >= 0

end
