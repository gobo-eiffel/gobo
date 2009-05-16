indexing

	description:

		"Options that take arbitrary string arguments"

	library: "Gobo Eiffel Argument Library"
	copyright: "Copyright (c) 2006, Bernd Schoeller and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class AP_STRING_OPTION

inherit

	AP_OPTION_WITH_PARAMETER [STRING]
		redefine
			initialize
		end

create

	make,
	make_with_long_form,
	make_with_short_form

feature {NONE} -- Initialization

	initialize is
			-- Perform the common initialization steps.
		do
			needs_parameter := True
			Precursor
		end

feature -- Access

	parameters: DS_LIST [?STRING]
			-- List of parameters that were give to this option

feature -- Status report

	needs_parameter: BOOLEAN
			-- Does this option need a parameter ?

feature -- Status setting

	set_parameter_as_optional is
			-- Set the parameter as optional. If no parameter is given,
			-- the corresponding parameter value is set to `Void'. This
			-- only works for long forms and makes it impossible to
			-- specify the parameter as `--option parameter'.
		require
			not_short_form: not has_short_form
		do
			needs_parameter := False
		ensure
			not_needed: not needs_parameter
		end

feature {AP_PARSER} -- Parser Interface

	reset is
			-- Reset the option to a clean state before parsing.
		do
			create {DS_ARRAYED_LIST [?STRING]} parameters.make (1)
		end

	record_occurrence (a_parser: AP_PARSER) is
			-- This option was found during parsing by `a_parser'.
		do
			parameters.force_last (a_parser.last_option_parameter)
		end

end
