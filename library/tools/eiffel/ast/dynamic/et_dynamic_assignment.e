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

creation

	make

feature {NONE} -- Initialization

	make (a_type: like source_type; an_assignment: like assignment;
		a_current_feature: like current_feature; a_current_type: like current_type) is
			-- Create a new assignment.
		require
			a_type_not_void: a_type /= Void
			an_assignment_not_void: an_assignment /= Void
			a_current_feature_not_void: a_current_feature /= Void
			a_current_type_not_void: a_current_type /= Void
		do
			source_type := a_type
			assignment := an_assignment
			current_feature := a_current_feature
			current_type := a_current_type
		ensure
			source_type_set: source_type = a_type
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

feature -- Duplication

	cloned_attachment: like Current is
			-- Cloned version of current attachment
		do
			create Result.make (source_type, assignment, current_feature, current_type)
		end

invariant

	assignment_not_void: assignment /= Void

end
