indexing

	description:

		"Target of geant build file"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_TARGET

inherit

	GEANT_ELEMENT_NAMES
		export {NONE} all end
	KL_SHARED_EXCEPTIONS
	GEANT_SHARED_PROPERTIES
		export {NONE} all end
	KL_SHARED_FILE_SYSTEM

creation

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT; a_target_element: GEANT_ELEMENT)is
			-- Create a new target
		require
			project_not_void: a_project /= Void
			target_element_not_void: a_target_element /= Void
			target_element_has_name: a_target_element.has_attribute (Name_attribute_name)
		local
			children: DS_ARRAYED_LIST [GEANT_ELEMENT]
			an_element: GEANT_ELEMENT
		do
			project := a_project
			target_element := a_target_element
			set_name (target_element.attribute_value_by_name (Name_attribute_name).out)

				-- determine description if available:
			children := target_element.children
			if children.count > 0 then
				an_element := children.item (1)
				if an_element.name.is_equal (Description_element_name) then
					set_description (an_element.content.out)
				end
			end

		ensure
			project_set: project = a_project
			target_element_set: target_element = a_target_element
		end

feature -- Access

	description: STRING
		-- description of what target is responsible for

	has_dependencies: BOOLEAN is
			-- Has current target dependent on other targets?
		do
			Result := target_element.has_attribute (Depend_attribute_name)
		end

	dependencies: UC_STRING is
			-- UC_STRING representation of dependencies
		do
			Result := target_element.attribute_value_by_name (Depend_attribute_name)
		end

	name: STRING
			-- Name of target

	project: GEANT_PROJECT
			-- Project to which this target belongs

	is_executed: BOOLEAN
			-- Was this target executed already?
			
feature -- Setting

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


	set_executed (a_is_executed: BOOLEAN) is
			-- Set `is_executed' to `a_is_executed'.
		do
			is_executed := a_is_executed
		ensure
			is_executed_set: is_executed = a_is_executed
		end

