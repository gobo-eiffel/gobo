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

creation

	make, make_with_filename

feature {NONE} -- Initialization

	make is
			-- Create a new project using file `build.eant'.
		do
			make_with_filename (Default_build_filename)
		end

	make_with_filename (a_filename: UC_STRING) is
			-- Create a new project using file `a_filename'.
		require
			a_filename_not_void: a_filename /= Void
			a_filename_not_empty: not a_filename.empty
		do
			build_filename := a_filename
			!! Build_targets.make (10)
			!! Executed_targets.make (10)
		ensure
			build_filename_set: build_filename = a_filename
		end

feature -- Access

	build_filename: UC_STRING
			-- Name of the file containing the configuration
			-- information to build current project

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

feature -- Processing

	load (a_start_target_name : STRING) is
			-- Read current project's configuration from `build_filename'
			-- and convert it into a 'GEANT_DOM'.
			-- When set use `a_start_target_name' for first target to execute
		local
			xml_parser: GEANT_PROJECT_PARSER
			ucs: UC_STRING
			start_target_name: UC_STRING
			target_elements: DS_ARRAYED_LIST [GEANT_ELEMENT]
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
					Build_targets.force (target_with_name (start_target_name))
				end
			else
				reset
				print ("Parsing error in file %"" + build_filename.out + "%"%N")
			end
	    end

	calculate_build_order is
			-- Setup `Build_targets' according to target dependencies
		require
			loaded: targets /= Void
			target_not_void: a_target /= Void
			build_targets_not_void: Build_targets /= Void
			build_targets_not_empty: Build_targets.count > 0
		local
			a_target: GEANT_TARGET
			a_dependent_targets: DS_ARRAYED_STACK [GEANT_TARGET]
		do
				-- Get dependent targets:
			a_target := Build_targets.item
			if verbose then
				print("**pushing target : " + a_target.name + "%N")
			end
			a_dependent_targets := a_target.dependent_targets


				-- Add all dependent targets to `Build_targets':
			from until a_dependent_targets.count = 0 loop
				Build_targets.force (a_dependent_targets.item)
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
			from until Build_targets.count = 0 loop
				a_target := Build_targets.item
				if not Executed_targets.has (a_target) then
						-- Execute topmost target of `Build_targets':
					print("%N" + a_target.name)
					if verbose then
						print(" (stack item nr=" + Build_targets.count.out + ")")
					end
					print(":%N%N")
					a_target.execute
					Executed_targets.force_last (a_target)
				end
				Build_targets.remove
			end
		end




	reset is
			-- Reset current state of project.
		do
			root_element := Void
			targets := Void
			build_successful := True
		end

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

	Build_targets: DS_ARRAYED_STACK [GEANT_TARGET]
			-- Targets to be executed

	Executed_targets: DS_ARRAYED_LIST [GEANT_TARGET]
			-- Targets already executed

invariant

	build_filename_not_void: build_filename /= Void
	build_filename_not_empty: not build_filename.empty
	no_void_target: targets /= Void implies not targets.has (Void)
	current_target_name_not_void: targets /= Void implies current_target_name /= Void
	current_target_name_not_empty: targets /= Void implies not current_target_name.empty

end -- class GEANT_PROJECT
