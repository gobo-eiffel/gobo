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
		export {NONE} all end

	KL_SHARED_EXCEPTIONS
		export {NONE} all end

	GEANT_SHARED_PROPERTIES
		export {NONE} all end

creation

	make

feature {NONE} -- Initialization

	make (a_variables: GEANT_VARIABLES; a_options: GEANT_PROJECT_OPTIONS) is
			-- Create a new project.
		require
			a_variables_not_void: a_variables /= Void
			a_options_not_void: a_options /= Void
		local
			a_tester: UC_EQUALITY_TESTER
		do
			output_file := std.output
			if a_variables = Void then
				create variables.make
			else
				set_variables (a_variables)
			end
			set_options (a_options)
			create selected_targets.make_map (5)
			create a_tester
			selected_targets.set_key_equality_tester (a_tester)
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

	start_target: GEANT_TARGET is
			-- Target with which build will start
		do
			if start_target_name /= Void and then start_target_name.count > 0 then
				if targets.has (start_target_name) then
					Result := targets.item (start_target_name)
				end
			end
		end

	default_target: GEANT_TARGET is
			-- Target with which build starts in case `start_target' is Void
		do
			if default_target_name /= Void and then default_target_name.count > 0 then
				if targets.has (default_target_name) then
					Result := targets.item (default_target_name)
				end
			end
		end

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
			targets_not_void: targets /= Void
			has_target: targets.has_item (a_target)
		local
			a_cursor: DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING]
		do
			a_cursor := targets.new_cursor
			from a_cursor.start until a_cursor.after loop
				if a_target = a_cursor.item then
					Result := a_cursor.key
					a_cursor.go_after -- Jump out of the loop.
				else
					a_cursor.forth
				end
			end
		ensure
			target_name_not_void: Result /= Void
			target_name_not_empty: Result.count > 0
		end

	default_target_name: STRING
			-- Name of default target if set

feature -- Status report

	has_parent_with_name (a_name: STRING): BOOLEAN is
			-- Does current project have a parent project named `a_name'?
		local
			i: INTEGER
			a_parent_project: GEANT_PROJECT
		do
			if inherit_clause /= Void then
				from i := 1 until Result or else i > inherit_clause.parents.count loop
					a_parent_project := inherit_clause.parents.item (i).parent_project

					Result := a_parent_project.name.is_equal (a_name)
					if not Result then
						Result := a_parent_project.has_parent_with_name (a_name)
					end
					i := i + 1
				end
			end
		end

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
			targets_has_a_start_target_name: targets.has (a_start_target_name)
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
				a_parent_cursor := inherit_clause.parents.new_cursor
				from a_parent_cursor.start until a_parent_cursor.after loop
					a_parent := a_parent_cursor.item
					check parents_parent_project_not_void: a_parent.parent_project /= Void end
					a_parent.prepare_project
					a_parent_cursor.forth
				end
					-- Merge parent projects:
				a_parent_cursor := inherit_clause.parents.new_cursor
				from a_parent_cursor.start until a_parent_cursor.after loop
					a_parent := a_parent_cursor.item
					inherit_clause.merge_in_parent_project (a_parent)
					a_parent_cursor.forth
				end
				inherit_clause.apply_selects
					-- List all targets:
				from
					a_target_cursor := targets.new_cursor
					a_target_cursor.start
					trace_debug (<<"Project '", name, "': target list:">>)
				until
					a_target_cursor.after
				loop
					a_target := a_target_cursor.item
					trace_debug (<<"  target `", a_target_cursor.key, "' (", a_target.full_name, ")">>)
					a_target.show_precursors
					a_target_cursor.forth
				end
			end
		end

	calculate_depend_order (a_depend_targets: DS_ARRAYED_STACK [GEANT_TARGET]) is
			-- Setup `build_targets' according to target dependencies.
		require
			loaded: targets /= Void
			depend_targets_not_void: a_depend_targets /= Void
		local
			a_target: GEANT_TARGET
			a_tmp_dependent_targets: DS_ARRAYED_STACK [GEANT_TARGET]
		do
				-- Get dependent targets:
			a_target := a_depend_targets.item
			trace_debug (<<"pushing target: ", a_target.name>>)
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
			trace (<<"Building Project">>)

				-- Determine start target:
			if start_target_name /= Void and then start_target_name.count > 0 then
				if start_target = Void then
					exit_application (1, <<"Cannot determine start target `", start_target_name + "%'">>)
				else
					a_target := start_target
				end
			end
			if a_target = Void then
					-- Use default target as start target if exists:
				a_target := default_target
			end
			if a_target = Void then
				exit_application (1, <<"Cannot determine start target.">>)
			end

			build_target (a_target)
		end

	show_target_info is
			-- Print list of name and description for all targets of project.
		require
			targets_not_void: targets /= Void
		local
			a_cursor: DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING]
			a_target: GEANT_TARGET
		do
			a_cursor := targets.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_target := a_cursor.item
				if a_target.is_exported_to_any then
					output_file.put_line (a_target.full_name)
					output_file.put_line ("  " + a_target.description)
				end
				a_cursor.forth
			end
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
			trace_debug (<<"project '", name, "': excuting target `", a_target.full_name, "%'">>)
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

	trace (a_message: ARRAY [STRING]) is
			-- Write `a_message' to standard output unless `verbose' = False.
		require
			a_message_not_void: a_message /= Void
			-- Note: ARRAY.has is not portable:
			-- no_void_message: not a_message.has (Void)
		local
			i, nb: INTEGER
		do
			if options.verbose then
				i := a_message.lower
				nb := a_message.upper
				from until i > nb loop
					output_file.put_string (a_message.item (i))
					i := i + 1
				end
				output_file.put_new_line
				output_file.flush
			end
		end

	log (a_message: ARRAY [STRING]) is
			-- Write `a_message' to standard output.
		require
			a_message_not_void: a_message /= Void
			-- Note: ARRAY.has is not portable:
			-- no_void_message: not a_message.has (Void)
		local
			i, nb: INTEGER
		do
			i := a_message.lower
			nb := a_message.upper
			from until i > nb loop
				output_file.put_string (a_message.item (i))
				i := i + 1
			end
			output_file.put_new_line
			output_file.flush
		end

	trace_debug (a_message: ARRAY [STRING]) is
			-- Write `a_message' to standard output unless `debug_mode' = False.
		require
			a_message_not_void: a_message /= Void
			-- Note: ARRAY.has is not portable:
			-- no_void_message: not a_message.has (Void)
		local
			i, nb: INTEGER
		do
			if options.debug_mode then
				i := a_message.lower
				nb := a_message.upper
				from until i > nb loop
					output_file.put_string (a_message.item (i))
					i := i + 1
				end
				output_file.put_new_line
				output_file.flush
			end
		end

	output_file: KI_TEXT_OUTPUT_STREAM
			-- Output file

	set_output_file (a_file: like output_file) is
			-- Set `output_file' to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			output_file := a_file
		ensure
			output_file_set: output_file = a_file
		end

feature {GEANT_COMMAND} -- Access GEANT_COMMAND

	current_target: GEANT_TARGET
			-- Currently executing target;
			-- Set during processing `execute_target'

invariant

	no_void_target: targets /= Void implies not targets.has (Void)
	output_file_not_void: output_file /= Void
	output_file_open_write: output_file.is_open_write

end
