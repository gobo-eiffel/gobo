indexing

	description:

		"Common properties for GEANT"

	author:     "Sven Ehrke (sven.ehrke@sven-ehrke.de)"
	copyright:  "Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class GEANT_SHARED_PROPERTIES

inherit

	KL_IMPORTED_STRING_ROUTINES
	KL_SHARED_EXECUTION_ENVIRONMENT
	KL_SHARED_EXCEPTIONS

	UC_UNICODE_FACTORY
		export {NONE} all end

feature -- Access

	Commandline_variables: DS_HASH_TABLE [STRING, STRING] is
			-- Variables specified on the commandline using -D
			-- example: -Dname=value
		once
			!! Result.make (10)
		ensure
			Commandline_variables_not_void: Result /= Void
		end

feature -- Processing

	exit_application (a_code: INTEGER; a_message: STRING) is
			-- Exit application with code 1;
			-- if a_message /= Void log it.
		do
			if a_message /= Void then
				print (a_message)
			end
			print ("%NBUILD FAILED!%N")
			Exceptions.die (1)
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
			i, j, nb: INTEGER
			stop: BOOLEAN
		do
			from
				i := 1
				nb := a_string.count
			until
				i > nb or stop
			loop
				inspect a_string.item (i).code
				-- when ' ', '%T', '%R', '%N' then
				when 32, 9, 13, 10 then
					i := i + 1
				else
					stop := True
				end
			end
			if not stop then
				s := new_unicode_string ("")
			else
				from
					stop := False
					j := nb
				until
					stop
				loop
					inspect a_string.item (j).code
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
			a_uc_delimiter := new_unicode_character (a_delimiter)

				-- Cleanup String:
			from
			until
				nice_string
			loop
				nice_string := True
				if s.count > 0 then
					if s.item (1).is_equal (a_uc_delimiter) then
						s.tail (s.count - 1)
						nice_string := False
					end
				end
	
				if s.count > 0 then
					if s.item (s.count).is_equal (a_uc_delimiter) then
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
				from
					i := p_start
					nb := p_end - 1
					stop := False
				until
					i > nb or stop
				loop
					inspect s.item (i).code
					-- when ' ', '%T', '%R', '%N' then
					when 32, 9, 13, 10 then
						i := i + 1
					else
						stop := True
					end
				end
				if not stop then
					ucs := new_unicode_string ("")
				else
					from
						stop := False
						j := nb
					until
						stop
					loop
						inspect s.item (j).code
						-- when ' ', '%T', '%R', '%N' then
						when 32, 9, 13, 10 then
							j := j - 1
						else
							stop := True
						end
					end
					ucs := s.substring (i, j)
				end
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
				from
					i := p_start
					nb := s.count
					stop := False
				until
					i > nb or stop
				loop
					inspect s.item (i).code
					-- when ' ', '%T', '%R', '%N' then
					when 32, 9, 13, 10 then
						i := i + 1
					else
						stop := True
					end
				end
				if not stop then
					ucs := new_unicode_string ("")
				else
					from
						stop := False
						j := nb
					until
						stop
					loop
						inspect s.item (j).code
						-- when ' ', '%T', '%R', '%N' then
						when 32, 9, 13, 10 then
							j := j - 1
						else
							stop := True
						end
					end
					ucs := s.substring (i, j)
				end
				if ucs.count > 0 then
					Result.force_last (ucs)
				end
			end
		ensure
			string_tokens_not_void: Result /= Void
		end

end -- class GEANT_SHARED_PROPERTIES







