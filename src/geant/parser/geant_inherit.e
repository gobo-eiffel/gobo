indexing

	description:

		"Inherit"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_INHERIT

inherit

	ANY

	GEANT_SHARED_PROPERTIES
		export
			{NONE} all
		end

creation

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
		local
			msg: STRING
		do
			msg := clone ("%NProject '")
			msg.append_string (project.name)
			msg.append_string ("': --> application of select clause:%N")
			project.trace_debug (msg)

			validate_parent_selects
			sort_out_selected_targets
			check_targets_for_conflicts

			msg := clone ("Project '")
			msg.append_string (project.name)
			msg.append_string ("': <-- application of select clause done.%N")
			project.trace_debug (msg)

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
			msg: STRING
		do
				-- Make sure there are no conflicting selects:
			msg := clone ("Project '")
			msg.append_string (project.name)
			msg.append_string ("': making sure there are no conflicting selects%N")
			project.trace_debug (msg)
			from
				a_parent_cursor := project.inherit_clause.parents.new_cursor
				a_parent_cursor.start
			until
				a_parent_cursor.after
			loop
				a_parent := a_parent_cursor.item
				from
					a_selected_cursor := a_parent.parent_project.selected_targets.new_cursor
					a_selected_cursor.start
				until
					a_selected_cursor.after
				loop
					a_selected_target := a_selected_cursor.item
					a_selected_target_name := a_selected_cursor.key

					from
						a_parent_cursor2 := parents.new_cursor
						a_parent_cursor2.start
					until
						a_parent_cursor2.after
					loop
						a_parent2 := a_parent_cursor2.item
						if a_parent /= a_parent2 then
							from
								a_selected_cursor2 := a_parent2.parent_project.selected_targets.new_cursor
								a_selected_cursor2.start
							until
								a_selected_cursor2.after
							loop
								a_selected_target2 := a_selected_cursor2.item
	
								if a_selected_target.conflicts_with (a_selected_target2) then
									msg := clone ("Project '")
									msg.append_string (project.name)
									msg.append_string ("': conflicting selects: `")
									msg.append_string (a_selected_target.full_name)
									msg.append_string ("' and `")
									msg.append_string (a_selected_target2.full_name)
									msg.append_string ("'.%N")
									exit_application (1, msg)
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
			msg: STRING
		do
			msg := clone ("Project '")
			msg.append_string (project.name)
			msg.append_string ("': removing targets conflicting with selected targets%N")
			project.trace_debug (msg)

			from
				a_parent_cursor := project.inherit_clause.parents.new_cursor
				a_parent_cursor.start
			until
				a_parent_cursor.after
			loop
				a_parent := a_parent_cursor.item
				from
					a_selected_cursor := a_parent.parent_project.selected_targets.new_cursor
					a_selected_cursor.start
				until
					a_selected_cursor.after
				loop
					a_selected_target_name := a_selected_cursor.key
					if not project.targets.has (a_selected_target_name) then
						msg := clone ("%NLOAD ERROR:%N")
						msg.append_string ("  project '")
						msg.append_string (project.name)
						msg.append_string ("' selected target `")
						msg.append_string (a_selected_target_name)
						msg.append_string ("' does not exist.")
						exit_application (1, msg)
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
						from
							a_target_cursor := project.targets.new_cursor
							a_target_cursor.finish
						until
							a_target_cursor.before
						loop
							a_target := a_target_cursor.item
							a_target_name := project.target_name (a_target)
								-- Do not try to solve conflicts in the same target:
							if a_target /= a_selected_target then
								if a_selected_target.conflicts_with (a_target) then
									msg := clone ("Project '")
									msg.append_string (project.name)
									msg.append_string ("': conflict found! Replacing target `")
									msg.append_string ("(" + a_target.full_name + ")")
									msg.append_string ("' with selected target `")
									msg.append_string ("(" + a_selected_target.full_name + ")")
									msg.append_string ("'.%N")
									project.trace_debug (msg)
									project.trace_debug ("a_target: ")
									a_target.show_precursors
									project.trace_debug ("a_selected_target: ")
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
						msg := clone ("Project '")
						msg.append_string (project.name)
						msg.append_string ("': There is no need to select target `")
						msg.append_string (a_selected_target_name)
						msg.append_string ("' since there are no other conflicting targets.%N")
						exit_application (1, msg)
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
			msg: STRING
		do
			from
				a_target_cursor := project.targets.new_cursor
				a_target_cursor.finish
			until
				a_target_cursor.before
			loop
				a_target := a_target_cursor.item
				a_target_name := a_target_cursor.key

				from
					a_target_cursor2 := project.targets.new_cursor
					a_target_cursor2.finish
				until
					a_target_cursor2.before
				loop
					a_target2 := a_target_cursor2.item
					a_target_name2 := a_target_cursor2.key
					if a_target2 /= a_target then
						if a_target2.conflicts_with (a_target) then
							msg := clone ("%NLOAD ERROR:%N")
							msg.append_string ("Project '")
							msg.append_string (project.name)
							msg.append_string ("' contains target `")
							msg.append_string (a_target_name)
							msg.append_string ("' which conflicts with target `")
							msg.append_string (a_target_name2)
							msg.append_string ("'.%NUse a select clause to resolve the conflict.")
							exit_application (1, msg)
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
		local
			msg: STRING
		do
			msg := clone ("%NProject '")
			msg.append_string (project.name)
			msg.append_string ("': --> merging in parent '")
			msg.append_string (a_parent.parent_project.name)
			msg.append_string ("':%N")
			project.trace_debug (msg)

			merge_in_redefined_targets (a_parent)
			merge_in_renamed_targets (a_parent)
			merge_in_unchanged_targets (a_parent)

			msg := clone ("Project '")
			msg.append_string (project.name)
			msg.append_string ("': <-- merging in of parent `")
			msg.append_string (a_parent.parent_project.name)
			msg.append_string ("' done.%N%N")
			project.trace_debug (msg)

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
			msg: STRING
		do
			from
				a_rename_cursor := a_parent.renamed_targets.new_cursor
				a_rename_cursor.finish
			until
				a_rename_cursor.before
			loop
				a_rename_target := a_rename_cursor.item
				a_rename_target_name := a_rename_cursor.key

				msg := clone ("Project '")
				msg.append_string (project.name)
				msg.append_string ("': merging in renamed target `")
				msg.append_string (a_rename_target_name)
				msg.append_string ("' (" + a_rename_target.full_name + ")%N")
				project.trace_debug (msg)

				if project.targets.has (a_rename_target_name) then
						-- There is already a target named `a_rename_target_name'.
					a_target := project.targets.item (a_rename_target_name)
					if a_target.full_name.is_equal (a_rename_target.full_name) then
							-- It is the same target so we can share it:
						msg := clone ("Project '")
						msg.append_string (project.name)
						msg.append_string ("': sharing target `" + a_rename_target_name + "'")
						msg.append_string (" since name and full_name ('" + a_rename_target.full_name + "') is equal to the existing target.%N")
						project.trace_debug (msg)
					else
							-- The targets are different, causing a name clash:
						msg := clone ("%NLOAD ERROR:%N")
						msg.append_string ("Project '")
						msg.append_string (project.name)
						msg.append_string ("': contains target `")
						msg.append_string (a_target.full_name)
						msg.append_string ("' named `")
						msg.append_string (a_rename_target_name)
						msg.append_string ("' which causes a name clash with%N  target ")
						msg.append_string ("`" + a_rename_target.full_name + "' named ")
						msg.append_string ("`" + a_rename_target_name + "'")
						msg.append_string (" inherited from project '" + a_parent.parent_project.name + "'.%N")

