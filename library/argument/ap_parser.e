indexing

	description:

		"Parsers for arguments supplied to a program"

	library: "Gobo Eiffel Argument Library"
	copyright: "Copyright (c) 2006, Bernd Schoeller and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class AP_PARSER

inherit

	KL_SHARED_ARGUMENTS

	KL_SHARED_STANDARD_FILES

	KL_SHARED_EXCEPTIONS

	KL_SHARED_STRING_EQUALITY_TESTER

	KL_IMPORTED_ARRAY_ROUTINES

	KL_IMPORTED_STRING_ROUTINES

	AP_CONSTANTS

create

	make,
	make_empty

feature {NONE} -- Initialization

	make is
			-- Create an argument parser containing a help option.
		local
			help_alternative_options_list: AP_ALTERNATIVE_OPTIONS_LIST
			l_help_option: like help_option
		do
			make_empty
			create l_help_option.make (help_text_short_option, help_text_long_option)
			help_option := l_help_option
			l_help_option.set_description (help_text_description)
			create help_alternative_options_list.make (l_help_option)
			alternative_options_lists.force_last (help_alternative_options_list)
		end

	make_empty is
			-- Create a parser without predefined options.
		do
			create {DS_ARRAYED_LIST [AP_OPTION]} options.make (0)
			create {DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST]} alternative_options_lists.make (0)
			create error_handler.make_standard
			parameters_description := default_parameters_description
			application_description := default_application_description
		end

feature -- Access

	alternative_options_lists: DS_LIST [AP_ALTERNATIVE_OPTIONS_LIST]
			-- List of alternative options lists

	application_description: STRING
			-- A string describing the purpose of the application

	error_handler: AP_ERROR_HANDLER
			-- Error handler for this argument parser

	help_option: detachable AP_DISPLAY_HELP_FLAG
			-- Automatically generated option to display the help text

	options: DS_LIST [AP_OPTION]
			-- List of all available options

	parameters: detachable DS_LIST [STRING]
			-- All argument that were not part of any option

	parameters_description: STRING
			-- Description of the parameters

	last_option_parameter: detachable STRING
			-- Last parameter that was passed to an option

	all_options: DS_LIST [AP_OPTION] is
			-- All options that are used in the parser (including
			-- alternatives), without duplicates
		local
			a_list: AP_ALTERNATIVE_OPTIONS_LIST
		do
			create {DS_ARRAYED_LIST [AP_OPTION]} Result.make (0)
			from
				options.start
			until
				options.after
			loop
				if not Result.has (options.item_for_iteration) then
					Result.force_last (options.item_for_iteration)
				end
				options.forth
			end
			from
				alternative_options_lists.start
			until
				alternative_options_lists.after
			loop
				a_list := alternative_options_lists.item_for_iteration
				if not Result.has (a_list.introduction_option) then
					Result.force_last (a_list.introduction_option)
				end
				from
					a_list.start
				until
					a_list.after
				loop
					if not Result.has (a_list.item_for_iteration) then
						Result.force_last (a_list.item_for_iteration)
					end
					a_list.forth
				end
				alternative_options_lists.forth
			end
		ensure
			all_options_not_void: Result /= Void
		end

