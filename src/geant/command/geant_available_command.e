indexing

	description:

		"Available commands"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2002, Sven Ehrke and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_AVAILABLE_COMMAND

inherit

	GEANT_FILESYSTEM_COMMAND

create

	make

feature -- Status report

	is_file_executable: BOOLEAN is
			-- Can command be executed on sourcefile `resource_name'?
		do
			Result := resource_name /= Void and then resource_name.count > 0
		ensure
			resource_name_not_void: Result implies resource_name /= Void
			resource_name_not_empty: Result implies resource_name.count > 0
		end

	is_executable: BOOLEAN is
			-- Can command be executed?
		do
			Result := is_file_executable
		ensure then
			file_executable: Result implies is_file_executable
		end

feature -- Access

	resource_name: STRING
			-- Name of resource

	variable_name: STRING
			-- Name of variable to set

	true_value: STRING
			-- Value to be set for variable named `variable_name'
			-- in case `execute' evaluate a value of `True'

	false_value: STRING
			-- Value to be set for variable named `variable_name'
			-- in case `execute' evaluate a value of `False'

feature -- Setting

	set_resource_name (a_resource_name: like resource_name) is
			-- Set `resource_name' to `a_resource_name'.
		require
			a_resource_name_not_void : a_resource_name /= Void
		do
			resource_name := a_resource_name
		ensure
			resource_name_set: resource_name = a_resource_name
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
			a_from_file: STRING
		do
			check is_file_executable: is_file_executable end
			a_from_file := file_system.pathname_from_file_system (resource_name, unix_file_system)

			if file_system.file_exists (a_from_file) or else file_system.directory_exists (a_from_file) then
				project.variables.set_variable_value (variable_name, true_value)
			else
				project.variables.set_variable_value (variable_name, false_value)
			end
		end

end
