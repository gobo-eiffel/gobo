indexing

	description:

		"Target of geant build file"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_TARGET

inherit

	GEANT_ELEMENT
		redefine
			make
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

	make (a_project: GEANT_PROJECT; a_xml_element: GEANT_XML_ELEMENT) is
			-- Create a new target
--!!		require
--!!			a_xml_element_has_name: a_xml_element.has_attribute (Name_attribute_name)
		do
			precursor (a_project, a_xml_element)
			set_name (xml_element.attribute_value_by_name (Name_attribute_name).out)
		end

feature -- Access

	has_dependencies: BOOLEAN is
			-- Has current target dependent on other targets?
		do
			Result := xml_element.has_attribute (Depend_attribute_name)
		end

	dependencies: UC_STRING is
			-- UC_STRING representation of dependencies
		do
			Result := xml_element.attribute_value_by_name (Depend_attribute_name)
		end

	name: STRING
			-- Name of target

	is_executed: BOOLEAN
			-- Was this target executed already?
			
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

feature -- Processing

	execute  is
			-- Execute all tasks of `a_target' in sequential order
		local
			children: DS_ARRAYED_LIST [GEANT_XML_ELEMENT]
			i, nb: INTEGER
			a_xml_element: GEANT_XML_ELEMENT
			a_task: GEANT_TASK
			a_old_target_cwd: STRING
			a_new_target_cwd: STRING
		do
			children := xml_element.children
			nb := children.count
			if is_enabled then
					-- change to the specified directory if "dir" attribue is provided:
				if xml_element.has_attribute (Dir_attribute_name) then
					a_new_target_cwd := project.variables.interpreted_string (
						xml_element.attribute_value_by_name (Dir_attribute_name).out)
					debug ("geant")
						print (" changing to directory: '" + a_new_target_cwd + "'%N")
					end
					a_old_target_cwd := file_system.current_working_directory
					file_system.set_current_working_directory (a_new_target_cwd)
				end

				from
					if has_description then
						i := 2
					else
						i := 1
					end
				until
					i > nb or not is_enabled
				loop
					a_xml_element := children.item (i)
						-- Dispatch tasks:
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
					else
							-- Default:
						a_task := Void
					end
						-- Execute task:
					if a_task = Void then
						print ("WARNING: unknown task : " + a_xml_element.name.out + "%N")
					elseif not a_task.is_executable then
						print ("WARNING: cannot execute task : " + a_xml_element.name.out + "%N")
					else
						if a_task.is_enabled then
							a_task.execute
							if a_task.exit_code /= 0 then
								exit_application (a_task.exit_code, Void)
							end
						else
							debug ("geant")
								print ("task is disabled%N")
							end
						end
					end
					i := i + 1
				end -- from

				if has_uc_attribute (Dir_attribute_name) then
					debug ("geant")
						print (" changing to directory: '" + a_old_target_cwd + "'%N")
					end
					file_system.set_current_working_directory (a_old_target_cwd)

				end
				
				set_executed (True)
			end	-- if
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

				debug ("geant")
					show_dependent_targets (a_dependent_targets)
				end

					-- Find all targets
				from i := 1 until i > a_dependent_targets.count loop
					a_value := a_dependent_targets.item (i)
					a_dependent_target := project.target_with_name (a_value)
					if a_dependent_target /= Void then
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
			print ("======= DEPENDENCIES ==========%N")
			from i := 1 until i > a_dependent_targets.count loop
				print (a_dependent_targets.item (i).out + "%N")
				i := i + 1
			end
			print ("=================%N")
		end


feature {NONE} -- Constants

	Name_attribute_name: UC_STRING is
			-- "name" attribute name
		once
			!! Result.make_from_string ("name")
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: not Result.empty
		end

	Depend_attribute_name: UC_STRING is
			-- "depend" attribute name
		once
			!! Result.make_from_string ("depend")
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: not Result.empty
		end

end -- class GEANT_TARGET
