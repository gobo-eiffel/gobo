indexing

	description:

		"Project Elements"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001-2002, Sven Ehrke and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_PROJECT_ELEMENT

inherit

	GEANT_ELEMENT
		rename
			make as element_make
		end

	GEANT_SHARED_PROPERTIES
		export
			{NONE} all
		end

creation

	make

feature {NONE} -- Initialization

	make (
		a_xml_element: GEANT_XML_ELEMENT;
		a_variables: GEANT_VARIABLES;
		a_options: GEANT_PROJECT_OPTIONS;
		a_build_filename: UC_STRING
		) is
			-- Create element with information held in `a_xml_element'.
		require
			a_xml_element_not_void: a_xml_element /= Void
			valid_xml_element: valid_xml_element (a_xml_element)
			a_variables_not_void: a_variables /= Void
			a_options_not_void: a_options /= Void
			a_build_filename_not_void: a_build_filename /= Void
			a_build_filename_not_empty: a_build_filename.count > 0
		local
			target_elements: DS_ARRAYED_LIST [GEANT_XML_ELEMENT]
			a_targets: DS_HASH_TABLE [GEANT_TARGET, STRING]
			a_target: GEANT_TARGET
			i: INTEGER
			msg: STRING
		do
			element_make (a_xml_element)
			create project.make (a_variables, a_options)
			project.trace ("Loading Project's configuration from " + a_build_filename.out + "%N")

				-- Determine description if available:
			if has_description then
				project.set_description (description)
			end

				-- Handle project name:
			if not has_uc_attribute (Name_attribute_name) then
				msg := clone ("%NLOAD ERROR:%N")
				msg.append_string ("  Project in file '")
				msg.append_string (a_build_filename.out)
				msg.append_string ("' does not have a name.%N")
				msg.append_string ("  Please specify a name for this project.")
				exit_application (1, msg)
			end
			project.set_name (uc_attribute_value (Name_attribute_name).out)

				-- Set default target name if present:
			if has_uc_attribute (Default_attribute_name) then
				project.set_default_target_name (uc_attribute_value (Default_attribute_name).out)
			end

				-- Create GEANT_TARGETs from the GEANT_ELEMENTs:
			target_elements := xml_element.children_by_name (Target_element_name)
			create a_targets.make (target_elements.count)

				-- Find targets of current project:
			project.trace_debug ("Project '" + project.name + "': loading " + target_elements.count.out + " immediate targets.%N")
			from i := 1 until i > target_elements.count loop
				create a_target.make (project, target_elements.item (i))
				project.trace_debug ("Project '" + project.name + "': loading target `" + a_target.name + "'%N")

					-- Make sure there is no other target with this name:
				if a_targets.has (a_target.name) then
					msg := clone ("%NLOAD ERROR:%N")
					msg.append_string ("  project '")
					msg.append_string (project.name)
					msg.append_string ("' contains a target named `")
					msg.append_string (a_target.name)
					msg.append_string ("' which conflicts with target `")
					msg.append_string (a_target.name)
					msg.append_string ("' from project '" + a_targets.item (a_target.name).project.name + "'.%N")
					msg.append_string ("  Either use a different name, use the rename clause, or redefine this target.")
					exit_application (1, msg)
				end

				a_targets.force_last (a_target, a_target.name)
				i := i + 1
			end

			project.set_targets (a_targets)

			load_parent_projects

		ensure
			project_set: project /= Void
		end

	load_parent_projects is
			-- Load parent projects if present.
		local
			msg: STRING
			a_inherit_element: GEANT_INHERIT_ELEMENT
			a_xml_element: GEANT_XML_ELEMENT
		do
				-- Check that not both, inherit_attribute and inherit_element have been specified:
				-- TODO: modify after obsolete period
			if has_uc_attribute (Inherit_attribute_name) and has_inherit_element then
				msg := clone ("%NLOAD ERROR in project '")
				msg.append_string (project.name)
				msg.append_string ("':%N")
				msg.append_string ("  Remove obsolete attribute 'inherit' and use subelement 'inherit' instead.")
				exit_application (1, msg)
			end

				-- Handle obsolete inherit_attribute:
				-- TODO: remove after obsolete period
			if has_uc_attribute (Inherit_attribute_name) then
				msg := clone ("Project '")
				msg.append_string (project.name)
				msg.append_string ("': WARNING: Obsolete inheritance format using attribute 'inherit' found.%N  Use new inheritance format with subelement instead.%N")
				project.trace (msg)

				project.set_old_inherit (True)
				check no_inherit_element: not has_inherit_element end
				create a_inherit_element.make_old (project, xml_element)
				project.set_inherit_clause (a_inherit_element.geant_inherit)
			end

				-- Handle inherit_element:
			if has_inherit_element then
				check no_inherit_attribute: not has_uc_attribute (Inherit_attribute_name) end
				a_xml_element := xml_element.child_by_name (Inherit_element_name)
				create a_inherit_element.make (project, a_xml_element)
				project.set_inherit_clause (a_inherit_element.geant_inherit)
			end
		end

feature -- Access

	has_inherit_element: BOOLEAN is
			-- Does `xml_element' has a subelement named `Inherit_element_name'
		local
			a_xml_element: GEANT_XML_ELEMENT
		do
			a_xml_element := xml_element.child_by_name (Inherit_element_name)
			Result := a_xml_element /= Void
		end

	has_parent: BOOLEAN is
			-- Does `xml_element' has an attribute named `Inherit_attribute_name'
		do
			Result := has_uc_attribute (Inherit_attribute_name)
		end

feature -- Access

	project: GEANT_PROJECT
			-- Project

feature {NONE} -- Constants

	Name_attribute_name: UC_STRING is
			-- "name" attribute name
		once
			Result := new_unicode_string ("name")
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

	Default_attribute_name: UC_STRING is
			-- "default" attribute name
		once
			Result := new_unicode_string ("default")
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

	Inherit_attribute_name: UC_STRING is
			-- "inherit" attribute name
		once
			Result := new_unicode_string ("inherit")
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

	Inherit_element_name: UC_STRING is
			-- "inherit" element name
		once
			Result := new_unicode_string ("inherit")
		ensure
			element_name_not_void: Result /= Void
			element_name_not_empty: Result.count > 0
		end

	Project_element_name: UC_STRING is
			-- "project" element name
		once
			Result := new_unicode_string ("project")
		ensure
			element_name_not_void: Result /= Void
			element_name_not_empty: Result.count > 0
		end

	Target_element_name: UC_STRING is
			-- "target" element name
		once
			Result := new_unicode_string ("target")
		ensure
			element_name_not_void: Result /= Void
			element_name_not_empty: Result.count > 0
		end

end
