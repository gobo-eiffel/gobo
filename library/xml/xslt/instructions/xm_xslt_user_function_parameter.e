indexing

	description:

		"Compile-time references to xsl:functions"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_USER_FUNCTION_PARAMETER

inherit

	XM_XPATH_BINDING

creation

	make

feature {NONE} -- Initialization

	make (a_required_type: XM_XPATH_SEQUENCE_TYPE; a_slot_number: INTEGER; a_variable_name: STRING) is
			-- Establish invariant.
		require
			required_type_not_void: a_required_type /= Void
			variable_name_not_void: a_variable_name /= Void
			strictly_positive_slot_number: a_slot_number > 0
		do
			required_type := a_required_type
			slot_number := a_slot_number
			variable_name := a_variable_name
		ensure
			required_type_set: required_type = a_required_type
			slot_number_set: slot_number = a_slot_number
			variable_name_set: variable_name = a_variable_name
		end

feature -- Access

	required_type: XM_XPATH_SEQUENCE_TYPE
			-- Static type of variable

feature -- Evaluation

	evaluate_variable (a_context: XM_XPATH_CONTEXT) is 
			-- Evaluate variable
		do
			last_evaluated_binding := a_context.evaluated_local_variable (slot_number)
		end

feature {NONE} -- Implementation

	slot_number: INTEGER
			-- Local variable slot number

invariant

	required_type_not_void: required_type /= Void
	strictly_positive_slot_number: slot_number > 0

end

