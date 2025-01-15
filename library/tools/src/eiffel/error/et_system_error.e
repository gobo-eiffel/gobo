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

	make_vsrp1a,
	make_vsrp1b,
	make_vsrp1c,
	make_vsrp2a,
	make_vsrp3a,
	make_vsrt0a,
	make_vsrt1a,
	make_vsrt1b,
	make_vsrt2a,
	make_vsrt4a,
	make_gvknl1a

feature {NONE} -- Initialization

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

	make_vsrt0a (a_root_type_name: ET_IDENTIFIER)
			-- Create a new VSRT-0 error: syntax error in `a_root_type_name'.
		require
			a_root_type_name_not_void: a_root_type_name /= Void
		do
			code := vsrt0a_template_code
			etl_code := vsrt0_etl_code
			default_template := vsrt0a_default_template
			create parameters.make_filled (empty_string, 1, 2)
			parameters.put (etl_code, 1)
			parameters.put (a_root_type_name.name, 2)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = root type name
		end

	make_vsrt1a (a_root_type: ET_TYPE)
			-- Create a new VSRT-1 error: root type `a_root_type' is
			-- not a standalone type, it is an anchored type.
			--
			-- ECMA-367-3-108, 8.5.10 page 78.
		require
			a_root_type_not_void: a_root_type /= Void
		do
			code := vsrt1a_template_code
			etl_code := vsrt1_etl_code
			default_template := vsrt1a_default_template
			create parameters.make_filled (empty_string, 1, 2)
			parameters.put (etl_code, 1)
			parameters.put (a_root_type.to_text, 2)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = root type name
		end

	make_vsrt1b (a_root_type: ET_TYPE)
			-- Create a new VSRT-1 error: root type `a_root_type' is
			-- not a standalone type, it has an anchored type.
			--
			-- ECMA-367-3-108, 8.5.10 page 78.
		require
			a_root_type_not_void: a_root_type /= Void
		do
			code := vsrt1b_template_code
			etl_code := vsrt1_etl_code
			default_template := vsrt1b_default_template
			create parameters.make_filled (empty_string, 1, 2)
			parameters.put (etl_code, 1)
			parameters.put (a_root_type.to_text, 2)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = root type name
		end

	make_vsrt2a (a_type: ET_BASE_TYPE)
			-- Create a new VSRT-2 error: root type involves unknown class
			-- (the base class of `a_type').
			--
			-- ECMA-367-3-108, 8.5.10 page 78.
		require
			a_type_not_void: a_type /= Void
		do
			code := vsrt2a_template_code
			etl_code := vsrt2_etl_code
			default_template := vsrt2a_default_template
			create parameters.make_filled (empty_string, 1, 2)
			parameters.put (etl_code, 1)
			parameters.put (a_type.named_base_class.upper_name, 2)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = unknown class name
		end

	make_vsrt4a (a_class: ET_CLASS)
			-- Create a new VSRT-4 error:  the base class of the root type
			-- is deferred.
			--
			-- ECMA-367-3-108, 8.5.10 page 78.
		require
			a_class_not_void: a_class /= Void
		do
			code := vsrt4a_template_code
			etl_code := vsrt4_etl_code
			default_template := vsrt4a_default_template
			create parameters.make_filled (empty_string, 1, 2)
			parameters.put (etl_code, 1)
			parameters.put (a_class.upper_name, 2)
		ensure
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = root class name
		end

feature {NONE} -- Implementation

	vsrp1a_default_template: STRING = "[$1] root creation procedure `$3' is not a feature of root class $2."
	vsrp1b_default_template: STRING = "[$1] root creation procedure `$3' is not a procedure in root class $2."
	vsrp1c_default_template: STRING = "[$1] root creation procedure `$3' is not declared as publicly available creation procedure in root class $2."
	vsrp2a_default_template: STRING = "[$1] root creation procedure `$3' has one or more formal arguments in root class $2."
	vsrp3a_default_template: STRING = "[$1] root creation procedure `$3' is not precondition-free in root class $2."
	vsrt0a_default_template: STRING = "[$1] syntax error in root type name `$2'."
	vsrt1a_default_template: STRING = "[$1] root type `$2' is not standalone, it is an anchored type."
	vsrt1b_default_template: STRING = "[$1] root type `$2' is not standalone, it has an anchored type."
	vsrt2a_default_template: STRING = "[$1] root type involves unknown class `$2'."
	vsrt4a_default_template: STRING = "[$1] root class $2 should not be deferred."
	gvknl1a_default_template: STRING = "[$1] missing kernel class $2."
			-- Default templates

	vsrp1_etl_code: STRING = "VSRP1"
	vsrp2_etl_code: STRING = "VSRP2"
	vsrp3_etl_code: STRING = "VSRP3"
	vsrt0_etl_code: STRING = "VSRT0"
	vsrt1_etl_code: STRING = "VSRT1"
	vsrt2_etl_code: STRING = "VSRT2"
	vsrt4_etl_code: STRING = "VSRT4"
	gvknl1_etl_code: STRING = "GVKNL1"
			-- ETL validity codes

	vsrp1a_template_code: STRING = "vsrp1a"
	vsrp1b_template_code: STRING = "vsrp1b"
	vsrp1c_template_code: STRING = "vsrp1c"
	vsrp2a_template_code: STRING = "vsrp2a"
	vsrp3a_template_code: STRING = "vsrp3a"
	vsrt0a_template_code: STRING = "vsrt0a"
	vsrt1a_template_code: STRING = "vsrt1a"
	vsrt1b_template_code: STRING = "vsrt1b"
	vsrt2a_template_code: STRING = "vsrt2a"
	vsrt4a_template_code: STRING = "vsrt4a"
	gvknl1a_template_code: STRING = "gvknl1a"
			-- Template error codes

end
