indexing

	description:

		"Contents of geant project files"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_PROJECT

inherit

	GEANT_ELEMENT_NAMES
		export {NONE} all end

	KL_SHARED_ARGUMENTS
	KL_SHARED_EXCEPTIONS
	KL_SHARED_FILE_SYSTEM

creation

	make, make_with_filename

feature {NONE} -- Initialization

	make (a_variables: GEANT_VARIABLES) is
			-- Create a new project using file `build.eant'.
		do
			make_with_filename (Default_build_filename, a_variables)
		end

	make_with_filename (a_filename: UC_STRING; a_variables: GEANT_VARIABLES) is
			-- Create a new project using file `a_filename'.
			-- Set `variables' to `a_variables'. If Void create new variables
		require
			a_filename_not_void: a_filename /= Void
			a_filename_not_empty: not a_filename.empty
		do
			build_filename := a_filename
			if not file_system.is_file_readable (build_filename.out) then
				print ("cannot read build file '" + build_filename.out + "'")
				Exceptions.die (1)
			end

			if a_variables = Void then
				!! variables.make
			else
				set_variables (a_variables)
			end
			!! build_targets.make (10)
			!! executed_targets.make (10)
		ensure
			build_filename_set: build_filename = a_filename
			variables_set: a_variables /= Void implies variables = a_variables
			variables_created: a_variables = Void implies variables /= Void and variables.variables.count = 0
		end

feature -- Access

	build_filename: UC_STRING
			-- Name of the file containing the configuration
			-- information to build current project

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

	target_with_name (a_name: UC_STRING): GEANT_TARGET is
			-- Target with `name' `a_name'
		require
			loaded: targets /= Void
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		local
			i, nb: INTEGER
			a_target: GEANT_TARGET
		do
			nb := targets.count
			from i := 1 until i > nb or Result /= Void loop
				a_target := targets.item (i)
				if a_target.name.is_equal (a_name.out)
				then
					Result := a_target
				end

				i := i + 1
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
			ucs: UC_STRING
			start_target_name: UC_STRING
			children: DS_ARRAYED_LIST [GEANT_ELEMENT]
			target_elements: DS_ARRAYED_LIST [GEANT_ELEMENT]
			an_element: GEANT_ELEMENT
			a_target: GEANT_TARGET
			i: INTEGER

	    do
				-- Reset current project's state:
			reset
			if verbose then
				print("Loading Project's configuration from " + build_filename.out + "%N")
			end
				-- Create xml parser:
			!! xml_parser.make_from_imp (Parser_factory.new_eiffel_event_parser_imp)
			xml_parser.parse_from_file_name (build_filename)
				-- Setup project's root element:
			root_element := xml_parser.root_element
			if root_element /= Void then
					-- determine description if available:
				children := root_element.children
				if children.count > 0 then
					an_element := children.item (1)
					if an_element.name.is_equal (Description_element_name) then
						set_description (an_element.content.out)
					end
				end
					-- Find all target elements of current project:
				target_elements := root_element.children_by_name (Target_element_name)

					-- Create real GEANT_TARGETs from the GEANT_ELEMENTs:
				!! targets.make (target_elements.count)
				from i := 1 until i > target_elements.count loop
					!! a_target.make (Current, target_elements.item (i))
					targets.force_last (a_target)
					i := i + 1
				end

					-- Use passed start target if provided and exists
				if a_start_target_name /= Void and then a_start_target_name.count > 0 then
					!! ucs.make_from_string (a_start_target_name)
					if target_with_name (ucs) /= Void then
						start_target_name := ucs
					else
						print ("geant error: unknown target: " + a_start_target_name.out + "%N")
						Exceptions.die (1)
					end
				end

					-- Find start target:
				if start_target_name = Void or else start_target_name.count = 0 then
					if root_element.has_attribute (Default_attribute_name) then
						ucs := root_element.attribute_value_by_name (Default_attribute_name)
						if target_with_name (ucs) /= Void then
							start_target_name := ucs
						end
					else
							-- Use first target in project file for start_target_name:
						if targets /= void and then targets.count > 0 then
							!! start_target_name.make_from_string (targets.item (1).name)
						end
					end
				end
				if start_target_name = Void then
					reset
					print ("geant error: unknown target%N")
				elseif start_target_name.empty then
					reset
					print ("geant error: unknown target%N")
				else
							-- put start target on the stack:
					build_targets.force (target_with_name (start_target_name))
				end
			else
				reset
				print ("Parsing error in file %"" + build_filename.out + "%"%N")
			end
	    end

	calculate_build_order is
			-- Setup `build_targets' according to target dependencies
		require
			loaded: targets /= Void
			build_targets_not_void: build_targets /= Void
			build_targets_not_empty: build_targets.count > 0
		local
			a_target: GEANT_TARGET
			a_dependent_targets: DS_ARRAYED_STACK [GEANT_TARGET]
		do
				-- Get dependent targets:
			a_target := build_targets.item
			if verbose then
				print("**pushing target : " + a_target.name + "%N")
			end
			a_dependent_targets := a_target.dependent_targets


				-- Add all dependent targets to `build_targets':
			from until a_dependent_targets.count = 0 loop
				build_targets.force (a_dependent_targets.item)
				a_dependent_targets.remove
					-- Recursive call of routine for dependent target:
				calculate_build_order
			end
		end

	build is
			-- Build project: execute project's tasks.
		require
			loaded: targets /= Void
		local
			a_target: GEANT_TARGET
		do
			if verbose then
				print("Building Project%N")
			end
				-- Analyse dependencies of targets:
			calculate_build_order

				-- Execute configured targets:
			from until build_targets.count = 0 loop
				a_target := build_targets.item
				if not executed_targets.has (a_target) then
						-- Execute topmost target of `build_targets':
					execute_target (a_target)
				end
				build_targets.remove
			end
		end

	execute_target (a_target: GEANT_TARGET) is
			-- Execute `a_target';
			-- Add `a_target' to `executed_targets'.
		require
			target_not_void: a_target = Void
		do
			current_target := a_target
			print("%N" + a_target.name)
			if verbose then
				print(" (stack item nr=" + build_targets.count.out + ")")
			end
			print(":%N%N")
			a_target.execute
			executed_targets.force_last (a_target)
			current_target := Void
		ensure
			target_added_toexecuted_targets: executed_targets.has (a_target)
			current_target_void: current_target = Void
		end


	reset is
			-- Reset current state of project.
		do
			root_element := Void
			targets := Void
			build_successful := True
		end

	build_targets: DS_ARRAYED_STACK [GEANT_TARGET]
			-- Targets to be executed

feature {GEANT_COMMAND} -- Access GEANT_COMMAND

	current_target: GEANT_TARGET
		-- Currently executing target;
		-- Set during processing `execute_target'

feature {NONE} -- Implementation

	root_element: GEANT_ELEMENT
			-- Root element of project

	Parser_factory: XM_PARSER_FACTORY is
			-- Factory to create xml parsers
		once
			!! Result.make
		ensure
			parser_factory_not_void: Result /= Void
		end

	executed_targets: DS_ARRAYED_LIST [GEANT_TARGET]
			-- Targets already executed

invariant

	build_filename_not_void: build_filename /= Void
	build_filename_not_empty: not build_filename.empty
	no_void_target: targets /= Void implies not targets.has (Void)

end -- class GEANT_PROJECT
