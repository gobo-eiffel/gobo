indexing

	description:

		"Test config error handlers"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class TS_ERROR_HANDLER

inherit

	ET_ERROR_HANDLER
		redefine
			report_error
		end

creation

	make_standard, make_null

feature -- Reporting

	report_error (an_error: UT_ERROR) is
			-- Report `an_error'.
		do
			precursor (an_error)
			error_reported := True
		end

feature -- Access

	error_reported: BOOLEAN
			-- Has an error been reported?

feature -- Syntax errors

	report_config_syntax_error (a_filename: STRING; p: ET_POSITION) is
			-- Report a syntax error in configuration file.
		require
			p_not_void: p /= Void
			a_filename_not_void: a_filename /= Void
		local
			an_error: UT_SYNTAX_ERROR
		do
			!! an_error.make (a_filename, p.line)
			report_error (an_error)
		end

	report_regexp_syntax_error (a_regexp: ET_IDENTIFIER; a_filename: STRING) is
			-- Report a syntax error in `a_regexp'.
		require
			a_regexp_not_void: a_regexp /= Void
			a_filename_not_void: a_filename /= Void
		local
			an_error: TS_REGEXP_SYNTAX_ERROR
			p: ET_POSITION
		do
			p := a_regexp.position
			!! an_error.make (a_regexp.name, a_filename, p.line)
			report_error (an_error)
		end

	report_eiffel_compilation_error is
			-- Report that an Eiffel compilation error occurred.
		local
			an_error: TS_EIFFEL_COMPILATION_ERROR
		do
			!! an_error.make
			report_error (an_error)
		end

end -- class TS_ERROR_HANDLER
