indexing

	description: 

		"A parser for arguments supplied to a program"

	author: "Bernd Schoeller"
	copyright: "(c) 2006 Bernd Schoeller (bernd@fams.de) and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class AP_PARSER

inherit
	
	KL_SHARED_ARGUMENTS
	KL_SHARED_STANDARD_FILES
	KL_SHARED_EXCEPTIONS
	AP_CONSTANTS

create

	make,
	make_empty

feature {NONE} -- Initialization

	make is
			-- Create an argument parser containing an help option.
		local
			help_alternative_options_list: AP_ALTERNATIVE_OPTIONS_LIST
		do
			make_empty
			create help_option.make (help_text_short_option,
											 help_text_long_option)
			help_option.set_description (help_text_description)
			create help_alternative_options_list.make (help_option)
			alternative_options_lists.force_last (help_alternative_options_list)
		end

	make_empty is
			-- Create a parser without predefined options.
		do
			create {DS_ARRAYED_LIST [AP_OPTION]} options.make (0)
			create {DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST]}alternative_options_lists.make (0)
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

	help_option: AP_DISPLAY_HELP_FLAG
			-- Automatically generated option to display the help text
	
	options: DS_LIST [AP_OPTION]
			-- List of all available options
	
	parameters: DS_LIST [STRING]
			-- All argument that were not part of any option
	
	parameters_description: STRING
			-- Description of the parameters
	
	last_option_parameter: STRING
			-- Last parameter that was passed to an option

	all_options: DS_LIST[AP_OPTION] is
			-- All options that are used in the parser (including 
			-- alternatives), without duplicates
		local
			a_list: AP_ALTERNATIVE_OPTIONS_LIST
		do
			create {DS_ARRAYED_LIST [AP_OPTION]}Result.make (0)
			from
				options.start
			until
				options.off
			loop
				if not Result.has (options.item_for_iteration) then
					Result.force_last (options.item_for_iteration)
				end				
				options.forth
			end
			from
				alternative_options_lists.start
			until
				alternative_options_lists.off
			loop
				a_list := alternative_options_lists.item_for_iteration
				if not Result.has (a_list.introduction_option) then
					Result.force_last (a_list.introduction_option)
				end
				from
					a_list.start
				until
					a_list.off
				loop
					if not Result.has (a_list.item_for_iteration) then
						Result.force_last (a_list.item_for_iteration)
					end				
					a_list.forth
				end
				alternative_options_lists.forth
			end
		end
		
	
