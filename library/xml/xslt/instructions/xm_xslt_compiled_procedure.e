indexing

	description:

		"Compiled XSLT objects that may contain lovcal variables"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_PROCEDURE

create

	make_procedure

feature {NONE} -- Initialization

	make_procedure (an_executable: like executable; a_body: like body;
						 a_line_number: like line_number; a_system_id: like system_id; a_slot_manager: like slot_manager) is
			-- Establish invariant
		require
			executable_not_void: an_executable /= Void
			body_not_void: a_body /= Void
			system_id_not_void: a_system_id /= Void
			slot_manager_not_void: a_slot_manager /= Void
		do
			executable := an_executable
			body := a_body
			system_id := a_system_id
			line_number := a_line_number
			slot_manager := a_slot_manager
			initialized := True
		ensure
			initialized: initialized
			executable_set: executable = an_executable
			body_set: body = a_body
			system_id_set: system_id = a_system_id
			line_number_set: line_number = a_line_number
			slot_manager_set: slot_manager = a_slot_manager
		end

feature -- Access

	executable: XM_XSLT_EXECUTABLE
			-- Executable stylesheet

	body: XM_XPATH_EXPRESSION
			-- Executable instruction body

	line_number: INTEGER
			-- Line number within source code

	system_id: STRING
			-- System id of source code

	slot_manager: XM_XPATH_SLOT_MANAGER
			-- Slot manager for variables

feature -- Status report

	initialized: BOOLEAN
			-- Hae `make_procedure' been called yet?
	
invariant

	executable_not_void: initialized implies executable /= Void
	body_not_void:  initialized implies body /= Void
	system_id_not_void:  initialized implies system_id /= Void
	slot_manager_not_void:  initialized implies slot_manager /= Void

end

	
