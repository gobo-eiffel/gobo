indexing

	description:

		"Setenv commands"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_SETENV_COMMAND

inherit

	GEANT_COMMAND
	KL_SHARED_EXECUTION_ENVIRONMENT

creation

	make

feature -- Status report

	is_executable : BOOLEAN is
			-- Can command be executed?
		do
			Result := (name /= Void and then name.count > 0) and value /= Void
		ensure then
			name_not_void: Result implies name /= Void
			name_not_empty: Result implies name.count > 0
			value_not_void: Result implies value /= Void
		end

feature -- Access

	name: STRING
			-- Name of environment variable

	value: STRING
			-- Value of environment variable

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

feature -- Execution

	execute is
			-- Put variable in project variables pool.
		do
			Execution_environment.set_variable_value (name, value)
			log ("  [setenv] " + name + "=" + value + "%N")
		end

end -- class GEANT_SETENV_COMMAND
