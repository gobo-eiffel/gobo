indexing

	description:

		"Copy tasks"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_COPY_TASK

inherit

	GEANT_TASK
		redefine
			make_from_element
		end

	GEANT_COPY_COMMAND

creation

	make_from_element

feature {NONE} -- Initialization

	make_from_element (a_project: GEANT_PROJECT; an_element: GEANT_ELEMENT) is
			-- Create a new task with information held in `an_element'.
		local
			a_value: STRING
		do
			precursor (a_project, an_element)
			if an_element.has_attribute (File_attribute_name) then
				a_value := attribute_value (an_element, File_attribute_name.out)
				if a_value.count > 0 then
					set_file (a_value.out)
				end
			end

			if an_element.has_attribute (To_file_attribute_name) then
				a_value := attribute_value (an_element, To_file_attribute_name.out)
				if a_value.count > 0 then
					set_to_file (a_value.out)
				end
			end

			if an_element.has_attribute (To_directory_attribute_name) then
				a_value := attribute_value (an_element, To_directory_attribute_name.out)
				if a_value.count > 0 then
					set_to_directory (a_value.out)
				end
			end
		end

feature {NONE} -- Constants

	File_attribute_name: UC_STRING is
			-- Name of xml attribute file.
		once
			!! Result.make_from_string ("file")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

	To_file_attribute_name: UC_STRING is
			-- Name of xml attribute to_file.
		once
			!! Result.make_from_string ("to_file")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end
		
	To_directory_attribute_name: UC_STRING is
			-- Name of xml attribute to_directory.
		once
			!! Result.make_from_string ("to_directory")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

end -- class GEANT_COPY_TASK
