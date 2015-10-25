note

	description:

		"Objects that represent a compiled xsl:template"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_TEMPLATE

inherit

	XM_XSLT_COMPILED_PROCEDURE

	XM_XSLT_SHARED_EMPTY_PROPERTIES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make
			-- Create un-initialized so compiling xsl:call-template instructions can forward-reference `Current'.
		do
			-- do nothing
		end

feature -- Initialization

	initialize (an_executable: like executable; a_body: like body; a_fingerprint, a_precedence, a_minimum_import_precedence: INTEGER;
					a_system_id: STRING; a_line_number: INTEGER; a_slot_manager: like slot_manager)
			-- Initialize.
		require
			not_yet_initialized: not initialized
			executable_not_void: an_executable /= Void
			body_not_void: a_body /= Void
			system_id_not_void: a_system_id /= Void
			slot_manager_not_void: a_slot_manager /= Void
		do
			make_procedure (an_executable, a_body, a_line_number, a_system_id, a_slot_manager)
			precedence := a_precedence
			minimum_import_precedence := a_minimum_import_precedence
			template_fingerprint := a_fingerprint
		ensure
			initialized: initialized
			executable_set: executable = an_executable
			body_set: body = a_body
			system_id_set: system_id = a_system_id
			line_number_set: line_number = a_line_number
			slot_manager_set: slot_manager = a_slot_manager
			precedence_set: precedence = a_precedence
			minimum_import_precedence_set: minimum_import_precedence = a_minimum_import_precedence
			template_fingerprint_set: template_fingerprint = a_fingerprint
		end

feature -- Access

	template_fingerprint: INTEGER
			-- Fingerprint of template name (-1 for unnamed templates)

	precedence: INTEGER
			-- Import precedence

	minimum_import_precedence: INTEGER
			-- Lowest import pecedence

feature -- Status report

	is_stack_frame_needed: BOOLEAN
			-- Does `Current' need a stack frame?
		do
			check attached slot_manager as l_slot_manager then
				Result := l_slot_manager.number_of_variables > 0
			end
		end

	has_required_parameters: BOOLEAN
			-- Does `Current' have any required parameters?

feature -- Status setting

	set_has_required_parameters (a_status: BOOLEAN)
			-- Set `has_required_parameters' to `a_status'.
		do
			has_required_parameters := a_status
		ensure
			has_required_parameters_set: has_required_parameters = a_status
		end

feature -- Evaluation

	generate_events (a_rule: XM_XSLT_RULE; a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Process `Current', without returning any tail calls
		require
			a_rule_not_void: a_rule /= Void
			a_context_not_void: a_context /= Void
		local
			l_tail: DS_CELL [detachable XM_XPATH_TAIL_CALL]
			l_tail_call: detachable XM_XPATH_TAIL_CALL
		do
			from
				create l_tail.make (Void)
				generate_tail_call (l_tail, a_rule, a_context)
				l_tail_call := l_tail.item
			until
				l_tail_call = Void
			loop
				l_tail.put (Void)
				l_tail_call.generate_tail_call (l_tail, a_context)
				l_tail_call := l_tail.item
			end
		end

	generate_tail_call (a_tail: DS_CELL [detachable XM_XPATH_TAIL_CALL]; a_rule: XM_XSLT_RULE; a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		require
			a_rule_not_void: a_rule /= Void
			a_context_not_void: a_context /= Void
			a_tail_not_void: a_tail /= Void
			no_tail_call: a_tail.item = Void
		local
			a_new_context: XM_XSLT_EVALUATION_CONTEXT
		do
			if body /= Void then
				a_new_context := a_context.new_context
				a_new_context.set_current_template (a_rule)
				expand (a_tail, a_new_context)
			end
		end

	expand (a_tail: DS_CELL [detachable XM_XPATH_TAIL_CALL]; a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Expand the template.
			-- Called when the template is invoked using xsl:call-template or xsl:apply-templates.
		require
			a_tail_not_void: a_tail /= Void
			no_tail_call: a_tail.item = Void
			context_not_void: a_context /= Void
		local
			l_function: detachable XM_XSLT_COMPILED_USER_FUNCTION
			l_previous_function: detachable XM_XSLT_COMPILED_USER_FUNCTION
			l_value: DS_CELL [detachable XM_XPATH_VALUE]
			l_finished: BOOLEAN
		do
			if attached {XM_XSLT_INSTRUCTION} body as l_instruction then
				l_instruction.generate_tail_call (a_tail, a_context)
			else
				check attached body as l_body then
					from
						l_body.generate_events (a_context)
						-- TODO: do we need this?
					until l_finished loop
						l_function := a_context.tail_call_function
						a_context.clear_tail_call_function
						if l_previous_function = Void and l_body.is_user_function_call then
							check attached {XM_XSLT_USER_FUNCTION_CALL} body as l_user_call then
								l_previous_function := l_user_call.function
							end
						end
						if l_function /= Void then
							if l_function /= l_previous_function then
								check attached l_function.parameter_definitions as l_function_parameter_definitions then
									a_context.reset_stack_frame_map (l_function.slot_manager, l_function_parameter_definitions.count)
								end
							end
							l_previous_function := l_function
							create l_value.make (Void)
							l_function.body.evaluate (l_value, l_function.evaluation_mode, 1, a_context)
							check postcondition_of_evaluate: attached l_value.item as l_value_item then
								l_value_item.generate_events (a_context)
							end
						else
							l_finished := True
						end
					end
				end
			end
		ensure
			possible_tail_call: a_tail.item /= Void xor a_tail.item = Void
		end

end
