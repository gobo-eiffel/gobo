indexing

	description:

		"Common properties for GEANT"

	library: "Gobo Eiffel Ant"
	copyright: "Sven Ehrke and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_SHARED_PROPERTIES

inherit

	KL_IMPORTED_STRING_ROUTINES
	KL_SHARED_EXECUTION_ENVIRONMENT
	KL_SHARED_EXCEPTIONS

	KL_SHARED_STANDARD_FILES
		export
			{NONE} all
		end

feature -- Access

	Commandline_variables: DS_HASH_TABLE [STRING, STRING] is
			-- Variables specified on the commandline using -D
			-- example: -Dname=value
		once
			!! Result.make (10)
		ensure
			Commandline_variables_not_void: Result /= Void
		end

	system_parents: DS_ARRAYED_LIST [GEANT_PARENT] is
			-- Projects of system
		once
			create Result.make (5)
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

	exit_application (a_code: INTEGER; a_message: STRING) is
			-- Exit application with code `a_code';
			-- if a_message /= Void log it.
		do
			if a_message /= Void then
				std.error.put_string (a_message)
			end
			if a_code /= 0 then
				std.error.put_string ("%NBUILD FAILED!%N")
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
				inspect a_string.item_code (i)
				-- when ' ', '%T', '%R', '%N' then
				when 32, 9, 13, 10 then
					i := i + 1
				else
					stop := True
				end
			end
			if not stop then
				s := clone ("")
			else
				from
					stop := False
					j := nb
				until
					stop
				loop
					inspect a_string.item_code (j)
					-- when ' ', '%T', '%R', '%N' then
					when 32, 9, 13, 10 then
						j := j - 1
					else
						stop := True
					end
				end
				s := a_string.substring (i, j)
			end
			!! Result.make (5)

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
					inspect s.item_code (i)
					-- when ' ', '%T', '%R', '%N' then
					when 32, 9, 13, 10 then
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
					inspect s.item_code (j)
						-- when ' ', '%T', '%R', '%N' then
						when 32, 9, 13, 10 then
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
					inspect s.item_code (i)
					-- when ' ', '%T', '%R', '%N' then
					when 32, 9, 13, 10 then
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
						inspect s.item_code (j)
						-- when ' ', '%T', '%R', '%N' then
						when 32, 9, 13, 10 then
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

	string_remove_head (a_string: STRING; n: INTEGER): STRING is
			-- Remove the first `n' characters of `a_string';
			-- if `n' > `a_string.count', remove all.
			-- Workaround for STRING.remove_head which is not supported in HACT 4.0.1 and ISE 5.1
		require
			n_non_negative: n >= 0
		local
			p: INTEGER
		do
			p := n.min (a_string.count) + 1
			if p > a_string.count then
				Result := clone ("")
			else
				Result := a_string.substring (p, a_string.count)
			end
		ensure
			removed_a: (n.min (a_string.count) + 1 > a_string.count) implies
				Result.is_equal ("")
			removed_b: (n.min (a_string.count) + 1 <= a_string.count) implies
				Result.is_equal (a_string.substring (n.min (a_string.count) + 1, a_string.count))
		end

	string_remove_tail (a_string: STRING; n: INTEGER): STRING is
			-- Remove the last `n' characters of `a_string';
			-- if `n' > `a_string.count', remove all.
			-- Workaround for STRING.remove_tail which is not supported in HACT 4.0.1 and ISE 5.1
		require
			n_non_negative: n >= 0
		local
			p: INTEGER
		do
			p := a_string.count - n.min (a_string.count)
			if p = 0 then
				Result := clone ("")
			else
				Result := a_string.substring (1, p)
			end
		ensure
			removed_a: (a_string.count - n.min (a_string.count) = 0) implies
				Result.is_equal ("")
			removed_a: (a_string.count - n.min (a_string.count) > 0) implies
				Result.is_equal (a_string.substring (1, a_string.count - n.min (a_string.count)))
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
				Result := clone (a_star_string)
			else
				Result := clone (a_star_string.substring (1, i1 - 1))
			end
		ensure
			definition:
				(a_star_string.index_of ('*', 1) > 0) implies
						Result.is_equal (a_star_string.substring (1, a_star_string.index_of ('*', 1) - 1))
				and
				(a_star_string.index_of ('*', 1) = 0) implies Result.is_equal (a_star_string)

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
				Result := clone (a_star_string)
			else
				if i1 = a_star_string.count then
					Result := clone ("")
				else
					Result := clone (a_star_string.substring (i1 + 1, a_star_string.count))
				end
			end
		ensure
			definition: (a_star_string.index_of ('*', 1) > 0) implies
				Result.is_equal (a_star_string.substring (
					a_star_string.index_of ('*', 1) + 1, a_star_string.count))
				and
					(a_star_string.index_of ('*', 1) = 0) implies Result.is_equal (a_star_string)

		end

end
