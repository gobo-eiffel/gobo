note

	description:

		"Eiffel provider processors implemented using an agent"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: $"
	revision: "$Revision: $"

class ET_AGENT_PROVIDER_PROCESSOR

inherit

	ET_PROVIDER_PROCESSOR
		rename
			make as make_null
		end

create

	make

feature {NONE} -- Initialization

	make (a_action: like action)
			-- Creation a new provider processor implemented using `a_action'.
		require
			a_action_not_void: a_action /= Void
		do
			action := a_action
			make_null
		ensure
			action_set: action = a_action
		end
		
feature -- Access

	action: PROCEDURE [ET_CLASS]
			-- Action to be executed on each provider

feature -- Setting

	set_action (a_action: like action)
			-- Set `action' to `a_action'
		require
			a_action_not_void: a_action /= Void
		do
			action := a_action
		ensure
			action_set: action = a_action
		end
		
feature {NONE} -- Processing

	process_provider (a_provider: ET_CLASS)
			-- <Precursor>
		do
			action.call ([a_provider])
		end

invariant

	action_not_void: action /= Void
	
end
