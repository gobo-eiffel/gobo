indexing

	description:

		"Geyacc tasks"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001-2002, Sven Ehrke and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_GEYACC_TASK

inherit

	GEANT_TASK
		rename
			make as task_make
		redefine
			command
		end

creation

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT; an_xml_element: GEANT_XML_ELEMENT) is
			-- Create a new task with information held in `an_element'.
		local
			a_value: STRING
		do
			!! command.make (a_project)
			task_make (command, an_xml_element)
				-- separate_actions:
			if has_uc_attribute (Separate_actions_attribute_name) then
				command.set_separate_actions (uc_boolean_value(Separate_actions_attribute_name))
			end
				-- verbose_filename:
			if has_uc_attribute (Verbose_filename_attribute_name) then
				a_value := uc_attribute_value (Verbose_filename_attribute_name).out
				if a_value.count > 0 then
					command.set_verbose_filename (a_value)
				end
			end
				-- tokens_classname:
			if has_uc_attribute (Tokens_classname_attribute_name) then
				a_value := uc_attribute_value (Tokens_classname_attribute_name).out
				if a_value.count > 0 then
					command.set_tokens_classname (a_value)
				end
			end
				-- tokens_filename:
			if has_uc_attribute (Tokens_filename_attribute_name) then
				a_value := uc_attribute_value (Tokens_filename_attribute_name).out
				if a_value.count > 0 then
					command.set_tokens_filename (a_value)
				end
			end
				-- output_filename:
			if has_uc_attribute (Output_filename_attribute_name) then
				a_value := uc_attribute_value (Output_filename_attribute_name).out
				if a_value.count > 0 then
					command.set_output_filename (a_value)
				end
			end
				-- input_filename:
			if has_uc_attribute (Input_filename_attribute_name) then
				a_value := uc_attribute_value (Input_filename_attribute_name).out
				if a_value.count > 0 then
					command.set_input_filename (a_value)
				end
			end
		end

feature -- Access

	command: GEANT_GEYACC_COMMAND
			-- Geyacc commands

feature {NONE} -- Constants

	Separate_actions_attribute_name: UC_STRING is
			-- Name of xml attribute for separate_actions
		once
			Result := new_unicode_string ("separate_actions")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Verbose_filename_attribute_name: UC_STRING is
			-- Name of xml attribute for verbose_filename
		once
			Result := new_unicode_string ("verbose")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Tokens_classname_attribute_name: UC_STRING is
			-- Name of xml attribute for tokens_classname
		once
			Result := new_unicode_string ("tokens")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Tokens_filename_attribute_name: UC_STRING is
			-- Name of xml attribute for tokens_filename
		once
			Result := new_unicode_string ("tokens_file")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Output_filename_attribute_name: UC_STRING is
			-- Name of xml attribute for output_filename
		once
			Result := new_unicode_string ("output")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Input_filename_attribute_name: UC_STRING is
			-- Name of xml attribute for input_filename
		once
			Result := new_unicode_string ("input")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

end
