indexing

	description:

		"Contents of geant project files"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
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

	KL_SHARED_FILE_SYSTEM
		export
			{NONE} all
		end

	KL_SHARED_STANDARD_FILES
		export
			{NONE} all
		end

	GEANT_SHARED_PROPERTIES
		export
			{NONE} all
		end

creation

	make, make_with_filename

feature {NONE} -- Initialization

	make (a_variables: GEANT_VARIABLES) is
			-- Create a new project using file `build.eant'.
		do
			make_with_filename (Default_build_filename, a_variables, Void)
		end

	make_with_filename (a_filename: UC_STRING; a_variables: GEANT_VARIABLES; a_child_project: like Current) is
			-- Create a new project using file `a_filename'.
			-- Set `variables' to `a_variables'. If Void create new variables
			-- Set `child_project' to `a_child_project'.
		require
			a_filename_not_void: a_filename /= Void
			a_filename_not_empty: a_filename.count > 0
		do
			build_filename := a_filename
			if not file_system.is_file_readable (build_filename.out) then
				exit_application (1, "cannot read build file '" + build_filename.out + "' (Current working directory: " + file_system.current_working_directory + ")")
			end

			if a_variables = Void then
				!! variables.make
			else
				set_variables (a_variables)
			end
			child_project := a_child_project
		ensure
			build_filename_set: build_filename = a_filename
			variables_set: a_variables /= Void implies variables = a_variables
			variables_created: a_variables = Void implies variables /= Void
			child_project_set: child_project = a_child_project
		end

feature -- Access

	build_filename: UC_STRING
			-- Name of the file containing the configuration
			-- information to build current project

	name: STRING
			-- Name of project

	start_target_name: UC_STRING
			-- Name of first target to be built

	description: STRING
			-- project description

	variables: GEANT_VARIABLES
			-- project variables

	targets: DS_ARRAYED_LIST [GEANT_TARGET]
			-- Target elements found in current project

	build_successful: BOOLEAN
			-- Was last build successful?

	verbose: BOOLEAN
		-- Print additional information during build process?

	debug_mode: BOOLEAN
		-- Print additional, internal information during build process?

	no_exec: BOOLEAN
			-- Do not execute commands (only show what they would do)?

	parent_project: like Current
		-- Parent project if set by xml attribute 'inherit';
		-- Void otherwise

	child_project: like Current
		-- Child project if Current was created through xml attribute 'inherit';
		-- Void otherwise

	target_with_name (a_name: UC_STRING): GEANT_TARGET is
			-- Target with `name' `a_name'
		require
			loaded: targets /= Void
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		local
			i, nb: INTEGER
			a_target: GEANT_TARGET
			a_project: GEANT_PROJECT
		do
				-- Search "youngest" project in hierarchy:
			from
				a_project := Current
			until
				a_project.child_project = Void
			loop
				a_project := a_project.child_project
			end

				-- Search target named `a_name' from "youngest" project
				-- up to "oldest" project in hierarchy:
			from
			until
				Result /= Void or else a_project = Void
			loop
				if a_project.targets /= Void then
					nb := a_project.targets.count
					from i := 1 until i > nb or Result /= Void loop
						a_target := a_project.targets.item (i)
						trace_debug ("checking target name: '" + a_target.name + "'%N")
						if a_target.name.is_equal (a_name.out) then
							Result := a_target
						end
						i := i + 1
					end
				end
				a_project := a_project.parent_project
			end

		end

feature -- Setting

	set_verbose (a_verbose: BOOLEAN) is
			-- Set `verbose' to `a_verbose'
		do
			verbose := a_verbose
		ensure
			verbose_set: verbose = a_verbose
		end

	set_debug_mode (a_debug_mode: BOOLEAN) is
			-- Set `debug_mode' to `a_debug_mode'
		do
			debug_mode := a_debug_mode
		ensure
			debug_mode_set: debug_mode = a_debug_mode
		end

	set_no_exec (a_no_exec: BOOLEAN) is
			-- Set `no_exec' to `a_no_exec'
		do
			no_exec := a_no_exec
		ensure
			no_exec_set: no_exec = a_no_exec
		end

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

	set_variables (a_variables: like variables) is
			-- Set `variables' to `a_variables'.
		require
			a_variables_not_void: a_variables /= Void
		do
			variables := a_variables
		ensure
			variables_set: variables = a_variables
		end

