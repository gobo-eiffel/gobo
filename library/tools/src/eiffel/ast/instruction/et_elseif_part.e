note

	description:

		"Eiffel 'elseif' parts"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2014, Eric Bezault and others"
	license: "MIT License"

class ET_ELSEIF_PART

inherit

	ET_AST_NODE

create

	make

feature {NONE} -- Initialization

	make (a_conditional: like conditional; a_then_compound: like then_compound)
			-- Create a new elseif part.
		require
			a_conditional_not_void: a_conditional /= Void
		do
			conditional := a_conditional
			then_compound := a_then_compound
		ensure
			conditional_set: conditional = a_conditional
			then_compound_set: then_compound = a_then_compound
		end

feature -- Initialization

	reset
			-- Reset elseif part as it was when it was last parsed.
		do
			expression.reset
			if attached then_compound as l_then_compound then
				l_then_compound.reset
			end
		end

feature -- Access

	conditional: ET_CONDITIONAL
			-- Condition

	expression: ET_EXPRESSION
			-- Boolean expression
		do
			Result := conditional.expression
		ensure
			expression_not_void: Result /= Void
		end

	then_compound: detachable ET_COMPOUND
			-- Then part

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := conditional.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := conditional.first_leaf
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			if attached then_compound as l_then_compound then
				Result := l_then_compound.last_leaf
			else
				Result := conditional.last_leaf
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_elseif_part (Current)
		end

invariant

	conditional_not_void: conditional /= Void

end
