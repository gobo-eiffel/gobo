indexing

	description:

		"Errors that can occur during argument parsing"

	library: "Gobo Eiffel Argument Library"
	copyright: "Copyright (c) 2006, Bernd Schoeller and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class AP_ERROR

inherit

	UT_ERROR

create

	make_unknown_option_error,
	make_missing_option_error,
	make_missing_parameter_error,
	make_unnecessary_parameter_error,
	make_invalid_parameter_error

feature {NONE} -- Initialization

	make_invalid_parameter_error (an_option: AP_OPTION; a_string: STRING) is
			-- The option `an_option' was supplied with an invalid parameter `a_string'.
		require
			an_option_not_void: an_option /= Void
			a_string_not_void: a_string /= Void
		do
			create parameters.make (1, 2)
			parameters.put (an_option.name, 1)
			parameters.put (a_string, 2)
			default_template := invalid_parameter_error_template
			code := invalid_parameter_error_code
		end

	make_missing_option_error (an_option: AP_OPTION) is
			-- The mandatory option `an_option' was missing.
		require
			an_option_not_void: an_option /= Void
		do
			create parameters.make (1, 1)
			parameters.put (an_option.name, 1)
			default_template := missing_option_error_template
			code := missing_option_error_code
		end

	make_missing_parameter_error (an_option: AP_OPTION) is
			-- The option `an_option' was missing a needed parameter.
		require
			an_option_not_void: an_option /= Void
		do
			create parameters.make (1, 1)
			parameters.put (an_option.name, 1)
			default_template := missing_parameter_error_template
			code := missing_parameter_error_code
		end

	make_unknown_option_error (a_string: STRING) is
			-- A non-existing option `a_string' was requested.
		require
			an_option_not_void: a_string /= Void
		do
			create parameters.make (1, 1)
			parameters.put (a_string, 1)
			default_template := unknown_option_error_template
			code := unknown_option_error_code
		end

	make_unnecessary_parameter_error (an_option: AP_OPTION; a_string: STRING) is
			-- The option `an_option' was supplied with an unnecessary parameter `a_string'.
		require
			an_option_not_void: an_option /= Void
			a_string_not_void: a_string /= Void
		do
			create parameters.make (1, 2)
			parameters.put (an_option.name, 1)
			parameters.put (a_string, 2)
			default_template := unnecessary_parameter_error_template
			code := unnecessary_parameter_error_code
		end

feature -- Templates

	default_template: STRING
			-- Default template

	invalid_parameter_error_template: STRING is "The value '$2' is not valid for the option '$1'."
	missing_option_error_template: STRING is "The mandatory option '$1' is missing."
	missing_parameter_error_template: STRING is "The option '$1' is missing a parameter."
	unknown_option_error_template: STRING is "Unknown option '$1'."
	unnecessary_parameter_error_template: STRING is "The flag '$1' was given the parameter '$2'."

feature -- Error Codes

	code: STRING
			-- Error code

	invalid_parameter_error_code: STRING is "APIPAR"
	missing_option_error_code: STRING is "APMOPT"
	missing_parameter_error_code: STRING is "APMPAR"
	unknown_option_error_code: STRING is "APUOPT"
	unnecessary_parameter_error_code: STRING is "APUPAR"

invariant

	code_not_void: code /= Void
	default_template_not_void: default_template /= Void

end
