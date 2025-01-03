﻿note

	description:

		"Eiffel parenthesized expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2024, Eric Bezault and others"
	license: "MIT License"

class ET_PARENTHESIZED_EXPRESSION

inherit

	ET_EXPRESSION
		redefine
			unparenthesized_expression,
			reset, is_current,
			is_false, is_true,
			is_instance_free,
			has_result,
			has_address_expression,
			has_agent,
			has_typed_object_test,
			add_old_expressions,
			add_separate_arguments
		end

	ET_AGENT_TARGET
		undefine
			reset
		redefine
			is_instance_free,
			has_result,
			has_address_expression,
			has_agent,
			has_typed_object_test,
			add_old_expressions,
			is_current
		end

create

	make

feature {NONE} -- Initialization

	make (e: like expression)
			-- Create a new parenthesized expression.
		require
			e_not_void: e /= Void
		do
			left_parenthesis := tokens.left_parenthesis_symbol
			expression := e
			right_parenthesis := tokens.right_parenthesis_symbol
		ensure
			expression_set: expression = e
		end

feature -- Initialization

	reset
			-- Reset expression as it was just after it was last parsed.
		do
			precursor {ET_EXPRESSION}
			expression.reset
		end

feature -- Status report

	is_current: BOOLEAN
			-- Is current expression the 'Current' entity (possibly parenthesized)?
		do
			Result := expression.is_current
		end

	is_false: BOOLEAN
			-- Is current expression the 'False' entity (possibly parenthesized)?
		do
			Result := expression.is_false
		end

	is_true: BOOLEAN
			-- Is current expression the 'True' entity (possibly parenthesized)?
		do
			Result := expression.is_true
		end

	is_instance_free: BOOLEAN
			-- Does current expression not depend on 'Current' or its attributes?
			-- Note that we do not consider unqualified calls and Precursors as
			-- instance-free because it's not always possible syntactically
			-- to determine whether the feature being called is a class feature
			-- or not.
		do
			Result := expression.is_instance_free
		end

	has_result: BOOLEAN
			-- Does the entity 'Result' appear in current expression
			-- or (recursively) in one of its subexpressions?
		do
			Result := expression.has_result
		end

	has_address_expression: BOOLEAN
			-- Does an address expression appear in current expression
			-- or (recursively) in one of its subexpressions?
		do
			Result := expression.has_address_expression
		end

	has_agent: BOOLEAN
			-- Does an agent appear in current expression
			-- or (recursively) in one of its subexpressions?
		do
			Result := expression.has_agent
		end

	has_typed_object_test: BOOLEAN
			-- Does a typed object-test appear in current expression
			-- or (recursively) in one of its subexpressions?
		do
			Result := expression.has_typed_object_test
		end

feature -- Access

	expression: ET_EXPRESSION
			-- Expression

	left_parenthesis: ET_SYMBOL
			-- Left parenthesis

	right_parenthesis: ET_SYMBOL
			-- Right parenthesis

	unparenthesized_expression: ET_EXPRESSION
			-- Version of current expression without any surrounding parentheses
		do
			Result := expression.unparenthesized_expression
		end

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := left_parenthesis.position
			if Result.is_null then
				Result := expression.position
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := left_parenthesis
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := right_parenthesis
		end

feature -- Setting

	set_left_parenthesis (l: like left_parenthesis)
			-- Set `left_parenthesis' to `l'.
		require
			l_not_void: l /= Void
		do
			left_parenthesis := l
		ensure
			left_parenthesis_set: left_parenthesis = l
		end

	set_right_parenthesis (r: like right_parenthesis)
			-- Set `right_parenthesis' to `r'.
		require
			r_not_void: r /= Void
		do
			right_parenthesis := r
		ensure
			right_parenthesis_set: right_parenthesis = r
		end

feature -- Assertions

	add_old_expressions (a_list: DS_ARRAYED_LIST [ET_OLD_EXPRESSION])
			-- Add to `a_list' all old expressions appearing in current expression
			-- and (recursively) in its subexpressions.
		do
			expression.add_old_expressions (a_list)
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
		do
			expression.add_separate_arguments (a_list, a_closure)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_parenthesized_expression (Current)
		end

invariant

	expression_not_void: expression /= Void
	left_parenthesis_not_void: left_parenthesis /= Void
	right_parenthesis: right_parenthesis /= Void

end
