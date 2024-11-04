note

	description:
	"[
		Eiffel iteration expressions (either across expressions,
		or quantifier expressions).
	]"
	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2019-2024, Eric Bezault and others"
	license: "MIT License"

deferred class ET_ITERATION_EXPRESSION

inherit

	ET_ITERATION_COMPONENT
		redefine
			has_result,
			has_address_expression,
			has_agent,
			has_typed_object_test,
			reset
		end

	ET_EXPRESSION
		undefine
			has_result,
			has_address_expression,
			has_agent,
			has_typed_object_test,
			add_old_expressions
		redefine
			reset,
			is_instance_free
		end

feature -- Initialization

	reset
			-- Reset expression as it was just after it was last parsed.
		do
			precursor {ET_EXPRESSION}
			iteration_expression.reset
			precursor {ET_ITERATION_COMPONENT}
		end

feature -- Status report

	is_all: BOOLEAN
			-- Is the iteration of form 'all' or '∀'?
		deferred
		end

	is_some: BOOLEAN
			-- Is the iteration of form 'some' or '∃'?
		do
			Result := not is_all
		end

	is_instance_free: BOOLEAN
			-- Does current expression not depend on 'Current' or its attributes?
			-- Note that we do not consider unqualified calls and Precursors as
			-- instance-free because it's not always possible syntactically
			-- to determine whether the feature being called is a class feature
			-- or not.
		do
			Result := iterable_expression.is_instance_free and
				iteration_expression.is_instance_free and
				(attached until_conditional as l_until_conditional implies l_until_conditional.expression.is_instance_free) and
				(attached invariant_part as l_invariant_part implies l_invariant_part.is_instance_free) and
				(attached variant_part as l_variant_part implies l_variant_part.expression.is_instance_free)
		end

	has_result: BOOLEAN
			-- Does the entity 'Result' appear in current iteration expression
			-- or (recursively) in one of its subexpressions?
		do
			Result := iteration_expression.has_result or precursor {ET_ITERATION_COMPONENT}
		end

	has_address_expression: BOOLEAN
			-- Does an address expression appear in current iteration expression
			-- or (recursively) in one of its subexpressions?
		do
			Result := iteration_expression.has_address_expression or precursor {ET_ITERATION_COMPONENT}
		end

	has_agent: BOOLEAN
			-- Does an agent appear in current iteration expression
			-- or (recursively) in one of its subexpressions?
		do
			Result := iteration_expression.has_agent or precursor {ET_ITERATION_COMPONENT}
		end

	has_typed_object_test: BOOLEAN
			-- Does a typed object-test appear in current iteration expression
			-- or (recursively) in one of its subexpressions?
		do
			Result := iteration_expression.has_typed_object_test or precursor {ET_ITERATION_COMPONENT}
		end

feature -- Access

	iteration_expression: ET_EXPRESSION
			-- Some or all expression
		deferred
		end

feature -- Assertions

	add_old_expressions (a_list: DS_ARRAYED_LIST [ET_OLD_EXPRESSION])
			-- Add to `a_list' all old expressions appearing in current expression
			-- and (recursively) in its subexpressions.
		do
			iteration_expression.add_old_expressions (a_list)
			iterable_expression.add_old_expressions (a_list)
			if attached until_conditional as l_until_conditional then
				l_until_conditional.expression.add_old_expressions (a_list)
			end
			if attached invariant_part as l_invariant_part then
				l_invariant_part.add_old_expressions (a_list)
			end
			if attached variant_part as l_variant_part then
				l_variant_part.expression.add_old_expressions (a_list)
			end
		end

invariant

	iteration_expression_not_void: iteration_expression /= Void
	some_or_all: is_some xor is_all

end
