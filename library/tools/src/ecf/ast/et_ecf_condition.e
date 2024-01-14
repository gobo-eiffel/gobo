note

	description:

		"ECF conditions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2018, Eric Bezault and others"
	license: "MIT License"

deferred class ET_ECF_CONDITION

feature -- Status report

	is_enabled (a_state: ET_ECF_STATE): BOOLEAN
			-- Does `a_state' fulfill current condition?
		require
			a_state_not_void: a_state /= Void
		deferred
		end

	is_capability_supported (a_capability_name: STRING; a_target_capabilities, a_other_capabilities: ET_ECF_CAPABILITIES): BOOLEAN
			-- Is capability `a_capability_name' of the enclosing target with
			-- capabilities `a_target_capabilities', possibly restricted by the
			-- current condition, supported by the capabilities `a_other_capabilities'?
		require
			a_capability_name_not_void: a_capability_name /= Void
			a_target_capabilities_not_void: a_target_capabilities /= Void
			a_other_capabilities_not_void: a_other_capabilities /= Void
		do
			if attached a_target_capabilities.support_value (a_capability_name) as l_capability_value then
				Result := a_other_capabilities.is_capability_supported (a_capability_name, l_capability_value)
			end
		end

end
