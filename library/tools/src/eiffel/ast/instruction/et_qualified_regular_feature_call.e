note

	description:

		"Eiffel qualified regular feature calls"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_QUALIFIED_REGULAR_FEATURE_CALL

inherit

	ET_REGULAR_FEATURE_CALL
		undefine
			is_qualified_call
		end

	ET_QUALIFIED_FEATURE_CALL
		undefine
			parenthesis_call
		end

	ET_QUALIFIED_CALL
		rename
			make as make_qualified_call
		undefine
			process,
			arguments_count
		redefine
			reset,
			position,
			first_leaf
		end

feature {NONE} -- Initialization

	make (a_target: like target; a_name: like qualified_name; args: like arguments)
			-- Create a new qualified feature call.
		require
			a_target_not_void: a_target /= Void
			a_name_not_void: a_name /= Void
		do
			target := a_target
			make_qualified_call (a_name, args)
		ensure
			target_set: target = a_target
			name_set: qualified_name = a_name
			arguments_set: arguments = args
		end

feature -- Initialization

	reset
			-- Reset call as it was when it was last parsed.
		do
			Precursor
			target.reset
		end

feature -- Access

	target: ET_EXPRESSION
			-- Target

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := target.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := target.first_leaf
		end

feature -- Setting

	set_target (a_target: like target)
			-- Set `target' to `a_target'.
		require
			a_target_not_void: a_target /= Void
		do
			target := a_target
		ensure
			target_set: target = a_target
		end

end
