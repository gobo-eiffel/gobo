indexing

	description:

		"Gobo Eiffel Grep";

	author:     "Eric Bezault <ericb@gobo.demon.co.uk>";
	copyright:  "Copyright (c) 1997, Eric Bezault";
	date:       "$Date$";
	revision:   "$Revision$"

class GEGREP

inherit

	ARGUMENTS
		export
			{NONE} all
		end

	EXCEPTIONS
		export
			{NONE} all
		end

	KL_FILE_ROUTINES
		export
			{NONE} all
		end

creation

	execute

feature -- Execution

	execute is
			-- Start 'gegrep' execution.
		local
			i, nb: INTEGER
			a_file: like FILE_type
			a_filename: STRING
			case_insensitive: BOOLEAN
		do
			nb := argument_count
			if nb = 0 then
				io.error.put_string (Usage_message)
				io.error.put_character ('%N')
				die (1)
			else
				if argument (1).is_equal ("-i") then
					case_insensitive := True
					if nb = 1 then
						io.error.put_string (Usage_message)
						io.error.put_character ('%N')
						die (1)
					end	
					i := 2
				else
					i := 1
				end
				!! regexp.compile (argument (i), case_insensitive)
				if not regexp.compiled then
					io.error.put_string ("gegrep: invalid regular expression%N")
					die (1)
				else
					i := i + 1
					inspect nb - i + 1
					when 0 then
						parse_file (io.input, Void)
					when 1 then
						a_filename := argument (i)
						a_file := file__make (a_filename)
						file__open_read (a_file)
						if a_file.is_open_read then
							parse_file (a_file, Void)
							a_file.close
						else
							io.error.put_string ("gegrep: cannot read %'")
							io.error.put_string (a_filename)
							io.error.put_string ("%'%N")
							die (1)
						end
					else
						from until i > nb loop
							a_filename := argument (i)
							a_file := file__make (a_filename)
							file__open_read (a_file)
							if a_file.is_open_read then
								parse_file (a_file, a_filename)
								a_file.close
							else
								io.error.put_string ("gegrep: cannot read %'")
								io.error.put_string (a_filename)
								io.error.put_string ("%'%N")
								die (1)
							end
							i := i + 1
						end
					end
				end
			end
		rescue
			io.error.put_string ("gegrep: internal error%N")
			die (1)
		end

feature -- Parsing

	parse_file (a_file: like FILE_type; a_filename: STRING) is
			-- Parse `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
			regexp_not_void: regexp /= Void
			regexp_compiled: regexp.compiled
		local
			a_line: STRING
		do
			from
				a_file.read_line
			until
				file__end_of_file (a_file)
			loop
				a_line := a_file.last_string
				if regexp.matches (a_line) then
					if a_filename /= Void then
						io.put_string (a_filename)
						io.put_string (": ")
					end
					io.put_string (a_line)
					io.put_character ('%N')
				end
				a_file.read_line
			end
		end

feature -- Access

	Usage_message: STRING is "usage: gegrep [-i] regexp [filename...]"

	regexp: LX_DFA_REGULAR_EXPRESSION
			-- Regular expression

end -- class GEGREP
