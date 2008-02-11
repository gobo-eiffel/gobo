indexing

	description:

		"Group element"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001-2005, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

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

	make (a_project: GEANT_PROJECT; a_xml_element: XM_ELEMENT) is
			-- Create a new target.
		do
			Precursor (a_project, a_xml_element)
			initialize
		end

	initialize is
			-- Initialize current Group
		local
			a_xml_element: XM_ELEMENT
			a_description_element: XM_ELEMENT
		do
			a_xml_element := xml_element

				-- description:
			a_description_element := a_xml_element.element_by_name (Description_element_name)
			if a_description_element /= Void then
				set_description (a_description_element.text)
			else
				set_description ("")
			end
		end

feature -- Access

	is_target: BOOLEAN is
			-- Is Current a GEANT_TARGET ?
		do
			Result := associated_target = Current
		end

	description: STRING
			-- Description of Current

	parent: GEANT_GROUP
			-- Parent group

	associated_target: GEANT_TARGET is
			-- Associated target
		do
			Result ?= parent
			if Result = Void and parent /= Void then
				Result := parent.associated_target
			end
		ensure
			target_not_void: Result /= Void
		end

feature -- Setting

	set_description (a_description: STRING) is
			-- Set `description' to `a_description'.
		require
			a_description_not_void: a_description /= Void
		do
			description := a_description
		ensure
			description_set: description = a_description
		end

	set_parent (a_parent: like parent) is
			-- Set `parent' to `a_parent'.
		require
			a_parent_not_void: a_parent /= Void
		do
			parent := a_parent
		ensure
			parent_set: parent = a_parent
		end

feature -- Processing

	execute is
			-- Execute all tasks of `Current' in sequential order.
		local
			a_old_cwd: STRING
			a_new_cwd: STRING
			a_string_interpreter: GEANT_STRING_INTERPRETER
		do
			if is_enabled then
					-- Change to the specified directory if "dir" attribute is provided:
				if xml_element.has_attribute_by_name (Dir_attribute_name) then
					create a_string_interpreter.make
					Project_variables_resolver.set_variables (project.variables)
					a_string_interpreter.set_variable_resolver (Project_variables_resolver)
					a_new_cwd := a_string_interpreter.interpreted_string (
						xml_element.attribute_by_name (Dir_attribute_name).value.out)

					project.trace_debug (<<"changing to directory: '", a_new_cwd, "%'">>)
					a_old_cwd := file_system.current_working_directory
					if not file_system.directory_exists (a_new_cwd) then
						exit_application (1, <<"target `", project.name, ".",
							project.target_name (associated_target), "%' : directory %'", a_new_cwd,
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
				if has_attribute (Dir_attribute_name) then
					project.trace_debug (<<"changing to directory: '", a_old_cwd, "%'">>)
					file_system.set_current_working_directory (a_old_cwd)
				end
			end
		end

