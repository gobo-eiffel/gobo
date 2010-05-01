note

	description:

		"Flags (options that do not require extra arguments)"

	library: "Gobo Eiffel Argument Library"
	copyright: "Copyright (c) 2006, Bernd Schoeller and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class AP_FLAG

inherit

	AP_OPTION

create

	make,
	make_with_long_form,
	make_with_short_form

feature -- Access

	occurrences: INTEGER
			-- Number of times this flag was encountered

feature -- Status report

	allows_parameter: BOOLEAN is
			-- Does this option allow a parameter?
		do
			Result := False
		end

	needs_parameter: BOOLEAN is
			-- Does this option need a parameter?
		do
			Result := False
		end

feature {AP_PARSER} -- Parser Interface

	record_occurrence (a_parser: AP_PARSER) is
			-- This option was found during parsing.
		do
			occurrences := occurrences + 1
		end

	reset is
			-- Reset the option to a clean state before parsing.
		do
			occurrences := 0
		end

invariant

	flags_do_not_have_parameters: not allows_parameter

end
