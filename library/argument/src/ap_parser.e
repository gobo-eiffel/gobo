note

	description:

		"Parsers for arguments supplied to a program, with predefined help option"

	library: "Gobo Eiffel Argument Library"
	copyright: "Copyright (c) 2006-2018, Bernd Schoeller and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class AP_PARSER

inherit

	AP_BASIC_PARSER
		redefine
			make
		end

create

	make

feature {NONE} -- Initialization

	make
			-- Create an argument parser containing a help option.
		local
			l_help_alternative_options_list: AP_ALTERNATIVE_OPTIONS_LIST
		do
			precursor
			create help_option.make (help_text_short_option, help_text_long_option)
			help_option.set_description (help_text_description)
			create l_help_alternative_options_list.make (help_option)
			alternative_options_lists.force_last (l_help_alternative_options_list)
		end

feature -- Access

	help_option: AP_DISPLAY_HELP_FLAG
			-- Automatically generated option to display the help text

invariant

	help_option_not_void: help_option /= Void

end
