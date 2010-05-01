note

	description:

		"Inherit Elements"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_INHERIT_ELEMENT

inherit

	GEANT_INTERPRETING_ELEMENT
		rename
			make as interpreting_element_make
		end

	GEANT_SHARED_PROPERTIES
		export {NONE} all end

create

	make, make_old

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT; a_xml_element: XM_ELEMENT) is
			-- Create new inherit element with information held in `a_xml_element'.
		local
			a_parent_elements: DS_LINKED_LIST [XM_ELEMENT]
			cs: DS_LINKED_LIST_CURSOR [XM_ELEMENT]
			a_parent_element: GEANT_PARENT_ELEMENT
		do
			interpreting_element_make (a_project, a_xml_element)
			create geant_inherit.make (project)
			a_parent_elements := elements_by_name (Parent_element_name)
			cs := a_parent_elements.new_cursor
			from cs.start until cs.after loop
				create a_parent_element.make (project, cs.item)
					-- Check that no two projects have the same name and different locations:
					-- TODO: do not check `is_executable' in elements (like here):
				if a_parent_element.parent.is_executable then

-- TODO: prevent that projects with the same name but different locations can be loaded (name clashes of projects)
--					if not has_system_parent (a_parent_element.parent) then
--						if has_system_parent_with_different_location (a_parent_element.parent) then
--							exit_application (1,
--								<<"%NLOAD ERROR:%N  There exists more than one project named '",
--								a_parent_element.parent.project.name, "' in the system.">>)
--						end
--						system_parents.force_last (a_parent_element.parent)
--					end
					geant_inherit.parents.force_last (a_parent_element.parent)
				else
					exit_application (1, <<"ERROR in 'parent' clause">>)
				end
				cs.forth
			end
		end

	make_old (a_project: GEANT_PROJECT; a_xml_element: XM_ELEMENT) is
			-- Create new element with information held in `a_xml_element'.
			-- (Only to suppport old form of inheritance)
			-- TODO: remove after obsolete period
		require
			a_project_not_void: a_project /= Void
			a_xml_element_not_void: a_xml_element /= Void
			project_in_old_inherit_form: a_project.old_inherit
		local
			a_parent_element: GEANT_PARENT_ELEMENT
		do
			interpreting_element_make (a_project, a_xml_element)
			create geant_inherit.make (project)
			create a_parent_element.make_old (project, a_xml_element)
				-- TODO: do not check `is_executable' in elements (like here):
			if not a_parent_element.parent.is_executable then
				exit_application (1, <<"ERROR in 'parent' clause">>)
			end
			geant_inherit.parents.force_last (a_parent_element.parent)
		end

feature -- Access

	geant_inherit: GEANT_INHERIT
			-- Inherit clause

feature {NONE} -- Constants

	Parent_element_name: STRING is
			-- "parent" element name
		once
			Result := "parent"
		ensure
			element_name_not_void: Result /= Void
			element_name_not_empty: Result.count > 0
		end

end