feature -- Configuration

	set_application_description (a_string: STRING) is
			-- Set the description for application to `a_string'.
		require
			not_void: a_string /= Void
		do
			application_description := a_string
		ensure
			name_set: application_description = a_string
		end
		
	set_error_handler (an_error_handler: AP_ERROR_HANDLER) is
			-- Set the error handler to `an_error_handler'.
		require
			not_void: an_error_handler /= Void
		do
			error_handler := an_error_handler
		ensure
			error_handler_set: error_handler = an_error_handler
		end

	set_parameters_description (a_string: STRING) is
			-- Set the description for parameters to `a_string'.
		require
			not_void: a_string /= Void
		do
			parameters_description := a_string
		ensure
			name_set: parameters_description = a_string
		end
		
feature -- Status report

	has_long_option (an_option: STRING): BOOLEAN is
			-- Does the parser have a long option `o' in the current 
			-- option set?
		require
			not_void: an_option /= Void
		do
			from
				options.start
			until
				options.off or Result
			loop
				if options.item_for_iteration.has_long_form then
					Result := options.item_for_iteration.long_form.is_equal (an_option)
				end
				options.forth
			end		
		end

	has_short_option (a_character: CHARACTER): BOOLEAN is
			-- Does the parser have a short option `a_character' in the 
			-- current option set?
		do
			from
				options.start
			until
				options.off or Result
			loop
				if options.item_for_iteration.has_short_form then
					Result :=
						options.item_for_iteration.short_form = a_character
				end
				options.forth
			end		
		end
	
feature -- Parser

	parse_arguments is
			-- Parse the command line arguments.
		local
			args: DS_ARRAYED_LIST [STRING]
			i: INTEGER
		do
			create args.make (Arguments.argument_count)
			from
				i := 1
			until
				i > Arguments.argument_count
			loop
				args.force (Arguments.argument(i),i)
				i := i + 1
			end
			parse_list (args)
		end
		
	parse_array (an_array: ARRAY [STRING]) is
			-- Parse `an_array' of arguments.
		require
			not_void: an_array /= Void
		local
			args: DS_ARRAYED_LIST [STRING]
		do
			create args.make_from_array (an_array)
			parse_list (args)
		end
		
	parse_list (a_list: DS_LIST [STRING]) is
			-- Parse `a_list' of arguments.
		require
			not_void: a_list /= Void
		do
			reset_parser
			argument_list := a_list
			from
				argument_list.start
			until
				argument_list.off
			loop
				parse_argument
			end
			check_mandatory_options
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
			-- unfortunately Visual Eiffel does not seem to support it)
		local
			c: CHARACTER
		do
			c := a_character
			Result := (c >= 'a' and c <= 'z') or
				(c >= 'A' and c <= 'Z') or
				(c >= '0' and c <= '9')
		end
		
		
	valid_long_form (a_string: STRING): BOOLEAN is
			-- Is `a_string' a valid long form for an option?
			-- Allowed character: alpha_numeric, dash (not twice in
			-- a row and not at beginning or end)
		local
			length: INTEGER
			i: INTEGER
		do
			if a_string = Void then
				Result := False
			else
				length := a_string.count
				Result := length >= 1
				from
					i := 1
				until
					i > length or not Result
				loop
					Result := is_alpha_numeric(a_string.item (i)) or
						(i > 1 and i < length and then 
						 a_string.item (i) = short_option_introduction and
						 a_string.item (i-1) /= short_option_introduction)
					i := i + 1
				end
			end
		ensure
			void_string_are_never_valid: (a_string = Void) implies not Result
		end

	valid_short_form (a_character: CHARACTER): BOOLEAN is
			-- Is `a_character' a valid short form for an option?
			-- Allowed characters: alpha_numeric
		do
			Result := is_alpha_numeric(a_character)
		end

	all_valid_short_and_long_form (a_list: DS_LIST [AP_OPTION]):BOOLEAN is
			-- Do all options that are part of `a_list' have valid short
			-- and long form?
		require
			not_void: a_list /= Void
		local
			i,length: INTEGER
		do
			from
				i := 1
				length := a_list.count
				Result := True
			until
				i > length or not Result
			loop
				Result := valid_short_form (a_list.item (i).short_form) and
					valid_long_form (a_list.item (i).long_form)
				i := i + 1
			end				
		end
		
