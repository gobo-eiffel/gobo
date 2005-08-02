indexing

	description:

		"Eiffel assignments at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_ASSIGNMENT

inherit

	ET_DYNAMIC_ATTACHMENT
		rename
			attachment as assignment
		end

create

	make

feature {NONE} -- Initialization

	make (a_type_set: like source_type_set; an_assignment: like assignment;
		a_current_feature: like current_feature; a_current_type: like current_type) is
			-- Create a new assignment.
		require
			a_type_set_not_void: a_type_set /= Void
			an_assignment_not_void: an_assignment /= Void
			a_current_feature_not_void: a_current_feature /= Void
			a_current_type_not_void: a_current_type /= Void
		do
			source_type_set := a_type_set
			assignment := an_assignment
			current_feature := a_current_feature
			current_type := a_current_type
		ensure
			source_type_set_set: source_type_set = a_type_set
			assignment_set: assignment = an_assignment
			current_feature_set: current_feature = a_current_feature
			current_type_set: current_type = a_current_type
		end

feature -- Access

	assignment: ET_ASSIGNMENT
			-- Assignment instruction

	position: ET_POSITION is
			-- Position of attachment
		do
			Result := assignment.source.position
		end

	description: STRING is "assignment"
			-- Kind of attachment

invariant

	assignment_not_void: assignment /= Void

end
