﻿note

	description:

		"Eiffel feature names preceded by a dot"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2014, Eric Bezault and others"
	license: "MIT License"

class ET_DOT_FEATURE_NAME

inherit

	ET_QUALIFIED_FEATURE_NAME

create

	make

feature {NONE} -- Initialization

	make (a_dot: like dot; a_name: like feature_name)
			-- Create a new dot-feature_name.
		require
			a_dot_not_void: a_dot /= Void
			a_name_not_void: a_name /= Void
		do
			dot := a_dot
			feature_name := a_name
		ensure
			dot_set: dot = a_dot
			feature_name_set: feature_name = a_name
		end

feature -- Access

	dot: ET_SYMBOL
			-- '.' symbol

	feature_name: ET_FEATURE_NAME
			-- Feature name

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := dot.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := dot
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := feature_name.last_leaf
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_dot_feature_name (Current)
		end

invariant

	dot_not_void: dot /= Void

end
