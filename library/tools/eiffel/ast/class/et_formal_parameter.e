indexing

	description:

		"Eiffel formal generic parameters"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2004, Eric Bezault and others"
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

	make (a_name: like name) is
			-- Create a new formal generic parameter.
		require
			a_name_not_void: a_name /= Void
		do
			name := a_name
			index := 1
		ensure
			name_set: name = a_name
		end

feature -- Access

	type_mark: ET_KEYWORD
			-- 'expanded', 'reference' keyword

	constraint: ET_TYPE is
			-- Generic constraint
		do
			-- Result := Void
		end

	creation_procedures: ET_CONSTRAINT_CREATOR is
			-- Creation procedures expected in `constraint'
		do
			-- Result := Void
		ensure
			constraint_not_void: Result /= Void implies constraint /= Void
		end

	constraint_base_type: ET_BASE_TYPE is
			-- Base type of constraint;
			-- Void means that there is no explicit constraint
			-- (i.e. the implicit constraint is "ANY"), or there
			-- is a cycle of the form "A [G -> H, H -> G]" in
			-- the constraints (i.e. the base type is also considered
			-- to be "ANY" in that case)
		do
			-- Result := Void
		end

	hash_code: INTEGER is
			-- Hash code value
		do
			Result := index
		end

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			if type_mark /= Void then
				Result := type_mark.position
			else
				Result := name.position
			end
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			if type_mark /= Void then
				Result := type_mark
			else
				Result := name
			end
		end

	formal_parameter: ET_FORMAL_PARAMETER is
			-- Formal generic parameter in comma-separated list
		do
			Result := Current
		end

feature -- Status report

	is_expanded: BOOLEAN is
			-- Has formal parameter been declared as expanded?
		do
			Result := type_mark /= Void and then type_mark.is_expanded
		end

	is_reference: BOOLEAN is
			-- Has formal parameter been declared as reference?
		do
			Result := type_mark /= Void and then type_mark.is_reference
		end

feature -- Setting

	set_index (an_index: INTEGER) is
			-- Set `index' to `an_index'.
		require
			an_index_positive: an_index >= 1
		do
			index := an_index
		ensure
			index_set: index = an_index
		end

	set_type_mark (a_keyword: like type_mark) is
			-- Set `type_mark' to `a_keyword'.
		do
			type_mark := a_keyword
		ensure
			type_mark_set: type_mark = a_keyword
		end

	set_constraint_base_type (a_type: like constraint_base_type) is
			-- Set `constraint_base_type' to `a_type'.
		require
			constrained: constraint /= Void
			a_type_not_void: a_type /= Void
			a_type_named: a_type.is_named_type
		do
			check not_constrained: constraint = Void end
		ensure
			constraint_base_type_set: constraint_base_type = a_type
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_formal_parameter (Current)
		end

invariant

	constraint_base_type_named: constraint_base_type /= Void implies constraint_base_type.is_named_type

end
