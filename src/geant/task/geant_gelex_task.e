indexing

	description:

		"Gelex tasks"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_GELEX_TASK

inherit

	GEANT_TASK
	GEANT_GELEX_COMMAND
	KL_IMPORTED_STRING_ROUTINES

creation

	make, make_from_element

feature {NONE} -- Initialization

	make_from_element (an_element: GEANT_ELEMENT) is
			-- Create a new task with information held in `an_element'.
		local
			a_value: STRING
		do
				-- size:
			if has_uc_attribute (an_element, Size_attribute_name) then
				a_value := uc_attribute_value (an_element, Size_attribute_name).out
				if STRING_.is_integer (a_value) then
					set_size (a_value)
				end
			end
				-- backup:
			if has_uc_attribute (an_element, Backup_attribute_name) then
				set_backup (uc_boolean_value (an_element, Backup_attribute_name))
			end
				-- ecs:
			if has_uc_attribute (an_element, Ecs_attribute_name) then
				set_ecs (uc_boolean_value (an_element, Ecs_attribute_name))
			end
				-- full:
			if has_uc_attribute (an_element, Full_attribute_name) then
				set_full (uc_boolean_value (an_element, Full_attribute_name))
			end
				-- case_insensitive:
			if has_uc_attribute (an_element, Case_insensitive_attribute_name) then
				set_case_insensitive (uc_boolean_value (an_element, Case_insensitive_attribute_name))
			end
				-- meta_ecs:
			if has_uc_attribute (an_element, Meta_ecs_attribute_name) then
				set_meta_ecs (uc_boolean_value (an_element, Meta_ecs_attribute_name))
			end
				-- no_default:
			if has_uc_attribute (an_element, No_default_attribute_name) then
				set_no_default (uc_boolean_value (an_element, No_default_attribute_name))
			end
				-- no_warn:
			if has_uc_attribute (an_element, No_warn_attribute_name) then
				set_no_warn (uc_boolean_value (an_element, No_warn_attribute_name))
			end
				-- separate_actions:
			if has_uc_attribute (an_element, Separate_actions_attribute_name) then
				set_separate_actions (uc_boolean_value(an_element, Separate_actions_attribute_name))
			end
				-- output_filename:
			if has_uc_attribute (an_element, Output_filename_attribute_name) then
				a_value := uc_attribute_value (an_element, Output_filename_attribute_name).out
				if a_value.count > 0 then
					set_output_filename (a_value)
				end
			end
				-- input_filename:
			if has_uc_attribute (an_element, Input_filename_attribute_name) then
				a_value := uc_attribute_value (an_element, Input_filename_attribute_name).out
				if a_value.count > 0 then
					set_input_filename (a_value)
				end
			end
		end

feature {NONE} -- Constants

	Size_attribute_name: UC_STRING is
			-- Name of xml attribute for size
		once
			!! Result.make_from_string ("size")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

	Backup_attribute_name: UC_STRING is
			-- Name of xml attribute for backup
		once
			!! Result.make_from_string ("backup")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

	Ecs_attribute_name: UC_STRING is
			-- Name of xml attribute for ecs
		once
			!! Result.make_from_string ("ecs")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

	Full_attribute_name: UC_STRING is
			-- Name of xml attribute for full
		once
			!! Result.make_from_string ("full")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

	Case_insensitive_attribute_name: UC_STRING is
			-- Name of xml attribute for case_insensitive
		once
			!! Result.make_from_string ("case_insensitive")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

	Meta_ecs_attribute_name: UC_STRING is
			-- Name of xml attribute for meta_ecs
		once
			!! Result.make_from_string ("meta_ecs")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

	No_default_attribute_name: UC_STRING is
			-- Name of xml attribute for no_default
		once
			!! Result.make_from_string ("no_default")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

	No_warn_attribute_name: UC_STRING is
			-- Name of xml attribute for no_warn
		once
			!! Result.make_from_string ("no_warn")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

	Separate_actions_attribute_name: UC_STRING is
			-- Name of xml attribute for separate_actions
		once
			!! Result.make_from_string ("separate_actions")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

	Output_filename_attribute_name: UC_STRING is
			-- Name of xml attribute for output_filename
		once
			!! Result.make_from_string ("outfile")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

	Input_filename_attribute_name: UC_STRING is
			-- Name of xml attribute for input_filename
		once
			!! Result.make_from_string ("input_filename")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

end -- class GEANT_GELEX_TASK
