indexing

	description:

		"Compilation tasks for SmallEiffel"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_COMPILE_SE_TASK

inherit

	GEANT_TASK
	GEANT_COMPILE_SE_COMMAND

creation

	make, make_from_element

feature {NONE} -- Initialization

	make_from_element (an_element: GEANT_ELEMENT) is
			-- Create a new task with information held in `an_element'.
		local
			a_value: STRING
		do
				-- ace_filename (optional)
			if has_uc_attribute (an_element, Ace_file_attribute_name) then
				a_value := attribute_value_or_default (an_element, Ace_file_attribute_name.out, "")
				if a_value.count > 0 then
					set_ace_filename (a_value)
				end
			else
					-- root_class:
				if has_uc_attribute (an_element, Root_class_attribute_name) then
					a_value := uc_attribute_value (an_element, Root_class_attribute_name).out
					if a_value.count > 0 then
						set_root_class (a_value)
					end
				end
					-- creation_procedure:
				if has_uc_attribute (an_element, Creation_procedure_attribute_name) then
					a_value := uc_attribute_value (an_element, Creation_procedure_attribute_name).out
					if a_value.count > 0 then
						set_creation_procedure (a_value)
					end
				end
					-- executable:
				if has_uc_attribute (an_element, Executable_attribute_name) then
					a_value := uc_attribute_value (an_element, Executable_attribute_name).out
					if a_value.count > 0 then
						set_executable (a_value)
					end
				end
					-- case_insensitive:
				if has_uc_attribute (an_element, Case_insensitive_attribute_name) then
					set_case_insensitive (uc_boolean_value (an_element, Case_insensitive_attribute_name))
				end
					-- no_style_warning:
				if has_uc_attribute (an_element, No_style_warning_attribute_name) then
					set_no_style_warning (uc_boolean_value (an_element, No_style_warning_attribute_name))
				end
			end
		end

feature {NONE} -- Constants

	Ace_file_attribute_name: UC_STRING is
			-- Name of xml attribute for ace_file
		once
			!! Result.make_from_string ("ace_file")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

	Root_class_attribute_name: UC_STRING is
			-- Name of xml attribute for root_class
		once
			!! Result.make_from_string ("root_class")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

	Creation_procedure_attribute_name: UC_STRING is
			-- Name of xml attribute for creation_procedure
		once
			!! Result.make_from_string ("creation_procedure")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

	Executable_attribute_name: UC_STRING is
			-- Name of xml attribute for executable
		once
			!! Result.make_from_string ("executable")
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

	No_style_warning_attribute_name: UC_STRING is
			-- Name of xml attribute for no_style_warning
		once
			!! Result.make_from_string ("no_style_warning")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

end -- class GEANT_COMPILE_SE_TASK
