indexing

	description:

		"Echo commands"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
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
				-- Default agents:
			message_only_agent := agent execute_with_message_only
			message_with_file_agent := agent execute_with_file
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

	message_only_agent: PROCEDURE [ANY, TUPLE [STRING]]
			-- Message only agent

	message_with_file_agent: PROCEDURE [ANY, TUPLE [STRING, STRING, BOOLEAN]]
			-- Message with file agent

	message_property: GEANT_PROPERTY [STRING]
			-- Message

	to_file_property: GEANT_PROPERTY [STRING]
			-- Name of destination file

	append_property: GEANT_PROPERTY [BOOLEAN]
			-- Append

feature -- Setting

	set_message_property (a_message_property: like message_property) is
			-- Set `message_property' to `a_message_property'.
		require
			a_message_property_not_void: a_message_property /= Void
		do
			message_property := a_message_property
		ensure
			message_property_set: message_property = a_message_property
		end

	set_to_file_property (a_to_file_property: like to_file_property) is
			-- Set `to_file_property' to `a_to_file_property'.
		require
			a_to_file_property_not_void: a_to_file_property /= Void
		do
			to_file_property := a_to_file_property
		ensure
			to_file_property_set: to_file_property = a_to_file_property
		end

	set_append_property (a_append_property: like append_property) is
			-- Set `append_property' to `a_append_property'.
		require
			a_append_property_not_void: a_append_property /= Void
		do
			append_property := a_append_property
		ensure
			append_property_set: append_property = a_append_property
		end

	set_message_only_agent (a_agent: like message_only_agent) is
			-- Set `message_only_agent' to `a_message_only_agent'.
		require
			a_agent_not_void: a_agent /= Void
		do
			message_only_agent := a_agent
		ensure
			message_only_agent_set: message_only_agent = a_agent
		end

	set_message_with_file_agent (a_agent: like message_with_file_agent) is
			-- Set `message_with_file_agent' to `a_message_with_file_agent'.
		require
			a_agent_not_void: a_agent /= Void
		do
			message_with_file_agent := a_agent
		ensure
			message_with_file_agent_set: message_with_file_agent = a_agent
		end

feature -- Execution

	execute is
			-- Execute command.
		do
			execute_with_agents (message_only_agent, message_with_file_agent)
		end

	execute_with_message_only (a_message: STRING) is
		require
			a_message_not_void: a_message /= Void
		do
 			project.trace (<<"  [echo] ">>)
			project.log (<<a_message>>)
			exit_code := 0
		end

	execute_with_file (a_message, a_to_file: STRING; a_append: BOOLEAN) is
		require
			a_message_not_void: a_message /= Void
			a_to_file_not_void: a_to_file /= Void
			a_to_file_not_empty: not a_to_file.is_empty
		local
			a_file: KL_TEXT_OUTPUT_FILE
		do
			create a_file.make (a_to_file)
			if a_append then
				project.trace (<<"  [echo] Appending '", a_message, "' to file '", a_to_file, "'">>)
				a_file.open_append
			else
				project.trace (<<"  [echo] Writing '", a_message, "' to file '", a_to_file, "'">>)
				a_file.open_write
			end
			if a_file.is_open_write then
				a_file.put_line (a_message)
				a_file.close
				exit_code := 0
			else
				project.log (<<"  [echo] error: cannot write to file", a_to_file, "'">>)
				exit_code := 1
			end
		end


feature {NONE} -- Implementation

	is_not_executable_agent: PROCEDURE [ANY, TUPLE]
			-- Agent called when command is not executable

	execute_with_agents (a_message_only_agent: like message_only_agent; a_message_with_file_agent: like message_with_file_agent) is
			-- Execute command.
		local
			a_message: STRING
			a_to_file: STRING
			a_append: BOOLEAN
		do
			if message_property.is_defined then
	  			a_message := message_property.value
				if to_file_property.is_defined then
		  			a_to_file := to_file_property.value
					if a_message_with_file_agent /= Void then
						if append_property.is_defined then
			  				a_append := append_property.value
							a_message_with_file_agent.call ([a_message, a_to_file, a_append])
						else
							a_message_with_file_agent.call ([a_message, a_to_file, False])
						end
					end
				else
					if a_message_only_agent /= Void then
						a_message_only_agent.call ([a_message])
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
