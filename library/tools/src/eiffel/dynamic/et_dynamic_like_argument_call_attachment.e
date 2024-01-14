note

	description:

		"Eiffel call result passings at run-time when the result of the query is of the form 'like argument'"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"

class ET_DYNAMIC_LIKE_ARGUMENT_CALL_ATTACHMENT

inherit

	ET_DYNAMIC_ATTACHMENT

create

	make

feature {NONE} -- Initialization

	make (a_type_set: like source_type_set; a_call: like attachment;
		a_current_feature: like current_feature; a_current_type: like current_type)
			-- Create a new like argument call result passing.
		require
			a_type_set_not_void: a_type_set /= Void
			a_call_not_void: a_call /= Void
			a_current_feature_not_void: a_current_feature /= Void
			a_current_type_not_void: a_current_type /= Void
		do
			source_type_set := a_type_set
			attachment := a_call
			current_feature := a_current_feature
			current_type := a_current_type
		ensure
			source_type_set_set: source_type_set = a_type_set
			attachment_set: attachment = a_call
			current_feature_set: current_feature = a_current_feature
			current_type_set: current_type = a_current_type
		end

feature -- Access

	attachment: ET_FEATURE_CALL_EXPRESSION
			-- Call to the query whose type is of the form "like argument"

	position: ET_POSITION
			-- Position of attachment
		do
			Result := attachment.position
		end

	description: STRING = "like argument call"
			-- Kind of attachment

invariant

	attachment_not_void: attachment /= Void

end
