indexing

	description:

		"Objects that represent the compiled form of a global xsl:variable"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

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

	make_global_variable (an_executable: XM_XSLT_EXECUTABLE; a_name: STRING; a_slot_number: INTEGER; a_slot_manager: like slot_manager) is
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

	is_global: BOOLEAN is
			-- Is binding global or local?
		do
			Result := True
		end

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "global variable: ")
			std.error.put_string (a_string);
			std.error.put_string (variable_name);
			std.error.put_new_line
			if select_expression /= Void then select_expression.display (a_level + 1) end
		end

feature -- Evaluation

	generate_tail_call (a_tail: DS_CELL [XM_XPATH_TAIL_CALL]; a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		do
			check
				not_used: False
			end
		end

	evaluate_variable (a_context: XM_XPATH_CONTEXT) is 
			-- Evaluate variable
		local
			an_evaluation_context: XM_XSLT_EVALUATION_CONTEXT
			a_bindery: XM_XSLT_BINDERY
		do
			an_evaluation_context ?= a_context
			check
				evaluation_context: an_evaluation_context /= Void
				-- this is XSLT
			end
			a_bindery := an_evaluation_context.transformer.bindery
			check
				slot_number_in_range: slot_number > 0 and then slot_number <= a_bindery. global_variable_count
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
					last_evaluated_binding := select_value (an_evaluation_context)
					a_bindery.define_global_variable (slot_number, last_evaluated_binding)
					a_bindery.set_executing (slot_number, False)
				end
			end
		end

	select_value (a_context: XM_XSLT_EVALUATION_CONTEXT): XM_XPATH_VALUE is
			-- Value of `select_expression'
		local
			a_new_context: XM_XSLT_EVALUATION_CONTEXT
			an_iterator: XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ITEM]
		do
			a_new_context := a_context.new_clean_context
			create an_iterator.make (a_new_context.transformer.principal_source_document)
			a_new_context.set_current_iterator (an_iterator)
			if slot_manager.number_of_variables > 0 then
				a_new_context.open_stack_frame (slot_manager)
			end
			select_expression.lazily_evaluate (a_new_context, Many_references)
			Result := select_expression.last_evaluation
		end

feature -- Element_change

	set_slot_manager (a_slot_manager: like slot_manager) is
			-- Set `slot_manager'.
		require
			slot_manager_not_void: a_slot_manager /= Void
		do
			slot_manager := a_slot_manager
		ensure
			set: slot_manager = a_slot_manager
		end

feature -- Conversion

	is_global_variable: BOOLEAN is
			-- Is `Current' a global xsl:variable/param?
		do
			Result := True
		end

	as_global_variable: XM_XSLT_GLOBAL_VARIABLE is
			-- `Current' seen as a global xsl:variable/param
		do
			Result := Current
		end

invariant

	slot_manager_not_void: slot_manager /= Void

end
	
