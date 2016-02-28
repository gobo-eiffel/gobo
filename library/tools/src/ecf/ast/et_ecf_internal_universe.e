note

	description:

		"ECF Eiffel internal universes (i.e. either systems or libraries)"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ECF_INTERNAL_UNIVERSE

inherit

	ET_INTERNAL_UNIVERSE
		redefine
			name
		end

	ET_ECF_SYSTEM_CONFIG
		redefine
			name
		end

feature -- Access

	name: STRING
			-- Name of universe

	selected_target: detachable ET_ECF_TARGET
			-- Selected target

feature -- Setting

	select_target (a_target: ET_ECF_TARGET; a_state: ET_ECF_STATE)
			-- Select `a_target' in `a_state'.
			-- Update `clusters' and `libraries' accordingly.
		require
			not_selected_yet: selected_target = Void
			a_target_not_void: a_target /= Void
			valid_target: attached targets as l_targets and then l_targets.has (a_target)
			a_state_not_void: a_state /= Void
		do
			a_target.fill_universe (Current, a_state)
			selected_target := a_target
		ensure
			selected_target_set: selected_target = a_target
		end

invariant

	valid_selected_target: attached selected_target as l_selected_target implies (attached targets as l_targets and then l_targets.has (l_selected_target))

end
