indexing

	description:

		"Semantic action factories"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class LX_ACTION_FACTORY

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create a new semantic action factory.
		do
		end

feature -- Access

	new_action (a_text: STRING): LX_ACTION is
			-- New semantic action with `a_text'
			-- as textual representation
		require
			a_text_not_void: a_text /= Void
		do
			!! Result.make (a_text)
		ensure
			action_not_void: Result /= Void
			text_set: Result.text = a_text
		end

end -- class LX_ACTION_FACTORY
