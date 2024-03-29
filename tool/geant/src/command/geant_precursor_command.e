﻿note

	description:

		"Precursor commands"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2002-2018, Sven Ehrke and others"
	license: "MIT License"

class GEANT_PRECURSOR_COMMAND

inherit

	GEANT_COMMAND
		redefine
			make
		end

create

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT)
			-- Initialize command by setting `project' to `a_project'.
		do
			precursor (a_project)
				-- Create actual arguments:
			create arguments.make
		ensure then
			arguments_not_void: arguments /= Void
		end

feature -- Status report

	is_executable: BOOLEAN
			-- Can command be executed?
		do
			if attached project.current_target as l_current_target then
				Result := l_current_target.precursor_target /= Void
				if not Result then
					project.log (<<"  [precursor] error: precursor does not exist.">>)
				end
			end
		ensure then
			precursor_not_void: Result implies attached project.current_target as l_current_target and then l_current_target.precursor_target /= Void
		end

feature -- Access

	parent: detachable STRING
			-- Parent on which precursor command should be applied

	arguments: GEANT_ARGUMENT_VARIABLES
			-- Actual arguments

feature -- Setting

	set_parent (a_parent: like parent)
			-- Set `parent' to `a_parent'.
		require
			a_parent_not_void: a_parent /= Void
		do
			parent := a_parent
		ensure
			parent_set: parent = a_parent
		end

feature -- Execution

	execute
			-- Execute command.
		local
			a_precursor_target: detachable GEANT_TARGET
		do
			check is_executable: attached project.current_target as l_current_target then
				a_precursor_target := l_current_target.precursor_target
				if a_precursor_target /= Void then
					arguments := a_precursor_target.prepared_arguments_from_formal_arguments (arguments)
					a_precursor_target.project.execute_target (a_precursor_target, arguments, True, False)
				end
			end
		end

end
