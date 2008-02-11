indexing

	description:

		"Exec commands"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_EXEC_COMMAND

inherit

	GEANT_COMMAND

create

	make

feature -- Status report

	is_commandline_executable: BOOLEAN is
			-- Can command be executed with `command_line'?
		do
			Result := command_line /= Void and then command_line.count > 0
			Result := Result and then fileset = Void
			Result := Result and then (exit_code_variable_name = Void or else exit_code_variable_name.count > 0)
		ensure
			command_line_not_void: Result implies command_line /= Void
			command_line_not_empty: Result implies command_line.count > 0
			fileset_void: Result implies fileset = Void
			exit_code_variable_name_void_or_not_empty: Result implies (exit_code_variable_name = Void or else exit_code_variable_name.count > 0)
		end

	is_fileset_executable: BOOLEAN is
			-- Can command be executed on source fileset `fileset'?
		do
			Result := command_line /= Void and then command_line.count > 0
			Result := Result and then fileset /= Void
			Result := Result and then exit_code_variable_name = Void
		ensure
			command_line_not_void: Result implies command_line /= Void
			command_line_not_empty: Result implies command_line.count > 0
			fileset_not_void: Result implies fileset /= Void
			exit_code_variable_name_void: Result implies exit_code_variable_name = Void
		end

	is_executable: BOOLEAN is
			-- Can command be executed?
		do
			Result := is_commandline_executable xor is_fileset_executable
		ensure then
			commandline_executable_xor_is_fileset_executable:
				Result implies is_commandline_executable xor is_fileset_executable
		end

feature -- Access

	command_line: STRING
			-- Command-line

	exit_code_variable_name: STRING
			-- Name of variable holding exit code of called process

	accept_errors: BOOLEAN
			-- Should return codes of called process other than zero be accepted?

	fileset: GEANT_FILESET
		-- Fileset for current command

feature -- Setting

	set_exit_code_variable_name (a_exit_code_variable_name: like exit_code_variable_name) is
			-- Set `exit_code_variable_name' to `a_exit_code_variable_name'.
		require
			a_exit_code_variable_name_not_void: a_exit_code_variable_name /= Void
			a_exit_code_variable_name_not_empty: a_exit_code_variable_name.count > 0
		do
			exit_code_variable_name := a_exit_code_variable_name
		ensure
			exit_code_set: exit_code_variable_name = a_exit_code_variable_name
		end

	set_command_line (a_command_line: like command_line) is
			-- Set `command_line' to `a_command_line'.
		require
			a_command_line_not_void: a_command_line /= Void
			a_command_line_not_empty: a_command_line.count > 0
		do
			command_line := a_command_line
		ensure
			command_line_set: command_line = a_command_line
		end

	set_accept_errors (b: BOOLEAN) is
			-- Set `accept_errors' to `b'.
		do
			accept_errors := b
		ensure
			accept_errors_set: accept_errors = b
		end

	set_fileset (a_fileset: like fileset) is
			-- Set `fileset' to `a_fileset'.
		require
			a_fileset_not_void: a_fileset /= Void
		do
			fileset := a_fileset
			fileset.set_convert_to_filesystem (True)
		ensure
			fileset_set: fileset = a_fileset
			fileset_convert_to_filesystem_set: fileset.convert_to_filesystem
		end

feature -- Execution

	execute is
			-- Execute command.
		local
			s: STRING
			a_string_interpreter: GEANT_STRING_INTERPRETER
		do
			if is_commandline_executable then
				project.trace (<<"  [exec] ", command_line>>)
				execute_shell (command_line)

				if exit_code_variable_name /= Void then
						-- Store return_code of process:
					project.set_variable_value (exit_code_variable_name, exit_code.out)
						-- Reset `exit_code' since return_code of process is available through
						-- variable 'exit_code_variable_name':
					exit_code := 0
				end
					-- TODO: remove after obsolete period:
				if accept_errors then
					exit_code := 0
				end
			else
				check is_fileset_executable: is_fileset_executable end

				if not fileset.is_executable then
					project.log (<<"  [exec] error: fileset definition wrong">>)
					exit_code := 1
				end

				if exit_code = 0 then
					create a_string_interpreter.make
					Project_variables_resolver.set_variables (project.variables)
					a_string_interpreter.set_variable_resolver (Project_variables_resolver)

					fileset.execute
					from
						fileset.start
					until
						fileset.after or else exit_code /= 0
					loop
						s := a_string_interpreter.interpreted_string (command_line)
						project.trace (<<"  [exec] ", s>>)
						execute_shell (s)
						if accept_errors then
							exit_code := 0
						end
						fileset.forth
					end
				end
			end


		end

end
