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
			!DS_HASH_SET [STRING]! source_filenames.make (10)
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

	source_filenames: DS_SET [STRING]
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


	set_source_filenames (a_source_filenames: like source_filenames) is
			-- Set `source_filenames' to `a_filename'.
		require
			a_source_filenames_not_void : a_source_filenames /= Void
		do
			source_filenames := a_source_filenames
		ensure
			source_filenames_set: source_filenames = a_source_filenames
		end

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
			a_source_time: INTEGER
			a_target_time: INTEGER
			a_name: STRING
			a_done: BOOLEAN
		do
			exit_code := 0
			a_name := file_system.pathname_from_file_system (target_filename, unix_file_system)
			a_target_time := file_system.file_time_stamp (a_name)
				-- Check timestamps:
			from
				source_filenames.start
			until
				source_filenames.after or else exit_code /= 0 or else a_done
			loop
				a_name := file_system.pathname_from_file_system (source_filenames.item_for_iteration, unix_file_system)
				project.trace_debug ("[outofdate] filename: " + a_name + "%N")
				a_source_time := file_system.file_time_stamp (a_name)
				if a_source_time = -1 then
					project.log ("  [outofdate] error: '" + a_name + "'  not accessible.%N")
					exit_code := 1
				elseif a_target_time < a_source_time then
					is_out_of_date := True
					a_done := True
				end
				source_filenames.forth
			end

			if exit_code = 0 then
				if is_out_of_date then
					project.variables.set_variable_value (variable_name, true_value)
				else
					project.variables.set_variable_value (variable_name, false_value)
				end
			end
		end

invariant

	source_filenames_not_void: source_filenames /= Void
	no_void_source_filename: not source_filenames.has (Void)

end -- class GEANT_OUTOFDATE_COMMAND

