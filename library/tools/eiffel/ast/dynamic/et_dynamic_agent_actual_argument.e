indexing

	description:

		"Eiffel agent argument passings at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_AGENT_ACTUAL_ARGUMENT

inherit

	ET_DYNAMIC_ATTACHMENT

creation

	make

feature {NONE} -- Initialization

	make (a_type: like source_type; an_actual: like actual_argument;
		a_current_feature: like current_feature; a_current_type: like current_type) is
			-- Create a new agent argument passing.
		require
			a_type_not_void: a_type /= Void
			an_actual_not_void: an_actual /= Void
			a_current_feature_not_void: a_current_feature /= Void
			a_current_type_not_void: a_current_type /= Void
		do
			source_type := a_type
			actual_argument := an_actual
			current_feature := a_current_feature
			current_type := a_current_type
		ensure
			source_type_set: source_type = a_type
			actual_argument_set: actual_argument = an_actual
			current_feature_set: current_feature = a_current_feature
			current_type_set: current_type = a_current_type
		end

feature -- Access

	actual_argument: ET_AGENT_ACTUAL_ARGUMENT
			-- Actual argument

	position: ET_POSITION is
			-- Position of attachment
		do
			Result := actual_argument.position
		end

feature -- Duplication

	cloned_attachment: like Current is
			-- Cloned version of current attachment
		do
			create Result.make (source_type, actual_argument, current_feature, current_type)
		end

invariant

	actual_argument_not_void: actual_argument /= Void

end
