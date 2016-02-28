note

	description:

		"Options that need an integer argument"

	library: "Gobo Eiffel Argument Library"
	copyright: "Copyright (c) 2006-2013, Bernd Schoeller and others"
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

feature -- Status report

	needs_parameter: BOOLEAN
			-- Does this option need a parameter ?
		do
			Result := True
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
			l_last_option_parameter: detachable STRING
		do
			l_last_option_parameter := a_parser.last_option_parameter
			check
					-- Implied by inherited precondition `parameter_if_needed' and Current's value of `needs_parameter'
				parameter_needed: l_last_option_parameter /= Void
			then
				if l_last_option_parameter.is_integer then
					parameters.force_last (l_last_option_parameter.to_integer)
				else
					create error.make_invalid_parameter_error (Current, l_last_option_parameter)
					a_parser.error_handler.report_error (error)
					parameters.force_last (0)
				end
			end
		end

end
