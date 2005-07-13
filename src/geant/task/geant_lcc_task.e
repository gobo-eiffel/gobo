indexing

	description:

		"Lcc C-Compiler tasks"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_LCC_TASK

inherit

	GEANT_TASK
		rename
			make as task_make
		redefine
			command
		end

create

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT; an_xml_element: XM_ELEMENT) is
			-- Create a new task with information held in `an_element'.
		local
			a_value: STRING
		do
			create command.make (a_project)
			task_make (command, an_xml_element)
				-- -Fo:
			if has_attribute (Executable_attribute_name) then
				a_value := attribute_value (Executable_attribute_name)
				if a_value.count > 0 then
					command.set_executable (a_value)
				end
			end
				-- source_filename:
			if has_attribute (Source_filename_attribute_name) then
				a_value := attribute_value (Source_filename_attribute_name)
				if a_value.count > 0 then
					command.set_source_filename (a_value)
				end
			end
		end

feature -- Access

	command: GEANT_LCC_COMMAND
			-- Lcc C-compiler commands

feature {NONE} -- Constants

	Executable_attribute_name: STRING is
			-- Name of xml attribute for executable
		once
			Result := "executable"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Source_filename_attribute_name: STRING is
			-- Name of xml attribute for source_filename
		once
			Result := "sourcefilename"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

end
