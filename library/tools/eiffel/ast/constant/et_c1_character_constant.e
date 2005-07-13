indexing

	description:

		"Eiffel character constants of the form 'A'"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_C1_CHARACTER_CONSTANT

inherit

	ET_CHARACTER_CONSTANT

create

	make

feature {NONE} -- Initialization

	make (a_value: CHARACTER) is
			-- Create a new character constant.
		do
			value := a_value
			make_leaf
		ensure
			value_set: value = a_value
			line_set: line = no_line
			column_set: column = no_column
		end

feature -- Access

	last_position: ET_POSITION is
			-- Position of last character of current node in source code
		do
			create {ET_COMPRESSED_POSITION} Result.make (line, column + 2)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_c1_character_constant (Current)
		end

end
