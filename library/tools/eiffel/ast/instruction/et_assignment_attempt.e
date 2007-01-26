indexing

	description:

		"Eiffel assignment-attempt instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ASSIGNMENT_ATTEMPT

inherit

	ET_INSTRUCTION
		redefine
			reset
		end

create

	make

feature {NONE} -- Initialization

	make (a_target: like target; a_source: like source) is
			-- Create a new assignment-attempt instruction.
		require
			a_target_not_void: a_target /= Void
			a_source_not_void: a_source /= Void
		do
			target := a_target
			source := a_source
			assign_attempt_symbol := tokens.assign_attempt_symbol
		ensure
			target_set: target = a_target
			source_set: source = a_source
		end

feature -- Initialization

	reset is
			-- Reset instruction as it was when it was first parsed.
		do
			target.reset
			source.reset
		end

feature -- Access

	target: ET_WRITABLE
			-- Target of assignment

	source: ET_EXPRESSION
			-- Source of assignment

	assign_attempt_symbol: ET_SYMBOL
			-- '?=' symbol

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := target.position
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := target.first_leaf
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

	set_assign_attempt_symbol (an_assign_attempt: like assign_attempt_symbol) is
			-- Set `assign_attempt_symbol' to `an_assign_attempt'.
		require
			an_assign_attempt_not_void: an_assign_attempt /= Void
		do
			assign_attempt_symbol := an_assign_attempt
		ensure
			assign_attempt_symbol_set: assign_attempt_symbol = an_assign_attempt
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_assignment_attempt (Current)
		end

invariant

	target_not_void: target /= Void
	source_not_void: source /= Void
	assign_attempt_symbol_not_void: assign_attempt_symbol /= Void

end
