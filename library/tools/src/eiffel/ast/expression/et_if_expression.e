note

	description:

		"Eiffel 'if' expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017-2024, Eric Bezault and others"
	license: "MIT License"

class ET_IF_EXPRESSION

inherit

	ET_EXPRESSION
		redefine
			reset,
			is_instance_free,
			has_result,
			has_address_expression,
			has_agent,
			has_typed_object_test,
			add_separate_arguments
		end

create

	make

feature {NONE} -- Initialization

	make (a_conditional: like conditional; a_then_expression: like then_expression; a_else_expression: like else_expression)
			-- Create a new 'if' expression.
		require
			a_conditional_not_void: a_conditional /= Void
			a_then_expression_not_void: a_then_expression /= Void
			a_else_expression_not_void: a_else_expression /= Void
		do
			conditional := a_conditional
			then_keyword := tokens.then_keyword
			then_expression := a_then_expression
			else_keyword := tokens.else_keyword
			else_expression := a_else_expression
			end_keyword := tokens.end_keyword
		ensure
			conditional_set: conditional = a_conditional
			then_expression_set: then_expression = a_then_expression
			else_expression_set: else_expression = a_else_expression
		end

feature -- Initialization

	reset
			-- Reset expression as it was just after it was last parsed.
		do
			conditional_expression.reset
			then_expression.reset
			if attached elseif_parts as l_elseif_parts then
				l_elseif_parts.reset
			end
			else_expression.reset
		end

feature -- Access

	conditional: ET_CONDITIONAL
			-- Condition

	conditional_expression: ET_EXPRESSION
			-- Boolean expression
		do
			Result := conditional.expression
		ensure
			conditional_xpression_not_void: Result /= Void
		end

	then_keyword: ET_KEYWORD
			-- Then keyword

	then_expression: ET_EXPRESSION
			-- Then expression

	elseif_parts: detachable ET_ELSEIF_EXPRESSION_LIST
			-- Elseif parts

	else_keyword: ET_KEYWORD
			-- Then keyword

	else_expression: ET_EXPRESSION
			-- Then expression

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
			Result := conditional_expression.is_instance_free and
				then_expression.is_instance_free and
				(attached elseif_parts as l_elseif_parts implies l_elseif_parts.is_instance_free) and
				else_expression.is_instance_free
		end

	has_result: BOOLEAN
			-- Does the entity 'Result' appear in current expression
			-- or (recursively) in one of its subexpressions?
		do
			Result := conditional_expression.has_result or
				then_expression.has_result or
				attached elseif_parts as l_elseif_parts and then l_elseif_parts.has_result or
				else_expression.has_result
		end

	has_address_expression: BOOLEAN
			-- Does an address expression appear in current expression
			-- or (recursively) in one of its subexpressions?
		do
			Result := conditional_expression.has_address_expression or
				then_expression.has_address_expression or
				attached elseif_parts as l_elseif_parts and then l_elseif_parts.has_address_expression or
				else_expression.has_address_expression
		end

	has_agent: BOOLEAN
			-- Does an agent appear in current expression
			-- or (recursively) in one of its subexpressions?
		do
			Result := conditional_expression.has_agent or
				then_expression.has_agent or
				attached elseif_parts as l_elseif_parts and then l_elseif_parts.has_agent or
				else_expression.has_agent
		end

	has_typed_object_test: BOOLEAN
			-- Does a typed object-test appear in current expression
			-- or (recursively) in one of its subexpressions?
		do
			Result := conditional_expression.has_typed_object_test or
				then_expression.has_typed_object_test or
				attached elseif_parts as l_elseif_parts and then l_elseif_parts.has_typed_object_test or
				else_expression.has_typed_object_test
		end

feature -- Setting

	set_elseif_parts (an_elseif_parts: like elseif_parts)
			-- Set `elseif_parts' to `an_elseif_parts'.
		do
			elseif_parts := an_elseif_parts
		ensure
			elseif_parts_set: elseif_parts = an_elseif_parts
		end

	set_then_keyword (a_then: like then_keyword)
			-- Set `then_keyword' to `a_then'.
		do
			then_keyword := a_then
		ensure
			then_keyword_set: then_keyword = a_then
		end

	set_else_keyword (a_else: like else_keyword)
			-- Set `else_keyword' to `a_else'.
		do
			else_keyword := a_else
		ensure
			else_keyword_set: else_keyword = a_else
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

feature -- SCOOP

	add_separate_arguments (a_list: DS_ARRAYED_LIST [ET_IDENTIFIER]; a_closure: ET_CLOSURE)
			-- Add to `a_list' inline separate arguments or formal arguments which
			-- when controlled (i.e. when their type is separate) implies that when
			-- the current expression is involved in the target of a separate call
			-- this target is also controlled.
			-- `a_closure' is the closure (i.e. inline agent or enclosing feature)
			-- in which the current expression appears.
			-- (Used when determining the SCOOP sessions to be used when recording
			-- a separate call to another SCOOP processor.)
		local
			i, nb: INTEGER
		do
			then_expression.add_separate_arguments (a_list, a_closure)
			if attached elseif_parts as l_elseif_parts then
				nb := l_elseif_parts.count
				from i := 1 until i > nb loop
					l_elseif_parts.item (i).then_expression.add_separate_arguments (a_list, a_closure)
					i := i + 1
				end
			end
			else_expression.add_separate_arguments (a_list, a_closure)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_if_expression (Current)
		end

invariant

	conditional_not_void: conditional /= Void
	then_keyword_not_void: then_keyword /= Void
	then_expression_not_void: then_expression /= Void
	else_keyword_not_void: else_keyword /= Void
	else_expression_not_void: else_expression /= Void
	end_keyword_not_void: end_keyword /= Void

end
