note

	description:

		"Eiffel attachments of 'Result' in extended attributes at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_EXTENDED_ATTRIBUTE_RESULT_ATTACHMENT

inherit

	ET_DYNAMIC_ATTACHMENT

create

	make

feature {NONE} -- Initialization

	make (a_type_set: like source_type_set; a_current_feature: like current_feature; a_current_type: like current_type)
			-- Create a new attachment of 'Result' in extended attribute.
		require
			a_type_set_not_void: a_type_set /= Void
			a_current_feature_not_void: a_current_feature /= Void
			a_current_type_not_void: a_current_type /= Void
		do
			source_type_set := a_type_set
			current_feature := a_current_feature
			current_type := a_current_type
		ensure
			source_type_set_set: source_type_set = a_type_set
			current_feature_set: current_feature = a_current_feature
			current_type_set: current_type = a_current_type
		end

feature -- Access

	attachment: ET_AST_NODE
			-- Attachment
		do
			Result := current_feature.static_feature
		end

	position: ET_POSITION
			-- Position of attachment
		do
			Result := current_feature.static_feature.position
		end

	description: STRING = "extended attribute result"
			-- Kind of attachment

end
