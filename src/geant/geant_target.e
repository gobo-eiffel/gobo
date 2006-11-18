indexing

	description:

		"Target of geant build file"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001-2005, Sven Ehrke and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_TARGET

inherit

	GEANT_INTERPRETING_ELEMENT
		redefine
			make, valid_xml_element
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
		local
			a_tester: UC_STRING_EQUALITY_TESTER
			a_description_element: XM_ELEMENT
			a_obsolete_element: XM_ELEMENT
			a_exports: DS_ARRAYED_LIST [STRING]
			a_argument_elements: DS_LINKED_LIST [XM_ELEMENT]
			a_argument_element: GEANT_ARGUMENT_ELEMENT
			cs: DS_LINKED_LIST_CURSOR [XM_ELEMENT]
		do
			precursor (a_project, a_xml_element)

				-- name:
			if not a_xml_element.has_attribute_by_name (Name_attribute_name) then
				exit_application (1, <<"Element 'target' without attribute 'name' found.",
					" Make sure each target has an associated attribute 'name'.">>)
			end
			set_name (xml_element.attribute_by_name (Name_attribute_name).value)
				-- obsolete:
			a_obsolete_element := a_xml_element.element_by_name (Obsolete_element_name)
			if a_obsolete_element /= Void then
				set_obsolete_message (a_obsolete_element.text)
			end
				-- description:
			a_description_element := a_xml_element.element_by_name (Description_element_name)
			if a_description_element /= Void then
				set_description (a_description_element.text)
			else
				set_description ("")
			end

				-- export:
			if a_xml_element.has_attribute_by_name (Export_attribute_name) then
				a_exports := string_tokens (
					a_xml_element.attribute_by_name (Export_attribute_name).value, ',')
			else
				create a_exports.make (1)
				a_exports.put (Project_name_any, 1)
			end
			create a_tester
			a_exports.set_equality_tester (a_tester)
			set_exports (a_exports)

				-- once:
			if has_attribute (Once_attribute_name) then
				set_execute_once (boolean_value (Once_attribute_name))
			end

				-- formal arguments:
			formal_arguments := Empty_argument_variables
			a_argument_elements := elements_by_name (Argument_element_name)
			if a_argument_elements.count /= 0 then
				create formal_arguments.make
				cs := a_argument_elements.new_cursor
				from cs.start until cs.after loop
					create a_argument_element.make (cs.item)
					if a_argument_element.has_name and then a_argument_element.name.count > 0 then
						formal_arguments.force_last ("dummy_value", a_argument_element.name)
						project.trace_debug (<<"found formal argument '", a_argument_element.name, "'%N">>)
					end
					cs.forth
				end
			end

		end

