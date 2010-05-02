note

	description:

		"Mkdir commands"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_MKDIR_COMMAND

inherit

	GEANT_COMMAND
 		redefine
 			make
 		end

create

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT)
			-- Initialize command.
		do
			Precursor (a_project)

				-- Create properties:
			create directory.make

				-- Set default agents:
			create mkdir_agent_cell.make (agent create_directory)
		end

feature -- Status report

	is_executable: BOOLEAN
			-- Can command be executed?
		local
			a_is_valid: DS_CELL [BOOLEAN]
		do
			create a_is_valid.make (True)
 			validate_condition (directory.is_defined, "  [mkdir] error: 'directory' is not defined", a_is_valid)
				-- Prevent 'Call on Void target' for `directory.value' by checking `is_valid' first. TODO: find better solution:
  			validate_condition (a_is_valid.item and then not directory.value.is_empty, "  [mkdir] error: 'directory' is empty", a_is_valid)
			Result := a_is_valid.item
 		ensure then
 			directory_defined: Result implies directory.is_defined
 			directory_not_empty: Result implies not directory.value.is_empty
		end

feature -- Access

	directory: GEANT_STRING_PROPERTY
			-- Directory to create

	mkdir_agent_cell: DS_CELL [PROCEDURE [ANY, TUPLE [STRING]]]
			-- Agent cell to create directory

feature -- Execution

	execute
			-- Execute command.
		do
			mkdir_agent_cell.item.call ([directory.value])
		end

feature {NONE} -- Implementation

	create_directory (a_directory_name: STRING)
			-- Create directory named `a_directory'.
		require
			a_directory_name_not_void: a_directory_name /= Void
		local
			a_name: STRING
		do
			exit_code := 0
			a_name := file_system.pathname_from_file_system (a_directory_name, unix_file_system)
			project.trace (<<"  [mkdir] ", a_name>>)
			if not project.options.no_exec then
				file_system.recursive_create_directory (a_name)
				if not file_system.directory_exists (a_name) then
					project.log (<<"  [mkdir] error: cannot create directory '", a_name, "%'">>)
					exit_code := 1
				end
			end
		end

invariant

	directory_not_void: directory /= Void
	mkdir_agent_cell_not_void: mkdir_agent_cell /= Void
	mkdir_agent_cell_item_not_void: mkdir_agent_cell.item /= Void

end
