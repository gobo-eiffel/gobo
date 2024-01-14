note

	description:

		"Unset commands"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001-2018, Sven Ehrke and others"
	license: "MIT License"

class GEANT_UNSET_COMMAND

inherit

	GEANT_COMMAND

create

	make

feature -- Status report

	is_executable : BOOLEAN
			-- Can command be executed?
		do
			Result := attached name as l_name and then l_name.count > 0
		ensure then
			name_not_void_and_not_empty: Result implies attached name as l_name and then l_name.count > 0
		end

feature -- Access

	name: detachable STRING
			-- Name of variable

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

feature -- Execution

	execute
			-- Remove variable from project variables pool.
		do
			check is_executable: attached name as l_name then
				if attached project.current_target as l_current_target and then l_current_target.formal_arguments.has (l_name) then
					project.trace (<<"  [unset] name=", l_name >>)
					project.log (<<"  [unset] warning: you can not unset arguments variable (name='", l_name, "')" >>)
				else
					if project.options.verbose then
						if project.is_local_variable (l_name) then
							project.trace (<<"  [unset local] name=", l_name >>)
						else
							project.trace (<<"  [unset global] name=", l_name >>)
						end
					end

					project.unset_variable (l_name)
					exit_code := 0
				end
			end
		end

end
