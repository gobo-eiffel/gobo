note

	description:

		"Eiffel false constants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "MIT License"

class ET_FALSE_CONSTANT

inherit

	ET_BOOLEAN_CONSTANT
		rename
			make_false as make
		end

create

	make

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_false_constant (Current)
		end

invariant

	is_false: is_false

end
