indexing

	description:

		"flags that will generate a help text and terminate the application"
	
	library: "Gobo Eiffel Argument Library"
	copyright: "Copyright (c) 2006, Bernd Schoeller and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class AP_CONSTANTS

feature -- Help Constants

	help_text_description: STRING is "Display this help text."
			-- Description of the 'display help text' option

	help_text_long_option: STRING is "help"
			-- Flag to show the help text, long form

	help_text_short_option: CHARACTER is 'h'
			-- Flag to show the help text, short form

feature -- Option Constants

	long_option_introduction: CHARACTER is '-'
			-- Character that will introduce a long option (after the short option)

	long_option_parameter_introduction: CHARACTER is '='
			-- Character that will introduce the parameter in an long option

	short_option_introduction: CHARACTER is '-'
			-- Character that will introduce a short option

feature -- Other Constants

	abort_message: STRING is "Errors parsing arguments, aborting."
			-- Final message to print before aborting

	default_application_description: STRING is ""
			-- Default description for the application

	default_parameters_description: STRING is "parameters ..."
			-- Default description for parameters

	terminal_width: INTEGER is 79
			-- Width of the terminal to format the help text

	maximum_application_name: INTEGER is 40
			-- Maximum length of the application that is accepted for 
			-- the terminal width to still show correct help messages

invariant

	reasonable_application_name: maximum_application_name <= terminal_width - 10

end
