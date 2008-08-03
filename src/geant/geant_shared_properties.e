indexing

	description:

		"Common properties for GEANT"

	library: "Gobo Eiffel Ant"
	copyright:"Copyright (c) 2001-2005, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_SHARED_PROPERTIES

inherit

	ANY

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	KL_SHARED_EXECUTION_ENVIRONMENT
		export {NONE} all end

	KL_SHARED_EXCEPTIONS
		export {NONE} all end

	KL_SHARED_STANDARD_FILES
		export {NONE} all end

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end


feature -- Access

	Commandline_variables: GEANT_VARIABLES is
			-- Variables specified on commandline using -D
			-- example: -Dname=value
		once
			create Result.make
		ensure
			Commandline_variables_not_void: Result /= Void
		end

	commandline_arguments: GEANT_ARGUMENT_VARIABLES is
			-- Arguments for start target specified on commandline using -A
			-- example: -Aname=value
		once
			create Result.make
		ensure
			commandline_arguments: Result /= Void
		end

	Empty_variables: GEANT_VARIABLES is
			-- Variables with no entries
		once
			create Result.make
		ensure
			Empty_variables_not_void: Result /= Void
		end

	Empty_argument_variables: GEANT_ARGUMENT_VARIABLES is
			-- Argument variables with no entries
		once
			create Result.make
		ensure
			Empty_argument_variables_not_void: Result /= Void
		end

	Default_builtin_variables: GEANT_VARIABLES is
			-- Default built-in variables
		once
			create Result.make
				-- Create built-in variables $GOBO_OS, $is_windows/$is_unix, $exe.
			if operating_system.is_windows then
				Result.set_variable_value ("GOBO_OS", "windows")
				Result.set_variable_value ("is_windows", "true")
				Result.set_variable_value ("path_separator", "\")
			else
					-- Use Unix-like file system by default.
				Result.set_variable_value ("GOBO_OS", "unix")
				Result.set_variable_value ("is_unix", "true")
				Result.set_variable_value ("path_separator", "/")
			end
			Result.set_variable_value ("exe", file_system.exe_extension)
		ensure
			default_builtin_variables_not_void: Result /= Void
		end

	Arguments_string_splitter: ST_SPLITTER is
			-- String splitter for terse arguments
		once
			create Result.make
			Result.set_separators (",%T")
		ensure
			Arguments_string_splitter_not_void: Result /= Void
		end

	system_parents: DS_ARRAYED_LIST [GEANT_PARENT] is
			-- Projects of system
		once
			create Result.make (5)
		end

	Project_variables_resolver: GEANT_PROJECT_VARIABLE_RESOLVER is
			-- Project variables resolver
		once
			create Result.make
		ensure
			Project_variables_resolver_not_void: Result /= Void
		end

	validation_messages: DS_ARRAYED_LIST [STRING] is
			-- Validation messages containing messages if tasks have been defined incorrectly
		once
			create Result.make (5)
		end

feature {GEANT_INTERPRETING_ELEMENT} -- Access

	target_arguments_stack: DS_STACK [GEANT_ARGUMENT_VARIABLES] is
			-- Arguments stack
		local
			a_target_arguments_stack: DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES]
		once
				-- Create target arguments stack:
			create a_target_arguments_stack.make (10)
			Result := a_target_arguments_stack
		ensure
			target_arguments_stack_not_void: Result /= Void
		end

	target_locals_stack: DS_STACK [GEANT_VARIABLES] is
			-- Locals stack
		local
			a_target_locals_stack: DS_ARRAYED_STACK [GEANT_VARIABLES]
		once
				-- Create target locals stack:
			create a_target_locals_stack.make (10)
			Result := a_target_locals_stack
		ensure
			target_locals_stack_not_void: Result /= Void
		end

feature -- Status report

