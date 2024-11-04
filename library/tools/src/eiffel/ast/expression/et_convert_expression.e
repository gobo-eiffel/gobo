note

	description:

		"Eiffel conversion expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2024, Eric Bezault and others"
	license: "MIT License"

deferred class ET_CONVERT_EXPRESSION

inherit

	ET_EXPRESSION
		redefine
			is_instance_free,
			has_result,
			has_address_expression,
			has_agent,
			has_typed_object_test,
			add_old_expressions
		end

feature -- Access

	expression: ET_EXPRESSION
			-- Expression to be converted

	convert_feature: ET_CONVERT_FEATURE
			-- Conversion feature

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := expression.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := expression.first_leaf
		end

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
			-- Does an address expresssion appear in current expression
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

feature -- Assertions

	add_old_expressions (a_list: DS_ARRAYED_LIST [ET_OLD_EXPRESSION])
			-- Add to `a_list' all old expressions appearing in current expression
			-- and (recursively) in its subexpressions.
		do
			expression.add_old_expressions (a_list)
		end

invariant

	expression_not_void: expression /= Void
	convert_feature_not_void: convert_feature /= Void

end
