indexing

	description:

		"Out of date commands"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_OUTOFDATE_COMMAND

inherit

	GEANT_FILESYSTEM_COMMAND

create

	make

feature -- Status report

	is_file_executable: BOOLEAN is
			-- Can command be executed on sourcefile `source_filename' to targetfile `target_filename'?
		do
			Result := source_filename /= Void and then source_filename.count > 0
			Result := Result and then target_filename /= Void and then target_filename.count > 0
			Result := Result and then fileset = Void
		ensure
			source_filename_not_void: Result implies source_filename /= Void
			source_filename_not_empty: Result implies source_filename.count > 0
			target_filename_not_void: Result implies target_filename /= Void
			target_filename_not_empty: Result implies target_filename.count > 0
			fileset_void: Result implies fileset = Void
		end

	is_fileset_executable: BOOLEAN is
			-- Can command be executed on `fileset' as input to target defined by `fileset.map'?
		do
			Result := source_filename = Void
			Result := Result and then target_filename = Void
			Result := Result and then fileset /= Void and then fileset.is_executable
		ensure
			fileset_not_void: Result implies fileset /= Void
			fileset_executable: Result implies fileset.is_executable
			source_filename_void: Result implies source_filename = Void
			target_filename_void: Result implies target_filename = Void
		end

	is_executable: BOOLEAN is
			-- Can command be executed?
		do
			Result := is_file_executable xor is_fileset_executable
		ensure then
			file_xor_fileset: Result implies is_file_executable xor is_fileset_executable
		end

feature -- Access

	source_filename: STRING
			-- Source filesname

	target_filename: STRING
			-- Output filename

	is_out_of_date: BOOLEAN
			-- Is a file named `source_filename' newer than
			-- the one named `target_filename'?;
			-- available after `execute' has been processed

	variable_name: STRING
			-- Name of variable to set

	true_value: STRING
			-- Value to be set for variable named `variable_name'
			-- in case `is_out_of_date' is evaluated to `True'

	false_value: STRING
			-- Value to be set for variable named `variable_name'
			-- in case `is_out_of_date' is evaluated to `False'

	fileset: GEANT_FILESET
			-- Fileset for current command

feature -- Setting

	set_source_filename (a_source_filename: like source_filename) is
			-- Set `source_filename' to `a_source_filename'.
		require
			a_source_filename_not_void : a_source_filename /= Void
		do
			source_filename := a_source_filename
		ensure
			source_filename_set: source_filename = a_source_filename
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

	set_fileset (a_fileset: like fileset) is
			-- Set `fileset' to `a_fileset'.
		require
			a_fileset_not_void: a_fileset /= Void
		do
			fileset := a_fileset
		ensure
			fileset_set: fileset = a_fileset
		end

feature -- Execution

	execute is
			-- Execute command.
		local
			a_from_file: STRING
			a_to_file: STRING
		do
			if is_file_executable then
				a_from_file := file_system.pathname_from_file_system (source_filename, unix_file_system)
				if not file_system.file_exists (a_from_file) then
					project.log (<<"  [outofdate] error: cannot find source file '", a_from_file, "%'">>)
					exit_code := 1
				end
				if exit_code = 0 then
					a_to_file := file_system.pathname_from_file_system (target_filename, unix_file_system)
					is_out_of_date := is_file_outofdate (a_from_file, a_to_file)
					if is_out_of_date then
						project.variables.set_variable_value (variable_name, true_value)
					else
						project.variables.set_variable_value (variable_name, false_value)
					end
				end
			else
				check is_fileset_executable: is_fileset_executable end
				if not fileset.is_executable then
					project.log (<<"  [outofdate] error: fileset definition wrong">>)
					exit_code := 1
				end
				if exit_code = 0 then
					fileset.execute
					from
						fileset.start
					until
						is_out_of_date or else fileset.after or else exit_code /= 0
					loop
						a_from_file := file_system.pathname_from_file_system (fileset.item_filename, unix_file_system)
						if not file_system.file_exists (a_from_file) then
							project.log (<<"  [outofdate] error: cannot find source file '", a_from_file, "%'">>)
							exit_code := 1
						end
						if exit_code = 0 then
							a_to_file := file_system.pathname_from_file_system (fileset.item_mapped_filename, unix_file_system)
							is_out_of_date := is_file_outofdate (a_from_file, a_to_file)
						end
						fileset.forth
					end
					if is_out_of_date then
						project.variables.set_variable_value (variable_name, true_value)
					else
						project.variables.set_variable_value (variable_name, false_value)
					end
				end
			end
		end

end