feature -- Configuration

	set_application_description (a_string: STRING) is
			-- Set the description for application to `a_string'.
		require
			a_string_not_void: a_string /= Void
		do
			application_description := a_string
		ensure
			application_description_set: application_description = a_string
		end

	set_error_handler (an_error_handler: AP_ERROR_HANDLER) is
			-- Set the error handler to `an_error_handler'.
		require
			an_error_handler_not_void: an_error_handler /= Void
		do
			error_handler := an_error_handler
		ensure
			error_handler_set: error_handler = an_error_handler
		end

	set_parameters_description (a_string: STRING) is
			-- Set the description for parameters to `a_string'.
		require
			a_string_not_void: a_string /= Void
		do
			parameters_description := a_string
		ensure
			parameters_description_set: parameters_description = a_string
		end

feature -- Status report

	has_long_option (an_option: STRING): BOOLEAN is
			-- Does the parser have a long option `an_option' in the current
			-- option set?
		require
			an_option_not_void: an_option /= Void
		local
			l_option: AP_OPTION
			l_long_form: detachable STRING
		do
			from
				options.start
			until
				options.after
			loop
				l_option := options.item_for_iteration
				l_long_form := l_option.long_form
				if l_long_form /= Void and then	l_long_form.same_string (an_option) then
					check
						has_long_form: l_option.has_long_form
					end
					Result := True
					options.go_after
				else
					options.forth
				end
			end
		end

	has_short_option (a_character: CHARACTER): BOOLEAN is
			-- Does the parser have a short option `a_character' in the
			-- current option set?
		local
			l_option: AP_OPTION
		do
			from
				options.start
			until
				options.after
			loop
				l_option := options.item_for_iteration
				if l_option.has_short_form and then l_option.short_form = a_character then
					Result := True
					options.go_after
				else
					options.forth
				end
			end
		end

feature -- Parser

	parse_arguments is
			-- Parse the command line arguments.
		require
			valid_options: valid_options
		local
			args: DS_ARRAYED_LIST [STRING]
			i, nb: INTEGER
		do
			nb := Arguments.argument_count
			create args.make (nb)
			from
				i := 1
			until
				i > nb
			loop
				args.force (Arguments.argument (i), i)
				i := i + 1
			end
			parse_list (args)
		end

	parse_array (an_array: ARRAY [STRING]) is
			-- Parse `an_array' of arguments.
		require
			an_array_not_void: an_array /= Void
			no_void_argument: not STRING_ARRAY_.has_void (an_array)
			valid_options: valid_options
		local
			args: DS_ARRAYED_LIST [STRING]
		do
			create args.make_from_array (an_array)
			parse_list (args)
		end

	parse_list (a_list: DS_LIST [STRING]) is
			-- Parse `a_list' of arguments.
		require
			a_list_not_void: a_list /= Void
			no_void_argument: not a_list.has_void
			valid_options: valid_options
		do
			reset_parser
			from
				a_list.start
			until
				a_list.after
			loop
				parse_argument (a_list)
			end
			check_options_after_parsing
			if error_handler.has_error then
				final_error_action
			end
		end

feature -- Error handling

	final_error_action is
			-- Code to execute when an error was encountered.
		do
			error_handler.report_error_message (abort_message)
			Exceptions.die (1)
		end

feature -- Validity checks

	is_alpha_numeric (a_character: CHARACTER): BOOLEAN is
			-- Is `a_character' an alpha-numeric character?
			-- (the property is available in CHARACTER_REF of FreeELKS,
			-- unfortunately SmartEiffel does not seem to support it)
		local
			c: CHARACTER
		do
			c := a_character
			Result := (c >= 'a' and c <= 'z') or (c >= 'A' and c <= 'Z') or (c >= '0' and c <= '9')
		end

	valid_long_form (a_string: STRING): BOOLEAN is
			-- Is `a_string' a valid long form for an option?
			-- Allowed character: alpha_numeric, dash (not twice in
			-- a row and not at beginning or end)
		local
			i, nb: INTEGER
		do
			if a_string = Void then
				Result := False
			else
				nb := a_string.count
				if nb >= 1 then
					Result := True
					from
						i := 1
					until
						i > nb
					loop
						if
							is_alpha_numeric (a_string.item (i)) or
							((i > 1 and i < nb) and then
						 	(a_string.item (i) = short_option_introduction and
						 	a_string.item (i - 1) /= short_option_introduction))
						then
							i := i + 1
						else
							Result := False
								-- Jump out of the loop.
							i := nb + 1
						end
					end
				end
			end
		ensure
			void_string_are_never_valid: (a_string = Void) implies not Result
		end

	valid_short_form (a_character: CHARACTER): BOOLEAN is
			-- Is `a_character' a valid short form for an option?
			-- Allowed characters: alpha_numeric
		do
			Result := is_alpha_numeric (a_character)
		end

	all_valid_short_and_long_form (a_list: DS_LIST [AP_OPTION]): BOOLEAN is
			-- Do all options that are part of `a_list' have valid short
			-- and long form? Is a short or long form used twice?
		require
			a_list_not_void: a_list /= Void
		local
			i, nb: INTEGER
			l_option: AP_OPTION
			long_set: DS_LINKED_LIST [STRING]
			short_set: DS_LINKED_LIST [CHARACTER]
			l_long_form: detachable STRING
		do
			Result := True
			create long_set.make
			long_set.set_equality_tester (string_equality_tester)
			create short_set.make
			nb := a_list.count
			from
				i := 1
			until
				(not Result) or (i > nb)
			loop
				l_option := a_list.item (i)
				if l_option = Void then
					Result := False
				else
					if l_option.has_short_form then
						Result := valid_short_form (l_option.short_form) and not short_set.has (l_option.short_form)
						short_set.force_last (l_option.short_form)
					end
					if l_option.has_long_form and Result then
						l_long_form := l_option.long_form
						check
							l_option_has_long_form : l_long_form /= Void
						end
						Result := valid_long_form (l_long_form) and not long_set.has (l_long_form)
						long_set.force_last (l_long_form)
					end
					i := i + 1
				end
			end
		end

	valid_options: BOOLEAN is
			-- Are all options correctly set up?
		local
			aol: AP_ALTERNATIVE_OPTIONS_LIST
			l_long_form: detachable STRING
		do
			if all_valid_short_and_long_form (options) then
				Result := True
				from
					alternative_options_lists.start
				until
					(not Result) or alternative_options_lists.after
				loop
					aol := alternative_options_lists.item_for_iteration
					if not all_valid_short_and_long_form (aol) then
						Result := False
					else
						if aol.introduction_option.has_short_form then
							Result := not has_short_option (aol.introduction_option.short_form)
						end
						if aol.introduction_option.has_long_form and Result then
							l_long_form := aol.introduction_option.long_form
							check
								aol_introduction_option_has_long_form: l_long_form /= Void
							end
							Result := not has_long_option (l_long_form)
						end
					end
					alternative_options_lists.forth
				end
				alternative_options_lists.go_after
			end
		end

feature {NONE} -- Implementation

	current_options: detachable DS_LIST [AP_OPTION]
			-- The current list of options for parsing
			-- Defaults to `options', and can be changed by parsing an
			-- introduction_option of one of the alternative_options_lists.

	is_first_option: BOOLEAN
			-- Are we still looking for the first option?

	check_options_after_parsing is
			-- Check if all mandatory options were passed to the program and
			-- options were not given too often.
		require
			current_options_not_void: current_options /= Void
		local
			o: AP_OPTION
			error: AP_ERROR
			l_current_options: like current_options
		do
			l_current_options := current_options
			check
				-- Implied by precondition `current_options_not_void'
				current_options_not_void: l_current_options /= Void
			end
			from
				l_current_options.start
			until
				l_current_options.after
			loop
				o := l_current_options.item_for_iteration
				if o.is_mandatory and not o.was_found then
					create error.make_missing_option_error (o)
					error_handler.report_error (error)
				end
				if o.maximum_occurrences > 0 and o.occurrences > o.maximum_occurrences then
					create error.make_surplus_option_error (o)
					error_handler.report_error (error)
				end
				l_current_options.forth
			end
		end

	parse_argument (a_argument_list: DS_LIST [STRING]) is
			-- Parse the current argument.
		require
			parameters_not_void: parameters /= Void
			a_argument_list_attached: a_argument_list /= Void
			option_available: not a_argument_list.off
		local
			l_argument: STRING
			length: INTEGER
			l_parameters: like parameters
		do
			l_parameters := parameters
			check
					-- Implied by precondition `parameters_not_void'
				parameters_not_void: l_parameters /= Void
			end

			l_argument := a_argument_list.item_for_iteration
			length := l_argument.count
			if length >= 2 and then l_argument.item (1) = short_option_introduction then
				if l_argument.item (2) = long_option_introduction then
					if length = 2 then
						from
							a_argument_list.forth
						until
							a_argument_list.after
						loop
							l_parameters.force_last (a_argument_list.item_for_iteration)
							a_argument_list.forth
						end
					else
						parse_long (a_argument_list)
					end
				else
					parse_short (a_argument_list)
				end
			else
				l_parameters.force_last (l_argument)
				a_argument_list.forth
			end
		end

	parse_long (a_argument_list: DS_LIST [STRING]) is
			-- Parse a long argument.
		require
			a_argument_list_attached: a_argument_list /= Void
			a_argument_list_not_off: not a_argument_list.off
