indexing

	description:

		"Parents"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_PARENT

inherit

	ANY

	GEANT_SHARED_PROPERTIES
		export{NONE} all end

creation

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT) is
			-- Create a new parent.
		require
			project_not_void: a_project /= Void
		do
			project := a_project

			create renames.make_equal (10)
			create redefines.make_equal (10)
			create selects.make_equal (10)

			create unchanged_targets.make (10)
			create renamed_targets.make (5)
			create redefined_targets.make (5)

		ensure
			project_set: project = a_project
			renames_not_void: renames /= Void
			redefines_not_void: redefines /= Void
			selects_not_void: selects /= Void
			unchanged_targets_not_void: unchanged_targets /= Void
			renamed_targets_not_void: renamed_targets /= Void
			redefined_targets_not_void: redefined_targets /= Void
		end

feature -- Access

	project: GEANT_PROJECT
			-- Project to which Current belongs to

	parent_project: GEANT_PROJECT
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

	is_executable: BOOLEAN is
			-- Can element be executed?
		do
			Result := parent_project /= Void
		ensure
			parent_project_not_void: Result implies parent_project /= Void
		end

	has_rename: BOOLEAN is
			-- Does parent clause specify at least one 'rename' clause?
		do
			Result := renames.count > 0
		ensure
			definition: Result implies renames.count > 0
		end

	has_redefine: BOOLEAN is
			-- Does parent clause specify at least one 'redefine' clause?
		do
			Result := redefines.count > 0
		ensure
			definition: Result implies redefines.count > 0
		end

	has_select: BOOLEAN is
			-- Does parent clause specify at least one 'select' clause?
		do
			Result := selects.count > 0
		ensure
			definition: Result implies selects.count > 0
		end

feature -- Setting

	set_parent_project (a_parent_project: like parent_project) is
			-- Set `parent_project' to `a_parent_project'.
		require
			a_parent_project_not_void: a_parent_project /= Void
		do
			parent_project := a_parent_project
		ensure
			parent_project_set: parent_project = a_parent_project
		end

