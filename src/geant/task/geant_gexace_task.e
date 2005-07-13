indexing

	description:

		"Gexace tasks"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_GEXACE_TASK

inherit

	GEANT_TASK
		rename
			make as task_make
		redefine
			command
		end

create

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT; an_xml_element: XM_ELEMENT) is
			-- Create a new task with information held in `an_element'.
		local
			a_name: STRING
			a_value: STRING
			define_elements: DS_LINKED_LIST [XM_ELEMENT]
			cs: DS_LINKED_LIST_CURSOR [XM_ELEMENT]
			define_element: GEANT_DEFINE_ELEMENT
		do
			create command.make (a_project)
			task_make (command, an_xml_element)
				-- verbose (optional):
			if has_attribute (Verbose_attribute_name) then
				command.set_verbose (boolean_value (Verbose_attribute_name))
			end
				-- validate:
			if has_attribute (Validate_attribute_name) then
				command.set_validate_command (boolean_value (Validate_attribute_name))
			end
				-- system:
			if has_attribute (System_attribute_name) then
				a_value := attribute_value (System_attribute_name)
				if a_value.count > 0 then
					command.set_system_command (a_value)
				end
			end
				-- cluster (obsolete, use library):
				-- Note: this attribute will be removed in Gobo 3.0 + 2 releases
			if has_attribute (Cluster_attribute_name) then
				project.trace (<<"Project '", project.name,
					"': WARNING: Obsolete attribute 'cluster' found for task 'gexace'.%N",
					"Use attribute 'library' instead.">>)

				a_value := attribute_value (Library_attribute_name)
				if a_value.count > 0 then
					command.set_library_command (a_value)
				end
			end
				-- library:
			if has_attribute (Library_attribute_name) then
				a_value := attribute_value (Library_attribute_name)
				if a_value.count > 0 then
					command.set_library_command (a_value)
				end
			end
				-- xace_filename:
			if has_attribute (Xace_filename_attribute_name) then
				a_value := attribute_value (Xace_filename_attribute_name)
				if a_value.count > 0 then
					command.set_xace_filename (a_value)
				end
			end
				-- output_filename:
			if has_attribute (Output_filename_attribute_name) then
				a_value := attribute_value (Output_filename_attribute_name)
				if a_value.count > 0 then
					command.set_output_filename (a_value)
				end
			end
				-- define:
			define_elements := elements_by_name (Define_element_name)
			cs := define_elements.new_cursor
			from cs.start until cs.after loop
				create define_element.make (project, cs.item)
				if
					define_element.is_enabled and then
					define_element.has_name and then
					define_element.has_value
				then
					a_name := define_element.name
					a_value := define_element.value
					if a_name.count > 0 then
						command.defines.force_last (a_value, a_name)
					end
				end
				cs.forth
			end
		end

feature -- Access

	command: GEANT_GEXACE_COMMAND
			-- Gexace commands

feature {NONE} -- Constants

	Verbose_attribute_name: STRING is
			-- Name of xml attribute for 'verbose'
		once
			Result := "verbose"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Validate_attribute_name: STRING is
			-- Name of xml attribute for 'validate'
		once
			Result := "validate"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	System_attribute_name: STRING is
			-- Name of xml attribute for 'system'
		once
			Result := "system"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Cluster_attribute_name: STRING is
			-- Name of xml attribute for 'cluster'
			-- TODO: remove after obsolete period (Gobo 3.0 + 2 releases)
		once
			Result := "cluster"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Library_attribute_name: STRING is
			-- Name of xml attribute for 'library'
		once
			Result := "library"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Xace_filename_attribute_name: STRING is
			-- Name of xml attribute for xace_filename
		once
			Result := "xace"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Output_filename_attribute_name: STRING is
			-- Name of xml attribute for "output"
		once
			Result := "output"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Define_element_name: STRING is
			-- Name of xml subelement for defines
		once
			Result := "define"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Value_attribute_name: STRING is
			-- Name of xml attribute "value" of subelement <define>
		once
			Result := "value"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

end
