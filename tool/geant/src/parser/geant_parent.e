note

	description:

		"Parents"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001-2018, Sven Ehrke and others"
	license: "MIT License"

class GEANT_PARENT

inherit

	ANY

	GEANT_SHARED_PROPERTIES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT)
			-- Create a new parent.
		require
			project_not_void: a_project /= Void
		local
			a_tester: UC_STRING_EQUALITY_TESTER
		do
			project := a_project
			create a_tester
			create renames.make_map_equal (10)
			renames.set_key_equality_tester (a_tester)
			create redefines.make_map_equal (10)
			redefines.set_key_equality_tester (a_tester)
			create selects.make_map_equal (10)
			selects.set_key_equality_tester (a_tester)
			create unchanged_targets.make_map (10)
			unchanged_targets.set_key_equality_tester (a_tester)
			create renamed_targets.make_map (5)
			renamed_targets.set_key_equality_tester (a_tester)
			create redefined_targets.make_map (5)
			redefined_targets.set_key_equality_tester (a_tester)
		ensure
			project_set: project = a_project
		end

feature -- Access

	project: GEANT_PROJECT
			-- Project to which Current belongs to

	parent_project: detachable GEANT_PROJECT
			-- Parent project

	renames: DS_HASH_TABLE [GEANT_RENAME, STRING]
			-- Rename clauses of this parent indexed by original target name

	redefines: DS_HASH_TABLE [GEANT_REDEFINE, STRING]
			-- Redefine clauses of this parent indexed by target name

	selects: DS_HASH_TABLE [GEANT_SELECT, STRING]
			-- Select clauses of this parent indexed by target name

	unchanged_targets: DS_HASH_TABLE [GEANT_TARGET, STRING]
			-- Targets not redeclared in `project'

	renamed_targets: DS_HASH_TABLE [GEANT_TARGET, STRING]
			-- Targets renamed in `project'

	redefined_targets: DS_HASH_TABLE [GEANT_TARGET, STRING]
			-- Targets redefined in `project'

feature -- Status report

	is_executable: BOOLEAN
			-- Can element be executed?
		do
			Result := parent_project /= Void
		ensure
			parent_project_not_void: Result implies parent_project /= Void
		end

	has_rename: BOOLEAN
			-- Does parent clause specify at least one 'rename' clause?
		do
			Result := renames.count > 0
		ensure
			definition: Result implies renames.count > 0
		end

	has_redefine: BOOLEAN
			-- Does parent clause specify at least one 'redefine' clause?
		do
			Result := redefines.count > 0
		ensure
			definition: Result implies redefines.count > 0
		end

	has_select: BOOLEAN
			-- Does parent clause specify at least one 'select' clause?
		do
			Result := selects.count > 0
		ensure
			definition: Result implies selects.count > 0
		end

feature -- Setting

	set_parent_project (a_parent_project: like parent_project)
			-- Set `parent_project' to `a_parent_project'.
		require
			a_parent_project_not_void: a_parent_project /= Void
		do
			parent_project := a_parent_project
		ensure
			parent_project_set: parent_project = a_parent_project
		end

