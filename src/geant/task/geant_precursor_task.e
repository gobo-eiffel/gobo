indexing

	description:

		"Precursor tasks"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2002, Sven Ehrke and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_PRECURSOR_TASK

inherit

	GEANT_TASK
		rename
			make as task_make
		redefine
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
			a_argument_elements: DS_LINKED_LIST [XM_ELEMENT]
			a_argument_element: GEANT_DEFINE_ELEMENT
			cs: DS_LINKED_LIST_CURSOR [XM_ELEMENT]
			a_arg_cs: DS_LIST_CURSOR [STRING]
			a_string_list: DS_LIST [STRING]
			i: INTEGER
		do
			create command.make (a_project)
			task_make (command, an_xml_element)

				-- parent:
			if has_attribute (Parent_attribute_name) then
				a_value := attribute_value (Parent_attribute_name)
				command.set_parent (a_value)
			end

				-- actual arguments:
			a_argument_elements := elements_by_name (Argument_element_name)
			if has_attribute (Arguments_attribute_name) then
					-- Check that subelement 'argument''s are not specified too:
				if a_argument_elements.count > 0 then
					exit_application (1, <<"  [precursor]: error: Usage of both, attribute 'arguments' and subelements 'argument' is not allowed.">>)
				end

				a_value := attribute_value (Arguments_attribute_name)
				a_string_list := Arguments_string_splitter.split (a_value)
				a_arg_cs := a_string_list.new_cursor
				i := 1
				from a_arg_cs.start until a_arg_cs.after loop
					command.arguments.force_last (a_arg_cs.item, i.out)
					project.trace_debug (<<"  [precursor]: found actual (terse) argument. Value: '", a_arg_cs.item, "'%N">>)
					i := i + 1
					a_arg_cs.forth
				end
			else
				cs := a_argument_elements.new_cursor
				from cs.start until cs.after loop
					create a_argument_element.make (project, cs.item)
					if a_argument_element.has_name and then a_argument_element.name.count > 0 then
						if command.arguments.has (a_argument_element.name) then
							exit_application (1, <<"  [precursor]: error: duplicate definition for argument '", a_argument_element.name, "'">>)
						end
						command.arguments.force_last (a_argument_element.value, a_argument_element.name)
						project.trace_debug (<<"  [precursor]: found actual argument '", a_argument_element.name, "'%N">>)
					end
					cs.forth
				end
			end
		end

feature -- Access

	command: GEANT_PRECURSOR_COMMAND
			-- Precursor command

feature {NONE} -- Constants

	Parent_attribute_name: STRING is
			-- Name of xml attribute parent.
		once
			Result := "parent"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
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

end
