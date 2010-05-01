note

	description:

		"Eiffel Void entities"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_VOID

inherit

	ET_EXPRESSION
		undefine
			first_position, last_position
		end

	ET_KEYWORD
		rename
			make_void as make
		undefine
			is_current
		redefine
			process
		end

create

	make

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_void (Current)
		end

invariant

	is_void: is_void

end
