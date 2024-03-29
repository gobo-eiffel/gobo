﻿note

	description:

		"Eiffel null attachments at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2014, Eric Bezault and others"
	license: "MIT License"

class ET_DYNAMIC_NULL_ATTACHMENT

inherit

	ET_DYNAMIC_ATTACHMENT
		redefine
			is_null_attachment
		end

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_type_set: like source_type_set; a_current_feature: like current_feature; a_current_type: like current_type)
			-- Create a new null attachment.
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

feature -- Status report

	is_null_attachment: BOOLEAN = True
			-- Should current attachment be ignored when reporting errors?

feature -- Access

	attachment: ET_AST_NODE
			-- Attachment
		do
				-- Precondition violated.
			check False then end
		end

	position: ET_POSITION
			-- Position of attachment
		once
			Result := tokens.null_position
		end

	description: STRING = "null"
			-- Kind of attachment

end
