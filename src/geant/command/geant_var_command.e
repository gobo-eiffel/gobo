indexing

	description:

		"Global variables commands"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_VAR_COMMAND

inherit

	GEANT_COMMAND

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create a new 'var' command.
		do
		end

feature -- Status report

	is_executable : BOOLEAN is
			-- Can command be executed?
		do
			Result := (name /= Void and then name.count > 0)
				and value /= Void and project_variables /= Void
		ensure then
			name_not_void: Result implies name /= Void
			name_not_empty: Result implies name.count > 0
			value_not_void: Result implies value /= Void
			project_variables_not_void: Result implies project_variables /= Void
		end

feature -- Access

	name: STRING
			-- Name of variable

	value: STRING
			-- Value of variable

	project_variables: GEANT_VARIABLES
			-- Project variables

feature -- Setting

	set_name (a_name: like name) is
			-- Set `name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		do
			name := a_name
		ensure
			name_set: name = a_name
		end

	set_value (a_value: like value) is
			-- Set `value' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		do
			value := a_value
		ensure
			value_set: value = a_value
		end

	set_project_variables (a_project_variables: like project_variables) is
			-- Set `project_variables' to `a_project_variables'.
		require
			a_project_variables_not_void: a_project_variables /= Void
		do
			project_variables := a_project_variables
		ensure
			project_variables_set: project_variables = a_project_variables
		end

feature -- Execution

	execute is
			-- Put variable in project variables pool.
		do
			project_variables.set_variable_value (name, value)
--			log ("  [var] " + name + "=" + value + ", " + project_variables.variable_value (name) + "%N")
		end

end -- class GEANT_VAR_COMMAND
