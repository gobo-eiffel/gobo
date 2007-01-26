indexing

	description:

		"Redefine Elements"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_REDEFINE_ELEMENT

inherit

	GEANT_INTERPRETING_ELEMENT
		rename
			make as interpreting_element_make
		end

create

	make

feature -- Initialization

	make (a_project: GEANT_PROJECT; a_xml_element: XM_ELEMENT) is
			-- Create new redefine clause with information held in `an_xml_element'.
		local
			a_value: STRING
		do
			interpreting_element_make (a_project, a_xml_element)
			create redefine_clause.make
			if has_attribute (Target_attribute_name) then
				a_value := attribute_value (Target_attribute_name)
				if a_value.count > 0 then
					redefine_clause.set_name (a_value)
				end
			end
		end

feature -- Access

	redefine_clause: GEANT_REDEFINE
			-- Redefine clause

feature {NONE} -- Constants

	Target_attribute_name: STRING is
			-- "target" attribute name
		once
			Result := "target"
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

end
