note

	description:

		"Internal errors"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2011, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_INTERNAL_ERROR

inherit

	ET_ERROR

create

	make_giaaa

feature {NONE} -- Initialization

	make_giaaa
			-- Create a new GIAAA error.
		do
			code := giaaa_template_code
			etl_code := giaaa_etl_code
			default_template := gi_default_template
			create parameters.make_filled (empty_string, 1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

feature {NONE} -- Implementation

	gi_default_template: STRING = "[$1] internal error."
			-- Default templates

	giaaa_etl_code: STRING = "GIAAA"
			-- ETL validity codes

	giaaa_template_code: STRING = "giaaa"
		-- Template error codes

end