--			current_is_long_option: {rl_item: STRING} a_argument_list.item_for_iteration and then rl_item.count >= 2 and then
--				(rl_item.item (1) = short_option_introduction and rl_item.item (2) = long_option_introduction)
		local
			l_argument: STRING
			option_string: STRING
			option: detachable AP_OPTION
			o: AP_OPTION
			parameter_position: INTEGER
			parameter: detachable STRING
			error: AP_ERROR
			l_current_options: like current_options
			l_long_form: detachable STRING
		do
			l_argument := a_argument_list.item_for_iteration
			parameter_position := l_argument.index_of (long_option_parameter_introduction, 3)
			if parameter_position > 0 then
				option_string := l_argument.substring (3, parameter_position - 1)
				parameter := l_argument.substring (parameter_position + 1, l_argument.count)
			else
				option_string := l_argument.substring (3, l_argument.count)
			end
			if is_first_option then
				from
					option := Void
					alternative_options_lists.start
				until
					option /= Void or alternative_options_lists.after
				loop
					o := alternative_options_lists.item_for_iteration.introduction_option
					if o.has_long_form then
						l_long_form := o.long_form
						check
							o_has_long_form: l_long_form /= Void
						end
						if STRING_.same_string (l_long_form, option_string) then
							option := o
							current_options := alternative_options_lists.item_for_iteration
						end
					end
					alternative_options_lists.forth
				end
				is_first_option := False
			end
			l_current_options := current_options
			if option = Void and l_current_options /= Void then
				from
					l_current_options.start
				until
					option /= Void or l_current_options.after
				loop
					o := l_current_options.item_for_iteration
					if o.has_long_form then
						l_long_form := o.long_form
						check
							o_has_long_form: l_long_form /= Void
						end
						if STRING_.same_string (l_long_form, option_string) then
							option := o
						end
					end
					l_current_options.forth
				end
			end
			if option = Void then
				create error.make_unknown_option_error (option_string)
				error_handler.report_error (error)
			else
				if option.needs_parameter then
					if parameter = Void then
						a_argument_list.forth
						if a_argument_list.off then
							create error.make_missing_parameter_error (option)
							error_handler.report_error (error)
						else
							parameter := a_argument_list.item_for_iteration
						end
					end
					if parameter /= Void then
						last_option_parameter := parameter
						option.record_occurrence (Current)
					end
				else
					if parameter = Void or option.allows_parameter then
						last_option_parameter := parameter
						option.record_occurrence (Current)
					else
						create error.make_unnecessary_parameter_error (option, parameter)
						error_handler.report_error (error)
					end
				end
			end
			if not a_argument_list.after then
				a_argument_list.forth
			end
		end

	parse_short (a_argument_list: DS_LIST [STRING]) is
			-- Parse a short option.
		require
			a_argument_list_attached: a_argument_list /= Void
			a_argument_list_not_off: not a_argument_list.off
