indexing

	description:

		"Error handlers for lexical analyzer generators such as 'gelex'";

	library:    "Gobo Eiffel Lexical Library";
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>";
	copyright:  "Copyright (c) 1997, Eric Bezault";
	date:       "$Date$";
	revision:   "$Revision$"

deferred class LX_LEX_ERROR_HANDLER

inherit

	EXCEPTIONS

feature -- Access

	program_name: STRING is
			-- Program name
		deferred
		ensure
			program_name_not_void: Result /= Void
		end

	usage: STRING is
			-- Command line usage
		deferred
		ensure
			usage_not_void: Result /= Void
		end

	version: STRING is
			-- Version number
		deferred
		ensure
			version_not_void: Result /= Void
		end

feature -- Termination

	terminate (exit_status: INTEGER) is
			-- Terminate program.
		do
			die (exit_status)
		end

feature -- Command line info messages

	usage_message is
			-- Report usage and exit.
		do
			info_message (<<usage>>)
		end

	version_message is
			-- Report version number and exit.
		do
			info_message (<<version>>)
		end

feature -- Command line error messages

	separated_o_flag is
			-- Report that "-o" flag must be given separately
			-- and then terminate.
		do
			error_message (<<"-o flag must be given separately">>)
		end

	unknown_flag (c: CHARACTER) is
			-- Report that `c' in an unknown flag
			-- and then terminate.
		do
			error_message (<< "unknown flag '", c.out, "'" >>)
		end

feature -- Option errors

	full_and_meta_equiv_classes is
			-- Report that the use of meta equivalence classes does not
			-- make sense with full tables.
		do
			error_message (<<"-f and -m don't make sense together">>)
		end

	full_and_reject is
			-- Report that the use of reject is incompatible
			-- with full tables.
		do
			error_message (<<"`reject' cannot be used with -f">>)
		end

	full_and_variable_trail_context is
			-- Report that the use of variable trailing context
			-- is incompatible with full tables.
		do
			error_message (<<"variable trailing context rules %
				%cannot be used with -f">>)
		end

feature -- Limitations

	too_many_rules (max: INTEGER) is
			-- Report that too many rules have been declared.
		do
			error_message (<<"too many rules (> ", max.out, ")!">>)
		end

feature -- Syntax error messages

	all_start_conditions_have_EOF (filename: STRING; line: INTEGER) is
			-- Report that all start conditions already have EOF rules.
		require
			filename_not_void: filename /= Void
		do
			warning_message (filename, line,
				<<"all start conditions already have <<EOF>> rules">>)
		end

	bad_character (char, filename: STRING; line: INTEGER) is
			-- Report the presence of a bad character.
		require
			char_not_void: char /= Void
			filename_not_void: filename /= Void
		do
			syntax_message (filename, line, <<"bad character: ", char >>)
		ensure
			syntax_error: syntax_error
		end

	bad_character_class (filename: STRING; line: INTEGER) is
			-- Report the presence of a bad character class.
		require
			filename_not_void: filename /= Void
		do
			syntax_message (filename, line, <<"bad character class">>)
		ensure
			syntax_error: syntax_error
		end

	bad_character_in_brackets (filename: STRING; line: INTEGER) is
			-- Report the presence of a bad character inside {}'s.
		require
			filename_not_void: filename /= Void
		do
			syntax_message (filename, line, <<"bad character inside {}'s">>)
		ensure
			syntax_error: syntax_error
		end

	bad_iteration_values (filename: STRING; line: INTEGER) is
			-- Report that the iteration values
			-- in a regular expression are bad.
		require
			filename_not_void: filename /= Void
		do
			syntax_message (filename, line, <<"bad iteration values">>)
		ensure
			syntax_error: syntax_error
		end

	bad_start_condition (sc, filename: STRING; line: INTEGER) is
			-- Report that `sc' is a bad start condition.
		require
			sc_not_void: sc /= Void
			filename_not_void: filename /= Void
		do
			syntax_message (filename, line, <<"bad <start condition>: ", sc>>)
		ensure
			syntax_error: syntax_error
		end

	bad_start_condition_list (filename: STRING; line: INTEGER) is
			-- Report that the start condition list is bad.
		require
			filename_not_void: filename /= Void
		do
			syntax_message (filename, line, <<"bad start condition list">>)
		ensure
			syntax_error: syntax_error
		end

	character_out_of_range (char, filename: STRING; line: INTEGER) is
			-- Report that character `char' is out of range.
		require
			char_not_void: char /= Void
			filename_not_void: filename /= Void
		do
			syntax_message (filename, line,
				<<"character '", char, "' out of range">>)
		ensure
			syntax_error: syntax_error
		end

	directive_expected (filename: STRING; line: INTEGER) is
			-- Report that a '%' directive was expected.
		require
			filename_not_void: filename /= Void
		do
			syntax_message (filename, line, <<"'%%' directive expected">>)
		ensure
			syntax_error: syntax_error
		end

	incomplete_name_definition (filename: STRING; line: INTEGER) is
			-- Report an incomplete name definition.
		require
			filename_not_void: filename /= Void
		do
			syntax_message (filename, line, <<"incomplete name definition">>)
		ensure
			syntax_error: syntax_error
		end

	iteration_not_positive (filename: STRING; line: INTEGER) is
			-- Report that the iteration value in a regular expression
			-- must be positive.
		require
			filename_not_void: filename /= Void
		do
			syntax_message (filename, line,
				<<"iteration value must be positive">>)
		ensure
			syntax_error: syntax_error
		end

	missing_bracket (filename: STRING; line: INTEGER) is
			-- Report a missing }.
		require
			filename_not_void: filename /= Void
		do
			syntax_message (filename, line, <<"missing }">>)
		ensure
			syntax_error: syntax_error
		end

	missing_quote (filename: STRING; line: INTEGER) is
			-- Report a missing quote.
		require
			filename_not_void: filename /= Void
		do
			syntax_message (filename, line, <<"missing quote">>)
		ensure
			syntax_error: syntax_error
		end

	multiple_EOF_rules (sc, filename: STRING; line: INTEGER) is
			-- Report that there are multiple <<EOF>> rules for
			-- start condition `sc'.
		require
			sc_not_void: sc /= Void
			filename_not_void: filename /= Void
		do
			parsing_message (filename, line,
				<<"multiple <<EOF>> rules for start condition ", sc>>)
		end

	name_defined_twice (name, filename: STRING; line: INTEGER) is
			-- Report that `name' has been defined twice.
		require
			name_not_void: name /= Void
			filename_not_void: filename /= Void
		do
			syntax_message (filename, line,
				<<"name `", name, "' defined twice">>)
		ensure
			syntax_error: syntax_error
		end

	negative_range_in_character_class (filename: STRING; line: INTEGER) is
			-- Report that there is a negative range in character class.
		require
			filename_not_void: filename /= Void
		do
			syntax_message (filename, line,
				<<"negative range in character class">>)
		ensure
			syntax_error: syntax_error
		end

	start_condition_declared_twice (sc, filename: STRING; line: INTEGER) is
			-- Report that `sc' has been declared twice.
		require
			sc_not_void: sc /= Void
			filename_not_void: filename /= Void
		do
			parsing_message (filename, line,
				<<"start condition ", sc, " declared twice">>)
		end

	start_condition_expected (filename: STRING; line: INTEGER) is
			-- Report that a start condition name was expected.
		require
			filename_not_void: filename /= Void
		do
			syntax_message (filename, line, <<"start condition name expected">>)
		ensure
			syntax_error: syntax_error
		end

	start_condition_specified_twice (sc, filename: STRING; line: INTEGER) is
			-- Report that `sc' has been specified twice.
		require
			sc_not_void: sc /= Void
			filename_not_void: filename /= Void
		do
			warning_message (filename, line, <<"<", sc, "> specified twice">>)
		end
		
	trailing_context_used_twice (filename: STRING; line: INTEGER) is
			-- Report that trailing context is used twice.
		require
			filename_not_void: filename /= Void
		do
			syntax_message (filename, line, <<"trailing context used twice">>)
		ensure
			syntax_error: syntax_error
		end
		
	undeclared_start_condition (sc, filename: STRING; line: INTEGER) is
			-- Report that `sc' has not been declared as a start condition.
		require
			sc_not_void: sc /= Void
			filename_not_void: filename /= Void
		do
			parsing_message (filename, line,
				<<"undeclared start condition ", sc>>)
		end

	undefined_definition (def, filename: STRING; line: INTEGER) is
			-- Report an undefined definition.
		require
			def_not_void: def /= Void
			filename_not_void: filename /= Void
		do
			syntax_message (filename, line,
				<<"undefined definition ", def>>)
		ensure
			syntax_error: syntax_error
		end

	unrecognized_directive (filename: STRING; line: INTEGER) is
			-- Report an unrecoginzed '%' directive.
		require
			filename_not_void: filename /= Void
		do
			syntax_message (filename, line, <<"unrecognized '%%' directive">>)
		ensure
			syntax_error: syntax_error
		end

	unrecognized_option (option, filename: STRING; line: INTEGER) is
			-- Report an unrecoginzed %option.
		require
			option_not_void: option /= Void
			filename_not_void: filename /= Void
		do
			syntax_message (filename, line,
				<<"unrecognized %%option: ", option>>)
		ensure
			syntax_error: syntax_error
		end

	unrecognized_rule (filename: STRING; line: INTEGER) is
			-- Report an unrecoginzed rule.
		require
			filename_not_void: filename /= Void
		do
			syntax_message (filename, line, <<"unrecognized rule">>)
		ensure
			syntax_error: syntax_error
		end

feature -- Status report

	syntax_error: BOOLEAN
			-- Did a syntax error occur?

	no_warning: BOOLEAN
			-- Should warning messages be suppressed?

feature -- Status setting

	set_syntax_error (b: BOOLEAN) is
			-- Set `syntax_error' to `b'.
		do
			syntax_error := b
		ensure
			syntax_error_set: syntax_error = b
		end

	set_no_warning (b: BOOLEAN) is
			-- Set `no_warning' to `b'.
		do
			no_warning := b
		ensure
			no_warning_set: no_warning = b
		end

