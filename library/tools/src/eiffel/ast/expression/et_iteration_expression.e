note

	description:
	"[
		Eiffel iteration expressions (either across expressions,
		or quantifier expressions).
	]"
	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ITERATION_EXPRESSION

inherit

	ET_ITERATION_COMPONENT
		redefine
			reset
		end

	ET_EXPRESSION
		redefine
			reset,
			is_instance_free
		end

feature -- Initialization

	reset
			-- Reset expression as it was just after it was last parsed.
		do
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

feature -- Access

	iteration_expression: ET_EXPRESSION
			-- Some or all expression
		deferred
		end

invariant

	iteration_expression_not_void: iteration_expression /= Void
	some_or_all: is_some xor is_all

end
