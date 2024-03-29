﻿note

	description:

		"Eiffel call instructions"

	library: "Gobo Eiffel Tools Library"
	copyright:  "Copyright (c) 1999-2016, Eric Bezault and others"
	license: "MIT License"

deferred class ET_CALL_INSTRUCTION

inherit

	ET_REGULAR_FEATURE_CALL
		redefine
			name,
			parenthesis_call
		end

	ET_FEATURE_CALL_INSTRUCTION
		redefine
			name,
			parenthesis_call
		end

feature -- Access

	name: ET_FEATURE_NAME
			-- Feature name
		deferred
		end

	parenthesis_call: detachable ET_PARENTHESIS_INSTRUCTION
			-- <Precursor>

feature -- Setting

	set_parenthesis_call (a_target: ET_EXPRESSION; a_name: ET_PARENTHESIS_SYMBOL; a_arguments: ET_ACTUAL_ARGUMENT_LIST)
			-- Set `parenthesis_call' with `a_target', `a_name' and `a_arguments'.
		do
			create parenthesis_call.make (a_target, a_name, a_arguments)
		end

end
