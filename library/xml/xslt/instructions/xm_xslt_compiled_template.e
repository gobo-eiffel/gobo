indexing

	description:

		"Objects that represent a compiled xsl:template"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_TEMPLATE

inherit

	XM_XSLT_TAIL_CALL

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

feature -- Evaluation

	process (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- process `Current', without returning any tail calls
		require
			context_not_void: a_context /= Void
		do
			from
				process_leaving_tail (a_context)
			until
				last_tail_call = Void
			loop
				last_tail_call.process_leaving_tail (a_context)
				last_tail_call := last_tail_call.last_tail_call
			end
		end

	process_leaving_tail (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			a_new_context: XM_XSLT_EVALUATION_CONTEXT
		do
			a_new_context := a_context.new_context
			a_new_context.set_current_template (Current)
			expand (a_new_context)
		end

	expand (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Expand the template.
			-- Called when the template is invoked using xsl:call-template or xsl:apply-templates.
		require
			context_not_void: a_context /= Void
		local
			an_instruction: XM_XSLT_INSTRUCTION
		do
			an_instruction ?= body
			if an_instruction /= Void then
				an_instruction.process_leaving_tail (a_context)
				last_tail_call := an_instruction.last_tail_call
			else
				body.process (a_context)
				last_tail_call := Void
			end
		end

end
