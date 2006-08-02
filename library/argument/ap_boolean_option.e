indexing

	description:

		"An option that needs a yes or no parameter"
	
	author: "Bernd Schoeller"
	copyright: "(c) 2006 Bernd Schoeller (bernd@fams.de) and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class AP_BOOLEAN_OPTION

inherit

	AP_OPTION_WITH_PARAMETER[BOOLEAN]
		redefine
			initialize
		end

	KL_SHARED_STRING_EQUALITY_TESTER

create
	
	make,
	make_with_long_form,
	make_with_short_form
	
feature {NONE} -- Initialization

	initialize is
			-- Perform the common initialization steps.
		do
			Precursor -- {AP_OPTION_WITH_PARAMETER [BOOLEAN]}
			set_parameter_description ("yes|no")
		end

feature -- Constants

	false_strings: DS_LIST [STRING] is 
			-- Values that describe `false'
		once
			create {DS_ARRAYED_LIST [STRING]}Result.make (5)
			Result.force_last ("no")
			Result.force_last ("n")
			Result.force_last ("0")
			Result.force_last ("false")
			Result.force_last ("f")
			Result.set_equality_tester (case_insensitive_string_equality_tester)
		end

	true_strings: DS_LIST [STRING] is 
			-- Values that describe `true'
		once
			create {DS_ARRAYED_LIST [STRING]}Result.make (5)
			Result.force_last ("yes")
			Result.force_last ("y")
			Result.force_last ("1")
			Result.force_last ("true")
			Result.force_last ("t")
			Result.set_equality_tester (case_insensitive_string_equality_tester)
		end

feature -- Access

	is_false: BOOLEAN is
			-- Was the option set to False?
		do
			Result := not is_true
		end

	is_true: BOOLEAN is
			-- Was the option set to True?
		do
			Result := was_found and then parameter			
		end
	
	parameters: DS_LIST [BOOLEAN]

feature{AP_PARSER} -- Parser Interface

	reset is
			-- Reset the option to a clean state before parsing.
		do
			create {DS_LINKED_LIST [BOOLEAN]} parameters.make
		end

	record_occurrence (a_parser: AP_PARSER) is
			-- This option was found during parsing by `a_parser'.
		local
			error: AP_ERROR
		do
			if true_strings.has (a_parser.last_option_parameter) then
				parameters.force_last (True)
			elseif false_strings.has (a_parser.last_option_parameter) then
				parameters.force_last (False)
			else
				create error.make_invalid_parameter_error (Current, a_parser.last_option_parameter)
				a_parser.error_handler.report_error (error)
			end
		end

invariant

	true_not_false: is_true = not is_false

end