feature -- Processing

	prepare_project
			-- Prepare current parent for inheritance into `project'.
		require
			parent_project_not_void: parent_project /= Void
		do
			check precondition: attached parent_project as l_parent_project then
				project.trace_debug (<<"Project '", project.name, "': --> preparing parent '",
					l_parent_project.name, "' for inheritance:">>)
				apply_renames
				apply_redefines
				apply_unchangeds
					-- TODO: remove the following 3 lines after obsolete period
				if project.old_inherit then
					apply_undeclared_redefines
				end
				apply_selects
				project.trace_debug (<<"Project '", project.name, "': <-- preparation of '",
					l_parent_project.name, "' for inheritance done.">>)
			end
		end

feature {NONE} -- Processing

	apply_renames
			-- Apply rename clauses.
		require
			parent_project_not_void: parent_project /= Void
		local
			a_rename_cursor: DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING]
			a_rename: GEANT_RENAME
			a_target: GEANT_TARGET
		do
			if attached parent_project as l_parent_project and then attached l_parent_project.targets as l_parent_project_targets then
				a_rename_cursor := renames.new_cursor
				from a_rename_cursor.finish until a_rename_cursor.before loop
					a_rename := a_rename_cursor.item
					if not a_rename.is_executable then
						exit_application (1, <<"invalid rename clause.">>)
					else
						check
							postcondition_of_GEANT_RENAME_is_executable_1: attached a_rename.original_name as l_rename_original_name
							postcondition_of_GEANT_RENAME_is_executable_2: attached a_rename.new_name as l_rename_new_name
						then
							if not l_parent_project_targets.has (l_rename_original_name) then
								exit_application (1, <<"%NLOAD ERROR:%N", "  Project '", project.name,
									"': VHRC-1: Inheritance clause contains inheritance operator",
									" 'rename'%Nfor a feature `", l_rename_original_name,
									"' which does not exist in parent '", l_parent_project.name, "%'.">>)
							end
							if l_parent_project_targets.has (l_rename_new_name) then
								exit_application (1, <<"%NLOAD ERROR:%N", "  Project '", l_parent_project.name,
									"': cannot rename target: `", l_rename_original_name,
									" to `", l_rename_new_name, "' since it already exists.">>)
							end
								-- Put `a_target' under new name in target list:
							a_target := l_parent_project_targets.item (l_rename_original_name)
							project.trace_debug (<<"Project '", project.name, "': renaming target: `",
								a_target.full_name, "' named `", l_rename_original_name,
								"' as: `", l_rename_new_name, "%'">>)
							renamed_targets.force_last (a_target, l_rename_new_name)
						end
					end
					a_rename_cursor.back
				end
			end
		end

	apply_redefines
			-- Apply redefine clauses to `project'.
		require
			parent_project_not_void: parent_project /= Void
		local
			a_redefine_cursor: DS_LINEAR_CURSOR [GEANT_REDEFINE]
			a_redefine: GEANT_REDEFINE
			a_target: GEANT_TARGET
		do
			if attached parent_project as l_parent_project and then attached l_parent_project.targets as l_parent_project_targets then
				a_redefine_cursor := redefines.new_cursor
				from a_redefine_cursor.start until a_redefine_cursor.after loop
					a_redefine := a_redefine_cursor.item
					if not a_redefine.is_executable then
						exit_application (1, <<"invalid redefine clause.">>)
					else
						check postcondition_of_GEANT_REDEFINE_is_executable: attached a_redefine.name as l_redefine_name then
								-- Try to find target first in `renamed_targets';
								-- if not found there, in `parent_project.targets':
							if renamed_targets.has (l_redefine_name) then
								a_target := renamed_targets.item (l_redefine_name)
							elseif l_parent_project_targets.has (l_redefine_name) then
								a_target := l_parent_project_targets.item (l_redefine_name)
							end
							if a_target = Void then
								exit_application (1, <<"%NLOAD ERROR:%N", "  Project '", project.name,
									"': cannot redefine target: `", l_redefine_name, "' since it does not exist.">>)
							else
								redefined_targets.force_last (a_target, l_redefine_name)
								if renamed_targets.has (l_redefine_name) then
									project.trace_debug (<<"Project '", project.name, "': moving target '",
										l_redefine_name, "' from list of renamed targets to list of redefined targets.">>)
									renamed_targets.remove (l_redefine_name)
								else
									project.trace_debug (<<"Project '", project.name, "': adding target '",
										l_redefine_name, "' to list of redefined targets.">>)
								end
							end
						end
					end
					a_redefine_cursor.forth
				end
			end
		end

	apply_unchangeds
			-- Temporarily store not redeclared targets.
		local
			a_target_cursor: DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING]
			a_target: GEANT_TARGET
			a_target_name: STRING
		do
			if attached parent_project as l_parent_project and then attached l_parent_project.targets as l_targets then
				a_target_cursor := l_targets.new_cursor
				from a_target_cursor.finish until a_target_cursor.before loop
					a_target := a_target_cursor.item
					a_target_name := a_target_cursor.key
					if
						not renamed_targets.has_item (a_target) and
						not redefined_targets.has_item (a_target)
					then
						unchanged_targets.force_last (a_target, a_target_name)
					end
					a_target_cursor.back
				end
			end
		end

	apply_undeclared_redefines
			-- Move targets from `unchanged_targets' to redefined
			-- targets having a name equal to a target in `project.targets'
			-- if old inheritance form has been used for `project'
			-- TODO: remove after obsolete period
		require
			old_inheritance_format: project.old_inherit
		local
			a_target_cursor: DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING]
			a_target: GEANT_TARGET
			a_target_name: STRING
		do
			if attached project.targets as l_targets then
				a_target_cursor := l_targets.new_cursor
				from a_target_cursor.start until a_target_cursor.after loop
					a_target := a_target_cursor.item
					a_target_name := a_target_cursor.key
					if unchanged_targets.has (a_target_name) then
						project.trace (<<"Project '", project.name,
							"': WARNING: Applying implicit redefinition for target `",
							a_target_name, "' due to old inheritance format.">>)
						redefined_targets.force_last (unchanged_targets.item (a_target_name), a_target_name)
						unchanged_targets.remove (a_target_name)
					end
					a_target_cursor.forth
				end
			end
		end

	apply_selects
			-- Apply select clauses to `project'.
		local
			a_select_cursor: DS_LINEAR_CURSOR [GEANT_SELECT]
			a_select: GEANT_SELECT
			a_target: GEANT_TARGET
		do
			if attached parent_project as l_parent_project then
				a_select_cursor := selects.new_cursor
				from a_select_cursor.start until a_select_cursor.after loop
					a_select := a_select_cursor.item
					if not a_select.is_executable then
						exit_application (1, <<"invalid select clause.">>)
					else
						check poscondition_of_GEANT_SELECT_is_executable: attached a_select.name as l_select_name then
								-- Try to find target first in `redefined_targets';
								-- if not found there, in `renamed_targets';
								-- if not found there, in `unchanged_targets':
							if redefined_targets.has (l_select_name) then
								a_target := redefined_targets.item (l_select_name)
							elseif renamed_targets.has (l_select_name) then
								a_target := renamed_targets.item (l_select_name)
							elseif unchanged_targets.has (l_select_name) then
								a_target := unchanged_targets.item (l_select_name)
							end
							if a_target = Void then
								exit_application (1, <<"%NLOAD ERROR:%N", "  Project '", project.name,
									"': selected target: `", l_select_name, "' does not exist.">>)
							else
								project.trace_debug (<<"Project '", project.name, "': moving target '",
									l_select_name, "' to list of selected targets.">>)
								l_parent_project.selected_targets.force_last (a_target, l_select_name)
							end
						end
					end
					a_select_cursor.forth
				end
			end
		end

invariant

	renames_not_void: renames /= Void
	redefines_not_void: redefines /= Void
	selects_not_void: selects /= Void
	unchanged_targets_not_void: unchanged_targets /= Void
	renamed_targets_not_void: renamed_targets /= Void
	redefined_targets_not_void: redefined_targets /= Void

end
