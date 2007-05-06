indexing

	description:

		"Objects that represent a compiled xsl:template"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_TEMPLATE

inherit

	XM_XPATH_TAIL_CALL

	XM_XSLT_COMPILED_PROCEDURE

	XM_XSLT_SHARED_EMPTY_PROPERTIES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make is
			-- Create un-initialized so compiling xsl:call-template instructions can forward-reference `Current'.
		do
			-- do nothing
		end

feature -- Initialization

	initialize (an_executable: like executable; a_body: like body; a_fingerprint, a_precedence, a_minimum_import_precedence: INTEGER;
					a_system_id: STRING; a_line_number: INTEGER; a_slot_manager: like slot_manager) is
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

	is_stack_frame_needed: BOOLEAN is
			-- Does `Current' need a stack frame?
		do
			Result := slot_manager.number_of_variables > 0
		end

	has_required_parameters: BOOLEAN
			-- Does `Current' have any required parameters?

feature -- Status setting

	set_has_required_parameters (a_status: BOOLEAN) is
			-- Set `has_required_parameters' to `a_status'.
		do
			has_required_parameters := a_status
		ensure
			has_required_parameters_set: has_required_parameters = a_status
		end

feature -- Evaluation

	process (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- process `Current', without returning any tail calls
		require
			context_not_void: a_context /= Void
		local
			l_tail: DS_CELL [XM_XPATH_TAIL_CALL]
			l_tail_call: XM_XPATH_TAIL_CALL
		do
			from
				create l_tail.make (Void)
				generate_tail_call (l_tail, a_context)
				l_tail_call := l_tail.item
			until
				l_tail_call = Void
			loop
				l_tail.put (Void)
				l_tail_call.generate_tail_call (l_tail, a_context)
				l_tail_call := l_tail.item
			end
		end

	generate_tail_call (a_tail: DS_CELL [XM_XPATH_TAIL_CALL]; a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			a_new_context: XM_XSLT_EVALUATION_CONTEXT
		do
			a_new_context := a_context.new_context
			a_new_context.set_current_template (Current)
			expand (a_tail, a_new_context)
		end

	expand (a_tail: DS_CELL [XM_XPATH_TAIL_CALL]; a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Expand the template.
			-- Called when the template is invoked using xsl:call-template or xsl:apply-templates.
		require
			a_tail_not_void: a_tail /= Void
			no_tail_call: a_tail.item = Void
			context_not_void: a_context /= Void
		local
			l_instruction: XM_XSLT_INSTRUCTION
			l_user_call: XM_XSLT_USER_FUNCTION_CALL
			l_function, l_previous_function: XM_XSLT_COMPILED_USER_FUNCTION
			l_value: DS_CELL [XM_XPATH_VALUE]
			l_finished: BOOLEAN
		do
			l_instruction ?= body
			if l_instruction /= Void then
				l_instruction.generate_tail_call (a_tail, a_context)
			else
				from
					body.generate_events (a_context)
				until l_finished loop
					l_function := a_context.tail_call_function
					a_context.clear_tail_call_function
					if l_previous_function = Void and body.is_user_function_call then
						l_user_call ?= body
						l_previous_function := l_user_call.function
					end
					if l_function /= Void then
						if l_function /= l_previous_function then
						a_context.reset_stack_frame_map (l_function.slot_manager, l_function.parameter_definitions.count)
						end
						l_previous_function := l_function
						create l_value.make (Void)
						l_function.body.evaluate (l_value, l_function.evaluation_mode, 1, a_context)
						l_value.item.generate_events (a_context)
					else
						l_finished := True
					end
				end
			end
		ensure
			possible_tail_call: a_tail.item /= Void xor a_tail.item = Void
		end

end
