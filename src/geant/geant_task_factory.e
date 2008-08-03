indexing

	description:

		"Geant tasks factory"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001-2008, Sven Ehrke, Jocelyn Fiat, and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_TASK_FACTORY

inherit

	ANY

	GEANT_ELEMENT_NAMES
		export {NONE} all end

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

create
	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT) is
			-- Create Current factory for `a_project'
		require
			a_project_not_void: a_project /= Void
		do
			project := a_project
			create_builders
		end

feature {NONE} -- Property

	project: GEANT_PROJECT
			-- Associated project

feature -- Access

	new_task (a_xml_element: XM_ELEMENT): GEANT_TASK is
			-- New GEANT_TASK for `a_xml_element'
		require
			a_xml_element_not_void: a_xml_element /= Void
		do
			if builders.has (a_xml_element.name) then
				Result := builders.item (a_xml_element.name).item ([a_xml_element])
			else
				--| Per project custom tasks (for future use)
			end
		end

feature -- Factory

	new_gec_task (a_xml_element: XM_ELEMENT): GEANT_GEC_TASK is
			-- gec: Gobo Eiffel compilation
		require
			a_xml_element_not_void: a_xml_element /= Void
		do
			create Result.make (project, a_xml_element)
		ensure
			new_gec_task_not_void: Result /= Void
		end

	new_se_task (a_xml_element: XM_ELEMENT): GEANT_SE_TASK is
			-- se: SmartEiffel compilation
		require
			a_xml_element_not_void: a_xml_element /= Void
		do
			create Result.make (project, a_xml_element)
		ensure
			new_se_task_not_void: Result /= Void
		end

	new_ise_task (a_xml_element: XM_ELEMENT): GEANT_ISE_TASK is
			-- ise: ISE Eiffel compilation
		require
			a_xml_element_not_void: a_xml_element /= Void
		do
			create Result.make (project, a_xml_element)
		ensure
			new_ise_task_not_void: Result /= Void
		end

	new_exec_task (a_xml_element: XM_ELEMENT): GEANT_EXEC_TASK is
			-- exec
		require
			a_xml_element_not_void: a_xml_element /= Void
		do
			create Result.make (project, a_xml_element)
		ensure
			new_exec_task_not_void: Result /= Void
		end

	new_lcc_task (a_xml_element: XM_ELEMENT): GEANT_LCC_TASK is
			-- lcc
		require
			a_xml_element_not_void: a_xml_element /= Void
		do
			create Result.make (project, a_xml_element)
		ensure
			new_lcc_task_not_void: Result /= Void
		end

	new_set_task (a_xml_element: XM_ELEMENT): GEANT_SET_TASK is
			-- set
		require
			a_xml_element_not_void: a_xml_element /= Void
		do
			create Result.make (project, a_xml_element)
		ensure
			new_set_task_not_void: Result /= Void
		end

	new_unset_task (a_xml_element: XM_ELEMENT): GEANT_UNSET_TASK is
			-- unset
		require
			a_xml_element_not_void: a_xml_element /= Void
		do
			create Result.make (project, a_xml_element)
		ensure
			new_unset_task_not_void: Result /= Void
		end

	new_gexace_task (a_xml_element: XM_ELEMENT): GEANT_GEXACE_TASK is
			-- gexace
		require
			a_xml_element_not_void: a_xml_element /= Void
		do
			create Result.make (project, a_xml_element)
		ensure
			new_gexace_task_not_void: Result /= Void
		end

	new_gelex_task (a_xml_element: XM_ELEMENT): GEANT_GELEX_TASK is
			-- gelex
		require
			a_xml_element_not_void: a_xml_element /= Void
		do
			create Result.make (project, a_xml_element)
		ensure
			new_gelex_task_not_void: Result /= Void
		end

	new_geyacc_task (a_xml_element: XM_ELEMENT): GEANT_GEYACC_TASK is
			-- geyacc
		require
			a_xml_element_not_void: a_xml_element /= Void
		do
			create Result.make (project, a_xml_element)
		ensure
			new_geyacc_task_not_void: Result /= Void
		end

	new_gepp_task (a_xml_element: XM_ELEMENT): GEANT_GEPP_TASK is
			-- gepp
		require
			a_xml_element_not_void: a_xml_element /= Void
		do
			create Result.make (project, a_xml_element)
		ensure
			new_gepp_task_not_void: Result /= Void
		end

	new_getest_task (a_xml_element: XM_ELEMENT): GEANT_GETEST_TASK is
			-- getest
		require
			a_xml_element_not_void: a_xml_element /= Void
		do
			create Result.make (project, a_xml_element)
		ensure
			new_getest_task_not_void: Result /= Void
		end

	new_geant_task (a_xml_element: XM_ELEMENT): GEANT_GEANT_TASK is
			-- geant
		require
			a_xml_element_not_void: a_xml_element /= Void
		do
			create Result.make (project, a_xml_element)
		ensure
			new_geant_task_not_void: Result /= Void
		end

	new_echo_task (a_xml_element: XM_ELEMENT): GEANT_ECHO_TASK is
			-- echo
		require
			a_xml_element_not_void: a_xml_element /= Void
		do
			create Result.make_from_interpreting_element (create {GEANT_INTERPRETING_ELEMENT}.make (project, a_xml_element))
		ensure
			new_echo_task_not_void: Result /= Void
		end

	new_mkdir_task (a_xml_element: XM_ELEMENT): GEANT_MKDIR_TASK is
			-- mkdir
		require
			a_xml_element_not_void: a_xml_element /= Void
		do
			create Result.make_from_interpreting_element (create {GEANT_INTERPRETING_ELEMENT}.make (project, a_xml_element))
		ensure
			new_mkdir_task_not_void: Result /= Void
		end

	new_delete_task (a_xml_element: XM_ELEMENT): GEANT_DELETE_TASK is
			-- delete
		require
			a_xml_element_not_void: a_xml_element /= Void
		do
			create Result.make (project, a_xml_element)
		ensure
			new_delete_task_not_void: Result /= Void
		end

	new_copy_task (a_xml_element: XM_ELEMENT): GEANT_COPY_TASK is
			-- copy
		require
			a_xml_element_not_void: a_xml_element /= Void
		do
			create Result.make (project, a_xml_element)
		ensure
			new_copy_task_not_void: Result /= Void
		end

	new_move_task (a_xml_element: XM_ELEMENT): GEANT_MOVE_TASK is
			-- move
		require
			a_xml_element_not_void: a_xml_element /= Void
		do
			create Result.make (project, a_xml_element)
		ensure
			new_move_task_not_void: Result /= Void
		end

	new_setenv_task (a_xml_element: XM_ELEMENT): GEANT_SETENV_TASK is
			-- setenv
		require
			a_xml_element_not_void: a_xml_element /= Void
		do
			create Result.make (project, a_xml_element)
		ensure
			new_setenv_task_not_void: Result /= Void
		end

	new_xslt_task (a_xml_element: XM_ELEMENT): GEANT_XSLT_TASK is
			-- xslt
		require
			a_xml_element_not_void: a_xml_element /= Void
		do
			create Result.make (project, a_xml_element)
		ensure
			new_xslt_task_not_void: Result /= Void
		end

	new_outofdate_task (a_xml_element: XM_ELEMENT): GEANT_OUTOFDATE_TASK is
			-- outofdate
		require
			a_xml_element_not_void: a_xml_element /= Void
		do
			create Result.make (project, a_xml_element)
		ensure
			new_outofdate_task_not_void: Result /= Void
		end

	new_exit_task (a_xml_element: XM_ELEMENT): GEANT_EXIT_TASK is
			-- exit
		require
			a_xml_element_not_void: a_xml_element /= Void
		do
			create Result.make (project, a_xml_element)
		ensure
			new_exit_task_not_void: Result /= Void
		end

	new_precursor_task (a_xml_element: XM_ELEMENT): GEANT_PRECURSOR_TASK is
			-- precursor
		require
			a_xml_element_not_void: a_xml_element /= Void
		do
			create Result.make (project, a_xml_element)
		ensure
			new_precursor_task_not_void: Result /= Void
		end

	new_available_task (a_xml_element: XM_ELEMENT): GEANT_AVAILABLE_TASK is
			-- available
		require
			a_xml_element_not_void: a_xml_element /= Void
		do
			create Result.make (project, a_xml_element)
		ensure
			new_available_task_not_void: Result /= Void
		end

	new_input_task (a_xml_element: XM_ELEMENT): GEANT_INPUT_TASK is
			-- input
		require
			a_xml_element_not_void: a_xml_element /= Void
		do
			create Result.make (project, a_xml_element)
		ensure
			new_input_task_not_void: Result /= Void
		end

	new_replace_task (a_xml_element: XM_ELEMENT): GEANT_REPLACE_TASK is
			-- replace
		require
			a_xml_element_not_void: a_xml_element /= Void
		do
			create Result.make (project, a_xml_element)
		ensure
			new_replace_task_not_void: Result /= Void
		end

