note

	description:

		"Eiffel attachments resuting from a CAP (Certified Attachment Pattern) at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2019, Eric Bezault and others"
	license: "MIT License"

class ET_DYNAMIC_CAP_ATTACHMENT

inherit

	ET_DYNAMIC_ATTACHMENT

create

	make

feature {NONE} -- Initialization

	make (a_type_set: like source_type_set; a_attachment: like attachment; a_current_feature: like current_feature; a_current_type: like current_type)
			-- Create a new CAP attachment.
		require
			a_type_set_not_void: a_type_set /= Void
			a_attachment_not_void: a_attachment /= Void
			a_current_feature_not_void: a_current_feature /= Void
			a_current_type_not_void: a_current_type /= Void
		do
			source_type_set := a_type_set
			attachment := a_attachment
			current_feature := a_current_feature
			current_type := a_current_type
		ensure
			source_type_set_set: source_type_set = a_type_set
			attachment_set: attachment = a_attachment
			current_feature_set: current_feature = a_current_feature
			current_type_set: current_type = a_current_type
		end

feature -- Access

	attachment: ET_AST_NODE
			-- Attachment

	position: ET_POSITION
			-- Position of attachment
		do
			Result := attachment.position
		end

	description: STRING = "certified attachnent pattern"
			-- Kind of attachment

end
