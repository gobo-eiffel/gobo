note

	description:

		"Eiffel argument passings at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_ARGUMENT_ATTACHMENT

inherit

	ET_DYNAMIC_ATTACHMENT
		rename
			attachment as actual_argument
		end

create

	make

feature {NONE} -- Initialization

	make (a_type_set: like source_type_set; an_argument: like actual_argument;
		a_current_feature: like current_feature; a_current_type: like current_type) is
			-- Create a new argument passing.
		require
			a_type_set_not_void: a_type_set /= Void
			an_argument_not_void: an_argument /= Void
			a_current_feature_not_void: a_current_feature /= Void
			a_current_type_not_void: a_current_type /= Void
		do
			source_type_set := a_type_set
			actual_argument := an_argument
			current_feature := a_current_feature
			current_type := a_current_type
		ensure
			source_type_set_set: source_type_set = a_type_set
			actual_argument_set: actual_argument = an_argument
			current_feature_set: current_feature = a_current_feature
			current_type_set: current_type = a_current_type
		end

feature -- Access

	actual_argument: ET_ARGUMENT_OPERAND
			-- Actual argument

	position: ET_POSITION is
			-- Position of attachment
		do
			Result := actual_argument.position
		end

	description: STRING is
			-- Kind of attachment
		local
			l_implicit: ET_AGENT_IMPLICIT_OPEN_ARGUMENT
		do
			l_implicit ?= actual_argument
			if l_implicit /= Void then
				Result := implicit_open_argument_description + l_implicit.argument_index.out
			elseif actual_argument.is_open_operand then
				Result := open_argument_description
			else
				Result := argument_description
			end
		end

feature {NONE} -- Constants

	argument_description: STRING is "argument"
	open_argument_description: STRING is "open argument"
	implicit_open_argument_description: STRING is "implicit open argument #"
			-- Description constants

invariant

	actual_argument_not_void: actual_argument /= Void

end
