note

	description:

		"Geyacc tasks"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001-2002, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_GEYACC_TASK

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

				-- separate_actions:
			if has_attribute (Separate_actions_attribute_name) then
				command.set_separate_actions (boolean_value (Separate_actions_attribute_name))
			end
				-- verbose_filename:
			if has_attribute (Verbose_filename_attribute_name) then
				a_value := attribute_value (Verbose_filename_attribute_name)
				if a_value.count > 0 then
					command.set_verbose_filename (a_value)
				end
			end
				-- old_typing:
			if has_attribute (Old_typing_attribute_name) then
				command.set_old_typing (boolean_value (Old_typing_attribute_name))
			end
				-- new_typing:
			if has_attribute (New_typing_attribute_name) then
				command.set_new_typing (boolean_value (New_typing_attribute_name))
			end
				-- tokens_classname:
			if has_attribute (Tokens_classname_attribute_name) then
				a_value := attribute_value (Tokens_classname_attribute_name)
				if a_value.count > 0 then
					command.set_tokens_classname (a_value)
				end
			end
				-- tokens_filename:
			if has_attribute (Tokens_filename_attribute_name) then
				a_value := attribute_value (Tokens_filename_attribute_name)
				if a_value.count > 0 then
					command.set_tokens_filename (a_value)
				end
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

	build_command (a_project: GEANT_PROJECT) is
			-- Create instance of `command'
		do
			create command.make (a_project)
		end

feature -- Access

	command: GEANT_GEYACC_COMMAND
			-- Geyacc commands

feature {NONE} -- Constants

	Separate_actions_attribute_name: STRING is
			-- Name of xml attribute for separate_actions
		once
			Result := "separate_actions"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Verbose_filename_attribute_name: STRING is
			-- Name of xml attribute for verbose_filename
		once
			Result := "verbose"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Tokens_classname_attribute_name: STRING is
			-- Name of xml attribute for tokens_classname
		once
			Result := "tokens"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Tokens_filename_attribute_name: STRING is
			-- Name of xml attribute for tokens_filename
		once
			Result := "tokens_file"
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

	Old_typing_attribute_name: STRING is
			-- Name of xml attribute for 'old_typing'
		once
			Result := "old_typing"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	New_typing_attribute_name: STRING is
			-- Name of xml attribute for 'new_typing'
		once
			Result := "new_typing"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

end
