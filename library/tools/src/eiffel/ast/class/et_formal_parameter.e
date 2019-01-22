note

	description:

		"Eiffel formal generic parameters"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_FORMAL_PARAMETER

inherit

	ET_FORMAL_PARAMETER_ITEM

	ET_FORMAL_PARAMETER_TYPE
		rename
			make as make_type
		undefine
			type, label, actual_parameter
		redefine
			process, position, first_leaf,
			type_mark
		end

	HASHABLE

create

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_class: ET_CLASS)
			-- Create a new formal generic parameter.
		require
			a_name_not_void: a_name /= Void
			a_class_not_void: a_class /= Void
		do
			name := a_name
			index := 1
			constraint_index := 1
			implementation_class := a_class
		ensure
			name_set: name = a_name
			constraint_index_set: constraint_index = 1
			implementation_class_set: implementation_class = a_class
		end

feature -- Initialization

	reset_constraint_creation_procedures
			-- Reset constraint creation procedures as they were just
			-- after they were last parsed.
		do
			if attached creation_procedures as l_creation_procedures then
				l_creation_procedures.reset
			end
		end

feature -- Access

	type_mark: detachable ET_KEYWORD
			-- 'expanded', 'reference' keyword

	constraint: detachable ET_CONSTRAINT
			-- Generic constraint
		do
			-- Result := Void
		end

	creation_procedures: detachable ET_CONSTRAINT_CREATOR
			-- Creation procedures expected in `constraint'
		do
			-- Result := Void
		ensure
			constraint_not_void: Result /= Void implies constraint /= Void
		end

	constraint_base_types: ET_CONSTRAINT_BASE_TYPES
			-- Base types of `constraint'.
			-- "detachable ANY" if no constraint.
		do
			Result := implementation_class.universe.detachable_any_type
		ensure
			constraint_base_types_not_void: Result /= Void
			constraint_base_types_are_named_types: Result.are_named_types
		end

	recursive_formal_constraints: detachable SPECIAL [NATURAL_32]
			-- Formal parameters which are constraints (recursively) of
			-- the current formal parameter, or Void if no such constraint.
			-- Indexed by formal parameter indexes (index 0 is not used).
			-- Flags:
			--  No_type_mark (0b1): as if we had "G -> H".
			--  Attached_mark (0b10): as if we had "G -> attached H".
			--  Detachable_mark (0b100): as if we had "G -> detachable H".
		do
			-- Result := Void
		ensure
			valid_count: Result /= Void implies Result.count = implementation_class.formal_parameter_count + 1
		end

	hash_code: INTEGER
			-- Hash code value
		do
			Result := index
		end

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			if attached type_mark as l_type_mark then
				Result := l_type_mark.position
			else
				Result := name.position
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			if attached type_mark as l_type_mark then
				Result := l_type_mark
			else
				Result := name
			end
		end

	formal_parameter: ET_FORMAL_PARAMETER
			-- Formal generic parameter in comma-separated list
		do
			Result := Current
		end

feature -- Status report

	is_expanded: BOOLEAN
			-- Has formal parameter been declared as expanded?
		do
			Result := attached type_mark as l_type_mark and then l_type_mark.is_expanded
		end

	is_reference: BOOLEAN
			-- Has formal parameter been declared as reference?
		do
			Result := attached type_mark as l_type_mark and then l_type_mark.is_reference
		end

	has_constraint_cycle: BOOLEAN
			-- Is there some cycle in the constraint?
			-- (e.g. "[G -> G]" or "[G -> H, H -> G]")
		do
			-- Result := False
		end

feature -- Setting

	set_index (an_index: INTEGER)
			-- Set `index' to `an_index'.
		require
			an_index_positive: an_index >= 1
		do
			index := an_index
		ensure
			index_set: index = an_index
		end

	set_type_mark (a_keyword: like type_mark)
			-- Set `type_mark' to `a_keyword'.
		do
			type_mark := a_keyword
		ensure
			type_mark_set: type_mark = a_keyword
		end

feature -- Flags

	No_type_mark: NATURAL_32 = 0b1
	Attached_mark: NATURAL_32 = 0b10
	Detachable_mark: NATURAL_32 = 0b100
			-- Flags for `recursive_formal_constraints'

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_formal_parameter (Current)
		end

end
