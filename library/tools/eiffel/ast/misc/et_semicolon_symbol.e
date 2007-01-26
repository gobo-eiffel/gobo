indexing

	description:

		"Eiffel ';' symbols"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_SEMICOLON_SYMBOL

inherit

	ET_SYMBOL
		rename
			make_semicolon as make
		redefine
			process
		end

	ET_NULL_EXPORT
		undefine
			first_position, last_position,
			reset, is_semicolon
		end

	ET_NULL_INSTRUCTION
		undefine
			first_position, last_position,
			is_semicolon
		end

create

	make

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_semicolon_symbol (Current)
		end

invariant

	is_semicolon: is_semicolon

end