feature -- Error handling

	error_message (message: ARRAY [STRING]) is
			-- Report an error message and terminate.
		require
			message_not_void: message /= Void
			no_void_info: not message.has (Void)
		local
			i, nb: INTEGER
		do
			io.error.put_string (program_name)
			io.error.put_string (": ")
			from
				i := message.lower
				nb := message.upper
			until
				i > nb
			loop
				io.error.put_string (message.item (i))
				i := i + 1
			end
			io.error.put_character ('%N')
			terminate (1)
		end

	info_message (message: ARRAY [STRING]) is
			-- Report an info message and exit.
		require
			message_not_void: message /= Void
			no_void_info: not message.has (Void)
		local
			i, nb: INTEGER
		do
			from
				i := message.lower
				nb := message.upper
			until
				i > nb
			loop
				io.put_string (message.item (i))
				i := i + 1
			end
			io.put_character ('%N')
			terminate (0)
		end

	syntax_message (filename: STRING; line: INTEGER; message: ARRAY [STRING]) is
			-- Report a syntax error message with location information.
		require
			filename_not_void: filename /= Void
			message_not_void: message /= Void
			no_void_info: not message.has (Void)
		do
			parsing_message (filename, line, message)
			syntax_error := True
		ensure
			syntax_error: syntax_error
		end

	warning_message (filename: STRING; line: INTEGER;
		message: ARRAY [STRING]) is
			-- Report a warning message with location information.
		require
			filename_not_void: filename /= Void
			message_not_void: message /= Void
			no_void_info: not message.has (Void)
		local
			i, nb: INTEGER
		do
			if not no_warning then
				io.error.put_string ("%"")
				io.error.put_string (filename)
				io.error.put_string ("%", line ")
				io.error.put_integer (line)
				io.error.put_string (": warning, ")
				from
					i := message.lower
					nb := message.upper
				until
					i > nb
				loop
					io.error.put_string (message.item (i))
					i := i + 1
				end
				io.error.put_character ('%N')
			end
		end

	parsing_message (filename: STRING; line: INTEGER;
		message: ARRAY [STRING]) is
			-- Report a parsing error message with location information.
		require
			filename_not_void: filename /= Void
			message_not_void: message /= Void
			no_void_info: not message.has (Void)
		local
			i, nb: INTEGER
		do
			io.error.put_string ("%"")
			io.error.put_string (filename)
			io.error.put_string ("%", line ")
			io.error.put_integer (line)
			io.error.put_string (": ")
			from
				i := message.lower
				nb := message.upper
			until
				i > nb
			loop
				io.error.put_string (message.item (i))
				i := i + 1
			end
			io.error.put_character ('%N')
		end

end -- class LX_LEX_ERROR_HANDLER
