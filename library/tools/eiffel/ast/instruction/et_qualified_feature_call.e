indexing

	description:

		"Eiffel qualified feature calls"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_QUALIFIED_FEATURE_CALL

inherit

	ET_FEATURE_CALL
		rename
			make as make_unqualified_call
		redefine
			target, position
		end

feature {NONE} -- Initialization

	make (a_target: like target; a_dot: like dot; a_name: like name; args: like arguments) is
			-- Create a new qualified feature call.
		require
			a_target_not_void: a_target /= Void
			a_dot_not_void: a_dot /= Void
			a_name_not_void: a_name /= Void
		do
			target := a_target
			dot := a_dot
			name := a_name
			arguments := args
		ensure
			target_set: target = a_target
			dot_set: dot = a_dot
			name_set: name = a_name
			arguments_set: arguments = args
		end

feature -- Access

	target: ET_EXPRESSION
			-- Target

	dot: ET_SYMBOL
			-- Dot symbol

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := target.position
		end

invariant

	target_not_void: target /= Void
	dot_not_void: dot /= Void

end