feature -- Access

	dependencies: STRING is
			-- STRING representation of dependencies
		require
			has_dependencies: has_dependencies
		do
			Result := xml_element.attribute_by_name (Depend_attribute_name).value
		ensure
			dependencies_not_void: Result /= Void
		end

	name: STRING
			-- Name of target

	obsolete_message: STRING
			-- Obsolete message if any

	description: STRING
			-- Description of target

	exports: DS_ARRAYED_LIST [STRING]
			-- Exports of target

	origin: GEANT_PROJECT is
			-- Origin of target (see ETL for definition)
		do
			Result := seed.project
		ensure
			origin_not_void: Result /= Void
		end

	full_name: STRING is
			-- `Name' prepended with (`project.name' + ".")
		do
			Result := STRING_.cloned_string (project.name)
			Result.append_character ('.')
			Result := STRING_.appended_string (Result, name)
		ensure
			full_name_not_void: Result /= Void
			definition: STRING_.same_string (Result, STRING_.concat (STRING_.concat (project.name, "."), name))
		end

	precursor_target: like Current
			-- Precursor of current target if this target
			-- was redefined

	redefining_target: like Current
			-- Redefining target of current target if present;
			-- Used for polymorphic calls

	seed: like Current is
			-- Original version of this target in most remote ancestor
		do
			from
				Result := Current
			until
				Result.precursor_target = Void
			loop
				Result := Result.precursor_target
			end

		ensure
			seed_not_void: Result /= Void
			current_if_no_precursor_target: precursor_target = Void implies Result = Current
			seed_has_no_precursor: Result.precursor_target = Void
		end

	final_target: like Current is
			-- Final target of this target in redefinition chain
		do
			from
				Result := Current
			until
				Result.redefining_target = Void
			loop
				Result := Result.redefining_target
			end

		ensure
			final_target_not_void: Result /= Void
			current_if_no_redefining_target: redefining_target = Void implies Result = Current
			final_target_has_no_redefining_target: Result.redefining_target = Void
		end

	formal_arguments: GEANT_ARGUMENT_VARIABLES
			-- Formal arguments of this target

	prepared_arguments_from_formal_arguments (a_arguments: GEANT_ARGUMENT_VARIABLES): GEANT_ARGUMENT_VARIABLES is
			-- Prepared actual arguments arguments for `formal_arguments';
			-- Numbered arguments are replaced by their associated named arguments according
			-- to `formal_arguments';
			-- Application is terminated in case there is a mismatch between `a_arguments' and
			-- `formal_arguments'
		require
			a_arguments_not_void: a_arguments /= Void
			a_arguments_and_formals_have_same_count: a_arguments.count = formal_arguments.count
		do
				-- Default Result is `a_arguments' if nothing needs to be changed:
			Result := a_arguments
				-- Check that actual and formal arguments match:
			if a_arguments.count /= formal_arguments.count then
				exit_application (1, <<"  error: number of actual and formal arguments do not match for target '", name, "' (", a_arguments.count.out, " against ", formal_arguments.count.out, ")">>)
			end
			if a_arguments.has_numbered_keys then
				Result := named_from_numbered_arguments (a_arguments)
			end

			if not Result.has_same_keys (formal_arguments) then
				exit_application (1, <<"  error: actual and formal arguments do not match for target '", name, "'">>)
			end
		end

	named_from_numbered_arguments (a_arguments: GEANT_ARGUMENT_VARIABLES): GEANT_ARGUMENT_VARIABLES is
			-- Clone of `a_arguments' where number keys have been replaced by their
			-- corresponding names from `formal_arguments'
		require
			a_arguments_not_void: a_arguments /= Void
			a_arguments_and_formals_have_same_count: a_arguments.count = formal_arguments.count
			a_arguments_has_numbered_arguments: a_arguments.has_numbered_keys
		local
			csa: DS_HASH_TABLE_CURSOR [STRING, STRING]
			csf: DS_HASH_TABLE_CURSOR [STRING, STRING]
		do
			create Result.make

			csa := a_arguments.new_cursor
			csf :=formal_arguments.new_cursor
			csa.start
			csf.start
			from until csa.after loop
				Result.force_last (csa.item, csf.key)
				csa.forth
				csf.forth
			end
		end

feature -- Status report

	is_executed: BOOLEAN
			-- Was this target executed already?

	execute_once: BOOLEAN
			-- Is this target supposed to be executed only once?

	is_exported_to_any: BOOLEAN is
			-- Is this target exported to any project?
		do
			if exports /= Void then
				Result := exports.has (Project_name_any)
			end
		ensure
			definition: Result implies (exports /= Void and then exports.has (Project_name_any))
		end

	is_exported_to_project (a_project: GEANT_PROJECT): BOOLEAN is
			-- Is this target exported to project named `a_project_name'?
		require
			a_project_not_void: a_project /= Void
		local
			i, nb: INTEGER
			a_project_name: STRING
			an_export: STRING
		do
			if exports /= Void then
				a_project_name := a_project.name
				nb := exports.count
				from i := 1 until i > nb loop
					an_export := exports.item (i)
					if STRING_.same_string (a_project_name, an_export) then
						Result := True
						i := nb + 1 -- Jump out of the loop.
					elseif a_project.has_parent_with_name (an_export) then
						Result := True
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
			end
		end

	has_dependencies: BOOLEAN is
			-- Has current target dependent on other targets?
		do
			Result := xml_element.has_attribute_by_name (Depend_attribute_name)
		ensure
			definition: Result = xml_element.has_attribute_by_name (Depend_attribute_name)
		end

	valid_xml_element (an_xml_element: like xml_element): BOOLEAN is
			-- Is `an_xml_element' a valid xml element?
		do
			Result := an_xml_element.has_attribute_by_name (Name_attribute_name) and then
				an_xml_element.attribute_by_name (Name_attribute_name).value.count > 0
		ensure then
			has_name_attribute: Result implies an_xml_element.has_attribute_by_name (Name_attribute_name)
			has_non_empty_name_attribute: Result implies an_xml_element.attribute_by_name (Name_attribute_name).value.count > 0
		end

	conflicts_with (a_target: like Current): BOOLEAN is
			-- Does current target or one of it's precursors
			-- have a `full_name' which is equal to the `full_name'
			-- of `a_target' or one of it's precursors?
		require
			a_target_not_void: a_target /= Void
		do
			Result := STRING_.same_string (seed.full_name, a_target.seed.full_name)
		end

	formal_arguments_match (a_target: like Current): BOOLEAN is
			-- Does `formal_arguments' match `a_target.formal_arguments'?
		require
			a_target_not_void: a_target /= Void
		do
			Result := formal_arguments.has_same_keys (a_target.formal_arguments)
		end

	has_precursor_target (a_target: like Current): BOOLEAN is
			-- Is current target or one of it's precursors `a_target'?
		require
			a_target_not_void: a_target /= Void
		local
			a_precursor_target: like Current
		do
			from
				a_precursor_target := precursor_target
			until
				a_precursor_target = Void or else Result
			loop
				Result := a_precursor_target = a_target
				a_precursor_target := a_precursor_target.precursor_target
			end
		end

	has_redefining_target (a_target: like Current): BOOLEAN is
			-- Is current target or one of it's `redefining_target's `a_target'?
		require
			a_target_not_void: a_target /= Void
		local
			a_redefining_target: like Current
		do
			from
				a_redefining_target := redefining_target
			until
				a_redefining_target = Void or else Result
			loop
				Result := a_redefining_target = a_target
				a_redefining_target := a_redefining_target.redefining_target
			end
		end

feature -- Setting

	set_name (a_name: STRING) is
			-- Set `name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		do
			name := a_name
		ensure
			name_set: name = a_name
		end

	set_obsolete_message (a_obsolete_message: STRING) is
			-- Set `obsolete_message' to `a_obsolete_message'.
		require
			a_obsolete_message_not_void: a_obsolete_message /= Void
			a_obsolete_message_not_empty: a_obsolete_message.count > 0
		do
			obsolete_message := a_obsolete_message
		ensure
			obsolete_message_set: obsolete_message = a_obsolete_message
		end

	set_description (a_description: STRING) is
			-- Set `description' to `a_description'.
		require
			a_description_not_void: a_description /= Void
		do
			description := a_description
		ensure
			description_set: description = a_description
		end

	set_exports (a_exports: like exports) is
			-- Set `exports' to `a_exports'.
		require
			a_exports_not_void: a_exports /= Void
		do
			exports := a_exports
		ensure
			exports_set: exports = a_exports
		end

	set_executed (a_is_executed: BOOLEAN) is
			-- Set `is_executed' to `a_is_executed'.
		do
			is_executed := a_is_executed
		ensure
			is_executed_set: is_executed = a_is_executed
		end

	set_execute_once (a_execute_once: BOOLEAN) is
			-- Set `execute_once' to `a_execute_once'.
		do
			execute_once := a_execute_once
		ensure
			execute_once_set: execute_once = a_execute_once
		end

	set_precursor_target (a_precursor_target: GEANT_TARGET) is
			-- Set `precursor_target' to `a_precursor_target'.
		require
			a_precursor_target_not_void: a_precursor_target /= Void
			a_precursor_target_not_current: a_precursor_target /= Current
			no_circular_target_chain: not a_precursor_target.has_precursor_target (Current)
		do
			precursor_target := a_precursor_target
		ensure
			precursor_target_set: precursor_target = a_precursor_target
		end

	set_redefining_target (a_redefining_target: GEANT_TARGET) is
			-- Set `redefining_target' to `a_redefining_target'.
		require
			a_redefining_target_not_void: a_redefining_target /= Void
			a_redefining_target_not_current: a_redefining_target /= Current
			no_circular_target_chain: not a_redefining_target.has_redefining_target (Current)
		do
			redefining_target := a_redefining_target
		ensure
			redefining_target_set: redefining_target = a_redefining_target
		end

