note

	description:

		"Eiffel system errors"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2025, Eric Bezault and others"
	license: "MIT License"

class ET_SYSTEM_ERROR

inherit

	ET_ERROR

create

	make_vsrc1a,
	make_vsrp1a,
	make_vsrp1b,
	make_vsrp1c,
	make_vsrp2a,
	make_vsrp3a,
	make_gvknl1a,
	make_gvsrc3a,
	make_gvsrc4a

feature {NONE} -- Initialization

	make_vsrc1a (a_class: ET_CLASS)
			-- Create a new VSRC-1 error: root class `a_class' should not be generic.
			--
			-- ETL2: p.36
		require
			a_class_not_void: a_class /= Void
		do
			code := vsrc1a_template_code
			etl_code := vsrc1_etl_code
			default_template := vsrc1a_default_template
			create parameters.make_filled (empty_string, 1, 2)
			parameters.put (etl_code, 1)
			parameters.put (a_class.upper_name, 2)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = root class name
		end

	make_gvknl1a (a_class: ET_CLASS)
			-- Create a new GVKNL-1 error: unknown kernel class `a_class'.
			--
			-- Not in ETL
			-- GVKNL: Gobo Validity KerNeL
		require
			a_class_not_void: a_class /= Void
		do
			code := gvknl1a_template_code
			etl_code := gvknl1_etl_code
			default_template := gvknl1a_default_template
			create parameters.make_filled (empty_string, 1, 2)
			parameters.put (etl_code, 1)
			parameters.put (a_class.upper_name, 2)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = kernel class name
		end

	make_gvsrc3a
			-- Create a new GVSRC-3 error: missing root class.
			--
			-- Not in ETL
			-- GVSRC-3: See ETL2 VSRC p.36
		do
			code := gvsrc3a_template_code
			etl_code := gvsrc3_etl_code
			default_template := gvsrc3a_default_template
			create parameters.make_filled (empty_string, 1, 1)
			parameters.put (etl_code, 1)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
		end

	make_gvsrc4a (a_class: ET_CLASS)
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
			create parameters.make_filled (empty_string, 1, 2)
			parameters.put (etl_code, 1)
			parameters.put (a_class.upper_name, 2)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = root class name
		end

	make_vsrp1a (a_class: ET_CLASS; a_feature_name: ET_FEATURE_NAME)
			-- Create a new VSRP-1 error: root creation procedure
			-- `a_feature_name' is not a feature of root class `a_class'.
			--
			-- ECMA-367-3-108, 8.5.12 page 79.
		require
			a_class_not_void: a_class /= Void
			a_feature_name_not_void: a_feature_name /= Void
		do
			code := vsrp1a_template_code
			etl_code := vsrp1_etl_code
			default_template := vsrp1a_default_template
			create parameters.make_filled (empty_string, 1, 3)
			parameters.put (etl_code, 1)
			parameters.put (a_class.upper_name, 2)
			parameters.put (a_feature_name.name, 3)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = root class name
			-- dollar3: $3 = root creation procedure name
		end

	make_vsrp1b (a_class: ET_CLASS; a_feature: ET_FEATURE)
			-- Create a new VSRP-1 error: root creation feature `a_feature'
			-- is not a procedure in root class `a_class'.
			--
			-- ECMA-367-3-108, 8.5.12 page 79.
		require
			a_class_not_void: a_class /= Void
			a_feature_not_void: a_feature /= Void
		do
			code := vsrp1b_template_code
			etl_code := vsrp1_etl_code
			default_template := vsrp1b_default_template
			create parameters.make_filled (empty_string, 1, 3)
			parameters.put (etl_code, 1)
			parameters.put (a_class.upper_name, 2)
			parameters.put (a_feature.lower_name, 3)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = root class name
			-- dollar3: $3 = root creation procedure name
		end

	make_vsrp1c (a_class: ET_CLASS; a_feature_name: ET_FEATURE_NAME)
			-- Create a new VSRP-1 error: root creation feature `a_feature_name'
			-- is not declared as publicly available creation procedure
			-- in root class `a_class'.
			--
			-- ECMA-367-3-108, 8.5.12 page 79.
		require
			a_class_not_void: a_class /= Void
			a_feature_name_not_void: a_feature_name /= Void
		do
			code := vsrp1c_template_code
			etl_code := vsrp1_etl_code
			default_template := vsrp1c_default_template
			create parameters.make_filled (empty_string, 1, 3)
			parameters.put (etl_code, 1)
			parameters.put (a_class.upper_name, 2)
			parameters.put (a_feature_name.lower_name, 3)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = root class name
			-- dollar3: $3 = root creation procedure name
		end

	make_vsrp2a (a_class: ET_CLASS; a_feature: ET_FEATURE)
			-- Create a new VSRP-2 error: root creation feature `a_feature'
			-- has one or more formal arguments in root class `a_class'.
			--
			-- ECMA-367-3-108, 8.5.12 page 79.
		require
			a_class_not_void: a_class /= Void
			a_feature_not_void: a_feature /= Void
		do
			code := vsrp2a_template_code
			etl_code := vsrp2_etl_code
			default_template := vsrp2a_default_template
			create parameters.make_filled (empty_string, 1, 3)
			parameters.put (etl_code, 1)
			parameters.put (a_class.upper_name, 2)
			parameters.put (a_feature.lower_name, 3)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = root class name
			-- dollar3: $3 = root creation procedure name
		end

	make_vsrp3a (a_class: ET_CLASS; a_feature: ET_FEATURE)
			-- Create a new VSRP-3 error: root creation feature `a_feature'
			-- is not precondition-free in root class `a_class'.
			--
			-- ECMA-367-3-108, 8.5.12 page 79.
		require
			a_class_not_void: a_class /= Void
			a_feature_not_void: a_feature /= Void
		do
			code := vsrp3a_template_code
			etl_code := vsrp3_etl_code
			default_template := vsrp3a_default_template
			create parameters.make_filled (empty_string, 1, 3)
			parameters.put (etl_code, 1)
			parameters.put (a_class.upper_name, 2)
			parameters.put (a_feature.lower_name, 3)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = root class name
			-- dollar3: $3 = root creation procedure name
		end

