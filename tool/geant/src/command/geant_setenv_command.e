note

	description:

		"Setenv commands"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001-2018, Sven Ehrke and others"
	license: "MIT License"

class GEANT_SETENV_COMMAND

inherit

	GEANT_COMMAND

	KL_SHARED_EXECUTION_ENVIRONMENT
		export {NONE} all end

create

	make

feature -- Status report

	is_executable : BOOLEAN
			-- Can command be executed?
		do
			Result := (attached name as l_name and then l_name.count > 0) and value /= Void
		ensure then
			name_not_void_and_not_empty: Result implies attached name as l_name and then l_name.count > 0
			value_not_void: Result implies value /= Void
		end

feature -- Access

	name: detachable STRING
			-- Name of environment variable

	value: detachable STRING
			-- Value of environment variable

feature -- Setting

	set_name (a_name: like name)
			-- Set `name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		do
			name := a_name
		ensure
			name_set: name = a_name
		end

	set_value (a_value: like value)
			-- Set `value' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		do
			value := a_value
		ensure
			value_set: value = a_value
		end

feature -- Execution

	execute
			-- Put variable in project variables pool.
		do
			check is_executable: attached name as l_name and attached value as l_value then
				project.trace (<<"  [setenv] ", l_name, "=", l_value>>)
				if not project.options.no_exec then
					Execution_environment.set_variable_value (l_name, l_value)
				end
				exit_code := 0
			end
		end

end
