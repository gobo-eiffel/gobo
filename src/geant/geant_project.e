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
		ensure
			build_filename_set: build_filename = a_filename
		end

feature -- Access

	build_filename: UC_STRING
			-- Name of the file containing the configuration
			-- information to build current project

	targets: DS_ARRAYED_LIST [GEANT_ELEMENT]
			-- Target elements found in current project

	build_successful: BOOLEAN
			-- Was last build successful?

	verbose: BOOLEAN
		-- Print additional information during build process?

	target_with_name (a_name: UC_STRING): GEANT_ELEMENT is
			-- Target with `name' `a_name'
		require
			loaded: targets /= Void
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		local
			i, nb: INTEGER
			a_target: GEANT_ELEMENT
		do
			nb := targets.count
			from i := 1 until i > nb or Result /= Void loop
				a_target := targets.item (i)
				if
					a_target.has_attribute (Name_attribute_name) and then
					a_target.attribute_value_by_name (Name_attribute_name).is_equal (a_name)
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
	    do
				-- Reset current project's state:
			reset
				-- Create xml parser:
			!! xml_parser.make_from_imp (Parser_factory.new_eiffel_event_parser_imp)
			xml_parser.parse_from_file_name (build_filename)
				-- Setup project's root element:
			root_element := xml_parser.root_element
			if root_element /= Void then
					-- Find all the targets of current project:
				targets := root_element.children_by_name (Target_element_name)

					-- Use passed start target if provided and exists
				if a_start_target_name /= Void and then a_start_target_name.count > 0 then
					!! ucs.make_from_string (a_start_target_name)
					if target_with_name (ucs) /= Void then
						start_target_name := ucs
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
							ucs := targets.item(1).attribute_value_by_name (Name_attribute_name)
							if target_with_name (ucs) /= Void then
								start_target_name := ucs
							end
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
			a_target: GEANT_ELEMENT
			a_dependent_targets: DS_ARRAYED_STACK [GEANT_ELEMENT]
		do
				-- Get dependent targets:
			a_target := Build_targets.item
--!!print("**pushing target : " + a_target.attribute_value_by_name (Name_attribute_name).out + "%N")
			a_dependent_targets := targets_dependent_targets(a_target)


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
			a_target: GEANT_ELEMENT
		do
				-- Analyse dependencies of targets:
			calculate_build_order

--!!print("%N%N%N")

				-- Execute configured targets:
			from until Build_targets.count = 0 loop
				a_target := Build_targets.item
				if not Executed_targets.has (a_target) then
						-- Execute topmost target of `Build_targets':
--!!print("**executing target : " + a_target.attribute_value_by_name (Name_attribute_name).out + "%N")
					execute_tasks_of_target (a_target)
					Executed_targets.force_last (a_target)
				end
				Build_targets.remove
			end

		end

	targets_dependent_targets (a_target: GEANT_ELEMENT): DS_ARRAYED_STACK [GEANT_ELEMENT] is
			-- All dependent targets of `a_target'
			--!! Candidate feature for GEANT_TARGET
		require
			target_not_void: a_target /= Void
		local
			an_element: GEANT_ELEMENT
			a_value: UC_STRING
			a_dependent_targets: DS_ARRAYED_LIST [UC_STRING]
			i: INTEGER
		do
			!! Result.make (10)
			if a_target.has_attribute (Depends_attribute_name) then
				a_value := a_target.attribute_value_by_name (Depends_attribute_name)

					-- Check for targets separated by commas:
				a_dependent_targets := string_tokens (a_value)

				if verbose then
					show_dependent_targets (a_dependent_targets)
				end

					-- Loop backwards so that leftmost dependent target gets executed first
				from i := 1 until i > a_dependent_targets.count loop
					a_value := a_dependent_targets.item (i)
					an_element := target_with_name (a_value)
					if an_element /= Void then
						Result.force (an_element)
					else
						print ("geant error: unknown dependent target '" + a_value.out + "'%N")