feature{NONE} -- Implementation

	argument_list: DS_LIST [STRING]
			-- List of arguments passed to the parser

	current_options: DS_LIST [AP_OPTION]
			-- The current list of options for parsing
			-- Defaults to `options', and can be changed by parsing an 
			-- introduction_option of one of the alternative_options_lists.	

	is_first_option: BOOLEAN
			-- Are we still looking for the first option?

	check_mandatory_options is
			-- Check if all mandatory options were passed to the program.
		local
			o: AP_OPTION
			error: AP_ERROR
		do
			from
				current_options.start
			until
				current_options.off
			loop
				o := current_options.item_for_iteration
				if o.is_mandatory and not o.was_found then
					create error.make_missing_option_error (o)
					error_handler.report_error (error)
				end
				current_options.forth
			end
		end
	
	parse_argument is
			-- Parse the current argument.
		require
			option_available: not argument_list.off
		local
			l_argument: STRING
			length: INTEGER
		do
			l_argument := argument_list.item_for_iteration
			length := l_argument.count
			if length >= 2 and then l_argument.item (1) = short_option_introduction then
				if l_argument.item (2) = long_option_introduction then
					if length = 2 then
						from
							argument_list.forth
						until
							argument_list.off
						loop
							parameters.force_last (argument_list.item_for_iteration)
							argument_list.forth
						end
					else
						parse_long
					end
				else
					parse_short
				end
			else
				parameters.force_last (l_argument)
				argument_list.forth
			end
		end

	parse_long is
			-- Parse a long argument.
		require
			current_is_long_option: argument_list.item_for_iteration.count >= 2 and then
			(argument_list.item_for_iteration.item (1) = short_option_introduction and
			 argument_list.item_for_iteration.item (2) = long_option_introduction)
		local
			l_argument: STRING
			option_string: STRING
			option,o: AP_OPTION
			parameter_position: INTEGER
			parameter: STRING
			error: AP_ERROR
		do
			l_argument := argument_list.item_for_iteration
			parameter_position := l_argument.index_of (long_option_parameter_introduction, 3)
			if parameter_position > 0 then
				option_string := l_argument.substring (3, parameter_position-1)
				parameter := l_argument.substring (parameter_position+1, l_argument.count)
			else
				option_string := l_argument.substring (3, l_argument.count)
			end
			if is_first_option then
				from
					option := Void
					alternative_options_lists.start
				until
					option /= Void or alternative_options_lists.off
				loop
					o := alternative_options_lists.item_for_iteration.introduction_option
					if o.has_long_form and then o.long_form.is_equal (option_string) then
						option := o
						current_options := alternative_options_lists.item_for_iteration
					end
					alternative_options_lists.forth
				end
				is_first_option := False
			end
			if option = Void then
				from
					current_options.start
				until
					option /= Void or current_options.off
				loop
					o := current_options.item_for_iteration
					if o.has_long_form and then o.long_form.is_equal (option_string) then
						option := o
					end
					current_options.forth
				end
			end
			if option = Void then
				create error.make_unknown_option_error (option_string)
				error_handler.report_error (error)
			else
				if option.needs_parameter then
					if parameter = Void then
						argument_list.forth
						if argument_list.off then
							create error.make_missing_parameter_error (option)
							error_handler.report_error (error)
						else
							parameter := argument_list.item_for_iteration
						end
					end
					if parameter /= Void then
						last_option_parameter := parameter
						option.record_occurrence (Current)				
					end
				else
					if parameter = Void then	
						option.record_occurrence (Current)
					else
						create error.make_unnecessary_parameter_error (option, parameter)
						error_handler.report_error (error)
					end
				end
			end
			if not argument_list.off then
				argument_list.forth				
			end
		end
		
	parse_short is
			-- Parse a short option.
		require
			current_is_short_option: argument_list.item_for_iteration.count > 1 and then
				(argument_list.item_for_iteration.item (1) = short_option_introduction and
				 argument_list.item_for_iteration.item (2) /= long_option_introduction)
		local
			l_argument: STRING
			i: INTEGER
			option_character: CHARACTER
			option,o: AP_OPTION
			parameter: STRING
			error: AP_ERROR
		do
			l_argument := argument_list.item_for_iteration
			from
				i := 2
			until
				i > l_argument.count
			loop
				option_character := l_argument.item(i)
				option := Void
				if is_first_option then
					from
						alternative_options_lists.start
					until
						option /= Void or alternative_options_lists.off
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
				if option = Void then
					from
						current_options.start
					until
						option /= Void or current_options.off
					loop
						o := current_options.item_for_iteration
						if o.has_short_form and then o.short_form = option_character then
							option := o
						end
						current_options.forth
					end
				end
				if option = Void then
					create error.make_unknown_option_error
					  (option_character.out)
					error_handler.report_error (error)
				else
					if option.needs_parameter then
						if i = l_argument.count then
							argument_list.forth
							if not argument_list.off then
								parameter := argument_list.item_for_iteration
							end	
						else
							parameter := l_argument.substring (i+1,l_argument.count)
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
			if not argument_list.off then
				argument_list.forth
			end
		end
		
	reset_parser is
			-- Reset parser and all option prior to parsing arguments.
		local
			all_options_list: DS_LIST[AP_OPTION]
		do
			error_handler.reset
			all_options_list := all_options

			from
				all_options_list.start
			until
				all_options_list.off
			loop
				all_options_list.item_for_iteration.reset
				all_options_list.forth
			end
			current_options := options
			create {DS_ARRAYED_LIST [STRING]}parameters.make (0)
			is_first_option := True
		ensure
			not_has_errors: not error_handler.has_error
		end

invariant

	options_not_void: options /= Void
	alternative_options_lists_not_void: alternative_options_lists /= Void
	no_option_is_void: not options.has (Void)
	application_description_not_void: application_description /= Void
	paramaters_description_not_void: parameters_description /= Void
	
end
