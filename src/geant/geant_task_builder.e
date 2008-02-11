indexing

	description:

		"Contents of geant project files"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001-2002, Sven Ehrke, Jocelyn Fiat, and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class
	GEANT_TASK_BUILDER [G -> GEANT_TASK create make end]

feature

	new_task (a_project: GEANT_PROJECT; a_xml_element: XM_ELEMENT): G is
			-- New instance of G
		do
			create Result.make (a_project, a_xml_element)
		ensure
			Result_not_void: Result /= Void
		end

end
