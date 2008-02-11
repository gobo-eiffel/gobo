indexing

	description:

		"Input tasks"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2006, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_INPUT_TASK

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
			-- Create a new task with information held in `an_element'.
		local
			a_value: STRING
		do
			Precursor {GEANT_TASK} (a_project, an_xml_element)

				-- variable:
			if has_attribute (Variable_attribute_name) then
				a_value := attribute_value (Variable_attribute_name)
				if a_value.count > 0 then
					command.set_variable (a_value)
				end
			end
				-- value:
			if has_attribute (Message_attribute_name) then
				a_value := attribute_value (Message_attribute_name)
				command.set_message (a_value)
			end
				-- default answer:
			if has_attribute (Defaultvalue_attribute_name) then
				a_value := attribute_value (Defaultvalue_attribute_name)
				command.set_default_value (a_value)
			end
				-- Validargs:
			if has_attribute (Validargs_attribute_name) then
				a_value := attribute_value (Validargs_attribute_name)
				command.set_validargs (a_value)
			end
				-- Validregexp:
			if has_attribute (Validregexp_attribute_name) then
				a_value := attribute_value (Validregexp_attribute_name)
				command.set_validregexp (a_value)
			end
				-- Answer required:
			if has_attribute (Answer_required_attribute_name) then
				command.set_answer_required (boolean_value (Answer_required_attribute_name))
			end

		end

	build_command (a_project: GEANT_PROJECT) is
			-- Create instance of `command'
		do
			create command.make (a_project)
		end

feature -- Access

	command: GEANT_INPUT_COMMAND
			-- Input commands

feature {NONE} -- Constants

	Variable_attribute_name: STRING is
			-- "name" attribute name
		once
			Result := "variable"
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

	Message_attribute_name: STRING is
			-- Name of xml attribute for message
		once
			Result := "message"
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

	Defaultvalue_attribute_name: STRING is
			-- Name of xml attribute for defaultvalue
		once
			Result := "defaultvalue"
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

	Validargs_attribute_name: STRING is
			-- Name of xml attribute for validargs
		once
			Result := "validargs"
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

	Validregexp_attribute_name: STRING is
			-- Name of xml attribute for validregexp
		once
			Result := "validregexp"
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

	Answer_required_attribute_name: STRING is
			-- Name of xml attribute for answer_required
		once
			Result := "answer_required"
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

end
