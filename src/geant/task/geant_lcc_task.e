indexing

	description:

		"Lcc C-Compiler tasks"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class GEANT_LCC_TASK

inherit

	GEANT_TASK
	GEANT_LCC_COMMAND

creation

	make, make_from_element

feature {NONE} -- Initialization

	make_from_element (an_element: GEANT_ELEMENT) is
			-- Create a new task with information held in `an_element'.
		local
			a_value: STRING
		do
				-- -Fo:
			if has_uc_attribute (an_element, Executable_attribute_name) then
				a_value := uc_attribute_value (an_element, Executable_attribute_name).out
				if a_value.count > 0 then
					set_executable (a_value)
				end
			end
				-- source_filename
			if has_uc_attribute (an_element, Source_filename_attribute_name) then
				a_value := uc_attribute_value (an_element, Source_filename_attribute_name).out
				if a_value.count > 0 then
					set_source_filename (a_value)
				end
			end
		end

feature {NONE} -- Constants

	Executable_attribute_name: UC_STRING is
			-- Name of xml attribute for executable
		once
			!! Result.make_from_string ("executable")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

	Source_filename_attribute_name: UC_STRING is
			-- Name of xml attribute for source_filename
		once
			!! Result.make_from_string ("sourcefilename")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

end -- class GEANT_LCC_TASK
