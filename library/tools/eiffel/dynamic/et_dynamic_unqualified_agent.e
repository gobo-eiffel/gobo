indexing

	description:

		"Eiffel unqualified call agents at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_UNQUALIFIED_AGENT

create

	make

feature {NONE} -- Initialization

	make (an_agent: like static_agent; an_agent_type: like agent_type;
		an_agent_feature: like agent_feature; a_current_feature: like current_feature;
		a_current_type: like current_type) is
			-- Create a new dynamic unqualified agent.
		require
			an_agent_not_void: an_agent /= Void
			an_agent_type_not_void: an_agent_type /= Void
			an_agent_feature_not_void: an_agent_feature /= Void
			a_current_feature_not_void: a_current_feature /= Void
			a_current_type_not_void: a_current_type /= Void
		do
			static_agent := an_agent
			agent_type := an_agent_type
			agent_feature := an_agent_feature
			current_feature := a_current_feature
			current_type := a_current_type
		ensure
			static_agent_set: static_agent = an_agent
			agent_type_set: agent_type = an_agent_type
			agent_feature_set: agent_feature = an_agent_feature
			current_feature_set: current_feature = a_current_feature
			current_type_set: current_type = a_current_type
		end

feature -- Access

	static_agent: ET_CALL_AGENT
			-- Static call agent

	agent_type: ET_DYNAMIC_ROUTINE_TYPE
			-- Agent dynamic type

	agent_feature: ET_DYNAMIC_FEATURE
			-- Agent feature

	current_feature: ET_DYNAMIC_FEATURE
			-- Feature where the agent appears

	current_type: ET_DYNAMIC_TYPE
			-- Type to which `current_feature' belongs

	position: ET_POSITION is
			-- Position of agent
		do
			Result := static_agent.position
		ensure
			position_not_void: Result /= Void
		end

invariant

	static_agent_not_void: static_agent /= Void
	agent_type_not_void: agent_type /= Void
	agent_feature_not_void: agent_feature /= Void
	current_feature_not_void: current_feature /= Void
	current_type_not_void: current_type /= Void

end
