﻿note

	description:

		"Eiffel built-in conversion features"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2014, Eric Bezault and others"
	license: "MIT License"

class ET_BUILTIN_CONVERT_FEATURE

inherit

	ET_CONVERT_FEATURE

create

	make

feature {NONE} -- Initialization

	make (a_type: like type)
			-- Create a new built-in conversion feature.
		require
			a_type_not_void: a_type /= Void
		do
			create {ET_IDENTIFIER} name.make ("_builtin_")
			create {ET_BRACED_TYPE_LIST} types.make
			type := a_type
		ensure
			type_set: type = a_type
		end

feature -- Access

	type: ET_TYPE
			-- Target type

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := types.last_leaf
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			-- Do nothing.
		end

invariant

	type_not_void: type /= Void

end
