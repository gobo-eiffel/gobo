indexing

	description:

		"Geyacc tasks"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_GEYACC_TASK

inherit

	GEANT_TASK
		undefine
			make
		redefine
			make_from_element
		end

	GEANT_GEYACC_COMMAND

creation

	make_from_element

feature {NONE} -- Initialization

	make_from_element (a_project: GEANT_PROJECT; an_element: GEANT_ELEMENT) is
			-- Create a new task with information held in `an_element'.
		local
			a_value: STRING
		do
			precursor (a_project, an_element)
				-- separate_actions:
			if has_uc_attribute (an_element, Separate_actions_attribute_name) then
				set_separate_actions (uc_boolean_value(an_element, Separate_actions_attribute_name))
			end
				-- verbose_filename:
			if has_uc_attribute (an_element, Verbose_filename_attribute_name) then
				a_value := uc_attribute_value (an_element, Verbose_filename_attribute_name).out
				if a_value.count > 0 then
					set_verbose_filename (a_value)
				end
			end
				-- tokens_classname:
			if has_uc_attribute (an_element, Tokens_classname_attribute_name) then
				a_value := uc_attribute_value (an_element, Tokens_classname_attribute_name).out
				if a_value.count > 0 then
					set_tokens_classname (a_value)
				end
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

	Separate_actions_attribute_name: UC_STRING is
			-- Name of xml attribute for separate_actions
		once
			!! Result.make_from_string ("separate_actions")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

	Verbose_filename_attribute_name: UC_STRING is
			-- Name of xml attribute for verbose_filename
		once
			!! Result.make_from_string ("verbose")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

	Tokens_classname_attribute_name: UC_STRING is
			-- Name of xml attribute for tokens_classname
		once
			!! Result.make_from_string ("tokens")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

	Output_filename_attribute_name: UC_STRING is
			-- Name of xml attribute for output_filename
		once
			!! Result.make_from_string ("output")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

	Input_filename_attribute_name: UC_STRING is
			-- Name of xml attribute for input_filename
		once
			!! Result.make_from_string ("input")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

end -- class GEANT_GEYACC_TASK
