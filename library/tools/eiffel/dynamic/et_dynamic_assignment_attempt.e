indexing

	description:

		"Eiffel assignment attempts at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_ASSIGNMENT_ATTEMPT

inherit

	ET_DYNAMIC_ATTACHMENT
		rename
			attachment as assignment_attempt
		end

create

	make

feature {NONE} -- Initialization

	make (a_source_type_set: like source_type_set; an_assignment_attempt: like assignment_attempt;
		a_current_feature: like current_feature; a_current_type: like current_type) is
			-- Create a new assignment attempt.
		require
			a_source_type_set_not_void: a_source_type_set /= Void
			an_assignment_attempt_not_void: an_assignment_attempt /= Void
			a_current_feature_not_void: a_current_feature /= Void
			a_current_type_not_void: a_current_type /= Void
		do
			source_type_set := a_source_type_set
			assignment_attempt := an_assignment_attempt
			current_feature := a_current_feature
			current_type := a_current_type
		ensure
			source_type_set_set: source_type_set = a_source_type_set
			assignment_attempt_set: assignment_attempt = an_assignment_attempt
			current_feature_set: current_feature = a_current_feature
			current_type_set: current_type = a_current_type
		end

feature -- Access

	assignment_attempt: ET_ASSIGNMENT_ATTEMPT
			-- Assignment attempt instruction

	position: ET_POSITION is
			-- Position of attachment
		do
			Result := assignment_attempt.source.position
		end

	description: STRING is "assignment attempt"
			-- Kind of attachment

invariant

	assignment_attempt_not_void: assignment_attempt /= Void

end
