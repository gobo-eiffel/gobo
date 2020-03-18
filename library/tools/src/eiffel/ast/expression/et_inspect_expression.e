note

	description:

		"Eiffel inspect expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_INSPECT_EXPRESSION

inherit

	ET_EXPRESSION
		redefine
			reset,
			is_instance_free
		end

create

	make

feature {NONE} -- Initialization

	make (a_conditional: like conditional; a_when_parts: like when_parts)
			-- Create a new inspect expression.
		require
			a_conditional_not_void: a_conditional /= Void
		do
			conditional := a_conditional
			when_parts := a_when_parts
			end_keyword := tokens.end_keyword
		ensure
			conditional_set: conditional = a_conditional
			when_parts_set: when_parts = a_when_parts
		end

feature -- Initialization

	reset
			-- Reset expression as it was just after it was last parsed.
		do
			expression.reset
			if attached when_parts as l_when_parts then
				l_when_parts.reset
			end
			if attached else_part as l_else_part then
				l_else_part.expression.reset
			end
		end

feature -- Access

	conditional: ET_CONDITIONAL
			-- Condition

	expression: ET_EXPRESSION
			-- Inspected expression
		do
			Result := conditional.expression
		ensure
			expression_not_void: Result /= Void
		end

	when_parts: detachable ET_WHEN_EXPRESSION_LIST
			-- When parts

	else_part: detachable ET_CONDITIONAL
			-- Else part

	end_keyword: ET_KEYWORD
			-- 'end' keyword

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
			Result := end_keyword
		end

feature -- Status report

	is_instance_free: BOOLEAN
			-- Does current expression not depend on 'Current' or its attributes?
			-- Note that we do not consider unqualified calls and Precursors as
			-- instance-free because it's not always possible syntactically
			-- to determine whether the feature being called is a class feature
			-- or not.
		do
			Result := expression.is_instance_free and
				(attached when_parts as l_when_parts implies l_when_parts.is_instance_free) and
				(attached else_part as l_else_part implies l_else_part.expression.is_instance_free)
		end

feature -- Setting

	set_else_part (a_else_part: like else_part)
			-- Set `else_part' to `a_else_part'.
		do
			else_part := a_else_part
		ensure
			else_part_set: else_part = a_else_part
		end

	set_end_keyword (an_end: like end_keyword)
			-- Set `end_keyword' to `an_end'.
		require
			an_end_not_void: an_end /= Void
		do
			end_keyword := an_end
		ensure
			end_keyword_set: end_keyword = an_end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_inspect_expression (Current)
		end

invariant

	conditional_not_void: conditional /= Void
	end_keyword_not_void: end_keyword /= Void

end
