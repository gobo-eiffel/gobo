note

	description:

		"Options that need an integer argument"

	library: "Gobo Eiffel Argument Library"
	copyright: "Copyright (c) 2006-2016, Bernd Schoeller and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class AP_INTEGER_OPTION

inherit

	AP_OPTION_WITH_PARAMETER [INTEGER]
		redefine
			initialize
		end

create

	make,
	make_with_long_form,
	make_with_short_form

feature {NONE} -- Initialization

	initialize
			-- Perform the common initialization steps.
		do
			Precursor
			set_parameter_description ("int")
		end

feature -- Access

	parameters: DS_LIST [INTEGER]
			-- All parameters given to the option

feature -- Status setting

	set_parameter_as_optional
			-- Set the parameter as optional. If no parameter is given,
			-- the corresponding parameter value is set to `0'. This
			-- only works for long forms and makes it impossible to
			-- specify the parameter as `--option parameter'.
		require
			not_short_form: not has_short_form
		do
			set_default_parameter (0)
		ensure
			not_needed: not needs_parameter
			default_parameter_set: default_parameter = 0
		end

feature {AP_PARSER} -- Parser Interface

	reset
			-- Reset the option to a clean state before parsing.
		do
			create {DS_LINKED_LIST [INTEGER]} parameters.make
		end

	record_occurrence (a_parser: AP_PARSER)
			-- Record the occurrence of the option with `a_parameter'.
		local
			error: AP_ERROR
		do
			if not attached a_parser.last_option_parameter as l_last_option_parameter then
				check precondition_parameter_if_needed: not needs_parameter end
				parameters.force_last (default_parameter)
			elseif l_last_option_parameter.is_integer then
				parameters.force_last (l_last_option_parameter.to_integer)
			else
				create error.make_invalid_parameter_error (Current, l_last_option_parameter)
				a_parser.error_handler.report_error (error)
				parameters.force_last (0)
			end
		end

end
