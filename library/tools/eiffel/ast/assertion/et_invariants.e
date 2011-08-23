note

	description:

		"Eiffel class invariants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2011, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_INVARIANTS

inherit

	ET_ASSERTIONS
		rename
			make as make_assertions,
			make_with_capacity as make_assertions_with_capacity
		redefine
			reset
		end

	ET_STANDALONE_CLOSURE
		redefine
			is_invariants,
			as_invariants
		end

create

	make, make_with_capacity

feature {NONE} -- Initialization

	make (a_class: like implementation_class)
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

	make_with_capacity (a_class: like implementation_class; nb: INTEGER)
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

feature -- Initialization

	reset
			-- Reset invariants as they were just after they were last parsed.
		do
			if validity_checked then
				precursor
				reset_validity_checked
			end
		end

feature -- Status report

	is_invariants: BOOLEAN = True
			-- Is `Current' class invariants?

feature -- Access

	invariant_keyword: ET_KEYWORD
			-- 'invariant' keyword

	first_precursor: ET_INVARIANTS
			-- First precursor;
			-- Void if the feature has no precursor.
			-- Useful to build the flat preconditions and
			-- postconditions of the feature.
		do
		end

	implementation_class: ET_CLASS
			-- Class where implementation of current invariants
			-- have been provided

	implementation_feature: ET_INVARIANTS
			-- Current feature in `implementation_class'
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

	hash_code: INTEGER
			-- Hash code value
		do
			Result := 1
		end

	header_break: ET_BREAK
			-- Break which appears where the header comment is expected
		do
			-- Result := Void
		end

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := invariant_keyword.position
			if Result.is_null and not is_empty then
				Result := first.position
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := invariant_keyword
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			if not is_empty then
				Result := last.last_leaf
			else
				Result := invariant_keyword
			end
		end

	break: ET_BREAK
			-- Break which appears just after current node
		do
			if not is_empty then
				Result := last.break
			else
				Result := invariant_keyword.break
			end
		end

feature -- Export status

	clients: ET_CLIENT_LIST
			-- Clients to which feature is exported
		do
			if implementation_class.is_preparsed then
				Result := implementation_class.current_system.any_clients
			else
				Result := tokens.empty_clients
			end
		end

feature -- Setting

	set_invariant_keyword (an_invariant: like invariant_keyword)
			-- Set `invariant_keyword' to `an_invariant'.
		require
			an_invariant_not_void: an_invariant /= Void
		do
			invariant_keyword := an_invariant
		ensure
			invariant_keyword_not_void: invariant_keyword = an_invariant
		end

	set_implementation_class (a_class: like implementation_class)
			-- Set `implementation_class' to `a_class'.
		require
			a_class_not_void: a_class /= Void
		do
			implementation_class := a_class
		ensure
			implementation_class_set: implementation_class = a_class
		end

feature -- Conversion

	as_invariants: ET_INVARIANTS
			-- `Current' viewed as class invariants
		do
			Result := Current
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_invariants (Current)
		end

invariant

	invariant_keyword_not_void: invariant_keyword /= Void

end
