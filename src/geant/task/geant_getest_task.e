indexing

	description:

		"Getest tasks"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_GETEST_TASK

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
			a_name, a_value: STRING
			i, nb: INTEGER
			define_elements: DS_ARRAYED_LIST [GEANT_XML_ELEMENT]
			define_element: GEANT_DEFINE_ELEMENT
		do
			!! command.make (a_project)
			task_make (command, an_xml_element)
			if has_uc_attribute (Config_filename_attribute_name) then
				a_value := uc_attribute_value (Config_filename_attribute_name).out
				if a_value.count > 0 then
					command.set_config_filename (a_value)
				end
			end
			if has_uc_attribute (Compile_attribute_name) then
				a_value := uc_attribute_value (Compile_attribute_name).out
				command.set_compile (a_value)
			end
				-- define:
			define_elements := xml_element.children_by_name (Define_element_name)
			nb := define_elements.count
			from i := 1 until i > nb loop
				!! define_element.make (project, define_elements.item (i))
				if define_element.is_enabled and then
					define_element.has_name and then define_element.has_value
				then
					a_name := define_element.name
					a_value := define_element.value
					if a_name.count > 0 then
						command.defines.force (a_value, a_name)
					end
				end
				i := i + 1
			end
		end

feature -- Access

	command: GEANT_GETEST_COMMAND
			-- Getest commands

feature {NONE} -- Constants

	Config_filename_attribute_name : UC_STRING is
			-- Name of xml attribute for getest config_filename
		once
			!! Result.make_from_string ("config")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

	Compile_attribute_name : UC_STRING is
			-- Name of xml attribute for getest 'compile'
		once
			!! Result.make_from_string ("compile")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

	Define_element_name: UC_STRING is
			-- Name of xml subelement for defines
		once
			!! Result.make_from_string ("define")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

	Value_attribute_name: UC_STRING is
			-- Name of xml attribute "value" of subelement <define>
		once
			!! Result.make_from_string ("value")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

end -- class GEANT_GETEST_TASK
