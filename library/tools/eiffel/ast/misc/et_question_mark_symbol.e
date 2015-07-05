note

	description:

		"Eiffel '?' symbols"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2014, Eric Bezault and others"
	license: "MIT License"
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

	ET_AGENT_ARGUMENT_OPERAND
		undefine
			first_position,
			last_position,
			break
		redefine
			is_open_operand
		end

create

	make

feature -- Status report

	is_open_operand: BOOLEAN = True
			-- Is current operand open?

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_question_mark_symbol (Current)
		end

invariant

	is_question_mark: is_question_mark

end
