indexing

	description:

		"XSLT tasks"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_XSLT_TASK

inherit

	GEANT_TASK
		undefine
			make
		redefine
			make_from_element
		end

	GEANT_XSLT_COMMAND

creation

	make_from_element

feature {NONE} -- Initialization

	make_from_element (a_project: GEANT_PROJECT; an_element: GEANT_ELEMENT) is
			-- Create a new task with information held in `an_element'.
		local
			a_name: STRING
			a_value: STRING
			parameter_elements: DS_ARRAYED_LIST [GEANT_ELEMENT]
			parameter_element: GEANT_ELEMENT
			i, nb: INTEGER
			a_pair: DS_PAIR [STRING, STRING]
		do
			precursor (a_project, an_element)
			if has_uc_attribute (an_element, Input_filename_attribute_name) then
				a_value := uc_attribute_value (an_element, Input_filename_attribute_name).out
				if a_value.count > 0 then
					set_input_filename (a_value)
				end
			end
			if has_uc_attribute (an_element, Output_filename_attribute_name) then
				a_value := uc_attribute_value (an_element, Output_filename_attribute_name).out
				if a_value.count > 0 then
					set_output_filename (a_value)
				end
			end
			if has_uc_attribute (an_element, Stylesheet_filename_attribute_name) then
				a_value := uc_attribute_value (an_element, Stylesheet_filename_attribute_name).out
				if a_value.count > 0 then
					set_stylesheet_filename (a_value)
				end
			end
			parameter_elements := an_element.children_by_name (Parameter_element_name)
			nb := parameter_elements.count
			from i := 1 until i > nb loop
				parameter_element := parameter_elements.item (i)
				if has_uc_attribute (parameter_element, Name_attribute_name) and
					has_uc_attribute (parameter_element, Value_attribute_name)
				then
					a_name:= uc_attribute_value (parameter_element, Name_attribute_name).out
					a_value := uc_attribute_value (parameter_element, Value_attribute_name).out
					!! a_pair.make (a_name, a_value)
					parameters.force_last (a_pair)
				end
				i := i + 1
			end
		end

feature {NONE} -- Constants

	Input_filename_attribute_name: UC_STRING is
			-- Name of xml attribute for input_filename
		once
			!! Result.make_from_string ("input")
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

	Stylesheet_filename_attribute_name: UC_STRING is
			-- Name of xml attribute for stylesheet_filename
		once
			!! Result.make_from_string ("stylesheet")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

	Parameter_element_name: UC_STRING is
			-- Name of xml subelement for parameter
		once
			!! Result.make_from_string ("parameter")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

	Value_attribute_name: UC_STRING is
			-- Name of xml attribute for value
		once
			!! Result.make_from_string ("value")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

end -- class GEANT_XSLT_TASK
