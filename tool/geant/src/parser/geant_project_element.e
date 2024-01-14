note

	description:

		"Project Elements"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001-2018, Sven Ehrke and others"
	license: "MIT License"

class GEANT_PROJECT_ELEMENT

inherit

	GEANT_ELEMENT
		rename
			make as element_make
		end

	GEANT_SHARED_PROPERTIES
		export {NONE} all end

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_xml_element: XM_ELEMENT;
		a_variables: GEANT_PROJECT_VARIABLES;
		a_options: GEANT_PROJECT_OPTIONS;
		a_build_filename: STRING)
			-- Create element with information held in `a_xml_element'.
		require
			a_xml_element_not_void: a_xml_element /= Void
			valid_xml_element: valid_xml_element (a_xml_element)
			a_variables_not_void: a_variables /= Void
			a_options_not_void: a_options /= Void
			a_build_filename_not_void: a_build_filename /= Void
			a_build_filename_not_empty: a_build_filename.count > 0
		local
			target_elements: DS_LINKED_LIST [XM_ELEMENT]
			cs: DS_LINKED_LIST_CURSOR [XM_ELEMENT]
			a_targets: DS_HASH_TABLE [GEANT_TARGET, STRING]
			a_target: GEANT_TARGET
			a_tester: UC_STRING_EQUALITY_TESTER
			s: STRING
			s1: STRING
			trace_project: GEANT_PROJECT -- TODO: move tracing out of GEANT_PROJECT
		do
			element_make (a_xml_element)
			create trace_project.make (a_variables, a_options, "trace_project")
			trace_project.trace (<<"Loading Project's configuration from ", a_build_filename>>)
				-- Handle project name:
			if not has_attribute (Name_attribute_name) then
				exit_application (1, <<"%NLOAD ERROR:%N", "  Project in file '", a_build_filename,
					"' does not have a name.%N", "  Please specify a name for this project.">>)
			end
			create project.make (a_variables, a_options, attribute_value (Name_attribute_name))
				-- Determine description if available:
			if attached xml_element.element_by_name (Description_element_name) as l_element and then attached l_element.text as l_text then
				project.set_description (l_text)
			end

				-- Store absolute pathname of buildfile in project variable:
			s1 := file_system.pathname_from_file_system (a_build_filename, unix_file_system)
			s := file_system.dirname (file_system.absolute_pathname (s1))
			a_variables.set_variable_value (project.name + ".absdir", s)

				-- Store dirname of directory buildfile in project variable:
			s := file_system.dirname (s1)
			a_variables.set_variable_value (project.name + ".dir", s)

				-- Store basename of buildfile in project variable:
			s := file_system.basename (s1)
			a_variables.set_variable_value (project.name + ".filename", s)

				-- Set default target name if present:
			if has_attribute (Default_attribute_name) then
				project.set_default_target_name (attribute_value (Default_attribute_name))
			end
				-- Create GEANT_TARGETs from the GEANT_ELEMENTs:
			target_elements := elements_by_name (Target_element_name)
			create a_targets.make_map (target_elements.count)
			create a_tester
			a_targets.set_key_equality_tester (a_tester)
				-- Find targets of current project:
			project.trace_debug (<<"Project '", project.name, "': loading ",
				target_elements.count.out, " immediate targets.">>)
			cs := target_elements.new_cursor
			from cs.start until cs.after loop
				create a_target.make (project, cs.item)
				project.trace_debug (<<"Project '", project.name, "': loading target `", a_target.name, "%'">>)
					-- Make sure there is no other target with this name:
				a_targets.search (a_target.name)
				if a_targets.found then
					exit_application (1, <<"%NLOAD ERROR:%N", "  project '", project.name,
						"' contains a target named `", a_target.name, "' which conflicts with target `",
						a_target.name, "' from project '", a_targets.found_item.project.name,
						"%'.%N", "  Either use a different name, use the rename clause, or redefine this target.">>)
				else
					a_targets.force_last_new (a_target, a_target.name)
				end
				cs.forth
			end
			project.set_targets (a_targets)
			load_parent_projects
		ensure
			project_set: project /= Void
		end

	load_parent_projects
			-- Load parent projects if present.
		local
			a_inherit_element: GEANT_INHERIT_ELEMENT
			a_xml_element: detachable XM_ELEMENT
		do
				-- Check that not both, inherit_attribute and inherit_element have been specified:
				-- TODO: modify after obsolete period
			if has_attribute (Inherit_attribute_name) and has_inherit_element then
				exit_application (1, <<"%NLOAD ERROR in project '", project.name, "%':%N",
					"  Remove obsolete attribute 'inherit' and use subelement 'inherit' instead.">>)
			end
				-- Handle obsolete inherit_attribute:
				-- TODO: remove after obsolete period
			if has_attribute (Inherit_attribute_name) then
				project.trace (<<"Project '", project.name,
					"': WARNING: Obsolete inheritance format using attribute 'inherit' found.%N",
					"Use new inheritance format with subelement instead.">>)
				project.set_old_inherit (True)
				check no_inherit_element: not has_inherit_element end
				create a_inherit_element.make_old (project, xml_element)
				project.set_inherit_clause (a_inherit_element.geant_inherit)
			end
				-- Handle inherit_element:
			if has_inherit_element then
				check no_inherit_attribute: not has_attribute (Inherit_attribute_name) end
				a_xml_element := xml_element.element_by_name (Inherit_element_name)
				if a_xml_element /= Void then
					create a_inherit_element.make (project, a_xml_element)
					project.set_inherit_clause (a_inherit_element.geant_inherit)
				end
			end
		end

feature -- Access

	has_inherit_element: BOOLEAN
			-- Does `xml_element' has a subelement named `Inherit_element_name'?
		local
			a_xml_element: XM_ELEMENT
		do
			a_xml_element := xml_element.element_by_name (Inherit_element_name)
			Result := a_xml_element /= Void
		end

	has_parent: BOOLEAN
			-- Does `xml_element' has an attribute named `Inherit_attribute_name'?
		do
			Result := has_attribute (Inherit_attribute_name)
		end

feature -- Access

	project: GEANT_PROJECT
			-- Project

feature {NONE} -- Constants

	Name_attribute_name: STRING
			-- "name" attribute name
		once
			Result := "name"
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

	Default_attribute_name: STRING
			-- "default" attribute name
		once
			Result := "default"
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

	Inherit_attribute_name: STRING
			-- "inherit" attribute name
		once
			Result := "inherit"
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

	Inherit_element_name: STRING
			-- "inherit" element name
		once
			Result := "inherit"
		ensure
			element_name_not_void: Result /= Void
			element_name_not_empty: Result.count > 0
		end

	Project_element_name: STRING
			-- "project" element name
		once
			Result := "project"
		ensure
			element_name_not_void: Result /= Void
			element_name_not_empty: Result.count > 0
		end

	Target_element_name: STRING
			-- "target" element name
		once
			Result := "target"
		ensure
			element_name_not_void: Result /= Void
			element_name_not_empty: Result.count > 0
		end

end
