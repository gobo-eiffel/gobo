note

	description:

		"Eiffel character constants of the form '%%A'"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_C2_CHARACTER_CONSTANT

inherit

	ET_CHARACTER_CONSTANT

create

	make

feature {NONE} -- Initialization

	make (a_value: CHARACTER_32)
			-- Create a new character constant.
		require
			a_value_is_character_8: a_value.is_character_8
		do
			value := a_value
			make_leaf
		ensure
			value_set: value = a_value
			line_set: line = no_line
			column_set: column = no_column
		end

feature -- Access

	literal: CHARACTER
			-- Character A such as '%A' is current character
		do
			inspect value
			when '%A' then
				Result := 'A'
			when '%B' then
				Result := 'B'
			when '%C' then
				Result := 'C'
			when '%D' then
				Result := 'D'
			when '%F' then
				Result := 'F'
			when '%H' then
				Result := 'H'
			when '%L' then
				Result := 'L'
			when '%N' then
				Result := 'N'
			when '%Q' then
				Result := 'Q'
			when '%R' then
				Result := 'R'
			when '%S' then
				Result := 'S'
			when '%T' then
				Result := 'T'
			when '%U' then
				Result := 'U'
			when '%V' then
				Result := 'V'
			when '%%' then
				Result := '%%'
			when '%'' then
				Result := '%''
			when '%"' then
				Result := '%"'
			when '%(' then
				Result := '('
			when '%)' then
				Result := ')'
			when '%<' then
				Result := '<'
			when '%>' then
				Result := '>'
			else
					-- Should never happen.
				Result := value.to_character_8
			end
		end

	last_position: ET_POSITION
			-- Position of last character of current node in source code
		do
			create {ET_COMPRESSED_POSITION} Result.make (line, column + 3)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_c2_character_constant (Current)
		end

invariant

	value_is_character_8: value.is_character_8

end
