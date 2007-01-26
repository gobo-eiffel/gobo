indexing

	description:

		"Eiffel agent open arguments for the form '{TYPE} ?'"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2005, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_AGENT_TYPED_OPEN_ARGUMENT

inherit

	ET_AGENT_ARGUMENT_OPERAND
		undefine
			reset
		redefine
			is_open_operand
		end

	ET_BRACED_TYPE
		redefine
			make, process, last_leaf, break
		end

create

	make

feature {NONE} -- Initialization

	make (a_type: like type) is
			-- Create a new typed open argument.
		do
			type := a_type
			left_brace := tokens.left_brace_symbol
			right_brace := tokens.right_brace_symbol
			question_mark := tokens.question_mark_symbol
		end

feature -- Status report

	is_open_operand: BOOLEAN is True
			-- Is current operand open?

feature -- Access

	question_mark: ET_QUESTION_MARK_SYMBOL
			-- '?' symbol

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := question_mark
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := question_mark.break
		end

feature -- Setting

	set_question_mark (a_question_mark: like question_mark) is
			-- Set `question_mark' to `a_question_mark'.
		require
			a_question_mark_not_void: a_question_mark /= Void
		do
			question_mark := a_question_mark
		ensure
			question_mark_set: question_mark = a_question_mark
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_agent_typed_open_argument (Current)
		end

invariant

	question_mark_not_void: question_mark /= Void

end
