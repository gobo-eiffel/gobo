indexing

	description:

		"Eiffel system errors"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_SYSTEM_ERROR

inherit

	ET_ERROR

create

	make_vsrc1a,
	make_gvsrc3a,
	make_gvsrc4a,
	make_gvsrc5a,
	make_gvsrc6a

feature {NONE} -- Initialization

	make_vsrc1a (a_class: ET_CLASS) is
			-- Create a new VSRC-1 error: root class `a_class' should not be generic.
			--
			-- ETL2: p.36
		require
			a_class_not_void: a_class /= Void
		do
			code := vsrc1a_template_code
			etl_code := vsrc1_etl_code
			default_template := vsrc1a_default_template
			create parameters.make (1, 2)
			parameters.put (etl_code, 1)
			parameters.put (a_class.name.name, 2)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = root class name
		end

	make_gvsrc3a is
			-- Create a new GVSRC-3 error: missing root class.
			--
			-- Not in ETL
			-- GVSRC-3: See ETL2 VSRC p.36
		do
			code := gvsrc3a_template_code
			etl_code := gvsrc3_etl_code
			default_template := gvsrc3a_default_template
			create parameters.make (1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gvsrc4a (a_class: ET_CLASS) is
			-- Create a new GVSRC-4 error: unknown root class `a_class'.
			--
			-- Not in ETL
			-- GVSRC-4: See ETL2 VSRC p.36
		require
			a_class_not_void: a_class /= Void
		do
			code := gvsrc4a_template_code
			etl_code := gvsrc4_etl_code
			default_template := gvsrc4a_default_template
			create parameters.make (1, 2)
			parameters.put (etl_code, 1)
			parameters.put (a_class.name.name, 2)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = root class name
		end

	make_gvsrc5a (a_class: ET_CLASS; a_feature_name: ET_FEATURE_NAME) is
			-- Create a new GVSRC-5 error: root creation procedure
			-- `a_feature_name' is not a feature of root class `a_class'.
			--
			-- Not in ETL
			-- GVSRC-5: See ETL2 VSRC p.36
		require
			a_class_not_void: a_class /= Void
			a_feature_name_not_void: a_feature_name /= Void
		do
			code := gvsrc5a_template_code
			etl_code := gvsrc5_etl_code
			default_template := gvsrc5a_default_template
			create parameters.make (1, 3)
			parameters.put (etl_code, 1)
			parameters.put (a_class.name.name, 2)
			parameters.put (a_feature_name.name, 3)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = root class name
			-- dollar3: $3 = root creation procedure name
		end

	make_gvsrc6a (a_class: ET_CLASS; a_feature_name: ET_FEATURE_NAME) is
			-- Create a new GVSRC-6 error: root creation feature `a_feature_name'
			-- is not declared as publicly available creation procedure
			-- in root class `a_class'.
			--
			-- Not in ETL
			-- GVSRC-6: See ETL2 VSRC p.36
		require
			a_class_not_void: a_class /= Void
			a_feature_name_not_void: a_feature_name /= Void
		do
			code := gvsrc6a_template_code
			etl_code := gvsrc6_etl_code
			default_template := gvsrc6a_default_template
			create parameters.make (1, 3)
			parameters.put (etl_code, 1)
			parameters.put (a_class.name.name, 2)
			parameters.put (a_feature_name.name, 3)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = root class name
			-- dollar3: $3 = root creation procedure name
		end

feature {NONE} -- Implementation

	vsrc1a_default_template: STRING is "[$1] root class $2 should not be generic."
	gvsrc3a_default_template: STRING is "[$1] missing root class."
	gvsrc4a_default_template: STRING is "[$1] unknown root class $2."
	gvsrc5a_default_template: STRING is "[$1] root creation procedure `$3' is not a feature of root class $2."
	gvsrc6a_default_template: STRING is "[$1] root creation procedure `$3' is not declared as publicly available creation procedure in root class $2."
			-- Default templates

	vsrc1_etl_code: STRING is "VSRC1"
	gvsrc3_etl_code: STRING is "GVSRC3"
	gvsrc4_etl_code: STRING is "GVSRC4"
	gvsrc5_etl_code: STRING is "GVSRC5"
	gvsrc6_etl_code: STRING is "GVSRC6"
			-- ETL validity codes

	vsrc1a_template_code: STRING is "vsrc1a"
	gvsrc3a_template_code: STRING is "gvsrc3a"
	gvsrc4a_template_code: STRING is "gvsrc4a"
	gvsrc5a_template_code: STRING is "gvsrc5a"
	gvsrc6a_template_code: STRING is "gvsrc6a"
			-- Template error codes

end
