note

	description:

		"Eiffel local variables"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_LOCAL_VARIABLE

inherit

	ET_LOCAL_VARIABLE_ITEM

create

	make

feature {NONE} -- Initialization

	make (a_name: like name_item; a_type: like declared_type)
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

	reset
			-- Reset local variable as it was when it was last parsed.
		do
			name.reset
			type.reset
		end

feature -- Access

	name: ET_IDENTIFIER
			-- Name
		do
			Result := name_item.identifier
		end

	type: ET_TYPE
			-- Type
		do
			Result := declared_type.type
		end

	name_item: ET_LOCAL_NAME
			-- Name (possibly followed by a comma)

	declared_type: ET_DECLARED_TYPE
			-- Declared type (type preceded by a colon)

	local_variable: ET_LOCAL_VARIABLE
			-- Local variable in semicolon-separated list
		do
			Result := Current
		end

	index: INTEGER
			-- Index of local variable in enclosing feature;
			-- Used to get dynamic information about this variable.

	attached_index: INTEGER
			-- Index of attached version (with a CAP, Certified Attachment Pattern)
			-- of local variable in enclosing feature;
			-- Used to get dynamic information about this variable.

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := name_item.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := name_item.first_leaf
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := declared_type.last_leaf
		end

feature -- Status report

	is_used: BOOLEAN
			-- Is current local variable used?

feature -- Setting

	set_declared_type (a_type: like declared_type)
			-- Set `declared_type' to `a_type'.
		require
			a_type_not_void: a_type /= Void
		do
			declared_type := a_type
		ensure
			declared_type_set: declared_type = a_type
		end

	set_index (i: INTEGER)
			-- Set `index' to `i'.
		require
			i_not_negative: i >= 0
		do
			index := i
		ensure
			index_set: index = i
		end

	set_attached_index (i: INTEGER)
			-- Set `attached_index' to `i'.
		require
			i_not_negative: i >= 0
		do
			attached_index := i
		ensure
			attached_index_set: attached_index = i
		end

feature -- Status setting

	set_used (b: BOOLEAN)
			-- Set `is_used' to `b'.
		do
			is_used := b
		ensure
			used_set: is_used = b
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_local_variable (Current)
		end

invariant

	name_item_not_void: name_item /= Void
	declared_type_not_void: declared_type /= Void

end
