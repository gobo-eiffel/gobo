indexing

	description:

		"Eiffel feature calls"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_FEATURE_CALL

feature {NONE} -- Initialization

	make (a_target: like target; a_name: like name; args: like arguments) is
			-- Create a new feature call.
		require
			a_name_not_void: a_name /= Void
		do
			target := a_target
			name := a_name
			arguments := args
		ensure
			target_set: target = a_target
			name_set: name = a_name
			arguments_set: arguments = args
		end

feature -- Access

	name: ET_FEATURE_NAME
			-- Feature name

	target: ET_EXPRESSION
			-- Target

	arguments: ET_ACTUAL_ARGUMENTS
			-- Arguments

invariant

	name_not_void: name /= Void

end -- class ET_FEATURE_CALL
