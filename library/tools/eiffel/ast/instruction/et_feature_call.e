indexing

	description:

		"Eiffel feature calls"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_FEATURE_CALL

inherit

	ET_AST_NODE

creation

feature {NONE} -- Initialization

	make (a_name: like name; args: like arguments) is
			-- Create a new feature call.
		require
			a_name_not_void: a_name /= Void
		do
			name := a_name
			arguments := args
		ensure
			name_set: name = a_name
			arguments_set: arguments = args
		end

feature -- Access

	name: ET_FEATURE_NAME
			-- Feature name

	target: ET_EXPRESSION is
			-- Target
		do
			-- No target.
		end

	arguments: ET_ACTUAL_ARGUMENTS
			-- Arguments

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := name.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			if arguments /= Void then
				Result := arguments.break
			else
				Result := name.break
			end
		end

invariant

	name_not_void: name /= Void

end -- class ET_FEATURE_CALL
