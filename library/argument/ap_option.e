indexing

	description:

		"Abstract representations of an option, that might or might not require an extra argument"

	library: "Gobo Eiffel Argument Library"
	copyright: "Copyright (c) 2006, Bernd Schoeller and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class AP_OPTION

inherit

	AP_CONSTANTS

feature {NONE} -- Initialization

	initialize is
			-- Perform the common initialization steps.
		do
			description := ""
		end

	make (a_short_form: CHARACTER; a_long_form: STRING) is
			-- Make an option that has `a_short_form' as short form and `a_long_form'
			-- as long form.
		require
			a_long_form_not_void: a_long_form /= Void
		do
			initialize
			set_short_form (a_short_form)
			set_long_form (a_long_form)
			reset
		ensure
			short_form_set: has_short_form and short_form = a_short_form
			long_form_set: has_long_form and long_form = a_long_form
			no_optional_parameter: not parameter_is_optional
		end

	make_with_short_form (a_short_form: CHARACTER) is
			-- Make an option that has `a_short_form' as short form.
		do
			initialize
			set_short_form (a_short_form)
			reset
		ensure
			short_form_set: has_short_form and short_form = a_short_form
			no_long_form: not has_long_form
			no_optional_parameter: not parameter_is_optional
		end

	make_with_long_form (a_long_form: STRING) is
			-- Make an option that `a_long_form' as long form.
		require
			a_long_form_not_void: a_long_form /= Void
		do
			initialize
			set_long_form (a_long_form)
			reset
		ensure
			no_short_form: not has_short_form
			long_form_set: has_long_form and long_form = a_long_form
		end

