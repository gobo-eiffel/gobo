indexing

	description:

		"Eiffel formal generic parameters"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_FORMAL_PARAMETER

inherit

	ET_FORMAL_PARAMETER_ITEM

	HASHABLE

creation

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

	name: ET_IDENTIFIER
			-- Name

	constraint: ET_TYPE is
			-- Generic constraint
		do
			-- Result := Void
		end

	creation_procedures: ET_CONSTRAINT_CREATOR is
			-- Creation procedures expected in `constraint'
		do
			-- Result := Void
		end

	index: INTEGER
			-- Position in list of generic parameters

	hash_code: INTEGER is
			-- Hash code value
		do
			Result := index
		end

	formal_parameter: ET_FORMAL_PARAMETER is
			-- Formal generic parameter in comma-separated list
		do
			Result := Current
		end

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := name.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := name.break
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

feature -- System

	add_to_system is
			-- Recursively add to system classes that
			-- appear in the constraints.
		do
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_formal_parameter (Current)
		end

invariant

	name_not_void: name /= Void
	index_positive: index >= 1

end
