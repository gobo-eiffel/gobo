note

	description:

		"Geant Tasks using a XML definitions"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001-2008, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_TASK

inherit

	GEANT_INTERPRETING_ELEMENT
		rename
			make as interpreting_element_make
		end

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

feature {NONE} -- Initialization

	make (a_project: like project; an_xml_element: XM_ELEMENT) is
			-- Create new GEANT_INTERPRETING_ELEMENT from `a_project' and `an_xml_element'.
		require
			a_project_not_void: a_project /= Void
			an_xml_element_not_void: an_xml_element /= Void
		do
			build_command (a_project)
			make_with_command (command, an_xml_element)
			command.log_validation_messages_agent_cell.put (agent log_validation_messages)
		end

	make_from_interpreting_element (a_ie: GEANT_INTERPRETING_ELEMENT) is
			-- Create new GEANT_INTERPRETING_ELEMENT from `a_ie'.
		require
			a_ie_not_void: a_ie /= Void
		do
			make (a_ie.project, a_ie.xml_element)
		end

	make_with_command (a_command: like command; a_xml_element: XM_ELEMENT) is
			-- Create new task with information held in `an_element'.
		require
			a_command_not_void: a_command /= Void
			a_xml_element_not_void: a_xml_element /= Void
		do
			set_command (a_command)
			interpreting_element_make (a_command.project, a_xml_element)
		end

	build_command (a_project: GEANT_PROJECT) is
			-- Create instance of `command'
		require
			a_project_not_void: a_project /= Void
		do
			-- To be implemented
			check not_yet_implemented: False end
		ensure
			command_instanciated: command /= Void
		end

feature -- Access

	command: GEANT_COMMAND
			-- Geant command to perform current task

feature -- Status report

	is_executable: BOOLEAN is
			-- Can task be executed?
		do
			Result := command.is_executable
		end

	exit_code: INTEGER is
			-- Exit code of last execution
		do
			Result := command.exit_code
		end

	is_exit_command: BOOLEAN is
			-- Is associated command the exit command?
		do
			Result := command.is_exit_command
		end

feature -- Setting

	set_command (a_command: like command) is
			-- Set `command' to `a_command'.
		do
			command := a_command
		ensure
			command_set: command = a_command
		end

feature -- Execution

	execute is
			-- Execute command.
		require
			is_executable: is_executable
		local
			a_old_task_cwd: STRING
			a_new_task_cwd: STRING
			a_string_interpreter: GEANT_STRING_INTERPRETER
		do
			a_old_task_cwd := file_system.current_working_directory
				-- Change to task directory if "dir" attribute is provided:
			if xml_element.has_attribute_by_name (Dir_attribute_name) then
				a_new_task_cwd := xml_element.attribute_by_name (Dir_attribute_name).value
				create a_string_interpreter.make
				a_string_interpreter.set_variable_resolver (Project_variables_resolver)
				a_new_task_cwd := a_string_interpreter.interpreted_string (a_new_task_cwd)
				project.trace_debug (<<"changing to directory: '", a_new_task_cwd, "%'">>)
				if not file_system.directory_exists (a_new_task_cwd) then
					exit_application (1, <<"directory %'", a_new_task_cwd, "%' does not exist">>)
				end
				file_system.set_current_working_directory (a_new_task_cwd)
			end
			command.execute
				-- Change back to previous directory even if "dir" attribute
				-- was not provided since the command itself might have changed
				-- the current working directory:
			project.trace_debug (<<"changing to directory: '", a_old_task_cwd, "%'">>)
			file_system.set_current_working_directory (a_old_task_cwd)
		end

feature -- Errorhandling

	log_validation_messages is
			-- Log entries in validation_messages'.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [STRING]
		do
			if position /= Void then
				project.log (<<"ERROR AT: ", position.source_name, " (", position.row.out, ":", position.column.out, ")">>)
			else
				project.log (<<"ERROR:%N">>)
			end
			a_cursor := validation_messages.new_cursor
			from a_cursor.start until a_cursor.after loop
				project.log (<<"  ", a_cursor.item>>)
				a_cursor.forth
			end
		end

end
