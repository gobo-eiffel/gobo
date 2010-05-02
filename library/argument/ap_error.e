note

	description:

		"Errors that can occur during argument parsing"

	library: "Gobo Eiffel Argument Library"
	copyright: "Copyright (c) 2006, Bernd Schoeller and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class AP_ERROR

inherit

	UT_ERROR

create

	make_unknown_option_error,
	make_missing_option_error,
	make_missing_parameter_error,
	make_surplus_option_error,
	make_unnecessary_parameter_error,
	make_invalid_parameter_error

feature {NONE} -- Initialization

	make_invalid_parameter_error (an_option: AP_OPTION; a_string: STRING)
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

	make_missing_option_error (an_option: AP_OPTION)
			-- The mandatory option `an_option' was missing.
		require
			an_option_not_void: an_option /= Void
		do
			create parameters.make (1, 1)
			parameters.put (an_option.name, 1)
			default_template := missing_option_error_template
			code := missing_option_error_code
		end

	make_missing_parameter_error (an_option: AP_OPTION)
			-- The option `an_option' was missing a needed parameter.
		require
			an_option_not_void: an_option /= Void
		do
			create parameters.make (1, 1)
			parameters.put (an_option.name, 1)
			default_template := missing_parameter_error_template
			code := missing_parameter_error_code
		end

	make_surplus_option_error (an_option: AP_OPTION)
			-- The option `an_option' was encountered too often.
		require
			an_option_not_void: an_option /= Void
		do
			create parameters.make (1, 1)
			parameters.put (an_option.name, 1)
			default_template := surplus_option_error_template
			code := surplus_option_error_code
		end

	make_unknown_option_error (a_string: STRING)
			-- A non-existing option `a_string' was requested.
		require
			an_option_not_void: a_string /= Void
		do
			create parameters.make (1, 1)
			parameters.put (a_string, 1)
			default_template := unknown_option_error_template
			code := unknown_option_error_code
		end

	make_unnecessary_parameter_error (an_option: AP_OPTION; a_string: STRING)
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

	invalid_parameter_error_template: STRING = "The value '$2' is not valid for the option '$1'."

	missing_option_error_template: STRING = "The mandatory option '$1' is missing."

	missing_parameter_error_template: STRING = "The option '$1' is missing a parameter."

	surplus_option_error_template: STRING = "Too many occurrences of option '$1'."

	unknown_option_error_template: STRING = "Unknown option '$1'."

	unnecessary_parameter_error_template: STRING = "The flag '$1' was given the parameter '$2'."

feature -- Error Codes

	code: STRING
			-- Error code

	invalid_parameter_error_code: STRING = "APIPAR"

	missing_option_error_code: STRING = "APMOPT"

	missing_parameter_error_code: STRING = "APMPAR"

	surplus_option_error_code: STRING = "APSOPT"

	unknown_option_error_code: STRING = "APUOPT"

	unnecessary_parameter_error_code: STRING = "APUPAR"

invariant

	code_not_void: code /= Void
	default_template_not_void: default_template /= Void

end
