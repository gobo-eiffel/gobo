indexing

	description:

		"Objects that represent the compiled form of XSLT variable definitions"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_COMPILED_VARIABLE_DEFINITION

inherit

	XM_XSLT_COMPILED_GENERAL_VARIABLE

	XM_XPATH_BINDING

	XM_XPATH_ERROR_TYPES

feature -- Access

	slot_number: INTEGER
			-- Slot number

feature -- Evaluation

	evaluate_variable (a_context: XM_XPATH_CONTEXT) is 
			-- Evaluate variable
		local
			an_xslt_context: XM_XSLT_EVALUATION_CONTEXT
			a_transformer: XM_XSLT_TRANSFORMER
			a_bindery: XM_XSLT_BINDERY
			a_value: XM_XPATH_VALUE
			an_error_value: XM_XPATH_ERROR_VALUE
			a_saved_context: XM_XSLT_SAVED_TRANSFORMER_CONTEXT
		do
			last_evaluated_binding := Void
			an_xslt_context ?= a_context
			check
				xslt_context: an_xslt_context /= Void
			end
			a_transformer := an_xslt_context.transformer
			a_bindery := a_transformer.bindery
			if is_global_variable then
				a_value := a_bindery.global_variable_value (slot_number)
				if a_value = Void then

					-- This is the first reference to a global variable; try to evaluate it now.
               -- But first set a flag to stop looping. This flag is set in the bindery because
               --  the variable reference itself might (in the future) be used by multiple threads simultaneously

					a_bindery.set_executing (slot_number, True)
					if a_bindery.is_circularity_error then
						create {XM_XPATH_ERROR_VALUE} an_error_value.make_from_string (STRING_.concat ("Circular definition of variable ", variable_name) , "XT0640", Dynamic_error)
						create {XM_XPATH_INVALID_VALUE} a_value.make (an_error_value)
					else
						a_saved_context := a_transformer.saved_context
						a_transformer.reset_global_context
						process (a_transformer.new_xpath_context)
						a_transformer.restore_context (a_saved_context)

						a_bindery.set_executing (slot_number, False)
						a_value := a_bindery.global_variable_value (slot_number)
					end
				end
				last_evaluated_binding := a_value
				check
					global_variable_not_void: last_evaluated_binding /= Void
				end
			else
				last_evaluated_binding := a_context.evaluated_local_variable (slot_number)
				check
					local_variable_not_void: last_evaluated_binding /= Void
				end
			end
		end


invariant

	variable_name: variable_name /= Void and then variable_name.count > 0
	strictly_positive_slot_number: slot_number > 0

end
