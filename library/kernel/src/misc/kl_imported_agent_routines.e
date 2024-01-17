note

	description:

		"Imported routines that ought to be in agent classes."

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2009-2018, Eric Bezault and others"
	license: "MIT License"

class KL_IMPORTED_AGENT_ROUTINES

feature -- Access

	any_actions: KL_AGENT_ROUTINES [ANY]
			-- Routines that ought to be in agent classes
		once
			create Result
		ensure
			instance_free: class
			any_actions_not_void: Result /= Void
		end

	boolean_actions: KL_AGENT_ROUTINES [BOOLEAN]
			-- Routines that ought to be in agent classes
		once
			create Result
		ensure
			instance_free: class
			boolean_actions_not_void: Result /= Void
		end

	character_actions: KL_AGENT_ROUTINES [CHARACTER]
			-- Routines that ought to be in agent classes
		once
			create Result
		ensure
			instance_free: class
			character_actions_not_void: Result /= Void
		end

	integer_actions: KL_AGENT_ROUTINES [INTEGER]
			-- Routines that ought to be in agent classes
		once
			create Result
		ensure
			instance_free: class
			integer_actions_not_void: Result /= Void
		end

end
