indexing

	description:

		"Objects that represent the compiled form of XSLT variables and parameters"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_COMPILED_GENERAL_VARIABLE

inherit

	XM_XSLT_INSTRUCTION

feature -- Access

	select_expression: XM_XPATH_EXPRESSION
			-- Select expresion

	required_type: XM_XPATH_SEQUENCE_TYPE
			-- Required type

	variable_fingerprint: INTEGER
			-- Fingerprint of variable name

	instruction_name: STRING
			-- Name of instruction, for diagnostics
	
feature -- Status report

	is_global_variable: BOOLEAN
			-- Is `Current' a global variable?

	is_required_parameter: BOOLEAN
			-- Is `Current' a required paramter?

	is_tunnel_parameter: BOOLEAN
			-- Is `Current' a tunnel paramter?

	contains_local_variables: BOOLEAN
			-- Does `Current' contain any local variables?
	
feature -- Status setting

	set_selector (a_select_expression: XM_XPATH_EXPRESSION) is
			-- Set `select_expression'.
		require
			select_expression_not_void: a_select_expression /= Void
		do
			select_expression := a_select_expression
		ensure
			set: select_expression = a_select_expression
		end

	set_global_variable (is_global: BOOLEAN) is
			-- Set global/local variable
		do
			is_global_variable := is_global
		ensure
			set: is_global_variable = is_global
		end

	set_required_parameter (is_required: BOOLEAN) is
			-- Set required/optional parameter.
		do
			is_required_parameter := is_required
		ensure
			set: is_required_parameter = is_required
		end

	set_tunnel_parameter (is_tunnel: BOOLEAN) is
			-- Set tunnel/optional parameter.
		do
			is_tunnel_parameter := is_tunnel
		ensure
			set: is_tunnel_parameter = is_tunnel
		end
	
	set_contains_locals (any_locals: BOOLEAN) is
			-- Set `contains_local_variables'.
		do
			contains_local_variables := any_locals
		ensure
			set: contains_local_variables = any_locals
		end

feature -- Evaluation

	value (a_context: XM_XSLT_EVALUATION_CONTEXT): XM_XPATH_VALUE is
			-- Value
		require
			context_not_void: a_context /= Void
		local
			a_transformer: XM_XSLT_TRANSFORMER
			a_saved_receiver, a_sequence_receiver: XM_XSLT_SEQUENCE_RECEIVER
			a_receiver: XM_XSLT_SEQUENCE_OUTPUTTER
			a_sequence_checker: XM_XSLT_SEQUENCE_CHECKER
			a_bindery: XM_XSLT_BINDERY
			an_empty_parameter_set: XM_XSLT_PARAMETER_SET
		do
			a_transformer := a_context.transformer
			if select_expression = Void then
				a_saved_receiver := a_transformer.current_receiver
				create a_receiver.make
				a_sequence_receiver := a_receiver
				a_transformer.change_to_sequence_output_destination (a_receiver)
				if required_type /= Void then
					create a_sequence_checker.make (required_type, a_receiver)
					a_sequence_receiver := a_sequence_checker
					a_transformer.set_receiver (a_sequence_checker)
				end
				if is_global_variable and then contains_local_variables then
					a_bindery := a_transformer.bindery
					create an_empty_parameter_set.make_empty
					a_bindery.open_stack_frame (an_empty_parameter_set, Void)
					--		process_children (a_transformer.new_xpath_context)
					process_children (a_context)
					a_bindery.close_stack_frame
				else
					-- process_children (a_transformer.new_xpath_context)
					process_children (a_context)
				end
				a_transformer.reset_output_destination (a_saved_receiver)
				if required_type /= Void then
					a_sequence_checker.final_check
				end
				Result := a_receiver.sequence
			else

				-- There is a select attribute: do a lazy evaluation of the expression,
            --   which will already contain any code to force conversion to the required type.

            --  But with global variables, we have already delayed evaluating the expression
            --   until the first reference to the variable is encountered, and there's not
            --  much point delaying it any further.

				if is_global_variable then
					if contains_local_variables then
						a_bindery := a_transformer.bindery
						create an_empty_parameter_set.make_empty
						a_bindery.open_stack_frame (an_empty_parameter_set, Void)
						if select_expression.is_error then
							create {XM_XPATH_INVALID_VALUE} Result.make (select_expression.error_value)
						else
							select_expression.eagerly_evaluate (a_transformer.new_xpath_context)
							Result := select_expression.last_evaluation
						end
						a_bindery.close_stack_frame
					else
						--select_expression.eagerly_evaluate (a_transformer.new_xpath_context)
						if select_expression.is_error then
							create {XM_XPATH_INVALID_VALUE} Result.make (select_expression.error_value)
						else
							select_expression.eagerly_evaluate (a_context)
							Result := select_expression.last_evaluation
						end
					end
				else
					--select_expression.lazily_evaluate (a_transformer.new_xpath_context)
					if select_expression.is_error then
						create {XM_XPATH_INVALID_VALUE} Result.make (select_expression.error_value)
					else
						select_expression.lazily_evaluate (a_context, True)
						Result := select_expression.last_evaluation
					end
				end
			end
		ensure
			variable_value_not_void: Result /= Void
		end

feature -- Element change

	initialize (a_select_expression: XM_XPATH_EXPRESSION; a_required_type: XM_XPATH_SEQUENCE_TYPE; a_fingerprint: INTEGER) is
			-- Set initial values.
		do
			select_expression := a_select_expression
			required_type := a_required_type
			variable_fingerprint := a_fingerprint
		ensure
			select_expression: select_expression = a_select_expression
			required_type: required_type = a_required_type
			variable_fingerprint: variable_fingerprint = a_fingerprint
		end

	set_required_type (a_required_type: XM_XPATH_SEQUENCE_TYPE) is
			-- Set `required_type'.
		do
			required_type := a_required_type
		ensure
			set: required_type = a_required_type
		end
			
invariant

	required_parameter: not (is_required_parameter and then (is_global_variable or else is_tunnel_parameter))
	tunnel_parameter: not (is_tunnel_parameter and then (is_global_variable or else is_required_parameter))
	global_variable: not (is_global_variable and then (is_required_parameter or else is_tunnel_parameter))

end

