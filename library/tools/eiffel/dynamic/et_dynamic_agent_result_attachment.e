indexing

	description:

		"Eiffel agent result passings at run-time. This is when we have 'a_result := (agent f (...)).item ([...])'"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_AGENT_RESULT_ATTACHMENT

inherit

	ET_DYNAMIC_ATTACHMENT

create

	make

feature {NONE} -- Initialization

	make (a_type_set: like source_type_set; an_agent: like attachment;
		a_current_feature: like current_feature; a_current_type: like current_type) is
			-- Create a new agent result passing.
		require
			a_type_set_not_void: a_type_set /= Void
			an_agent_not_void: an_agent /= Void
			a_current_feature_not_void: a_current_feature /= Void
			a_current_type_not_void: a_current_type /= Void
		do
			source_type_set := a_type_set
			attachment := an_agent
			current_feature := a_current_feature
			current_type := a_current_type
		ensure
			source_type_set_set: source_type_set = a_type_set
			attachment_set: attachment = an_agent
			current_feature_set: current_feature = a_current_feature
			current_type_set: current_type = a_current_type
		end

feature -- Access

	attachment: ET_AGENT
			-- Agent whose called feature or associated feature returns the result

	position: ET_POSITION is
			-- Position of attachment
		do
			Result := attachment.position
		end

	description: STRING is "agent result"
			-- Kind of attachment

invariant

	attachment_not_void: attachment /= Void

end
