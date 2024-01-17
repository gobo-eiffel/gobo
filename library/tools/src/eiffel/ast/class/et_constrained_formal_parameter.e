note

	description:

		"Eiffel constrained formal generic parameters"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2023, Eric Bezault and others"
	license: "MIT License"

class ET_CONSTRAINED_FORMAL_PARAMETER

inherit

	ET_FORMAL_PARAMETER
		rename
			make as make_unconstrained
		redefine
			constraint, creation_procedures, last_leaf, process,
			constraint_base_types, has_constraint_cycle,
			recursive_formal_constraints,
			reset_constraint_renames,
			reset_constraint_base_types,
			reset
		end

create

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_constraint: like constraint; a_creation: like creation_procedures; a_class: ET_CLASS)
			-- Create a new constrained formal generic parameter.
		require
			a_name_not_void: a_name /= Void
			a_constraint_not_void: a_constraint /= Void
			a_class_not_void: a_class /= Void
		do
			arrow_symbol := tokens.arrow_symbol
			constraint := a_constraint
			creation_procedures := a_creation
			make_unconstrained (a_name, a_class)
			constraint_base_types := implementation_class.universe.detachable_separate_any_type
		ensure
			name_set: name = a_name
			constraint_set: constraint = a_constraint
			creation_procedures_set: creation_procedures = a_creation
			implementation_class_set: implementation_class = a_class
		end

feature -- Initialization

	reset
			-- Reset type as it was just after it was last parsed.
		do
			constraint.reset
			reset_constraint_base_types
			reset_constraint_creation_procedures
		end

	reset_constraint_renames
			-- Reset constraint renames as they were just
			-- after they were last parsed.
		do
			constraint.reset_renames
		end

	reset_constraint_base_types
			-- Reset `constraint_base_types' and `recursive_formal_constraints'
			-- as they were just after the current formal parameter was last parsed.
		do
			constraint_base_types := implementation_class.universe.detachable_separate_any_type
			recursive_formal_constraints := Void
		end

feature -- Access

	arrow_symbol: ET_SYMBOL
			-- '->' symbol

	constraint: ET_CONSTRAINT
			-- Generic constraint

	creation_procedures: detachable ET_CONSTRAINT_CREATOR
			-- Creation procedures expected in `constraint'

	constraint_base_types: ET_CONSTRAINT_BASE_TYPES
			-- Base types of `constraint'.
			-- "detachable ANY" if no constraint.

	recursive_formal_constraints: detachable SPECIAL [NATURAL_32]
			-- Formal parameters which are constraints (recursively) of
			-- the current formal parameter, or Void if no such constraint.
			-- Indexed by formal parameter indexes (index 0 is not used).
			-- Flags:
			--  No_type_mark (0b1): as if we had "G -> H".
			--  Attached_mark (0b10): as if we had "G -> attached H".
			--  Detachable_mark (0b100): as if we had "G -> detachable H".

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			if attached creation_procedures as l_creation_procedures then
				Result := l_creation_procedures.last_leaf
			elseif attached renames as l_renames then
				Result := l_renames.last_leaf
			else
				Result := constraint.last_leaf
			end
		end

feature -- Status report

	has_constraint_cycle: BOOLEAN
			-- Is there some cycle in the constraint?
			-- (e.g. "[G -> G]" or "[G -> H, H -> G]")
		do
			Result := attached recursive_formal_constraints as l_recursive_formal_constraints and then l_recursive_formal_constraints.item (index) /= 0
		end

feature -- Setting

	set_constraint (a_constraint: like constraint)
			-- Set `a_constraint' to `constraint'.
		require
			a_constraint_not_void: a_constraint /= Void
		do
			constraint := a_constraint
		ensure
			constraint_set: constraint = a_constraint
		end

	set_constraint_base_types (a_base_types: like constraint_base_types)
			-- Set `constraint_base_types' to `a_base_types'.
		require
			a_base_types_not_void: a_base_types /= Void
			a_base_types_are_named_types: a_base_types.are_named_types
		do
			constraint_base_types := a_base_types
		ensure
			constraint_base_types_set: constraint_base_types = a_base_types
		end

	set_recursive_formal_constraints (a_recursive_formal_constraints: like recursive_formal_constraints)
			-- Set `recursive_formal_constraints' to `a_recursive_formal_constraints'.
		require
			valid_count: a_recursive_formal_constraints /= Void implies a_recursive_formal_constraints.count = implementation_class.formal_parameter_count + 1
		do
			recursive_formal_constraints := a_recursive_formal_constraints
		ensure
			recursive_formal_constraints_set: recursive_formal_constraints = a_recursive_formal_constraints
		end

	set_arrow_symbol (an_arrow: like arrow_symbol)
			-- Set `arrow_symbol' to `an_arrow'.
		require
			an_arrow_not_void: an_arrow /= Void
		do
			arrow_symbol := an_arrow
		ensure
			arrow_symbol_set: arrow_symbol = an_arrow
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_constrained_formal_parameter (Current)
		end

invariant

	arrow_symbol_not_void: arrow_symbol /= Void
	constraint_not_void: constraint /= Void

end
