indexing

	description:

		"Echo tasks"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_ECHO_TASK

inherit

	GEANT_TASK
		redefine
			make,
			build_command,
			command
		end

create

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT; an_xml_element: XM_ELEMENT) is
			-- Create new task with information held in `an_element'.
		local
			a_sp: GEANT_STRING_PROPERTY
			a_bp: GEANT_BOOLEAN_PROPERTY
			a_message_property: GEANT_XML_ATTRIBUTE_OR_CONTENT_PROPERTY [STRING]
			a_string_xml_attribute: GEANT_XML_ATTRIBUTE_PROPERTY [STRING]
			a_boolean_xml_attribute: GEANT_XML_ATTRIBUTE_PROPERTY [BOOLEAN]
		do
			Precursor {GEANT_TASK} (a_project, an_xml_element)

			create a_sp.make
			create a_message_property.make ("message", a_sp, an_xml_element)
			command.set_message_property (a_sp)

			create a_sp.make
			create a_string_xml_attribute.make ("to_file", a_sp, an_xml_element)
			command.set_to_file_property (a_sp)

			create a_bp.make
			create a_boolean_xml_attribute.make ("append", a_bp, an_xml_element)
			command.set_append_property (a_bp)
		end

	build_command (a_project: GEANT_PROJECT) is
			-- Create instance of `command'
		do
			create command.make (a_project)
		end

feature -- Access

	command: GEANT_ECHO_COMMAND
			-- Echo commands

end