feature -- Processing

	execute  is
			-- Execute all tasks of `a_target' in sequential order
		local
			children: DS_ARRAYED_LIST [GEANT_ELEMENT]
			i, nb: INTEGER
			an_element: GEANT_ELEMENT
			a_task: GEANT_TASK
			ucs: UC_STRING
			if_condition: BOOLEAN
			unless_condition: BOOLEAN
			old_cwd: STRING
			new_cwd: STRING
		do
				-- Set default target execution conditions:
			if_condition := true
			unless_condition := false

				-- Look for an 'if' XML attribute
			if target_element.has_attribute (If_attribute_name) then
				ucs := target_element.attribute_value_by_name (If_attribute_name)
				if_condition := boolean_condition_value (ucs.out)
				if project.verbose then
					print (" if    : '" + ucs.out + "'=" + if_condition.out + "%N")
				end
			end

				-- Look for an 'unless' XML attribute
			if target_element.has_attribute (Unless_attribute_name) then
				ucs := target_element.attribute_value_by_name (Unless_attribute_name)
				unless_condition := boolean_condition_value (ucs.out)
				if project.verbose then
					print (" unless: '" + ucs.out + "'=" + unless_condition.out + "%N")
				end
			end

			children := target_element.children
			nb := children.count
			if if_condition and not unless_condition then
					-- change to the specified directory if "dir" attribue is provided:
				if target_element.has_attribute (Dir_attribute_name) then
					new_cwd := project.variables.interpreted_string (
						target_element.attribute_value_by_name (Dir_attribute_name).out)
					if project.verbose then
						print (" changing to directory: '" + new_cwd + "'%N")
					end
					old_cwd := file_system.current_working_directory
					file_system.set_current_working_directory (new_cwd)
				end


				from
					if description /= Void then
						i := 2
					else
						i := 1
					end
				until
					i > nb or not if_condition or unless_condition
				loop
					an_element := children.item (i)
						-- Dispatch tasks:
					if an_element.name.is_equal (Compile_se_task_name) then
							-- compile_se: SmallEiffel compilation
						!GEANT_COMPILE_SE_TASK! a_task.make_from_element (project, an_element)
					elseif an_element.name.is_equal (Exec_task_name) then
							-- exec
						!GEANT_EXEC_TASK! a_task.make_from_element (project, an_element)
					elseif an_element.name.is_equal (Lcc_task_name) then
							-- lcc
						!GEANT_LCC_TASK! a_task.make_from_element (project, an_element)
					elseif an_element.name.is_equal (Set_task_name) then
							-- set
						!GEANT_SET_TASK! a_task.make_from_element (project, an_element)
					elseif an_element.name.is_equal (Unset_task_name) then
							-- unset
						!GEANT_UNSET_TASK! a_task.make_from_element (project, an_element)
					elseif an_element.name.is_equal (Gexace_task_name) then
							-- gexace
						!GEANT_GEXACE_TASK! a_task.make_from_element (project, an_element)
					elseif an_element.name.is_equal (Gelex_task_name) then
							-- gelex
						!GEANT_GELEX_TASK! a_task.make_from_element (project, an_element)
					elseif an_element.name.is_equal (Geyacc_task_name) then
							-- geyacc
						!GEANT_GEYACC_TASK! a_task.make_from_element (project, an_element)
					elseif an_element.name.is_equal (Gepp_task_name) then
							-- gepp
						!GEANT_GEPP_TASK! a_task.make_from_element (project, an_element)
					elseif an_element.name.is_equal (Getest_task_name) then
							-- getest
						!GEANT_GETEST_TASK! a_task.make_from_element (project, an_element)
					elseif an_element.name.is_equal (Geant_task_name) then
							-- geant
						!GEANT_GEANT_TASK! a_task.make_from_element (project, an_element)
					elseif an_element.name.is_equal (Echo_task_name) then
							-- echo
						!GEANT_ECHO_TASK! a_task.make_from_element (project, an_element)
					elseif an_element.name.is_equal (Mkdir_task_name) then
							-- mkdir
						!GEANT_MKDIR_TASK! a_task.make_from_element (project, an_element)
					elseif an_element.name.is_equal (Delete_task_name) then
							-- delete
						!GEANT_DELETE_TASK! a_task.make_from_element (project, an_element)
					elseif an_element.name.is_equal (Setenv_task_name) then
							-- setenv
						!GEANT_SETENV_TASK! a_task.make_from_element (project, an_element)
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
				end -- from

				if target_element.has_attribute (Dir_attribute_name) then
					if project.verbose then
						print (" changing to directory: '" + old_cwd + "'%N")
					end
					file_system.set_current_working_directory (old_cwd)

				end
				
				set_executed (True)
			end	-- if
		end

	dependent_targets: DS_ARRAYED_STACK [GEANT_TARGET] is
			-- All dependent targets
		local
			a_dependent_target: GEANT_TARGET
			a_value: UC_STRING
			a_dependent_targets: DS_ARRAYED_LIST [UC_STRING]
			i: INTEGER
		do
			!! Result.make (10)
			if has_dependencies then
				a_value := dependencies

					-- Check for targets separated by commas:
				a_dependent_targets := string_tokens (a_value, ',')

				if project.verbose then
					show_dependent_targets (a_dependent_targets)
				end

					-- Find all targets
				from i := 1 until i > a_dependent_targets.count loop
					a_value := a_dependent_targets.item (i)
					a_dependent_target := project.target_with_name (a_value)
					if a_dependent_target /= Void then
						Result.force (a_dependent_target)
					else
						print ("geant error: unknown dependent target '" + a_value.out + "'%N")
						print ("%NBUILD FAILED !%N")
						Exceptions.die (1)
					end
					i := i + 1
				end
			end
		ensure
			dependent_targets_not_void: Result /= Void
		end

	boolean_condition_value (a_condition: STRING): BOOLEAN is
			-- Is `condition' True?;
			-- used for "if" and "unless" attributes;
			-- possible forms:
			-- "foo": True if variable `foo' is defined
			-- "$foo=bar" | "${foo}=bar" | "bar=$foo" | "bar=${foo}":
			--             True if variable `foo' is defined and its value is "bar"
			-- if `a_condition' is not in either form Result is `False'
		require
			condition_not_void: a_condition /= Void
		local
			a_tokens: DS_ARRAYED_LIST [UC_STRING]
			s: STRING
			s2: STRING
			ucs: UC_STRING
		do
			!! ucs.make_from_string (a_condition)
			a_tokens := string_tokens (ucs, '=')
			if a_tokens.count = 1 then
					-- a_condition should be in form "$foo";
					-- check if $foo is defined
				s := a_tokens.item (1).out
				Result := project.variables.has_variable (s)
			elseif a_tokens.count = 2 then
					-- a_condition should be in form "$foo=bar";
					-- check if $foo equals "bar"
				s := a_tokens.item (1).out
				s := project.variables.interpreted_string (s)
				s2 := a_tokens.item (2).out
				s2 := project.variables.interpreted_string (s2)
				Result := s.is_equal (s2)
			else
				print ("geant: incorrect conditional: '" + a_condition + "'%N")
				print ("%NBUILD FAILED !%N")
				Exceptions.die (1)
			end
		end

	show_dependent_targets (a_dependent_targets: DS_ARRAYED_LIST [UC_STRING]) is
		local
			i: INTEGER
		do
			print ("======= DEPENDENCIES ==========%N")
			from i := 1 until i > a_dependent_targets.count loop
				print (a_dependent_targets.item (i).out + "%N")
				i := i + 1
			end
			print ("=================%N")
		end

	string_tokens (a_string: UC_STRING; a_delimiter: CHARACTER): DS_ARRAYED_LIST [UC_STRING] is
			-- Strings delimited by `a_delimiter' in `a_string';
			-- Candidate for STRING_ROUTINES
		require
			string_not_void: a_string /= Void
		local
			a_uc_delimiter: UC_CHARACTER
			s: UC_STRING
			ucs: UC_STRING
			p_start: INTEGER
			p_end: INTEGER
			nice_string: BOOLEAN
		do
			s := clone (a_string)
			!! Result.make (5)
			a_uc_delimiter.make_from_character (a_delimiter)

				-- Cleanup String:
			from
				s.left_adjust
				s.right_adjust
			until
				nice_string
			loop
				nice_string := True
				if s.count > 0 then
					if s.item (1) = a_uc_delimiter then
						s.tail (s.count - 1)
						nice_string := False
					end
				end
	
				if s.count > 0 then
					if s.item (s.count) = a_uc_delimiter then
						s.head (s.count - 1)
						nice_string := False
					end
				end

			end

				-- Find Tokens:
			from 
				p_start := 1
				p_end := s.index_of (a_uc_delimiter, p_start)
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
					p_end := s.index_of (a_uc_delimiter, p_start)
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
		ensure
			string_tokens_not_void: Result /= Void
		end


feature {NONE} -- Implementation

	target_element : GEANT_ELEMENT
		-- Xml element defining this target

feature {NONE} -- Constants

	Depend_attribute_name: UC_STRING is
			-- "depend" attribute name
		once
			!! Result.make_from_string ("depend")
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: not Result.empty
		end

	If_attribute_name: UC_STRING is
			-- "if" attribute name
		once
			!! Result.make_from_string ("if")
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: not Result.empty
		end

	Unless_attribute_name: UC_STRING is
			-- "unless" attribute name
		once
			!! Result.make_from_string ("unless")
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: not Result.empty
		end

	Dir_attribute_name: UC_STRING is
			-- "dir" attribute name
		once
			!! Result.make_from_string ("dir")
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: not Result.empty
		end

invariant
	target_element_not_void: target_element /= Void
end -- class GEANT_TARGET
