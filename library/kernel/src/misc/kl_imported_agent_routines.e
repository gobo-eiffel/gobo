note

	description:

		"Imported routines that ought to be in agent classes."

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_IMPORTED_AGENT_ROUTINES

feature -- Access

	any_actions: KL_AGENT_ROUTINES [ANY]
			-- Routines that ought to be in agent classes
		once
			create Result
		ensure
			any_actions_not_void: Result /= Void
		end

	boolean_actions: KL_AGENT_ROUTINES [BOOLEAN]
			-- Routines that ought to be in agent classes
		once
			create Result
		ensure
			boolean_actions_not_void: Result /= Void
		end

	character_actions: KL_AGENT_ROUTINES [CHARACTER]
			-- Routines that ought to be in agent classes
		once
			create Result
		ensure
			character_actions_not_void: Result /= Void
		end

	integer_actions: KL_AGENT_ROUTINES [INTEGER]
			-- Routines that ought to be in agent classes
		once
			create Result
		ensure
			integer_actions_not_void: Result /= Void
		end

end
