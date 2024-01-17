note

	description:

		"Group element"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001-2018, Sven Ehrke and others"
	license: "MIT License"

class GEANT_GROUP

inherit

	GEANT_INTERPRETING_ELEMENT
		redefine
			make
		end

	KL_SHARED_EXCEPTIONS
		export {NONE} all end

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	GEANT_SHARED_PROPERTIES
		export {NONE} all end

	GEANT_ELEMENT_NAMES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT; a_xml_element: XM_ELEMENT)
			-- Create a new target.
		do
			Precursor (a_project, a_xml_element)
			initialize
		end

	initialize
			-- Initialize current Group
		local
			a_description_element: detachable XM_ELEMENT
		do
				-- description:
			a_description_element := xml_element.element_by_name (Description_element_name)
			if a_description_element /= Void and then attached a_description_element.text as l_text then
				set_description (l_text)
			else
				set_description ("")
			end
		end

feature -- Access

	is_target: BOOLEAN
			-- Is Current a GEANT_TARGET ?
		do
			Result := associated_target = Current
		end

	description: STRING
			-- Description of Current

	parent: detachable GEANT_GROUP
			-- Parent group

	associated_target: detachable GEANT_TARGET
			-- Associated target
		do
			if attached {GEANT_TARGET} parent as l_target_parent then
				Result := l_target_parent
			elseif attached parent as l_parent then
				Result := l_parent.associated_target
			end
		end

feature -- Setting

	set_description (a_description: STRING)
			-- Set `description' to `a_description'.
		require
			a_description_not_void: a_description /= Void
		do
			description := a_description
		ensure
			description_set: description = a_description
		end

	set_parent (a_parent: like parent)
			-- Set `parent' to `a_parent'.
		do
			parent := a_parent
		ensure
			parent_set: parent = a_parent
		end

feature -- Processing

	execute
			-- Execute all tasks of `Current' in sequential order.
		local
			a_old_cwd: detachable STRING
			a_new_cwd: STRING
			a_string_interpreter: GEANT_STRING_INTERPRETER
			l_target_name: STRING
		do
			if is_enabled then
					-- Change to the specified directory if "dir" attribute is provided:
				if attached xml_element.attribute_by_name (Dir_attribute_name) as l_dir_attribute then
					create a_string_interpreter.make
					Project_variables_resolver.set_variables (project.variables)
					a_string_interpreter.set_variable_resolver (Project_variables_resolver)
					a_new_cwd := a_string_interpreter.interpreted_string (
						l_dir_attribute.value.out)

					project.trace_debug (<<"changing to directory: '", a_new_cwd, "%'">>)
					a_old_cwd := file_system.current_working_directory
					if not file_system.directory_exists (a_new_cwd) then
						if attached associated_target as l_associated_target then
							l_target_name := project.target_name (l_associated_target)
						else
							l_target_name := ""
						end
						exit_application (1, <<"target `", project.name, ".",
							l_target_name, "%' : directory %'", a_new_cwd,
							"%' does not exist">>)
					end
					file_system.set_current_working_directory (a_new_cwd)
					project.trace_debug (<<"current working directory: '", file_system.current_working_directory, "%'">>)
				end

					-- Prepare variables before tasks execution
				prepare_variables_before_execution

					-- Execute nested tasks:
				execute_nested_tasks

					-- Change back to original directory before group was entered:
				if has_attribute (Dir_attribute_name) and a_old_cwd /= Void then
					project.trace_debug (<<"changing to directory: '", a_old_cwd, "%'">>)
					file_system.set_current_working_directory (a_old_cwd)
				end
			end
		end

feature {NONE} -- Execution implementation

	prepare_variables_before_execution
			-- Prepare variables before tasks execution
		do
		end

	execute_nested_tasks
			-- Process all elements from `xml_element'
		local
			cs: DS_LINKED_LIST_CURSOR [XM_NODE]
		do
			cs := xml_element.new_cursor
			from
				cs.start
			until
				cs.after or not is_enabled
			loop
				if attached {XM_ELEMENT} cs.item as l_xml_element then
					if STRING_.same_string (l_xml_element.name, Group_element_name) then
						execute_group_element (l_xml_element)
					else
						execute_element (l_xml_element)
					end
				end
				cs.forth
			end
		end

	execute_group_element (a_xml_element: XM_ELEMENT)
			-- Execute group element defined through `a_xml_element'.
		require
			a_xml_element_is_group: a_xml_element /= Void and then STRING_.same_string (a_xml_element.name, Group_element_name)
		local
			grp: GEANT_GROUP
			l_target_name: STRING
		do
			create grp.make (project, a_xml_element)
			grp.set_parent (Current)
			if grp.is_enabled then
				if attached associated_target as l_associated_target then
					l_target_name := project.target_name (l_associated_target)
				else
					l_target_name := ""
				end
				project.trace_debug (<<"entering group from target: '", l_target_name, "%'">>)
				grp.execute
				project.trace_debug (<<"leaving group from target: '", l_target_name, "%'">>)
			end
		end

	execute_element (a_xml_element: XM_ELEMENT)
			-- Execute  command defined through `a_xml_element'.
			-- except group
		require
			a_xml_element_not_void: a_xml_element /= Void
			a_xml_element_is_not_group: a_xml_element /= Void implies not STRING_.same_string (a_xml_element.name, Group_element_name)
		do
			if
				STRING_.same_string (a_xml_element.name, Local_element_name) or
				STRING_.same_string (a_xml_element.name, Global_element_name)
			then
				exit_application (1, <<"  [", a_xml_element.name ,"] error: <", a_xml_element.name ,"/> is not allowed inside <group/> element.">>)
				--| FIXME: try to allow local and global element in group ... later ...
			elseif
				not STRING_.same_string (a_xml_element.name, Description_element_name)
			then
				execute_task (a_xml_element)
			end
		end

	execute_task (a_xml_element: XM_ELEMENT)
			-- Execute all task defined through `a_xml_element'.
		require
			a_xml_element_not_void: a_xml_element /= Void
		local
			a_task: detachable GEANT_TASK
		do
			a_task := project.new_task (a_xml_element)

				-- Execute task:
			if a_task = Void then
				exit_application (1, <<"unknown task : ", a_xml_element.name>>)
			else
				if not a_task.is_executable then
					a_task.log_validation_messages
					exit_application (1, <<"cannot execute task : ", a_xml_element.name>>)
				end
				if a_task.is_enabled then
					a_task.execute
					if a_task.is_exit_command or a_task.exit_code /= 0 then
						exit_application (a_task.exit_code, Void)
					end
				else
					project.trace_debug (<<"task is disabled">>)
				end
			end
		end

feature {NONE} -- Constants

	Group_element_name: STRING
			-- Name of xml subelement for group
		once
			Result := "group"
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

	Global_element_name: STRING
			-- Name of xml subelement for globals
		once
			Result := "global"
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

	Local_element_name: STRING
			-- Name of xml subelement for locals
		once
			Result := "local"
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

invariant

	description_not_void: description /= Void

end
