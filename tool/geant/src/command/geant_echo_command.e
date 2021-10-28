note

	description:

		"Echo commands"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001-2021, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_ECHO_COMMAND

inherit

	GEANT_COMMAND
		redefine
			make
		end

create

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT)
			-- Initialize command.
		do
			Precursor (a_project)

				-- Create properties:
			create message_property.make
			create to_file_property.make
			create append_property.make

				-- Set default agents:
			create message_only_agent_cell.make (agent write_message)
			create message_with_file_agent_cell.make (agent write_message_to_file)
		end

feature -- Status report

	is_executable: BOOLEAN
			-- Can command be executed?
		local
			a_is_valid: DS_CELL [BOOLEAN]
		do
			create a_is_valid.make (True)
			validate_condition (message_property.is_defined, "  [echo] error: 'message' is not defined", a_is_valid)
			if a_is_valid.item then
				if to_file_property.is_defined then
					validate_condition (not to_file_property.value.is_empty, "  [echo] error: 'to_file' may not be empty", a_is_valid)
				end
			end
			Result := a_is_valid.item
 		ensure then
 			message_property_defined: Result implies message_property.is_defined
		end

feature -- Access

	message_property: GEANT_STRING_PROPERTY
			-- Message property

	to_file_property: GEANT_STRING_PROPERTY
			-- to_file property

	append_property: GEANT_BOOLEAN_PROPERTY
			-- append property

	message_only_agent_cell: DS_CELL [PROCEDURE [TUPLE [STRING]]]
			-- Agent cell for Message only
			-- NOTE: using a DS_CELL here and for the other agents makes it possible to set the underlying agent from outside
			-- without having to provide individual setters for each agent.

	message_with_file_agent_cell: DS_CELL [PROCEDURE [TUPLE [STRING, KL_TEXT_OUTPUT_FILE]]]
			-- Agent cell for Message with file

feature -- Execution

	execute
			-- Execute command.
		local
			a_message: STRING
			a_to_file: STRING
			a_append: BOOLEAN
			a_file: KL_TEXT_OUTPUT_FILE
		do
			a_message := message_property.value
			if to_file_property.is_defined then
				a_to_file := to_file_property.value
				create a_file.make (a_to_file)
				a_append := append_property.non_empty_value_or_else (False)
				if a_append then
					project.trace (<<"  [echo] Appending '", a_message, "' to file '", a_to_file, "'">>)
					a_file.open_append
				else
					project.trace (<<"  [echo] Writing '", a_message, "' to file '", a_to_file, "'">>)
					a_file.open_write
				end
				message_with_file_agent_cell.item.call ([a_message, a_file])
				if a_file.is_open_write then
					a_file.close
				end
			else
				message_only_agent_cell.item.call ([a_message])
			end
		end

feature {NONE} -- Implementation

	write_message (a_message: STRING)
			-- Write `a_message' to `project.log'
		require
			a_message_not_void: a_message /= Void
		do
 			project.trace (<<"  [echo]">>)
			project.log (<<a_message>>)
			exit_code := 0
		end

	write_message_to_file (a_message: STRING; a_file: KL_TEXT_OUTPUT_FILE)
			-- Write `a_message' to `a_file'.
		require
			a_message_not_void: a_message /= Void
			a_file_not_void: a_file /= Void
		do
			if a_file.is_open_write then
 				a_file.put_line (a_message)
				exit_code := 0
			else
				project.log (<<"  [echo] error: cannot write to file '", a_file.name, "'">>)
				exit_code := 1
			end
		end

invariant

	message_property_not_void: message_property /= Void
	to_file_property_not_void: to_file_property /= Void
	append_property_not_void: append_property /= Void

	message_only_agent_cell_not_void: message_only_agent_cell /= Void
	message_only_agent_cell_item_not_void: message_only_agent_cell.item /= Void
	message_with_file_agent_cell_not_void: message_with_file_agent_cell /= Void
	message_with_file_agent_cell_item_not_void: message_with_file_agent_cell.item /= Void

end
