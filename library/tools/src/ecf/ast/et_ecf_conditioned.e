note

	description:

		"ECF objects which are taken into account only in some conditions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ECF_CONDITIONED

feature -- Status report

	is_enabled (a_state: ET_ECF_STATE): BOOLEAN
			-- Does `a_state' fulfill current condition?
		require
			a_state_not_void: a_state /= Void
		do
			Result := not attached conditions as l_conditions or else l_conditions.is_enabled (a_state)
		end

feature -- Access

	conditions: detachable ET_ECF_CONDITIONS
			-- Conditions, if any

feature -- Setting

	set_conditions (a_conditions: like conditions)
			-- Set `conditions' to `a_conditions'.
		do
			conditions := a_conditions
		ensure
			conditions_set: conditions = a_conditions
		end

end
