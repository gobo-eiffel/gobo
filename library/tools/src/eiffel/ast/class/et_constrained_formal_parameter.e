note

	description:

		"Eiffel constrained formal generic parameters"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_CONSTRAINED_FORMAL_PARAMETER

inherit

	ET_FORMAL_PARAMETER
		rename
			make as make_unconstrained
		redefine
			constraint, creation_procedures, last_leaf, process,
			constraint_base_types, has_constraint_cycle,
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
			constraint_base_types := implementation_class.universe.detachable_any_type
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
			constraint_base_types := implementation_class.universe.detachable_any_type
			has_constraint_cycle := False
			reset_constraint_creation_procedures
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
		do
			constraint_base_types := a_base_types
		ensure
			constraint_base_types_set: constraint_base_types = a_base_types
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

feature -- Status setting

	set_has_constraint_cycle (b: BOOLEAN)
			-- Set `has_constraint_cycle' to `b'.
		do
			has_constraint_cycle := b
		ensure
			has_constraint_cycle_set: has_constraint_cycle = b
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
