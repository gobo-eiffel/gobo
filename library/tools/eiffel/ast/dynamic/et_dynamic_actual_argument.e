indexing

	description:

		"Eiffel argument passings at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_ACTUAL_ARGUMENT

inherit

	ET_DYNAMIC_ATTACHMENT

creation

	make

feature {NONE} -- Initialization

	make (a_type_set: like source_type_set; an_actual: like actual_argument;
		a_current_feature: like current_feature; a_current_type: like current_type) is
			-- Create a new argument passing.
		require
			a_type_set_not_void: a_type_set /= Void
			an_actual_not_void: an_actual /= Void
			a_current_feature_not_void: a_current_feature /= Void
			a_current_type_not_void: a_current_type /= Void
		do
			source_type_set := a_type_set
			actual_argument := an_actual
			current_feature := a_current_feature
			current_type := a_current_type
		ensure
			source_type_set_set: source_type_set = a_type_set
			actual_argument_set: actual_argument = an_actual
			current_feature_set: current_feature = a_current_feature
			current_type_set: current_type = a_current_type
		end

feature -- Access

	actual_argument: ET_EXPRESSION
			-- Actual argument

	position: ET_POSITION is
			-- Position of attachment
		do
			Result := actual_argument.position
		end

	description: STRING is "actual argument"
			-- Kind of attachment

invariant

	actual_argument_not_void: actual_argument /= Void

end
