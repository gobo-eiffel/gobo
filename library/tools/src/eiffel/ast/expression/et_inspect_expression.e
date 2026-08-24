note

	description:

		"Eiffel inspect expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2020-2026, Eric Bezault and others"
	license: "MIT License"

class ET_INSPECT_EXPRESSION

inherit

	ET_EXPRESSION
		redefine
			reset,
			is_instance_free,
			has_result,
			has_address_expression,
			has_agent,
			has_typed_object_test,
			add_old_expressions,
			add_formal_arguments,
			add_separate_arguments
		end

	ET_INSPECT_COMPONENT
		rename
			else_part as else_expression
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
			precursor
			expression.reset
			if attached when_parts as l_when_parts then
				l_when_parts.reset
			end
			if attached else_part as l_else_part then
				l_else_part.expression.reset
			end
		end

feature -- Access

	when_parts: detachable ET_WHEN_EXPRESSION_LIST
			-- When parts

	else_part: detachable ET_CONDITIONAL
			-- Else part

	else_expression: detachable ET_EXPRESSION
			-- Else expression
		do
			if attached else_part as l_else_part then
				Result := l_else_part.expression
			end
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

	has_result: BOOLEAN
			-- Does the entity 'Result' appear in current expression
			-- or (recursively) in one of its subexpressions?
		do
			Result := expression.has_result or
				attached when_parts as l_when_parts and then l_when_parts.has_result or
				attached else_part as l_else_part and then l_else_part.expression.has_result
		end

	has_address_expression: BOOLEAN
			-- Does an address expression appear in current expression
			-- or (recursively) in one of its subexpressions?
		do
			Result := expression.has_address_expression or
				attached when_parts as l_when_parts and then l_when_parts.has_address_expression or
				attached else_part as l_else_part and then l_else_part.expression.has_address_expression
		end

	has_agent: BOOLEAN
			-- Does an agent appear in current expression
			-- or (recursively) in one of its subexpressions?
		do
			Result := expression.has_agent or
				attached when_parts as l_when_parts and then l_when_parts.has_agent or
				attached else_part as l_else_part and then l_else_part.expression.has_agent
		end

	has_typed_object_test: BOOLEAN
			-- Does a typed object-test appear in current expression
			-- or (recursively) in one of its subexpressions?
		do
			Result := expression.has_typed_object_test or
				attached when_parts as l_when_parts and then l_when_parts.has_typed_object_test or
				attached else_part as l_else_part and then l_else_part.expression.has_typed_object_test
		end

feature -- Setting

	set_else_part (a_else_part: like else_part)
			-- Set `else_part' to `a_else_part'.
		do
			else_part := a_else_part
		ensure
			else_part_set: else_part = a_else_part
		end

feature -- Formal arguments

	add_formal_arguments (a_list: DS_ARRAYED_LIST_2 [detachable ET_IDENTIFIER, BOOLEAN])
			-- Add to `a_list' all formal arguments appearing in current expression
			-- and (recursively) in its subexpressions: set the boolean to true
			-- if the formal argument name at the index corresponding to its seed
			-- is not Void.
		do
			expression.add_formal_arguments (a_list)
			if attached when_parts as l_when_parts then
				l_when_parts.add_formal_arguments (a_list)
			end
			if attached else_part as l_else_part then
				l_else_part.expression.add_formal_arguments (a_list)
			end
		end

feature -- Assertions

	add_old_expressions (a_list: DS_ARRAYED_LIST [ET_OLD_EXPRESSION])
			-- Add to `a_list' all old expressions appearing in current expression
			-- and (recursively) in its subexpressions.
		do
			expression.add_old_expressions (a_list)
			if attached when_parts as l_when_parts then
				l_when_parts.add_old_expressions (a_list)
			end
			if attached else_part as l_else_part then
				l_else_part.expression.add_old_expressions (a_list)
			end
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
			if attached when_parts as l_when_parts then
				nb := l_when_parts.count
				from i := 1 until i > nb loop
					l_when_parts.item (i).then_expression.add_separate_arguments (a_list, a_closure)
					i := i + 1
				end
			end
			if attached else_part as l_else_part then
				l_else_part.expression.add_separate_arguments (a_list, a_closure)
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_inspect_expression (Current)
		end

end
