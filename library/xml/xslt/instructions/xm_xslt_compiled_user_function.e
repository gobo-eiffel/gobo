indexing
	description:

		"Objects that represent xsl:functions compiled as a single expression"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_USER_FUNCTION

inherit

	XM_XSLT_CALLABLE_FUNCTION

	XM_XSLT_SHARED_EMPTY_PROPERTIES

	XM_XPATH_DEBUGGING_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make (a_body: XM_XPATH_EXPRESSION; a_function_name: STRING; a_system_id: STRING; a_line_number: INTEGER) is
				-- Establish invariant
		require
			body_not_void: a_body /= Void
			function_name_not_void: a_function_name /= Void
			system_id_not_void: a_system_id /= Void
		local
			a_computed_expression: XM_XPATH_COMPUTED_EXPRESSION
		do
			body := a_body
			a_computed_expression ?= body
			if a_computed_expression /= Void then
				a_computed_expression.set_parent (Current)
			end
			function_name := a_function_name
			create details.make ("xsl:function", a_system_id, a_line_number, empty_property_set)
		ensure
			body_set: body = a_body
			function_name_set: function_name = a_function_name
		end	

feature -- Access

	details: XM_XSLT_TRACE_DETAILS
			-- Trace details

feature -- Evaluation

	call (some_actual_arguments: DS_LIST [XM_XPATH_VALUE]; a_transformer: XM_XSLT_TRANSFORMER; evaluate_tail_calls: BOOLEAN) is
			-- Evaluate function call.
		local
			a_bindery: XM_XSLT_BINDERY
			an_object_value: XM_XPATH_OBJECT_VALUE
			a_function_package: XM_XSLT_FUNCTION_CALL_PACKAGE
		do
			last_called_value := Void
			if last_called_value = Void then
				if a_transformer.is_tracing then
					a_transformer.trace_listener.trace_instruction_entry (details)
				end
				a_bindery := a_transformer.bindery
				a_bindery.open_stack_frame_with_positional_parameters (some_actual_arguments)
				body.lazily_evaluate (a_transformer.new_xpath_context, False)
				last_called_value := body.last_evaluation
				if evaluate_tail_calls then
					an_object_value ?= last_called_value
					if an_object_value /= Void then
						from
							a_function_package ?= an_object_value.value
						until
							a_function_package = Void
						loop
							a_function_package.call
							last_called_value := a_function_package.last_called_value
							an_object_value ?= last_called_value
							if an_object_value /= Void then
								a_function_package ?= an_object_value.value
							end
						end
					end
				end
				a_bindery.close_stack_frame				
				if a_transformer.is_tracing then
					a_transformer.trace_listener.trace_instruction_exit (details)
				end
				if is_memo_function then
					put_cached_value (a_transformer, some_actual_arguments, last_called_value)
				end
			end
		end

feature {NONE} -- Implementation

	body: XM_XPATH_EXPRESSION
			-- Function body

invariant

	body_not_void: body /= Void
	trace_details_not_void: details /= Void

end
	
