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
			body_not_void: a_sequence_instruction /= Void
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
	
feature {NONE} -- Implementation

	body: XM_XSLT_SEQUENCE_INSTRUCTION
			-- Template body

invariant

	body_not_void: initialized implies body /= Void

end
