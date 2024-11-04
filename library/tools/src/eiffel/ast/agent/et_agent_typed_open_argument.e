note

	description:

		"Eiffel agent open arguments for the form '{TYPE} ?'"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2024, Eric Bezault and others"
	license: "MIT License"

class ET_AGENT_TYPED_OPEN_ARGUMENT

inherit

	ET_AGENT_ARGUMENT_OPERAND
		redefine
			reset,
			is_open_operand
		end

	ET_BRACED_TYPE
		redefine
			reset,
			make, process, last_leaf
		end

create

	make

feature {NONE} -- Initialization

	make (a_type: like type)
			-- Create a new typed open argument.
		do
			type := a_type
			left_brace := tokens.left_brace_symbol
			right_brace := tokens.right_brace_symbol
			question_mark := tokens.question_mark_symbol
		end

feature -- Initialization

	reset
			-- Reset operand as it was when it was last parsed.
		do
			precursor {ET_AGENT_ARGUMENT_OPERAND}
			precursor {ET_BRACED_TYPE}
			question_mark.reset
		end

feature -- Status report

	is_open_operand: BOOLEAN = True
			-- Is current operand open?

feature -- Access

	question_mark: ET_QUESTION_MARK_SYMBOL
			-- '?' symbol

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := question_mark
		end

feature -- Setting

	set_question_mark (a_question_mark: like question_mark)
			-- Set `question_mark' to `a_question_mark'.
		require
			a_question_mark_not_void: a_question_mark /= Void
		do
			question_mark := a_question_mark
		ensure
			question_mark_set: question_mark = a_question_mark
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_agent_typed_open_argument (Current)
		end

invariant

	question_mark_not_void: question_mark /= Void

end
