indexing

	description:

		"Eiffel feature calls"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_FEATURE_CALL

inherit

	ET_QUALIFIED_CALL
		rename
			make as make_qualified_call
		undefine
			process
		redefine
			reset, position
		end

feature {NONE} -- Initialization

	make (a_target: like target; a_name: like qualified_name; args: like arguments) is
			-- Create a new feature call.
		require
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

	reset is
			-- Reset call as it was when it was first parsed.
		do
			Precursor
			if target /= Void then
				target.reset
			end
		end

feature -- Access

	target: ET_EXPRESSION
			-- Target

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			if target /= Void then
				Result := target.position
			else
				Result := qualified_name.position
			end
		end

end
