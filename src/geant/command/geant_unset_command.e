indexing

	description:

		"Unset commands"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_UNSET_COMMAND

inherit

	GEANT_COMMAND

create

	make

feature -- Status report

	is_executable : BOOLEAN is
			-- Can command be executed?
		do
			Result := name /= Void and then name.count > 0
		ensure then
			name_not_void: Result implies name /= Void
			name_not_empty: Result implies name.count > 0
		end

feature -- Access

	name: STRING
			-- Name of variable

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

feature -- Execution

	execute is
			-- Remove variable from project variables pool.
		do
			if project.current_target.formal_arguments.has (name) then
				project.trace (<<"  [unset] name=", name >>)
				project.log (<<"  [unset] warning: you can not unset arguments variable (name='", name, "')" >>)
			else
				if project.options.verbose then
					if project.is_local_variable (name) then
						project.trace (<<"  [unset local] name=", name >>)
					else
						project.trace (<<"  [unset global] name=", name >>)
					end
				end

				project.unset_variable (name)
				exit_code := 0
			end
		end

end