-- TODO: support undefine first:
--						msg.append_string ("  Use a rename, redefine or undefine clause to resolve the name clash.")
						msg.append_string ("  Use a rename or redefine clause to resolve the name clash.")
						exit_application (1, msg)
					end
				else
					project.targets.force_last (a_rename_target, a_rename_target_name)
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
			msg: STRING
		do
				-- Merge redefined targets:
			from
				a_redefine_cursor := a_parent.redefined_targets.new_cursor
				a_redefine_cursor.finish
			until
				a_redefine_cursor.before
			loop
				a_redefine_target := a_redefine_cursor.item
				a_redefine_target_name := a_redefine_cursor.key

				msg := clone ("Project '")
				msg.append_string (project.name)
				msg.append_string ("': merging in redefined target `")
				msg.append_string (a_redefine_target_name)
				msg.append_string ("' (")
				msg.append_string (a_redefine_target.full_name)
				msg.append_string (") from parent '")
				msg.append_string (a_parent.parent_project.name)
				msg.append_string ("'%N")
				project.trace_debug (msg)

				if not project.targets.has (a_redefine_target_name) then
					msg := clone ("%NLOAD ERROR:%N")
					msg.append_string ("Project '")
					msg.append_string (project.name)
					msg.append_string ("' does not redefine parent target `")
					msg.append_string (a_redefine_target_name)
					msg.append_string ("' as declared.")
					exit_application (1, msg)
				end
				a_target := project.targets.item (a_redefine_target_name)

					-- Connect `a_target' and `a_redefine_target':
				msg := clone ("Project '")
				msg.append_string (project.name)
				msg.append_string ("': connecting target `" + a_target.full_name + "'")
				msg.append_string (" and target `" + a_redefine_target.full_name + "'%N")
				project.trace_debug (msg)
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
			msg: STRING
		do
			from
				a_unchanged_cursor := a_parent.unchanged_targets.new_cursor
				a_unchanged_cursor.start
			until
				a_unchanged_cursor.after
			loop
				a_unchanged_target := a_unchanged_cursor.item
				a_unchanged_target_name := a_unchanged_cursor.key

				msg := clone ("Project '")
				msg.append_string (project.name)
				msg.append_string ("': merging in unchanged parent target `")
				msg.append_string (a_unchanged_target_name)
				msg.append_string ("' (")
				msg.append_string (a_unchanged_target.full_name)
				msg.append_string (") from parent '")
				msg.append_string (a_parent.parent_project.name)
				msg.append_string ("'%N")
				project.trace_debug (msg)

				if project.targets.has (a_unchanged_target_name) then
						-- There is already a target named `a_unchanged_target_name'.
					a_target := project.targets.item (a_unchanged_target_name)
					if a_target.full_name.is_equal (a_unchanged_target.full_name) then
							-- It is the same target so we can safely share it:
						msg := clone ("Project '")
						msg.append_string (project.name)
						msg.append_string ("': sharing target `" + a_unchanged_target_name + "'")
						msg.append_string (" since name and full_name ('" + a_unchanged_target.full_name + "') is equal to the existing target.%N")
						project.trace_debug (msg)
					else
							-- The targets are different, causing a name clash:
						msg := clone ("%NLOAD ERROR:%N")
						msg.append_string ("Project '")
						msg.append_string (project.name)
						msg.append_string ("' contains target%N    `")
						msg.append_string (project.targets.item (a_unchanged_target_name).full_name)
						msg.append_string ("' named `")
						msg.append_string (a_unchanged_target_name)
						msg.append_string ("'%N  which causes a name clash with target ")
						msg.append_string ("%N    `" + a_unchanged_target.full_name + "' named ")
						msg.append_string ("`" + a_unchanged_target_name + "'%N")
						msg.append_string ("  inherited from project '" + a_parent.parent_project.name + "'.%N")

-- TODO: support undefine first:
--						msg.append_string ("  Use a rename, redefine or undefine clause to resolve the name clash.")
						msg.append_string ("  Use a rename or redefine clause to resolve the name clash.")
						exit_application (1, msg)
					end
				end
				project.targets.force_last (a_unchanged_target, a_unchanged_target_name)

				a_unchanged_cursor.forth
			end

		end

end
