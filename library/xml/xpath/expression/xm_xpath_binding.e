note

	description:

		"Run-time properties of a variable"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2014, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_BINDING

feature -- Access

	required_type: XM_XPATH_SEQUENCE_TYPE
			-- Static type of variable
		deferred
		end

	variable_name: STRING
			-- name of variable

	slot_number: INTEGER
			-- Slot number in local stack frame
		require
			local_variable: not is_global
		deferred
		end

feature -- Status report

	last_evaluated_binding: detachable XM_XPATH_VALUE
			-- Value from calling `evaluate_variable'

	is_global: BOOLEAN
			-- Is binding global or local?
		deferred
		end

feature -- Evaluation

	evaluate_variable (a_context: XM_XPATH_CONTEXT)
			-- Evaluate variable
		require
			context_not_void: a_context /= Void
		deferred
		ensure
			evaluation: last_evaluated_binding /= Void
		end

invariant

	name_not_void: variable_name /= Void

end
