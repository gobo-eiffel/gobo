note

	description:

		"Eiffel character constants of the form 'A'"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_C1_CHARACTER_CONSTANT

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

	literal: CHARACTER_8
			-- Character A such as 'A' is current character
		do
			Result := value.to_character_8
		end

	last_position: ET_POSITION
			-- Position of last character of current node in source code
		do
			create {ET_COMPRESSED_POSITION} Result.make (line, column + 2)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_c1_character_constant (Current)
		end

invariant

	value_is_character_8: value.is_character_8

end
