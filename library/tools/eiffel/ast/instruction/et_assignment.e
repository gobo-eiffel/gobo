note

	description:

		"Eiffel assignment instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ASSIGNMENT

inherit

	ET_INSTRUCTION
		redefine
			reset
		end

create

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

feature -- Initialization

	reset is
			-- Reset instruction as it was just after it was last parsed.
		local
			l_convert: ET_CONVERT_EXPRESSION
		do
			target.reset
			l_convert ?= source
			if l_convert /= Void then
				source := l_convert.expression
			end
			source.reset
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
