indexing

	description:

		"Precursor commands"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2002, Sven Ehrke and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_PRECURSOR_COMMAND

inherit

	GEANT_COMMAND

creation

	make

feature -- Status report

	is_executable: BOOLEAN is
			-- Can command be executed?
		do
			check current_target_not_void: project.current_target /= Void end
			Result := project.current_target.precursor_target /= Void
			if not Result then
				project.log (<<"  [precursor] error: precursor does not exist.">>)
			end
		ensure then
			precursor_not_void: Result implies project.current_target.precursor_target /= Void
		end

feature -- Access

	parent: STRING
			-- Parent on which precursor command should be applied

feature -- Setting

	set_parent (a_parent: like parent) is
			-- Set `parent' to `a_parent'.
		require
			a_parent_not_void: a_parent /= Void
		do
			parent := a_parent
		ensure
			parent_set: parent = a_parent
		end

feature -- Execution

	execute is
			-- Execute command.
		do
			project.execute_target (project.current_target.precursor_target, True, False)
		end

end
