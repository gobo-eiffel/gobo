indexing

	description:

		"Compilation tasks for Visual Eiffel"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_VE_TASK

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
				-- ESD:
			if has_attribute (Esd_attribute_name) then
				a_value := attribute_value_or_default (Esd_attribute_name, "")
				if a_value.count > 0 then
					command.set_esd_filename (a_value)
				end
			end
			if has_attribute (Xace_attribute_name) then
				a_value := attribute_value_or_default (Xace_attribute_name, "")
				if a_value.count > 0 then
					command.set_xace_filename (a_value)
				end
			end
				-- clean:
			if has_attribute (Clean_attribute_name) then
				a_value := attribute_value_or_default (Clean_attribute_name, "")
				if a_value.count > 0 then
					command.set_clean (a_value)
				end
					-- recursive:
				if has_attribute (Recursive_attribute_name) then
					command.set_recursive_clean (boolean_value (Recursive_attribute_name))
				end
			end
				-- tune:
			if has_attribute (Tune_attribute_name) then
				a_value := attribute_value_or_default (Tune_attribute_name, "")
				if a_value.count > 0 then
					command.set_tuned_system (a_value)
				end
					-- level:
				if has_attribute (Level_attribute_name) then
					a_value := attribute_value_or_default (Level_attribute_name, "")
					if a_value.count > 0 then
						command.set_tuning_level (a_value)
					end
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

feature -- Access

	command: GEANT_VE_COMMAND
			-- Compilation commands for Visual Eiffel

feature {NONE} -- Constants

	Esd_attribute_name: STRING is
			-- Name of xml attribute for "esd"
		once
			Result := "esd"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Xace_attribute_name: STRING is
			-- Name of xml attribute for "xace"
		once
			Result := "xace"
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

	Recursive_attribute_name: STRING is
			-- Name of xml attribute for "recursive"
		once
			Result := "recursive"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Tune_attribute_name: STRING is
			-- Name of xml attribute for "tune"
		once
			Result := "tune"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Level_attribute_name: STRING is
			-- Name of xml attribute for "level"
		once
			Result := "level"
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
