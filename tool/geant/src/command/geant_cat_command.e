note

	description:

		"Cat commands"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_CAT_COMMAND

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
			create file_property.make
			create to_file_property.make
			create append_property.make

				-- Set default agents:
			create cat_only_agent_cell.make (agent write_file)
			create cat_with_file_agent_cell.make (agent write_file_to_file)
		end

feature -- Status report

	is_executable: BOOLEAN
			-- Can command be executed?
		local
			a_is_valid: DS_CELL [BOOLEAN]
		do
			create a_is_valid.make (True)
			validate_condition (file_property.is_defined, "  [cat] error: 'file' is not defined", a_is_valid)
			if a_is_valid.item then
				if to_file_property.is_defined then
					validate_condition (not to_file_property.value.is_empty, "  [cat] error: 'to_file' may not be empty", a_is_valid)
				end
			end
			Result := a_is_valid.item
 		ensure then
 			file_property_defined: Result implies file_property.is_defined
		end

feature -- Access

	file_property: GEANT_STRING_PROPERTY
			-- file property

	to_file_property: GEANT_STRING_PROPERTY
			-- to_file property

	append_property: GEANT_BOOLEAN_PROPERTY
			-- append property

	cat_only_agent_cell: DS_CELL [PROCEDURE [TUPLE [STRING]]]
			-- Agent cell for 'cat' only
			-- NOTE: using a DS_CELL here and for the other agents makes it possible to set the underlying agent from outside
			-- without having to provide individual setters for each agent.

	cat_with_file_agent_cell: DS_CELL [PROCEDURE [TUPLE [STRING, KL_TEXT_OUTPUT_FILE]]]
			-- Agent cell for 'cat' with file

feature -- Execution

	execute
			-- Execute command.
		local
			a_filename: STRING
			a_to_file: STRING
			a_append: BOOLEAN
			a_file: KL_TEXT_OUTPUT_FILE
		do
			a_filename := file_property.value
			if to_file_property.is_defined then
				a_to_file := to_file_property.value
				create a_file.make (a_to_file)
				a_append := append_property.non_empty_value_or_else (False)
				if a_append then
					project.trace (<<"  [cat] Appending '", a_filename, "' to file '", a_to_file, "'">>)
					a_file.open_append
				else
					project.trace (<<"  [cat] Writing '", a_filename, "' to file '", a_to_file, "'">>)
					a_file.open_write
				end
				cat_with_file_agent_cell.item.call ([a_filename, a_file])
				if a_file.is_open_write then
					a_file.close
				end
			else
				cat_only_agent_cell.item.call ([a_filename])
			end
		end

feature {NONE} -- Implementation

	write_file (a_filename: STRING)
			-- Write content of file `a_filename' to `project.log'.
		require
			a_filename_not_void: a_filename /= Void
		local
			l_file: KL_TEXT_INPUT_FILE
		do
			create l_file.make (a_filename)
			l_file.open_read
			if l_file.is_open_read then
				project.trace (<<"  [cat]">>)
				from
					l_file.read_line
				until
					l_file.end_of_file
				loop
					project.log (<<l_file.last_string>>)
					l_file.read_line
				end
				l_file.close
				exit_code := 0
			else
				project.log (<<"  [cat] error: cannot read file '", a_filename, "'">>)
				exit_code := 1
			end
		end

	write_file_to_file (a_in_filename: STRING; a_out_file: KL_TEXT_OUTPUT_FILE)
			-- Write content of file `a_in_filename' to `a_out_file'.
		require
			a_in_filename_not_void: a_in_filename /= Void
			a_out_file_not_void: a_out_file /= Void
		local
			l_in_file: KL_TEXT_INPUT_FILE
		do
			if a_out_file.is_open_write then
				create l_in_file.make (a_in_filename)
				l_in_file.open_read
				if l_in_file.is_open_read then
					project.trace (<<"  [cat]">>)
					from
						l_in_file.read_line
					until
						l_in_file.end_of_file
					loop
						a_out_file.put_line (l_in_file.last_string)
						l_in_file.read_line
					end
					l_in_file.close
					exit_code := 0
				else
					project.log (<<"  [cat] error: cannot read file '", a_in_filename, "'">>)
					exit_code := 1
				end
			else
				project.log (<<"  [cat] error: cannot write to file '", a_out_file.name, "'">>)
				exit_code := 1
			end
		end

invariant

	file_property_not_void: file_property /= Void
	to_file_property_not_void: to_file_property /= Void
	append_property_not_void: append_property /= Void

	cat_only_agent_cell_not_void: cat_only_agent_cell /= Void
	cat_only_agent_cell_item_not_void: cat_only_agent_cell.item /= Void
	cat_with_file_agent_cell_not_void: cat_with_file_agent_cell /= Void
	cat_with_file_agent_cell_item_not_void: cat_with_file_agent_cell.item /= Void

end