feature -- Processing

	load (a_start_target_name: STRING) is
			-- Read current project's configuration from `build_filename'
			-- and convert it into a 'GEANT_DOM'.
			-- When set use `a_start_target_name' for first target to execute
		local
			xml_parser: GEANT_PROJECT_PARSER
			xml_parser_impl: XI_EVENT_PARSER
			ucs: UC_STRING
			tmp_start_target_name: UC_STRING
			target_elements: DS_ARRAYED_LIST [GEANT_XML_ELEMENT]
			a_target: GEANT_TARGET
			i: INTEGER
			a_parent_project_filename: UC_STRING

	    do
				-- Reset current project's state:
			reset
			trace ("Loading Project's configuration from " + build_filename.out + "%N")

				-- Create xml parser:
			if Parser_factory.is_expat_event_available then
				xml_parser_impl := Parser_factory.new_expat_event_parser_imp
			elseif Parser_factory.is_eiffel_event_available then
				xml_parser_impl := Parser_factory.new_eiffel_event_parser_imp
			else
				exit_application (1, "geant error: no XML parser available%N")
			end
			!! xml_parser.make_from_implementation (xml_parser_impl)
			xml_parser.parse_from_file_name (build_filename)

				-- Setup project's root element:
			if xml_parser.root_element /= Void then
				!! project_element.make (Current, xml_parser.root_element)

					-- determine description if available:
				if project_element.has_description then
					set_description (project_element.description)
				end
					-- handle project name if present:
				if project_element.has_name then
					set_name (project_element.name)
				end

					-- handle parent project if present:
				if project_element.has_parent then
					a_parent_project_filename := new_unicode_string (variables.interpreted_string (project_element.parent))
					trace_debug ("inheriting from: " + a_parent_project_filename.out + "%N")
					if a_parent_project_filename.count > 0 then
						!! parent_project.make_with_filename (a_parent_project_filename, variables, Current)
						parent_project.set_verbose (verbose)
						parent_project.set_debug_mode (debug_mode)
						parent_project.set_no_exec (no_exec)
						parent_project.load (Void)
					end
				end

					-- Find all target elements of current project:
				target_elements := project_element.xml_target_elements

					-- Create real GEANT_TARGETs from the GEANT_ELEMENTs:
				!! targets.make (target_elements.count)
				from i := 1 until i > target_elements.count loop
					!! a_target.make (Current, target_elements.item (i))
					targets.force_last (a_target)
					i := i + 1
				end

					-- Use passed start target if provided and exists:
				if a_start_target_name /= Void and then a_start_target_name.count > 0 then
					ucs := new_unicode_string (a_start_target_name)
					if target_with_name (ucs) /= Void then
						tmp_start_target_name := ucs
					else
						exit_application (1, "geant error: unknown target: '" + a_start_target_name.out + "'%N")
					end
				end

					-- Find start target:
				if tmp_start_target_name = Void or else tmp_start_target_name.count = 0 then
					if project_element.has_default_target_name then
						ucs := new_unicode_string (project_element.default_target_name)
						if target_with_name (ucs) /= Void then
							tmp_start_target_name := ucs
						else
							trace_debug ("default target NOT found: " + project_element.default_target_name + "%N")
						end
					else
							-- Use first target in project file for start_target_name:
						if targets /= void and then targets.count > 0 then
							tmp_start_target_name := new_unicode_string (targets.item (1).name)
						end
					end
				end
				if tmp_start_target_name = Void then
					reset
					print ("geant error: unknown target%N")
				elseif tmp_start_target_name.count = 0 then
					reset
					print ("geant error: unknown target%N")
				else
						-- put start target on the stack:
					start_target_name := tmp_start_target_name
				end
			else
				reset
				exit_application (1, "Parsing error in file %"" + build_filename.out + "%"%N")
			end

			if start_target_name = Void or else start_target_name.count = 0 then
				exit_application (1, "Invalid start target%N")
			end

		ensure
			start_target_name_not_void: start_target_name /= Void
			start_target_name_not_empty: start_target_name.count > 0
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
			loaded: targets /= Void
			start_target_name_not_void: start_target_name /= Void
			start_target_name_not_empty: start_target_name.count > 0
		do
			if verbose then
				print("Building Project%N")
			end
			build_target (target_with_name (start_target_name))
		end

	build_target (a_target: GEANT_TARGET) is
			-- Analyze dependencies and execute `a_target'.
		require
			a_target_not_void: a_target /= Void
		local
			depend_targets: DS_ARRAYED_STACK [GEANT_TARGET]
		do
			-- Analyze dependencies of targets.
			!! depend_targets.make (10)
			depend_targets.force (a_target)
			calculate_depend_order (depend_targets)
				-- Execute depend targets:
			from until depend_targets.count = 1 loop
				execute_target (depend_targets.item, False)
				depend_targets.remove
			end
				-- Execute `a_target'.
			check last_target: depend_targets.item = a_target end
			execute_target (a_target, True)
		end

	execute_target (a_target: GEANT_TARGET; a_force: BOOLEAN) is
			-- Execute `a_target' if not executed before;
			-- Execute anyway if `a_force' is True.
		require
			target_not_void: a_target /= Void
		local
			s: STRING
		do
			if a_force or else not a_target.is_executed then
				current_target := a_target
				if verbose then
					s := clone ("%N")
					if name /= Void then
						s.append_string (a_target.project.name)
						s.append_string (".")
					end
					s.append_string (a_target.name)
					s.append_string (":%N%N")
					print (s)
				end
				a_target.execute
			end
			current_target := Void
		ensure
			current_target_void: current_target = Void
		end

	reset is
			-- Reset current state of project.
		do
			project_element := Void
			targets := Void
			build_successful := True
		end

feature -- Output

	trace (a_message: STRING) is
			-- Write `a_message' to standard output unless `verbose' = False.
		require
			message_not_void: a_message /= Void
		do
			if verbose then
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
			if debug_mode then
				std.output.put_string (a_message)
				std.output.flush
			end
		end

feature {GEANT_COMMAND} -- Access GEANT_COMMAND

	current_target: GEANT_TARGET
		-- Currently executing target;
		-- Set during processing `execute_target'

feature {NONE} -- Implementation

	project_element: GEANT_PROJECT_ELEMENT
			-- Project element of build script

	Parser_factory: XM_PARSER_FACTORY is
			-- Factory to create xml parsers
		once
			!! Result.make
		ensure
			parser_factory_not_void: Result /= Void
		end

feature {NONE} -- Constants

	Default_build_filename: UC_STRING is
			-- Default Name of build file
		once
			Result := new_unicode_string ("build.eant")
		ensure
			filename_not_void: Result /= Void
			filename_not_empty: Result.count > 0
		end

invariant

	build_filename_not_void: build_filename /= Void
	build_filename_not_empty: build_filename.count > 0
	no_void_target: targets /= Void implies not targets.has (Void)

end -- class GEANT_PROJECT
