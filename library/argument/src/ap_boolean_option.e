note

	description:

		"Options that need a yes or no parameter"

	library: "Gobo Eiffel Argument Library"
	copyright: "Copyright (c) 2006-2016, Bernd Schoeller and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class AP_BOOLEAN_OPTION

inherit

	AP_OPTION_WITH_PARAMETER [BOOLEAN]
		redefine
			initialize
		end

	KL_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

create

	make,
	make_with_long_form,
	make_with_short_form

feature {NONE} -- Initialization

	initialize
			-- Perform the common initialization steps.
		do
			Precursor
			set_parameter_description ("yes|no")
		end

feature -- Constants

	false_strings: DS_LIST [STRING]
			-- Values that describe `false'
		once
			create {DS_ARRAYED_LIST [STRING]} Result.make (5)
			Result.set_equality_tester (case_insensitive_string_equality_tester)
			Result.put_last ("no")
			Result.put_last ("n")
			Result.put_last ("0")
			Result.put_last ("false")
			Result.put_last ("f")
		ensure
			false_strings_not_void: Result /= Void
			no_void_false_string: not Result.has_void
		end

	true_strings: DS_LIST [STRING]
			-- Values that describe `true'
		once
			create {DS_ARRAYED_LIST [STRING]} Result.make (5)
			Result.set_equality_tester (case_insensitive_string_equality_tester)
			Result.put_last ("yes")
			Result.put_last ("y")
			Result.put_last ("1")
			Result.put_last ("true")
			Result.put_last ("t")
		ensure
			true_strings_not_void: Result /= Void
			no_void_true_string: not Result.has_void
		end

feature -- Access

	is_false: BOOLEAN
			-- Was the option set to False?
		do
			Result := not is_true
		end

	is_true: BOOLEAN
			-- Was the option set to True?
		do
			Result := was_found and then parameter
		end

	parameters: DS_LIST [BOOLEAN]
			-- All parameters given to the option

feature -- Status setting

	set_parameter_as_optional
			-- Set the parameter as optional. If no parameter is given,
			-- the corresponding parameter value is set to `True'. This
			-- only works for long forms and makes it impossible to
			-- specify the parameter as `--option parameter'.
		require
			not_short_form: not has_short_form
		do
			set_default_parameter (True)
		ensure
			not_needed: not needs_parameter
			default_parameter_set: default_parameter = True
		end

feature {AP_PARSER} -- Parser Interface

	reset
			-- Reset the option to a clean state before parsing.
		do
			create {DS_LINKED_LIST [BOOLEAN]} parameters.make
		end

	record_occurrence (a_parser: AP_PARSER)
			-- This option was found during parsing by `a_parser'.
		local
			error: AP_ERROR
		do
			if not attached a_parser.last_option_parameter as l_last_option_parameter then
				check precondition_parameter_if_needed: not needs_parameter end
				parameters.force_last (default_parameter)
			elseif true_strings.has (l_last_option_parameter) then
				parameters.force_last (True)
			elseif false_strings.has (l_last_option_parameter) then
				parameters.force_last (False)
			else
				create error.make_invalid_parameter_error (Current, l_last_option_parameter)
				a_parser.error_handler.report_error (error)
			end
		end

invariant

	true_not_false: is_true = not is_false

end