feature {NONE} -- Implementation

	vsrc1a_default_template: STRING = "[$1] root class $2 should not be generic."
	vsrp1a_default_template: STRING = "[$1] root creation procedure `$3' is not a feature of root class $2."
	vsrp1b_default_template: STRING = "[$1] root creation procedure `$3' is not a procedure in root class $2."
	vsrp1c_default_template: STRING = "[$1] root creation procedure `$3' is not declared as publicly available creation procedure in root class $2."
	vsrp2a_default_template: STRING = "[$1] root creation procedure `$3' has one or more formal arguments in root class $2."
	vsrp3a_default_template: STRING = "[$1] root creation procedure `$3' is not precondition-free in root class $2."
	gvknl1a_default_template: STRING = "[$1] missing kernel class $2."
	gvsrc3a_default_template: STRING = "[$1] missing root class."
	gvsrc4a_default_template: STRING = "[$1] unknown root class $2."
			-- Default templates

	vsrc1_etl_code: STRING = "VSRC1"
	vsrp1_etl_code: STRING = "VSRP1"
	vsrp2_etl_code: STRING = "VSRP2"
	vsrp3_etl_code: STRING = "VSRP3"
	gvknl1_etl_code: STRING = "GVKNL1"
	gvsrc3_etl_code: STRING = "GVSRC3"
	gvsrc4_etl_code: STRING = "GVSRC4"
			-- ETL validity codes

	vsrc1a_template_code: STRING = "vsrc1a"
	vsrp1a_template_code: STRING = "vsrp1a"
	vsrp1b_template_code: STRING = "vsrp1b"
	vsrp1c_template_code: STRING = "vsrp1c"
	vsrp2a_template_code: STRING = "vsrp2a"
	vsrp3a_template_code: STRING = "vsrp3a"
	gvknl1a_template_code: STRING = "gvknl1a"
	gvsrc3a_template_code: STRING = "gvsrc3a"
	gvsrc4a_template_code: STRING = "gvsrc4a"
			-- Template error codes

end
