indexing

	description:

		"Contents of geant project files"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001-2002, Sven Ehrke and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"


class GEANT_PROJECT

inherit

	ANY

	KL_SHARED_ARGUMENTS
		export
			{NONE} all
		end

	KL_SHARED_EXCEPTIONS
		export
			{NONE} all
		end

	GEANT_SHARED_PROPERTIES
		export
			{NONE} all
		end

creation

	make

feature {NONE} -- Initialization

	make (a_variables: GEANT_VARIABLES; a_options: GEANT_PROJECT_OPTIONS) is
			-- Create a new project.
		require
			a_variables_not_void: a_variables /= Void
			a_options_not_void: a_options /= Void
		do
			if a_variables = Void then
				create variables.make
			else
				set_variables (a_variables)
			end
			set_options (a_options)
			create selected_targets.make (5)
			build_successful := True
		ensure
			variables_set: a_variables /= Void implies variables = a_variables
			variables_created: a_variables = Void implies variables /= Void
			options_set: a_options /= Void implies options = a_options
			selected_targets_not_void: selected_targets /= Void
		end

feature -- Access

	name: STRING
			-- Name of project

	start_target_name: STRING
			-- Name of first target to be built

	description: STRING
			-- Project description

	variables: GEANT_VARIABLES
			-- Project variables

	options: GEANT_PROJECT_OPTIONS
			-- Project options

	targets: DS_HASH_TABLE [GEANT_TARGET, STRING]
			-- Immediate targets

	selected_targets: DS_HASH_TABLE [GEANT_TARGET, STRING]
			-- Targets selected in heir

	build_successful: BOOLEAN
			-- Was last build successful?

	inherit_clause: GEANT_INHERIT
		-- Inherit clause

	old_inherit: BOOLEAN
			-- Was current defined via old inheritance mechanism?
			-- TODO: remove after obsolete period

	target_name (a_target: GEANT_TARGET): STRING is
			-- Name of target `a_target' within context of current project
		require
			a_target_not_void: a_target /= Void
			has_target: targets.has_item (a_target)
		local
			a_cursor: DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING]
		do
			from
				a_cursor := targets.new_cursor
				a_cursor.start
			until
				a_cursor.after or else Result /= Void
			loop
				if a_target = a_cursor.item then
					Result := a_cursor.key
				end

				a_cursor.forth
			end
		ensure
			target_name_not_void: Result /= Void
			target_name_not_empty: Result.count > 0
		end

	default_target_name: STRING
			-- Name of default target if set

feature -- Setting

	set_description (a_description: STRING) is
			-- Set `description' to `a_description'.
		require
			a_description_not_void: a_description /= Void
			a_description_not_empty: a_description.count > 0
		do
			description := a_description
		ensure
			description_set: description = a_description
		end

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

	set_start_target_name (a_start_target_name: STRING) is
			-- Set `start_target_name' to `a_start_target_name'.
		require
			a_start_target_name_not_void: a_start_target_name /= Void
			a_start_target_name_not_empty: a_start_target_name.count > 0
		do
			start_target_name := a_start_target_name
		ensure
			start_target_name_set: start_target_name = a_start_target_name
		end

	set_default_target_name (a_default_target_name: STRING) is
			-- Set `default_target_name' to `a_default_target_name'.
		require
			a_default_target_name_not_void: a_default_target_name /= Void
			a_default_target_name_not_empty: a_default_target_name.count > 0
		do
			default_target_name := a_default_target_name
		ensure
			default_target_name_set: default_target_name = a_default_target_name
		end

	set_targets (a_targets: like targets) is
			-- Set `targets' to `a_targets'.
		require
			a_targets_not_void: a_targets /= Void
		do
			targets := a_targets
		ensure
			targets_set: targets = a_targets
		end

	set_variables (a_variables: like variables) is
			-- Set `variables' to `a_variables'.
		require
			a_variables_not_void: a_variables /= Void
		do
			variables := a_variables
		ensure
			variables_set: variables = a_variables
		end

	set_options (a_options: like options) is
			-- Set `options' to `a_options'.
		require
			a_options_not_void: a_options /= Void
		do
			options := a_options
		ensure
			options_set: options = a_options
		end

	set_inherit_clause (a_inherit_clause: like inherit_clause) is
			-- Set `inherit_clause' to `a_inherit_clause'.
		require
			a_inherit_clause_not_void: a_inherit_clause /= Void
		do
			inherit_clause := a_inherit_clause
		ensure
			inherit_clause_set: inherit_clause = a_inherit_clause
		end

	set_old_inherit (a_old_inherit: BOOLEAN) is
			-- Set `old_inherit' to `a_old_inherit'.
			-- TODO: remove after obsolete period
		do
			old_inherit := a_old_inherit
		ensure
			old_inherit_set: old_inherit = a_old_inherit
		end

