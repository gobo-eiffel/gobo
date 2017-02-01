note

	description:

		"Flags that will generate a help text and terminate the application"

	library: "Gobo Eiffel Argument Library"
	copyright: "Copyright (c) 2006-2017, Bernd Schoeller and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class AP_DISPLAY_HELP_FLAG

inherit

	AP_FLAG
		redefine
			record_occurrence
		end

	KL_SHARED_EXCEPTIONS

create

	make,
	make_with_long_form,
	make_with_short_form

feature {AP_PARSER} -- Parser Interface

	record_occurrence (a_parser: AP_PARSER)
			-- The option was found during parsing. Display the help text and
			-- terminate the application.
		do
			display_help (a_parser)
		end

feature -- Help Display

	display_help (a_parser: AP_PARSER)
			-- Display the help text for `a_parser' (and die afterwards).
		do
			a_parser.error_handler.report_info_message (full_help_text (a_parser))
			Exceptions.die (0)
		end

	display_usage (a_parser: AP_PARSER)
			-- Display only the usage instructions (and die afterwards).
		do
			a_parser.error_handler.report_info_message (full_usage_instruction (a_parser))
			Exceptions.die (0)
		end

feature -- Text Generation

	full_help_text (a_parser: AP_PARSER): STRING
			-- Full help text for `a_parser'
		require
			a_parser_not_void: a_parser /= Void
		do
			Result := a_parser.full_help_text
		ensure
			full_help_text_not_void: Result /= Void
		end

	full_usage_instruction (a_parser: AP_PARSER): STRING
			-- Usage instruction for the programs standard and
			-- alternative options
		require
			a_parser_not_void: a_parser /= Void
		do
			Result := a_parser.full_usage_instruction
		ensure
			full_usage_instruction_not_void: Result /= Void
		end

end
