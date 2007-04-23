indexing

	description:

		"Eiffel assigner instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005-2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ASSIGNER_INSTRUCTION

inherit

	ET_INSTRUCTION
		redefine
			reset
		end

	ET_FEATURE_CALL_INSTRUCTION -- Unfolded form
		undefine
			reset
		end

	ET_ACTUAL_ARGUMENTS -- Arguments of unfolded form

create

	make

feature {NONE} -- Initialization

	make (a_call: like call; a_source: like source) is
			-- Create a new assigner instruction.
		require
			a_call_not_void: a_call /= Void
			a_call_qualified_call: a_call.is_qualified_call
			a_source_not_void: a_source /= Void
		do
			call := a_call
			source := a_source
			assign_symbol := tokens.assign_symbol
			name := dummy_name
		ensure
			call_set: call = a_call
			source_set: source = a_source
		end

feature -- Initialization

	reset is
			-- Reset instruction as it was just after it was last parsed.
		local
			l_convert: ET_CONVERT_EXPRESSION
		do
			call.reset
			l_convert ?= source
			if l_convert /= Void then
				source := l_convert.expression
			end
			source.reset
			name := dummy_name
		end

feature -- Access

	call: ET_FEATURE_CALL_EXPRESSION
			-- Target of assignment

	source: ET_EXPRESSION
			-- Source of assignment

	assign_symbol: ET_SYMBOL
			-- ':=' symbol

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := call.position
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := call.first_leaf
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := source.last_leaf
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := source.break
		end

feature -- Setting

	set_source (a_source: like source) is
			-- Set `source' to `a_source'.
		require
			a_source_not_void: a_source /= Void
		do
			source := a_source
		ensure
			source_set: source = a_source
		end

	set_assign_symbol (an_assign: like assign_symbol) is
			-- Set `assign_symbol' to `an_assign'.
		require
			an_assign_not_void: an_assign /= Void
		do
			assign_symbol := an_assign
		ensure
			assign_symbol_set: assign_symbol = an_assign
		end

	set_name (a_name: like name) is
			-- Set `name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
		do
			name := a_name
		ensure
			name_set: name = a_name
		end

feature -- Unfolded form

	target: ET_EXPRESSION is
			-- Target of unfolded form
		do
			Result := call.target
		ensure then
			definition: Result = call.target
		end

	name: ET_CALL_NAME
			-- Feature name of unfolded form

	arguments: ET_ACTUAL_ARGUMENTS is
			-- Arguments of unfolded form
		do
			Result := Current
		end

feature -- Arguments of unfolded form

	actual_argument (i: INTEGER): ET_EXPRESSION is
			-- Actual argument at index `i' in unfolded form
		do
			if i = 1 then
				Result := source
			else
				Result := call.arguments.actual_argument (i - 1)
			end
		end

	count: INTEGER is
			-- Number of actual arguments in unfolded form
		do
			Result := call.arguments_count + 1
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_assigner_instruction (Current)
		end

feature {NONE} -- Constants

	dummy_name: ET_IDENTIFIER is
			-- Dummy name of unfolded form
		once
			create Result.make ("***dummy***")
		ensure
			dummy_name_not_void: Result /= Void
		end

invariant

	call_not_void: call /= Void
	call_qualified: call.is_qualified_call
	source_not_void: source /= Void
	assign_symbol_not_void: assign_symbol /= Void

end
