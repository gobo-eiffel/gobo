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

	KL_SHARED_FILE_SYSTEM
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

	startup_working_directory: STRING
			-- Name of directory from which geant has been invoked

feature -- Processing

	exit_application (a_code: INTEGER; a_message: STRING) is
			-- Exit application with code 1;
			-- if a_message /= Void log it.
		do
			if a_message /= Void then
				print (a_message)
			end
			print ("%NBUILD FAILED!%N")
			-- file_system.set_current_working_directory (startup_working_directory)
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

end -- class GEANT_SHARED_PROPERTIES







