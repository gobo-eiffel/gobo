indexing

	description:

		"Target of geant build file"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"


class GEANT_TARGET

inherit

	GEANT_INTERPRETING_ELEMENT
		redefine
			make, valid_xml_element
		end

	KL_SHARED_EXCEPTIONS
		export
			{NONE} all
		end

	KL_SHARED_FILE_SYSTEM
		export
			{NONE} all
		end

	GEANT_SHARED_PROPERTIES
		export
			{NONE} all
		end

	GEANT_ELEMENT_NAMES
		export
			{NONE} all
		end

creation

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT; a_xml_element: XM_ELEMENT) is
			-- Create a new target
		do
			precursor (a_project, a_xml_element)
			set_name (xml_element.attribute_by_name (Name_attribute_name).value.out)
		end

feature -- Access

	dependencies: UC_STRING is
			-- UC_STRING representation of dependencies
		require
			has_dependencies: has_dependencies
		do
			Result := xml_element.attribute_by_name (Depend_attribute_name).value
		ensure
			dependencies_not_void: Result /= Void
		end

	name: STRING
			-- Name of target

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
			Result := clone (project.name)
			Result.append_string (".")
			Result.append_string (name)
		ensure
			full_name_not_void: Result /= Void
			definition: Result.is_equal (project.name + "." + name)
		end

	precursor_target: like Current
			-- Precursor of current target if this target
			-- was redefined

	redefining_target: like Current
			-- Redefining target of current target if present;
			-- Used for polymorphic calls

	seed: like Current is
			-- The original version of this target in most remote ancestor
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

