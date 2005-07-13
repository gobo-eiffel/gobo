indexing

	description:

		"Available tasks"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2002, Sven Ehrke and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_AVAILABLE_TASK

inherit

	GEANT_TASK
		rename
			make as task_make
		redefine
			command
		end

	GEANT_SHARED_PROPERTIES

create

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT; a_xml_element: XM_ELEMENT) is
			-- Create a new task with information held in `an_element'.
		local
			a_value: STRING
		do
			create command.make (a_project)
			task_make (command, a_xml_element)
			if has_attribute (Resource_attribute_name) then
				a_value := attribute_value (Resource_attribute_name)
				if a_value.count > 0 then
					command.set_resource_name (a_value)
				end
			end
			command.set_true_value ("true")
			if has_attribute (True_value_attribute_name) then
				a_value := attribute_value (True_value_attribute_name)
				if a_value.count > 0 then
					command.set_true_value (a_value)
				end
			end
			command.set_false_value ("false")
			if has_attribute (False_value_attribute_name) then
				a_value := attribute_value (False_value_attribute_name)
				if a_value.count > 0 then
					command.set_false_value (a_value)
				end
			end
			if has_attribute (Variable_attribute_name) then
				a_value := attribute_value (Variable_attribute_name)
				if a_value.count > 0 then
					command.set_variable_name (a_value)
				end
			end
		end

feature -- Access

	command: GEANT_AVAILABLE_COMMAND
			-- Available command

feature {NONE} -- Constants

	Resource_attribute_name: STRING is
			-- Name of xml attribute for resource
		once
			Result := "resource"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Variable_attribute_name: STRING is
			-- Name of xml attribute for variable
		once
			Result := "variable"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	True_value_attribute_name: STRING is
			-- Name of xml attribute for true_value
		once
			Result := "true_value"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	False_value_attribute_name: STRING is
			-- Name of xml attribute for false_value
		once
			Result := "false_value"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

end
