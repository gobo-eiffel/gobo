indexing

	description:

		"Out of date commands"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class GEANT_OUTOFDATE_COMMAND

inherit

	KL_SHARED_FILE_SYSTEM
	GEANT_COMMAND
		redefine
			make
		end

creation

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT) is
			-- Create a new 'outofdate' command.
		do
			precursor (a_project)
			!! source_filenames.make (10)
		end

feature -- Status report

	is_executable: BOOLEAN is
			-- Can command be executed?
		do
			Result := (target_filename /= Void and then target_filename.count > 0)
		ensure then
			target_filename_not_void: Result implies target_filename /= Void
			target_filename_not_empty: Result implies target_filename.count > 0
		end

feature -- Access

	source_filenames: DS_ARRAYED_LIST [STRING]
			-- Source filesnames

	target_filename: STRING
			-- Output filename

	is_out_of_date: BOOLEAN
			-- Is an filesystem entry in `source_filenames' newer than
			-- the one named `target_filename';
			-- available after `execute' has been processed

	variable_name: STRING
			-- Name of variable to set

	true_value: STRING
			-- Value to be set for variable named `variable_name'
			-- in case `is_out_of_date' is evaluated to `True'

	false_value: STRING
			-- Value to be set for variable named `variable_name'
			-- in case `is_out_of_date' is evaluated to `False'

feature -- Setting

	set_target_filename (a_filename: like target_filename) is
			-- Set `target_filename' to `a_filename'.
		require
			a_filename_not_void : a_filename /= Void
			a_filename_not_empty: a_filename.count > 0
		do
			target_filename := a_filename
		ensure
			target_filename_set: target_filename = a_filename
		end

	set_variable_name (a_variable_name: like variable_name) is
			-- Set `variable_name' to `a_variable_name'.
		require
			a_variable_name_not_void : a_variable_name /= Void
			a_variable_name_not_empty: a_variable_name.count > 0
		do
			variable_name := a_variable_name
		ensure
			variable_name_set: variable_name = a_variable_name
		end

	set_true_value (a_true_value: like true_value) is
			-- Set `true_value' to `a_true_value'.
		require
			a_true_value_not_void : a_true_value /= Void
			a_true_value_not_empty: a_true_value.count > 0
		do
			true_value := a_true_value
		ensure
			true_value_set: true_value = a_true_value
		end

	set_false_value (a_false_value: like false_value) is
			-- Set `false_value' to `a_false_value'.
		require
			a_false_value_not_void : a_false_value /= Void
			a_false_value_not_empty: a_false_value.count > 0
		do
			false_value := a_false_value
		ensure
			false_value_set: false_value = a_false_value
		end

feature -- Execution

	execute is
			-- Execute command.
		local
			i, nb: INTEGER
			a_source_file: KI_FILE
			a_target_file: KI_FILE
			a_source_time: INTEGER
			a_target_time: INTEGER
			a_set_command: GEANT_SET_COMMAND
			a_old_verbose: BOOLEAN
			a_name: STRING
		do
			! KL_TEXT_INPUT_FILE ! a_target_file.make (target_filename)

			a_target_time := a_target_file.time_stamp

				-- Check timestamps:
			nb := source_filenames.count
			from i := 1 until i > nb or else is_out_of_date or else exit_code /= 0 loop
				a_name := file_system.pathname_from_file_system (source_filenames.item (i), unix_file_system)
				! KL_TEXT_INPUT_FILE ! a_source_file.make (a_name)
				a_source_time := a_source_file.time_stamp
				if a_source_time = -1 then
					log ("  [outofdate] error: '" + a_name + "'  not accessible.%N")
					exit_code := 1
				end
				is_out_of_date := (a_target_time < a_source_time)

				i := i + 1
			end
			if exit_code = 0 then
				!! a_set_command.make (project)
				a_set_command.set_name (variable_name)
				a_old_verbose := project.verbose
				project.set_verbose (False)
				if is_out_of_date then
					a_set_command.set_value (true_value)
				else
					a_set_command.set_value (false_value)
				end
				a_set_command.execute
				project.set_verbose (a_old_verbose)
			end
		end

invariant

	source_filenames_not_void: source_filenames /= Void
	no_void_source_filename: not source_filenames.has (Void)

end -- class GEANT_OUTOFDATE_COMMAND