feature -- Processing

	merge_in_parent_projects is
			-- Load parent projects if present.
		local
			a_parent: GEANT_PARENT
			a_parent_cursor: DS_LINEAR_CURSOR [GEANT_PARENT]
			a_target: GEANT_TARGET
			a_target_cursor: DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING]
		do
				-- Handle inherit_clause:
			if inherit_clause /= Void then
					-- Prepare parent projects:
				from
					a_parent_cursor := inherit_clause.parents.new_cursor
					a_parent_cursor.start
				until
					a_parent_cursor.after
				loop
					a_parent := a_parent_cursor.item
					a_parent.prepare_project

					a_parent_cursor.forth
				end

					-- Merge parent projects:
				from
					a_parent_cursor := inherit_clause.parents.new_cursor
					a_parent_cursor.start
				until
					a_parent_cursor.after
				loop
					a_parent := a_parent_cursor.item
					inherit_clause.merge_in_parent_project (a_parent)

					a_parent_cursor.forth
				end

				inherit_clause.apply_selects

					-- List all targets:
				from
					a_target_cursor := targets.new_cursor
					a_target_cursor.start
					trace_debug ("Project '" + name + "': target list:%N")
				until
					a_target_cursor.after
				loop
					a_target := a_target_cursor.item
					trace_debug ("  target `" + a_target_cursor.key  + "' (" + a_target.full_name + ")%N")
					a_target.show_precursors

					a_target_cursor.forth
				end
			end
		end

	calculate_depend_order (a_depend_targets: DS_ARRAYED_STACK [GEANT_TARGET]) is
			-- Setup `build_targets' according to target dependencies
		require
			loaded: targets /= Void
			depend_targets_not_void: a_depend_targets /= Void
		local
			a_target: GEANT_TARGET
			a_tmp_dependent_targets: DS_ARRAYED_STACK [GEANT_TARGET]
		do
				-- Get dependent targets:
			a_target := a_depend_targets.item
			trace_debug ("pushing target: " + a_target.name + "%N")
			a_tmp_dependent_targets := a_target.dependent_targets

				-- Add all dependent targets to `build_targets':
			from until a_tmp_dependent_targets.count = 0 loop
				a_depend_targets.force (a_tmp_dependent_targets.item)
				a_tmp_dependent_targets.remove
					-- Recursive call of routine for dependent target:
				calculate_depend_order (a_depend_targets)
			end
		end

	build is
			-- Build project: execute project's tasks.
		require
			targets_not_void: targets /= Void
		local
			a_target: GEANT_TARGET
		do
			trace ("Building Project%N")

			if start_target_name /= Void and then start_target_name.count > 0 then
				if targets.has (start_target_name) then
					a_target := targets.item (start_target_name)
				else
					exit_application (1, "Cannot determine start target `" + start_target_name + "'%N")
				end
			end
			if a_target = Void then
					-- Use default target as start target if exists:
				if default_target_name /= Void and then default_target_name.count > 0 then
					if targets.has (default_target_name) then
						a_target := targets.item (default_target_name)
					end
				end
			end
			if a_target = Void then
				exit_application (1, "Cannot determine start target.")
			end

			build_target (a_target)
		end

	build_target (a_target: GEANT_TARGET) is
			-- Analyze dependencies and execute `a_target'.
		require
			a_target_not_void: a_target /= Void
		local
			depend_targets: DS_ARRAYED_STACK [GEANT_TARGET]
		do
			-- Analyze dependencies of targets:
			create depend_targets.make (10)
			depend_targets.force (a_target)
			calculate_depend_order (depend_targets)
				-- Execute depend targets:
			from until depend_targets.count = 1 loop
				execute_target (depend_targets.item, False, True)
				depend_targets.remove
			end
				-- Execute `a_target':
			check last_target: depend_targets.item = a_target end
			execute_target (a_target, True, True)
		end

	execute_target (a_target: GEANT_TARGET; a_force: BOOLEAN; a_polymorph: BOOLEAN) is
			-- Execute `a_target' if not executed before;
			-- Execute anyway if `a_force' is True.
		require
			target_not_void: a_target /= Void
		local
			old_current_target: like current_target
			a_execute_target: like current_target
		do
			trace_debug ("project '" + name + "': excuting target `" + a_target.full_name + "'%N")
			old_current_target := current_target
			if a_force or else not a_target.is_executed then

					-- Handle polymorphic calls:
				if a_polymorph then
					a_execute_target := a_target.final_target
				else
					a_execute_target := a_target
				end
				current_target := a_execute_target
				if a_execute_target.project /= Current then
					a_execute_target.project.execute_target (a_execute_target, a_force, a_polymorph)
				else
					a_execute_target.execute
				end
			end

			current_target := old_current_target
		end

feature -- Output

	trace (a_message: STRING) is
			-- Write `a_message' to standard output unless `verbose' = False.
		require
			message_not_void: a_message /= Void
		do
			if options.verbose then
				std.output.put_string (a_message)
				std.output.flush
			end
		end

	log (a_message: STRING) is
			-- Write `a_message' to standard output.
		require
			message_not_void: a_message /= Void
		do
			std.output.put_string (a_message)
			std.output.flush
		end

	trace_debug (a_message: STRING) is
			-- Write `a_message' to standard output unless `debug_mode' = False.
		require
			message_not_void: a_message /= Void
		do
			if options.debug_mode then
				std.output.put_string (a_message)
				std.output.flush
			end
		end

feature {GEANT_COMMAND} -- Access GEANT_COMMAND

	current_target: GEANT_TARGET
		-- Currently executing target;
		-- Set during processing `execute_target'

invariant

	no_void_target: targets /= Void implies not targets.has (Void)

end
