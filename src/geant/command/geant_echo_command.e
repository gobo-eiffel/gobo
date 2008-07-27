indexing

	description:

		"Echo commands"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001-2008, Sven Ehrke and others"
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

	make (a_project: GEANT_PROJECT) is
			-- Initialize command.
		do
			Precursor (a_project)
			is_executable_flag := True

				-- Create properties:
			create message_property.make
			create to_file_property.make
			create append_property.make

				-- Set default agents:
			create message_only_agent_cell.make (agent log_message)
			create message_with_file_agent_cell.make (agent write_message_to_file)
			is_not_executable_agent := agent set_is_executable_flag_to_false
		end

feature -- Status report

	is_executable: BOOLEAN is
			-- Can command be executed?
		do
			execute_with_agents (Void, Void)
			Result := is_executable_flag
		end

feature -- Access

	message_property: GEANT_STRING_PROPERTY
			-- Message property

	to_file_property: GEANT_STRING_PROPERTY
			-- to_file property

	append_property: GEANT_BOOLEAN_PROPERTY
			-- append property

	message_only_agent_cell: DS_CELL [PROCEDURE [ANY, TUPLE [STRING]]]
			-- Agent cell for Message only
			-- NOTE: using a DS_CELL here and for the other agents makes it possible to set the underlying agent from outside
			-- without having to provide individual setters for each agent.

	message_with_file_agent_cell: DS_CELL [PROCEDURE [ANY, TUPLE [STRING, KL_TEXT_OUTPUT_FILE, BOOLEAN]]]
			-- Agent cell for Message with file

feature -- Execution

	execute is
			-- Execute command.
		do
			execute_with_agents (message_only_agent_cell, message_with_file_agent_cell)
		end

feature {NONE} -- Implementation

	log_message (a_message: STRING) is
			-- Log `a_message' to `project.log'
		require
			a_message_not_void: a_message /= Void
		do
 			project.trace (<<"  [echo] ">>)
			project.log (<<a_message>>)
			exit_code := 0
		end

	write_message_to_file (a_message: STRING; a_file: KL_TEXT_OUTPUT_FILE; a_append: BOOLEAN) is
			-- Write `a_message' to `a_file'.
			-- Note: `a_append' = True implies that `a_file' has been opened in append mode, otherwise
			-- in normal write mode. `a_append' is passed in only as information in case
			-- append/write-mode dependent actions need to be performed.
			-- TODO: shouldn't `KL_OUTPUT_FILE.is_open_append' be exported so that this information is  directly available?
		require
			a_message_not_void: a_message /= Void
			a_file_not_void: a_file /= Void
		do
			if a_file.is_open_write then
				a_file.put_line (a_message)
				exit_code := 0
			else
				project.log (<<"  [echo] error: cannot write to file", a_file.name, "'">>)
				exit_code := 1
			end
		end

	is_not_executable_agent: PROCEDURE [ANY, TUPLE]
			-- Agent called when command is not executable

	execute_with_agents (a_message_only_agent_cell: like message_only_agent_cell; a_message_with_file_agent_cell: like message_with_file_agent_cell) is
			-- Execute command.
		local
			a_message: STRING
			a_to_file: STRING
			a_append: BOOLEAN
			a_file: KL_TEXT_OUTPUT_FILE
		do
			if message_property.is_defined then
	  			a_message := message_property.value
				if to_file_property.is_defined then
		  			a_to_file := to_file_property.value
					if a_message_with_file_agent_cell /= Void then
						check item_set: a_message_with_file_agent_cell.item /= Void end
						create a_file.make (a_to_file)
						if append_property.is_defined then
			  				a_append := append_property.value
						else
			  				a_append := False
						end
						if a_append then
							project.trace (<<"  [echo] Appending '", a_message, "' to file '", a_to_file, "'">>)
							a_file.open_append
						else
							project.trace (<<"  [echo] Writing '", a_message, "' to file '", a_to_file, "'">>)
							a_file.open_write
						end
						a_message_with_file_agent_cell.item.call ([a_message, a_file, a_append])
						a_file.close
					end
				else
					if a_message_only_agent_cell /= Void then
						check item_set: a_message_only_agent_cell.item /= Void end
						a_message_only_agent_cell.item.call ([a_message])
					end
				end
			else
				if is_not_executable_agent /= Void then
					is_not_executable_agent.call ([])
				else
					--TODO: raise exception
				end
			end
		end

	is_executable_flag: BOOLEAN
			-- Temporary internal flag to store executable state

	set_is_executable_flag_to_false is
		do
			is_executable_flag := False
		end

end
