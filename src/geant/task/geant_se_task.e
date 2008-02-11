indexing

	description:

		"Compilation tasks for SmartEiffel"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_SE_TASK

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

	make (a_project: GEANT_PROJECT; an_xml_element: XM_ELEMENT) is
			-- Create a new task with information held in `an_element'.
		local
			a_value: STRING
		do
			Precursor {GEANT_TASK} (a_project, an_xml_element)

			if has_attribute (Ace_attribute_name) then
					-- ace_filename (optional)
				a_value := attribute_value_or_default (Ace_attribute_name, "")
				if a_value.count > 0 then
					command.set_ace_filename (a_value)
				end
			elseif has_attribute (Clean_attribute_name) then
					-- clean:
				a_value := attribute_value_or_default (Clean_attribute_name, "")
				if a_value.count > 0 then
					command.set_clean (a_value)
				end
			else
					-- root_class:
				if has_attribute (Root_class_attribute_name) then
					a_value := attribute_value (Root_class_attribute_name)
					if a_value.count > 0 then
						command.set_root_class (a_value)
					end
				end
					-- creation_procedure:
				if has_attribute (Creation_procedure_attribute_name) then
					a_value := attribute_value (Creation_procedure_attribute_name)
					if a_value.count > 0 then
						command.set_creation_procedure (a_value)
					end
				end
					-- executable:
				if has_attribute (Executable_attribute_name) then
					a_value := attribute_value (Executable_attribute_name)
					if a_value.count > 0 then
						command.set_executable (a_value)
					end
				end
					-- case_insensitive:
				if has_attribute (Case_insensitive_attribute_name) then
					command.set_case_insensitive (boolean_value (Case_insensitive_attribute_name))
				end
					-- no_style_warning:
				if has_attribute (No_style_warning_attribute_name) then
					command.set_no_style_warning (boolean_value (No_style_warning_attribute_name))
				end
			end
			if has_attribute (Exit_code_variable_attribute_name) then
				a_value := attribute_value (Exit_code_variable_attribute_name)
				if a_value.count > 0 then
					command.set_exit_code_variable_name (a_value)
				end
			end
		end

	build_command (a_project: GEANT_PROJECT) is
			-- Create instance of `command'
		do
			create command.make (a_project)
		end

feature -- Access

	command: GEANT_SE_COMMAND
			-- Compilation commands for SmartEiffel

feature {NONE} -- Constants

	Ace_attribute_name: STRING is
			-- Name of xml attribute for "ace"
		once
			Result := "ace"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Root_class_attribute_name: STRING is
			-- Name of xml attribute for root_class
		once
			Result := "root_class"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Creation_procedure_attribute_name: STRING is
			-- Name of xml attribute for creation_procedure
		once
			Result := "creation_procedure"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Executable_attribute_name: STRING is
			-- Name of xml attribute for executable
		once
			Result := "executable"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Case_insensitive_attribute_name: STRING is
			-- Name of xml attribute for case_insensitive
		once
			Result := "case_insensitive"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	No_style_warning_attribute_name: STRING is
			-- Name of xml attribute for no_style_warning
		once
			Result := "no_style_warning"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Clean_attribute_name: STRING is
			-- Name of xml attribute for "clean"
		once
			Result := "clean"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Exit_code_variable_attribute_name: STRING is
			-- Name of xml attribute exit_code_variable.
		once
			Result := "exit_code_variable"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

end