feature -- Status report

	is_executed: BOOLEAN
			-- Was this target executed already?

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
				an_xml_element.attribute_by_name (Name_attribute_name).value.out.count > 0
		ensure then
			has_name_attribute: Result implies an_xml_element.has_attribute_by_name (Name_attribute_name)
			has_non_empty_name_attribute: Result implies an_xml_element.attribute_by_name (Name_attribute_name).value.out.count > 0
		end

	conflicts_with (a_target: like Current): BOOLEAN is
			-- Does current target or one of it's precursors
			-- have a `full_name' which is equal to the `full_name'
			-- of `a_target' or one of it's precursors?
		require
			a_target_not_void: a_target /= Void
		do
			Result := seed.full_name.is_equal (a_target.seed.full_name)
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

	set_executed (a_is_executed: BOOLEAN) is
			-- Set `is_executed' to `a_is_executed'.
		do
			is_executed := a_is_executed
		ensure
			is_executed_set: is_executed = a_is_executed
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
		do
			from
				a_precursor_target := Current
				project.trace_debug ("    precursor list: ")
			until
				a_precursor_target = Void
			loop
				project.trace_debug ("'" + a_precursor_target.full_name + "'")
				a_precursor_target := a_precursor_target.precursor_target
				if a_precursor_target /= Void then
					project.trace_debug (", ")
				end
			end
			project.trace_debug ("%N")
		end

	execute is
			-- Execute all tasks of `a_target' in sequential order
		local
			a_xml_element: XM_ELEMENT
			a_old_target_cwd: STRING
			a_new_target_cwd: STRING
			a_msg: STRING
			cs: DS_LINKED_LIST_CURSOR [XM_NODE]
		do
			if is_enabled then
				if project.options.verbose then
					a_msg := clone ("%N")
					a_msg.append_string (project.name)
					a_msg.append_string (".")
					a_msg.append_string (project.target_name (Current))

					a_msg.append_string (":%N%N")
					project.trace (a_msg)
				end
					-- change to the specified directory if "dir" attribute is provided:
				if xml_element.has_attribute_by_name (Dir_attribute_name) then
					a_new_target_cwd := project.variables.interpreted_string (
						xml_element.attribute_by_name (Dir_attribute_name).value.out)
					project.trace_debug ("changing to directory: '" + a_new_target_cwd + "'%N")
					a_old_target_cwd := file_system.current_working_directory
					file_system.set_current_working_directory (a_new_target_cwd)
				end

				from
					cs := xml_element.new_cursor
					cs.start
				until
					cs.off or not is_enabled
				loop
					a_xml_element ?= cs.item
					if a_xml_element /= Void then
						if not a_xml_element.name.is_equal (Description_element_name) then
							execute_task (a_xml_element)
						end
					end
					cs.forth
				end

				if has_uc_attribute (Dir_attribute_name) then
					project.trace_debug ("changing to directory: '" + a_old_target_cwd + "'%N")
					file_system.set_current_working_directory (a_old_target_cwd)
				end
		
				set_executed (True)
			end
		end

	execute_task (a_xml_element: XM_ELEMENT) is
			-- Execute all task defined through `a_xml_element'
		require
			a_xml_element_not_void: a_xml_element /= Void
		local
			a_task: GEANT_TASK
		do
			if a_xml_element.name.is_equal (Se_task_name) then
					-- se: SmallEiffel compilation
				!GEANT_SE_TASK! a_task.make (project, a_xml_element)
			elseif a_xml_element.name.is_equal (Ise_task_name) then
					-- ise: ISE Eiffel compilation
				!GEANT_ISE_TASK! a_task.make (project, a_xml_element)
			elseif a_xml_element.name.is_equal (Hact_task_name) then
					-- hact: Halstenbach Eiffel compilation
				!GEANT_HACT_TASK! a_task.make (project, a_xml_element)
			elseif a_xml_element.name.is_equal (Ve_task_name) then
					-- ve: Visual Eiffel compilation
				!GEANT_VE_TASK! a_task.make (project, a_xml_element)
			elseif a_xml_element.name.is_equal (Exec_task_name) then
					-- exec
				!GEANT_EXEC_TASK! a_task.make (project, a_xml_element)
			elseif a_xml_element.name.is_equal (Lcc_task_name) then
					-- lcc
				!GEANT_LCC_TASK! a_task.make (project, a_xml_element)
			elseif a_xml_element.name.is_equal (Set_task_name) then
					-- set
				!GEANT_SET_TASK! a_task.make (project, a_xml_element)
			elseif a_xml_element.name.is_equal (Unset_task_name) then
					-- unset
				!GEANT_UNSET_TASK! a_task.make (project, a_xml_element)
			elseif a_xml_element.name.is_equal (Gexace_task_name) then
					-- gexace
				!GEANT_GEXACE_TASK! a_task.make (project, a_xml_element)
			elseif a_xml_element.name.is_equal (Gelex_task_name) then
					-- gelex
				!GEANT_GELEX_TASK! a_task.make (project, a_xml_element)
			elseif a_xml_element.name.is_equal (Geyacc_task_name) then
					-- geyacc
				!GEANT_GEYACC_TASK! a_task.make (project, a_xml_element)
			elseif a_xml_element.name.is_equal (Gepp_task_name) then
					-- gepp
				!GEANT_GEPP_TASK! a_task.make (project, a_xml_element)
			elseif a_xml_element.name.is_equal (Getest_task_name) then
					-- getest
				!GEANT_GETEST_TASK! a_task.make (project, a_xml_element)
			elseif a_xml_element.name.is_equal (Geant_task_name) then
					-- geant
				!GEANT_GEANT_TASK! a_task.make (project, a_xml_element)
			elseif a_xml_element.name.is_equal (Gexmlsplit_task_name) then
					-- gexmlsplit
				!GEANT_GEXMLSPLIT_TASK! a_task.make (project, a_xml_element)
			elseif a_xml_element.name.is_equal (Echo_task_name) then
					-- echo
				!GEANT_ECHO_TASK! a_task.make (project, a_xml_element)
			elseif a_xml_element.name.is_equal (Mkdir_task_name) then
					-- mkdir
				!GEANT_MKDIR_TASK! a_task.make (project, a_xml_element)
			elseif a_xml_element.name.is_equal (Delete_task_name) then
					-- delete
				!GEANT_DELETE_TASK! a_task.make (project, a_xml_element)
			elseif a_xml_element.name.is_equal (Copy_task_name) then
					-- copy
				!GEANT_COPY_TASK! a_task.make (project, a_xml_element)
			elseif a_xml_element.name.is_equal (Move_task_name) then
					-- move
				!GEANT_MOVE_TASK! a_task.make (project, a_xml_element)
			elseif a_xml_element.name.is_equal (Setenv_task_name) then
					-- setenv
				!GEANT_SETENV_TASK! a_task.make (project, a_xml_element)
			elseif a_xml_element.name.is_equal (Xslt_task_name) then
					-- xslt
				!GEANT_XSLT_TASK! a_task.make (project, a_xml_element)
			elseif a_xml_element.name.is_equal (Outofdate_task_name) then
					-- outofdate
				!GEANT_OUTOFDATE_TASK! a_task.make (project, a_xml_element)
			elseif a_xml_element.name.is_equal (Exit_task_name) then
					-- exit
				!GEANT_EXIT_TASK! a_task.make (project, a_xml_element)
			elseif a_xml_element.name.is_equal (Precursor_task_name) then
					-- precursor
				!GEANT_PRECURSOR_TASK! a_task.make (project, a_xml_element)
			else
					-- Default:
				a_task := Void
			end
				-- Execute task:
			if a_task = Void then
				exit_application (1, "unknown task : " + a_xml_element.name.out + "%N")
			end
			if not a_task.is_executable then
				exit_application (1, "cannot execute task : " + a_xml_element.name.out + "%N")
			end
			if a_task.is_enabled then
				a_task.execute
				if a_task.exit_code /= 0 then
					exit_application (a_task.exit_code, Void)
				end
			else
				project.trace_debug ("task is disabled%N")
			end

		end

	dependent_targets: DS_ARRAYED_STACK [GEANT_TARGET] is
			-- All dependent targets
		local
			a_dependent_target: GEANT_TARGET
			a_value: UC_STRING
			a_dependent_targets: DS_ARRAYED_LIST [UC_STRING]
			i: INTEGER
		do
			!! Result.make (10)
			if has_dependencies then
				a_value := dependencies

					-- Check for targets separated by commas:
				a_dependent_targets := string_tokens (a_value, ',')

				if project.options.debug_mode then
					show_dependent_targets (a_dependent_targets)
				end

					-- Find all targets
				from i := 1 until i > a_dependent_targets.count loop
					a_value := a_dependent_targets.item (i)
					if project.targets.has (a_value.out) then
						a_dependent_target := project.targets.item (a_value.out)
						Result.force (a_dependent_target)
					else
						exit_application (1, "geant error: unknown dependent target '" + a_value.out + "'%N")
					end
					i := i + 1
				end
			end
		ensure
			dependent_targets_not_void: Result /= Void
		end

	show_dependent_targets (a_dependent_targets: DS_ARRAYED_LIST [UC_STRING]) is
		local
			i: INTEGER
		do
			std.output.put_string ("======= DEPENDENCIES ==========%N")
			from i := 1 until i > a_dependent_targets.count loop
				std.output.put_string (a_dependent_targets.item (i).out + "%N")
				i := i + 1
			end
			std.output.put_string ("=================%N")
		end


feature {NONE} -- Constants

	Name_attribute_name: UC_STRING is
			-- "name" attribute name
		once
			Result := new_unicode_string ("name")
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

	Depend_attribute_name: UC_STRING is
			-- "depend" attribute name
		once
			Result := new_unicode_string ("depend")
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

end
