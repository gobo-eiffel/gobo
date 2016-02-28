note

	description:

		"Errors"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ERROR

inherit

	UT_ERROR

create

	-- This class should be declared as deferred,
	-- but it has no deferred feature. The workaround
	-- to avoid VCCH-2 is to add this empty creation
	-- clause.

feature -- Access

	etl_code: STRING
			-- ETL validity code

	default_template: STRING
			-- Default template used to built the error message

	code: STRING
			-- Error code

feature -- Setting

	set_etl_code (a_code: like etl_code)
			-- Set `etl_code' to `a_code'.
		require
			a_code_not_void: a_code /= Void
		do
			etl_code := a_code
		ensure
			etl_code_set: etl_code = a_code
		end

	set_default_template (a_template: like default_template)
			-- Set `default_template' to `a_template'.
		require
			a_template_not_void: a_template /= Void
		do
			default_template := a_template
		ensure
			default_template_set: default_template = a_template
		end

	set_parameters (a_parameters: like parameters)
			-- Set `parameters' to `a_parameters'.
		require
			a_parameters_not_void: a_parameters /= Void
			no_void_parameter: not STRING_ARRAY_.has (a_parameters, Void)
		do
			parameters := a_parameters
		ensure
			parameters_set: parameters = a_parameters
		end

	set_code (a_code: like code)
			-- Set `code' to `a_code'.
		require
			a_code_not_void: a_code /= Void
		do
			code := a_code
		ensure
			code_set: code = a_code
		end

end
