note

	description:

		"Inherit"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_INHERIT

inherit

	ANY

	GEANT_SHARED_PROPERTIES
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT) is
			-- Create a new fileset.
		require
			project_not_void: a_project /= Void
		do
			project := a_project
			create parents.make (5)
		ensure
			project_set: project = a_project
		end

feature -- Access

	project: GEANT_PROJECT
			-- Project to which Current belongs to

	parents: DS_ARRAYED_LIST [GEANT_PARENT]
			-- Parents in this 'inherit' clause

feature -- Status report

	is_executable: BOOLEAN is
			-- Can element be executed?
		do
			Result := True
		ensure
			always_true: Result = True
		end

	apply_selects is
			-- Apply selects of all parents to current project.
		do
			project.trace_debug (<<"%NProject '", project.name, "': --> application of select clause:">>)
			validate_parent_selects
			sort_out_selected_targets
			check_targets_for_conflicts
			project.trace_debug (<<"Project '", project.name, "': <-- application of select clause done.">>)
		end

	validate_parent_selects is
			-- Check selects of all parents to make sure
			-- they do not interfere with each other.
		local
			a_parent_cursor: DS_LIST_CURSOR [GEANT_PARENT]
			a_parent: GEANT_PARENT
			a_parent_cursor2: DS_LIST_CURSOR [GEANT_PARENT]
			a_parent2: GEANT_PARENT
			a_selected_cursor: DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING]
			a_selected_target: GEANT_TARGET
			a_selected_cursor2: DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING]
			a_selected_target2: GEANT_TARGET
			a_selected_target_name: STRING
		do
				-- Make sure there are no conflicting selects:
			project.trace_debug (<<"Project '", project.name, "': making sure there are no conflicting selects">>)
			a_parent_cursor := project.inherit_clause.parents.new_cursor
			from a_parent_cursor.start until a_parent_cursor.after loop
				a_parent := a_parent_cursor.item
				a_selected_cursor := a_parent.parent_project.selected_targets.new_cursor
				from a_selected_cursor.start until a_selected_cursor.after loop
					a_selected_target := a_selected_cursor.item
					a_selected_target_name := a_selected_cursor.key
					a_parent_cursor2 := parents.new_cursor
					from a_parent_cursor2.start until a_parent_cursor2.after loop
						a_parent2 := a_parent_cursor2.item
						if a_parent /= a_parent2 then
							a_selected_cursor2 := a_parent2.parent_project.selected_targets.new_cursor
							from a_selected_cursor2.start until a_selected_cursor2.after loop
								a_selected_target2 := a_selected_cursor2.item
								if a_selected_target.conflicts_with (a_selected_target2) then
									exit_application (1, <<"Project '", project.name,
										"': conflicting selects: `", a_selected_target.full_name,
										"' and `", a_selected_target2.full_name, "'.">>)
								end
								a_selected_cursor2.forth
							end
						end
						a_parent_cursor2.forth
					end
					a_selected_cursor.forth
				end
				a_parent_cursor.forth
			end
		end

	sort_out_selected_targets is
			-- Remove targets conflicting with selected targets.
		local
			a_parent_cursor: DS_LIST_CURSOR [GEANT_PARENT]
			a_parent: GEANT_PARENT
			a_selected_cursor: DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING]
			a_selected_target: GEANT_TARGET
			a_selected_target_name: STRING
			a_target_cursor: DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING]
			a_target: GEANT_TARGET
			a_target_name: STRING
			a_conflict_found: BOOLEAN
			a_conflict_counter: INTEGER
		do
			project.trace_debug (<<"Project '", project.name, "': removing targets conflicting with selected targets">>)
			a_parent_cursor := project.inherit_clause.parents.new_cursor
			from a_parent_cursor.start until a_parent_cursor.after loop
				a_parent := a_parent_cursor.item
				a_selected_cursor := a_parent.parent_project.selected_targets.new_cursor
				from a_selected_cursor.start until a_selected_cursor.after loop
					a_selected_target_name := a_selected_cursor.key
					if not project.targets.has (a_selected_target_name) then
						exit_application (1, <<"%NLOAD ERROR:%N", "  project '", project.name,
							"' selected target `", a_selected_target_name, "' does not exist.">>)
					end
					a_selected_target := project.targets.item (a_selected_target_name)
						-- Loop over targets as long as conflicts found for select `a_selected_target':
					from
						a_conflict_found := True
						a_conflict_counter := 0
					until
						a_conflict_found = False
						-- Loop over targets:
					loop
						a_conflict_found := False
						a_target_cursor := project.targets.new_cursor
						from a_target_cursor.finish until a_target_cursor.before loop
							a_target := a_target_cursor.item
							a_target_name := project.target_name (a_target)
								-- Do not try to solve conflicts in the same target:
							if a_target /= a_selected_target then
								if a_selected_target.conflicts_with (a_target) then
									project.trace_debug (<<"Project '", project.name,
										"': conflict found! Replacing target `(", a_target.full_name,
										")' with selected target `(", a_selected_target.full_name, ")'.">>)
									project.trace_debug (<<"a_target: ">>)
									a_target.show_precursors
									project.trace_debug (<<"a_selected_target: ">>)
									a_selected_target.show_precursors
									a_conflict_found := True
									a_conflict_counter := a_conflict_counter + 1
									a_target.precursor_target.set_redefining_target (a_selected_target)
									project.targets.remove (a_target_name)
								end
							end
							a_target_cursor.back
						end
					end
					if a_conflict_counter = 0 then
						exit_application (1, <<"Project '", project.name, "': There is no need to select target `",
							a_selected_target_name, "' since there are no other conflicting targets.">>)
					end
					a_selected_cursor.forth
				end
				a_parent_cursor.forth
			end
		end

	check_targets_for_conflicts is
			-- Check `targets' for conflicts which have to be
			-- resolved using 'select'.
		local
			a_target_cursor: DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING]
			a_target: GEANT_TARGET
			a_target_name: STRING
			a_target_cursor2: DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING]
			a_target2: GEANT_TARGET
			a_target_name2: STRING
		do
			a_target_cursor := project.targets.new_cursor
			from a_target_cursor.finish until a_target_cursor.before loop
				a_target := a_target_cursor.item
				a_target_name := a_target_cursor.key
				a_target_cursor2 := project.targets.new_cursor
				from a_target_cursor2.finish until a_target_cursor2.before loop
					a_target2 := a_target_cursor2.item
					a_target_name2 := a_target_cursor2.key
					if a_target2 /= a_target then
						if a_target2.conflicts_with (a_target) then
							exit_application (1, <<"%NLOAD ERROR:%N", "Project '", project.name,
								"' contains target `", a_target_name, "' which conflicts with target `",
								a_target_name2, "'.%NUse a select clause to resolve the conflict.">>)
						end
					end
					a_target_cursor2.back
				end
				a_target_cursor.back
			end
		end

	merge_in_parent_project (a_parent: GEANT_PARENT) is
			-- Load parent project defined in file named `a_filename'.
		require
			a_parent_not_void: a_parent /= Void
		do
			project.trace_debug (<<"%NProject '", project.name, "': --> merging in parent '",
				a_parent.parent_project.name, "':">>)
			merge_in_redefined_targets (a_parent)
			merge_in_renamed_targets (a_parent)
			merge_in_unchanged_targets (a_parent)
			project.trace_debug (<<"Project '", project.name, "': <-- merging in of parent `",
				a_parent.parent_project.name, "' done.%N">>)
		end

	merge_in_renamed_targets (a_parent: GEANT_PARENT) is
			-- Merge renamed targets
		require
			a_parent_not_void: a_parent /= Void
		local
			a_rename_cursor: DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING]
			a_target: GEANT_TARGET
			a_rename_target: GEANT_TARGET
			a_rename_target_name: STRING
		do
			a_rename_cursor := a_parent.renamed_targets.new_cursor
			from a_rename_cursor.finish until a_rename_cursor.before loop
				a_rename_target := a_rename_cursor.item
				a_rename_target_name := a_rename_cursor.key
				project.trace_debug (<<"Project '", project.name, "': merging in renamed target `",
					a_rename_target_name, "' (", a_rename_target.full_name, ")">>)
				project.targets.search (a_rename_target_name)
				if project.targets.found then
						-- There is already a target named `a_rename_target_name'.
					a_target := project.targets.found_item
					if STRING_.same_string (a_target.full_name, a_rename_target.full_name) then
							-- It is the same target so we can share it:
						project.trace_debug (<<"Project '", project.name, "': sharing target `",
							a_rename_target_name, "' since name and full_name ('",
							a_rename_target.full_name, "') is equal to the existing target.">>)
					else
							-- The targets are different, causing a name clash:
						exit_application (1, <<"%NLOAD ERROR:%N", "Project '", project.name,
							"': contains target `", a_target.full_name, "' named `",
							a_rename_target_name, "' which causes a name clash with%N  target `",
							a_rename_target.full_name, "' named `", a_rename_target_name,
							"' inherited from project '", a_parent.parent_project.name, "'.%N",
-- TODO: support undefine first:
--							"  Use a rename, redefine or undefine clause to resolve the name clash.">>)
							"  Use a rename or redefine clause to resolve the name clash.">>)
					end
				else
					project.targets.force_last_new (a_rename_target, a_rename_target_name)
				end
				a_rename_cursor.back
			end
		end

	merge_in_redefined_targets (a_parent: GEANT_PARENT) is
			-- Load parent project defined in file named `a_filename'.
		require
			a_parent_not_void: a_parent /= Void
		local
			a_redefine_cursor: DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING]
			a_target: GEANT_TARGET
			a_redefine_target: GEANT_TARGET
			a_redefine_target_name: STRING
		do
				-- Merge redefined targets:
			a_redefine_cursor := a_parent.redefined_targets.new_cursor
			from a_redefine_cursor.finish until a_redefine_cursor.before loop
				a_redefine_target := a_redefine_cursor.item
				a_redefine_target_name := a_redefine_cursor.key
				project.trace_debug (<<"Project '", project.name, "': merging in redefined target `",
					a_redefine_target_name, "' (", a_redefine_target.full_name,
					") from parent '", a_parent.parent_project.name, "%'">>)
				if not project.targets.has (a_redefine_target_name) then
					exit_application (1, <<"%NLOAD ERROR:%N", "Project '", project.name,
						"' does not redefine parent target `", a_redefine_target_name,
						"' as declared.">>)
				end
				a_target := project.targets.item (a_redefine_target_name)

					-- Check that both targets have the same formal arguments:
				if not a_target.formal_arguments_match (a_redefine_target) then
					exit_application (1, <<"%NLOAD ERROR:%N", "Target '", a_target.full_name,
						"'s arguments do not match it's parent's (`", a_redefine_target.full_name,
						"'s) arguments.">>)
				end

					-- Connect `a_target' and `a_redefine_target':
				project.trace_debug (<<"Project '", project.name, "': connecting target `",
					a_target.full_name, "' and target `", a_redefine_target.full_name, "%'">>)
				a_redefine_target.set_redefining_target (a_target)
				a_target.set_precursor_target (a_redefine_target)
				a_redefine_cursor.back
			end
		end

	merge_in_unchanged_targets (a_parent: GEANT_PARENT) is
				-- Merge unchanged targets.
		require
			a_parent_not_void: a_parent /= Void
		local
			a_unchanged_cursor: DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING]
			a_target: GEANT_TARGET
			a_unchanged_target: GEANT_TARGET
			a_unchanged_target_name: STRING
		do
			a_unchanged_cursor := a_parent.unchanged_targets.new_cursor
			from a_unchanged_cursor.start until a_unchanged_cursor.after loop
				a_unchanged_target := a_unchanged_cursor.item
				a_unchanged_target_name := a_unchanged_cursor.key
				project.trace_debug (<<"Project '", project.name, "': merging in unchanged parent target `",
					a_unchanged_target_name, "' (", a_unchanged_target.full_name,
					") from parent '", a_parent.parent_project.name, "%'">>)
				project.targets.search (a_unchanged_target_name)
				if project.targets.found then
						-- There is already a target named `a_unchanged_target_name'.
					a_target := project.targets.found_item
					if STRING_.same_string (a_target.full_name, a_unchanged_target.full_name) then
							-- It is the same target so we can safely share it:
						project.trace_debug (<<"Project '", project.name, "': sharing target `",
						a_unchanged_target_name, "' since name and full_name ('",
						a_unchanged_target.full_name, "') is equal to the existing target.">>)
					else
							-- The targets are different, causing a name clash:
						exit_application (1, <<"%NLOAD ERROR:%N", "Project '", project.name,
							"' contains target%N    `", project.targets.item (a_unchanged_target_name).full_name,
							"' named `", a_unchanged_target_name, "'%N  which causes a name clash with target ",
							"%N    `", a_unchanged_target.full_name, "' named `", a_unchanged_target_name,
							"'%N  inherited from project '", a_parent.parent_project.name, "'.%N",
-- TODO: support undefine first:
--							"  Use a rename, redefine or undefine clause to resolve the name clash.">>)
							"  Use a rename or redefine clause to resolve the name clash.">>)
					end
				end
				project.targets.force_last_new (a_unchanged_target, a_unchanged_target_name)
				a_unchanged_cursor.forth
			end
		end

invariant

	parents_not_void: parents /= Void
	no_void_parent: not parents.has (Void)

end
