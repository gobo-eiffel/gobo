indexing

	description:

		"Gexace tasks"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_GEXACE_TASK

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
			i: INTEGER
			nb: INTEGER
			a_name: STRING
			a_value: STRING
			define_elements: DS_ARRAYED_LIST [GEANT_XML_ELEMENT]
			define_element: GEANT_DEFINE_ELEMENT
		do
			!! command.make (a_project)
			task_make (command, an_xml_element)
				-- verbose (optional):
			if has_uc_attribute (Verbose_attribute_name) then
				command.set_verbose (uc_boolean_value (Verbose_attribute_name))
			end
				-- validate:
			if has_uc_attribute (Validate_attribute_name) then
				command.set_validate_command (uc_boolean_value (Validate_attribute_name))
			end
				-- system:
			if has_uc_attribute (System_attribute_name) then
				a_value := uc_attribute_value (System_attribute_name).out
				if a_value.count > 0 then
					command.set_system_command (a_value)
				end
			end
				-- cluster:
			if has_uc_attribute (Cluster_attribute_name) then
				a_value := uc_attribute_value (Cluster_attribute_name).out
				if a_value.count > 0 then
					command.set_cluster_command (a_value)
				end
			end
				-- xace_filename:
			if has_uc_attribute (Xace_filename_attribute_name) then
				a_value := uc_attribute_value (Xace_filename_attribute_name).out
				if a_value.count > 0 then
					command.set_xace_filename (a_value)
				end
			end
				-- output_filename:
			if has_uc_attribute (Output_filename_attribute_name) then
				a_value := uc_attribute_value (Output_filename_attribute_name).out
				if a_value.count > 0 then
					command.set_output_filename (a_value)
				end
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

	command: GEANT_GEXACE_COMMAND
			-- Gexace commands

feature {NONE} -- Constants

	Verbose_attribute_name: UC_STRING is
			-- Name of xml attribute for 'verbose'
		once
			!! Result.make_from_string ("verbose")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

	Validate_attribute_name: UC_STRING is
			-- Name of xml attribute for 'validate'
		once
			!! Result.make_from_string ("validate")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

	System_attribute_name: UC_STRING is
			-- Name of xml attribute for 'system'
		once
			!! Result.make_from_string ("system")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

	Cluster_attribute_name: UC_STRING is
			-- Name of xml attribute for 'cluster'
		once
			!! Result.make_from_string ("cluster")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

	Xace_filename_attribute_name: UC_STRING is
			-- Name of xml attribute for xace_filename
		once
			!! Result.make_from_string ("xace")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

	Output_filename_attribute_name: UC_STRING is
			-- Name of xml attribute for "output"
		once
			!! Result.make_from_string ("output")
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

end -- class GEANT_GEXACE_TASK
