indexing

	description:

		"Gedoc tasks"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_GEDOC_TASK

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

	make (a_project: GEANT_PROJECT; an_xml_element: XM_ELEMENT) is
			-- Create a new task with information held in `an_element'.
		local
			a_name: STRING
			a_value: STRING
			parameter_elements: DS_ARRAYED_LIST [XM_ELEMENT]
			parameter_element: GEANT_DEFINE_ELEMENT
			i, nb: INTEGER
			a_pair: DS_PAIR [STRING, STRING]
		do
			create command.make (a_project)
			task_make (command, an_xml_element)
			if has_attribute (Input_filename_attribute_name) then
				a_value := attribute_value (Input_filename_attribute_name)
				if a_value.count > 0 then
					command.set_input_filename (a_value)
				end
			end
			if has_attribute (Output_filename_attribute_name) then
				a_value := attribute_value (Output_filename_attribute_name)
				if a_value.count > 0 then
					command.set_output_filename (a_value)
				end
			end
			if has_attribute (Stylesheet_filename_attribute_name) then
				a_value := attribute_value (Stylesheet_filename_attribute_name)
				if a_value.count > 0 then
					command.set_stylesheet_filename (a_value)
				end
			end
			parameter_elements := xml_element.children_by_name (Parameter_element_name)
			nb := parameter_elements.count
			from i := 1 until i > nb loop
				create parameter_element.make (project, parameter_elements.item (i))
				if
					parameter_element.is_enabled and then
					paramter_element.has_name and then
					paramter_element.has_value
				then
					a_name := parameter_element.name
					a_value := parameter_element.value
					create a_pair.make (a_name, a_value)
					command.parameters.force_last (a_pair)
				end
				i := i + 1
			end
		end

feature -- Access

	command: GEANT_GEDOC_COMMAND
			-- Gedoc commands

feature {NONE} -- Constants

	Input_filename_attribute_name: STRING is
			-- Name of xml attribute for input_filename
		once
			Result := "input"
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

	Stylesheet_filename_attribute_name: STRING is
			-- Name of xml attribute for stylesheet_filename
		once
			Result := "stylesheet"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Parameter_element_name: STRING is
			-- Name of xml subelement for parameter
		once
			Result := "parameter"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Value_attribute_name:  STRING is
			-- Name of xml attribute for value
		once
			Result := "value"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

end
