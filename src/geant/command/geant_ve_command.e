indexing

	description:

		"Compilation commands for Visual Eiffel"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_VE_COMMAND

inherit

	GEANT_COMMAND

create

	make

feature -- Status report

	is_executable: BOOLEAN is
			-- Can command be executed?
		do
			Result := (is_compilable and not (is_cleanable or is_tunable)) or
				(is_cleanable and not (is_compilable or is_tunable)) or
				(is_tunable and not (is_compilable or is_cleanable))
			Result := Result and then (exit_code_variable_name = Void or else exit_code_variable_name.count > 0)
		ensure then
			definition: Result = ((is_compilable and not (is_cleanable or is_tunable)) or
				(is_cleanable and not (is_compilable or is_tunable)) or
				(is_tunable and not (is_compilable or is_cleanable)))
			exit_code_variable_name_void_or_not_empty: Result implies (exit_code_variable_name = Void or else exit_code_variable_name.count > 0)
		end

	is_compilable: BOOLEAN is
			-- Can system be compiled?
		do
			Result := (esd_filename /= Void and then esd_filename.count > 0) or
				(xace_filename /= Void and then xace_filename.count > 0)
		ensure
			esd_or_xace_filename_not_void: Result implies esd_filename /= Void or xace_filename /= Void
			esd_filename_not_empty: esd_filename /= Void implies esd_filename.count > 0
			xace_filename_not_empty: xace_filename /= Void implies xace_filename.count > 0
		end

	is_cleanable: BOOLEAN is
			-- Can system be cleaned?
		do
			Result := clean /= Void and then clean.count > 0
		ensure
			clean_not_void: Result implies clean /= Void
			clean_not_empty: Result implies clean.count > 0
		end

	is_tunable: BOOLEAN is
			-- Can system be tuned?
		do
			Result := tuned_system /= Void and then tuned_system.count > 0
		ensure
			tuned_system_not_void: Result implies tuned_system /= Void
			tuned_system_not_empty: Result implies tuned_system.count > 0
		end

feature -- Access

	esd_filename: STRING
			-- ESD filename

	xace_filename: STRING
			-- Xace filename

	clean: STRING
			-- Name of system to be cleaned

	recursive_clean: BOOLEAN
			-- Should clean be run recursively on
			-- subdirectories?

	tuned_system: STRING
			-- Name of system being tuned by 'vetuner'.

	tuning_level: STRING
			-- Tuning level

	exit_code_variable_name: STRING
			-- Name of variable holding exit code of se compilation process

feature -- Setting

	set_esd_filename (a_filename: like esd_filename) is
			-- Set `esd_filename' to `a_filename'.
		do
			esd_filename := a_filename
		ensure
			esd_filename_set: esd_filename = a_filename
		end

	set_xace_filename (a_filename: like xace_filename) is
			-- Set `xace_filename' to `a_filename'.
		do
			xace_filename := a_filename
		ensure
			xace_filename_set: xace_filename = a_filename
		end

	set_clean (a_clean: like clean) is
			-- Set `clean' to `a_clean'.
		do
			clean := a_clean
		ensure
			clean_set: clean = a_clean
		end

	set_recursive_clean (b: BOOLEAN) is
			-- Set `recursive_clean' to `b'.
		do
			recursive_clean := b
		ensure
			recursive_clean_set: recursive_clean = b
		end

	set_tuned_system (a_tuned_system: like tuned_system) is
			-- Set `tuned_system' to `a_tuned_system'.
		do
			tuned_system := a_tuned_system
		ensure
			tuned_system_set: tuned_system = a_tuned_system
		end

	set_tuning_level (a_tuning_level: like tuning_level) is
			-- Set `tuning_level' to `a_tuning_level'.
		do
			tuning_level := a_tuning_level
		ensure
			tuning_level_set: tuning_level = a_tuning_level
		end

	set_exit_code_variable_name (a_exit_code_variable_name: like exit_code_variable_name) is
			-- Set `exit_code_variable_name' to `a_exit_code_variable_name'.
		require
			a_exit_code_variable_name_not_void: a_exit_code_variable_name /= Void
			a_exit_code_variable_name_not_empty: a_exit_code_variable_name.count > 0
		do
			exit_code_variable_name := a_exit_code_variable_name
		ensure
			exit_code_variable_name_set: exit_code_variable_name = a_exit_code_variable_name
		end

