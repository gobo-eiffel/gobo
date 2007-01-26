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
		rename
			make as task_make
		redefine
			command
		end

create

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT; an_xml_element: XM_ELEMENT) is
			-- Create new task with information held in `an_element'.
		local
			a_value: STRING
			a_content_text: STRING
			a_has_attribute_message: BOOLEAN
			a_has_content_text: BOOLEAN
		do
			create command.make (a_project)
			task_make (command, an_xml_element)
				-- Content between '<echo>' and '</echo>' if any:
			a_content_text := an_xml_element.text
			a_has_content_text := not (a_content_text = Void or else a_content_text.is_empty)

				-- Make sure not both, attribute 'message' and element content text have been specified:
			a_has_attribute_message := has_attribute (Message_attribute_name)
			if a_has_content_text and a_has_attribute_message then
				exit_application (1, <<"  [echo]: error: Usage of both, attribute 'message' and text content within element 'echo' is not allowed.">>)
			end
				-- Make sure either attribute 'message' or element content text have been specified:
			if not a_has_content_text and not a_has_attribute_message then
				exit_application (1, <<"  [echo]: error: You have to specify either attribute 'message' or text content within the element 'echo'.">>)
			end

			if a_has_attribute_message then
				a_value := attribute_value (Message_attribute_name)
				command.set_message (a_value)
			else
				check a_has_content_text end
				command.set_message (a_content_text)
			end

			if has_attribute (To_file_attribute_name) then
				a_value := attribute_value (To_file_attribute_name)
				command.set_to_file (a_value)
				if has_attribute (Append_attribute_name) then
					command.set_append (boolean_value (Append_attribute_name))
				end
			end
		end

feature -- Access

	command: GEANT_ECHO_COMMAND
			-- Echo commands

feature {NONE} -- Constants

	Message_attribute_name: STRING is
			-- Name of xml attribute message
		once
			Result := "message"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	To_file_attribute_name: STRING is
			-- Name of xml attribute to_file
		once
			Result := "to_file"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Append_attribute_name: STRING is
			-- Name of xml attribute append
		once
			Result := "append"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end
end