feature -- Access

	description: STRING
			-- Description of this option

	example: STRING is
			-- Example for the usage of the option (short preferred)
		local
			l_long_form: like long_form
		do
			create Result.make (20)
			if not is_mandatory then
				Result.append_character ('[')
			end
			Result.append_character (short_option_introduction)
			if has_short_form then
				Result.append_string (short_form.out)
			else
				l_long_form := long_form
				check
						-- invariant has_short_or_long ensures `log_form' is not Void
					not_has_short_form: l_long_form /= Void
				end
				Result.append_character (long_option_introduction)
				Result.append_string (l_long_form)
			end
			if not is_mandatory then
				Result.append_character (']')
			end
		ensure
			example_not_void: Result /= Void
		end

	long_form: detachable STRING
			-- Long form

	name: STRING is
			-- Name of the option (short or long from)
		local
			l_long_form: like long_form
		do
			if has_long_form then
				l_long_form := long_form
				check
					has_long_form: l_long_form /= Void
				end
				Result := short_option_introduction.out + long_option_introduction.out + l_long_form
			else
				Result := short_option_introduction.out + short_form.out
			end
		ensure
			name_not_void: Result /= Void
		end

	names: STRING is
			-- Names of the option (short and long)
		local
			s: detachable STRING
			l_long_form: like long_form
		do
			if has_short_form then
				s := short_option_introduction.out
				s.append_character (short_form)
			end
			if has_long_form then
				l_long_form := long_form
				check
					has_long_form: l_long_form /= Void
				end
				if s = Void then
					s := "    "
				else
					s.append_string (", ")
				end
				s.append_character (short_option_introduction)
				s.append_character (long_option_introduction)
				s.append_string (l_long_form)
			end
			check
					-- `s' not Void implied by invariant: has_short_or_long
				has_short_or_long: s /= Void
			end
			Result := s
		ensure
			names_not_void: Result /= Void
		end

	occurrences: INTEGER is
			-- Number of times this flag was encountered
		deferred
		end

	maximum_occurrences: INTEGER
			-- Maximal number of occurrences allowed for this option,
			-- or `0' if there is no upper bound

	short_form: CHARACTER
			-- Short form

feature -- Status report

	allows_parameter: BOOLEAN is
			-- Does this option allow a parameter?
		deferred
		end

	has_long_form: BOOLEAN is
			-- Does this option have a long form?
		do
			Result := (long_form /= Void)
		ensure
			definition: Result = (long_form /= Void)
		end

	has_short_form: BOOLEAN
			-- Does this option have a short form?

	is_hidden: BOOLEAN
			-- Is the options hidden and should not show up in help texts?

	is_mandatory: BOOLEAN
			-- Is the option not optional?

	needs_parameter: BOOLEAN is
			-- Does this option need a parameter?
		deferred
		end

	parameter_is_optional: BOOLEAN is
			-- Is the parameter allowed, but optional?
		do
			Result := allows_parameter and not needs_parameter
		ensure
			definition: Result = (allows_parameter and not needs_parameter)
		end

	was_found: BOOLEAN is
			-- Was the option found during the last parse?
		do
			Result := occurrences > 0
		ensure
			definition: Result = (occurrences > 0)
		end

feature -- Element change

	set_description (a_string: STRING) is
			-- Let the text `a_string' describe the option.
		require
			a_string_not_void: a_string /= Void
		do
			description := a_string
		ensure
			description_set: description = a_string
		end

	set_long_form (a_long_form: STRING) is
			-- Make `a_long_form' the long form.
		require
			a_long_form_not_void: a_long_form /= Void
		do
			long_form := a_long_form
		ensure
			has_long_form: has_long_form
			long_form_set: long_form = a_long_form
		end

	set_short_form (a_short_form: CHARACTER) is
			-- Make `a_short_form' the short form.
		require
			no_optional_parameter: not parameter_is_optional
		do
			short_form := a_short_form
			has_short_form := True
		ensure
			has_short_form: has_short_form
			short_form_set: short_form = a_short_form
		end

	set_maximum_occurrences (a_value: INTEGER) is
			-- Set the maximal allowed number of occurrences to `a_value',
			-- or `0' to disable the upper bound.
		require
			positive: a_value >= 0
		do
			maximum_occurrences := a_value
		ensure
			maximum_occurrences_set: maximum_occurrences = a_value
		end

	enable_mandatory is
			-- Make the option mandatory.
		do
			is_mandatory := True
		ensure
			mandatory: is_mandatory
		end

	disable_mandatory is
			-- Make the option not mandatory.
		do
			is_mandatory := False
		ensure
			not_mandatory: not is_mandatory
		end

	hide_in_help_text is
			-- Hide the option in help texts.
		do
			is_hidden := True
		ensure
			is_hidden: is_hidden
		end

	show_in_help_text is
			-- Show the option in help texts.
		do
			is_hidden := False
		ensure
			not_hidden: not is_hidden
		end

feature -- Removal

	remove_long_form is
			-- Remove the long form.
		require
			has_short_form: has_short_form
		do
			long_form := Void
		ensure
			long_form_remove: not has_long_form
		end

	remove_short_form is
			-- Remove the short form.
		require
			has_long: has_long_form
		do
			has_short_form := False
		ensure
			short_form_remove: not has_short_form
		end

feature {AP_PARSER} -- Parser Interface

	record_occurrence (a_parser: AP_PARSER) is
			-- This option was found during parsing by `a_parser'.
		require
			a_parser_not_void: a_parser /= Void
			parameter_if_needed: needs_parameter implies (a_parser.last_option_parameter /= Void)
		deferred
		ensure
			occurrences_increased: occurrences = old occurrences + 1
		end

	reset is
			-- Reset the option to a clean state before parsing.
		deferred
		ensure
			not_found: not was_found
		end

invariant

	has_short_or_long: has_long_form or has_short_form
	occurrences_not_negative: occurrences >= 0
	needs_implies_allows_parameter: needs_parameter implies allows_parameter
	no_optional_parameter_on_short: has_short_form and allows_parameter implies needs_parameter
	maximum_occurrences_positive: maximum_occurrences >= 0

end
