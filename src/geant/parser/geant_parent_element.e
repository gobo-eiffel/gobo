note

	description:

		"Parent Elements"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_PARENT_ELEMENT

inherit

	GEANT_INTERPRETING_ELEMENT
		rename
			make as interpreting_element_make
		end

	GEANT_SHARED_PROPERTIES
		export {NONE} all end

create

	make, make_old

feature -- Initialization

	make (a_project: GEANT_PROJECT; a_xml_element: XM_ELEMENT)
			-- Create new parent element with information held in `a_xml_element'.
		require
			a_project_not_void: a_project /= Void
			a_xml_element_not_void: a_xml_element /= Void
		local
			s: STRING
			xml_elements: DS_LINKED_LIST [XM_ELEMENT]
			cs: DS_LINKED_LIST_CURSOR [XM_ELEMENT]
			a_rename_element: GEANT_RENAME_ELEMENT
			a_redefine_element: GEANT_REDEFINE_ELEMENT
			a_select_element: GEANT_SELECT_ELEMENT
			a_string: STRING
			msg: ARRAY [STRING]
			a_project_loader: GEANT_PROJECT_LOADER
			a_parent_project: GEANT_PROJECT
		do
			interpreting_element_make (a_project, a_xml_element)
			create parent.make (a_project)
			if has_attribute (Location_attribute_name) then
				a_string := attribute_value (Location_attribute_name)
				if a_string.count > 0 then
					create a_project_loader.make (a_string)
					a_project_loader.load (a_project.variables, a_project.options)
					a_parent_project := a_project_loader.project_element.project
					parent.set_parent_project (a_parent_project)
					a_parent_project.merge_in_parent_projects
				end
			end
				-- Handle renames:
			xml_elements := elements_by_name (Rename_element_name)
			cs := xml_elements.new_cursor
			from cs.start until cs.after loop
				create a_rename_element.make (project, cs.item)
				s := a_rename_element.rename_clause.original_name
				if parent.renames.has (s) then
					create msg.make (1, 9)
					msg.put ("%NLOAD ERROR:%N", 1)
					msg.put ("  Project '", 2)
					msg.put (project.name, 3)
					msg.put ("': VHRC-2: old_name `", 4)
					msg.put (s, 5)
					msg.put ("' appears more than once as the first element", 6)
					msg.put (" of a Rename_pair in the same Rename subclause of parent '", 7)
					msg.put (parent.parent_project.name, 8)
					msg.put ("%'", 9)
					exit_application (1, msg)
				end
				parent.renames.force_last (a_rename_element.rename_clause, s)
				cs.forth
			end
				-- Handle redefines:
			xml_elements := elements_by_name (Redefine_element_name)
			cs := xml_elements.new_cursor
			from cs.start until cs.after loop
				create a_redefine_element.make (project, cs.item)
				s := a_redefine_element.redefine_clause.name
				parent.redefines.force_last (a_redefine_element.redefine_clause, s)
				cs.forth
			end
				-- Handle selects:
			xml_elements := elements_by_name (Select_element_name)
			cs := xml_elements.new_cursor
			from cs.start until cs.after loop
				create a_select_element.make (project, cs.item)
				s := a_select_element.select_clause.name
				parent.selects.force_last (a_select_element.select_clause, s)
				cs.forth
			end
		end

	make_old (a_project: GEANT_PROJECT; a_xml_element: XM_ELEMENT)
			-- Create new parent element with information held in `a_xml_element'.
			-- (Only to suppport old form of inheritance)
			-- TODO: remove after obsolete period
		require
			a_project_not_void: a_project /= Void
			a_xml_element_not_void: a_xml_element /= Void
--			has_inherit_attribute: has_attribute (Inherit_attribute_name)
			project_in_old_inherit_form: a_project.old_inherit
		local
			a_string: STRING
			a_project_loader: GEANT_PROJECT_LOADER
			a_parent_project: GEANT_PROJECT
		do
			interpreting_element_make (a_project, a_xml_element)
			create parent.make (a_project)
			a_string := attribute_value (Inherit_attribute_name)
			if a_string.count > 0 then
				create a_project_loader.make (a_string)
				a_project_loader.load (a_project.variables, a_project.options)
				a_parent_project := a_project_loader.project_element.project
				parent.set_parent_project (a_parent_project)
				a_parent_project.merge_in_parent_projects
			else
				exit_application (1, <<"%NLOAD ERROR:%N", "  project '", project.name, "' invalid inherit clause.">>)
			end
		end

feature -- Access

	parent: GEANT_PARENT
			-- Parent clause

feature {NONE} -- Constants

	Location_attribute_name: STRING
			-- "location" attribute name
		once
			Result := "location"
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

	Inherit_attribute_name: STRING
			-- "inherit" attribute name (only to suppport old form of inheritance)
			-- TODO: remove after obsolete period
		once
			Result := "inherit"
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

	Rename_element_name: STRING
			-- "rename" element name
		once
			Result := "rename"
		ensure
			element_name_not_void: Result /= Void
			element_name_not_empty: Result.count > 0
		end

	Redefine_element_name: STRING
			-- "redefine" element name
		once
			Result := "redefine"
		ensure
			element_name_not_void: Result /= Void
			element_name_not_empty: Result.count > 0
		end

	Select_element_name: STRING
			-- "select" element name
		once
			Result := "select"
		ensure
			element_name_not_void: Result /= Void
			element_name_not_empty: Result.count > 0
		end

end
