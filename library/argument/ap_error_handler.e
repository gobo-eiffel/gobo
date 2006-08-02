indexing

	description:

		"A universal error handler for parsing arguments"

	author: "Bernd Schoeller"
	copyright: "(c) 2006 Bernd Schoeller (bernd@fams.de) and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class AP_ERROR_HANDLER

inherit

	UT_ERROR_HANDLER
		redefine
			report_error_message
		end

create

	make_standard,
	make_null

feature -- Error detection

	has_error: BOOLEAN

	reset is
			-- Reset `has_errors' to false.
		do
			has_error := False
		ensure
			reset: not has_error
		end

feature -- Error reporting

	report_error_message (an_error: STRING) is
			-- Report `an_error'.
		do
			has_error := True
			Precursor {UT_ERROR_HANDLER} (an_error)
		end

end
