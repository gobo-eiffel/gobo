note

	description:

		"Exec commands"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001-2018, Sven Ehrke and others"
	license: "MIT License"

class GEANT_EXEC_COMMAND

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
			create command_line.make
			create exit_code_variable_name.make
			create accept_errors.make
		end

feature -- Status report

	is_executable: BOOLEAN
			-- Can command be executed?
		local
			a_is_valid: DS_CELL [BOOLEAN]
		do
			create a_is_valid.make (True)
			validate_condition (command_line.is_defined, "  [echo] error: 'executable' is not defined", a_is_valid)
			if a_is_valid.item then
				validate_condition (not command_line.value.is_empty, "  [echo] error: 'executable' is empty", a_is_valid)
			end
			if a_is_valid.item then
				if fileset = Void then
					single_execution_mode := True
					if exit_code_variable_name.is_defined then
						validate_condition (not exit_code_variable_name.value.is_empty, "  [echo] error: 'exit_code_variable' may not be empty", a_is_valid)
					end
				else
					single_execution_mode := False
					validate_condition (not exit_code_variable_name.is_defined,
						"  [echo] error: 'exit_code_variable' may not be defined together with 'fileset'", a_is_valid)
				end
			end
			Result := a_is_valid.item
		ensure then
			command_line_defined: Result implies command_line.is_defined
			command_line_not_empty: Result implies not command_line.value.is_empty
			single_xor_fileset_mode: Result implies (fileset /= Void and then not exit_code_variable_name.is_defined) xor
				(fileset = Void and then (not exit_code_variable_name.is_defined or else not exit_code_variable_name.value.is_empty))
		end

feature -- Access

	command_line: GEANT_STRING_PROPERTY
			-- Command-line

	exit_code_variable_name: GEANT_STRING_PROPERTY
			-- Name of variable holding exit code of called process

	accept_errors: GEANT_BOOLEAN_PROPERTY
			-- Should return codes of called process other than zero be accepted?

	fileset: detachable GEANT_FILESET
		-- Fileset for current command

feature -- Setting

	set_fileset (a_fileset: attached like fileset)
			-- Set `fileset' to `a_fileset'.
		require
			a_fileset_not_void: a_fileset /= Void
		do
			fileset := a_fileset
			a_fileset.set_convert_to_filesystem (True)
		ensure
			fileset_set: fileset = a_fileset
			fileset_convert_to_filesystem_set: a_fileset.convert_to_filesystem
		end

feature -- Execution

	execute
			-- Execute command.
		local
			s: STRING
			a_string_interpreter: GEANT_STRING_INTERPRETER
			a_accept_errors: BOOLEAN
		do
			if single_execution_mode then
				project.trace (<<"  [exec] ", command_line.value>>)
				execute_shell (command_line.value)

				if exit_code_variable_name /= Void and then exit_code_variable_name.is_defined then
						-- Store return_code of process:
					project.set_variable_value (exit_code_variable_name.value, exit_code.out)
						-- Reset `exit_code' since return_code of process is available through
						-- variable 'exit_code_variable_name':
					exit_code := 0
				end
					-- TODO: remove after obsolete period:
				a_accept_errors := accept_errors.non_empty_value_or_else (False)
				if a_accept_errors then
					exit_code := 0
				end
			else
				if not attached fileset as l_fileset or else not l_fileset.is_executable then
					project.log (<<"  [exec] error: fileset definition wrong">>)
					exit_code := 1
				else

					if exit_code = 0 then
						create a_string_interpreter.make
						Project_variables_resolver.set_variables (project.variables)
						a_string_interpreter.set_variable_resolver (Project_variables_resolver)

						l_fileset.execute
						from
							l_fileset.start
						until
							l_fileset.after or else exit_code /= 0
						loop
							s := a_string_interpreter.interpreted_string (command_line.value)
							project.trace (<<"  [exec] ", s>>)
							execute_shell (s)
							a_accept_errors := accept_errors.non_empty_value_or_else (False)
							if a_accept_errors then
								exit_code := 0
							end
							l_fileset.forth
						end
					end
				end
			end


		end

	single_execution_mode: BOOLEAN
			-- Should only a single command be executed?
			-- (If False each command defined through 'fileset' will be executed)


end