feature {NONE} -- Execution implementation

	prepare_variables_before_execution is
			-- Prepare variables before tasks execution
		do
		end

	execute_nested_tasks is
			-- Process all elements from `xml_element'
		local
			l_xml_element: XM_ELEMENT
			cs: DS_LINKED_LIST_CURSOR [XM_NODE]
		do
			cs := xml_element.new_cursor
			from
				cs.start
			until
				cs.after or not is_enabled
			loop
				l_xml_element ?= cs.item
				if l_xml_element /= Void then
					if STRING_.same_string (l_xml_element.name, Group_element_name) then
						execute_group_element (l_xml_element)
					else
						execute_element (l_xml_element)
					end
				end
				cs.forth
			end
		end

	execute_group_element (a_xml_element: XM_ELEMENT) is
			-- Execute group element defined through `a_xml_element'.
		require
			a_xml_element_is_group: a_xml_element /= Void and then STRING_.same_string (a_xml_element.name, Group_element_name)
		local
			grp: GEANT_GROUP
		do
			create grp.make (project, a_xml_element)
			grp.set_parent (Current)
			if grp.is_enabled then
				project.trace_debug (<<"entering group from target: '", project.target_name (associated_target) , "%'">>)
				grp.execute
				project.trace_debug (<<"leaving group from target: '", project.target_name (associated_target) , "%'">>)
			end
		end

	execute_element (a_xml_element: XM_ELEMENT) is
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

	execute_task (a_xml_element: XM_ELEMENT) is
			-- Execute all task defined through `a_xml_element'.
		require
			a_xml_element_not_void: a_xml_element /= Void
		local
			a_task: GEANT_TASK
		do
			a_task := new_task (a_xml_element)

				-- Execute task:
			if a_task = Void then
				exit_application (1, <<"unknown task : ", a_xml_element.name>>)
			end
			if not a_task.is_executable then
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

	new_task (a_xml_element: XM_ELEMENT): GEANT_TASK is
			-- New GEANT_TASK for `a_xml_element'
		do
			if task_builders.has (a_xml_element.name) then
				Result := Task_builders.item (a_xml_element.name).new_task (project, a_xml_element)
			end
		end

	Task_builders: DS_HASH_TABLE [GEANT_TASK_BUILDER [GEANT_TASK], STRING] is
			-- Table of task builders
		once
			create Result.make_equal (30)

				-- gec: Gobo Eiffel compilation
			Result.force_last (create {GEANT_TASK_BUILDER [GEANT_GEC_TASK]}, Gec_task_name)
					-- se: SmartEiffel compilation
			Result.force_last (create {GEANT_TASK_BUILDER [GEANT_SE_TASK]}, Se_task_name)
					-- ise: ISE Eiffel compilation
			Result.force_last (create {GEANT_TASK_BUILDER [GEANT_ISE_TASK]}, Ise_task_name)
					-- ve: Visual Eiffel compilation
			Result.force_last (create {GEANT_TASK_BUILDER [GEANT_VE_TASK]}, Ve_task_name)
					-- exec
			Result.force_last (create {GEANT_TASK_BUILDER [GEANT_EXEC_TASK]}, Exec_task_name)
					-- lcc
			Result.force_last (create {GEANT_TASK_BUILDER [GEANT_LCC_TASK]}, Lcc_task_name)
					-- set
			Result.force_last (create {GEANT_TASK_BUILDER [GEANT_SET_TASK]}, Set_task_name)
					-- unset
			Result.force_last (create {GEANT_TASK_BUILDER [GEANT_UNSET_TASK]}, Unset_task_name)
					-- gexace
			Result.force_last (create {GEANT_TASK_BUILDER [GEANT_GEXACE_TASK]}, Gexace_task_name)
					-- gelex
			Result.force_last (create {GEANT_TASK_BUILDER [GEANT_GELEX_TASK]}, Gelex_task_name)
					-- geyacc
			Result.force_last (create {GEANT_TASK_BUILDER [GEANT_GEYACC_TASK]}, Geyacc_task_name)
					-- gepp
			Result.force_last (create {GEANT_TASK_BUILDER [GEANT_GEPP_TASK]}, Gepp_task_name)
					-- getest
			Result.force_last (create {GEANT_TASK_BUILDER [GEANT_GETEST_TASK]}, Getest_task_name)
					-- geant
			Result.force_last (create {GEANT_TASK_BUILDER [GEANT_GEANT_TASK]}, Geant_task_name)
					-- echo
			Result.force_last (create {GEANT_TASK_BUILDER [GEANT_ECHO_TASK]}, Echo_task_name)
					-- mkdir
			Result.force_last (create {GEANT_TASK_BUILDER [GEANT_MKDIR_TASK]}, Mkdir_task_name)
					-- delete
			Result.force_last (create {GEANT_TASK_BUILDER [GEANT_DELETE_TASK]}, Delete_task_name)
					-- copy
			Result.force_last (create {GEANT_TASK_BUILDER [GEANT_COPY_TASK]}, Copy_task_name)
					-- move
			Result.force_last (create {GEANT_TASK_BUILDER [GEANT_MOVE_TASK]}, Move_task_name)
					-- setenv
			Result.force_last (create {GEANT_TASK_BUILDER [GEANT_SETENV_TASK]}, Setenv_task_name)
					-- xslt
			Result.force_last (create {GEANT_TASK_BUILDER [GEANT_XSLT_TASK]}, Xslt_task_name)
					-- outofdate
			Result.force_last (create {GEANT_TASK_BUILDER [GEANT_OUTOFDATE_TASK]}, Outofdate_task_name)
					-- exit
			Result.force_last (create {GEANT_TASK_BUILDER [GEANT_EXIT_TASK]}, Exit_task_name)
					-- precursor
			Result.force_last (create {GEANT_TASK_BUILDER [GEANT_PRECURSOR_TASK]}, Precursor_task_name)
					-- available
			Result.force_last (create {GEANT_TASK_BUILDER [GEANT_AVAILABLE_TASK]}, Available_task_name)
					-- input
			Result.force_last (create {GEANT_TASK_BUILDER [GEANT_INPUT_TASK]}, Input_task_name)
					-- replace
			Result.force_last (create {GEANT_TASK_BUILDER [GEANT_REPLACE_TASK]}, Replace_task_name)
		end


feature {NONE} -- Constants

	Group_element_name: STRING is
			-- Name of xml subelement for group
		once
			Result := "group"
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

	Global_element_name: STRING is
			-- Name of xml subelement for globals
		once
			Result := "global"
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

	Local_element_name: STRING is
			-- Name of xml subelement for locals
		once
			Result := "local"
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

end
