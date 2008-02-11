indexing

	description:

		"Geant tasks"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_GEANT_TASK

inherit

	GEANT_TASK
		redefine
			make,
			build_command,
			command
		end

	GEANT_SHARED_PROPERTIES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT; an_xml_element: XM_ELEMENT) is
			-- Create a new task with information held in `an_element'.
		local
			a_value: STRING
			a_xml_subelement: XM_ELEMENT
			a_fs_element: GEANT_FILESET_ELEMENT
			a_argument_elements: DS_LINKED_LIST [XM_ELEMENT]
			a_argument_element: GEANT_DEFINE_ELEMENT
			cs: DS_LINKED_LIST_CURSOR [XM_ELEMENT]
			a_arg_cs: DS_LIST_CURSOR [STRING]
			a_string_list: DS_LIST [STRING]
			i: INTEGER
		do
			Precursor {GEANT_TASK} (a_project, an_xml_element)

				-- start target:
			if has_attribute (Start_target_attribute_name) then
				a_value := attribute_value (Start_target_attribute_name)
				if a_value.count > 0 then
					command.set_start_target_name (a_value)
				end
			end
				-- reuse_variables:
			if has_attribute (Reuse_variables_attribute_name) then
				command.set_reuse_variables (boolean_value (Reuse_variables_attribute_name))
			end
				-- filename:
			if has_attribute (Filename_attribute_name) then
				a_value := attribute_value (Filename_attribute_name)
				if a_value.count > 0 then
					command.set_filename (a_value)
				end
					-- Set default value for `fork':
				command.set_fork (True)
			else
					-- Set default value for `fork':
				command.set_fork (False)
			end
				-- fileset:
			a_xml_subelement := xml_element.element_by_name (Fileset_element_name)
			if a_xml_subelement /= Void then
				create a_fs_element.make (project, a_xml_subelement)
				command.set_fileset (a_fs_element.fileset)
			end
				-- fork:
			if has_attribute (Fork_attribute_name) then
				command.set_fork (boolean_value (Fork_attribute_name))
			end

				-- exit_code_variable:
			if has_attribute (Exit_code_variable_attribute_name) then
				a_value := attribute_value (Exit_code_variable_attribute_name)
				if a_value.count > 0 then
					command.set_exit_code_variable_name (a_value)
				end
			end

				-- actual arguments:
			a_argument_elements := elements_by_name (Argument_element_name)
			if has_attribute (Arguments_attribute_name) then
					-- Check that subelement 'argument''s are not specified too:
				if a_argument_elements.count > 0 then
					exit_application (1, <<"  [geant]: error: Usage of both, attribute 'arguments' and subelements 'argument' is not allowed.">>)
				end

				a_value := attribute_value (Arguments_attribute_name)
				a_string_list := Arguments_string_splitter.split (a_value)
				a_arg_cs := a_string_list.new_cursor
				i := 1
				from a_arg_cs.start until a_arg_cs.after loop
					command.arguments.force_last (a_arg_cs.item, i.out)
					project.trace_debug (<<"  [geant]: found actual (terse) argument. Value: '", a_arg_cs.item, "'%N">>)
					i := i + 1
					a_arg_cs.forth
				end
			else
				cs := a_argument_elements.new_cursor
				from cs.start until cs.after loop
					create a_argument_element.make (project, cs.item)
					if a_argument_element.has_name and then a_argument_element.name.count > 0 then
						if command.arguments.has (a_argument_element.name) then
							exit_application (1, <<"  [geant]: error: duplicate definition for argument '", a_argument_element.name, "'">>)
						end
						command.arguments.force_last (a_argument_element.value, a_argument_element.name)
						project.trace_debug (<<"  [geant]: found actual argument '", a_argument_element.name, "'%N">>)
					end
					cs.forth
				end
			end
		end

	build_command (a_project: GEANT_PROJECT) is
			-- Create instance of `command'
		do
			create command.make (a_project)
		end

feature -- Access

	command: GEANT_GEANT_COMMAND
			-- Getest commands

feature {NONE} -- Constants

	Filename_attribute_name: STRING is
			-- Name of xml attribute filename.
		once
			Result := "file"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Start_target_attribute_name: STRING is
			-- Name of xml attribute Start_target.
		once
			Result := "target"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Reuse_variables_attribute_name: STRING is
			-- Name of xml attribute reuse_variables.
		once
			Result := "reuse_variables"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Fork_attribute_name: STRING is
			-- Name of xml attribute fork.
		once
			Result := "fork"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Fileset_element_name: STRING is
			-- Name of xml subelement for fileset
		once
			Result := "fileset"
		ensure
			element_name_not_void: Result /= Void
			element_name_not_empty: Result.count > 0
		end

	Argument_element_name: STRING is
			-- Name of xml subelement for arguments
		once
			Result := "argument"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Arguments_attribute_name: STRING is
			-- "arguments" attribute name
		once
			Result := "arguments"
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

	Exit_code_variable_attribute_name: STRING is
			-- Name of xml attribute exit_code_variable.
		once
			Result := "exit_code_variable"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

end
