indexing

	description:

		"Eiffel '?' symbols"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_QUESTION_MARK_SYMBOL

inherit

	ET_SYMBOL
		rename
			make_question_mark as make
		redefine
			process
		end

	ET_AGENT_ACTUAL_ARGUMENT
		undefine
			first_position, last_position
		end

creation

	make

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_question_mark_symbol (Current)
		end

invariant

	is_question_mark: is_question_mark

end
