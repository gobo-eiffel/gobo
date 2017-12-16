note

	description:

		"Eiffel Agent 'closed_operands' tuple attribute settings at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_AGENT_CLOSED_OPERANDS_ATTACHMENT

inherit

	ET_DYNAMIC_ATTACHMENT

create

	make

feature {NONE} -- Initialization

	make (a_type_set: like source_type_set; an_attachment: like attachment;
		a_current_feature: like current_feature; a_current_type: like current_type)
			-- Create a new Agent 'closed_operands' tuple attribute setting.
		require
			a_type_set_not_void: a_type_set /= Void
			an_attachment_not_void: an_attachment /= Void
			a_current_feature_not_void: a_current_feature /= Void
			a_current_type_not_void: a_current_type /= Void
		do
			source_type_set := a_type_set
			attachment := an_attachment
			current_feature := a_current_feature
			current_type := a_current_type
		ensure
			source_type_set_set: source_type_set = a_type_set
			attachment_set: attachment = an_attachment
			current_feature_set: current_feature = a_current_feature
			current_type_set: current_type = a_current_type
		end

feature -- Access

	attachment: ET_AGENT
			-- Agent from which the closed operands come from

	position: ET_POSITION
			-- Position of attachment
		do
			Result := attachment.position
		end

	description: STRING = "agent closed operands tuple"
			-- Kind of attachment

invariant

	attachment_not_void: attachment /= Void

end
