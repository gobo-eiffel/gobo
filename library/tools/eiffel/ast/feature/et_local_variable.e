indexing

	description:

		"Eiffel local variables"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_LOCAL_VARIABLE

inherit

	ET_LOCAL_VARIABLE_ITEM
 
create

	make

feature {NONE} -- Initialization

	make (a_name: like name_item; a_type: like declared_type) is
			-- Create a new local variable.
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
		do
			name_item := a_name
			declared_type := a_type
		ensure
			name_set: name_item = a_name
			declared_type_set: declared_type = a_type
		end

feature -- Initialization

	reset is
			-- Reset local variable as it was when it was first parsed.
		do
			name.reset
			type.reset
		end

feature -- Access

	name: ET_IDENTIFIER is
			-- Name
		do
			Result := name_item.identifier
		ensure
			name_not_void: Result /= Void
		end

	type: ET_TYPE is
			-- Type
		do
			Result := declared_type.type
		end

	name_item: ET_LOCAL_NAME
			-- Name (possibly followed by a comma)

	declared_type: ET_DECLARED_TYPE
			-- Declared type (type preceded by a colon)

	local_variable: ET_LOCAL_VARIABLE is
			-- Local variable in semicolon-separated list
		do
			Result := Current
		end

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := name_item.position
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := name_item.first_leaf
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := declared_type.last_leaf
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := declared_type.break
		end

feature -- Status report

	is_used: BOOLEAN
			-- Is current local variable used?

feature -- Setting

	set_declared_type (a_type: like declared_type) is
			-- Set `declared_type' to `a_type'.
		require
			a_type_not_void: a_type /= Void
		do
			declared_type := a_type
		ensure
			declared_type_set: declared_type = a_type
		end

feature -- Status setting

	set_used (b: BOOLEAN) is
			-- Set `is_used' to `b'.
		do
			is_used := b
		ensure
			used_set: is_used = b
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_local_variable (Current)
		end

invariant

	name_item_not_void: name_item /= Void
	declared_type_not_void: declared_type /= Void

end
