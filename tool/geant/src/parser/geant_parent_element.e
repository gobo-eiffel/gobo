note

	description:

		"Parent Elements"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001-2018, Sven Ehrke and others"
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
			s: detachable STRING
			xml_elements: DS_LINKED_LIST [XM_ELEMENT]
			cs: DS_LINKED_LIST_CURSOR [XM_ELEMENT]
			a_rename_element: GEANT_RENAME_ELEMENT
			a_redefine_element: GEANT_REDEFINE_ELEMENT
			a_select_element: GEANT_SELECT_ELEMENT
			a_string: STRING
			msg: DS_ARRAYED_LIST [STRING]
			a_project_loader: GEANT_PROJECT_LOADER
			a_parent_project: GEANT_PROJECT
		do
			interpreting_element_make (a_project, a_xml_element)
			create parent.make (a_project)
			if has_attribute (Location_attribute_name) then
				a_string := attribute_value (Location_attribute_name)
				if a_string.count > 0 then
					if file_system.is_relative_pathname (a_string) and then attached a_project.variables.value (a_project.name + ".dir") as l_dirname then
						a_string := file_system.pathname (l_dirname, a_string)
					end
					create a_project_loader.make (a_string)
					a_project_loader.load (a_project.variables, a_project.options)
					if attached a_project_loader.project_element as l_project_element then
						a_parent_project := l_project_element.project
						parent.set_parent_project (a_parent_project)
						a_parent_project.merge_in_parent_projects
					end
				end
			end
				-- Handle renames:
			xml_elements := elements_by_name (Rename_element_name)
			cs := xml_elements.new_cursor
			from cs.start until cs.after loop
				create a_rename_element.make (project, cs.item)
				s := a_rename_element.rename_clause.original_name
				if s /= Void then
					if parent.renames.has (s) then
						create msg.make (9)
						msg.put_last ("%NLOAD ERROR:%N")
						msg.put_last ("  Project '")
						msg.put_last (project.name)
						msg.put_last ("': VHRC-2: old_name `")
						msg.put_last (s)
						msg.put_last ("' appears more than once as the first element")
						msg.put_last (" of a Rename_pair in the same Rename subclause of parent '")
						if attached parent.parent_project as l_parent_project then
							msg.put_last (l_parent_project.name)
						end
						msg.put_last ("%'")
						exit_application (1, msg.to_array)
					end
					parent.renames.force_last (a_rename_element.rename_clause, s)
				end
				cs.forth
			end
				-- Handle redefines:
			xml_elements := elements_by_name (Redefine_element_name)
			cs := xml_elements.new_cursor
			from cs.start until cs.after loop
				create a_redefine_element.make (project, cs.item)
				s := a_redefine_element.redefine_clause.name
				if s /= Void then
					parent.redefines.force_last (a_redefine_element.redefine_clause, s)
				end
				cs.forth
			end
				-- Handle selects:
			xml_elements := elements_by_name (Select_element_name)
			cs := xml_elements.new_cursor
			from cs.start until cs.after loop
				create a_select_element.make (project, cs.item)
				s := a_select_element.select_clause.name
				if s /= Void then
					parent.selects.force_last (a_select_element.select_clause, s)
				end
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
				if attached a_project_loader.project_element as l_project_element then
					a_parent_project := l_project_element.project
					parent.set_parent_project (a_parent_project)
					a_parent_project.merge_in_parent_projects
				end
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
