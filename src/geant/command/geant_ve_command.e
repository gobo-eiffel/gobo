indexing

	description:

		"Compilation commands for Visual Eiffel"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_VE_COMMAND

inherit

	GEANT_COMMAND

creation

	make

feature -- Status report

	is_executable: BOOLEAN is
			-- Can command be executed?
		do
			Result := (is_compilable and not (is_cleanable or is_tunable)) or
				(is_cleanable and not (is_compilable or is_tunable)) or
				(is_tunable and not (is_compilable or is_cleanable))
		ensure then
			definition: Result = ((is_compilable and not (is_cleanable or is_tunable)) or
				(is_cleanable and not (is_compilable or is_tunable)) or
				(is_tunable and not (is_compilable or is_cleanable)))
		end

	is_compilable: BOOLEAN is
			-- Can system be compiled?
		do
			Result := esd_filename /= Void and then esd_filename.count > 0
		ensure
			esd_filename_not_void: Result implies esd_filename /= Void
			esd_filename_not_empty: Result implies esd_filename.count > 0
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

	clean: STRING
			-- Name of system to be cleaned

	recursive_clean: BOOLEAN
			-- Should clean be run recursively on
			-- subdirectories?

	tuned_system: STRING
			-- Name of system being tuned by 'vetuner'.

	tuning_level: STRING
			-- Tuning level

feature -- Setting

	set_esd_filename (a_filename: like esd_filename) is
			-- Set `esd_filename' to `a_filename'.
		do
			esd_filename := a_filename
		ensure
			esd_filename_set: esd_filename = a_filename
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

feature -- Execution

	execute is
			-- Execute command.
		local
			cmd: STRING
			a_filename: STRING
		do
			exit_code := 0
			if is_compilable then
				cmd := clone ("vec")
				if not project.verbose then
					cmd.append_string (" -no")
				end
				cmd.append_string (" -a:")
				a_filename := file_system.pathname_from_file_system (esd_filename, unix_file_system)
				cmd.append_string (a_filename)
				project.trace ("  [ve] " + cmd + "%N")
				if not project.no_exec then
					file_system.delete_file ("Result.out")
					execute_shell (cmd)
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
					if tuning_level.is_equal ("large") then
						cmd := "vetuner -c -zone_1_reserved=67108864 %
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
							%-zone_12_committed=8192 " + tuned_system
						project.trace ("  [ve] " + cmd + "%N")
						execute_shell (cmd)
					elseif tuning_level.is_equal ("huge") then
						cmd := "vetuner -c -zone_1_reserved=134217728 %
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
							%-zone_12_committed=16384 " + tuned_system
						project.trace ("  [ve] " + cmd + "%N")
						execute_shell (cmd)
					else
						exit_code := 1
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
		do
			old_cwd := file_system.cwd
			if file_system.directory_exists ("eCluster") then
					-- Execute the command only if the Visual Eiffel
					-- compiler has been used to compile this system.
				cmd := clone ("vec -dc -y -no")
				if recursive_clean then
					project.trace ("  [ve] [" + old_cwd + "] " + cmd + "%N")
				else
					project.trace ("  [ve] " + cmd + "%N")
				end
				execute_shell (cmd)
				exit_code := 0
			end
			if file_system.file_exists ("Result.out") then
				if recursive_clean then
					project.trace ("  [ve] [" + old_cwd + "] delete Result.out%N")
				else
					project.trace ("  [ve] delete Result.out%N")
				end
				if not project.no_exec then
					file_system.delete_file ("Result.out")
				end
			end
			if file_system.file_exists ("vec.xcp") then
				if recursive_clean then
					project.trace ("  [ve] [" + old_cwd + "] delete vec.xcp%N")
				else
					project.trace ("  [ve] delete vec.xcp%N")
				end
				if not project.no_exec then
					file_system.delete_file ("vec.xcp")
				end
			end
			if recursive_clean then
				!! a_dir.make (old_cwd)
				a_dir.open_read
				if a_dir.is_open_read then
					from a_dir.read_entry until a_dir.end_of_input loop
						a_name := a_dir.last_entry
						if
							not a_name.is_equal (file_system.relative_current_directory) and
							not a_name.is_equal (file_system.relative_parent_directory)
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

end -- class GEANT_VE_COMMAND
