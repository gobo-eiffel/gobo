indexing
	
	description:

		"Abstract representation of an option, that might or might not require an extra argument"

	author: "Bernd Schoeller"
	copyright: "(c) 2006 Bernd Schoeller (bernd@fams.de) and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class AP_OPTION

inherit

	AP_CONSTANTS

feature{NONE} -- Initialization

	initialize is
			-- Perform the common initialization steps.
		do
			description := ""
			reset
		end
	
	make (a_short_form: CHARACTER; a_long_form: STRING) is
			-- Make an option that has `a_short_form' as short form and `a_long_form'
			-- as long form.
		do
			set_short_form (a_short_form)
			set_long_form (a_long_form)
			initialize
		ensure
			short_form_set: has_short_form and short_form = a_short_form
			long_form_set: has_long_form and long_form = a_long_form
		end
	
	make_with_short_form (a_short_form: CHARACTER) is
			-- Make an option that has `a_short_form' as short form.
		do
			set_short_form (a_short_form)
			initialize
		ensure
			short_form_set: has_short_form and short_form = a_short_form
			no_long_form: not has_long_form
		end
				
	make_with_long_form (a_long_form: STRING) is
			-- Make an option that `a_long_form' as long form.
		do
			set_long_form (a_long_form)
			initialize
		ensure
			no_short_form: not has_short_form
			long_form_set: has_long_form and long_form = a_long_form
		end

feature -- Access

	description: STRING
		-- Description of this option

	example: STRING is
			-- Example for the usage of the option (short preferred)
		do
			if is_mandatory then
				create Result.make_empty
			else
				Result := "["
			end
			Result.append_character (short_option_introduction)
			if has_short_form then
				Result.append_string (short_form.out)
			else
				Result.append_character (long_option_introduction)
				Result.append_string (long_form)
			end
			if not is_mandatory then
				Result.append_character (']')
			end
		end

	long_form: STRING
		-- Long form
		
	name: STRING is
			-- Name of the option (short or long from)
		do
			if has_long_form then
				Result := short_option_introduction.out+long_option_introduction.out+long_form
			else
				Result := short_option_introduction.out+short_form.out
			end

		end	
	
	names: STRING is
			-- Names of the option (short and long)
		do
			if has_short_form then
				Result := short_option_introduction.out
				Result.append_character (short_form)
			end
			if has_long_form then
				if Result = Void then
					Result := "    "
				else
					Result.append_string (", ")
				end
				Result.append_character (short_option_introduction)
				Result.append_character (long_option_introduction)
				Result.append_string (long_form)
			end
		end
	
	occurrences: INTEGER is
			-- Number of times this flag was encountered
		deferred
		end
		
	short_form: CHARACTER
			-- Short form

feature -- Status report

	has_long_form: BOOLEAN is
			-- Does this option have a long form?
		do
			Result := (long_form /= Void)
		end

	has_short_form: BOOLEAN
		-- Does this option have a short form?

	is_mandatory: BOOLEAN
			-- Is the option not optional?

	needs_parameter: BOOLEAN is
			-- Does this option need a parameter?
		deferred
		end

	was_found: BOOLEAN is
			-- Was the option found during the last parse?
		do
			Result := occurrences > 0
		ensure
			definition: was_found = (occurrences > 0)
		end

feature -- Element change

	set_description (a_string: STRING) is
			-- Let the text `a_string' describe the option.
		require
			not_void: a_string /= Void
		do
			description := a_string
		ensure
			description_set: description = a_string
		end

	set_long_form (a_long_form: STRING) is
			-- Make `a_long_form' the long form.
		do
			long_form := a_long_form
		ensure
			long_form_set: long_form = a_long_form
			has_long_form: has_long_form
		end

	set_short_form (a_short_form: CHARACTER) is
			-- Make `a_short_form' the short form.
		do
			short_form := a_short_form
			has_short_form := True
		ensure
			short_form_set: short_form = a_short_form
			has_short_form: has_short_form
		end

	enable_mandatory is
			-- Mark the option as mandatory.
		do
			is_mandatory := True
		ensure
			mandatory: is_mandatory
		end
	
	disable_mandatory is
			-- Mark the option as mandatory.
		do
			is_mandatory := True
		ensure
			mandatory: not is_mandatory
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
			parser_available: a_parser /= Void
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
	occurrences_positive: occurrences >= 0
	name_not_void: name /= Void
	example_not_void: example /= Void

end
