note

	description:

		"Internal errors"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2024, Eric Bezault and others"
	license: "MIT License"

class ET_INTERNAL_ERROR

inherit

	ET_ERROR

create

	make_giaaa,
	make_giaab,
	make_giaac

feature {NONE} -- Initialization

	make_giaaa
			-- Create a new GIAAA error.
		do
			code := giaaa_template_code
			etl_code := giaaa_etl_code
			default_template := giaaa_default_template
			create parameters.make_filled (empty_string, 1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_giaab (a_class_name, a_feature_name: STRING; a_index: INTEGER)
			-- Create a new GIAAB error.
		require
			a_class_name_not_void: a_class_name /= Void
			a_feature_name_not_void: a_feature_name /= Void
		do
			code := giaab_template_code
			etl_code := giaab_etl_code
			default_template := giaab_default_template
			create parameters.make_filled (empty_string, 1, 4)
			parameters.put (etl_code, 1)
			parameters.put (a_class_name, 2)
			parameters.put (a_feature_name, 3)
			parameters.put (a_index.out, 4)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = class name
			-- dollar3: $3 = feature name
			-- dollar4: $4 = index
		end

	make_giaac (a_class_name, a_feature_name: STRING; a_index: INTEGER; a_message: STRING)
			-- Create a new GIAAC error.
		require
			a_class_name_not_void: a_class_name /= Void
			a_feature_name_not_void: a_feature_name /= Void
			a_message_not_void: a_message /= Void
		do
			code := giaac_template_code
			etl_code := giaac_etl_code
			default_template := giaac_default_template
			create parameters.make_filled (empty_string, 1, 5)
			parameters.put (etl_code, 1)
			parameters.put (a_class_name, 2)
			parameters.put (a_feature_name, 3)
			parameters.put (a_index.out, 4)
			parameters.put (a_message, 5)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = class name
			-- dollar3: $3 = feature name
			-- dollar4: $4 = index
			-- dollar5: $5 = message
		end

feature {NONE} -- Implementation

	giaaa_default_template: STRING = "[$1] internal error."
	giaab_default_template: STRING = "[$1] $2.$3 ($4): internal error."
	giaac_default_template: STRING = "[$1] $2.$3 ($4): internal error: $5"
			-- Default templates

	giaaa_etl_code: STRING = "GIAAA"
	giaab_etl_code: STRING = "GIAAB"
	giaac_etl_code: STRING = "GIAAC"
			-- ETL validity codes

	giaaa_template_code: STRING = "giaaa"
	giaab_template_code: STRING = "giaab"
	giaac_template_code: STRING = "giaac"
		-- Template error codes

end
