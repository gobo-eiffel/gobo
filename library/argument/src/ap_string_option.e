note

	description:

		"Options that take arbitrary string arguments"

	library: "Gobo Eiffel Argument Library"
	copyright: "Copyright (c) 2006-2016, Bernd Schoeller and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class AP_STRING_OPTION

inherit

	AP_OPTION_WITH_PARAMETER [STRING]

create

	make,
	make_with_long_form,
	make_with_short_form

feature -- Access

	parameters: DS_LIST [detachable STRING]
			-- List of parameters that were give to this option

feature -- Status setting

	set_parameter_as_optional
			-- Set the parameter as optional. If no parameter is given,
			-- the corresponding parameter value is set to `Void'. This
			-- only works for long forms and makes it impossible to
			-- specify the parameter as `--option parameter'.
		require
			not_short_form: not has_short_form
		do
			set_default_parameter (Void)
		ensure
			not_needed: not needs_parameter
			default_parameter_set: default_parameter = Void
		end

feature {AP_PARSER} -- Parser Interface

	reset
			-- Reset the option to a clean state before parsing.
		do
			create {DS_ARRAYED_LIST [detachable STRING]} parameters.make (1)
		end

	record_occurrence (a_parser: AP_PARSER)
			-- This option was found during parsing by `a_parser'.
		do
			if not attached a_parser.last_option_parameter as l_last_option_parameter then
				check precondition_parameter_if_needed: not needs_parameter end
				parameters.force_last (default_parameter)
			else
				parameters.force_last (l_last_option_parameter)
			end
		end

end
