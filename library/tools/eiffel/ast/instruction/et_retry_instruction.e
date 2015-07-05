note

	description:

		"Eiffel retry instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_RETRY_INSTRUCTION

inherit

	ET_INSTRUCTION
		undefine
			first_position,
			last_position,
			break
		end

	ET_KEYWORD
		rename
			make_retry as make
		redefine
			process
		end

create

	make

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_retry_instruction (Current)
		end

invariant

	is_retry: is_retry

end
