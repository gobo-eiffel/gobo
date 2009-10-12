indexing

	description:

		"Imported routines that ought to be in agent classes."

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_IMPORTED_AGENT_ROUTINES

inherit

	KL_IMPORTED_AGENT_ROUTINES

feature -- Access

	adapted_class_actions: KL_AGENT_ROUTINES [ET_ADAPTED_CLASS] is
			-- Routines that ought to be in agent classes
		once
			create Result
		ensure
			adapted_class_actions_not_void: Result /= Void
		end

	class_actions: KL_AGENT_ROUTINES [ET_CLASS] is
			-- Routines that ought to be in agent classes
		once
			create Result
		ensure
			class_actions_not_void: Result /= Void
		end

	universe_actions: KL_AGENT_ROUTINES [ET_UNIVERSE] is
			-- Routines that ought to be in agent classes
		once
			create Result
		ensure
			universe_actions_not_void: Result /= Void
		end

end