--			current_is_short_option: {rl_item: STRING} a_argument_list.item_for_iteration and then
--				rl_item.count > 1 and then
--				(rl_item.item (1) = short_option_introduction and
--				 rl_item.item (2) /= long_option_introduction)
		local
			l_argument: STRING
			i: INTEGER
			option_character: CHARACTER
			option: detachable AP_OPTION
			o: AP_OPTION
			parameter: detachable STRING
			error: AP_ERROR
			l_current_options: like current_options
		do
			l_argument := a_argument_list.item_for_iteration
			from
				i := 2
			until
				i > l_argument.count
			loop
				option_character := l_argument.item (i)
				option := Void
				if is_first_option then
					from
						alternative_options_lists.start
					until
						option /= Void or alternative_options_lists.after
					loop
						o := alternative_options_lists.item_for_iteration.introduction_option
						if o.has_short_form and then o.short_form = option_character then
							option := o
							current_options := alternative_options_lists.item_for_iteration
						end
						alternative_options_lists.forth
					end
					is_first_option := False
				end
				l_current_options := current_options
				if option = Void and l_current_options /= Void then
					from
						l_current_options.start
					until
						option /= Void or l_current_options.after
					loop
						o := l_current_options.item_for_iteration
						if o.has_short_form and then o.short_form = option_character then
							option := o
						end
						l_current_options.forth
					end
				end
				if option = Void then
					create error.make_unknown_option_error (option_character.out)
					error_handler.report_error (error)
				else
					if option.needs_parameter then
						if i = l_argument.count then
							a_argument_list.forth
							if not a_argument_list.off then
								parameter := a_argument_list.item_for_iteration
							end
						else
							parameter := l_argument.substring (i + 1, l_argument.count)
							i := l_argument.count
						end
						if parameter = Void then
							create error.make_missing_parameter_error (option)
							error_handler.report_error (error)
						else
							last_option_parameter := parameter
							option.record_occurrence (Current)
						end
					else
						option.record_occurrence (Current)
					end
				end
				i := i + 1
			end
			if not a_argument_list.after then
				a_argument_list.forth
			end
		end

	reset_parser is
			-- Reset parser and all option prior to parsing arguments.
		local
			all_options_list: DS_LIST [AP_OPTION]
		do
			error_handler.reset
			all_options_list := all_options
			from
				all_options_list.start
			until
				all_options_list.after
			loop
				all_options_list.item_for_iteration.reset
				all_options_list.forth
			end
			current_options := options
			create {DS_ARRAYED_LIST [STRING]} parameters.make (0)
			is_first_option := True
		ensure
			not_has_errors: not error_handler.has_error
		end

invariant

	options_not_void: options /= Void
	no_option_is_void: not options.has_void
	alternative_options_lists_not_void: alternative_options_lists /= Void
	application_description_not_void: application_description /= Void
	paramaters_description_not_void: parameters_description /= Void

end
