note

	description:

		"Gobo Eiffel Grep"

	copyright: "Copyright (c) 1999, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEGREP

inherit

	KL_SHARED_ARGUMENTS
	KL_SHARED_EXCEPTIONS
	KL_SHARED_STANDARD_FILES

create

	execute

feature -- Execution

	execute
			-- Start 'gegrep' execution.
		local
			i, nb: INTEGER
			a_file: KL_TEXT_INPUT_FILE
			a_filename: STRING
			case_insensitive: BOOLEAN
		do
			if False then resurrect_code end

			nb := Arguments.argument_count
			if nb = 0 then
				std.error.put_string (Usage_message)
				std.error.put_character ('%N')
				Exceptions.die (1)
			else
				if Arguments.argument (1).is_equal ("-i") then
					case_insensitive := True
					if nb = 1 then
						std.error.put_string (Usage_message)
						std.error.put_character ('%N')
						Exceptions.die (1)
					end
					i := 2
				else
					i := 1
				end
				create regexp.compile (Arguments.argument (i), case_insensitive)
				if not regexp.is_compiled then
					std.error.put_string ("gegrep: invalid regular expression%N")
					Exceptions.die (1)
				else
					i := i + 1
					inspect nb - i + 1
					when 0 then
						parse_file (std.input, Void)
					when 1 then
						a_filename := Arguments.argument (i)
						create a_file.make (a_filename)
						a_file.open_read
						if a_file.is_open_read then
							parse_file (a_file, Void)
							a_file.close
						else
							std.error.put_string ("gegrep: cannot read %'")
							std.error.put_string (a_filename)
							std.error.put_string ("%'%N")
							Exceptions.die (1)
						end
					else
						from until i > nb loop
							a_filename := Arguments.argument (i)
							create a_file.make (a_filename)
							a_file.open_read
							if a_file.is_open_read then
								parse_file (a_file, a_filename)
								a_file.close
							else
								std.error.put_string ("gegrep: cannot read %'")
								std.error.put_string (a_filename)
								std.error.put_string ("%'%N")
								Exceptions.die (1)
							end
							i := i + 1
						end
					end
				end
			end
		rescue
			std.error.put_string ("gegrep: internal error%N")
			Exceptions.die (1)
		end

feature -- Parsing

	parse_file (a_file: KI_TEXT_INPUT_STREAM; a_filename: STRING)
			-- Parse `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
			regexp_not_void: regexp /= Void
			regexp_compiled: regexp.is_compiled
		local
			a_line: STRING
		do
			from
				a_file.read_line
			until
				a_file.end_of_input
			loop
				a_line := a_file.last_string
				if regexp.matches (a_line) then
					if a_filename /= Void then
						std.output.put_string (a_filename)
						std.output.put_string (": ")
					end
					std.output.put_string (a_line)
					std.output.put_character ('%N')
				end
				a_file.read_line
			end
		end

feature -- Access

	Usage_message: STRING = "usage: gegrep [-i] regexp [filename...]"

	regexp: LX_DFA_REGULAR_EXPRESSION
			-- Regular expression

feature {NONE} -- Implementation

	resurrect_code
			-- Make sure that SmartEiffel does not complain about possible
			-- "calls on a Void target in the living Eiffel code".
		local
			et1: KL_EQUALITY_TESTER [LX_NFA_STATE]
			et2: KL_EQUALITY_TESTER [INTEGER]
			et3: KL_EQUALITY_TESTER [LX_NFA]
			et4: KL_EQUALITY_TESTER [LX_RULE]
			et5: KL_EQUALITY_TESTER [LX_START_CONDITION]
			et6: KL_EQUALITY_TESTER [LX_SYMBOL_CLASS]
			et7: KL_EQUALITY_TESTER [LX_DFA_STATE]
			et8: KL_EQUALITY_TESTER [STRING]
			fb: YY_FILE_BUFFER
		do
			create et1
			create et2
			create et3
			create et4
			create et5
			create et6
			create et7
			create et8
			create fb.make (std.input)
		end

end
