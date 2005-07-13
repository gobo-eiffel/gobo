indexing

	description:

		"Gelex tasks"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_GELEX_TASK

inherit

	GEANT_TASK
		rename
			make as task_make
		redefine
			command
		end

	KL_IMPORTED_STRING_ROUTINES

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
				-- size:
			if has_attribute (Size_attribute_name) then
				a_value := attribute_value (Size_attribute_name)
				if STRING_.is_integer (a_value) then
					command.set_size (a_value)
				end
			end
				-- backup:
			if has_attribute (Backup_attribute_name) then
				command.set_backup (boolean_value (Backup_attribute_name))
			end
				-- ecs:
			if has_attribute (Ecs_attribute_name) then
				command.set_ecs (boolean_value (Ecs_attribute_name))
			end
				-- full:
			if has_attribute (Full_attribute_name) then
				command.set_full (boolean_value (Full_attribute_name))
			end
				-- case_insensitive:
			if has_attribute (Case_insensitive_attribute_name) then
				command.set_case_insensitive (boolean_value (Case_insensitive_attribute_name))
			end
				-- meta_ecs:
			if has_attribute (Meta_ecs_attribute_name) then
				command.set_meta_ecs (boolean_value (Meta_ecs_attribute_name))
			end
				-- no_default:
			if has_attribute (No_default_attribute_name) then
				command.set_no_default (boolean_value (No_default_attribute_name))
			end
				-- no_warn:
			if has_attribute (No_warn_attribute_name) then
				command.set_no_warn (boolean_value (No_warn_attribute_name))
			end
				-- separate_actions:
			if has_attribute (Separate_actions_attribute_name) then
				command.set_separate_actions (boolean_value(Separate_actions_attribute_name))
			end
				-- output_filename:
			if has_attribute (Output_filename_attribute_name) then
				a_value := attribute_value (Output_filename_attribute_name)
				if a_value.count > 0 then
					command.set_output_filename (a_value)
				end
			end
				-- input_filename:
			if has_attribute (Input_filename_attribute_name) then
				a_value := attribute_value (Input_filename_attribute_name)
				if a_value.count > 0 then
					command.set_input_filename (a_value)
				end
			end
		end

feature -- Access

	command: GEANT_GELEX_COMMAND
			-- Gelex commands

feature {NONE} -- Constants

	Size_attribute_name: STRING is
			-- Name of xml attribute for size
		once
			Result := "size"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Backup_attribute_name: STRING is
			-- Name of xml attribute for backup
		once
			Result := "backup"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Ecs_attribute_name: STRING is
			-- Name of xml attribute for ecs
		once
			Result := "ecs"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Full_attribute_name: STRING is
			-- Name of xml attribute for full
		once
			Result := "full"
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

	Meta_ecs_attribute_name: STRING is
			-- Name of xml attribute for meta_ecs
		once
			Result := "meta_ecs"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	No_default_attribute_name: STRING is
			-- Name of xml attribute for no_default
		once
			Result := "no_default"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	No_warn_attribute_name: STRING is
			-- Name of xml attribute for no_warn
		once
			Result := "no_warn"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Separate_actions_attribute_name: STRING is
			-- Name of xml attribute for separate_actions
		once
			Result := "separate_actions"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Output_filename_attribute_name: STRING is
			-- Name of xml attribute for output_filename
		once
			Result := "output"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Input_filename_attribute_name: STRING is
			-- Name of xml attribute for input_filename
		once
			Result := "input"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

end
