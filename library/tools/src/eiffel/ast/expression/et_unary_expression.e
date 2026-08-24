note

	description:

		"Eiffel unary expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2026, Eric Bezault and others"
	license: "MIT License"

deferred class ET_UNARY_EXPRESSION

inherit

	ET_EXPRESSION
		redefine
			is_instance_free,
			has_result,
			has_address_expression,
			has_agent,
			has_typed_object_test,
			add_old_expressions,
			add_formal_arguments
		end

feature -- Access

	expression: ET_EXPRESSION
			-- Expression

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := expression.last_leaf
		end

feature -- Status report

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

feature -- Formal arguments

	add_formal_arguments (a_list: DS_ARRAYED_LIST_2 [detachable ET_IDENTIFIER, BOOLEAN])
			-- Add to `a_list' all formal arguments appearing in current expression
			-- and (recursively) in its subexpressions: set the boolean to true
			-- if the formal argument name at the index corresponding to its seed
			-- is not Void.
		do
			expression.add_formal_arguments (a_list)
		end

feature -- Assertions

	add_old_expressions (a_list: DS_ARRAYED_LIST [ET_OLD_EXPRESSION])
			-- Add to `a_list' all old expressions appearing in current expression
			-- and (recursively) in its subexpressions.
		do
			expression.add_old_expressions (a_list)
		end

invariant

	expression_not_void: expression /= Void

end
