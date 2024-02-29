note

	description:

		"Objects that represent the compiled form of a global xsl:variable"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005-2015, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_GLOBAL_VARIABLE

inherit

	XM_XSLT_COMPILED_VARIABLE
		redefine
			is_global, select_value, is_global_variable, as_global_variable
		end

	XM_XPATH_VARIABLE_DECLARATION_ROUTINES

create

	make_global_variable

feature {NONE} -- Initialization

	make_global_variable (an_executable: XM_XSLT_EXECUTABLE; a_name: STRING; a_slot_number: INTEGER; a_slot_manager: like slot_manager)
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			valid_name: a_name /= Void and then a_name.count > 0
			slot_manager_not_void: a_slot_manager /= Void
		do
			make (an_executable, a_name, a_slot_number)
			slot_manager := a_slot_manager
		ensure
			executable_set: executable = an_executable
			name_set: variable_name = a_name
			slot_number: slot_number = a_slot_number
			slot_manager_set: slot_manager = a_slot_manager
		end

feature -- Access

	slot_manager: XM_XPATH_SLOT_MANAGER
			-- Slot manager for contained local variables

feature -- Status report

	is_global: BOOLEAN
			-- Is binding global or local?
		do
			Result := True
		end

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "global variable: ")
			std.error.put_string (a_string);
			std.error.put_string (variable_name);
			std.error.put_new_line
			if attached select_expression as l_select_expression then
				l_select_expression.display (a_level + 1)
			end
		end

feature -- Evaluation

	generate_tail_call (a_tail: DS_CELL [detachable XM_XPATH_TAIL_CALL]; a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		do
			check
				not_used: False
			end
		end

	evaluate_variable (a_context: XM_XPATH_CONTEXT)
			-- Evaluate variable
		local
			a_bindery: XM_XSLT_BINDERY
			l_last_evaluated_binding: like last_evaluated_binding
		do
			check
				evaluation_context: attached {XM_XSLT_EVALUATION_CONTEXT} a_context as an_evaluation_context
				-- this is XSLT
				attached an_evaluation_context.transformer as l_evaluation_context_transformer
			then
				check attached l_evaluation_context_transformer.bindery as l_evaluation_context_transformer_bindery then
					a_bindery := l_evaluation_context_transformer_bindery
				end
				check
					slot_number_in_range: slot_number > 0 and then slot_number <= a_bindery.global_variable_count
				end
				last_evaluated_binding := a_bindery.global_variable_value (slot_number)
				if last_evaluated_binding = Void then

					-- This is the first reference to a global variable; try to evaluate it now.
	            -- But first set a flag to stop looping.

					a_bindery.set_executing (slot_number, True)
					if a_bindery.is_circularity_error then
						create {XM_XPATH_INVALID_VALUE} last_evaluated_binding.make_from_string (STRING_.concat ("Circular definition of global variable: ", variable_name),
																														 Xpath_errors_uri, "XTDE0640", Dynamic_error)
					else
						l_last_evaluated_binding := select_value (an_evaluation_context)
						last_evaluated_binding := l_last_evaluated_binding
						a_bindery.define_global_variable (slot_number, l_last_evaluated_binding)
						a_bindery.set_executing (slot_number, False)
					end
				end
			end
		end

	select_value (a_context: XM_XSLT_EVALUATION_CONTEXT): XM_XPATH_VALUE
			-- Value of `select_expression'
		local
			l_new_context: XM_XSLT_EVALUATION_CONTEXT
			l_iterator: XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ITEM]
			l_result: DS_CELL [detachable XM_XPATH_VALUE]
		do
			l_new_context := a_context.new_clean_context
			check attached l_new_context.transformer as l_transformer then
				create l_iterator.make (l_transformer.principal_source_document)
				l_new_context.set_current_iterator (l_iterator)
				if slot_manager.number_of_variables > 0 then
					l_new_context.open_stack_frame (slot_manager)
				end
				create l_result.make (Void)
				check precondition_select_expression_not_void: attached select_expression as l_select_expression then
					l_select_expression.evaluate (l_result, l_select_expression.lazy_evaluation_mode, Many_references, l_new_context)
					check postcondition_of_evaluate: attached l_result.item as l_result_item then
						Result := l_result_item
					end
				end
			end
		end

feature -- Element_change

	set_slot_manager (a_slot_manager: like slot_manager)
			-- Set `slot_manager'.
		require
			slot_manager_not_void: a_slot_manager /= Void
		do
			slot_manager := a_slot_manager
		ensure
			set: slot_manager = a_slot_manager
		end

feature -- Conversion

	is_global_variable: BOOLEAN
			-- Is `Current' a global xsl:variable/param?
		do
			Result := True
		end

	as_global_variable: XM_XSLT_GLOBAL_VARIABLE
			-- `Current' seen as a global xsl:variable/param
		do
			Result := Current
		end

invariant

	slot_manager_not_void: slot_manager /= Void

end