feature -- Execution

	execute is
			-- Execute command.
		local
			cmd: STRING
			a_filename: STRING
		do
			exit_code := 0
			if is_compilable then
				create cmd.make (128)
				cmd.append_string ("vec")
				if not project.options.verbose then
					cmd.append_string (" -no")
				end
				cmd.append_string (" -a:")
				if esd_filename /= Void then
					a_filename := file_system.pathname_from_file_system (esd_filename, unix_file_system)
				else
					a_filename := file_system.pathname_from_file_system (xace_filename, unix_file_system)
				end
				cmd := STRING_.appended_string (cmd, a_filename)
				project.trace (<<"  [ve] ", cmd>>)
				if not project.options.no_exec then
					file_system.delete_file ("Result.out")
					execute_shell (cmd)
					if exit_code_variable_name /= Void then
							-- Store return_code of compilation process:
						project.variables.set_variable_value (exit_code_variable_name, exit_code.out)
							-- Reset `exit_code' since return_code of process is available through
							-- variable 'exit_code_variable_name':
						exit_code := 0
					end
				end
			elseif is_tunable then
				execute_tuner
			else
				check is_cleanable: is_cleanable end
				execute_clean
			end
		end

	execute_tuner is
			-- Tune system.
		require
			is_tunable: is_tunable
		local
			cmd: STRING
		do
			if operating_system.is_windows then
				if tuning_level /= Void then
					if STRING_.same_string (tuning_level, "large") then
						cmd := STRING_.concat ("vetuner -c -zone_1_reserved=67108864 %
							%-zone_2_reserved=67108864 -zone_3_reserved=67108864 %
							%-zone_4_reserved=67108864 -zone_5_reserved=67108864 %
							%-zone_6_reserved=67108864 -zone_7_reserved=67108864 %
							%-zone_8_reserved=67108864 -zone_9_reserved=67108864 %
							%-zone_10_reserved=67108864 -zone_11_reserved=134217728 %
							%-zone_12_reserved=67108864 -zone_1_committed=8192 %
							%-zone_2_committed=8192 -zone_3_committed=8192 %
							%-zone_4_committed=8192 -zone_5_committed=8192 %
							%-zone_6_committed=8192 -zone_7_committed=8192 %
							%-zone_8_committed=8192 -zone_9_committed=8192 %
							%-zone_10_committed=8192 -zone_11_committed=65536 %
							%-zone_12_committed=8192 ", tuned_system)
						project.trace (<<"  [ve] ", cmd>>)
						execute_shell (cmd)
					elseif STRING_.same_string (tuning_level, "huge") then
						cmd := STRING_.concat ("vetuner -c -zone_1_reserved=134217728 %
							%-zone_2_reserved=134217728 -zone_3_reserved=134217728 %
							%-zone_4_reserved=134217728 -zone_5_reserved=134217728 %
							%-zone_6_reserved=134217728 -zone_7_reserved=134217728 %
							%-zone_8_reserved=134217728 -zone_9_reserved=134217728 %
							%-zone_10_reserved=134217728 -zone_11_reserved=300000000 %
							%-zone_12_reserved=134217728 -zone_1_committed=16384 %
							%-zone_2_committed=16384 -zone_3_committed=16384 %
							%-zone_4_committed=16384 -zone_5_committed=16384 %
							%-zone_6_committed=16384 -zone_7_committed=16384 %
							%-zone_8_committed=16384 -zone_9_committed=16384 %
							%-zone_10_committed=16384 -zone_11_committed=131072 %
							%-zone_12_committed=16384 ", tuned_system)
						project.trace (<<"  [ve] ", cmd>>)
						execute_shell (cmd)
					else
						exit_code := 1
					end
					if exit_code_variable_name /= Void then
							-- Store return_code of compilation process:
						project.variables.set_variable_value (exit_code_variable_name, exit_code.out)
							-- Reset `exit_code' since return_code of process is available through
							-- variable 'exit_code_variable_name':
						exit_code := 0
					end
				end
			end
		end

	execute_clean is
			-- Clean system.
		require
			is_cleanable: is_cleanable
		local
			cmd: STRING
			old_cwd: STRING
			a_name: STRING
			a_dir: KL_DIRECTORY
			i: INTEGER
		do
			old_cwd := file_system.cwd
			if file_system.directory_exists ("eCluster") then
					-- Execute the command only if the Visual Eiffel
					-- compiler has been used to compile this system.
				create cmd.make (128)
				cmd.append_string ("vec -dc -y -no")
				if recursive_clean then
					project.trace (<<"  [ve] [", old_cwd, "] ", cmd>>)
				else
					project.trace (<<"  [ve] ", cmd>>)
				end
				execute_shell (cmd)
				if exit_code_variable_name /= Void then
						-- Store return_code of compilation process:
					project.variables.set_variable_value (exit_code_variable_name, exit_code.out)
				end
				exit_code := 0
			end
			if file_system.file_exists ("Result.out") then
				if recursive_clean then
					project.trace (<<"  [ve] [", old_cwd, "] delete Result.out">>)
				else
					project.trace (<<"  [ve] delete Result.out">>)
				end
				if not project.options.no_exec then
					file_system.delete_file ("Result.out")
				end
			end
			if file_system.file_exists ("vec.xcp") then
				if recursive_clean then
					project.trace (<<"  [ve] [", old_cwd, "] delete vec.xcp">>)
				else
					project.trace (<<"  [ve] delete vec.xcp">>)
				end
				if not project.options.no_exec then
					file_system.delete_file ("vec.xcp")
				end
				from
					i := 0
				until
					not file_system.file_exists ("vec" + i.out + ".xcp")
				loop
					if recursive_clean then
						project.trace (<<"  [ve] [", old_cwd, "] delete vec" + i.out + ".xcp">>)
					else
						project.trace (<<"  [ve] delete vec" + i.out + ".xcp">>)
					end
					if not project.options.no_exec then
						file_system.delete_file ("vec" + i.out + ".xcp")
					end
					i := i + 1
				end
			end
			if recursive_clean then
				create a_dir.make (old_cwd)
				a_dir.open_read
				if a_dir.is_open_read then
					from a_dir.read_entry until a_dir.end_of_input loop
						a_name := a_dir.last_entry
						if
							not STRING_.same_string (a_name, file_system.relative_current_directory) and
							not STRING_.same_string (a_name, file_system.relative_parent_directory)
						then
							if file_system.directory_exists (a_name) then
								file_system.cd (a_name)
								execute_clean
								file_system.cd (old_cwd)
							end
						end
						a_dir.read_entry
					end
					a_dir.close
				end
			end
		end

end
