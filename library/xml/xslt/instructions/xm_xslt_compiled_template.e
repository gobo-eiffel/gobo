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

	XM_XPATH_DEBUGGING_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create un-initialized
		do
			do_nothing
		end

feature -- Initialization

	initialize (a_sequence_instruction: XM_XSLT_SEQUENCE_INSTRUCTION; stack_frame_needed: BOOLEAN; a_precedence, a_minimum_import_precedence: INTEGER;
		a_system_id: STRING; a_line_number: INTEGER) is
			-- Initialize.
		require
			not_yet_initialized: not initialized
		do
			body := a_sequence_instruction
			is_stack_frame_needed := stack_frame_needed
			precedence := a_precedence
			minimum_import_precedence := a_minimum_import_precedence
			system_id := a_system_id
			line_number := a_line_number
			initialized := True
		ensure
			initialized: initialized
			body_set: body = a_sequence_instruction
			stack_frame_necessity_set: is_stack_frame_needed = stack_frame_needed
			precedence_set: precedence = a_precedence
			minimum_import_precedence_set: minimum_import_precedence = a_minimum_import_precedence
			system_id_set: system_id = a_system_id
			line_number_set: line_number = a_line_number					 
		end

feature -- Access

	system_id: STRING
			-- System id
	
	line_number: INTEGER
			-- Line number

	precedence: INTEGER
			-- Import precedence

	minimum_import_precedence: INTEGER
			-- Lowest import pecedence

feature -- Status report

	initialized: BOOLEAN
			-- Hae `inititialize' been called yet?

	is_stack_frame_needed: BOOLEAN
			-- Does `Current' need a stack frame?

feature -- Evaluation

	process_leaving_tail (a_transformer: XM_XSLT_TRANSFORMER) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			saved_template: XM_XSLT_COMPILED_TEMPLATE
		do
			last_tail_call := Void
			if body /= Void then
				saved_template := a_transformer.current_template
				a_transformer.set_current_template (Current)
				if a_transformer.is_tracing then
					todo ("process_leaving_tail", True)
				else
--					if not first_processed then
--						first_processed := True
--						body.display_children (1, shared_name_pool)
--					end
					body.process_leaving_tail (a_transformer.new_xpath_context)
					last_tail_call := body.last_tail_call
				end
			end
			a_transformer.set_current_template (saved_template)
		end

	expand (a_transformer: XM_XSLT_TRANSFORMER) is
			-- Expand the template.
			-- Called when the template is invoked using xsl:call-template.
			-- Invoking a template by this method does not change the current template.
		require
			transformer_not_void: a_transformer /= Void
		do
			last_tail_call := Void
			if body /= Void then
				body.process_leaving_tail (a_transformer.new_xpath_context)
				last_tail_call := body.last_tail_call
			end
		end

feature {NONE} -- Implementation

	body: XM_XSLT_SEQUENCE_INSTRUCTION
			-- Optional template body

	first_processed: BOOLEAN

end
