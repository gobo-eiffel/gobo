indexing

	description:

		"Objects that detail trace events"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_TRACE_DETAILS

creation

	make

feature {NONE} -- Initalization

	make (an_instruction_name, a_system_id: STRING; a_line_number: INTEGER; some_properties: DS_HASH_TABLE [STRING, STRING]) is
			-- Establish invariant.
		require
				instruction_name: an_instruction_name /= Void and then an_instruction_name.count > 0
				system_id: a_system_id /= Void
				line_number: a_line_number >= -1
				properties_not_void: some_properties /= Void
		do
			instruction_name := an_instruction_name
			system_id := a_system_id
			line_number := a_line_number
			properties := some_properties
		ensure
			instruction_name_set: instruction_name = an_instruction_name
			system_id_set: system_id = a_system_id
			line_numer_set: line_number = a_line_number
			properties_set: properties = some_properties
		end

feature -- Access

	instruction_name: STRING
			-- Name of instruction
	
	system_id: STRING
			-- SYSTEM id of stylesheet module in which instruction occurs;

	line_number: INTEGER 
			-- Line number of instruction

	properties: DS_HASH_TABLE [STRING, STRING]
			-- Additional trace properties

invariant

	instruction_name: instruction_name /= Void and then instruction_name.count > 0
	system_id: system_id /= Void
	line_number: line_number >= -1
	properties_not_void: properties /= Void

end
	
