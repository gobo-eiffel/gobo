﻿note

	description:

		"Eiffel clients followed by a comma"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2014, Eric Bezault and others"
	license: "MIT License"

class ET_CLIENT_COMMA

inherit

	ET_CLIENT
		rename
			make as make_client
		redefine
			last_leaf, process
		end

create

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_named_base_class: like named_base_class; a_comma: like comma)
			-- Create a new client-comma.
		require
			a_name_not_void: a_name /= Void
			a_named_base_class_not_void: a_named_base_class /= Void
			a_comma_not_void: a_comma /= Void
		do
			name := a_name
			named_base_class := a_named_base_class
			comma := a_comma
		ensure
			name_set: name = a_name
			named_base_class_set: named_base_class = a_named_base_class
			comma_set: comma = a_comma
		end

feature -- Access

	comma: ET_SYMBOL
			-- Comma separator

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := comma
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_client_comma (Current)
		end

invariant

	comma_not_void: comma /= Void

end
