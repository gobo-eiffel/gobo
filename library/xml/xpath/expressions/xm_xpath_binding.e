indexing

	description:

		"Run-time properties of a varioable"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_BINDING

feature -- Access

	required_type: XM_XPATH_SEQUENCE_TYPE is
			-- Static type of variable
		deferred
		end
	
	name: STRING
			-- name of variable

feature -- Evaluation

	evaluate (a_context: XM_XPATH_CONTEXT): XM_XPATH_VALUE is
			-- Evaluate variable
		require
			context_not_void: a_context /= Void
		deferred
		end

end
