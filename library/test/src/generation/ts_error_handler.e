note

	description:

		"Test config error handlers"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "MIT License"

class TS_ERROR_HANDLER

inherit

	ET_ERROR_HANDLER
		redefine
			report_error
		end

create

	make_standard,
	make_null

feature -- Reporting

	report_error (an_error: UT_ERROR)
			-- Report `an_error'.
		do
			precursor (an_error)
			error_reported := True
		end

feature -- Access

	error_reported: BOOLEAN
			-- Has an error been reported?

feature -- Syntax errors

	report_config_syntax_error (a_filename: STRING; p: ET_POSITION)
			-- Report a syntax error in configuration file.
		require
			p_not_void: p /= Void
			a_filename_not_void: a_filename /= Void
		local
			an_error: UT_SYNTAX_ERROR
		do
			create an_error.make (a_filename, p.line)
			report_error (an_error)
		end

	report_regexp_syntax_error (a_regexp: ET_IDENTIFIER; a_filename: STRING)
			-- Report a syntax error in `a_regexp'.
		require
			a_regexp_not_void: a_regexp /= Void
			a_filename_not_void: a_filename /= Void
		local
			an_error: TS_REGEXP_SYNTAX_ERROR
			p: ET_POSITION
		do
			p := a_regexp.position
			create an_error.make (a_regexp.name, a_filename, p.line)
			report_error (an_error)
		end

	report_option_regexp_syntax_error (an_option: STRING; a_regexp: STRING)
			-- Report a syntax error in `a_regexp' given as command-line option.
		require
			an_option_not_void: an_option /= Void
			a_regexp_not_void: a_regexp /= Void
		local
			an_error: TS_OPTION_REGEXP_SYNTAX_ERROR
		do
			create an_error.make (an_option, a_regexp)
			report_error (an_error)
		end

	report_eiffel_compilation_error
			-- Report that an Eiffel compilation error occurred.
		local
			an_error: TS_EIFFEL_COMPILATION_ERROR
		do
			create an_error.make
			report_error (an_error)
		end

end
