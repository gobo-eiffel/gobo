indexing

	description:

		"Eiffel assignment instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_ASSIGNMENT

inherit

	ET_INSTRUCTION

creation

	make

feature {NONE} -- Initialization

	make (a_target: like target; a_source: like source) is
			-- Create a new assignment instruction.
		require
			a_target_not_void: a_target /= Void
			a_source_not_void: a_source /= Void
		do
			target := a_target
			source := a_source
			assign_symbol := tokens.assign_symbol
		ensure
			target_set: target = a_target
			source_set: source = a_source
		end

feature -- Access

	target: ET_WRITABLE
			-- Target of assignment

	source: ET_EXPRESSION
			-- Source of assignment

	assign_symbol: ET_SYMBOL
			-- ':=' symbol

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := target.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := source.break
		end

feature -- Setting

	set_assign_symbol (an_assign: like assign_symbol) is
			-- Set `assign_symbol' to `an_assign'.
		require
			an_assign_not_void: an_assign /= Void
		do
			assign_symbol := an_assign
		ensure
			assign_symbol_set: assign_symbol = an_assign
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_assignment (Current)
		end

invariant

	target_not_void: target /= Void
	source_not_void: source /= Void
	assign_symbol_not_void: assign_symbol /= Void

end