--!!					Exceptions.die (1)
					end
					i := i + 1
				end
			end
		ensure
			dependent_targets_not_void: Result /= Void
		end

	show_dependent_targets (a_dependent_targets: DS_ARRAYED_LIST [UC_STRING]) is
		local
			i: INTEGER
		do
			print ("======= DEPS ==========%N")
			from i := 1 until i > a_dependent_targets.count loop
				print (a_dependent_targets.item (i).out + "%N")
				i := i + 1
			end
			print ("=================%N")
		end

	string_tokens (a_string: UC_STRING): DS_ARRAYED_LIST [UC_STRING] is
			-- Strings delimited by commas in `a_string'
			-- Candidate for STRING_ROUTINES
		require
			string_not_void: a_string /= Void
		local
			a_delimiter: UC_CHARACTER
			s: UC_STRING
			ucs: UC_STRING
			p_start: INTEGER
			p_end: INTEGER
			nice_string: BOOLEAN
		do
			s := clone (a_string)
			!! Result.make (5)
			a_delimiter.make_from_character (',')

				-- Cleanup String:
			from
				s.left_adjust
				s.right_adjust
			until
				nice_string
			loop
				nice_string := True
				if s.count > 0 then
					if s.item (1) = a_delimiter then
						s.tail(s.count - 1)
						nice_string := False
					end
				end
	
				if s.count > 0 then
					if s.item (s.count) = a_delimiter then
						s.head(s.count - 1)
						nice_string := False
					end
				end

			end

				-- Find Tokens:
			from 
				p_start := 1
				p_end := s.index_of (a_delimiter, p_start)
			until
				p_end = 0 or p_start > s.count
			loop
				ucs := s.substring (p_start, p_end - 1)
				ucs.left_adjust
				ucs.right_adjust
				if ucs.count > 0 then
					Result.force_last (ucs)
				end
				p_start := p_end + 1

				if p_start <= s.count then
					p_end := s.index_of (a_delimiter, p_start)
				end
			end

				-- Append last token:
			if p_start <= s.count then
				ucs := s.substring (p_start, s.count)
				ucs.left_adjust
				ucs.right_adjust
				if ucs.count > 0 then
					Result.force_last (ucs)
				end
			end

		end


	execute_tasks_of_target (a_target: GEANT_ELEMENT) is
			-- Execute all tasks of `a_target' in sequential order
			--!! Candidate feature for GEANT_TARGET
		require
			target_not_void: a_target /= Void
		local
			children: DS_ARRAYED_LIST [GEANT_ELEMENT]
			i, nb: INTEGER
			an_element: GEANT_ELEMENT
			a_task: GEANT_TASK
		do
			children := a_target.children
			nb := children.count
			from i := 1 until i > nb loop
				an_element := children.item (i)
					-- Dispatch tasks:
				if an_element.name.is_equal (Compile_se_task_name) then
						-- compile_se: SmallEiffel compilation
					!GEANT_COMPILE_SE_TASK! a_task.make_from_element (an_element)
				elseif an_element.name.is_equal (Exec_task_name) then
						-- exec
					!GEANT_EXEC_TASK! a_task.make_from_element (an_element)
				elseif an_element.name.is_equal (Lcc_task_name) then
						-- lcc
					!GEANT_LCC_TASK! a_task.make_from_element (an_element)
				elseif an_element.name.is_equal (Var_task_name) then
						-- var
					!GEANT_VAR_TASK! a_task.make_from_element (an_element)
				elseif an_element.name.is_equal (Gexace_task_name) then
						-- gexace
					!GEANT_GEXACE_TASK! a_task.make_from_element (an_element)
				elseif an_element.name.is_equal (Gelex_task_name) then
						-- gelex
					!GEANT_GELEX_TASK! a_task.make_from_element (an_element)
				elseif an_element.name.is_equal (Geyacc_task_name) then
						-- geyacc
					!GEANT_GEYACC_TASK! a_task.make_from_element (an_element)
				elseif an_element.name.is_equal (Gepp_task_name) then
						-- gepp
					!GEANT_GEPP_TASK! a_task.make_from_element (an_element)
				elseif an_element.name.is_equal (Getest_task_name) then
						-- getest
					!GEANT_GETEST_TASK! a_task.make_from_element (an_element)
				elseif an_element.name.is_equal (Geant_task_name) then
						-- geant
					!GEANT_GEANT_TASK! a_task.make_from_element (an_element)
				elseif an_element.name.is_equal (Echo_task_name) then
						-- echo
					!GEANT_ECHO_TASK! a_task.make_from_element (an_element)
				else
						-- Default:
					a_task := Void
				end
					-- Execute task:
				if a_task = Void then
					print ("WARNING: unknown task : " + an_element.name.out + "%N")
				elseif not a_task.is_executable then
					print ("WARNING: cannot execute task : " + an_element.name.out + "%N")
				else
					a_task.execute
				end
				i := i + 1
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

	Build_targets: DS_ARRAYED_STACK [GEANT_ELEMENT] is
			-- Targets to be executed
		once
			!! Result.make (10)
		ensure
			build_targets_not_void: Result /= Void
		end

	Executed_targets: DS_ARRAYED_LIST [GEANT_ELEMENT] is
			-- Targets already executed
		once
			!! Result.make (10)
		ensure
			executed_targets_not_void: Result /= Void
		end

invariant

	build_filename_not_void: build_filename /= Void
	build_filename_not_empty: not build_filename.empty
	no_void_target: targets /= Void implies not targets.has (Void)
	current_target_name_not_void: targets /= Void implies current_target_name /= Void
	current_target_name_not_empty: targets /= Void implies not current_target_name.empty

end -- class GEANT_PROJECT
