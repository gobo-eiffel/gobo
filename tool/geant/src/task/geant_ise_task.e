note

	description:

		"Compilation tasks for ISE Eiffel"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_ISE_TASK

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
		do
			Precursor {GEANT_TASK} (a_project, an_xml_element)

				-- executable:
			if has_attribute (Executable_attribute_name) then
				a_value := attribute_value_or_default (Executable_attribute_name, "")
				if a_value.count > 0 then
					command.set_executable_filename (a_value)
				end
			end
				-- ace:
			if has_attribute (Ace_attribute_name) then
				a_value := attribute_value_or_default (Ace_attribute_name, "")
				if a_value.count > 0 then
					command.set_ecf_filename (a_value)
				end
			end
				-- ecf:
			if has_attribute (Ecf_attribute_name) then
				a_value := attribute_value_or_default (Ecf_attribute_name, "")
				if a_value.count > 0 then
					command.set_ecf_filename (a_value)
				end
			end
				-- target:
			if has_attribute (Target_attribute_name) then
				a_value := attribute_value_or_default (Target_attribute_name, "")
				if a_value.count > 0 then
					command.set_target_name (a_value)
				end
			end
				-- system:
			if has_attribute (System_attribute_name) then
				a_value := attribute_value_or_default (System_attribute_name, "")
				if a_value.count > 0 then
					command.set_system_name (a_value)
				end
			end
				-- clean:
			if has_attribute (Clean_attribute_name) then
				a_value := attribute_value_or_default (Clean_attribute_name, "")
				if a_value.count > 0 then
					command.set_clean (a_value)
				end
			end
				-- compatible:
			if has_attribute (Compatible_attribute_name) then
				command.set_compatible_mode (boolean_value (Compatible_attribute_name))
			end
				-- finalize:
			if has_attribute (Finalize_attribute_name) then
				command.set_finalize_mode (boolean_value (Finalize_attribute_name))
			end
				-- finish_freezing:
			if has_attribute (Finish_freezing_attribute_name) then
				command.set_finish_freezing (boolean_value (Finish_freezing_attribute_name))
			end
				-- project_path:
			if has_attribute (Project_path_attribute_name) then
				a_value := attribute_value_or_default (Project_path_attribute_name, "")
				if a_value.count > 0 then
					command.set_project_path (a_value)
				end
			elseif has_attribute (Old_project_path_attribute_name) then
				a_value := attribute_value_or_default (Old_project_path_attribute_name, "")
				if a_value.count > 0 then
					command.set_project_path (a_value)
				end
			end
				-- exit_code_variable:
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

	command: GEANT_ISE_COMMAND
			-- Compilation commands for ISE Eiffel

feature {NONE} -- Constants

	Executable_attribute_name: STRING
			-- Name of xml attribute for "executable"
		once
			Result := "executable"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Ace_attribute_name: STRING
			-- Name of xml attribute for "ace"
		once
			Result := "ace"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Ecf_attribute_name: STRING
			-- Name of xml attribute for "ecf"
		once
			Result := "ecf"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Target_attribute_name: STRING
			-- Name of xml attribute for "target"
		once
			Result := "target"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	System_attribute_name: STRING
			-- Name of xml attribute for "system"
		once
			Result := "system"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Compatible_attribute_name: STRING
			-- Name of xml attribute for "compatible"
		once
			Result := "compatible"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Finalize_attribute_name: STRING
			-- Name of xml attribute for "finalize"
		once
			Result := "finalize"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Finish_freezing_attribute_name: STRING
			-- Name of xml attribute for "finish_freezing"
		once
			Result := "finish_freezing"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Clean_attribute_name: STRING
			-- Name of xml attribute for "clean"
		once
			Result := "clean"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Project_path_attribute_name: STRING
			-- Name of xml attribute for "project_path"
		once
			Result := "project_path"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Old_project_path_attribute_name: STRING
			-- Name of xml attribute for "project-path"
		once
			Result := "project-path"
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

end
