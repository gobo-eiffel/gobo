indexing

	description:

		"Eiffel class invariants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_INVARIANTS

inherit

	ET_ASSERTIONS
		rename
			make as make_assertions,
			make_with_capacity as make_assertions_with_capacity
		end

	ET_ENCLOSING_FEATURE

	ET_ENCLOSED_FEATURE
		redefine
			is_invariants,
			as_invariants
		end

create

	make, make_with_capacity

feature {NONE} -- Initialization

	make (a_class: like implementation_class) is
			-- Create a new invariant clause.
		require
			a_class_not_void: a_class /= Void
		do
			implementation_class := a_class
			invariant_keyword := tokens.invariant_keyword
			make_assertions
		ensure
			is_empty: is_empty
			capacity_set: capacity = 0
			implementation_class_set: implementation_class = a_class
		end

	make_with_capacity (a_class: like implementation_class; nb: INTEGER) is
			-- Create a new invariant clause with capacity `nb'.
		require
			a_class_not_void: a_class /= Void
		do
			implementation_class := a_class
			invariant_keyword := tokens.invariant_keyword
			make_assertions_with_capacity (nb)
		ensure
			is_empty: is_empty
			capacity_set: capacity = nb
			implementation_class_set: implementation_class = a_class
		end

feature -- Status report

	is_invariants: BOOLEAN is True
			-- Is `Current' class invariants?

feature -- Access

	invariant_keyword: ET_KEYWORD
			-- 'invariant' keyword

	type: ET_TYPE is
			-- Return type;
			-- Void for procedures
		do
		end

	arguments: ET_FORMAL_ARGUMENT_LIST is
			-- Formal arguments;
			-- Void if not a routine or a routine with no arguments
		do
		end

	locals: ET_LOCAL_VARIABLE_LIST is
			-- Local variables;
			-- Void if not an internal routine or a routine with no local variables
		do
		end

	first_precursor: ET_INVARIANTS is
			-- First precursor;
			-- Void if the feature has no precursor.
			-- Useful to build the flat preconditions and
			-- postconditions of the feature.
		do
		end

	implementation_class: ET_CLASS
			-- Class where implementation of current invariants
			-- have been provided

	implementation_feature: ET_INVARIANTS is
			-- Current feature in `implementation_class'
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

	header_break: ET_BREAK is
			-- Break which appears where the header comment is expected
		do
			-- Result := Void
		end

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := invariant_keyword.position
			if Result.is_null and not is_empty then
				Result := first.position
			end
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := invariant_keyword
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			if not is_empty then
				Result := last.last_leaf
			else
				Result := invariant_keyword
			end
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			if not is_empty then
				Result := last.break
			else
				Result := invariant_keyword.break
			end
		end

feature -- Export status

	clients: ET_CLASS_NAME_LIST is
			-- Clients to which feature is exported
		once
			Result := tokens.any_clients
		end

feature -- Implementation checking status

	implementation_checked: BOOLEAN
			-- Has the implementation of current feature been checked?
			-- (Check everything except assertions.)

	has_implementation_error: BOOLEAN
			-- Has a fatal error occurred during implementation checking?
			-- (Check everything except assertions.)

	assertions_checked: BOOLEAN
			-- Has the implementation of assertions of current feature been checked?

	has_assertions_error: BOOLEAN
			-- Has a fatal error occurred during assertions implementation checking?

	set_implementation_checked is
			-- Set `implementation_checked' to True.
		do
			implementation_checked := True
		ensure
			implementation_checked: implementation_checked
		end

	set_implementation_error is
			-- Set `has_implementation_error' to True.
		do
			has_implementation_error := True
		ensure
			has_implementation_error: has_implementation_error
		end

	reset_implementation_checked is
			-- Set `implementation_checked' to False.
		do
			has_implementation_error := False
			implementation_checked := False
		ensure
			implementation_not_checked: not implementation_checked
			no_implementation_error: not has_implementation_error
		end

	set_assertions_checked is
			-- Set `assertions_checked' to True.
		do
			assertions_checked := True
		ensure
			assertions_checked: assertions_checked
		end

	set_assertions_error is
			-- Set `has_assertions_error' to True.
		do
			has_assertions_error := True
		ensure
			has_assertions_error: has_assertions_error
		end

	reset_assertions_checked is
			-- Set `assertions_checked' to False.
		do
			has_assertions_error := False
			assertions_checked := False
		ensure
			assertions_not_checked: not assertions_checked
			no_assertions_error: not has_assertions_error
		end

feature -- Setting

	set_invariant_keyword (an_invariant: like invariant_keyword) is
			-- Set `invariant_keyword' to `an_invariant'.
		require
			an_invariant_not_void: an_invariant /= Void
		do
			invariant_keyword := an_invariant
		ensure
			invariant_keyword_not_void: invariant_keyword = an_invariant
		end

feature -- Conversion

	as_invariants: ET_INVARIANTS is
			-- `Current' viewed as class invariants
		do
			Result := Current
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_invariants (Current)
		end

invariant

	invariant_keyword_not_void: invariant_keyword /= Void

end