feature {NONE} -- Implementation

	builders: DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING]
			-- Table of task builders

	create_builders is
			-- Table of task builders
		do
			create builders.make_map (30)
			builders.set_key_equality_tester (string_equality_tester)

				-- gec: Gobo Eiffel compilation
			builders.force_last (agent new_gec_task, Gec_task_name)
				-- se: SmartEiffel compilation
			builders.force_last (agent new_se_task, Se_task_name)
				-- ise: ISE Eiffel compilation
			builders.force_last (agent new_ise_task, Ise_task_name)
				-- exec
			builders.force_last (agent new_exec_task, Exec_task_name)
				-- lcc
			builders.force_last (agent new_lcc_task, Lcc_task_name)
				-- set
			builders.force_last (agent new_set_task, Set_task_name)
				-- unset
			builders.force_last (agent new_unset_task, Unset_task_name)
				-- gexace
			builders.force_last (agent new_gexace_task, Gexace_task_name)
				-- gelex
			builders.force_last (agent new_gelex_task, Gelex_task_name)
				-- geyacc
			builders.force_last (agent new_geyacc_task, Geyacc_task_name)
				-- gepp
			builders.force_last (agent new_gepp_task, Gepp_task_name)
				-- getest
			builders.force_last (agent new_getest_task, Getest_task_name)
				-- geant
			builders.force_last (agent new_geant_task, Geant_task_name)
				-- echo
			builders.force_last (agent new_echo_task, Echo_task_name)
				-- mkdir
			builders.force_last (agent new_mkdir_task, Mkdir_task_name)
				-- delete
			builders.force_last (agent new_delete_task, Delete_task_name)
				-- copy
			builders.force_last (agent new_copy_task, Copy_task_name)
				-- move
			builders.force_last (agent new_move_task, Move_task_name)
				-- setenv
			builders.force_last (agent new_setenv_task, Setenv_task_name)
				-- xslt
			builders.force_last (agent new_xslt_task, Xslt_task_name)
				-- outofdate
			builders.force_last (agent new_outofdate_task, Outofdate_task_name)
				-- exit
			builders.force_last (agent new_exit_task, Exit_task_name)
				-- precursor
			builders.force_last (agent new_precursor_task, Precursor_task_name)
				-- available
			builders.force_last (agent new_available_task, Available_task_name)
				-- input
			builders.force_last (agent new_input_task, Input_task_name)
				-- replace
			builders.force_last (agent new_replace_task, Replace_task_name)
		end

invariant

	project_not_void: project /= Void
	builders_not_void: builders /= Void
	no_void_builder: not builders.has_item (Void)

end