feature -- Processing

	prepare_project is
			-- Prepare current parent for inheritance into `project'.
		local
			msg: STRING
		do
			msg := clone ("Project '")
			msg.append_string (project.name)
			msg.append_string ("': --> preparing parent '")
			msg.append_string (parent_project.name)
			msg.append_string ("' for inheritance:%N")
			project.trace_debug (msg)

			apply_renames
			apply_redefines
			apply_unchangeds

				-- TODO: remove the following 3 lines after obsolete period
			if project.old_inherit then
				apply_undeclared_redefines
			end

			apply_selects

			msg := clone ("Project '")
			msg.append_string (project.name)
			msg.append_string ("': <-- preparation of '")
			msg.append_string (parent_project.name)
			msg.append_string ("' for inheritance done.%N")
			project.trace_debug (msg)
		end

feature {NONE} -- Processing

	apply_renames is
			-- Apply rename clauses.
		local
			a_rename_cursor: DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING]
			a_rename: GEANT_RENAME
			a_target: GEANT_TARGET
			msg: STRING
		do
			from
				a_rename_cursor := renames.new_cursor
				a_rename_cursor.finish
			until
				a_rename_cursor.before
			loop
				a_rename := a_rename_cursor.item
				if not a_rename.is_executable then
					exit_application (1, "invalid rename clause.")
				end
				if not parent_project.targets.has (a_rename.original_name) then
					msg := clone ("%NLOAD ERROR:%N")
					msg.append_string ("  Project '")
					msg.append_string (project.name)
					msg.append_string ("': VHRC-1: Inheritance clause contains inheritance operator")
					msg.append_string (" 'rename'%Nfor a feature `")
					msg.append_string (a_rename.original_name)
					msg.append_string ("' which does not exist in parent '")
					msg.append_string (parent_project.name)
					msg.append_string ("'.%N")
					exit_application (1, msg)
				end
	
				if parent_project.targets.has (a_rename.new_name) then
					msg := clone ("%NLOAD ERROR:%N")
					msg.append_string ("  Project '")
					msg.append_string (parent_project.name)
					msg.append_string ("': cannot rename target: `")
					msg.append_string (a_rename.original_name)
					msg.append_string (" to `")
					msg.append_string (a_rename.new_name)
					msg.append_string ("' since it already exists.%N")
					exit_application (1, msg)
				end

					-- Put `a_target' under new name in target list:
				a_target := parent_project.targets.item (a_rename.original_name)
				msg := clone ("Project '")
				msg.append_string (project.name)
				msg.append_string ("': renaming target: `")
				msg.append_string (a_target.full_name)
				msg.append_string ("' named `")
				msg.append_string (a_rename.original_name)
				msg.append_string ("' as: `")
				msg.append_string (a_rename.new_name)
				msg.append_string ("'%N")
				project.trace_debug (msg)

				renamed_targets.force_last (a_target, a_rename.new_name)

				a_rename_cursor.back
			end
		end

	apply_redefines is
			-- Apply redefine clauses to `project'.
		local
			a_redefine_cursor: DS_LINEAR_CURSOR [GEANT_REDEFINE]
			a_redefine: GEANT_REDEFINE
			a_target: GEANT_TARGET
			msg: STRING
		do
			from
				a_redefine_cursor := redefines.new_cursor
				a_redefine_cursor.start
			until
				a_redefine_cursor.after
			loop
				a_redefine := a_redefine_cursor.item
				if not a_redefine.is_executable then
					exit_application (1, "invalid redefine clause.")
				end

					-- Try to find target first in `renamed_targets';
					-- if not found there, in `parent_project.targets':
				if renamed_targets.has (a_redefine.name) then
					a_target := renamed_targets.item (a_redefine.name)
				elseif parent_project.targets.has (a_redefine.name) then
					a_target := parent_project.targets.item (a_redefine.name)
				end

				if a_target = Void then
					msg := clone ("%NLOAD ERROR:%N")
					msg.append_string ("  Project '")
					msg.append_string (project.name)
					msg.append_string ("': cannot redefine target: `")
					msg.append_string (a_redefine.name)
					msg.append_string ("' since it does not exist.%N")
					exit_application (1, msg)
				end

				redefined_targets.force_last (a_target, a_redefine.name)
				if renamed_targets.has (a_redefine.name) then
					project.trace_debug ("Project '" + project.name + "': moving target '" + a_redefine.name + "' from list of renamed targets to list of redefined targets.%N")
					renamed_targets.remove (a_redefine.name)
				else
					project.trace_debug ("Project '" + project.name + "': adding target '" + a_redefine.name + "' to list of redefined targets.%N")
				end

				a_redefine_cursor.forth
			end
		end

	apply_unchangeds is
			-- Temporarily store not redeclared targets.
		local
			a_target_cursor: DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING]
			a_target: GEANT_TARGET
			a_target_name: STRING
		do
			from
				a_target_cursor := parent_project.targets.new_cursor
				a_target_cursor.finish
			until
				a_target_cursor.before
			loop
				a_target := a_target_cursor.item
				a_target_name := a_target_cursor.key
				if
					not renamed_targets.has_item (a_target)
					and not redefined_targets.has_item (a_target)
				then
					unchanged_targets.force_last (a_target, a_target_name)
				end

				a_target_cursor.back
			end
		end

	apply_undeclared_redefines is
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
			msg: STRING
		do
			from
				a_target_cursor := project.targets.new_cursor
				a_target_cursor.start
			until
				a_target_cursor.after
			loop
				a_target := a_target_cursor.item
				a_target_name := a_target_cursor.key
				if unchanged_targets.has (a_target_name) then
					msg := clone ("Project '")
					msg.append_string (project.name)
					msg.append_string ("': WARNING: Applying implicit redefinition for target `")
					msg.append_string (a_target_name)
					msg.append_string ("' due to old inheritance format.%N")
					project.trace (msg)

					redefined_targets.force_last (unchanged_targets.item (a_target_name), a_target_name)
					unchanged_targets.remove (a_target_name)
				end

				a_target_cursor.forth
			end
		end

	apply_selects is
			-- Apply select clauses to `project'.
		local
			a_select_cursor: DS_LINEAR_CURSOR [GEANT_SELECT]
			a_select: GEANT_SELECT
			a_target: GEANT_TARGET
			msg: STRING
		do
			from
				a_select_cursor := selects.new_cursor
				a_select_cursor.start
			until
				a_select_cursor.after
			loop
				a_select := a_select_cursor.item
				if not a_select.is_executable then
					exit_application (1, "invalid select clause.")
				end

					-- Try to find target first in `redefined_targets';
					-- if not found there, in `renamed_targets';
					-- if not found there, in `unchanged_targets':
				if redefined_targets.has (a_select.name) then
					a_target := redefined_targets.item (a_select.name)
				elseif renamed_targets.has (a_select.name) then
					a_target := renamed_targets.item (a_select.name)
				elseif unchanged_targets.has (a_select.name) then
					a_target := unchanged_targets.item (a_select.name)
				end

				if a_target = Void then
					msg := clone ("%NLOAD ERROR:%N")
					msg.append_string ("  Project '")
					msg.append_string (project.name)
					msg.append_string ("': selected target: `")
					msg.append_string (a_select.name)
					msg.append_string ("' does not exist.%N")
					exit_application (1, msg)
				end

				project.trace_debug ("Project '" + project.name + "': moving target '" + a_select.name + "' to list of selected targets.%N")
				parent_project.selected_targets.force_last (a_target, a_select.name)

				a_select_cursor.forth
			end
		end

invariant

	renames_not_void: renames /= Void
	redefines_not_void: redefines /= Void
	selects_not_void: selects /= Void

end
