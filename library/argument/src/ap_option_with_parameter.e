note

	description:

		"Options that are not flags and need a parameter"

	library: "Gobo Eiffel Argument Library"
	copyright: "Copyright (c) 2006-2016, Bernd Schoeller and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class AP_OPTION_WITH_PARAMETER [G]

inherit

	AP_OPTION
		redefine
			initialize,
			example,
			names
		end

feature {NONE} -- Initialization

	initialize
			-- Perform the common initialization steps.
		do
			Precursor
			parameter_description := "arg"
			needs_parameter := True
		end

feature -- Access

	default_parameter: like parameter
			-- Default value for `parameter' when no parameter is provided

	example: STRING
			-- Example for the usage of the option
		local
			l_long_form: like long_form
		do
			create Result.make (20)
			if not is_mandatory then
				Result.append_character ('[')
			end
			Result.append_character (short_option_introduction)
			if has_short_form then
				Result.append_character (short_form)
				Result.append_character (' ')
				Result.append_string (parameter_description)
			else
				Result.append_character (long_option_introduction)
				l_long_form := long_form
				check
						-- implied by inherited invariant has_short_or_long
					has_short_or_long: l_long_form /= Void
				end
				Result.append_string (l_long_form)
				if not needs_parameter then
					Result.append_character ('[')
				end
				Result.append_character (long_option_parameter_introduction)
				Result.append_string (parameter_description)
				if not needs_parameter then
					Result.append_character (']')
				end
			end
			if not is_mandatory then
				Result.append_character (']')
			end
		end

	names: STRING
			-- Names of the option (short and long)
		do
			Result := Precursor
			if has_long_form then
				if not needs_parameter then
					Result.append_character ('[')
				end
				Result.append_string (long_option_parameter_introduction.out)
				Result.append_string (parameter_description)
				if not needs_parameter then
					Result.append_character (']')
				end
			else
				Result.append_character (' ')
				Result.append_string (parameter_description)
			end
		end

	parameter_description: STRING
			-- Name of the parameter

	parameter: detachable G
			-- Last value given to the option, or default value
			-- if no parameter was provided to the option
		require
			was_found_or_no_parameter_needed: was_found or not needs_parameter
		local
			l_parameters: like parameters
		do
			l_parameters := parameters
			if not l_parameters.is_empty then
				Result := l_parameters.last
			else
				check precondition_was_found_or_no_parameter_needed: not needs_parameter end
				Result := default_parameter
			end
		end

	parameters: DS_LIST [detachable G]
			-- All parameters given to the option
		deferred
		end

	occurrences: INTEGER
			-- Number of times this flag was encountered
		do
			Result := parameters.count
		end

feature -- Status report

	allows_parameter: BOOLEAN
			-- Does this option allow a parameter?
		do
			Result := True
		end

	needs_parameter: BOOLEAN
			-- Does this option need a parameter?

feature -- Status setting

	set_parameter_description (a_string: STRING)
			-- Set the parameter name to `a_string'.
		require
			a_string_not_void: a_string /= Void
		do
			parameter_description := a_string
		ensure
			parameter_description_set: parameter_description = a_string
		end

	set_default_parameter (a_parameter: like default_parameter)
			-- Set the parameter as optional. If no parameter is given,
			-- the corresponding parameter value is set to `default_parameter'.
			-- This only works for long forms and makes it impossible to
			-- specify the parameter as `--option parameter'.
		require
			not_short_form: not has_short_form
		do
			needs_parameter := False
			default_parameter := a_parameter
		ensure
			not_needed: not needs_parameter
			default_parameter_set: default_parameter = a_parameter
		end

invariant

	options_allows_parameter: allows_parameter
	parameters_not_void: parameters /= Void

end
