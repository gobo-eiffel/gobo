note

	description:

		"Set commands"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001-2018, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_SET_COMMAND

inherit

	GEANT_COMMAND

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
			-- Name of variable

	value: detachable STRING
			-- Value of variable

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
				if Default_builtin_variables.has (l_name) then
					project.log (<<"  [set] ",
						"warning: you are using the name of the builtin variable '", l_name, "' in a <set> task" >>)
				end

				if project.options.verbose then
					if project.is_local_variable (l_name) then
						project.trace (<<"  [set local] ", l_name, "=", l_value >>)
					else
						project.trace (<<"  [set global] ", l_name, "=", l_value >>)
					end
				end

				project.set_variable_value (l_name, l_value)
				exit_code := 0
			end
		end

end
