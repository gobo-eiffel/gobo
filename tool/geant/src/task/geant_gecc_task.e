note

	description:

		"Gecc tasks"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2023, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_GECC_TASK

inherit

	GEANT_TASK
		redefine
			make,
			build_command,
			command
		end

create

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT; an_xml_element: XM_ELEMENT)
			-- Create a new task with information held in `an_element'.
		local
			a_value: STRING
			a_integer_value: INTEGER
		do
			Precursor {GEANT_TASK} (a_project, an_xml_element)
				-- executable_filename.
			if has_attribute (Executable_attribute_name) then
				a_value := attribute_value_or_default (Executable_attribute_name, "")
				if a_value.count > 0 then
					command.set_executable_filename (a_value)
				end
			end
				-- script_filename.
			if has_attribute (Script_attribute_name) then
				a_value := attribute_value_or_default (Script_attribute_name, "")
				if a_value.count > 0 then
					command.set_script_filename (a_value)
				end
			end
				-- thread.
			if has_attribute (Thread_attribute_name) then
				a_value := attribute_value (Thread_attribute_name)
				if a_value.is_integer then
					a_integer_value := a_value.to_integer
					command.set_thread_count (a_value.to_integer)
				end
			end
			if has_attribute (Exit_code_variable_attribute_name) then
				a_value := attribute_value (Exit_code_variable_attribute_name)
				if a_value.count > 0 then
					command.set_exit_code_variable_name (a_value)
				end
			end
		end

	build_command (a_project: GEANT_PROJECT)
			-- Create instance of `command'
		do
			create command.make (a_project)
		end

feature -- Access

	command: GEANT_GECC_COMMAND
			-- Compilation commands for gecc

feature {NONE} -- Constants

	Executable_attribute_name: STRING
			-- Name of xml attribute for "executable"
		once
			Result := "executable"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Script_attribute_name: STRING
			-- Name of xml attribute for "script"
		once
			Result := "script"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Exit_code_variable_attribute_name: STRING
			-- Name of xml attribute exit_code_variable.
		once
			Result := "exit_code_variable"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Thread_attribute_name: STRING
			-- Name of xml attribute for "thread"
		once
			Result := "thread"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

end
