indexing

	description:

		"Eiffel clients"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_CLIENT

inherit

	ET_CLIENT_ITEM
		redefine
			name, base_class
		end

create

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_base_class: like base_class) is
			-- Create a client named `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_base_class_not_void: a_base_class /= Void
		do
			name := a_name
			base_class := a_base_class
		ensure
			name_set: name = a_name
			base_class_set: base_class = a_base_class
		end

feature -- Access

	name: ET_CLASS_NAME
			-- Name of client

	base_class: ET_CLASS
			-- Base class of client

	client: ET_CLIENT is
			-- Client in comma-separated list
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := name.position
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := name.first_leaf
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := name.last_leaf
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := name.break
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_client (Current)
		end

invariant

	name_not_void: name /= Void
	base_class_not_void: base_class /= Void

end