feature -- Processing

	show_precursors is
			-- Show list of precursors.
		local
			a_precursor_target: like Current
			a_message: ARRAY [STRING]
		do
			from
				a_precursor_target := Current
				create a_message.make (1, 1)
				a_message.put ("    precursor list: ", 1)
			until
				a_precursor_target = Void
			loop
				a_message.force ("'", a_message.count + 1)
				a_message.force (a_precursor_target.full_name, a_message.count + 1)
				a_message.force ("'", a_message.count + 1)
				a_precursor_target := a_precursor_target.precursor_target
				if a_precursor_target /= Void then
					a_message.force (", ", a_message.count + 1)
				end
			end
			project.trace_debug (a_message)
		end

	execute is
			-- Execute all tasks of `a_target' in sequential order.
		local
			a_xml_element: XM_ELEMENT
			a_old_target_cwd: STRING
			a_new_target_cwd: STRING
			cs: DS_LINKED_LIST_CURSOR [XM_NODE]
			a_string_interpreter: GEANT_STRING_INTERPRETER
			a_arguments: GEANT_ARGUMENT_VARIABLES
		do
			if not execute_once or else not is_executed then
				if is_enabled then
					if project.options.verbose then
						project.trace (<<"">>)
						project.trace (<<project.name, ".", project.target_name (Current), ":">>)
						project.trace (<<"">>)
					end
					if obsolete_message /= Void then
						project.log (<<"target `", project.name, ".", project.target_name (Current), "%' is obsolete. ", obsolete_message>>)
					end
						-- Change to the specified directory if "dir" attribute is provided:
					if xml_element.has_attribute_by_name (Dir_attribute_name) then
						create a_string_interpreter.make
						Project_variables_resolver.set_variables (project.variables)
						a_string_interpreter.set_variable_resolver (Project_variables_resolver)
						a_new_target_cwd := a_string_interpreter.interpreted_string (
							xml_element.attribute_by_name (Dir_attribute_name).value.out)

						project.trace_debug (<<"changing to directory: '", a_new_target_cwd, "%'">>)
						a_old_target_cwd := file_system.current_working_directory
						if not file_system.directory_exists (a_new_target_cwd) then
							exit_application (1, <<"target `", project.name, ".",
								project.target_name (Current), "%': directory %'", a_new_target_cwd,
								"%' does not exist">>)
						end
						file_system.set_current_working_directory (a_new_target_cwd)
						project.trace_debug (<<"current working directory: '", file_system.current_working_directory, "%'">>)
					end

						-- Prepare arguments:
					a_arguments := target_arguments_stack.item
					target_arguments_stack.remove
					a_arguments := prepared_arguments_from_formal_arguments (a_arguments)
					target_arguments_stack.force (a_arguments)

						-- Execute nested tasks:
					cs := xml_element.new_cursor
					from
						cs.start
					until
						cs.after or not is_enabled
					loop
						a_xml_element ?= cs.item
						if a_xml_element /= Void then
							if not STRING_.same_string (a_xml_element.name, Description_element_name) and then
								not STRING_.same_string (a_xml_element.name, Argument_element_name) and then
								not STRING_.same_string (a_xml_element.name, Obsolete_element_name) then
								execute_task (a_xml_element)
							end
						end
						cs.forth
					end
						-- Change back to original directory before target was entered:
					if has_attribute (Dir_attribute_name) then
						project.trace_debug (<<"changing to directory: '", a_old_target_cwd, "%'">>)
						file_system.set_current_working_directory (a_old_target_cwd)
					end
						-- Mark target as already executed:
					set_executed (True)
				end
			end
		end

	execute_task (a_xml_element: XM_ELEMENT) is
			-- Execute all task defined through `a_xml_element'.
		require
			a_xml_element_not_void: a_xml_element /= Void
		local
			a_task: GEANT_TASK
		do
			if STRING_.same_string (a_xml_element.name, Gec_task_name) then
					-- gec: Gobo Eiffel compilation
				create {GEANT_GEC_TASK} a_task.make (project, a_xml_element)
			elseif STRING_.same_string (a_xml_element.name, Se_task_name) then
					-- se: SmartEiffel compilation
				create {GEANT_SE_TASK} a_task.make (project, a_xml_element)
			elseif STRING_.same_string (a_xml_element.name, Ise_task_name) then
					-- ise: ISE Eiffel compilation
				create {GEANT_ISE_TASK} a_task.make (project, a_xml_element)
			elseif STRING_.same_string (a_xml_element.name, Ve_task_name) then
					-- ve: Visual Eiffel compilation
				create {GEANT_VE_TASK} a_task.make (project, a_xml_element)
			elseif STRING_.same_string (a_xml_element.name, Exec_task_name) then
					-- exec
				create {GEANT_EXEC_TASK} a_task.make (project, a_xml_element)
			elseif STRING_.same_string (a_xml_element.name, Lcc_task_name) then
					-- lcc
				create {GEANT_LCC_TASK} a_task.make (project, a_xml_element)
			elseif STRING_.same_string (a_xml_element.name, Set_task_name) then
					-- set
				create {GEANT_SET_TASK} a_task.make (project, a_xml_element)
			elseif STRING_.same_string (a_xml_element.name, Unset_task_name) then
					-- unset
				create {GEANT_UNSET_TASK} a_task.make (project, a_xml_element)
			elseif STRING_.same_string (a_xml_element.name, Gexace_task_name) then
					-- gexace
				create {GEANT_GEXACE_TASK} a_task.make (project, a_xml_element)
			elseif STRING_.same_string (a_xml_element.name, Gelex_task_name) then
					-- gelex
				create {GEANT_GELEX_TASK} a_task.make (project, a_xml_element)
			elseif STRING_.same_string (a_xml_element.name, Geyacc_task_name) then
					-- geyacc
				create {GEANT_GEYACC_TASK} a_task.make (project, a_xml_element)
			elseif STRING_.same_string (a_xml_element.name, Gepp_task_name) then
					-- gepp
				create {GEANT_GEPP_TASK} a_task.make (project, a_xml_element)
			elseif STRING_.same_string (a_xml_element.name, Getest_task_name) then
					-- getest
				create {GEANT_GETEST_TASK} a_task.make (project, a_xml_element)
			elseif STRING_.same_string (a_xml_element.name, Geant_task_name) then
					-- geant
				create {GEANT_GEANT_TASK} a_task.make (project, a_xml_element)
			elseif STRING_.same_string (a_xml_element.name, Gexmlsplit_task_name) then
					-- gexmlsplit
				create {GEANT_GEXMLSPLIT_TASK} a_task.make (project, a_xml_element)
			elseif STRING_.same_string (a_xml_element.name, Echo_task_name) then
					-- echo
				create {GEANT_ECHO_TASK} a_task.make (project, a_xml_element)
			elseif STRING_.same_string (a_xml_element.name, Mkdir_task_name) then
					-- mkdir
				create {GEANT_MKDIR_TASK} a_task.make (project, a_xml_element)
			elseif STRING_.same_string (a_xml_element.name, Delete_task_name) then
					-- delete
				create {GEANT_DELETE_TASK} a_task.make (project, a_xml_element)
			elseif STRING_.same_string (a_xml_element.name, Copy_task_name) then
					-- copy
				create {GEANT_COPY_TASK} a_task.make (project, a_xml_element)
			elseif STRING_.same_string (a_xml_element.name, Move_task_name) then
					-- move
				create {GEANT_MOVE_TASK} a_task.make (project, a_xml_element)
			elseif STRING_.same_string (a_xml_element.name, Setenv_task_name) then
					-- setenv
				create {GEANT_SETENV_TASK} a_task.make (project, a_xml_element)
			elseif STRING_.same_string (a_xml_element.name, Xslt_task_name) then
					-- xslt
				create {GEANT_XSLT_TASK} a_task.make (project, a_xml_element)
			elseif STRING_.same_string (a_xml_element.name, Outofdate_task_name) then
					-- outofdate
				create {GEANT_OUTOFDATE_TASK} a_task.make (project, a_xml_element)
			elseif STRING_.same_string (a_xml_element.name, Exit_task_name) then
					-- exit
				create {GEANT_EXIT_TASK} a_task.make (project, a_xml_element)
			elseif STRING_.same_string (a_xml_element.name, Precursor_task_name) then
					-- precursor
				create {GEANT_PRECURSOR_TASK} a_task.make (project, a_xml_element)
			elseif STRING_.same_string (a_xml_element.name, Available_task_name) then
					-- available
				create {GEANT_AVAILABLE_TASK} a_task.make (project, a_xml_element)
			elseif STRING_.same_string (a_xml_element.name, Input_task_name) then
					-- input
				create {GEANT_INPUT_TASK} a_task.make (project, a_xml_element)
			elseif STRING_.same_string (a_xml_element.name, Replace_task_name) then
					-- replace
				create {GEANT_REPLACE_TASK} a_task.make (project, a_xml_element)
			else
					-- Default:
				a_task := Void
			end
				-- Execute task:
			if a_task = Void then
				exit_application (1, <<"unknown task : ", a_xml_element.name>>)
			end
			if not a_task.is_executable then
				exit_application (1, <<"cannot execute task : ", a_xml_element.name>>)
			end
			if a_task.is_enabled then
				a_task.execute
				if a_task.exit_code /= 0 then
					exit_application (a_task.exit_code, Void)
				end
			else
				project.trace_debug (<<"task is disabled">>)
			end

		end

	dependent_targets: DS_ARRAYED_STACK [GEANT_TARGET] is
			-- All dependent targets
		local
			a_dependent_target: GEANT_TARGET
			a_value: STRING
			a_dependent_targets: DS_ARRAYED_LIST [STRING]
			i: INTEGER
		do
			create Result.make (10)
			if has_dependencies then
					-- Check for targets separated by commas:
				a_dependent_targets := string_tokens (dependencies, ',')
				if project.options.debug_mode then
					show_dependent_targets (a_dependent_targets)
				end
					-- Find all targets.
				from i := 1 until i > a_dependent_targets.count loop
					a_value := a_dependent_targets.item (i)
					if project.targets.has (a_value) then
						a_dependent_target := project.targets.item (a_value).final_target
						Result.force (a_dependent_target)
					else
						exit_application (1, <<"geant error: unknown dependent target '", a_value, "%'">>)
					end
					i := i + 1
				end
			end
		ensure
			dependent_targets_not_void: Result /= Void
		end

	show_dependent_targets (a_dependent_targets: DS_ARRAYED_LIST [STRING]) is
			-- Show dependent targets.
		local
			i: INTEGER
		do
			std.output.put_line ("======= DEPENDENCIES ==========")
			from i := 1 until i > a_dependent_targets.count loop
				std.output.put_line (a_dependent_targets.item (i))
				i := i + 1
			end
			std.output.put_line ("=================")
		end

feature {NONE} -- Constants

	Obsolete_element_name: STRING is
			-- Name of xml subelement for obsolete
		once
			Result := "obsolete"
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

	Argument_element_name: STRING is
			-- Name of xml subelement for arguments
		once
			Result := "argument"
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

	Name_attribute_name: STRING is
			-- "name" attribute name
		once
			Result := "name"
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

	Depend_attribute_name: STRING is
			-- "depend" attribute name
		once
			Result := "depend"
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

	Export_attribute_name: STRING is
			-- "export" attribute name
		once
			Result := "export"
		ensure
			export_name_not_void: Result /= Void
			export_name_not_empty: Result.count > 0
		end

	Once_attribute_name: STRING is
			-- "once" attribute name
		once
			Result := "once"
		ensure
			once_name_not_void: Result /= Void
			once_name_not_empty: Result.count > 0
		end

	Project_name_any: STRING is
			-- Project name "ANY"
		once
			Result := "ANY"
		ensure
			Project_name_any_not_void: Result /= Void
			Project_name_any_not_empty: Result.count > 0
		end

invariant

	no_void_export: exports /= Void implies not exports.has (Void)

end
