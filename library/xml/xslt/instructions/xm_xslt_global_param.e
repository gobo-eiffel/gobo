indexing

	description:

		"Objects that represent the compiled form of a global xsl:param"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_GLOBAL_PARAM

inherit

	XM_XSLT_GLOBAL_VARIABLE
		redefine
			make, evaluate_variable, display
		end

create

	make_global_variable

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE; a_name: STRING; a_slot_number: INTEGER) is
			-- Establish invariant.
		do
			Precursor (an_executable, a_name, a_slot_number)
			-- TODO: remove this re-defintion (?) instruction_name := "xsl:param"
		end

feature -- Access

	static_context: XM_XPATH_STATIC_CONTEXT
			-- Static context

feature -- Status report

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "global parameter: ")
			std.error.put_string (a_string);
			std.error.put_string (variable_name);
			std.error.put_new_line
			if select_expression /= Void and then not select_expression.is_error then select_expression.display (a_level + 1) end
		end

feature -- Element change

	set_static_context (a_static_context: like static_context) is
			-- Set `static_context'.
		require
			static_context_not_void: a_static_context /= Void
		do
			static_context := a_static_context
		ensure
			static_context_set: static_context = a_static_context
		end

feature -- Evaluation

	evaluate_variable (a_context: XM_XPATH_CONTEXT) is 
			-- Evaluate variable
		local
			an_evaluation_context: XM_XSLT_EVALUATION_CONTEXT
			a_bindery: XM_XSLT_BINDERY
			was_supplied: BOOLEAN
		do
			an_evaluation_context ?= a_context
			check
				evaluation_context: an_evaluation_context /= Void
				-- this is XSLT
			end
			a_bindery := an_evaluation_context.transformer.bindery
			was_supplied := a_bindery.is_global_parameter_supplied (variable_fingerprint)
			check
				slot_number_in_range: slot_number > 0 and then slot_number <= a_bindery. global_variable_count
			end
			last_evaluated_binding := a_bindery.global_variable_value (slot_number)
			if last_evaluated_binding = Void then
				if not was_supplied and then is_required_parameter then
					create {XM_XPATH_INVALID_VALUE} last_evaluated_binding.make_from_string (STRING_.concat ("No value supplied for global parameter: ", variable_name),
																													 Xpath_errors_uri, "XTDE0050", Dynamic_error)
				else
					
					-- This is the first reference to a global parameter; try to evaluate it now.
					-- But first set a flag to stop looping.

					a_bindery.set_executing (slot_number, True)
					if a_bindery.is_circularity_error then
						create {XM_XPATH_INVALID_VALUE} last_evaluated_binding.make_from_string (STRING_.concat ("Circular definition of global parameter: ", variable_name),
																														 Xpath_errors_uri, "XTDE0640", Dynamic_error)
					else
						if was_supplied then
							select_expression := a_bindery.global_parameter_value (variable_fingerprint)
							check
								static_context_not_void: static_context /= Void
								-- set at compile time
							end
							if required_type /= Void then
								if select_expression.is_atomic_value and then select_expression.as_atomic_value.is_convertible (required_type.primary_type) then
									select_expression := select_expression.as_atomic_value.convert_to_type (required_type.primary_type)
									-- TODO: how to handle non-atomic types?
								end
								check_against_required_type (static_context)
								if is_error then
									error_value.set_location (system_id, line_number)
									an_evaluation_context.transformer.report_fatal_error (error_value)
								end
							end
						end
						check
							select_expression_exists: select_expression /= Void
							-- either supplied parameter or default value or empty sequence has been assumed
						end
						last_evaluated_binding := select_value (an_evaluation_context)
						if not a_bindery.is_evaluated (slot_number) then
							a_bindery.define_global_variable (slot_number, last_evaluated_binding)
						end
					end
					a_bindery.set_executing (slot_number, False)
				end
			end
		end

end
	