-- TODO: find a way to detect that two project with the same name come from different files
--	has_system_parent (a_parent: GEANT_PARENT): BOOLEAN is
--			-- Does `system_parents' contain a parent having the same name as `a_parent'
--			-- and the same location as `a_parent'?
--		require
--			a_parent_not_void: a_parent /= Void
--		local
--			i: INTEGER
--			a_parent_project: GEANT_PROJECT
--		do
--			from
--				i := 1
--			until
--				i > system_parents.count or else Result
--			loop
--				a_parent_project := system_parents.item (i).project
--				if False then
--				print ("has_system_parent: checking item%N  " +
--					a_parent_project.name + " (" + a_parent_project.build_filename.out + ")%N" +
--					"  against " + a_parent.project.name + " (" + a_parent.project.build_filename.out + ")%N"
--					)
--				end
--				if a_parent_project.name.is_equal (a_parent.project.name) and then
--					a_parent_project.build_filename.is_equal (a_parent.project.build_filename) then
--					Result := True
--				end
--				i := i + 1
--			end
--		end

--	has_system_parent_with_different_location (a_parent: GEANT_PARENT): BOOLEAN is
--			-- Does `system_parents' contain a parent having the same name as `a_parent'
--			-- but a different location than `a_parent'?
--		require
--			a_parent_not_void: a_parent /= Void
--		local
--			i: INTEGER
--			a_parent_project: GEANT_PROJECT
--		do
--			from
--				i := 1
--			until
--				i > system_parents.count or else Result
--			loop
--				a_parent_project := system_parents.item (i).project
--				if a_parent_project.name.is_equal (a_parent.project.name) and then
--					not a_parent_project.build_filename.is_equal (a_parent.project.build_filename) then
--					Result := True
--				end
--				i := i + 1
--			end
--		end

feature -- Processing

	exit_application (a_code: INTEGER; a_message: ARRAY [STRING]) is
			-- Exit application with code `a_code';
			-- if a_message /= Void log it.
		require
			-- Note: ARRAY.has is not portable:
			-- no_void_message: a_message /= Void implies not a_message.has (Void)
		do
			log_messages (a_message)
			if a_code /= 0 then
				std.error.put_new_line
				std.error.put_line ("BUILD FAILED!")
			end
			Exceptions.die (a_code)
		end

	string_tokens (a_string: STRING; a_delimiter: CHARACTER): DS_ARRAYED_LIST [STRING] is
			-- Strings delimited by `a_delimiter' in `a_string';
			-- Candidate for STRING_ROUTINES
		require
			string_not_void: a_string /= Void
		local
			s: STRING
			an_item: STRING
			p_start: INTEGER
			p_end: INTEGER
			nice_string: BOOLEAN
			i, j, nb: INTEGER
			stop: BOOLEAN
		do
			from
				i := 1
				nb := a_string.count
			until
				i > nb or stop
			loop
				inspect a_string.item (i)
				when ' ', '%T', '%R', '%N' then
					i := i + 1
				else
					stop := True
				end
			end
			if not stop then
				s := STRING_.cloned_string ("")
			else
				from
					stop := False
					j := nb
				until
					stop
				loop
					inspect a_string.item (j)
					when ' ', '%T', '%R', '%N' then
						j := j - 1
					else
						stop := True
					end
				end
				s := a_string.substring (i, j)
			end
			create Result.make (5)

				-- Cleanup String:
			from
			until
				nice_string
			loop
				nice_string := True
				if s.count > 0 then
					if s.item (1) = a_delimiter then
						s.keep_tail (s.count - 1)
						nice_string := False
					end
				end

				if s.count > 0 then
					if s.item (s.count) = a_delimiter then
						s.keep_head (s.count - 1)
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
				from
					i := p_start
					nb := p_end - 1
					stop := False
				until
					i > nb or stop
				loop
					inspect s.item (i)
					when ' ', '%T', '%R', '%N' then
						i := i + 1
					else
						stop := True
					end
				end
				if not stop then
					an_item := ""
				else
					from
						stop := False
						j := nb
					until
						stop
					loop
						inspect s.item (j)
						when ' ', '%T', '%R', '%N' then
							j := j - 1
						else
							stop := True
						end
					end
					an_item := s.substring (i, j)
				end
				if an_item.count > 0 then
					Result.force_last (an_item)
				end
				p_start := p_end + 1

				if p_start <= s.count then
					p_end := s.index_of (a_delimiter, p_start)
				end
			end

				-- Append last token:
			if p_start <= s.count then
				from
					i := p_start
					nb := s.count
					stop := False
				until
					i > nb or stop
				loop
					inspect s.item (i)
					when ' ', '%T', '%R', '%N' then
						i := i + 1
					else
						stop := True
					end
				end
				if not stop then
					an_item := ""
				else
					from
						stop := False
						j := nb
					until
						stop
					loop
						inspect s.item (j)
						when ' ', '%T', '%R', '%N' then
							j := j - 1
						else
							stop := True
						end
					end
					an_item := s.substring (i, j)
				end
				if an_item.count > 0 then
					Result.force_last (an_item)
				end
			end
		ensure
			string_tokens_not_void: Result /= Void
		end

	glob_prefix (a_star_string: STRING): STRING is
			-- Substring of `a_star_string' before first '*' if any
			-- otherwise `a_star_string'
		require
			a_star_string_not_void: a_star_string /= Void
			a_star_string_not_empty: a_star_string.count > 0
		local
			i1: INTEGER
		do
			i1 := a_star_string.index_of ('*', 1)
			if i1 = 0 then
				Result := STRING_.cloned_string (a_star_string)
			elseif i1 > 1 then
				Result := a_star_string.substring (1, i1 - 1)
			else
				Result := STRING_.new_empty_string (a_star_string, 0)
			end
		ensure
			has_star: (a_star_string.index_of ('*', 1) > 0) implies
				Result.is_equal (a_star_string.substring (1, a_star_string.index_of ('*', 1) - 1))
			not_has_star: (a_star_string.index_of ('*', 1) = 0) implies Result.is_equal (a_star_string)
		end

	glob_postfix (a_star_string: STRING): STRING is
			-- Substring of `a_star_string' after first '*' if any
			-- otherwise `a_star_string'
		require
			a_star_string_not_void: a_star_string /= Void
			a_star_string_not_empty: a_star_string.count > 0
		local
			i1: INTEGER
		do
			i1 := a_star_string.index_of ('*', 1)
			if i1 = 0 then
				Result := STRING_.cloned_string (a_star_string)
			else
				if i1 = a_star_string.count then
					Result := STRING_.new_empty_string (a_star_string, 0)
				else
					Result := a_star_string.substring (i1 + 1, a_star_string.count)
				end
			end
		ensure
			has_star: (a_star_string.index_of ('*', 1) > 0) implies
				Result.is_equal (a_star_string.substring (a_star_string.index_of ('*', 1) + 1, a_star_string.count))
			not_has_start: (a_star_string.index_of ('*', 1) = 0) implies Result.is_equal (a_star_string)
		end

feature {NONE} -- Implemenation

	log_messages (a_message: ARRAY [STRING]) is
			-- if a_message /= Void log it.
		require
			-- Note: ARRAY.has is not portable:
			-- no_void_message: a_message /= Void implies not a_message.has (Void)
		local
			i, nb: INTEGER
		do
			if a_message /= Void then
				i := a_message.lower
				nb := a_message.upper
				from until i > nb loop
					std.error.put_string (a_message.item (i))
					i := i + 1
				end
				std.error.put_new_line
			end
		end

end
