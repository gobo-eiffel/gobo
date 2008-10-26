indexing

	description:

		"ECF error handlers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_ERROR_HANDLER

inherit

	UT_ERROR_HANDLER
		redefine
			report_error_message
		end

create

	make_standard, make_null

feature -- Status report

	has_error: BOOLEAN is
			-- Has an error been reported?
		do
			Result := (error_count > 0)
		end

feature -- Measurement

	error_count: INTEGER
			-- Number of errors reported so far

feature -- Reporting errors

	report_parser_error (a_message: STRING) is
			-- Report an XML parser error.
		require
			a_message_not_void: a_message /= Void
		local
			an_error: UT_MESSAGE
		do
			create an_error.make (a_message)
			report_error (an_error)
		end

	report_error_message (an_error: STRING) is
			-- Report `an_error'.
		do
			error_count := error_count + 1
			precursor (an_error)
		end

end
