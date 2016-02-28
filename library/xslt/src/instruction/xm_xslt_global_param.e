note

	description:

		"Objects that represent the compiled form of a global xsl:param"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005-2015, Colin Adams and others"
	license: "MIT License"
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

	make (an_executable: XM_XSLT_EXECUTABLE; a_name: STRING; a_slot_number: INTEGER)
			-- Establish invariant.
		do
			Precursor (an_executable, a_name, a_slot_number)
			-- TODO: remove this re-defintion (?) instruction_name := "xsl:param"
		end

feature -- Access

	static_context: detachable XM_XPATH_STATIC_CONTEXT
			-- Static context

feature -- Status report

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "global parameter: ")
			std.error.put_string (a_string);
			std.error.put_string (variable_name);
			std.error.put_new_line
			if attached select_expression as l_select_expression and then not l_select_expression.is_error then
				l_select_expression.display (a_level + 1)
			end
		end

feature -- Element change

	set_static_context (a_static_context: like static_context)
			-- Set `static_context'.
		require
			static_context_not_void: a_static_context /= Void
		do
			static_context := a_static_context
		ensure
			static_context_set: static_context = a_static_context
		end

feature -- Evaluation

	evaluate_variable (a_context: XM_XPATH_CONTEXT)
			-- Evaluate variable
		local
			l_bindery: XM_XSLT_BINDERY
			l_supplied: BOOLEAN
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
			l_select_expression: like select_expression
			l_last_evaluated_binding: like last_evaluated_binding
		do
			check
				evaluation_context: attached {XM_XSLT_EVALUATION_CONTEXT} a_context as l_evaluation_context
				-- this is XSLT
				attached l_evaluation_context.transformer as l_evaluation_context_transformer
				attached l_evaluation_context_transformer.bindery as l_evaluation_context_transformer_bindery
			then
				l_bindery := l_evaluation_context_transformer_bindery
				l_supplied := l_bindery.is_global_parameter_supplied (variable_fingerprint)
				check
					slot_number_in_range: slot_number > 0 and then slot_number <= l_bindery. global_variable_count
				end
				last_evaluated_binding := l_bindery.global_variable_value (slot_number)
				if last_evaluated_binding = Void then
					if not l_supplied and then (is_required_parameter or is_implicitly_required_parameter) then
						if is_implicitly_required_parameter then
							create {XM_XPATH_INVALID_VALUE} last_evaluated_binding.make_from_string (STRING_.concat ("No value supplied for implicitly required parameter: ", variable_name),
																															 Xpath_errors_uri, "XTDE0610", Dynamic_error)

						else
							create {XM_XPATH_INVALID_VALUE} last_evaluated_binding.make_from_string (STRING_.concat ("No value supplied for global parameter: ", variable_name),
																															 Xpath_errors_uri, "XTDE0050", Dynamic_error)
						end
					else

						-- This is the first reference to a global parameter; try to evaluate it now.
						-- But first set a flag to stop looping.

						l_bindery.set_executing (slot_number, True)
						if l_bindery.is_circularity_error then
							create {XM_XPATH_INVALID_VALUE} last_evaluated_binding.make_from_string (STRING_.concat ("Circular definition of global parameter: ", variable_name),
																															 Xpath_errors_uri, "XTDE0640", Dynamic_error)
						else
							if l_supplied then
								l_select_expression := l_bindery.global_parameter_value (variable_fingerprint)
								select_expression := l_select_expression
								check
									static_context_not_void: attached static_context as l_static_context
									-- set at compile time
								then
									if attached required_type as l_required_type then
										if l_select_expression.is_atomic_value and then l_select_expression.as_atomic_value.is_convertible (l_required_type.primary_type) then
											l_select_expression.as_atomic_value.convert_to_type (l_required_type.primary_type)
											select_expression := l_select_expression.as_atomic_value.converted_value
											-- TODO: how to handle non-atomic types?
										end
										create l_replacement.make (Void)
										check_against_required_type (l_replacement, l_static_context)
										check postcondition_of_check_against_required_type: attached l_replacement.item as l_replacement_item then
											if attached l_replacement_item.error_value as l_error_value then
												check is_error: l_replacement_item.is_error end
												l_error_value.set_location (system_id, line_number)
												l_evaluation_context_transformer.report_fatal_error (l_error_value)
											end
										end
									end
								end
							end
							check
								select_expression_not_void: select_expression /= Void
								-- either supplied parameter or default value or empty sequence has been assumed
							end
							l_last_evaluated_binding := select_value (l_evaluation_context)
							last_evaluated_binding := l_last_evaluated_binding
							if not l_bindery.is_evaluated (slot_number) then
								l_bindery.define_global_variable (slot_number, l_last_evaluated_binding)
							end
						end
						l_bindery.set_executing (slot_number, False)
					end
				end
			end
		end

end

