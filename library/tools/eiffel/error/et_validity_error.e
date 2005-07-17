indexing

	description:

		"Eiffel validity errors"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_VALIDITY_ERROR

inherit

	ET_EIFFEL_ERROR
		redefine
			class_impl
		end

create

	make,
	make_vaol1a,
	make_vape0a,
	make_vape0b,
	make_vape0c,
	make_vape0d,
	make_vape0e,
	make_vape0f,
	make_vape0g,
	make_vape0h,
	make_vave0a,
	make_vave0b,
	make_vcch1a,
	make_vcch1b,
	make_vcch2a,
	make_vcfg1a,
	make_vcfg2a,
	make_vcfg3a,
	make_vcfg3b,
	make_vcfg3c,
	make_vcfg3d,
	make_vcfg3e,
	make_vcfg3g,
	make_vcfg3h,
	make_vcfg3j,
	make_vdjr0a,
	make_vdjr0b,
	make_vdjr0c,
	make_vdpr1a,
	make_vdpr1b,
	make_vdpr2a,
	make_vdpr3a,
	make_vdpr3b,
	make_vdpr3c,
	make_vdpr3d,
	make_vdpr4a,
	make_vdpr4c,
	make_vdpr4d,
	make_vdrd2a,
	make_vdrd2b,
	make_vdrd2c,
	make_vdrd2d,
	make_vdrd3a,
	make_vdrd3b,
	make_vdrd4a,
	make_vdrd4b,
	make_vdrd4c,
	make_vdrd5a,
	make_vdrd6a,
	make_vdrd6b,
	make_vdrs1a,
	make_vdrs2a,
	make_vdrs2b,
	make_vdrs3a,
	make_vdrs4a,
	make_vdrs4b,
	make_vdus1a,
	make_vdus2a,
	make_vdus2b,
	make_vdus3a,
	make_vdus4a,
	make_veen0a,
	make_veen2a,
	make_veen2b,
	make_veen2c,
	make_veen2d,
	make_vffd4a,
	make_vffd5a,
	make_vffd6a,
	make_vffd7a,
	make_vffd7b,
	make_vgcc3a,
	make_vgcc3b,
	make_vgcc5a,
	make_vgcc5b,
	make_vgcc5c,
	make_vgcc5d,
	make_vgcc6a,
	make_vgcc6b,
	make_vgcc6d,
	make_vgcc6e,
	make_vgcc6f,
	make_vgcc6h,
	make_vgcc6i,
	make_vgcc8a,
	make_vgcc8b,
	make_vgcc8c,
	make_vgcc8d,
	make_vgcp1a,
	make_vgcp2a,
	make_vgcp2b,
	make_vgcp3a,
	make_vgcp3b,
	make_vgcp3c,
	make_vhay0a,
	make_vhpr1a,
	make_vhpr1b,
	make_vhpr3a,
	make_vhpr3b,
	make_vhpr3c,
	make_vhrc1a,
	make_vhrc2a,
	make_vhrc4a,
	make_vhrc5a,
	make_vjar0a,
	make_vjar0b,
	make_vjar0c,
	make_vjar0d,
	make_vjaw0a,
	make_vjaw0c,
	make_vjrv0a,
	make_vjrv0b,
	make_vkcn1a,
	make_vkcn1c,
	make_vkcn2a,
	make_vkcn2c,
	make_vlel1a,
	make_vlel2a,
	make_vlel3a,
	make_vmfn0a,
	make_vmfn0b,
	make_vmfn0c,
	make_vmrc2a,
	make_vmrc2b,
	make_vmss1a,
	make_vmss2a,
	make_vmss3a,
	make_vomb1a,
	make_vomb1b,
	make_vomb2a,
	make_vomb2b,
	make_vpca1a,
	make_vpca1b,
	make_vpca2a,
	make_vpca2b,
	make_vpca3a,
	make_vpca3c,
	make_vpca4a,
	make_vpca4b,
	make_vpca4c,
	make_vpca4d,
	make_vpca5a,
	make_vpca5b,
	make_vpca5c,
	make_vpca5d,
	make_vqmc1a,
	make_vqmc1b,
	make_vqmc2a,
	make_vqmc2b,
	make_vqmc3a,
	make_vqmc3b,
	make_vqmc4a,
	make_vqmc4b,
	make_vqmc5a,
	make_vqmc5b,
	make_vqmc6a,
	make_vqmc6b,
	make_vqui0a,
	make_vqui0b,
	make_vreg0a,
	make_vreg0b,
	make_vrfa0a,
	make_vrle1a,
	make_vrle2a,
	make_vscn0a,
	make_vtat1a,
	make_vtat1b,
	make_vtat2a,
	make_vtbt0a,
	make_vtbt0b,
	make_vtbt0c,
	make_vtbt0d,
	make_vtcg3a,
	make_vtcg4a,
	make_vtcg4b,
	make_vtcg4c,
	make_vtcg4d,
	make_vtct0a,
	make_vtct0b,
	make_vtgc0a,
	make_vtgc0b,
	make_vtug1a,
	make_vtug2a,
	make_vuar1a,
	make_vuar1c,
	make_vuar2a,
	make_vuar2b,
	make_vuar2c,
	make_vuar2d,
	make_vuar4a,
	make_vuex1a,
	make_vuex2a,
	make_vuex2b,
	make_vuex2c,
	make_vwbe0a,
	make_vwbe0b,
	make_vweq0a,
	make_vweq0b,
	make_vwst1a,
	make_vwst1b,
	make_vwst2a,
	make_vxrt0a,
	make_gvagp0a,
	make_gvhpr4a,
	make_gvhpr5a,
	make_gvtcg5a,
	make_gvtcg5b,
	make_gvuaa0a,
	make_gvual0a,
	make_gvuia0a,
	make_gvuil0a

feature {NONE} -- Initialization
	
	make (a_class: like current_class; a_position: like position) is
			-- Create a new Eiffel validity error in `a_class' at `a_position'.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_position_not_void: a_position /= Void
		do
			code := gvzzz0a_template_code
			etl_code := gvzzz_etl_code
			default_template := gvzzz0a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_position
			create parameters.make (1, 5)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			position_set: position = a_position
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
		end

	make_vaol1a (a_class: like current_class; an_expression: ET_OLD_EXPRESSION) is
			-- Create a new VAOL-1 error: `an_expression', found in `a_class',
			-- does not appear in a postcondition.
			--
			-- ETL2: p.124
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_expression_not_void: an_expression /= Void
		do
			code := vaol1a_template_code
			etl_code := vaol1_etl_code
			default_template := vaol1a_default_template
			current_class := a_class
			class_impl := a_class
			position := an_expression.position
			create parameters.make (1, 5)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
		end

	make_vape0a (a_class: like current_class; a_name: ET_CALL_NAME; a_feature: ET_FEATURE;
		a_pre_feature: ET_FEATURE; a_client: ET_CLASS) is
			-- Create a new VAPE error: `a_feature' named `a_name', appearing in an unqualified
			-- call in a precondition of `a_pre_feature' in `a_class', is not exported to
			-- class `a_client' to which `a_pre_feature' is exported.
			--
			-- ETL2: p.122
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_pre_feature_not_void: a_pre_feature /= Void
			a_client_not_void: a_client /= Void
		do
			code := vape0a_template_code
			etl_code := vape_etl_code
			default_template := vape0a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			create parameters.make (1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_name.name, 6)
			parameters.put (a_feature.name.name, 7)
			parameters.put (a_pre_feature.name.name, 8)
			parameters.put (a_client.name.name, 9)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name of the call
			-- dollar7: $7 = name of corresponding feature in class $5
			-- dollar8: $8 = name of feature containing precondition
			-- dollar9: $9 = name of client of feature `$8'
		end

	make_vape0b (a_class: like current_class; a_class_impl: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE;
		a_pre_feature: ET_FEATURE; a_client: ET_CLASS) is
			-- Create a new VAPE error: `a_feature' named `a_name', appearing in an unqualified
			-- call in a precondition of `a_pre_feature' in `a_class_impl' and view from
			-- one of its descendants `a_class', is not exported to class `a_client' to
			-- which `a_pre_feature' is exported.
			--
			-- ETL2: p.122
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_pre_feature_not_void: a_pre_feature /= Void
			a_client_not_void: a_client /= Void
		do
			code := vape0b_template_code
			etl_code := vape_etl_code
			default_template := vape0b_default_template
			current_class := a_class
			class_impl := a_class_impl
			position := a_name.position
			create parameters.make (1, 10)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_class_impl.name.name, 6)
			parameters.put (a_name.name, 7)
			parameters.put (a_feature.name.name, 8)
			parameters.put (a_pre_feature.name.name, 9)
			parameters.put (a_client.name.name, 10)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class_impl
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = feature name of the call
			-- dollar8: $8 = name of corresponding feature in class $5
			-- dollar9: $9 = name of feature containing precondition
			-- dollar10: $10 = name of client of feature `$9'
		end

	make_vape0c (a_class: like current_class; a_name: ET_CALL_NAME; a_feature: ET_FEATURE;
		a_target_class: ET_CLASS; a_pre_feature: ET_FEATURE; a_client: ET_CLASS) is
			-- Create a new VAPE error: `a_feature' named `a_name', appearing in a qualified
			-- call with target's base class `a_target_class' in a precondition of
			-- `a_pre_feature' in `a_class', is not exported to class `a_client' to
			-- which `a_pre_feature' is exported.
			--
			-- ETL2: p.122
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_target_class_not_void: a_target_class /= Void
			a_pre_feature_not_void: a_pre_feature /= Void
			a_client_not_void: a_client /= Void
		do
			code := vape0c_template_code
			etl_code := vape_etl_code
			default_template := vape0c_default_template
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			create parameters.make (1, 10)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_name.name, 6)
			parameters.put (a_feature.name.name, 7)
			parameters.put (a_target_class.name.name, 8)
			parameters.put (a_pre_feature.name.name, 9)
			parameters.put (a_client.name.name, 10)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name of the call
			-- dollar7: $7 = name of corresponding feature in class $8
			-- dollar8: $8 = base class of target of the call
			-- dollar9: $9 = name of feature containing precondition
			-- dollar10: $10 = name of client of feature `$8'
		end

	make_vape0d (a_class: like current_class; a_class_impl: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE;
		a_target_class: ET_CLASS; a_pre_feature: ET_FEATURE; a_client: ET_CLASS) is
			-- Create a new VAPE error: `a_feature' named `a_name', appearing in a qualified
			-- call with target's base class `a_target_class' in a precondition of
			-- `a_pre_feature' in `a_class_impl' and view from one of its descendants
			-- a_class', is not exported to class `a_client' to which `a_pre_feature'
			-- is exported.
			--
			-- ETL2: p.122
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_target_class_not_void: a_target_class /= Void
			a_pre_feature_not_void: a_pre_feature /= Void
			a_client_not_void: a_client /= Void
		do
			code := vape0d_template_code
			etl_code := vape_etl_code
			default_template := vape0d_default_template
			current_class := a_class
			class_impl := a_class_impl
			position := a_name.position
			create parameters.make (1, 11)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_class_impl.name.name, 6)
			parameters.put (a_name.name, 7)
			parameters.put (a_feature.name.name, 8)
			parameters.put (a_target_class.name.name, 9)
			parameters.put (a_pre_feature.name.name, 10)
			parameters.put (a_client.name.name, 11)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class_impl
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = feature name of the call
			-- dollar8: $8 = name of corresponding feature in class $9
			-- dollar9: $9 = base class of target of the call
			-- dollar10: $10 = name of feature containing precondition
			-- dollar11: $11 = name of client of feature `$9'
		end

	make_vape0e (a_class: like current_class; a_name: ET_CALL_NAME; a_feature: ET_FEATURE;
		a_pre_feature: ET_FEATURE; a_client: ET_CLASS_NAME) is
			-- Create a new VAPE error: `a_feature' named `a_name', appearing in an unqualified
			-- call in a precondition of `a_pre_feature' in `a_class', is not exported to
			-- class `a_client' to which `a_pre_feature' is exported.
			--
			-- ETL2: p.122
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_pre_feature_not_void: a_pre_feature /= Void
			a_client_not_void: a_client /= Void
		do
			code := vape0e_template_code
			etl_code := vape_etl_code
			default_template := vape0e_default_template
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			create parameters.make (1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_name.name, 6)
			parameters.put (a_feature.name.name, 7)
			parameters.put (a_pre_feature.name.name, 8)
			parameters.put (a_client.name, 9)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name of the call
			-- dollar7: $7 = name of corresponding feature in class $5
			-- dollar8: $8 = name of feature containing precondition
			-- dollar9: $9 = name of client of feature `$8'
		end

	make_vape0f (a_class: like current_class; a_class_impl: ET_CLASS; a_name: ET_CALL_NAME;
		a_feature: ET_FEATURE; a_pre_feature: ET_FEATURE; a_client: ET_CLASS_NAME) is
			-- Create a new VAPE error: `a_feature' named `a_name', appearing in an unqualified
			-- call in a precondition of `a_pre_feature' in `a_class_impl' and view from
			-- one of its descendants `a_class', is not exported to class `a_client' to
			-- which `a_pre_feature' is exported.
			--
			-- ETL2: p.122
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_pre_feature_not_void: a_pre_feature /= Void
			a_client_not_void: a_client /= Void
		do
			code := vape0f_template_code
			etl_code := vape_etl_code
			default_template := vape0f_default_template
			current_class := a_class
			class_impl := a_class_impl
			position := a_name.position
			create parameters.make (1, 10)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_class_impl.name.name, 6)
			parameters.put (a_name.name, 7)
			parameters.put (a_feature.name.name, 8)
			parameters.put (a_pre_feature.name.name, 9)
			parameters.put (a_client.name, 10)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class_impl
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = feature name of the call
			-- dollar8: $8 = name of corresponding feature in class $5
			-- dollar9: $9 = name of feature containing precondition
			-- dollar10: $10 = name of client of feature `$9'
		end

	make_vape0g (a_class: like current_class; a_name: ET_CALL_NAME; a_feature: ET_FEATURE;
		a_target_class: ET_CLASS; a_pre_feature: ET_FEATURE; a_client: ET_CLASS_NAME) is
			-- Create a new VAPE error: `a_feature' named `a_name', appearing in a qualified
			-- call with target's base class `a_target_class' in a precondition of
			-- `a_pre_feature' in `a_class', is not exported to class `a_client' to
			-- which `a_pre_feature' is exported.
			--
			-- ETL2: p.122
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_target_class_not_void: a_target_class /= Void
			a_pre_feature_not_void: a_pre_feature /= Void
			a_client_not_void: a_client /= Void
		do
			code := vape0g_template_code
			etl_code := vape_etl_code
			default_template := vape0g_default_template
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			create parameters.make (1, 10)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_name.name, 6)
			parameters.put (a_feature.name.name, 7)
			parameters.put (a_target_class.name.name, 8)
			parameters.put (a_pre_feature.name.name, 9)
			parameters.put (a_client.name, 10)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name of the call
			-- dollar7: $7 = name of corresponding feature in class $8
			-- dollar8: $8 = base class of target of the call
			-- dollar9: $9 = name of feature containing precondition
			-- dollar10: $10 = name of client of feature `$8'
		end

	make_vape0h (a_class: like current_class; a_class_impl: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE;
		a_target_class: ET_CLASS; a_pre_feature: ET_FEATURE; a_client: ET_CLASS_NAME) is
			-- Create a new VAPE error: `a_feature' named `a_name', appearing in a qualified
			-- call with target's base class `a_target_class' in a precondition of
			-- `a_pre_feature' in `a_class_impl' and view from one of its descendants
			-- a_class', is not exported to class `a_client' to which `a_pre_feature'
			-- is exported.
			--
			-- ETL2: p.122
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_target_class_not_void: a_target_class /= Void
			a_pre_feature_not_void: a_pre_feature /= Void
			a_client_not_void: a_client /= Void
		do
			code := vape0h_template_code
			etl_code := vape_etl_code
			default_template := vape0h_default_template
			current_class := a_class
			class_impl := a_class_impl
			position := a_name.position
			create parameters.make (1, 11)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_class_impl.name.name, 6)
			parameters.put (a_name.name, 7)
			parameters.put (a_feature.name.name, 8)
			parameters.put (a_target_class.name.name, 9)
			parameters.put (a_pre_feature.name.name, 10)
			parameters.put (a_client.name, 11)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class_impl
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = feature name of the call
			-- dollar8: $8 = name of corresponding feature in class $9
			-- dollar9: $9 = base class of target of the call
			-- dollar10: $10 = name of feature containing precondition
			-- dollar11: $11 = name of client of feature `$9'
		end

	make_vave0a (a_class: like current_class; an_expression: ET_EXPRESSION; a_type: ET_NAMED_TYPE) is
			-- Create a new VAVE error: the expression `an_expression' of a
			-- loop variant in `a_class' is of type `a_type' which is
			-- not "INTEGER".
			--
			-- ETL2: p.130
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_expression_not_void: an_expression /= Void
			a_type_not_void: a_type /= Void
		do
			code := vave0a_template_code
			etl_code := vave_etl_code
			default_template := vave0a_default_template
			current_class := a_class
			class_impl := a_class
			position := an_expression.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_type.to_text, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = base type of expression
		end

	make_vave0b (a_class: like current_class; a_class_impl: ET_CLASS; an_expression: ET_EXPRESSION; a_type: ET_NAMED_TYPE) is
			-- Create a new VAVE error: the expression `an_expression' of a
			-- loop variant in `a_class_impl' and viewed from one of
			-- its descendants `a_class' is of type `a_type' which is
			-- not "INTEGER".
			--
			-- ETL2: p.130
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			an_expression_not_void: an_expression /= Void
			a_type_not_void: a_type /= Void
		do
			code := vave0b_template_code
			etl_code := vave_etl_code
			default_template := vave0b_default_template
			current_class := a_class
			class_impl := a_class_impl
			position := an_expression.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_class_impl.name.name, 6)
			parameters.put (a_type.to_text, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class_impl
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = base type of expression
		end

	make_vcch1a (a_class: like current_class; f: ET_FEATURE) is
			-- Create a new VCCH-1 error: `a_class' has deferred features
			-- but is not declared as deferred. `f' is one of these deferred
			-- feature, written in `a_class'.
			--
			-- ETL2: p.51
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_class_not_deferred: not a_class.has_deferred_mark
			f_not_void: f /= Void
			f_deferred: f.is_deferred
		do
			code := vcch1a_template_code
			etl_code := vcch1_etl_code
			default_template := vcch1a_default_template
			current_class := a_class
			class_impl := a_class
			position := f.name.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f.name.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
		end

	make_vcch1b (a_class: like current_class; f: ET_INHERITED_FEATURE) is
			-- Create a new VCCH-1 error: `a_class' has deferred features
			-- but is not declared as deferred. `f' is one of these deferred
			-- feature, inherited from a parent of `a_class'.
			--
			-- ETL2: p.51
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_class_not_deferred: not a_class.has_deferred_mark
			f_not_void: f /= Void
			f_deferred: f.flattened_feature.is_deferred
		do
			code := vcch1a_template_code
			etl_code := vcch1_etl_code
			default_template := vcch1a_default_template
			current_class := a_class
			class_impl := a_class
			if f.parent_feature.has_undefine then
				position := f.parent_feature.undefine_name.position
			else
				position := f.parent_feature.parent.type.name.position
			end
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f.name.name, 6)
			parameters.put (f.parent_feature.parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vcch2a (a_class: like current_class) is
			-- Create a new VCCH-2 error: `a_class' is marked as deferred
			-- but has no deferred feature.
			--
			-- ETL2: p.51
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_class_deferred: a_class.has_deferred_mark
		do
			code := vcch2a_template_code
			etl_code := vcch2_etl_code
			default_template := vcch2a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_class.class_mark.position
			create parameters.make (1, 5)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
		end

	make_vcfg1a (a_class: like current_class; a_formal: ET_FORMAL_PARAMETER; other_class: ET_CLASS) is
			-- Create a new VCFG-1 error: the formal generic parameter `a_formal'
			-- in `a_class' has the same name as class `other_class' in the
			-- surrounding universe.
			--
			-- ETL2: p.52
			-- ETR: p.16
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_formal_not_void: a_formal /= Void
			other_class_not_void: other_class /= Void
			other_class_in_universe: other_class.is_preparsed
		do
			code := vcfg1a_template_code
			etl_code := vcfg1_etl_code
			default_template := vcfg1a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_formal.name.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_formal.name.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = formal parameter
		end

	make_vcfg2a (a_class: like current_class; a_formal1, a_formal2: ET_FORMAL_PARAMETER) is
			-- Create a new VCFG-2 error: a formal generic name is
			-- declared twice in generic class `a_class'.
			--
			-- ETL2: p.52
			-- ETR: p.16
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_formal1_not_void: a_formal1 /= Void
			a_formal2_not_void: a_formal2 /= Void
		do
			code := vcfg2a_template_code
			etl_code := vcfg2_etl_code
			default_template := vcfg2a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_formal1.name.position
			create parameters.make (1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_formal1.name.name, 6)
			parameters.put (a_formal1.index.out, 7)
			parameters.put (a_formal2.index.out, 8)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = first formal name
			-- dollar7: $7 = first formal index
			-- dollar8: $8 = second formal index
		end

	make_vcfg3a (a_class: like current_class; a_type: ET_BIT_FEATURE) is
			-- Create a new VCFG-3 error: invalid type `a_type' in
			-- constraint of formal generic parameter of `a_class'.
			--
			-- ETR: p.16
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		do
			code := vcfg3a_template_code
			etl_code := vcfg3_etl_code
			default_template := vcfg3a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_type.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_type.to_text, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = invalid type
		end

	make_vcfg3b (a_class: like current_class; a_type: ET_BIT_N) is
			-- Create a new VCFG-3 error: invalid type `a_type' in
			-- constraint of formal generic parameter of `a_class'.
			--
			-- ETR: p.16
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		do
			code := vcfg3b_template_code
			etl_code := vcfg3_etl_code
			default_template := vcfg3b_default_template
			current_class := a_class
			class_impl := a_class
			position := a_type.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_type.to_text, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = invalid type
		end

	make_vcfg3c (a_class: like current_class; a_type: ET_LIKE_TYPE) is
			-- Create a new VCFG-3 error: invalid type `a_type' in
			-- constraint of formal generic parameter of `a_class'.
			--
			-- ETR: p.16
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		do
			code := vcfg3c_template_code
			etl_code := vcfg3_etl_code
			default_template := vcfg3c_default_template
			current_class := a_class
			class_impl := a_class
			position := a_type.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_type.to_text, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = invalid type
		end

	make_vcfg3d (a_class: like current_class; a_formal: ET_FORMAL_PARAMETER; a_constraint: ET_FORMAL_PARAMETER_TYPE) is
			-- Create a new VCFG-3 error: the constraint of `a_formal'
			-- in `a_class' is the formal generic parameter itself.
			--
			-- ETR: p.16
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_formal_not_void: a_formal /= Void
			a_constraint_not_void: a_constraint /= Void
			valid_constraint: a_formal.constraint = a_constraint
		do
			code := vcfg3d_template_code
			etl_code := vcfg3_etl_code
			default_template := vcfg3d_default_template
			current_class := a_class
			class_impl := a_class
			position := a_constraint.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_formal.name.name, 6)
			parameters.put (a_constraint.to_text, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = formal parameter
			-- dollar7: $7 = constraint
		end

	make_vcfg3e (a_class: like current_class; a_formal: ET_FORMAL_PARAMETER; a_constraint: ET_FORMAL_PARAMETER_TYPE) is
			-- Create a new VCFG-3 error: the constraint of `a_formal'
			-- in `a_class' is another formal generic parameter
			-- appearing before `a_formal' in the list of formal
			-- generic parameters.
			--
			-- ETR: p.16
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_formal_not_void: a_formal /= Void
			a_constraint_not_void: a_constraint /= Void
			valid_constraint: a_formal.constraint = a_constraint
		do
			code := vcfg3e_template_code
			etl_code := vcfg3_etl_code
			default_template := vcfg3e_default_template
			current_class := a_class
			class_impl := a_class
			position := a_constraint.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_formal.name.name, 6)
			parameters.put (a_constraint.to_text, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = formal parameter
			-- dollar7: $7 = constraint
		end

	make_vcfg3g (a_class: like current_class; a_cycle: DS_LIST [ET_FORMAL_PARAMETER]) is
			-- Create a new VCFG-3 error: the constraints of the formal
			-- generic parameters `a_cycle' of `a_class' are involved
			-- in a cycle.
			--
			-- ETR: p.16
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_cyle_not_void: a_cycle /= Void
			no_void_formal: not a_cycle.has (Void)
			is_cycle: a_cycle.count >= 2
		local
			a_cursor: DS_LIST_CURSOR [ET_FORMAL_PARAMETER]
			a_string: STRING
		do
			code := vcfg3g_template_code
			etl_code := vcfg3_etl_code
			default_template := vcfg3g_default_template
			current_class := a_class
			class_impl := a_class
			position := a_cycle.first.name.position
			from
				create a_string.make (20)
				a_cursor := a_cycle.new_cursor
				a_cursor.start
				a_string.append_string (a_cursor.item.name.name)
				a_cursor.forth
			until
				a_cursor.after
			loop
				a_string.append_string (" -> ")
				a_string.append_string (a_cursor.item.name.name)
				a_cursor.forth
			end
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_string, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = cycle
		end

	make_vcfg3h (a_class: like current_class; a_formal: ET_FORMAL_PARAMETER; a_type: ET_FORMAL_PARAMETER_TYPE) is
			-- Create a new VCFG-3 error: the constraint of `a_formal'
			-- in `a_class' contains the formal generic parameter
			-- itself.
			--
			-- ETR: p.16
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_formal_not_void: a_formal /= Void
			a_type_not_void: a_type /= Void
		do
			code := vcfg3h_template_code
			etl_code := vcfg3_etl_code
			default_template := vcfg3h_default_template
			current_class := a_class
			class_impl := a_class
			position := a_type.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_formal.name.name, 6)
			parameters.put (a_type.to_text, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = formal parameter
			-- dollar7: $7 = formal type in constraint
		end

	make_vcfg3j (a_class: like current_class; a_cycle: DS_LIST [ET_FORMAL_PARAMETER]) is
			-- Create a new VCFG-3 error: the constraints of the formal
			-- generic parameters `a_cycle' of `a_class' are involved
			-- in a cycle.
			--
			-- ETR: p.16
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_cyle_not_void: a_cycle /= Void
			no_void_formal: not a_cycle.has (Void)
			is_cycle: a_cycle.count >= 2
		local
			a_cursor: DS_LIST_CURSOR [ET_FORMAL_PARAMETER]
			a_string: STRING
		do
			code := vcfg3j_template_code
			etl_code := vcfg3_etl_code
			default_template := vcfg3j_default_template
			current_class := a_class
			class_impl := a_class
			position := a_cycle.first.name.position
			from
				create a_string.make (20)
				a_cursor := a_cycle.new_cursor
				a_cursor.start
				a_string.append_string (a_cursor.item.name.name)
				a_cursor.forth
			until
				a_cursor.after
			loop
				a_string.append_string (" -> ")
				a_string.append_string (a_cursor.item.name.name)
				a_cursor.forth
			end
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_string, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = cycle
		end

	make_vdjr0a (a_class: like current_class; f1, f2: ET_PARENT_FEATURE) is
			-- Create a new VDJR error: Features `f1' and `f2'
			-- don't have the same number of arguments when
			-- joining these two deferred features in `a_class'.
			--
			-- ETL2: p.165
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		do
			code := vdjr0a_template_code
			etl_code := vdjr_etl_code
			default_template := vdjr0a_default_template
			current_class := a_class
			class_impl := a_class
			position := f1.parent.type.name.position
			create parameters.make (1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f1.name.name, 6)
			parameters.put (f1.parent.type.name.name, 7)
			parameters.put (f2.parent.type.name.name, 8)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = first parent base class
			-- dollar8: $8 = second parent base class
		end

	make_vdjr0b (a_class: like current_class; f1, f2: ET_PARENT_FEATURE; arg: INTEGER) is
			-- Create a new VDJR error: the type of the `arg'-th
			-- argument is not identical in `f1' and `f2' when
			-- joining these two deferred features in `a_class'.
			--
			-- ETL2: p.165
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		do
			code := vdjr0b_template_code
			etl_code := vdjr_etl_code
			default_template := vdjr0b_default_template
			current_class := a_class
			class_impl := a_class
			position := f1.parent.type.name.position
			create parameters.make (1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f1.name.name, 6)
			parameters.put (f1.parent.type.name.name, 7)
			parameters.put (f2.parent.type.name.name, 8)
			parameters.put (arg.out, 9)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = first parent base class
			-- dollar8: $8 = second parent base class
			-- dollar9: $9 = argument index
		end

	make_vdjr0c (a_class: like current_class; f1, f2: ET_PARENT_FEATURE) is
			-- Create a new VDJR error: the type of the result is
			-- not identical in `f1' and `f2' when joining these
			-- two deferred features in `a_class'.
			--
			-- ETL2: p.165
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		do
			code := vdjr0c_template_code
			etl_code := vdjr_etl_code
			default_template := vdjr0c_default_template
			current_class := a_class
			class_impl := a_class
			position := f1.parent.type.name.position
			create parameters.make (1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f1.name.name, 6)
			parameters.put (f1.parent.type.name.name, 7)
			parameters.put (f2.parent.type.name.name, 8)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = first parent base class
			-- dollar8: $8 = second parent base class
		end

	make_vdpr1a (a_class: like current_class; a_precursor: ET_PRECURSOR_INSTRUCTION) is
			-- Create a new VDPR-1 error: instruction `a_precursor' does not 
			-- appear in a routine body in `a_class'.
			--
			-- ETL3-4.82-00-00: p.215
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_precursor_not_void: a_precursor /= Void
		do
			code := vdpr1a_template_code
			etl_code := vdpr1_etl_code
			default_template := vdpr1a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_precursor.position
			create parameters.make (1, 5)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
		end

	make_vdpr1b (a_class: like current_class; a_precursor: ET_PRECURSOR_EXPRESSION) is
			-- Create a new VDPR-1 error: expression `a_precursor' does not 
			-- appear in a routine body in `a_class'.
			--
			-- ETL3-4.82-00-00: p.215
		do
			code := vdpr1b_template_code
			etl_code := vdpr1_etl_code
			default_template := vdpr1b_default_template
			current_class := a_class
			class_impl := a_class
			position := a_precursor.position
			create parameters.make (1, 5)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
		end

	make_vdpr2a (a_class: like current_class; a_precursor: ET_PRECURSOR) is
			-- Create a new VDPR-2 error: the parent name specified in `a_precursor'
			-- is not the name of a parent of `a_class'.
			--
			-- ETL3-4.82-00-00: p.215
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_precursor_not_void: a_precursor /= Void
			a_precursor_qualified: a_precursor.parent_name /= Void
		local
			a_class_name: ET_CLASS_NAME
		do
			code := vdpr2a_template_code
			etl_code := vdpr2_etl_code
			default_template := vdpr2a_default_template
			current_class := a_class
			class_impl := a_class
			a_class_name := a_precursor.parent_name.class_name
			position := a_class_name.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_class.name.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = parent class name
		end

	make_vdpr3a (a_class: like current_class; a_precursor: ET_PRECURSOR; a_redefined_feature: ET_FEATURE; f1, f2: ET_PARENT_FEATURE) is
			-- Create a new VDPR-3 error: two effective features `f1' and `f2' redefined into 
			-- the same feature `a_redefined_feature' containing `a_precursor' in `a_class'.
			--
			-- ETL3-4.82-00-00: p.215
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_precursor_not_void: a_precursor /= Void
			a_redefined_feature_not_void: a_redefined_feature /= Void
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		do
			code := vdpr3a_template_code
			etl_code := vdpr3_etl_code
			default_template := vdpr3a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_precursor.position
			create parameters.make (1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f1.precursor_feature.name.name, 6)
			parameters.put (f1.parent.type.to_text, 7)
			parameters.put (f2.precursor_feature.name.name, 8)
			parameters.put (f2.parent.type.to_text, 9)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = first feature name
			-- dollar7: $7 = first feature parent class name
			-- dollar8: $8 = second feature name
			-- dollar9: $9 = second feature parent class name
		end

	make_vdpr3b (a_class: like current_class; a_precursor: ET_PRECURSOR; a_redefined_feature: ET_FEATURE; an_inherited_feature: ET_PARENT_FEATURE) is
			-- Create a new VDPR-3 error: feature `a_redefined_feature' where `a_precursor' appears
			-- is the redefinition of a deferred feature `an_inherited_feature' in `a_class'.
			--
			-- ETL3-4.82-00-00: p.215
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_precursor_not_void: a_precursor /= Void
			a_redefined_feature_not_void: a_redefined_feature /= Void
			an_inherited_feature_not_void: an_inherited_feature /= Void
		do
			code := vdpr3b_template_code
			etl_code := vdpr3_etl_code
			default_template := vdpr3b_default_template
			current_class := a_class
			class_impl := a_class
			position := a_precursor.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_redefined_feature.name.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = redefined feature name
		end

	make_vdpr3c (a_class: like current_class; a_precursor: ET_PRECURSOR; a_redefined_feature: ET_FEATURE) is
			-- Create a new VDPR-3 error: feature `a_redefined_feature' where `a_precursor' appears
			-- is not the redefinition of a feature inherited from `a_precursor.parent_name'
			-- in `a_class'.
			--
			-- ETL3-4.82-00-00: p.215
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_precursor_not_void: a_precursor /= Void
			a_precursor_qualified: a_precursor.parent_name /= Void
			a_redefined_feature_not_void: a_redefined_feature /= Void
		local
			a_class_name: ET_CLASS_NAME
		do
			code := vdpr3b_template_code
			etl_code := vdpr3_etl_code
			default_template := vdpr3b_default_template
			current_class := a_class
			class_impl := a_class
			a_class_name := a_precursor.parent_name.class_name
			position := a_class_name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_redefined_feature.name.name, 6)
			parameters.put (a_class_name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = redefined feature name
			-- dollar7: $7 = parent class name
		end

	make_vdpr3d (a_class: like current_class; a_precursor: ET_PRECURSOR; a_feature: ET_FEATURE) is
			-- Create a new VDPR-3 error: `a_precursor' appears in `a_feature' in `a_class',
			-- but `a_feature' is not a redeclared feature.
			--
			-- ETL3-4.82-00-00: p.215
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_precursor_not_void: a_precursor /= Void
			a_feature_not_void: a_feature /= Void
		do
			code := vdpr3d_template_code
			etl_code := vdpr3_etl_code
			default_template := vdpr3d_default_template
			current_class := a_class
			class_impl := a_class
			position := a_precursor.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_feature.name.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
		end

	make_vdpr4a (a_class: like current_class; a_precursor: ET_PRECURSOR_KEYWORD; a_feature: ET_FEATURE; a_parent: ET_CLASS) is
			-- Create a new VDPR-4A error: the number of actual arguments in
			-- the precursor call `a_precursor' appearing in `a_class' is
			-- not the same as the number of formal arguments of `a_feature'
			-- in class `a_parent'.
			--
			-- ETL3-4.82-00-00: p.215
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_precursor_not_void: a_precursor /= Void
			a_feature_not_void: a_feature /= Void
			a_parent_not_void: a_parent /= Void
		do
			code := vdpr4a_template_code
			etl_code := vdpr4a_etl_code
			default_template := vdpr4a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_precursor.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_feature.name.name, 6)
			parameters.put (a_parent.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = name of corresponding feature in class $7
			-- dollar7: $7 = parent base class
		end

	make_vdpr4c (a_class: like current_class; a_precursor: ET_PRECURSOR_KEYWORD; a_feature: ET_FEATURE;
		a_parent: ET_CLASS; arg: INTEGER; an_actual, a_formal: ET_NAMED_TYPE) is
			-- Create a new VDPR-4B error: the `arg'-th actual argument in the precursor
			-- call `a_precursor' appearing in `a_class' does not conform to the
			-- corresponding formal argument of `a_feature' in class `a_parent'.
			--
			-- ETL3-4.82-00-00: p.215
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_precursor_not_void: a_precursor /= Void
			a_feature_not_void: a_feature /= Void
			a_parent_not_void: a_parent /= Void
			an_actual_not_void: an_actual /= Void
			an_actual_named_type: an_actual.is_named_type
			a_formal_not_void: a_formal /= Void
			a_formal_named_type: a_formal.is_named_type
		do
			code := vdpr4c_template_code
			etl_code := vdpr4b_etl_code
			default_template := vdpr4c_default_template
			current_class := a_class
			class_impl := a_class
			position := a_precursor.position
			create parameters.make (1, 10)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_feature.name.name, 6)
			parameters.put (a_parent.name.name, 7)
			parameters.put (arg.out, 8)
			parameters.put (an_actual.to_text, 9)
			parameters.put (a_formal.to_text, 10)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = name of corresponding feature in class $7
			-- dollar7: $7 = parent base class
			-- dollar8: $8 = argument index
			-- dollar9: $9 = actual type
			-- dollar10: $10 = formal type
		end

	make_vdpr4d (a_class, a_class_impl: like current_class; a_precursor: ET_PRECURSOR_KEYWORD; a_feature: ET_FEATURE;
		a_parent: ET_CLASS; arg: INTEGER; an_actual, a_formal: ET_NAMED_TYPE) is
			-- Create a new VDPR-4B error: the `arg'-th actual argument in the precursor
			-- call `a_precursor' appearing in `a_class_impl' and viewed from one of its
			-- descendants `a_class' does not conform to the corresponding formal
			-- argument of `a_feature' in class `a_parent'.
			--
			-- ETL3-4.82-00-00: p.215
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_precursor_not_void: a_precursor /= Void
			a_feature_not_void: a_feature /= Void
			a_parent_not_void: a_parent /= Void
			an_actual_not_void: an_actual /= Void
			an_actual_named_type: an_actual.is_named_type
			a_formal_not_void: a_formal /= Void
			a_formal_named_type: a_formal.is_named_type
		do
			code := vdpr4d_template_code
			etl_code := vdpr4b_etl_code
			default_template := vdpr4d_default_template
			current_class := a_class
			class_impl := a_class_impl
			position := a_precursor.position
			create parameters.make (1, 11)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_class_impl.name.name, 6)
			parameters.put (a_feature.name.name, 7)
			parameters.put (a_parent.name.name, 8)
			parameters.put (arg.out, 9)
			parameters.put (an_actual.to_text, 10)
			parameters.put (a_formal.to_text, 11)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class_impl
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = name of corresponding feature in class $8
			-- dollar8: $8 = parent base class
			-- dollar9: $9 = argument index
			-- dollar10: $10 = actual type
			-- dollar11: $11 = formal type
		end

	make_vdrd2a (a_class: like current_class; f1: ET_FEATURE; f2: ET_PARENT_FEATURE) is
			-- Create a new VDRD-2 error: the feature `f2' is redeclared
			-- as `f1' in `a_class', but the signature of `f1' in `a_class'
			-- does not conform to the signature of `f2' in its parent class.
			--
			-- ETL2: p.163
			-- ETR: p.39
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		do
			code := vdrd2a_template_code
			etl_code := vdrd2_etl_code
			default_template := vdrd2a_default_template
			current_class := a_class
			class_impl := a_class
			position := f1.name.position
			create parameters.make (1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f1.name.name, 6)
			parameters.put (f2.precursor_feature.name.name, 7)
			parameters.put (f2.parent.type.name.name, 8)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = precursor feature name
			-- dollar8: $8 = parent base class
		end

	make_vdrd2b (a_class: like current_class; f1, f2: ET_PARENT_FEATURE) is
			-- Create a new VDRD-2 error: the feature `f2' is redeclared
			-- by being merged to `f1' in `a_class', but the signature of
			-- `f1' in `a_class' does not conform to the signature of
			-- `f2' in its parent class.
			--
			-- ETL2: p.163
			-- ETR: p.39
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		do
			code := vdrd2b_template_code
			etl_code := vdrd2_etl_code
			default_template := vdrd2b_default_template
			current_class := a_class
			class_impl := a_class
			position := f1.parent.type.name.position
			create parameters.make (1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f1.name.name, 6)
			parameters.put (f1.parent.type.name.name, 7)
			parameters.put (f2.precursor_feature.name.name, 8)
			parameters.put (f2.parent.type.name.name, 9)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class of feature
			-- dollar8: $8 = redeclared feature name
			-- dollar9: $9 = parent base class of redeclared feature
		end

	make_vdrd2c (a_class: like current_class; f1: ET_FEATURE; f2: ET_PARENT_FEATURE) is
			-- Create a new VDRD-2 error: the inherited feature `f2', replicated
			-- in `a_class', is implicitly redeclared to the selected redeclared
			-- feature `f1' in `a_class', but the signature of `f1' in `a_class'
			-- does not conform to the signature of `f2' in its parent class.
			--
			-- ETL2: p.163
			-- ETR: p.39
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		do
			code := vdrd2c_template_code
			etl_code := vdrd2_etl_code
			default_template := vdrd2c_default_template
			current_class := a_class
			class_impl := a_class
			position := f1.name.position
			create parameters.make (1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f1.name.name, 6)
			parameters.put (f2.precursor_feature.name.name, 7)
			parameters.put (f2.parent.type.name.name, 8)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = selected feature name
			-- dollar7: $7 = replicated feature name
			-- dollar8: $8 = parent base class of replicated feature
		end

	make_vdrd2d (a_class: like current_class; f1, f2: ET_PARENT_FEATURE) is
			-- Create a new VDRD-2 error: the inherited feature `f2', replicated
			-- in `a_class', is implicitly redeclared to the selected
			-- inherited feature `f1' in `a_class', but the signature of
			-- `f1' in `a_class' does not conform to the signature of `f2'
			-- in its parent class.
			--
			-- ETL2: p.163
			-- ETR: p.39
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		do
			code := vdrd2d_template_code
			etl_code := vdrd2_etl_code
			default_template := vdrd2d_default_template
			current_class := a_class
			class_impl := a_class
			position := f1.parent.type.name.position
			create parameters.make (1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f1.name.name, 6)
			parameters.put (f1.parent.type.name.name, 7)
			parameters.put (f2.precursor_feature.name.name, 8)
			parameters.put (f2.parent.type.name.name, 9)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = selected feature name
			-- dollar7: $7 = parent base class of selected feature
			-- dollar8: $8 = replicated feature name
			-- dollar9: $9 = parent base class of replicated feature
		end

	make_vdrd3a (a_class: like current_class; p: ET_PRECONDITIONS; f: ET_FEATURE) is
			-- Create a new VDRD-3 error: the feature `f' is redeclared
			-- in `a_class', but its preconditions do not begin with
			-- 'require else'.
			--
			-- ETL2: p.163
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			p_not_void: p /= Void
			p_not_valid: not p.is_require_else
			f_not_void: f /= Void
		do
			code := vdrd3a_template_code
			etl_code := vdrd3_etl_code
			default_template := vdrd3a_default_template
			current_class := a_class
			class_impl := a_class
			position := p.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f.name.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
		end

	make_vdrd3b (a_class: like current_class; p: ET_POSTCONDITIONS; f: ET_FEATURE) is
			-- Create a new VDRD-3 error: the feature `f' is redeclared
			-- in `a_class', but its postconditions do not begin with
			-- 'ensure then'.
			--
			-- ETL2: p.163
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			p_not_void: p /= Void
			p_not_valid: not p.is_ensure_then
			f_not_void: f /= Void
		do
			code := vdrd3b_template_code
			etl_code := vdrd3_etl_code
			default_template := vdrd3b_default_template
			current_class := a_class
			class_impl := a_class
			position := p.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f.name.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
		end

	make_vdrd4a (a_class: like current_class; f1: ET_PARENT_FEATURE; f2: ET_FEATURE) is
			-- Create a new VDRD-4 error: the deferred feature `f1'
			-- is redefined into the deferred feature `f2' in `a_class'
			-- but is not listed in the Redefine subclause.
			--
			-- ETL2: p.163
			-- ETR: p.39
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f1_deferred: f1.is_deferred
			f1_not_redefined: not f1.has_redefine
			f2_not_void: f2 /= Void
			f2_deferred: f2.is_deferred
		do
			code := vdrd4a_template_code
			etl_code := vdrd4_etl_code
			default_template := vdrd4a_default_template
			current_class := a_class
			class_impl := a_class
			position := f2.name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f1.name.name, 6)
			parameters.put (f1.parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vdrd4b (a_class: like current_class; f1: ET_PARENT_FEATURE; f2: ET_FEATURE) is
			-- Create a new VDRD-4 error: the effective feature `f1'
			-- is redefined into the effective feature `f2' in `a_class'
			-- but is not listed in the Redefine subclause.
			--
			-- ETL2: p.163
			-- ETR: p.39
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f1_not_deferred: not f1.is_deferred
			f1_not_redefined: not f1.has_redefine
			f2_not_void: f2 /= Void
			f2_not_deferred: not f2.is_deferred
		do
			code := vdrd4b_template_code
			etl_code := vdrd4_etl_code
			default_template := vdrd4b_default_template
			current_class := a_class
			class_impl := a_class
			position := f2.name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f1.name.name, 6)
			parameters.put (f1.parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vdrd4c (a_class: like current_class; f1: ET_PARENT_FEATURE; f2: ET_FEATURE) is
			-- Create a new VDRD-4 error: the effective feature `f1'
			-- is redefined into the deferred feature `f2' in `a_class'
			-- but is not listed in the Undefine and Redefine subclauses.
			--
			-- ETL2: p.163
			-- ETR: p.39
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f1_not_deferred: not f1.is_deferred
			f1_not_redefined: not f1.has_redefine
			f2_not_void: f2 /= Void
			f2_deferred: f2.is_deferred
		do
			code := vdrd4c_template_code
			etl_code := vdrd4_etl_code
			default_template := vdrd4c_default_template
			current_class := a_class
			class_impl := a_class
			position := f2.name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f1.name.name, 6)
			parameters.put (f1.parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vdrd5a (a_class: like current_class; f1: ET_PARENT_FEATURE; f2: ET_FEATURE) is
			-- Create a new VDRD-5 error: the effective feature
			-- `f1' is redefined into the deferred feature `f2'
			-- in `a_class'.
			--
			-- ETL2: p.163
			-- ETR: p.39
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f1_not_deferred: not f1.is_deferred
			f1_redefined: f1.has_redefine
			f2_not_void: f2 /= Void
			f2_deferred: f2.is_deferred
		do
			code := vdrd5a_template_code
			etl_code := vdrd5_etl_code
			default_template := vdrd5a_default_template
			current_class := a_class
			class_impl := a_class
			position := f1.redefine_name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f1.name.name, 6)
			parameters.put (f1.parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vdrd6a (a_class: like current_class; f1: ET_PARENT_FEATURE; f2: ET_FEATURE) is
			-- Create a new VDRD-6 error: the attribute `f1' is not redeclared into
			-- an attribute in `a_class'.
			--
			-- ETL2: p.163
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f1_is_attribute: f1.precursor_feature.is_attribute
			f2_not_void: f2 /= Void
			f2_not_attribute: not f2.is_attribute
		do
			code := vdrd6a_template_code
			etl_code := vdrd6_etl_code
			default_template := vdrd6a_default_template
			current_class := a_class
			class_impl := a_class
			position := f2.name.position
			create parameters.make (1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f1.name.name, 6)
			parameters.put (f1.parent.type.name.name, 7)
			parameters.put (f2.name.name, 8)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = inherited attribute name
			-- dollar7: $7 = parent base class
			-- dollar8: $8 = redeclared feature name
		end

	make_vdrd6b (a_class: like current_class; f1: ET_PARENT_FEATURE; f2: ET_FEATURE) is
			-- Create a new VDRD-6 error: the type of attribute `f1' has not the
			-- same type expandedness as its redeclared version `f2' in `a_class'.
			--
			-- ETL2: p.163
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f1_is_attribute: f1.precursor_feature.is_attribute
			f2_not_void: f2 /= Void
			f2_attribute: f2.is_attribute
		do
			code := vdrd6b_template_code
			etl_code := vdrd6_etl_code
			default_template := vdrd6b_default_template
			current_class := a_class
			class_impl := a_class
			position := f2.name.position
			create parameters.make (1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f1.name.name, 6)
			parameters.put (f1.parent.type.name.name, 7)
			parameters.put (f2.name.name, 8)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = inherited attribute name
			-- dollar7: $7 = parent base class
			-- dollar8: $8 = redeclared attribute name
		end

	make_vdrs1a (a_class: like current_class; a_parent: ET_PARENT; f: ET_FEATURE_NAME) is
			-- Create a new VDRS-1 error: the Redefine subclause of
			-- `a_parent' in `a_class' lists `f' which is not the final
			-- name in `a_class' of a feature inherited from `a_parent'.
			--
			-- ETL2: p.159
			-- ETR: p.37
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
			f_not_void: f /= Void
		do
			code := vdrs1a_template_code
			etl_code := vdrs1_etl_code
			default_template := vdrs1a_default_template
			current_class := a_class
			class_impl := a_class
			position := f.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f.name, 6)
			parameters.put (a_parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vdrs2a (a_class: like current_class; a_parent: ET_PARENT; f: ET_FEATURE_NAME) is
			-- Create a new VDRS-2 error: the Redefine subclause of
			-- `a_parent' in `a_class' lists `f' which is the final
			-- name of a frozen feature.
			--
			-- ETL2: p.159
			-- ETR: p.37
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
			f_not_void: f /= Void
		do
			code := vdrs2a_template_code
			etl_code := vdrs2_etl_code
			default_template := vdrs2a_default_template
			current_class := a_class
			class_impl := a_class
			position := f.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f.name, 6)
			parameters.put (a_parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vdrs2b (a_class: like current_class; a_parent: ET_PARENT; f: ET_FEATURE_NAME) is
			-- Create a new VDRS-2 error: the Redefine subclause of
			-- `a_parent' in `a_class' lists `f' which is the final
			-- name of a constant attribute.
			--
			-- ETL2: p.159
			-- ETR: p.37
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
			f_not_void: f /= Void
		do
			code := vdrs2b_template_code
			etl_code := vdrs2_etl_code
			default_template := vdrs2b_default_template
			current_class := a_class
			class_impl := a_class
			position := f.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f.name, 6)
			parameters.put (a_parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vdrs3a (a_class: like current_class; a_parent: ET_PARENT; f1, f2: ET_FEATURE_NAME) is
			-- Create a new VDRS-3 error: feature name `f2' appears twice
			-- in the Redefine subclause of parent `a_parent' in `a_class'.
			--
			-- ETL2: p.159
			-- ETR: p.37
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		do
			code := vdrs3a_template_code
			etl_code := vdrs3_etl_code
			default_template := vdrs3a_default_template
			current_class := a_class
			class_impl := a_class
			position := f2.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f2.name, 6)
			parameters.put (a_parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vdrs4a (a_class: like current_class; a_feature: ET_PARENT_FEATURE) is
			-- Create a new VDRS-4 error: `a_feature' is not redefined
			-- in `a_class' and therefore should not be listed in the
			-- Redefine subclause.
			--
			-- ETL2: p.159
			-- ETR: p.37
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_redefined: a_feature.has_redefine
		do
			code := vdrs4a_template_code
			etl_code := vdrs4_etl_code
			default_template := vdrs4a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_feature.redefine_name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_feature.redefine_name.name, 6)
			parameters.put (a_feature.parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vdrs4b (a_class: like current_class; a_deferred: ET_PARENT_FEATURE; an_effective: ET_FEATURE) is
			-- Create a new VDRS-4 error: deferred feature `a_deferred' should
			-- not be listed in the Redefine subclause when being effected
			-- to `an_effective' in `a_class'.
			--
			-- ETL2: p.159
			-- ETR: p.37
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_deferred_not_void: a_deferred /= Void
			a_deferred_deferred: a_deferred.is_deferred
			a_deferred_redefined: a_deferred.has_redefine
			an_effective_not_void: an_effective /= Void
			an_effective_not_deferred: not an_effective.is_deferred
		do
			code := vdrs4b_template_code
			etl_code := vdrs4_etl_code
			default_template := vdrs4b_default_template
			current_class := a_class
			class_impl := a_class
			position := a_deferred.redefine_name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_deferred.redefine_name.name, 6)
			parameters.put (a_deferred.parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vdus1a (a_class: like current_class; a_parent: ET_PARENT; f: ET_FEATURE_NAME) is
			-- Create a new VDUS-1 error: the Undefine subclause
			-- of `a_parent' in `a_class' lists `f' which is not
			-- the final name in `a_class' of a feature inherited
			-- from `a_parent'.
			--
			-- ETL2: p.160
			-- ETR: p.37
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
			f_not_void: f /= Void
		do
			code := vdus1a_template_code
			etl_code := vdus1_etl_code
			default_template := vdus1a_default_template
			current_class := a_class
			class_impl := a_class
			position := f.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f.name, 6)
			parameters.put (a_parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vdus2a (a_class: like current_class; a_parent: ET_PARENT; f: ET_FEATURE_NAME) is
			-- Create a new VDUS-2 error: the Undefine subclause
			-- of `a_parent' in `a_class' lists `f' which is the
			-- final name of a frozen feature.
			--
			-- ETL2: p.160
			-- ETR: p.37
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
			f_not_void: f /= Void
		do
			code := vdus2a_template_code
			etl_code := vdus2_etl_code
			default_template := vdus2a_default_template
			current_class := a_class
			class_impl := a_class
			position := f.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f.name, 6)
			parameters.put (a_parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vdus2b (a_class: like current_class; a_parent: ET_PARENT; f: ET_FEATURE_NAME) is
			-- Create a new VDUS-2 error: the Undefine subclause of
			-- `a_parent' in `a_class' lists `f' which is the final
			-- name of an attribute.
			--
			-- ETL2: p.160
			-- ETR: p.37
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
			f_not_void: f /= Void
		do
			code := vdus2b_template_code
			etl_code := vdus2_etl_code
			default_template := vdus2b_default_template
			current_class := a_class
			class_impl := a_class
			position := f.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f.name, 6)
			parameters.put (a_parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vdus3a (a_class: like current_class; a_parent: ET_PARENT; f: ET_FEATURE_NAME) is
			-- Create a new VDUS-3 error: the Undefine subclause
			-- of `a_parent' in `a_class' lists `f' which is not
			-- the final name of an effective feature in `a_parent'.
			--
			-- ETL2: p.160
			-- ETR: p.37
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
			f_not_void: f /= Void
		do
			code := vdus3a_template_code
			etl_code := vdus3_etl_code
			default_template := vdus3a_default_template
			current_class := a_class
			class_impl := a_class
			position := f.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f.name, 6)
			parameters.put (a_parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vdus4a (a_class: like current_class; a_parent: ET_PARENT; f1, f2: ET_FEATURE_NAME) is
			-- Create a new VDUS-4 error: feature name `f2' appears
			-- twice in the Undefine subclause of parent `a_parent'
			-- in `a_class'.
			--
			-- ETL2: p.160
			-- ETR: p.37
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		do
			code := vdus4a_template_code
			etl_code := vdus4_etl_code
			default_template := vdus4a_default_template
			current_class := a_class
			class_impl := a_class
			position := f2.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f2.name, 6)
			parameters.put (a_parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vffd4a (a_class: like current_class; a_feature: ET_FEATURE) is
			-- Create a new VFFD-4 error: deferred `a_feature' is marked as frozen.
			--
			-- ETL2: p.69
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_deferred: a_feature.is_deferred
			a_feature_frozen: a_feature.is_frozen
		do
			code := vffd4a_template_code
			etl_code := vffd4_etl_code
			default_template := vffd4a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_feature.name.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_feature.name.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
		end

	make_vffd5a (a_class: like current_class; a_feature: ET_FEATURE) is
			-- Create a new VFFD-5 error: `a_feature' has a prefix name but is
			-- not an attribute or a function with no argument.
			--
			-- ETL2: p.69
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_name_prefix: a_feature.name.is_prefix
			a_feature_not_prefixable: not a_feature.is_prefixable
		do
			code := vffd5a_template_code
			etl_code := vffd5_etl_code
			default_template := vffd5a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_feature.name.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_feature.name.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
		end

	make_vffd6a (a_class: like current_class; a_feature: ET_FEATURE) is
			-- Create a new VFFD-6 error: `a_feature' has an infix name but is
			-- not a function with exactly one argument.
			--
			-- ETL2: p.69
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_name_infix: a_feature.name.is_infix
			a_feature_not_infixable: not a_feature.is_infixable
		do
			code := vffd6a_template_code
			etl_code := vffd6_etl_code
			default_template := vffd6a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_feature.name.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_feature.name.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
		end

	make_vffd7a (a_class: like current_class; a_feature: ET_FEATURE) is
			-- Create a new VFFD-7 error: the type of the once function `a_feature'
			-- contains an anchored type.
			--
			-- ETL2: p.69
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_once: a_feature.is_once
			a_feature_function: a_feature.type /= Void
		do
			code := vffd7a_template_code
			etl_code := vffd7_etl_code
			default_template := vffd7a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_feature.name.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_feature.name.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
		end

	make_vffd7b (a_class: like current_class; a_feature: ET_FEATURE) is
			-- Create a new VFFD-7 error: the type of the once function `a_feature'
			-- contains an formal generic parameter.
			--
			-- ETL2: p.69
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_once: a_feature.is_once
			a_feature_function: a_feature.type /= Void
		do
			code := vffd7b_template_code
			etl_code := vffd7_etl_code
			default_template := vffd7b_default_template
			current_class := a_class
			class_impl := a_class
			position := a_feature.name.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_feature.name.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
		end

	make_veen0a (a_class: like current_class; an_identifier: ET_IDENTIFIER; a_feature: ET_FEATURE) is
			-- Create a new VEEN error: `an_identifier', appearing in `a_feature'
			-- of `class', is not the final name of a feature in `a_class'
			-- nor the name of a local variable or a formal argument of
			-- `a_feature'.
			--
			-- ETL2: p.276
			-- ETR: p.61
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_identifier_not_void: an_identifier /= Void
			a_feature_not_void: a_feature /= Void
		do
			code := veen0a_template_code
			etl_code := veen_etl_code
			default_template := veen0a_default_template
			current_class := a_class
			class_impl := a_class
			position := an_identifier.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (an_identifier.name, 6)
			parameters.put (a_feature.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = identifier
			-- dollar7: $7 = feature name
		end

	make_veen2a (a_class: like current_class; a_result: ET_RESULT; a_feature: ET_FEATURE) is
			-- Create a new VEEN-2 error: `a_result' appears in the body, postcondition
			-- or rescue clause of `a_feature' in `a_class', but `a_feature' is
			-- a procedure.
			--
			-- ETL2: p.276
			-- ETR: p.61
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_result_not_void: a_result /= Void
			a_feature_not_void: a_feature /= Void
		do
			code := veen2a_template_code
			etl_code := veen2_etl_code
			default_template := veen2a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_result.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_feature.name.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
		end

	make_veen2b (a_class: like current_class; a_result: ET_RESULT; a_feature: ET_FEATURE) is
			-- Create a new VEEN-2 error: `a_result' appears in the precondition
			-- of `a_feature' in `a_class'.
			--
			-- ETL2: p.276
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_result_not_void: a_result /= Void
			a_feature_not_void: a_feature /= Void
		do
			code := veen2b_template_code
			etl_code := veen2_etl_code
			default_template := veen2b_default_template
			current_class := a_class
			class_impl := a_class
			position := a_result.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_feature.name.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
		end

	make_veen2c (a_class: like current_class; a_local: ET_FEATURE_NAME; a_feature: ET_FEATURE) is
			-- Create a new VEEN-2 error: the local variable `a_local' appears in the precondition
			-- or postcondition of `a_feature' in `a_class'.
			--
			-- ETL2: p.276
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_local_not_void: a_local /= Void
			a_local_is_local: a_local.is_local
			a_feature_not_void: a_feature /= Void
		do
			code := veen2c_template_code
			etl_code := veen2_etl_code
			default_template := veen2c_default_template
			current_class := a_class
			class_impl := a_class
			position := a_local.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_local.name, 6)
			parameters.put (a_feature.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = local name
			-- dollar7: $7 = feature name
		end

	make_veen2d (a_class: like current_class; a_result: ET_RESULT) is
			-- Create a new VEEN-2 error: `a_result' appears in the invariant
			-- of `a_class'.
			--
			-- ETL2: p.276
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_result_not_void: a_result /= Void
		do
			code := veen2d_template_code
			etl_code := veen2_etl_code
			default_template := veen2d_default_template
			current_class := a_class
			class_impl := a_class
			position := a_result.position
			create parameters.make (1, 5)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
		end

	make_vgcc3a (a_class: like current_class; a_creation: ET_CREATION_INSTRUCTION;
		a_creation_named_type, a_target_named_type: ET_NAMED_TYPE) is
			-- Create a new VGCC-3 error: the explicit creation type in creation instruction
			-- `a_creation' does not conform to the declared type of the target entity.
			--
			-- ETL2: p.286
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_creation_not_void: a_creation /= Void
			explicit_creation_type: a_creation.type /= Void
			a_creation_named_type_not_void: a_creation_named_type /= Void
			a_creation_named_type: a_creation_named_type.is_named_type
			a_target_named_type_not_void: a_target_named_type /= Void
			a_target_named_type: a_target_named_type.is_named_type
		do
			code := vgcc3a_template_code
			etl_code := vgcc3_etl_code
			default_template := vgcc3a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_creation.type.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_creation_named_type.to_text, 6)
			parameters.put (a_target_named_type.to_text, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = explicit creation type (named type)
			-- dollar7: $7 = target type (named type)
		end

	make_vgcc3b (a_class: like current_class; a_class_impl: ET_CLASS; a_creation: ET_CREATION_INSTRUCTION;
		a_creation_named_type, a_target_named_type: ET_NAMED_TYPE) is
			-- Create a new VGCC-3 error: the explicit creation type in creation instruction
			-- `a_creation' does not conform to the declared type of the target entity
			-- when viewed from `a_class'.
			--
			-- ETL2: p.286
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_creation_not_void: a_creation /= Void
			explicit_creation_type: a_creation.type /= Void
			a_creation_named_type_not_void: a_creation_named_type /= Void
			a_creation_named_type: a_creation_named_type.is_named_type
			a_target_named_type_not_void: a_target_named_type /= Void
			a_target_named_type: a_target_named_type.is_named_type
		do
			code := vgcc3b_template_code
			etl_code := vgcc3_etl_code
			default_template := vgcc3b_default_template
			current_class := a_class
			class_impl := a_class_impl
			position := a_creation.type.position
			create parameters.make (1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (class_impl.name.name, 6)
			parameters.put (a_creation_named_type.to_text, 7)
			parameters.put (a_target_named_type.to_text, 8)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class_impl
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = explicit creation type (named type)
			-- dollar8: $8 = target type (named type)
		end

	make_vgcc5a (a_class: like current_class; a_position: ET_POSITION; a_target: ET_CLASS) is
			-- Create a new VGCC-5 error: the creation expression appearing
			-- in `a_class' at position `a_position', has no Creation_call part but
			-- the base class `a_target' of the creation type has a Creators part.
			--
			-- ETL2: p.286
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_position_not_void: a_position /= Void
			a_target_not_void: a_target /= Void
		do
			code := vgcc5a_template_code
			etl_code := vgcc5_etl_code
			default_template := vgcc5a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_target.name.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = creation type base class name
		end

	make_vgcc5b (a_class: like current_class; a_class_impl: ET_CLASS; a_position: ET_POSITION; a_target: ET_CLASS) is
			-- Create a new VGCC-5 error: the creation expression appearing
			-- in `a_class_impl' at position `a_position' and viewed from one
			-- of its descendants `a_class', has no Creation_call part but the
			-- base class `a_target' of the creation type has a Creators part.
			--
			-- ETL2: p.286
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_position_not_void: a_position /= Void
			a_target_not_void: a_target /= Void
		do
			code := vgcc5b_template_code
			etl_code := vgcc5_etl_code
			default_template := vgcc5b_default_template
			current_class := a_class
			class_impl := a_class_impl
			position := a_position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (class_impl.name.name, 6)
			parameters.put (a_target.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class_impl
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = creation type base class name
		end

	make_vgcc5c (a_class: like current_class; a_creation: ET_CREATION_INSTRUCTION; a_target: ET_CLASS) is
			-- Create a new VGCC-5 error: the creation instruction `a_creation',
			-- appearing in `a_class', has no Creation_call part but the
			-- base class `a_target' of the creation type has a Creators part.
			--
			-- ETL2: p.286
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_creation_not_void: a_creation /= Void
			a_target_not_void: a_target /= Void
		do
			code := vgcc5c_template_code
			etl_code := vgcc5_etl_code
			default_template := vgcc5c_default_template
			current_class := a_class
			class_impl := a_class
			position := a_creation.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_target.name.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = creation type base class name
		end

	make_vgcc5d (a_class: like current_class; a_class_impl: ET_CLASS; a_creation: ET_CREATION_INSTRUCTION; a_target: ET_CLASS) is
			-- Create a new VGCC-5 error: the creation instruction `a_creation',
			-- appearing in `a_class_impl' and viewed from one of its
			-- descendants `a_class', has no Creation_call part but the
			-- base class `a_target' of the creation type has a Creators part.
			--
			-- ETL2: p.286
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_creation_not_void: a_creation /= Void
			a_target_not_void: a_target /= Void
		do
			code := vgcc5d_template_code
			etl_code := vgcc5_etl_code
			default_template := vgcc5d_default_template
			current_class := a_class
			class_impl := a_class_impl
			position := a_creation.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (class_impl.name.name, 6)
			parameters.put (a_target.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class_impl
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = creation type base class name
		end

	make_vgcc6a (a_class: like current_class; cp: ET_FEATURE_NAME; f: ET_FEATURE) is
			-- Create a new VGCC-6 error: creation procedure name
			-- `cp' is the final name of a once-procedure in `a_class'.
			--
			-- ETL2: p.286
			-- ETL3 (4.82-00-00): p.432 (VGCC-4)
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			cp_not_void: cp /= Void
			f_not_void: f /= Void
			f_name: f.name.same_feature_name (cp)
			f_procedure: f.is_procedure
			f_once: f.is_once
		do
			code := vgcc6a_template_code
			etl_code := vgcc6_etl_code
			default_template := vgcc6a_default_template
			current_class := a_class
			class_impl := a_class
			position := cp.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (cp.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = creation procedure name
		end

	make_vgcc6b (a_class: like current_class; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS) is
			-- Create a new VGCC-6 error: the feature name `a_name', appearing
			-- in a creation expression in `a_class', is not a procedure.
			--
			-- ETL2: p.286
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_target_not_void: a_target /= Void
		do
			code := vgcc6b_template_code
			etl_code := vgcc6_etl_code
			default_template := vgcc6b_default_template
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			create parameters.make (1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_name.name, 6)
			parameters.put (a_feature.name.name, 7)
			parameters.put (a_target.name.name, 8)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name of the creation call
			-- dollar7: $7 = name of corresponding feature in class $8
			-- dollar8: $8 = base class of creation type
		end

	make_vgcc6d (a_class: like current_class; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS) is
			-- Create a new VGCC-6 error: `a_feature' of class `a_target', appearing in
			-- a creation expression with creation procedure name `a_name' in `a_class',
			-- is not exported for creation to `a_class'.
			--
			-- ETL2: p.286
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_target_not_void: a_target /= Void
		do
			code := vgcc6d_template_code
			etl_code := vgcc6_etl_code
			default_template := vgcc6d_default_template
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			create parameters.make (1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_name.name, 6)
			parameters.put (a_feature.name.name, 7)
			parameters.put (a_target.name.name, 8)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name of the creation call
			-- dollar7: $7 = name of corresponding feature in class $8
			-- dollar8: $8 = base class of creation type
		end

	make_vgcc6e (a_class: like current_class; a_class_impl: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS) is
			-- Create a new VGCC-6 error: `a_feature' of class `a_target', appearing in
			-- a creation expression with creation procedure name `a_name' in `a_class_impl',
			-- is not exported for creation to `a_class'.
			--
			-- ETL2: p.286
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_target_not_void: a_target /= Void
		do
			code := vgcc6e_template_code
			etl_code := vgcc6_etl_code
			default_template := vgcc6e_default_template
			current_class := a_class
			class_impl := a_class_impl
			position := a_name.position
			create parameters.make (1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_class_impl.name.name, 6)
			parameters.put (a_name.name, 7)
			parameters.put (a_feature.name.name, 8)
			parameters.put (a_target.name.name, 9)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class_impl
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = feature name of the creation call
			-- dollar8: $8 = name of corresponding feature in class $8
			-- dollar9: $9 = base class of creation type
		end

	make_vgcc6f (a_class: like current_class; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS) is
			-- Create a new VGCC-6 error: the feature name `a_name', appearing
			-- in a creation instruction in `a_class', is not a procedure.
			--
			-- ETL2: p.286
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_target_not_void: a_target /= Void
		do
			code := vgcc6f_template_code
			etl_code := vgcc6_etl_code
			default_template := vgcc6f_default_template
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			create parameters.make (1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_name.name, 6)
			parameters.put (a_feature.name.name, 7)
			parameters.put (a_target.name.name, 8)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name of the creation call
			-- dollar7: $7 = name of corresponding feature in class $8
			-- dollar8: $8 = base class of creation type
		end

	make_vgcc6h (a_class: like current_class; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS) is
			-- Create a new VGCC-6 error: `a_feature' of class `a_target', appearing in
			-- a creation instruction with creation procedure name `a_name' in `a_class',
			-- is not exported for creation to `a_class'.
			--
			-- ETL2: p.286
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_target_not_void: a_target /= Void
		do
			code := vgcc6h_template_code
			etl_code := vgcc6_etl_code
			default_template := vgcc6h_default_template
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			create parameters.make (1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_name.name, 6)
			parameters.put (a_feature.name.name, 7)
			parameters.put (a_target.name.name, 8)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name of the creation call
			-- dollar7: $7 = name of corresponding feature in class $8
			-- dollar8: $8 = base class of creation type
		end

	make_vgcc6i (a_class: like current_class; a_class_impl: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS) is
			-- Create a new VGCC-6 error: `a_feature' of class `a_target', appearing in
			-- a creation instruction with creation procedure name `a_name' in `a_class_impl',
			-- is not exported for creation to `a_class'.
			--
			-- ETL2: p.286
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_target_not_void: a_target /= Void
		do
			code := vgcc6i_template_code
			etl_code := vgcc6_etl_code
			default_template := vgcc6i_default_template
			current_class := a_class
			class_impl := a_class_impl
			position := a_name.position
			create parameters.make (1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_class_impl.name.name, 6)
			parameters.put (a_name.name, 7)
			parameters.put (a_feature.name.name, 8)
			parameters.put (a_target.name.name, 9)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class_impl
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = feature name of the creation call
			-- dollar8: $8 = name of corresponding feature in class $8
			-- dollar9: $9 = base class of creation type
		end

	make_vgcc8a (a_class: like current_class; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS; a_formal: ET_FORMAL_PARAMETER) is
			-- Create a new VGCC-8 error: `a_feature' of class `a_target', appearing in
			-- a creation expression with creation procedure name `a_name' in `a_class',
			-- is not listed as creation procedure for the formal parameter `a_formal'
			-- in `a_class'.
			--
			-- In ISE Eiffel only.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_target_not_void: a_target /= Void
			a_formal_not_void: a_formal /= Void
		do
			code := vgcc8a_template_code
			etl_code := vgcc8_etl_code
			default_template := vgcc8a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			create parameters.make (1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_name.name, 6)
			parameters.put (a_feature.name.name, 7)
			parameters.put (a_target.name.name, 8)
			parameters.put (a_formal.index.out, 9)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name of the creation call
			-- dollar7: $7 = name of corresponding feature in class $8
			-- dollar8: $8 = base class of creation type
			-- dollar9: $9 = index of formal parameter in class $5
		end

	make_vgcc8b (a_class: like current_class; a_class_impl: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS; a_formal: ET_FORMAL_PARAMETER) is
			-- Create a new VGCC-8 error: `a_feature' of class `a_target', appearing in
			-- a creation expression with creation procedure name `a_name' in `a_class_impl'
			-- and viewed from one of its descendants `a_class', is not listed as creation
			-- procedure for the formal parameter `a_formal' in `a_class'.
			--
			-- In ISE Eiffel only.
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_target_not_void: a_target /= Void
			a_formal_not_void: a_formal /= Void
		do
			code := vgcc8b_template_code
			etl_code := vgcc8_etl_code
			default_template := vgcc8b_default_template
			current_class := a_class
			class_impl := a_class_impl
			position := a_name.position
			create parameters.make (1, 10)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_class_impl.name.name, 6)
			parameters.put (a_name.name, 7)
			parameters.put (a_feature.name.name, 8)
			parameters.put (a_target.name.name, 9)
			parameters.put (a_formal.index.out, 10)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class_impl
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = feature name of the creation call
			-- dollar8: $8 = name of corresponding feature in class $8
			-- dollar9: $9 = base class of creation type
			-- dollar10: $10 = index of formal parameter in class $5
		end

	make_vgcc8c (a_class: like current_class; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS; a_formal: ET_FORMAL_PARAMETER) is
			-- Create a new VGCC-8 error: `a_feature' of class `a_target', appearing in
			-- a creation instruction with creation procedure name `a_name' in `a_class',
			-- is not listed as creation procedure for the formal parameter `a_formal'
			-- in `a_class'.
			--
			-- In ISE Eiffel only.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_target_not_void: a_target /= Void
			a_formal_not_void: a_formal /= Void
		do
			code := vgcc8c_template_code
			etl_code := vgcc8_etl_code
			default_template := vgcc8c_default_template
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			create parameters.make (1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_name.name, 6)
			parameters.put (a_feature.name.name, 7)
			parameters.put (a_target.name.name, 8)
			parameters.put (a_formal.index.out, 9)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name of the creation call
			-- dollar7: $7 = name of corresponding feature in class $8
			-- dollar8: $8 = base class of creation type
			-- dollar9: $9 = index of formal parameter in class $5
		end

	make_vgcc8d (a_class: like current_class; a_class_impl: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS; a_formal: ET_FORMAL_PARAMETER) is
			-- Create a new VGCC-8 error: `a_feature' of class `a_target', appearing in
			-- a creation instruction with creation procedure name `a_name' in `a_class_impl'
			-- and viewed from one of its descendants `a_class', is not listed as creation
			-- procedure for the formal parameter `a_formal' in `a_class'.
			--
			-- In ISE Eiffel only.
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_target_not_void: a_target /= Void
			a_formal_not_void: a_formal /= Void
		do
			code := vgcc8d_template_code
			etl_code := vgcc8_etl_code
			default_template := vgcc8d_default_template
			current_class := a_class
			class_impl := a_class_impl
			position := a_name.position
			create parameters.make (1, 10)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_class_impl.name.name, 6)
			parameters.put (a_name.name, 7)
			parameters.put (a_feature.name.name, 8)
			parameters.put (a_target.name.name, 9)
			parameters.put (a_formal.index.out, 10)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class_impl
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = feature name of the creation call
			-- dollar8: $8 = name of corresponding feature in class $8
			-- dollar9: $9 = base class of creation type
			-- dollar10: $10 = index of formal parameter in class $5
		end

	make_vgcp1a (a_class: like current_class; a_creator: ET_CREATOR) is
			-- Create a new VGCP-1 error: `a_class' is deferred
			-- but has a Creation clause.
			--
			-- ETL2: p.285
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_creator_not_void: a_creator /= Void
		do
			code := vgcp1a_template_code
			etl_code := vgcp1_etl_code
			default_template := vgcp1a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_creator.position
			create parameters.make (1, 5)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
		end

	make_vgcp2a (a_class: like current_class; cp: ET_FEATURE_NAME) is
			-- Create a new VGCP-2 error: creation procedure name
			-- `cp' is not the final name of a feature in `a_class'.
			--
			-- ETL2: p.285
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			cp_not_void: cp /= Void
		do
			code := vgcp2a_template_code
			etl_code := vgcp2_etl_code
			default_template := vgcp2a_default_template
			current_class := a_class
			class_impl := a_class
			position := cp.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (cp.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = creation procedure name
		end

	make_vgcp2b (a_class: like current_class; cp: ET_FEATURE_NAME; f: ET_FEATURE) is
			-- Create a new VGCP-2 error: creation procedure name
			-- `cp' is not the final name of a procedure in `a_class'.
			--
			-- ETL2: p.285
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			cp_not_void: cp /= Void
			f_not_void: f /= Void
			f_name: f.name.same_feature_name (cp)
			f_not_procedure: not f.is_procedure
		do
			code := vgcp2b_template_code
			etl_code := vgcp2_etl_code
			default_template := vgcp2b_default_template
			current_class := a_class
			class_impl := a_class
			position := cp.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (cp.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = creation procedure name
		end

	make_vgcp3a (a_class: like current_class; f1, f2: ET_FEATURE_NAME) is
			-- Create a new VGCP-3 error: procedure name
			-- appears twice in creation Feature_list.
			--
			-- ETL2: p.285
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		do
			code := vgcp3a_template_code
			etl_code := vgcp3_etl_code
			default_template := vgcp3a_default_template
			current_class := a_class
			class_impl := a_class
			position := f2.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f2.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = procedure name
		end

	make_vgcp3b (a_class: like current_class; f1, f2: ET_FEATURE_NAME) is
			-- Create a new VGCP-3 error: procedure name
			-- appears in two different Creation clauses.
			--
			-- ETL2: p.285
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		do
			code := vgcp3b_template_code
			etl_code := vgcp3_etl_code
			default_template := vgcp3b_default_template
			current_class := a_class
			class_impl := a_class
			position := f2.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f2.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = procedure name
		end

	make_vgcp3c (a_class: like current_class; f1, f2: ET_FEATURE_NAME) is
			-- Create a new VGCP-3 error: procedure name
			-- appears twice in creation Feature_list of
			-- a generic constraint.
			--
			-- ETL2: p.285
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		do
			code := vgcp3c_template_code
			etl_code := vgcp3_etl_code
			default_template := vgcp3c_default_template
			current_class := a_class
			class_impl := a_class
			position := f2.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f2.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = procedure name
		end

	make_vhay0a (a_class: like current_class) is
			-- Create a new VTCT error: `a_class' implicitly inherits
			-- from unknown class ANY.
			--
			-- ETL2: p.88
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			code := vhay0a_template_code
			etl_code := vhay_etl_code
			default_template := vhay0a_default_template
			current_class := a_class
			class_impl := a_class
			position := null_position
			create parameters.make (1, 5)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
		end

	make_vhpr1a (a_class: like current_class; a_cycle: DS_LIST [ET_CLASS]) is
			-- Create a new VHPR-1 error: `a_class' is 
			-- involved in the inheritance cycle `a_cycle'.
			--
			-- ETL2: p.79
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_cycle_not_void: a_cycle /= Void
			no_void_class: not a_cycle.has (Void)
			is_cycle: a_cycle.count >= 2
		local
			a_cursor: DS_LIST_CURSOR [ET_CLASS]
			a_string: STRING
		do
			code := vhpr1a_template_code
			etl_code := vhpr1_etl_code
			default_template := vhpr1a_default_template
			current_class := a_class
			class_impl := a_class
			position := null_position
			from
				create a_string.make (20)
				a_cursor := a_cycle.new_cursor
				a_cursor.start
				a_string.append_string (a_cursor.item.name.name)
				a_cursor.forth
			until
				a_cursor.after
			loop
				a_string.append_string (" -> ")
				a_string.append_string (a_cursor.item.name.name)
				a_cursor.forth
			end
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_string, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = cycle
		end

	make_vhpr1b (a_class: like current_class; a_none: ET_BASE_TYPE) is
			-- Create a new VHPR-1 error: `a_class' is involved
			-- in the inheritance cycle: it inherits from NONE.
			--
			-- ETL2: p.79
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_none_not_void: a_none /= Void
		do
			code := vhpr1b_template_code
			etl_code := vhpr1_etl_code
			default_template := vhpr1b_default_template
			current_class := a_class
			class_impl := a_class
			position := a_none.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_none.to_text, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = class NONE
		end

	make_vhpr3a (a_class: like current_class; a_type: ET_BIT_FEATURE) is
			-- Create a new VHPR-3 error: invalid type `a_type'
			-- in parent clause of `a_class'.
			--
			-- ETR: ?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		do
			code := vhpr3a_template_code
			etl_code := vhpr3_etl_code
			default_template := vhpr3a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_type.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_type.to_text, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = invalid type
		end

	make_vhpr3b (a_class: like current_class; a_type: ET_BIT_N) is
			-- Create a new VHPR-3 error: invalid type `a_type'
			-- in parent clause of `a_class'.
			--
			-- ETR: ?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		do
			code := vhpr3b_template_code
			etl_code := vhpr3_etl_code
			default_template := vhpr3b_default_template
			current_class := a_class
			class_impl := a_class
			position := a_type.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_type.to_text, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = invalid type
		end

	make_vhpr3c (a_class: like current_class; a_type: ET_LIKE_TYPE) is
			-- Create a new VHPR-3 error: invalid type `a_type'
			-- in parent clause of `a_class'.
			--
			-- ETR: ?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		do
			code := vhpr3c_template_code
			etl_code := vhpr3_etl_code
			default_template := vhpr3c_default_template
			current_class := a_class
			class_impl := a_class
			position := a_type.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_type.to_text, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = invalid type
		end

	make_vhrc1a (a_class: like current_class; a_parent: ET_PARENT; a_rename: ET_RENAME) is
			-- Create a new VHRC-1 error: the feature name appearing as first
			-- element of the Rename_pair `a_rename' in Parent clause
			-- `a_parent' in `a_class' is not the final name of a feature
			-- in `a_parent'.
			--
			-- ETL2: p.81
			-- ETR: p.23
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
			a_rename_not_void: a_rename /= Void
		do
			code := vhrc1a_template_code
			etl_code := vhrc1_etl_code
			default_template := vhrc1a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_rename.old_name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_rename.old_name.name, 6)
			parameters.put (a_parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vhrc2a (a_class: like current_class; a_parent: ET_PARENT; a_rename1, a_rename2: ET_RENAME) is
			-- Create a new VHRC-2 error: a feature name appears more
			-- than once (e.g. also in `a_rename1') as first element
			-- of the Rename_pair `a_rename2' in Parent clause
			-- `a_parent' in `a_class'.
			--
			-- ETL2: p.81
			-- ETR: p.23
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
			a_rename1_not_void: a_rename1 /= Void
			a_rename2_not_void: a_rename2 /= Void
		do
			code := vhrc2a_template_code
			etl_code := vhrc2_etl_code
			default_template := vhrc2a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_rename2.old_name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_rename2.old_name.name, 6)
			parameters.put (a_parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vhrc4a (a_class: like current_class; a_parent: ET_PARENT; a_rename: ET_RENAME; f: ET_FEATURE) is
			-- Create a new VHRC-4 error: the Rename_pair
			-- `a_rename' has a new_name of the Prefix form,
			-- but the corresponding feature `f' is not an
			-- attibute nor a function with no argument.
			--
			-- ETR: p.23
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
			a_rename_not_void: a_rename /= Void
			f_not_void: f /= Void
		do
			code := vhrc4a_template_code
			etl_code := vhrc4_etl_code
			default_template := vhrc4a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_rename.new_name.position
			create parameters.make (1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_rename.new_name.feature_name.name, 6)
			parameters.put (f.name.name, 7)
			parameters.put (a_parent.type.name.name, 8)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = new prefix name
			-- dollar7: $7 = old feature name
			-- dollar8: $8 = parent base class
		end

	make_vhrc5a (a_class: like current_class; a_parent: ET_PARENT; a_rename: ET_RENAME; f: ET_FEATURE) is
			-- Create a new VHRC-5 error: the Rename_pair `a_rename' has
			-- a new_name of the Infix form, but the corresponding feature
			-- `f' is not a function with one argument.
			--
			-- ETR: p.23
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
			a_rename_not_void: a_rename /= Void
			f_not_void: f /= Void
		do
			code := vhrc5a_template_code
			etl_code := vhrc5_etl_code
			default_template := vhrc5a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_rename.new_name.position
			create parameters.make (1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_rename.new_name.feature_name.name, 6)
			parameters.put (f.name.name, 7)
			parameters.put (a_parent.type.name.name, 8)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = new infix name
			-- dollar7: $7 = old feature name
			-- dollar8: $8 = parent base class
		end

	make_vjar0a (a_class: like current_class; an_assignment: ET_ASSIGNMENT; a_source_type, a_target_type: ET_NAMED_TYPE) is
			-- Create a new VJAR error: the source expression of `an_assignment' does
			-- not conform to its target entity.
			--
			-- ETL2: p. 311
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_assignment_not_void: an_assignment /= Void
			a_source_type_not_void: a_source_type /= Void
			a_source_type_is_named_type: a_source_type.is_named_type
			a_target_type_not_void: a_target_type /= Void
			a_target_type_is_named_type: a_target_type.is_named_type
		do
			code := vjar0a_template_code
			etl_code := vjar_etl_code
			default_template := vjar0a_default_template
			current_class := a_class
			class_impl := a_class
			position := an_assignment.source.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_source_type.to_text, 6)
			parameters.put (a_target_type.to_text, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = source type
			-- dollar7: $7 = target type
		end

	make_vjar0b (a_class: like current_class; a_class_impl: ET_CLASS; an_assignment: ET_ASSIGNMENT;
		a_source_type, a_target_type: ET_NAMED_TYPE) is
			-- Create a new VJAR error: the source expression of `an_assignment' does
			-- not conform to its target entity when viewed from `a_class'.
			--
			-- ETL2: p. 311
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			an_assignment_not_void: an_assignment /= Void
			a_source_type_not_void: a_source_type /= Void
			a_source_type_is_named_type: a_source_type.is_named_type
			a_target_type_not_void: a_target_type /= Void
			a_target_type_is_named_type: a_target_type.is_named_type
		do
			code := vjar0b_template_code
			etl_code := vjar_etl_code
			default_template := vjar0b_default_template
			current_class := a_class
			class_impl := a_class_impl
			position := an_assignment.source.position
			create parameters.make (1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_class_impl.name.name, 6)
			parameters.put (a_source_type.to_text, 7)
			parameters.put (a_target_type.to_text, 8)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class_impl
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = source type
			-- dollar8: $8 = target type
		end

	make_vjar0c (a_class: like current_class; a_typed_expression: ET_TYPED_EXPRESSION; a_source_type, a_target_type: ET_NAMED_TYPE) is
			-- Create a new VJAR error: the source expression of `a_typed_expression' does
			-- not conform to its target type.
			--
			-- ETL2: p. 311
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_typed_expression_not_void: a_typed_expression /= Void
			a_source_type_not_void: a_source_type /= Void
			a_source_type_is_named_type: a_source_type.is_named_type
			a_target_type_not_void: a_target_type /= Void
			a_target_type_is_named_type: a_target_type.is_named_type
		do
			code := vjar0c_template_code
			etl_code := vjar_etl_code
			default_template := vjar0c_default_template
			current_class := a_class
			class_impl := a_class
			position := a_typed_expression.expression.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_source_type.to_text, 6)
			parameters.put (a_target_type.to_text, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = source type
			-- dollar7: $7 = target type
		end

	make_vjar0d (a_class: like current_class; a_class_impl: ET_CLASS; a_typed_expression: ET_TYPED_EXPRESSION;
		a_source_type, a_target_type: ET_NAMED_TYPE) is
			-- Create a new VJAR error: the source expression of `a_typed_expression' does
			-- not conform to its target type when viewed from `a_class'.
			--
			-- ETL2: p. 311
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_typed_expression_not_void: a_typed_expression /= Void
			a_source_type_not_void: a_source_type /= Void
			a_source_type_is_named_type: a_source_type.is_named_type
			a_target_type_not_void: a_target_type /= Void
			a_target_type_is_named_type: a_target_type.is_named_type
		do
			code := vjar0d_template_code
			etl_code := vjar_etl_code
			default_template := vjar0d_default_template
			current_class := a_class
			class_impl := a_class_impl
			position := a_typed_expression.expression.position
			create parameters.make (1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_class_impl.name.name, 6)
			parameters.put (a_source_type.to_text, 7)
			parameters.put (a_target_type.to_text, 8)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class_impl
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = source type
			-- dollar8: $8 = target type
		end

	make_vjaw0a (a_class: like current_class; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE) is
			-- Create a new VJAW error: `a_name' is supposed to be a Writable but
			-- the associated feature `a_feature' is not an attribute.
			--
			-- Only in ISE Eiffel.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
		do
			code := vjaw0a_template_code
			etl_code := vjaw_etl_code
			default_template := vjaw0a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_name.name, 6)
			parameters.put (a_feature.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = name of corresponding feature in class $5
		end

	make_vjaw0c (a_class: like current_class; a_name: ET_IDENTIFIER; a_feature: ET_FEATURE) is
			-- Report VJAW error: `a_name' is supposed to be a Writable but
			-- it is a formal argument name of `a_feature'.
			--
			-- Only in ISE Eiffel.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
		do
			code := vjaw0c_template_code
			etl_code := vjaw_etl_code
			default_template := vjaw0c_default_template
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_name.name, 6)
			parameters.put (a_feature.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = formal argument name
			-- dollar7: $7 = feature name
		end

	make_vjrv0a (a_class: like current_class; a_target: ET_WRITABLE; a_target_type: ET_NAMED_TYPE) is
			-- Create a new VJRV error: the type `a_target_type' of the target
			-- `a_target' of an assignment attempt appearing in `a_class'
			-- is not a reference type.
			--
			-- ETL2: p. 332
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_target_not_void: a_target /= Void
			a_target_type_not_void: a_target_type /= Void
			a_target_type_is_named_type: a_target_type.is_named_type
		do
			code := vjrv0a_template_code
			etl_code := vjrv_etl_code
			default_template := vjrv0a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_target.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_target_type.to_text, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = target type
		end

	make_vjrv0b (a_class: like current_class; a_class_impl: ET_CLASS; a_target: ET_WRITABLE; a_target_type: ET_NAMED_TYPE) is
			-- Create a new VJRV error: the type `a_target_type' of the target
			-- `a_target' of an assignment attempt appearing in `a_class_impl'
			-- and viewed from one of its descedants `a_class' is not a
			-- reference type.
			--
			-- ETL2: p. 332
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_target_not_void: a_target /= Void
			a_target_type_not_void: a_target_type /= Void
			a_target_type_is_named_type: a_target_type.is_named_type
		do
			code := vjrv0b_template_code
			etl_code := vjrv_etl_code
			default_template := vjrv0b_default_template
			current_class := a_class
			class_impl := a_class_impl
			position := a_target.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_class_impl.name.name, 6)
			parameters.put (a_target_type.to_text, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = target type
		end

	make_vkcn1a (a_class: like current_class; a_name: ET_CALL_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS) is
			-- Create a new VKCN-1 error: `a_feature' of class `a_target', appearing
			-- in the qualified instruction call `a_name' in `a_class', is not
			-- a procedure.
			--
			-- ETL2: p.341
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_target_not_void: a_target /= Void
		do
			code := vkcn1a_template_code
			etl_code := vkcn1_etl_code
			default_template := vkcn1a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			create parameters.make (1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_name.name, 6)
			parameters.put (a_feature.name.name, 7)
			parameters.put (a_target.name.name, 8)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name of the call
			-- dollar7: $7 = name of corresponding feature in class $8
			-- dollar8: $8 = base class of target of the call
		end

	make_vkcn1c (a_class: like current_class; a_name: ET_CALL_NAME; a_feature: ET_FEATURE) is
			-- Create a new VKCN-1 error: `a_feature' of `a_class', appearing
			-- in the unqualified instruction call `a_name' in `a_class', is not
			-- a procedure.
			--
			-- ETL2: p.341
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
		do
			code := vkcn1c_template_code
			etl_code := vkcn1_etl_code
			default_template := vkcn1c_default_template
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_name.name, 6)
			parameters.put (a_feature.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name of the call
			-- dollar7: $7 = name of corresponding feature in class $5
		end

	make_vkcn2a (a_class: like current_class; a_name: ET_CALL_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS) is
			-- Create a new VKCN-2 error: `a_feature' of class `a_target', appearing
			-- in the qualified expression call `a_name' in `a_class', is not
			-- an attribute or a function.
			--
			-- ETL2: p.341
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_target_not_void: a_target /= Void
		do
			code := vkcn2a_template_code
			etl_code := vkcn2_etl_code
			default_template := vkcn2a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			create parameters.make (1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_name.name, 6)
			parameters.put (a_feature.name.name, 7)
			parameters.put (a_target.name.name, 8)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name of the call
			-- dollar7: $7 = name of corresponding feature in class $8
			-- dollar8: $8 = base class of target of the call
		end

	make_vkcn2c (a_class: like current_class; a_name: ET_CALL_NAME; a_feature: ET_FEATURE) is
			-- Create a new VKCN-2 error: `a_feature' of `a_class', appearing
			-- in the unqualified expression call `a_name' in `a_class', is not
			-- an attribute or a function.
			--
			-- ETL2: p.341
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
		do
			code := vkcn2c_template_code
			etl_code := vkcn2_etl_code
			default_template := vkcn2c_default_template
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_name.name, 6)
			parameters.put (a_feature.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name of the call
			-- dollar7: $7 = name of corresponding feature in class $5
		end

	make_vlel1a (a_class: like current_class; a_parent: ET_PARENT; all1, all2: ET_ALL_EXPORT) is
			-- Create a new VLEL-1 error: the 'all' keyword appears twice in the
			-- Export subclause of parent `a_parent' in `a_class'.
			--
			-- ETL2: p.102
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
			all1_not_void: all1 /= Void
			all2_not_void: all2 /= Void
		do
			code := vlel1a_template_code
			etl_code := vlel1_etl_code
			default_template := vlel1a_default_template
			current_class := a_class
			class_impl := a_class
			position := all2.all_keyword.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_parent.type.name.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = parent base class
		end

	make_vlel2a (a_class: like current_class; a_parent: ET_PARENT; f: ET_FEATURE_NAME) is
			-- Create a new VLEL-2 error: the Export subclause of `a_parent'
			-- in `a_class' lists `f' which is not the final name in
			-- `a_class' of a feature inherited from `a_parent'.
			--
			-- ETL2: p.102
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
			f_not_void: f /= Void
		do
			code := vlel2a_template_code
			etl_code := vlel2_etl_code
			default_template := vlel2a_default_template
			current_class := a_class
			class_impl := a_class
			position := f.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f.name, 6)
			parameters.put (a_parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vlel3a (a_class: like current_class; a_parent: ET_PARENT; f1, f2: ET_FEATURE_NAME) is
			-- Create a new VLEL-3 error: feature name `f2' appears twice in the
			-- Export subclause of parent `a_parent' in `a_class'.
			--
			-- ETL2: p.102
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		do
			code := vlel3a_template_code
			etl_code := vlel3_etl_code
			default_template := vlel3a_default_template
			current_class := a_class
			class_impl := a_class
			position := f2.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f2.name, 6)
			parameters.put (a_parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vmfn0a (a_class: like current_class; f1, f2: ET_FEATURE) is
			-- Create a new VMFN error: `a_class' introduced two features
			-- `f1' and `f2' with the same name.
			--
			-- ETL2: p.188
			-- ETR: p.42
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		do
			code := vmfn0a_template_code
			etl_code := vmfn_etl_code
			default_template := vmfn0a_default_template
			current_class := a_class
			class_impl := a_class
			position := f2.name.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f2.name.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
		end

	make_vmfn0b (a_class: like current_class; f1: ET_PARENT_FEATURE; f2: ET_FEATURE) is
			-- Create a new VMFN error: `a_class' introduces feature `f2'
			-- but `f1' has the same name.
			--
			-- ETL2: p.188
			-- ETR: p.42
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f1_not_deferred: not f1.is_deferred
			f1_not_redefined: not f1.has_redefine
			f2_not_void: f2 /= Void
		do
			code := vmfn0b_template_code
			etl_code := vmfn_etl_code
			default_template := vmfn0b_default_template
			current_class := a_class
			class_impl := a_class
			position := f2.name.position
			create parameters.make (1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f2.name.name, 6)
			parameters.put (f1.precursor_feature.name.name, 7)
			parameters.put (f1.parent.type.name.name, 8)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = first feature name (in current class)
			-- dollar7: $7 = second feature name (in parent)
			-- dollar8: $8 = parent base class
		end

	make_vmfn0c (a_class: like current_class; f1, f2: ET_PARENT_FEATURE) is
			-- Create a new VMFN error: `a_class' inherits two effective
			-- features `f1' and `f2' with the same name.
			--
			-- ETL2: p.188
			-- ETR: p.42
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f1_not_deferred: not f1.is_deferred
			f1_not_redefined: not f1.has_redefine
			f2_not_void: f2 /= Void
			f2_not_deferred: not f2.is_deferred
			f2_not_redefined: not f2.has_redefine
		do
			code := vmfn0c_template_code
			etl_code := vmfn_etl_code
			default_template := vmfn0c_default_template
			current_class := a_class
			class_impl := a_class
			position := f1.parent.type.name.position
			create parameters.make (1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f1.precursor_feature.name.name, 6)
			parameters.put (f1.parent.type.name.name, 7)
			parameters.put (f2.precursor_feature.name.name, 8)
			parameters.put (f2.parent.type.name.name, 9)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = first feature name
			-- dollar7: $7 = first parent base class
			-- dollar8: $8 = second feature name
			-- dollar9: $9 = second parent base class
		end

	make_vmrc2a (a_class: like current_class; replicated_features: DS_LIST [ET_PARENT_FEATURE]) is
			-- Create a new VMRC-2 error: the replicated features in
			-- `replicated_features' have not been selected in one of
			-- the Parent clauses of `a_class'.
			--
			-- ETL2: p.191
			-- ETR: p.43
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			replicated_features_not_void: replicated_features /= Void
			no_void_feature: not replicated_features.has (Void)
			replicated: replicated_features.count >= 2
		local
			a_cursor: DS_LIST_CURSOR [ET_PARENT_FEATURE]
			a_feature: ET_PARENT_FEATURE
			a_string: STRING
		do
			code := vmrc2a_template_code
			etl_code := vmrc2_etl_code
			default_template := vmrc2a_default_template
			current_class := a_class
			class_impl := a_class
			a_feature := replicated_features.first
			position := a_feature.parent.type.name.position
			a_cursor := replicated_features.new_cursor
			from
				create a_string.make (20)
				a_cursor.start
				a_feature := a_cursor.item
				a_string.append_string (a_feature.parent.type.name.name)
				a_string.append_character ('.')
				a_string.append_string (a_feature.precursor_feature.name.name)
				a_cursor.forth
			until
				a_cursor.after
			loop
				a_string.append_string (", ")
				a_feature := a_cursor.item
				a_string.append_string (a_feature.parent.type.name.name)
				a_string.append_character ('.')
				a_string.append_string (a_feature.precursor_feature.name.name)
				a_cursor.forth
			end
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_string, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = replicated features
		end

	make_vmrc2b (a_class: like current_class; replicated_features: DS_LIST [ET_PARENT_FEATURE]) is
			-- Create a new VMRC-2 error: the replicated features in
			-- `replicated_features' have been selected in more than
			-- one of the Parent clauses of `a_class'.
			--
			-- ETL2: p.191
			-- ETR: p.43
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			replicated_features_not_void: replicated_features /= Void
			no_void_feature: not replicated_features.has (Void)
			-- all_selected: forall f in replicated_features, f.has_select
			replicated: replicated_features.count >= 2
		local
			a_cursor: DS_LIST_CURSOR [ET_PARENT_FEATURE]
			a_feature: ET_PARENT_FEATURE
			a_string: STRING
		do
			code := vmrc2a_template_code
			etl_code := vmrc2_etl_code
			default_template := vmrc2a_default_template
			current_class := a_class
			class_impl := a_class
			a_feature := replicated_features.first
			position := a_feature.select_name.position
			a_cursor := replicated_features.new_cursor
			from
				create a_string.make (20)
				a_cursor.start
				a_feature := a_cursor.item
				a_string.append_string (a_feature.parent.type.name.name)
				a_string.append_character ('.')
				a_string.append_string (a_feature.precursor_feature.name.name)
				a_cursor.forth
			until
				a_cursor.after
			loop
				a_string.append_string (", ")
				a_feature := a_cursor.item
				a_string.append_string (a_feature.parent.type.name.name)
				a_string.append_character ('.')
				a_string.append_string (a_feature.precursor_feature.name.name)
				a_cursor.forth
			end
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_string, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = replicated features
		end

	make_vmss1a (a_class: like current_class; a_parent: ET_PARENT; f: ET_FEATURE_NAME) is
			-- Create a new VMSS-1 error: the Select subclause of `a_parent'
			-- in `a_class' lists `f' which is not the final name in
			-- `a_class' of a feature inherited from `a_parent'.
			--
			-- ETL2: p.192
			-- ETR: p.44
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
			f_not_void: f /= Void
		do
			code := vmss1a_template_code
			etl_code := vmss1_etl_code
			default_template := vmss1a_default_template
			current_class := a_class
			class_impl := a_class
			position := f.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f.name, 6)
			parameters.put (a_parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vmss2a (a_class: like current_class; a_parent: ET_PARENT; f1, f2: ET_FEATURE_NAME) is
			-- Create a new VMSS-2 error: feature name `f2' appears twice
			-- in the Select subclause of parent `a_parent' in `a_class'.
			--
			-- ETL2: p.192
			-- ETR: p.44
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		do
			code := vmss2a_template_code
			etl_code := vmss2_etl_code
			default_template := vmss2a_default_template
			current_class := a_class
			class_impl := a_class
			position := f2.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (f2.name, 6)
			parameters.put (a_parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vmss3a (a_class: like current_class; a_feature: ET_PARENT_FEATURE) is
			-- Create a new VMSS-3 error: the Select subclause
			-- of a parent of `a_class' lists `a_feature' which
			-- is not replicated.
			--
			-- ETL2: p.192
			-- ETR: p.44
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_selected: a_feature.has_select
		do
			code := vmss3a_template_code
			etl_code := vmss3_etl_code
			default_template := vmss3a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_feature.select_name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_feature.select_name.name, 6)
			parameters.put (a_feature.parent.type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = parent base class
		end

	make_vomb1a (a_class: like current_class; an_expression: ET_EXPRESSION; a_type: ET_NAMED_TYPE) is
			-- Create a new VOMB-1 error: the inspect expression `an_expression'
			-- in `a_class' is of type `a_type' which is not "INTEGER" or
			-- "CHARACTER".
			--
			-- ETL2: p.239
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_expression_not_void: an_expression /= Void
			a_type_not_void: a_type /= Void
		do
			code := vomb1a_template_code
			etl_code := vomb1_etl_code
			default_template := vomb1a_default_template
			current_class := a_class
			class_impl := a_class
			position := an_expression.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_type.to_text, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = base type of inspect expression
		end

	make_vomb1b (a_class: like current_class; a_class_impl: ET_CLASS; an_expression: ET_EXPRESSION; a_type: ET_NAMED_TYPE) is
			-- Create a new VOMB-1 error: the inspect expression `an_expression'
			-- in `a_class_impl' and viewed from one of its descendants `a_class'
			-- is of type `a_type' which is not "INTEGER" or "CHARACTER".
			--
			-- ETL2: p.239
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			an_expression_not_void: an_expression /= Void
			a_type_not_void: a_type /= Void
		do
			code := vomb1b_template_code
			etl_code := vomb1_etl_code
			default_template := vomb1b_default_template
			current_class := a_class
			class_impl := a_class_impl
			position := an_expression.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_class_impl.name.name, 6)
			parameters.put (a_type.to_text, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class_impl
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = base type of inspect expression
		end

	make_vomb2a (a_class: like current_class; a_constant: ET_CHOICE_CONSTANT; a_constant_type, a_value_type: ET_NAMED_TYPE) is
			-- Create a new VOMB-2 error: the inspect constant `a_constant' in `a_class'
			-- is of type `a_consant_type' which is not the same as the type
			-- `a_value_type' of the inspect expression.
			--
			-- ETL2: p.239
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_constant_not_void: a_constant /= Void
			a_constant_type_not_void: a_constant_type /= Void
			a_value_type_not_void: a_value_type /= Void
		do
			code := vomb2a_template_code
			etl_code := vomb2_etl_code
			default_template := vomb2a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_constant.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_constant_type.to_text, 6)
			parameters.put (a_value_type.to_text, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = base type of choice constant
			-- dollar7: $7 = base type of inspect expression
		end

	make_vomb2b (a_class: like current_class; a_class_impl: ET_CLASS; a_constant: ET_CHOICE_CONSTANT;
		a_constant_type, a_value_type: ET_NAMED_TYPE) is
			-- Create a new VOMB-2 error: the inspect constant `a_constant' in
			-- `a_class_impl' and viewed from one of its descendants `a_class'
			-- is of type `a_constant_type' which is not the same as the
			-- type `a_value_type' of the inspect expression.
			--
			-- ETL2: p.239
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_constant_not_void: a_constant /= Void
			a_constant_type_not_void: a_constant_type /= Void
			a_value_type_not_void: a_value_type /= Void
		do
			code := vomb2b_template_code
			etl_code := vomb2_etl_code
			default_template := vomb2b_default_template
			current_class := a_class
			class_impl := a_class_impl
			position := a_constant.position
			create parameters.make (1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_class_impl.name.name, 6)
			parameters.put (a_constant_type.to_text, 7)
			parameters.put (a_value_type.to_text, 8)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class_impl
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = base type of choice constant
			-- dollar8: $8 = base type of inspect expression
		end

	make_vpca1a (a_class: like current_class; a_name: ET_FEATURE_NAME) is
			-- Create a new VPCA-1 error: `a_name', appearing in an unqualified
			-- call agent in `a_class', is not the final name of a feature
			-- in `a_class'.
			--
			-- ETL3 (4.82-00-00): p.581
			--
			-- Note: ISE Eiffel 5.4 reports this error as a VEEN.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
		do
			code := vpca1a_template_code
			etl_code := vpca1_etl_code
			default_template := vpca1a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_name.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name of the call agent
		end

	make_vpca1b (a_class: like current_class; a_name: ET_FEATURE_NAME; a_target: ET_CLASS) is
			-- Create a new VPCA-1 error: `a_name', appearing in a qualified
			-- call agent in `a_class', is not the final name of a feature
			-- in class `a_target'.
			--
			-- ETL3 (4.82-00-00): p.581
			--
			-- Note: ISE Eiffel 5.4 reports this error as a VEEN.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_target_not_void: a_target /= Void
		do
			code := vpca1b_template_code
			etl_code := vpca1_etl_code
			default_template := vpca1b_default_template
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_name.name, 6)
			parameters.put (a_target.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name of the call agent
			-- dollar7: $7 = base class of target of the call agent
		end

	make_vpca2a (a_class: like current_class; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS) is
			-- Create a new VPCA-2 error: `a_feature' of class `a_target',
			-- is not exported to `a_class' where the qualified call 
			-- agent `a_name' appears.
			--
			-- ETL3 (4.82-00-00): p.581
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_target_not_void: a_target /= Void
		do
			code := vpca2a_template_code
			etl_code := vpca2_etl_code
			default_template := vpca2a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			create parameters.make (1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_name.name, 6)
			parameters.put (a_feature.name.name, 7)
			parameters.put (a_target.name.name, 8)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name of the call agent
			-- dollar7: $7 = name of corresponding feature in class $8
			-- dollar8: $8 = base class of target of the call agent
		end

	make_vpca2b (a_class: like current_class; a_class_impl: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS) is
			-- Create a new VPCA-2 error: `a_feature' of class `a_target'
			-- is not exported to `a_class', one of the descendants
			-- of `a_class_impl' where the qualified call agent
			-- `a_name' appears.
			--
			-- ETL3 (4.82-00-00): p.581
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_target_not_void: a_target /= Void
		do
			code := vpca2b_template_code
			etl_code := vpca2_etl_code
			default_template := vpca2b_default_template
			current_class := a_class
			class_impl := a_class_impl
			position := a_name.position
			create parameters.make (1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_class_impl.name.name, 6)
			parameters.put (a_name.name, 7)
			parameters.put (a_feature.name.name, 8)
			parameters.put (a_target.name.name, 9)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class_impl
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = feature name of the call agent
			-- dollar8: $8 = name of corresponding feature in class $9
			-- dollar9: $9 = base class of target of the call agent
		end

	make_vpca3a (a_class: like current_class; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS) is
			-- Create a new VPCA-3 error: the number of actual arguments in
			-- the qualified call agent `a_name' appearing in `a_class' is not the
			-- same as the number of formal arguments of `a_feature' in
			-- class `a_target'.
			--
			-- ETL3 (4.82-00-00): p.581
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_target_not_void: a_target /= Void
		do
			code := vpca3a_template_code
			etl_code := vpca3_etl_code
			default_template := vpca3a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			create parameters.make (1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_name.name, 6)
			parameters.put (a_feature.name.name, 7)
			parameters.put (a_target.name.name, 8)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name of the call agent
			-- dollar7: $7 = name of corresponding feature in class $8
			-- dollar8: $8 = base class of target of the call agent
		end

	make_vpca3c (a_class: like current_class; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE) is
			-- Create a new VPCA-3 error: the number of actual arguments in
			-- the unqualified call agent `a_name' appearing in `a_class' is not the
			-- same as the number of formal arguments of `a_feature' in `a_class'.
			--
			-- ETL3 (4.82-00-00): p.581
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
		do
			code := vpca3c_template_code
			etl_code := vpca3_etl_code
			default_template := vpca3c_default_template
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_name.name, 6)
			parameters.put (a_feature.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name of the call agent
			-- dollar7: $7 = name of corresponding feature in class $5
		end

	make_vpca4a (a_class: like current_class; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE;
		a_target: ET_CLASS; arg: INTEGER; an_actual, a_formal: ET_NAMED_TYPE) is
			-- Create a new VPCA-4 error: the `arg'-th actual argument in the qualified
			-- call agent `a_name' appearing in `a_class' does not conform to the corresponding
			-- formal argument of `a_feature' in class `a_target'.
			--
			-- ETL3 (4.82-00-00): p.581
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_target_not_void: a_target /= Void
			an_actual_not_void: an_actual /= Void
			an_actual_named_type: an_actual.is_named_type
			a_formal_not_void: a_formal /= Void
			a_formal_named_type: a_formal.is_named_type
		do
			code := vpca4a_template_code
			etl_code := vpca4_etl_code
			default_template := vpca4a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			create parameters.make (1, 11)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_name.name, 6)
			parameters.put (a_feature.name.name, 7)
			parameters.put (a_target.name.name, 8)
			parameters.put (arg.out, 9)
			parameters.put (an_actual.to_text, 10)
			parameters.put (a_formal.to_text, 11)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name of the call agent
			-- dollar7: $7 = name of corresponding feature in class $8
			-- dollar8: $8 = base class of target of the call agent
			-- dollar9: $9 = argument index
			-- dollar10: $10 = actual type
			-- dollar11: $11 = formal type
		end

	make_vpca4b (a_class: like current_class; a_class_impl: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE;
		a_target: ET_CLASS; arg: INTEGER; an_actual, a_formal: ET_NAMED_TYPE) is
			-- Create a new VPCA-4 error: the `arg'-th actual argument in the qualified
			-- call agent `a_name' appearing in `a_class_impl' and viewed from one of its
			-- descendants `a_class' does not conform to the corresponding formal
			-- argument of `a_feature' in class `a_target'.
			--
			-- ETL3 (4.82-00-00): p.581
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_target_not_void: a_target /= Void
			an_actual_not_void: an_actual /= Void
			an_actual_named_type: an_actual.is_named_type
			a_formal_not_void: a_formal /= Void
			a_formal_named_type: a_formal.is_named_type
		do
			code := vpca4b_template_code
			etl_code := vpca4_etl_code
			default_template := vpca4b_default_template
			current_class := a_class
			class_impl := a_class_impl
			position := a_name.position
			create parameters.make (1, 12)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_class_impl.name.name, 6)
			parameters.put (a_name.name, 7)
			parameters.put (a_feature.name.name, 8)
			parameters.put (a_target.name.name, 9)
			parameters.put (arg.out, 10)
			parameters.put (an_actual.to_text, 11)
			parameters.put (a_formal.to_text, 12)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class_impl
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = feature name of the call agent
			-- dollar8: $8 = name of corresponding feature in class $9
			-- dollar9: $9 = base class of target of the call agent
			-- dollar10: $10 = argument index
			-- dollar11: $11 = actual type
			-- dollar12: $12 = formal type
		end

	make_vpca4c (a_class: like current_class; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE;
		arg: INTEGER; an_actual, a_formal: ET_NAMED_TYPE) is
			-- Create a new VPCA-4 error: the `arg'-th actual argument in the unqualified
			-- call agent `a_name' appearing in `a_class' does not conform to the corresponding
			-- formal argument of `a_feature' in `a_class'.
			--
			-- ETL3 (4.82-00-00): p.581
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			an_actual_not_void: an_actual /= Void
			an_actual_named_type: an_actual.is_named_type
			a_formal_not_void: a_formal /= Void
			a_formal_named_type: a_formal.is_named_type
		do
			code := vpca4c_template_code
			etl_code := vpca4_etl_code
			default_template := vpca4c_default_template
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			create parameters.make (1, 10)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_name.name, 6)
			parameters.put (a_feature.name.name, 7)
			parameters.put (arg.out, 8)
			parameters.put (an_actual.to_text, 9)
			parameters.put (a_formal.to_text, 10)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name of the call agent
			-- dollar7: $7 = name of corresponding feature in class $5
			-- dollar8: $8 = argument index
			-- dollar9: $9 = actual type
			-- dollar10: $10 = formal type
		end

	make_vpca4d (a_class: like current_class; a_class_impl: ET_CLASS; a_name: ET_FEATURE_NAME;
		a_feature: ET_FEATURE; arg: INTEGER; an_actual, a_formal: ET_NAMED_TYPE) is
			-- Create a new VPCA-4 error: the `arg'-th actual argument in the unqualified
			-- call agent `a_name' appearing in `a_class_impl' and viewed from one of its
			-- descendants `a_class' does not conform to the corresponding formal
			-- argument of `a_feature' in `a_class_impl'.
			--
			-- ETL3 (4.82-00-00): p.581
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			an_actual_not_void: an_actual /= Void
			an_actual_named_type: an_actual.is_named_type
			a_formal_not_void: a_formal /= Void
			a_formal_named_type: a_formal.is_named_type
		do
			code := vpca4d_template_code
			etl_code := vpca4_etl_code
			default_template := vpca4d_default_template
			current_class := a_class
			class_impl := a_class_impl
			position := a_name.position
			create parameters.make (1, 11)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_class_impl.name.name, 6)
			parameters.put (a_name.name, 7)
			parameters.put (a_feature.name.name, 8)
			parameters.put (arg.out, 9)
			parameters.put (an_actual.to_text, 10)
			parameters.put (a_formal.to_text, 11)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class_impl
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = feature name of the call agent
			-- dollar8: $8 = name of corresponding feature in class $6
			-- dollar9: $9 = argument index
			-- dollar10: $10 = actual type
			-- dollar11: $11 = formal type
		end

	make_vpca5a (a_class: like current_class; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE;
		a_target: ET_CLASS; arg: INTEGER; an_actual, a_formal: ET_NAMED_TYPE) is
			-- Create a new VPCA-5 error: the type specified for the `arg'-th
			-- actual argument in the qualified call agent `a_name' appearing
			-- in `a_class' does not conform to the corresponding formal argument
			-- of `a_feature' in class `a_target'.
			--
			-- ETL3 (4.82-00-00): p.581
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_target_not_void: a_target /= Void
			an_actual_not_void: an_actual /= Void
			an_actual_named_type: an_actual.is_named_type
			a_formal_not_void: a_formal /= Void
			a_formal_named_type: a_formal.is_named_type
		do
			code := vpca5a_template_code
			etl_code := vpca5_etl_code
			default_template := vpca5a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			create parameters.make (1, 11)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_name.name, 6)
			parameters.put (a_feature.name.name, 7)
			parameters.put (a_target.name.name, 8)
			parameters.put (arg.out, 9)
			parameters.put (an_actual.to_text, 10)
			parameters.put (a_formal.to_text, 11)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name of the call agent
			-- dollar7: $7 = name of corresponding feature in class $8
			-- dollar8: $8 = base class of target of the call agent
			-- dollar9: $9 = argument index
			-- dollar10: $10 = actual type
			-- dollar11: $11 = formal type
		end

	make_vpca5b (a_class: like current_class; a_class_impl: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE;
		a_target: ET_CLASS; arg: INTEGER; an_actual, a_formal: ET_NAMED_TYPE) is
			-- Create a new VPCA-5 error: the type specified for the `arg'-th actual
			-- argument in the qualified call agent `a_name' appearing in `a_class_impl'
			-- and viewed from one of its descendants `a_class' does not conform to
			-- the corresponding formal argument of `a_feature' in class `a_target'.
			--
			-- ETL3 (4.82-00-00): p.581
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_target_not_void: a_target /= Void
			an_actual_not_void: an_actual /= Void
			an_actual_named_type: an_actual.is_named_type
			a_formal_not_void: a_formal /= Void
			a_formal_named_type: a_formal.is_named_type
		do
			code := vpca5b_template_code
			etl_code := vpca5_etl_code
			default_template := vpca5b_default_template
			current_class := a_class
			class_impl := a_class_impl
			position := a_name.position
			create parameters.make (1, 12)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_class_impl.name.name, 6)
			parameters.put (a_name.name, 7)
			parameters.put (a_feature.name.name, 8)
			parameters.put (a_target.name.name, 9)
			parameters.put (arg.out, 10)
			parameters.put (an_actual.to_text, 11)
			parameters.put (a_formal.to_text, 12)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class_impl
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = feature name of the call agent
			-- dollar8: $8 = name of corresponding feature in class $9
			-- dollar9: $9 = base class of target of the call agent
			-- dollar10: $10 = argument index
			-- dollar11: $11 = actual type
			-- dollar12: $12 = formal type
		end

	make_vpca5c (a_class: like current_class; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE;
		arg: INTEGER; an_actual, a_formal: ET_NAMED_TYPE) is
			-- Create a new VPCA-5 error: the type specified for the `arg'-th actual
			-- argument in the unqualified call agent `a_name' appearing in `a_class'
			-- does not conform to the corresponding formal argument of `a_feature'
			-- in `a_class'.
			--
			-- ETL3 (4.82-00-00): p.581
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			an_actual_not_void: an_actual /= Void
			an_actual_named_type: an_actual.is_named_type
			a_formal_not_void: a_formal /= Void
			a_formal_named_type: a_formal.is_named_type
		do
			code := vpca5c_template_code
			etl_code := vpca5_etl_code
			default_template := vpca5c_default_template
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			create parameters.make (1, 10)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_name.name, 6)
			parameters.put (a_feature.name.name, 7)
			parameters.put (arg.out, 8)
			parameters.put (an_actual.to_text, 9)
			parameters.put (a_formal.to_text, 10)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name of the call agent
			-- dollar7: $7 = name of corresponding feature in class $5
			-- dollar8: $8 = argument index
			-- dollar9: $9 = actual type
			-- dollar10: $10 = formal type
		end

	make_vpca5d (a_class: like current_class; a_class_impl: ET_CLASS; a_name: ET_FEATURE_NAME;
		a_feature: ET_FEATURE; arg: INTEGER; an_actual, a_formal: ET_NAMED_TYPE) is
			-- Create a new VPCA-5 error: the type specified for the `arg'-th actual
			-- argument in the unqualified call agent `a_name' appearing in `a_class_impl'
			-- and viewed from one of its descendants `a_class' does not conform to
			-- the corresponding formal argument of `a_feature' in `a_class_impl'.
			--
			-- ETL3 (4.82-00-00): p.581
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			an_actual_not_void: an_actual /= Void
			an_actual_named_type: an_actual.is_named_type
			a_formal_not_void: a_formal /= Void
			a_formal_named_type: a_formal.is_named_type
		do
			code := vpca5d_template_code
			etl_code := vpca5_etl_code
			default_template := vpca5d_default_template
			current_class := a_class
			class_impl := a_class_impl
			position := a_name.position
			create parameters.make (1, 11)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_class_impl.name.name, 6)
			parameters.put (a_name.name, 7)
			parameters.put (a_feature.name.name, 8)
			parameters.put (arg.out, 9)
			parameters.put (an_actual.to_text, 10)
			parameters.put (a_formal.to_text, 11)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class_impl
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = feature name of the call agent
			-- dollar8: $8 = name of corresponding feature in class $6
			-- dollar9: $9 = argument index
			-- dollar10: $10 = actual type
			-- dollar11: $11 = formal type
		end

	make_vqmc1a (a_class: like current_class; an_attribute: ET_CONSTANT_ATTRIBUTE) is
			-- Create a new VQMC-1 error: `an_attribute' introduces a boolean constant
			-- but its type is not "BOOLEAN".
			--
			-- ETL2: p.264
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_attribute_not_void: an_attribute /= Void
			boolean_constant: an_attribute.constant.is_boolean_constant
		do
			code := vqmc1a_template_code
			etl_code := vqmc1_etl_code
			default_template := vqmc1a_default_template
			current_class := a_class
			class_impl := a_class
			position := an_attribute.type.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (an_attribute.name.name, 6)
			parameters.put (an_attribute.type.to_text, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = type
		end

	make_vqmc1b (a_class: like current_class; a_class_impl: ET_CLASS; an_attribute: ET_CONSTANT_ATTRIBUTE) is
			-- Create a new VQMC-1 error: `an_attribute' introduces a boolean constant
			-- but its type is not "BOOLEAN" when viewed from `a_class' (a descendant
			-- of `a_class_impl' where `an_attribute' has been declared).
			--
			-- ETL2: p.264
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			an_attribute_not_void: an_attribute /= Void
			boolean_constant: an_attribute.constant.is_boolean_constant
		do
			code := vqmc1b_template_code
			etl_code := vqmc1_etl_code
			default_template := vqmc1b_default_template
			current_class := a_class
			class_impl := a_class_impl
			position := an_attribute.type.position
			create parameters.make (1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_class_impl.name.name, 6)
			parameters.put (an_attribute.name.name, 7)
			parameters.put (an_attribute.type.to_text, 8)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class_impl
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = feature name
			-- dollar8: $8 = type
		end

	make_vqmc2a (a_class: like current_class; an_attribute: ET_CONSTANT_ATTRIBUTE) is
			-- Create a new VQMC-2 error: `an_attribute' introduces a character constant
			-- but its type is not "CHARACTER".
			--
			-- ETL2: p.264
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_attribute_not_void: an_attribute /= Void
			character_constant: an_attribute.constant.is_character_constant
		do
			code := vqmc2a_template_code
			etl_code := vqmc2_etl_code
			default_template := vqmc2a_default_template
			current_class := a_class
			class_impl := a_class
			position := an_attribute.type.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (an_attribute.name.name, 6)
			parameters.put (an_attribute.type.to_text, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = type
		end

	make_vqmc2b (a_class: like current_class; a_class_impl: ET_CLASS; an_attribute: ET_CONSTANT_ATTRIBUTE) is
			-- Create a new VQMC-2 error: `an_attribute' introduces a character constant
			-- but its type is not "CHARACTER" when viewed from `a_class' (a descendant
			-- of `a_class_impl' where `an_attribute' has been declared).
			--
			-- ETL2: p.264
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			an_attribute_not_void: an_attribute /= Void
			characterconstant: an_attribute.constant.is_character_constant
		do
			code := vqmc2b_template_code
			etl_code := vqmc2_etl_code
			default_template := vqmc2b_default_template
			current_class := a_class
			class_impl := a_class_impl
			position := an_attribute.type.position
			create parameters.make (1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_class_impl.name.name, 6)
			parameters.put (an_attribute.name.name, 7)
			parameters.put (an_attribute.type.to_text, 8)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class_impl
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = feature name
			-- dollar8: $8 = type
		end

	make_vqmc3a (a_class: like current_class; an_attribute: ET_CONSTANT_ATTRIBUTE) is
			-- Create a new VQMC-3 error: `an_attribute' introduces an integer constant
			-- but its type is not "INTEGER".
			--
			-- ETL2: p.264
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_attribute_not_void: an_attribute /= Void
			integer_constant: an_attribute.constant.is_integer_constant
		do
			code := vqmc3a_template_code
			etl_code := vqmc3_etl_code
			default_template := vqmc3a_default_template
			current_class := a_class
			class_impl := a_class
			position := an_attribute.type.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (an_attribute.name.name, 6)
			parameters.put (an_attribute.type.to_text, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = type
		end

	make_vqmc3b (a_class: like current_class; a_class_impl: ET_CLASS; an_attribute: ET_CONSTANT_ATTRIBUTE) is
			-- Create a new VQMC-3 error: `an_attribute' introduces an integer constant
			-- but its type is not "INTEGER" when viewed from `a_class' (a descendant
			-- of `a_class_impl' where `an_attribute' has been declared).
			--
			-- ETL2: p.264
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			an_attribute_not_void: an_attribute /= Void
			integer_constant: an_attribute.constant.is_integer_constant
		do
			code := vqmc3b_template_code
			etl_code := vqmc3_etl_code
			default_template := vqmc3b_default_template
			current_class := a_class
			class_impl := a_class_impl
			position := an_attribute.type.position
			create parameters.make (1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_class_impl.name.name, 6)
			parameters.put (an_attribute.name.name, 7)
			parameters.put (an_attribute.type.to_text, 8)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class_impl
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = feature name
			-- dollar8: $8 = type
		end

	make_vqmc4a (a_class: like current_class; an_attribute: ET_CONSTANT_ATTRIBUTE) is
			-- Create a new VQMC-4 error: `an_attribute' introduces a real constant
			-- but its type is not "REAL" or "DOUBLE".
			--
			-- ETL2: p.264
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_attribute_not_void: an_attribute /= Void
			real_constant: an_attribute.constant.is_real_constant
		do
			code := vqmc4a_template_code
			etl_code := vqmc4_etl_code
			default_template := vqmc4a_default_template
			current_class := a_class
			class_impl := a_class
			position := an_attribute.type.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (an_attribute.name.name, 6)
			parameters.put (an_attribute.type.to_text, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = type
		end

	make_vqmc4b (a_class: like current_class; a_class_impl: ET_CLASS; an_attribute: ET_CONSTANT_ATTRIBUTE) is
			-- Create a new VQMC-4 error: `an_attribute' introduces a real constant
			-- but its type is not "REAL" or "DOUBLE" when viewed from `a_class'
			-- (a descendant of `a_class_impl' where `an_attribute' has been declared).
			--
			-- ETL2: p.264
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			an_attribute_not_void: an_attribute /= Void
			real_constant: an_attribute.constant.is_real_constant
		do
			code := vqmc4b_template_code
			etl_code := vqmc4_etl_code
			default_template := vqmc4b_default_template
			current_class := a_class
			class_impl := a_class_impl
			position := an_attribute.type.position
			create parameters.make (1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_class_impl.name.name, 6)
			parameters.put (an_attribute.name.name, 7)
			parameters.put (an_attribute.type.to_text, 8)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class_impl
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = feature name
			-- dollar8: $8 = type
		end

	make_vqmc5a (a_class: like current_class; an_attribute: ET_CONSTANT_ATTRIBUTE) is
			-- Create a new VQMC-5 error: `an_attribute' introduces a string constant
			-- but its type is not "STRING".
			--
			-- ETL2: p.264
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_attribute_not_void: an_attribute /= Void
			string_constant: an_attribute.constant.is_string_constant
		do
			code := vqmc5a_template_code
			etl_code := vqmc5_etl_code
			default_template := vqmc5a_default_template
			current_class := a_class
			class_impl := a_class
			position := an_attribute.type.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (an_attribute.name.name, 6)
			parameters.put (an_attribute.type.to_text, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = type
		end

	make_vqmc5b (a_class: like current_class; a_class_impl: ET_CLASS; an_attribute: ET_CONSTANT_ATTRIBUTE) is
			-- Create a new VQMC-5 error: `an_attribute' introduces a string constant
			-- but its type is not "STRING" when viewed from `a_class' (a descendant
			-- of `a_class_impl' where `an_attribute' has been declared).
			--
			-- ETL2: p.264
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			an_attribute_not_void: an_attribute /= Void
			string_constant: an_attribute.constant.is_string_constant
		do
			code := vqmc5b_template_code
			etl_code := vqmc5_etl_code
			default_template := vqmc5b_default_template
			current_class := a_class
			class_impl := a_class_impl
			position := an_attribute.type.position
			create parameters.make (1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_class_impl.name.name, 6)
			parameters.put (an_attribute.name.name, 7)
			parameters.put (an_attribute.type.to_text, 8)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class_impl
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = feature name
			-- dollar8: $8 = type
		end

	make_vqmc6a (a_class: like current_class; an_attribute: ET_CONSTANT_ATTRIBUTE) is
			-- Create a new VQMC-6 error: `an_attribute' introduces a bit constant
			-- but its type is not a Byte_type.
			--
			-- ETL2: p.264
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_attribute_not_void: an_attribute /= Void
			bit_constant: an_attribute.constant.is_bit_constant
		do
			code := vqmc6a_template_code
			etl_code := vqmc6_etl_code
			default_template := vqmc6a_default_template
			current_class := a_class
			class_impl := a_class
			position := an_attribute.type.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (an_attribute.name.name, 6)
			parameters.put (an_attribute.type.to_text, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = type
		end

	make_vqmc6b (a_class: like current_class; a_class_impl: ET_CLASS; an_attribute: ET_CONSTANT_ATTRIBUTE) is
			-- Create a new VQMC-6 error: `an_attribute' introduces a bit constant
			-- but its type is not a Bit_type when viewed from `a_class' (a descendant
			-- of `a_class_impl' where `an_attribute' has been declared).
			--
			-- ETL2: p.264
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			an_attribute_not_void: an_attribute /= Void
			bit_constant: an_attribute.constant.is_bit_constant
		do
			code := vqmc6b_template_code
			etl_code := vqmc6_etl_code
			default_template := vqmc6b_default_template
			current_class := a_class
			class_impl := a_class_impl
			position := an_attribute.type.position
			create parameters.make (1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_class_impl.name.name, 6)
			parameters.put (an_attribute.name.name, 7)
			parameters.put (an_attribute.type.to_text, 8)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class_impl
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = feature name
			-- dollar8: $8 = type
		end

	make_vqui0a (a_class: like current_class; a_unique: ET_UNIQUE_ATTRIBUTE) is
			-- Create a new VQUI error: the type of `a_unique' is not "INTEGER".
			--
			-- ETL2: p.266
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_unique_not_void: a_unique /= Void
		do
			code := vqui0a_template_code
			etl_code := vqui_etl_code
			default_template := vqui0a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_unique.type.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_unique.name.name, 6)
			parameters.put (a_unique.type.to_text, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name
			-- dollar7: $7 = type
		end

	make_vqui0b (a_class: like current_class; a_class_impl: ET_CLASS; a_unique: ET_UNIQUE_ATTRIBUTE) is
			-- Create a new VQUI error: the type of `a_unique' is not "INTEGER"
			-- when viewed from `a_class' (a descendant of `a_class_impl'
			-- where `a_unique' has been declared).
			--
			-- ETL2: p.266
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_unique_not_void: a_unique /= Void
		do
			code := vqui0b_template_code
			etl_code := vqui_etl_code
			default_template := vqui0b_default_template
			current_class := a_class
			class_impl := a_class_impl
			position := a_unique.type.position
			create parameters.make (1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_class_impl.name.name, 6)
			parameters.put (a_unique.name.name, 7)
			parameters.put (a_unique.type.to_text, 8)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class_impl
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = feature name
			-- dollar8: $8 = type
		end

	make_vreg0a (a_class: like current_class; arg1, arg2: ET_FORMAL_ARGUMENT; f: ET_FEATURE) is
			-- Create a new VREG error: `arg1' and `arg2' have the same
			-- name in feature `f' in `a_class'.
			--
			-- ETL2: p.110
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			arg1_not_void: arg1 /= Void
			arg2_not_void: arg2 /= Void
			f_not_void: f /= Void
		do
			code := vreg0a_template_code
			etl_code := vreg_etl_code
			default_template := vreg0a_default_template
			current_class := a_class
			class_impl := a_class
			position := arg2.name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (arg2.name.name, 6)
			parameters.put (f.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = argument name
			-- dollar7: $7 = feature name (where the arguments appear)
		end

	make_vreg0b (a_class: like current_class; local1, local2: ET_LOCAL_VARIABLE; f: ET_FEATURE) is
			-- Create a new VREG error: `local1' and `local2' have the same
			-- name in feature `f' in `a_class'.
			--
			-- ETL2: p.110
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			local1_not_void: local1 /= Void
			local2_not_void: local2 /= Void
			f_not_void: f /= Void
		do
			code := vreg0b_template_code
			etl_code := vreg_etl_code
			default_template := vreg0b_default_template
			current_class := a_class
			class_impl := a_class
			position := local2.name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (local2.name.name, 6)
			parameters.put (f.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = local name
			-- dollar7: $7 = feature name (where the local variables appear)
		end

	make_vrfa0a (a_class: like current_class; arg: ET_FORMAL_ARGUMENT; f1, f2: ET_FEATURE) is
			-- Create a new VRFA error: `arg' in feature `f1' has
			-- the same name as feature `f2' in `a_class'.
			--
			-- ETL2: p.110
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			arg_not_void: arg /= Void
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		do
			code := vrfa0a_template_code
			etl_code := vrfa_etl_code
			default_template := vrfa0a_default_template
			current_class := a_class
			class_impl := a_class
			position := arg.name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (arg.name.name, 6)
			parameters.put (f1.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = argument name
			-- dollar7: $7 = feature name (where argument appears)
		end

	make_vrle1a (a_class: like current_class; a_local: ET_LOCAL_VARIABLE; f1, f2: ET_FEATURE) is
			-- Create a new VRLE-1 error: `a_local' in feature `f1' has
			-- the same name as feature `f2' in `a_class'.
			--
			-- ETL2: p.115
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_local_not_void: a_local /= Void
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		do
			code := vrle1a_template_code
			etl_code := vrle1_etl_code
			default_template := vrle1a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_local.name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_local.name.name, 6)
			parameters.put (f1.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = argument name
			-- dollar7: $7 = feature name (where local variable appears)
		end

	make_vrle2a (a_class: like current_class; a_local: ET_LOCAL_VARIABLE; f: ET_FEATURE; arg: ET_FORMAL_ARGUMENT) is
			-- Create a new VRLE-2 error: `a_local' in feature `f' has
			-- the same name as formal argument `arg' of this feature
			-- in `a_class'.
			--
			-- ETL2: p.115
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_local_not_void: a_local /= Void
			f_not_void: f /= Void
			arg_not_void: arg /= Void
		do
			code := vrle2a_template_code
			etl_code := vrle2_etl_code
			default_template := vrle2a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_local.name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_local.name.name, 6)
			parameters.put (f.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = argument name
			-- dollar7: $7 = feature name (where local variable and argument appears)
		end

	make_vscn0a (a_class: like current_class; other_cluster: ET_CLUSTER; other_filename: STRING) is
			-- Create a new VSCN error: `a_class' also appears in
			-- `other_cluster'.
			--
			-- ETL2: p.38
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			other_cluster_not_void: other_cluster /= Void
			other_filename_not_void: other_filename /= Void
		do
			code := vscn0a_template_code
			etl_code := vscn_etl_code
			default_template := vscn0a_default_template
			current_class := a_class
			class_impl := a_class
			position := null_position
			create parameters.make (1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_class.cluster.full_pathname, 6)
			parameters.put (a_class.filename, 7)
			parameters.put (other_cluster.full_pathname, 8)
			parameters.put (other_filename, 9)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = first cluster pathname
			-- dollar7: $7 = first class filename
			-- dollar8: $8 = second cluster pathname
			-- dollar9: $9 = second class filename
		end

	make_vtat1a (a_class: like current_class; a_type: ET_LIKE_FEATURE) is
			-- Create a new VTAT error: the anchor in the Anchored_type
			-- must be the final name of a query in `a_class'.
			--
			-- ETL2: p.214
			-- ETL3 (4.82-00-00): p.252
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		do
			code := vtat1a_template_code
			etl_code := vtat1_etl_code
			default_template := vtat1a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_type.name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_type.to_text, 6)
			parameters.put (a_type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = invalid type
			-- dollar7: $7 = anchor name
		end

	make_vtat1b (a_class: like current_class; a_feature: ET_FEATURE; a_type: ET_LIKE_FEATURE) is
			-- Create a new VTAT error: the anchor in the
			-- Anchored_type must be the final name of a query
			-- in `a_class' or an argument of `a_feature'.
			--
			-- ETL2: p.214
			-- ETL3 (4.82-00-00): p.252
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_type_not_void: a_type /= Void
		do
			code := vtat1b_template_code
			etl_code := vtat1_etl_code
			default_template := vtat1b_default_template
			current_class := a_class
			class_impl := a_class
			position := a_type.name.position
			create parameters.make (1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_type.to_text, 6)
			parameters.put (a_type.name.name, 7)
			parameters.put (a_feature.name.name, 8)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = invalid type
			-- dollar7: $7 = anchor name
			-- dollar8: $8 = feature name
		end

	make_vtat2a (a_class: like current_class; a_cycle: DS_LIST [ET_LIKE_IDENTIFIER]) is
			-- Create a new VTAT error: the anchors in `a_cycle'
			-- are cyclic anchors in `a_class'.
			--
			-- ETL3 (4.82-00-00): p.252
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_cyle_not_void: a_cycle /= Void
			no_void_anchor: not a_cycle.has (Void)
			is_cycle: a_cycle.count >= 2
		local
			a_cursor: DS_LIST_CURSOR [ET_LIKE_IDENTIFIER]
			a_like: ET_LIKE_IDENTIFIER
			a_feature: ET_FEATURE
			a_string: STRING
		do
			code := vtat2a_template_code
			etl_code := vtat2_etl_code
			default_template := vtat2a_default_template
			current_class := a_class
			class_impl := a_class
				-- Look for an anchor that has been written
				-- in `current_class'. Even though we consider
				-- that there was no cycles in the parents of
				-- `current_class', it is possible that no anchor
				-- have been written in `current_class' but get
				-- a cycle anyway. For example:
				--
				--   deferred class A
				--   feature
				--      f: like g is do ... end
				--      g: ANY is deferred end
				--   end
				--
				--   deferred class B
				--   feature
				--      f: ANY is deferred end
				--      g: like f is do ... end
				--   end
				--
				--   class C
				--   inherit
				--        A
				--        B
				--   end
				--
				-- The flat-short of class C will have something
				-- like that:
				--
				--   f: like g is do ... end
				--   g: like f is do ... end
				--
				-- `position' is set to null in that case.
			position := null_position
			a_cursor := a_cycle.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_like := a_cursor.item
				a_feature := current_class.seeded_feature (a_like.seed)
				if a_feature /= Void and then a_feature.implementation_class = current_class then
					if a_like.is_like_argument then
						position := a_like.name.position
						a_cursor.go_after
					else
						a_cursor.forth
						if not a_cursor.after then
							position := a_cursor.item.name.position
							a_cursor.go_after
						end
					end
				else
					a_cursor.forth
				end
			end
			from
				create a_string.make (20)
				a_cursor.start
				a_like := a_cursor.item
				if a_like.is_like_argument then
					a_string.append_string (a_like.name.name)
				else
						-- Take care of possible renaming.
					a_feature := current_class.seeded_feature (a_like.seed)
					if a_feature /= Void then
						a_string.append_string (a_feature.name.name)
					else
						a_string.append_string (a_like.name.name)
					end
				end
				a_cursor.forth
			until
				a_cursor.after
			loop
				a_string.append_string (" -> ")
				a_like := a_cursor.item
				if a_like.is_like_argument then
					a_string.append_string (a_like.name.name)
				else
						-- Take care of possible renaming.
					a_feature := current_class.seeded_feature (a_like.seed)
					if a_feature /= Void then
						a_string.append_string (a_feature.name.name)
					else
						a_string.append_string (a_like.name.name)
					end
				end
				a_cursor.forth
			end
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_string, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = cycle
		end

	make_vtbt0a (a_class: like current_class; a_type: ET_BIT_FEATURE) is
			-- Create a new VTBT error: the identifier in Bit_type
			-- must be the final name of a constant attribute of
			-- type INTEGER.
			--
			-- ETL2: p.210
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		do
			code := vtbt0a_template_code
			etl_code := vtbt_etl_code
			default_template := vtbt0a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_type.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_type.to_text, 6)
			parameters.put (a_type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = invalid type
			-- dollar7: $7 = constant feature name
		end

	make_vtbt0b (a_class: like current_class; a_type: ET_BIT_FEATURE) is
			-- Create a new VTBT error: the identifier in
			-- Bit_type must be the final name of a feature.
			--
			-- ETL2: p.210
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		do
			code := vtbt0b_template_code
			etl_code := vtbt_etl_code
			default_template := vtbt0b_default_template
			current_class := a_class
			class_impl := a_class
			position := a_type.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_type.to_text, 6)
			parameters.put (a_type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = invalid type
			-- dollar7: $7 = constant feature name
		end

	make_vtbt0c (a_class: like current_class; a_type: ET_BIT_TYPE) is
			-- Create a new VTBT error: size for Bit_type must
			-- be a positive integer constant.
			--
			-- ETL2: p.210
			-- ETR: p.47
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		do
			code := vtbt0c_template_code
			etl_code := vtbt_etl_code
			default_template := vtbt0c_default_template
			current_class := a_class
			class_impl := a_class
			position := a_type.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_type.to_text, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = invalid type
		end

	make_vtbt0d (a_class: like current_class; a_type: ET_BIT_TYPE) is
			-- Create a new VTBT error: size for Bit_type must
			-- be a positive integer constant but it is actually
			-- equal to -0.
			--
			-- ETL2: p.210
			-- ETR: p.47
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		do
			code := vtbt0d_template_code
			etl_code := vtbt_etl_code
			default_template := vtbt0d_default_template
			current_class := a_class
			class_impl := a_class
			position := a_type.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_type.to_text, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = invalid type
		end

	make_vtcg3a (a_class: like current_class; an_actual, a_constraint: ET_TYPE) is
			-- Create a new VTCG-3 error: actual generic paramater
			-- `an_actual' in `a_class' does not conform to
			-- constraint `a_constraint'.
			--
			-- ETL2: p.203
			-- ETR: p.46
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_actual_not_void: an_actual /= Void
			a_constraint_not_void: a_constraint /= Void
		do
			code := vtcg3a_template_code
			etl_code := vtcg3_etl_code
			default_template := vtcg3a_default_template
			current_class := a_class
			class_impl := a_class
			position := an_actual.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (an_actual.to_text, 6)
			parameters.put (a_constraint.to_text, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = actual generic parameter
			-- dollar7: $7 = generic constraint
		end

	make_vtcg4a (a_class: like current_class; a_position: ET_POSITION; an_actual_index: INTEGER;
		a_name: ET_FEATURE_NAME; an_actual_base_class, a_generic_class: ET_CLASS) is
			-- Create a new VTCG-4 error: `an_actual_base_class' does not make
			-- feature `a_name' available as creation procedure to `a_generic_class'.
			--
			-- Only in ISE Eiffel
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_position_not_void: a_position /= Void
			a_name_not_void: a_name /= Void
			an_actual_base_class_not_void: an_actual_base_class /= Void
			a_generic_class_not_void: a_generic_class /= Void
		do
			code := vtcg4a_template_code
			etl_code := vtcg4_etl_code
			default_template := vtcg4a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_position
			create parameters.make (1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (an_actual_index.out, 6)
			parameters.put (a_name.name, 7)
			parameters.put (an_actual_base_class.name.name, 8)
			parameters.put (a_generic_class.name.name, 9)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = actual generic parameter index
			-- dollar7: $7 = creation procedure name
			-- dollar8: $8 = actual generic parameter base class name
			-- dollar9: $9 = enclosing generic class name
		end

	make_vtcg4b (a_class: like current_class; a_class_impl: ET_CLASS; a_position: ET_POSITION;
		an_actual_index: INTEGER; a_name: ET_FEATURE_NAME; an_actual_base_class, a_generic_class: ET_CLASS) is
			-- Create a new VTCG-4 error: `an_actual_base_class' does not make
			-- feature `a_name' available as creation procedure to `a_generic_class'.
			--
			-- Only in ISE Eiffel
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_position_not_void: a_position /= Void
			a_name_not_void: a_name /= Void
			an_actual_base_class_not_void: an_actual_base_class /= Void
			a_generic_class_not_void: a_generic_class /= Void
		do
			code := vtcg4b_template_code
			etl_code := vtcg4_etl_code
			default_template := vtcg4b_default_template
			current_class := a_class
			class_impl := a_class_impl
			position := a_position
			create parameters.make (1, 10)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (class_impl.name.name, 6)
			parameters.put (an_actual_index.out, 7)
			parameters.put (a_name.name, 8)
			parameters.put (an_actual_base_class.name.name, 9)
			parameters.put (a_generic_class.name.name, 10)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class_impl
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = actual generic parameter index
			-- dollar8: $8 = creation procedure name
			-- dollar9: $9 = actual generic parameter base class name
			-- dollar10: $10 = enclosing generic class name
		end

	make_vtcg4c (a_class: like current_class; a_position: ET_POSITION; an_actual_index: INTEGER;
		a_name: ET_FEATURE_NAME; an_actual: ET_FORMAL_PARAMETER; a_generic_class: ET_CLASS) is
			-- Create a new VTCG-4 error: `an_actual', which is a formal generic parameter
			-- of `a_class' does not list feature `a_name' as creation procedure.
			--
			-- Only in ISE Eiffel
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_position_not_void: a_position /= Void
			a_name_not_void: a_name /= Void
			an_actual_not_void: an_actual /= Void
			a_generic_class_not_void: a_generic_class /= Void
		do
			code := vtcg4c_template_code
			etl_code := vtcg4_etl_code
			default_template := vtcg4c_default_template
			current_class := a_class
			class_impl := a_class
			position := a_position
			create parameters.make (1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (an_actual_index.out, 6)
			parameters.put (a_name.name, 7)
			parameters.put (an_actual.index.out, 8)
			parameters.put (a_generic_class.name.name, 9)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = actual generic parameter index
			-- dollar7: $7 = creation procedure name
			-- dollar8: $8 = index of formal generic parameter in class $5
			-- dollar9: $9 = enclosing generic class name
		end

	make_vtcg4d (a_class: like current_class; a_class_impl: ET_CLASS; a_position: ET_POSITION;
		an_actual_index: INTEGER; a_name: ET_FEATURE_NAME; an_actual: ET_FORMAL_PARAMETER; a_generic_class: ET_CLASS) is
			-- Create a new VTCG-4 error: `an_actual', which is a formal generic parameter
			-- of `a_class' does not list feature `a_name' as creation procedure.
			--
			-- Only in ISE Eiffel
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_position_not_void: a_position /= Void
			a_name_not_void: a_name /= Void
			an_actual_not_void: an_actual /= Void
			a_generic_class_not_void: a_generic_class /= Void
		do
			code := vtcg4d_template_code
			etl_code := vtcg4_etl_code
			default_template := vtcg4d_default_template
			current_class := a_class
			class_impl := a_class_impl
			position := a_position
			create parameters.make (1, 10)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (class_impl.name.name, 6)
			parameters.put (an_actual_index.out, 7)
			parameters.put (a_name.name, 8)
			parameters.put (an_actual.index.out, 9)
			parameters.put (a_generic_class.name.name, 10)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class_impl
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = actual generic parameter index
			-- dollar8: $8 = creation procedure name
			-- dollar9: $9 = index of formal generic parameter in class $5
			-- dollar10: $10 = enclosing generic class name
		end

	make_vtct0a (a_class: like current_class; a_type: ET_BASE_TYPE) is
			-- Create a new VTCT error: `a_type' based on unknown
			-- class in class `a_class'.
			--
			-- ETL2: p.199
			-- ETR: p.45
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		do
			code := vtct0a_template_code
			etl_code := vtct_etl_code
			default_template := vtct0a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_type.name.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_type.name.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = type base class
		end

	make_vtct0b (a_class: like current_class; a_type: ET_FORMAL_PARAMETER_TYPE) is
			-- Create a new VTCT error: `a_type' based on unknown
			-- class in class `a_class'.
			--
			-- ETL2: p.199
			-- ETR: p.45
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		do
			code := vtct0b_template_code
			etl_code := vtct_etl_code
			default_template := vtct0b_default_template
			current_class := a_class
			class_impl := a_class
			position := a_type.name.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_type.name.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = type base class
		end

	make_vtgc0a (a_class: like current_class; cp: ET_FEATURE_NAME; a_constraint: ET_CLASS) is
			-- Create a new VTGC error: creation procedure name `cp'
			-- is not the final name of a feature in the base class
			-- `a_constraint' of a generic constraint of `a_class'.
			--
			-- ETL3 (4.82-00-00): p.261 (CTGC)
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			cp_not_void: cp /= Void
			a_constraint_not_void: a_constraint /= Void
		do
			code := vtgc0a_template_code
			etl_code := vtgc_etl_code
			default_template := vtgc0a_default_template
			current_class := a_class
			class_impl := a_class
			position := cp.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (cp.name, 6)
			parameters.put (a_constraint.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = creation procedure name
			-- dollar7: $7 = constraint base class name
		end

	make_vtgc0b (a_class: like current_class; cp: ET_FEATURE_NAME; f: ET_FEATURE; a_constraint: ET_CLASS) is
			-- Create a new VTGC error: creation procedure name `cp'
			-- is not the final name of a procedure in the base class
			-- `a_constraint' of a generic constraint of `a_class'.
			--
			-- ETL3 (4.82-00-00): p.261 (CTGC)
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			cp_not_void: cp /= Void
			f_not_void: f /= Void
			f_name: f.name.same_feature_name (cp)
			f_not_procedure: not f.is_procedure
			a_constraint_not_void: a_constraint /= Void
		do
			code := vtgc0b_template_code
			etl_code := vtgc_etl_code
			default_template := vtgc0b_default_template
			current_class := a_class
			class_impl := a_class
			position := cp.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (cp.name, 6)
			parameters.put (a_constraint.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = creation procedure name
			-- dollar7: $7 = constraint base class name
		end

	make_vtug1a (a_class: like current_class; a_type: ET_CLASS_TYPE) is
			-- Create a new VTUG-1 error: `a_type', which appears in
			-- source code of `a_class', has actual generic parameters
			-- but its base class is not generic.
			--
			-- ETL2: p.201
			-- ETR: p.46
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		do
			code := vtug1a_template_code
			etl_code := vtug1_etl_code
			default_template := vtug1a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_type.name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_type.to_text, 6)
			parameters.put (a_type.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = invalid type
			-- dollar7: $7 = invalid type's base class
		end

	make_vtug2a (a_class: like current_class; a_type: ET_CLASS_TYPE) is
			-- Create a new VTUG-2 error: `a_type', which appears
			-- in source code of `a_class', has the wrong number
			-- of actual generic parameters.
			--
			-- ETL2: p.201
			-- ETR: p.46
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		do
			code := vtug2a_template_code
			etl_code := vtug2_etl_code
			default_template := vtug2a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_type.name.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_type.to_text, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = invalid type
		end

	make_vuar1a (a_class: like current_class; a_name: ET_CALL_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS) is
			-- Create a new  VUAR-1 error: the number of actual arguments in
			-- the qualified call `a_name' appearing in `a_class' is not the
			-- same as the number of formal arguments of `a_feature' in
			-- class `a_target'.
			--
			-- ETL2: p.369
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_target_not_void: a_target /= Void
		do
			code := vuar1a_template_code
			etl_code := vuar1_etl_code
			default_template := vuar1a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			create parameters.make (1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_name.name, 6)
			parameters.put (a_feature.name.name, 7)
			parameters.put (a_target.name.name, 8)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name of the call
			-- dollar7: $7 = name of corresponding feature in class $8
			-- dollar8: $8 = base class of target of the call
		end

	make_vuar1c (a_class: like current_class; a_name: ET_CALL_NAME; a_feature: ET_FEATURE) is
			-- Create a new  VUAR-1 error: the number of actual arguments in
			-- the unqualified call `a_name' appearing in `a_class' is not the
			-- same as the number of formal arguments of `a_feature' in `a_class'.
			--
			-- ETL2: p.369
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
		do
			code := vuar1c_template_code
			etl_code := vuar1_etl_code
			default_template := vuar1c_default_template
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_name.name, 6)
			parameters.put (a_feature.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name of the call
			-- dollar7: $7 = name of corresponding feature in class $5
		end

	make_vuar2a (a_class: like current_class; a_name: ET_CALL_NAME; a_feature: ET_FEATURE;
		a_target: ET_CLASS; arg: INTEGER; an_actual, a_formal: ET_NAMED_TYPE) is
			-- Create a new VUAR-2 error: the `arg'-th actual argument in the qualified
			-- call `a_name' appearing in `a_class' does not conform to the corresponding
			-- formal argument of `a_feature' in class `a_target'.
			--
			-- ETL2: p.369
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_target_not_void: a_target /= Void
			an_actual_not_void: an_actual /= Void
			an_actual_named_type: an_actual.is_named_type
			a_formal_not_void: a_formal /= Void
			a_formal_named_type: a_formal.is_named_type
		do
			code := vuar2a_template_code
			etl_code := vuar2_etl_code
			default_template := vuar2a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			create parameters.make (1, 11)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_name.name, 6)
			parameters.put (a_feature.name.name, 7)
			parameters.put (a_target.name.name, 8)
			parameters.put (arg.out, 9)
			parameters.put (an_actual.to_text, 10)
			parameters.put (a_formal.to_text, 11)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name of the call
			-- dollar7: $7 = name of corresponding feature in class $8
			-- dollar8: $8 = base class of target of the call
			-- dollar9: $9 = argument index
			-- dollar10: $10 = actual type
			-- dollar11: $11 = formal type
		end

	make_vuar2b (a_class: like current_class; a_class_impl: ET_CLASS; a_name: ET_CALL_NAME;
		a_feature: ET_FEATURE; a_target: ET_CLASS; arg: INTEGER; an_actual, a_formal: ET_NAMED_TYPE) is
			-- Create a new VUAR-2 error: the `arg'-th actual argument in the qualified
			-- call `a_name' appearing in `a_class_impl' and viewed from one of its descendants
			-- `a_class' does not conform to the corresponding formal argument of `a_feature'
			-- in class `a_target'.
			--
			-- ETL2: p.369
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_target_not_void: a_target /= Void
			an_actual_not_void: an_actual /= Void
			an_actual_named_type: an_actual.is_named_type
			a_formal_not_void: a_formal /= Void
			a_formal_named_type: a_formal.is_named_type
		do
			code := vuar2b_template_code
			etl_code := vuar2_etl_code
			default_template := vuar2b_default_template
			current_class := a_class
			class_impl := a_class_impl
			position := a_name.position
			create parameters.make (1, 12)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_class_impl.name.name, 6)
			parameters.put (a_name.name, 7)
			parameters.put (a_feature.name.name, 8)
			parameters.put (a_target.name.name, 9)
			parameters.put (arg.out, 10)
			parameters.put (an_actual.to_text, 11)
			parameters.put (a_formal.to_text, 12)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class_impl
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = feature name of the call
			-- dollar8: $8 = name of corresponding feature in class $9
			-- dollar9: $9 = base class of target of the call
			-- dollar10: $10 = argument index
			-- dollar11: $11 = actual type
			-- dollar12: $12 = formal type
		end

	make_vuar2c (a_class: like current_class; a_name: ET_CALL_NAME; a_feature: ET_FEATURE;
		arg: INTEGER; an_actual, a_formal: ET_NAMED_TYPE) is
			-- Create a new VUAR-2 error: the `arg'-th actual argument in the unqualified
			-- call `a_name' appearing in `a_class' does not conform to the corresponding
			-- formal argument of `a_feature' in `a_class'.
			--
			-- ETL2: p.369
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			an_actual_not_void: an_actual /= Void
			an_actual_named_type: an_actual.is_named_type
			a_formal_not_void: a_formal /= Void
			a_formal_named_type: a_formal.is_named_type
		do
			code := vuar2c_template_code
			etl_code := vuar2_etl_code
			default_template := vuar2c_default_template
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			create parameters.make (1, 10)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_name.name, 6)
			parameters.put (a_feature.name.name, 7)
			parameters.put (arg.out, 8)
			parameters.put (an_actual.to_text, 9)
			parameters.put (a_formal.to_text, 10)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name of the call
			-- dollar7: $7 = name of corresponding feature in class $5
			-- dollar8: $8 = argument index
			-- dollar9: $9 = actual type
			-- dollar10: $10 = formal type
		end

	make_vuar2d (a_class: like current_class; a_class_impl: ET_CLASS; a_name: ET_CALL_NAME;
		a_feature: ET_FEATURE; arg: INTEGER; an_actual, a_formal: ET_NAMED_TYPE) is
			-- Create a new VUAR-2 error: the `arg'-th actual argument in the unqualified
			-- call `a_name' appearing in `a_class_imple' and viewed from one of its descendants
			-- `a_class' does not conform to the corresponding formal argument of `a_feature'
			-- in `a_class_impl'.
			--
			-- ETL2: p.369
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			an_actual_not_void: an_actual /= Void
			an_actual_named_type: an_actual.is_named_type
			a_formal_not_void: a_formal /= Void
			a_formal_named_type: a_formal.is_named_type
		do
			code := vuar2d_template_code
			etl_code := vuar2_etl_code
			default_template := vuar2d_default_template
			current_class := a_class
			class_impl := a_class_impl
			position := a_name.position
			create parameters.make (1, 11)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_class_impl.name.name, 6)
			parameters.put (a_name.name, 7)
			parameters.put (a_feature.name.name, 8)
			parameters.put (arg.out, 9)
			parameters.put (an_actual.to_text, 10)
			parameters.put (a_formal.to_text, 11)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class_impl
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = feature name of the call
			-- dollar8: $8 = name of corresponding feature in class $6
			-- dollar9: $9 = argument index
			-- dollar10: $10 = actual type
			-- dollar11: $11 = formal type
		end

	make_vuar4a (a_class: like current_class; a_name: ET_FEATURE_NAME) is
			-- Create a new VUAR-4 error: `a_name', appearing in an
			-- expression of Address form $`a_name' in `a_class', is
			-- not the final name of a feature in `a_class'.
			--
			-- ETL2: p.369
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
		do
			code := vuar4a_template_code
			etl_code := vuar4_etl_code
			default_template := vuar4a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_name.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name in the Address form
		end

	make_vuex1a (a_class: like current_class; a_name: ET_CALL_NAME) is
			-- Create a new VUEX-1 error: `a_name', appearing in an unqualified
			-- call in `a_class', is not the final name of a feature
			-- in `a_class'.
			--
			-- ETL2: p.368
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
		do
			code := vuex1a_template_code
			etl_code := vuex1_etl_code
			default_template := vuex1a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_name.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name of the call
		end

	make_vuex2a (a_class: like current_class; a_name: ET_CALL_NAME; a_target: ET_CLASS) is
			-- Create a new VUEX-2 error: `a_name', appearing in a qualified
			-- call in `a_class', is not the final name of a feature
			-- in class `a_target'.
			--
			-- ETL2: p.368
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_target_not_void: a_target /= Void
		do
			code := vuex2a_template_code
			etl_code := vuex2_etl_code
			default_template := vuex2a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_name.name, 6)
			parameters.put (a_target.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name of the call
			-- dollar7: $7 = base class of target of the call
		end

	make_vuex2b (a_class: like current_class; a_name: ET_CALL_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS) is
			-- Create a new VUEX-2 error: `a_feature' of class `a_target',
			-- is not exported to `a_class' where the qualified call 
			-- `a_name' appears.
			--
			-- ETL2: p.368
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_target_not_void: a_target /= Void
		do
			code := vuex2b_template_code
			etl_code := vuex2_etl_code
			default_template := vuex2b_default_template
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			create parameters.make (1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_name.name, 6)
			parameters.put (a_feature.name.name, 7)
			parameters.put (a_target.name.name, 8)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = feature name of the call
			-- dollar7: $7 = name of corresponding feature in class $8
			-- dollar8: $8 = base class of target of the call
		end

	make_vuex2c (a_class: like current_class; a_class_impl: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS) is
			-- Create a new VUEX-2 error: `a_feature' of class `a_target'
			-- is not exported to `a_class', one of the descendants of
			-- `a_class_impl' where the qualified call `a_name' appears.
			--
			-- ETL2: p.368
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_target_not_void: a_target /= Void
		do
			code := vuex2c_template_code
			etl_code := vuex2_etl_code
			default_template := vuex2c_default_template
			current_class := a_class
			class_impl := a_class_impl
			position := a_name.position
			create parameters.make (1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_class_impl.name.name, 6)
			parameters.put (a_name.name, 7)
			parameters.put (a_feature.name.name, 8)
			parameters.put (a_target.name.name, 9)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class_impl
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = feature name of the call
			-- dollar8: $8 = name of corresponding feature in class $9
			-- dollar9: $9 = base class of target of the call
		end

	make_vwbe0a (a_class: like current_class; an_expression: ET_EXPRESSION; a_type: ET_NAMED_TYPE) is
			-- Create a new VWBE error: the boolean expression `an_expression'
			-- in `a_class' is of type `a_type' which is not "BOOLEAN".
			--
			-- ETL2: p.374
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_expression_not_void: an_expression /= Void
			a_type_not_void: a_type /= Void
		do
			code := vwbe0a_template_code
			etl_code := vwbe_etl_code
			default_template := vwbe0a_default_template
			current_class := a_class
			class_impl := a_class
			position := an_expression.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_type.to_text, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = base type of expression
		end

	make_vwbe0b (a_class: like current_class; a_class_impl: ET_CLASS;
		an_expression: ET_EXPRESSION; a_type: ET_NAMED_TYPE) is
			-- Create a new VWBE error: the boolean expression `an_expression'
			-- in `a_class_impl' and viewed from one of its descendants
			-- `a_class' is of type `a_type' which is not "BOOLEAN".
			--
			-- ETL2: p.374
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			an_expression_not_void: an_expression /= Void
			a_type_not_void: a_type /= Void
		do
			code := vwbe0b_template_code
			etl_code := vwbe_etl_code
			default_template := vwbe0b_default_template
			current_class := a_class
			class_impl := a_class_impl
			position := an_expression.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_class_impl.name.name, 6)
			parameters.put (a_type.to_text, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class_impl
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = base type of expression
		end

	make_vweq0a (a_class: like current_class; an_expression: ET_EQUALITY_EXPRESSION;
		a_type1, a_type2: ET_NAMED_TYPE) is
			-- Create a new VWEQ error: none of the operands of the equality
			-- expression `an_expression' appearing in `a_class' conforms to
			-- the other.
			--
			-- ETL2: p.375
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_expression_not_void: an_expression /= Void
			a_type1_not_void: a_type1 /= Void
			a_type2_not_void: a_type2 /= Void
		do
			code := vweq0a_template_code
			etl_code := vweq_etl_code
			default_template := vweq0a_default_template
			current_class := a_class
			class_impl := a_class
			position := an_expression.operator.position
			create parameters.make (1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (an_expression.operator.text, 6)
			parameters.put (a_type1.to_text, 7)
			parameters.put (a_type2.to_text, 8)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = equality operator
			-- dollar7: $7 = base type of left operand
			-- dollar8: $8 = base type of right operand
		end

	make_vweq0b (a_class: like current_class; a_class_impl: ET_CLASS;
		an_expression: ET_EQUALITY_EXPRESSION; a_type1, a_type2: ET_NAMED_TYPE) is
			-- Create a new VWEQ error: none of the operands of the equality
			-- expression `an_expression' appearing in `a_class_impl' and viewed
			-- from one of its descendants `a_class' conforms to the other.
			--
			-- ETL2: p.375
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			an_expression_not_void: an_expression /= Void
			a_type1_not_void: a_type1 /= Void
			a_type2_not_void: a_type2 /= Void
		do
			code := vweq0b_template_code
			etl_code := vweq_etl_code
			default_template := vweq0b_default_template
			current_class := a_class
			class_impl := a_class_impl
			position := an_expression.operator.position
			create parameters.make (1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_class_impl.name.name, 6)
			parameters.put (an_expression.operator.text, 7)
			parameters.put (a_type1.to_text, 8)
			parameters.put (a_type2.to_text, 9)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class_impl
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = equality operator
			-- dollar8: $8 = base type of left operand
			-- dollar9: $9 = base type of right operand
		end

	make_vwst1a (a_class: like current_class; a_name: ET_FEATURE_NAME) is
			-- Create a new VWST-1 error: `a_name', appearing in a strip
			-- expression in `a_class', is not the final name of a feature
			-- in `a_class'.
			--
			-- ETL2: p.397
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
		do
			code := vwst1a_template_code
			etl_code := vwst1_etl_code
			default_template := vwst1a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_name.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = attribute name
		end

	make_vwst1b (a_class: like current_class; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE) is
			-- Create a new VWST-1 error: `a_feature', whose name `a_name' appears
			-- in a strip expression in `a_class', is not the final name of
			-- an attribute in `a_class'.
			--
			-- ETL2: p.397
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
		do
			code := vwst1a_template_code
			etl_code := vwst1_etl_code
			default_template := vwst1a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_name.name, 6)
			parameters.put (a_feature.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = attribute name
			-- dollar7: $7 = name of actual feature
		end

	make_vwst2a (a_class: like current_class; a_name1, a_name2: ET_FEATURE_NAME) is
			-- Create a new VWST-2 error: an atttribute name appears twice in
			-- a strip expression in `a_class'.
			--
			-- ETL2: p.397
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name1_not_void: a_name1 /= Void
			a_name2_not_void: a_name2 /= Void
		do
			code := vwst2a_template_code
			etl_code := vwst2_etl_code
			default_template := vwst2a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_name2.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_name2.name, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = attribute name
		end

	make_vxrt0a (a_class: like current_class; a_retry: ET_RETRY_INSTRUCTION) is
			-- Create a new VXRT error: instruction `a_retry' does not 
			-- appear in a rescue clause in `a_class'.
			--
			-- ETL2: p.256
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_retry_not_void: a_retry /= Void
		do
			code := vxrt0a_template_code
			etl_code := vxrt_etl_code
			default_template := vxrt0a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_retry.position
			create parameters.make (1, 5)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
		end

	make_gvagp0a (a_class: like current_class; anc1, anc2: ET_BASE_TYPE) is
			-- Create a new GVAGP error: `anc1' and `anc2' are two ancestors
			-- of `a_class' with the same base class but different generic
			-- parameters.
			--
			-- Not in ETL
			-- GVAGP: Gobo Validity Ancestor Generic Parameter mismatch
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			anc1_not_void: anc1 /= Void
			anc2_not_void: anc2 /= Void
		do
			code := gvagp0a_template_code
			etl_code := gvagp_etl_code
			default_template := gvagp0a_default_template
			current_class := a_class
			class_impl := a_class
			position := null_position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (anc1.to_text, 6)
			parameters.put (anc2.to_text, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = ancestor1
			-- dollar7: $7 = ancestor2
		end

	make_gvhpr4a (a_class: like current_class; a_parent: ET_BIT_N) is
			-- Create a new GVHPR-4 error: cannot inherit from Bit_type.
			--
			-- Not in ETL as validity error but as syntax error
			-- GVHPR-4: See ETL2 VHPR
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
		do
			code := gvhpr4a_template_code
			etl_code := gvhpr4_etl_code
			default_template := gvhpr4a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_parent.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_parent.position.to_text, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = parent
		end

	make_gvhpr5a (a_class: like current_class; a_parent: ET_TUPLE_TYPE) is
			-- Create a new GVHPR-5 error: cannot inherit from Tuple_type.
			--
			-- Not in ETL as validity error but as syntax error
			-- GVHPR-5: See ETL2 VHPR
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
		do
			code := gvhpr5a_template_code
			etl_code := gvhpr5_etl_code
			default_template := gvhpr5a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_parent.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_parent.position.to_text, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = parent
		end

	make_gvtcg5a (a_class: like current_class; an_actual: ET_TYPE; a_formal: ET_FORMAL_PARAMETER) is
			-- Create a new GVTCG-5 error: actual generic paramater `an_actual' in
			-- `a_class' is not a reference type but the corresponding formal parameter
			-- `a_formal' is marked as reference.
			--
			-- Not in ETL
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_actual_not_void: an_actual /= Void
			a_formal_not_void: a_formal /= Void
		do
			code := gvtcg5a_template_code
			etl_code := gvtcg5_etl_code
			default_template := gvtcg5a_default_template
			current_class := a_class
			class_impl := a_class
			position := an_actual.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (an_actual.to_text, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = actual generic parameter
		end

	make_gvtcg5b (a_class: like current_class; an_actual: ET_TYPE; a_formal: ET_FORMAL_PARAMETER) is
			-- Create a new GVTCG-5 error: actual generic paramater `an_actual' in
			-- `a_class' is not expanded type but the corresponding formal parameter
			-- `a_formal' is marked as expanded.
			--
			-- Not in ETL
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_actual_not_void: an_actual /= Void
			a_formal_not_void: a_formal /= Void
		do
			code := gvtcg5b_template_code
			etl_code := gvtcg5_etl_code
			default_template := gvtcg5b_default_template
			current_class := a_class
			class_impl := a_class
			position := an_actual.position
			create parameters.make (1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (an_actual.to_text, 6)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = actual generic parameter
		end

	make_gvuaa0a (a_class: like current_class; a_name: ET_IDENTIFIER; a_feature: ET_FEATURE) is
			-- Create a new GVUAA error: `a_name' is a formal argument of
			-- `a_feature' in `a_class', and hence cannot have actual
			-- arguments.
			--
			-- Not in ETL as validity error but as syntax error
			-- GVUAA: See ETL2 VUAR
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
		do
			code := gvuaa0a_template_code
			etl_code := gvuaa_etl_code
			default_template := gvuaa0a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_name.name, 6)
			parameters.put (a_feature.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = formal argument name
			-- dollar7: $7 = feature name
		end

	make_gvual0a (a_class: like current_class; a_name: ET_IDENTIFIER; a_feature: ET_FEATURE) is
			-- Create a new GVUAL error: `a_name' is a local variable of
			-- `a_feature' in `a_class', and hence cannot have actual
			-- arguments.
			--
			-- Not in ETL as validity error but as syntax error
			-- GVUAA: See ETL2 VUAR
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
		do
			code := gvual0a_template_code
			etl_code := gvual_etl_code
			default_template := gvual0a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_name.name, 6)
			parameters.put (a_feature.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = local variable name
			-- dollar7: $7 = feature name
		end

	make_gvuia0a (a_class: like current_class; a_name: ET_IDENTIFIER; a_feature: ET_FEATURE) is
			-- Create a new GVUIA error: `a_name' is a formal argument of
			-- `a_feature' in `a_class', and hence cannot be an
			-- instruction.
			--
			-- Not in ETL as validity error but as syntax error
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
		do
			code := gvuia0a_template_code
			etl_code := gvuia_etl_code
			default_template := gvuia0a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_name.name, 6)
			parameters.put (a_feature.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = formal argument name
			-- dollar7: $7 = feature name
		end

	make_gvuil0a (a_class: like current_class; a_name: ET_IDENTIFIER; a_feature: ET_FEATURE) is
			-- Create a new GVUIL error: `a_name' is a local variable of
			-- `a_feature' in `a_class', and hence cannot be an
			-- instruction.
			--
			-- Not in ETL as validity error but as syntax error
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
		do
			code := gvuil0a_template_code
			etl_code := gvuil_etl_code
			default_template := gvuil0a_default_template
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			create parameters.make (1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (a_name.name, 6)
			parameters.put (a_feature.name.name, 7)
			set_compilers (True)
		ensure
			current_class_set: current_class = a_class
			class_impl_set: class_impl = a_class
			all_reported: all_reported
			all_fatal: all_fatal
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = filename
			-- dollar3: $3 = line
			-- dollar4: $4 = column
			-- dollar5: $5 = class name
			-- dollar6: $6 = local variable name
			-- dollar7: $7 = feature name
		end

feature -- Access

	class_impl: ET_CLASS
			-- Class where current error was written

	filename: STRING is
			-- Name of file where current error occurred
		do
			Result := class_impl.filename
		end

feature -- Setting

	set_class_impl (a_class: like class_impl) is
			-- Set `class_impl' to `a_class'.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			class_impl := a_class
		ensure
			class_impl_set: class_impl = a_class
		end

	set_current_class (a_class: like current_class) is
			-- Set `current_class' to `a_class'.
		require
			a_class_not_void: a_class /= Void
		do
			current_class := a_class
		ensure
			current_class_set: current_class = a_class
		end

feature {NONE} -- Implementation

	vaol1a_default_template: STRING is "[$1] class $5 ($3,$4): old expression does not appear in a postcondition."
	vape0a_default_template: STRING is "[$1] class $5 ($3,$4): feature `$7' of class $5 appearing in the precondition of `$8' is not exported to class $9 to which feature `$8' is exported."
	vape0b_default_template: STRING is "[$1] class $5 ($6,$3,$4): feature `$8' of class $5 appearing in the precondition of `$9' is not exported to class $10 to which feature `$9' is exported."
	vape0c_default_template: STRING is "[$1] class $5 ($3,$4): feature `$7' of class $8 appearing in the precondition of `$9' is not exported to class $10 to which feature `$9' is exported."
	vape0d_default_template: STRING is "[$1] class $5 ($6,$3,$4): feature `$8' of class $9 appearing in the precondition of `$10' is not exported to class $11 to which feature `$10' is exported."
	vape0e_default_template: STRING is "[$1] class $5 ($3,$4): feature `$7' of class $5 appearing in the precondition of `$8' is not exported to class $9 to which feature `$8' is exported."
	vape0f_default_template: STRING is "[$1] class $5 ($6,$3,$4): feature `$8' of class $5 appearing in the precondition of `$9' is not exported to class $10 to which feature `$9' is exported."
	vape0g_default_template: STRING is "[$1] class $5 ($3,$4): feature `$7' of class $8 appearing in the precondition of `$9' is not exported to class $10 to which feature `$9' is exported."
	vape0h_default_template: STRING is "[$1] class $5 ($6,$3,$4): feature `$8' of class $9 appearing in the precondition of `$10' is not exported to class $11 to which feature `$10' is exported."
	vave0a_default_template: STRING is "[$1] class $5 ($3,$4): loop variant expression of non-INTEGER type '$6'."
	vave0b_default_template: STRING is "[$1] class $5 ($6,$3,$4): loop variant expression of non-INTEGER type '$7'."
	vcch1a_default_template: STRING is "[$1] class $5 ($3,$4): class is not marked as deferred but has deferred feature `$6'."
	vcch1b_default_template: STRING is "[$1] class $5 ($3,$4): class is not marked as deferred but has deferred feature `$6' inherited from $7."
	vcch2a_default_template: STRING is "[$1] class $5 ($3,$4): class is marked as deferred but has no deferred feature."
	vcfg1a_default_template: STRING is "[$1] class $5 ($3,$4): formal generic parameter '$6' has the same name as a class in the surrounding universe."
	vcfg2a_default_template: STRING is "[$1] class $5 ($3,$4): '$6' is the name of formal generic parameters #$7 and #$8."
	vcfg3a_default_template: STRING is "[$1] class $5 ($3,$4): invalid type '$6' in constraint of formal generic parameter."
	vcfg3b_default_template: STRING is "[$1] class $5 ($3,$4): invalid type '$6' in constraint of formal generic parameter."
	vcfg3c_default_template: STRING is "[$1] class $5 ($3,$4): invalid type '$6' in constraint of formal generic parameter."
	vcfg3d_default_template: STRING is "[$1] class $5 ($3,$4): constraint of formal generic parameter '$6' is '$7' itself."
	vcfg3e_default_template: STRING is "[$1] class $5 ($3,$4): constraint of formal generic parameter '$6' is another formal generic parameter '$7'."
	vcfg3g_default_template: STRING is "[$1] class $5 ($3,$4): formal generic constraint cycle $6."
	vcfg3h_default_template: STRING is "[$1] class $5 ($3,$4): constraint of formal generic parameter '$6' contains '$7' itself."
	vcfg3j_default_template: STRING is "[$1] class $5 ($3,$4): formal generic constraint cycle $6."
	vdjr0a_default_template: STRING is "[$1] class $5 ($3,$4): joined deferred features `$6' inherited from $7 and $8 don't have the same signature. Different number of arguments."
	vdjr0b_default_template: STRING is "[$1] class $5 ($3,$4): joined deferred features `$6' inherited from $7 and $8 don't have the same signature. Type of argument number $9 differs."
	vdjr0c_default_template: STRING is "[$1] class $5 ($3,$4): joined deferred features `$6' inherited from $7 and $8 don't have the same signature. Type of result differs."
	vdpr1a_default_template: STRING is "[$1] class $5 ($3,$4): Precursor instruction does not appear in a Routine_body."
	vdpr1b_default_template: STRING is "[$1] class $5 ($3,$4): Precursor expression does not appear in a Routine_body."
	vdpr2a_default_template: STRING is "[$1] class $5 ($3,$4): class $6 in Precursor construct is not a parent of class $5."
	vdpr3a_default_template: STRING is "[$1] class $5 ($3,$4): conflict in Precursor construct between effective features `$6' inherited from '$7' and `$8' inherited from '$9'."
	vdpr3b_default_template: STRING is "[$1] class $5 ($3,$4): feature `$6' is not the redefinition of an effective feature."
	vdpr3c_default_template: STRING is "[$1] class $5 ($3,$4): feature `$6' is not the redefinition of a feature from parent '$7'."
	vdpr3d_default_template: STRING is "[$1] class $5 ($3,$4): feature `$6' is not the redeclaration of a feature."
	vdpr4a_default_template: STRING is "[$1] class $5 ($3,$4): the number of actual arguments in Precursor call is not the same as the number of formal arguments of feature `$6' in class $7."
	vdpr4c_default_template: STRING is "[$1] class $5 ($3,$4): the $8-th actual argument (of type '$9') does not conform to the corresponding formal argument (of type '$10') of feature `$6' in class $7."
	vdpr4d_default_template: STRING is "[$1] class $5 ($6,$3,$4): the $9-th actual argument (of type '$10') does not conform to the corresponding formal argument (of type '$11') of feature `$7' in class $8."
	vdrd2a_default_template: STRING is "[$1] class $5 ($3,$4): signature of feature `$6' does not conform to the signature of redeclared feature `$7' in parent $8."
	vdrd2b_default_template: STRING is "[$1] class $5 ($3,$4): signature of feature `$6' inherited from $7 does not conform to the signature of redeclared feature `$8' in parent $9."
	vdrd2c_default_template: STRING is "[$1] class $5 ($3,$4): signature of selected feature `$6' does not conform to the signature of replicated feature `$7' in parent $8."
	vdrd2d_default_template: STRING is "[$1] class $5 ($3,$4): signature of selected feature `$6' inherited from $7 does not conform to the signature of replicated feature `$8' in parent $9."
	vdrd3a_default_template: STRING is "[$1] class $5 ($3,$4): feature `$6' is redeclared but its preconditions do not begin with 'require else'."
	vdrd3b_default_template: STRING is "[$1] class $5 ($3,$4): feature `$6' is redeclared but its postconditions do not begin with 'ensure then'."
	vdrd4a_default_template: STRING is "[$1] class $5 ($3,$4): deferred feature `$6' inherited from $7 is redefined but is not listed in the Redefine subclause."
	vdrd4b_default_template: STRING is "[$1] class $5 ($3,$4): effective feature `$6' inherited from $7 is redefined but is not listed in the Redefine subclause."
	vdrd4c_default_template: STRING is "[$1] class $5 ($3,$4): effective feature `$6' inherited from $7 is redefined into a deferred one but is not listed in the Undefine and Redefine subclauses."
	vdrd5a_default_template: STRING is "[$1] class $5 ($3,$4): effective feature `$6' inherited from $7 is redefined into a deferred one."
	vdrd6a_default_template: STRING is "[$1] class $5 ($3,$4): attribute `$6' inherited from $7 is not redeclared into an attribute."
	vdrd6b_default_template: STRING is "[$1] class $5 ($3,$4): attribute `$6' inherited from $7 and its redeclared version don't have the same type expandedness."
	vdrs1a_default_template: STRING is "[$1] class $5 ($3,$4): `$6' is not the final name of a feature in $7."
	vdrs2a_default_template: STRING is "[$1] class $5 ($3,$4): cannot redefine the frozen feature `$6'."
	vdrs2b_default_template: STRING is "[$1] class $5 ($3,$4): cannot redefine the constant attribute `$6'."
	vdrs3a_default_template: STRING is "[$1] class $5 ($3,$4): feature name `$6' appears twice in the Redefine subclause of parent $7."
	vdrs4a_default_template: STRING is "[$1] class $5 ($3,$4): Redefine subclause of $7 lists feature `$6' but it is not redefined."
	vdrs4b_default_template: STRING is "[$1] class $5 ($3,$4): redeclaration of feature `$6' from $7 is an effecting and should not appear in the Redefine subclause."
	vdus1a_default_template: STRING is "[$1] class $5 ($3,$4): `$6' is not the final name of a feature in $7."
	vdus2a_default_template: STRING is "[$1] class $5 ($3,$4): cannot undefine the frozen feature `$6'."
	vdus2b_default_template: STRING is "[$1] class $5 ($3,$4): cannot undefine the attribute `$6'."
	vdus3a_default_template: STRING is "[$1] class $5 ($3,$4): cannot undefine the deferred feature `$6'."
	vdus4a_default_template: STRING is "[$1] class $5 ($3,$4): feature name `$6' appears twice in the Undefine subclause of parent $7."
	veen0a_default_template: STRING is "[$1] class $5 ($3,$4): `$6' appears in feature `$7', but it is not the final name of a feature in class $5 nor the name of a local variable or formal argument of feature `$7'."
	veen2a_default_template: STRING is "[$1] class $5 ($3,$4): entity 'Result' appears in the body, postcondition or rescue clause of a procedure `$6'."
	veen2b_default_template: STRING is "[$1] class $5 ($3,$4): entity 'Result' appears in the precondition of feature `$6'."
	veen2c_default_template: STRING is "[$1] class $5 ($3,$4): local entity `$6' appears in the precondition or postcondition of feature `$7'."
	veen2d_default_template: STRING is "[$1] class $5 ($3,$4): entity 'Result' appears in the invariant of the class."
	vffd4a_default_template: STRING is "[$1] class $5 ($3,$4): deferred feature `$6' is marked as frozen."
	vffd5a_default_template: STRING is "[$1] class $5 ($3,$4): feature `$6' has a Prefix name but is not an attribute or a function with no argument."
	vffd6a_default_template: STRING is "[$1] class $5 ($3,$4): feature `$6' has an Infix name but is not a function with exactly one argument."
	vffd7a_default_template: STRING is "[$1] class $5 ($3,$4): feature `$6' is a once funtion but its type contains an anchored type."
	vffd7b_default_template: STRING is "[$1] class $5 ($3,$4): feature `$6' is a once funtion but its type contains a formal generic parameter."
	vgcc3a_default_template: STRING is "[$1] class $5 ($3,$4): explicit creation type '$6' does not conform to target entity type '$7'."
	vgcc3b_default_template: STRING is "[$1] class $5 ($6,$3,$4): explicit creation type '$7' does not conform to target entity type '$8'."
	vgcc5a_default_template: STRING is "[$1] class $5 ($3,$4): creation expression with no Creation_call part, but $6 has a Creators part."
	vgcc5b_default_template: STRING is "[$1] class $5 ($6,$3,$4): creation expression with no Creation_call part, but $7 has a Creators part."
	vgcc5c_default_template: STRING is "[$1] class $5 ($3,$4): creation instruction with no Creation_call part, but $6 has a Creators part."
	vgcc5d_default_template: STRING is "[$1] class $5 ($6,$3,$4): creation instruction with no Creation_call part, but $7 has a Creators part."
	vgcc6a_default_template: STRING is "[$1] class $5 ($3,$4): `$6' is the final name of a once-procedure."
	vgcc6b_default_template: STRING is "[$1] class $5 ($3,$4): `$6' is not the final name of a procedure in class $8."
	vgcc6d_default_template: STRING is "[$1] class $5 ($3,$4): procedure `$6' of class $8 is not exported for creation to class $5."
	vgcc6e_default_template: STRING is "[$1] class $5 ($6,$3,$4): procedure `$8' of class $9 is not exported for creation to class $5."
	vgcc6f_default_template: STRING is "[$1] class $5 ($3,$4): `$6' is not the final name of a procedure in class $8."
	vgcc6h_default_template: STRING is "[$1] class $5 ($3,$4): procedure `$6' of class $8 is not exported for creation to class $5."
	vgcc6i_default_template: STRING is "[$1] class $5 ($6,$3,$4): procedure `$8' of class $9 is not exported for creation to class $5."
	vgcc8a_default_template: STRING is "[$1] class $5 ($3,$4): procedure `$6' of class $8 is not listed as creation procedure of the $9-th formal generic parameter of class $5."
	vgcc8b_default_template: STRING is "[$1] class $5 ($6,$3,$4): procedure `$8' of class $9 is not listed as creation procedure of the $10-th formal generic parameter of class $5."
	vgcc8c_default_template: STRING is "[$1] class $5 ($3,$4): procedure `$6' of class $8 is not listed as creation procedure of the $9-th formal generic parameter of class $5."
	vgcc8d_default_template: STRING is "[$1] class $5 ($6,$3,$4): procedure `$8' of class $9 is not listed as creation procedure of the $10-th formal generic parameter of class $5."
	vgcp1a_default_template: STRING is "[$1] class $5 ($3,$4): deferred class has a creation clause."
	vgcp2a_default_template: STRING is "[$1] class $5 ($3,$4): `$6' is not the final name of a procedure."
	vgcp2b_default_template: STRING is "[$1] class $5 ($3,$4): `$6' is not the final name of a procedure."
	vgcp3a_default_template: STRING is "[$1] class $5 ($3,$4): procedure name `$6' appears twice in creation clause."
	vgcp3b_default_template: STRING is "[$1] class $5 ($3,$4): procedure name `$6' appears in two different creation clauses."
	vgcp3c_default_template: STRING is "[$1] class $5 ($3,$4): procedure name `$6' appears twice in creation clause of constraint."
	vhay0a_default_template: STRING is "[$1] class $5: implicitly inherits from unknown class ANY."
	vhpr1a_default_template: STRING is "[$1] class $5: inheritance cycle $6."
	vhpr1b_default_template: STRING is "[$1] class $5 ($3, $4): inheritance cycle when inheriting from $6."
	vhpr3a_default_template: STRING is "[$1] class $5 ($3,$4): invalid type '$6' in parent clause."
	vhpr3b_default_template: STRING is "[$1] class $5 ($3,$4): invalid type '$6' in parent clause."
	vhpr3c_default_template: STRING is "[$1] class $5 ($3,$4): invalid type '$6' in parent clause."
	vhrc1a_default_template: STRING is "[$1] class $5 ($3,$4): `$6' is not the final name of a feature in $7."
	vhrc2a_default_template: STRING is "[$1] class $5 ($3,$4): feature name `$6' appears as first element of two Rename_pairs."
	vhrc4a_default_template: STRING is "[$1] class $5 ($3,$4): `$6' is of the Prefix form but `$7' in $8 is not an attribute nor a function with no argument."
	vhrc5a_default_template: STRING is "[$1] class $5 ($3,$4): `$6' is of the Infix form but `$7' in $8 is not a function with one argument."
	vjar0a_default_template: STRING is "[$1] class $5 ($3,$4): the source of the assignment (of type '$6') does not conform to its target entity (of type '$7')."
	vjar0b_default_template: STRING is "[$1] class $5 ($6,$3,$4): the source of the assignment (of type '$7') does not conform to its target entity (of type '$8')."
	vjar0c_default_template: STRING is "[$1] class $5 ($3,$4): the expression (of type '$6') does not conform to type '$7'."
	vjar0d_default_template: STRING is "[$1] class $5 ($6,$3,$4): the expression (of type '$7') does not conform to type '$8'."
	vjaw0a_default_template: STRING is "[$1] class $5 ($3,$4): feature `$6' is not an attribute. A Writable is either a local variable (including Result) or an attribute."
	vjaw0c_default_template: STRING is "[$1] class $5 ($3,$4): `$6' is the name of a formal argument of feature `$7'. A Writable is either a local variable (including Result) or an attribute."
	vjrv0a_default_template: STRING is "[$1] class $5 ($3,$4): the type '$6' of the target entity of the assignment attempt is not a reference type."
	vjrv0b_default_template: STRING is "[$1] class $5 ($6,$3,$4): the type '$7' of the target entity of the assignment attempt is not a reference type."
	vkcn1a_default_template: STRING is "[$1] class $5 ($3,$4): query `$7' of class $8 appears in a call instruction."
	vkcn1c_default_template: STRING is "[$1] class $5 ($3,$4): query `$7' appears in a call instruction."
	vkcn2a_default_template: STRING is "[$1] class $5 ($3,$4): procedure `$7' of class $8 appears in a call expression."
	vkcn2c_default_template: STRING is "[$1] class $5 ($3,$4): procedure `$7' appears in a call expression."
	vlel1a_default_template: STRING is "[$1] class $5 ($3,$4): 'all' keyword appears twice in the Export subclause of parent $6."
	vlel2a_default_template: STRING is "[$1] class $5 ($3,$4): `$6' is not the final name of a feature in $7."
	vlel3a_default_template: STRING is "[$1] class $5 ($3,$4): feature name `$6' appears twice in the Export subclause of parent $7."
	vmfn0a_default_template: STRING is "[$1] class $5 ($3,$4): two features with the same name `$6'."
	vmfn0b_default_template: STRING is "[$1] class $5 ($3,$4): two features with the same name `$6' in current class and `$7' inherited from $8."
	vmfn0c_default_template: STRING is "[$1] class $5 ($3,$4): two features with the same name `$6' inherited from $7 and `$8' inherited from $9."
	vmrc2a_default_template: STRING is "[$1] class $5 ($3,$4): replicated features $6 have not been selected."
	vmrc2b_default_template: STRING is "[$1] class $5 ($3,$4): replicated features $6 have been selected more than once."
	vmss1a_default_template: STRING is "[$1] class $5 ($3,$4): `$6' is not the final name of a feature in $7."
	vmss2a_default_template: STRING is "[$1] class $5 ($3,$4): feature name `$6' appears twice in the Select subclause of parent $7."
	vmss3a_default_template: STRING is "[$1] class $5 ($3,$4): feature name `$6' appears in the Select subclause of parent $7 but is not replicated."
	vomb1a_default_template: STRING is "[$1] class $5 ($3,$4): inspect expression of type '$6' different from INTEGER or CHARACTER."
	vomb1b_default_template: STRING is "[$1] class $5 ($6,$3,$4): inspect expression of type '$7' different from INTEGER or CHARACTER."
	vomb2a_default_template: STRING is "[$1] class $5 ($3,$4): inspect constant of type '$6' different from type '$7' of inspect expression."
	vomb2b_default_template: STRING is "[$1] class $5 ($6,$3,$4): inspect constant of type '$7' different from type '$8' of inspect expression."
	vpca1a_default_template: STRING is "[$1] class $5 ($3,$4): `$6' is not the final name of a feature in class $5."
	vpca1b_default_template: STRING is "[$1] class $5 ($3,$4): `$6' is not the final name of a feature in class $7."
	vpca2a_default_template: STRING is "[$1] class $5 ($3,$4): feature `$7' of class $8 is not exported to class $5."
	vpca2b_default_template: STRING is "[$1] class $5 ($6,$3,$4): feature `$8' of class $9 is not exported to class $5."
	vpca3a_default_template: STRING is "[$1] class $5 ($3,$4): the number of actual arguments is not the same as the number of formal arguments of feature `$7' in class $8."
	vpca3c_default_template: STRING is "[$1] class $5 ($3,$4): the number of actual arguments is not the same as the number of formal arguments of feature `$7'."
	vpca4a_default_template: STRING is "[$1] class $5 ($3,$4): the $9-th actual argument (of type '$10') does not conform to the corresponding formal argument (of type '$11') of feature `$7' in class $8."
	vpca4b_default_template: STRING is "[$1] class $5 ($6,$3,$4): the $10-th actual argument (of type '$11') does not conform to the corresponding formal argument (of type '$12') of feature `$8' in class $9."
	vpca4c_default_template: STRING is "[$1] class $5 ($3,$4): the $8-th actual argument (of type '$9') does not conform to the corresponding formal argument (of type '$10') of feature `$7'."
	vpca4d_default_template: STRING is "[$1] class $5 ($6,$3,$4): the $9-th actual argument (of type '$10') does not conform to the corresponding formal argument (of type '$11') of feature `$8'."
	vpca5a_default_template: STRING is "[$1] class $5 ($3,$4): the type '$10' specified for the $9-th actual argument of Call_agent does not conform to the corresponding formal argument (of type '$11') of feature `$7' in class $8."
	vpca5b_default_template: STRING is "[$1] class $5 ($6,$3,$4): the type '$11' specified for the $10-th actual argument of Call_agent does not conform to the corresponding formal argument (of type '$12') of feature `$8' in class $9."
	vpca5c_default_template: STRING is "[$1] class $5 ($3,$4): the type '$9' specified for the $8-th actual argument of Call_agent does not conform to the corresponding formal argument (of type '$10') of feature `$7'."
	vpca5d_default_template: STRING is "[$1] class $5 ($6,$3,$4): the type '$10' specified for the $9-th actual argument of Call_agent does not conform to the corresponding formal argument (of type '$11') of feature `$8'."
	vqmc1a_default_template: STRING is "[$1] class $5 ($3,$4): boolean constant attribute `$6' is not declared of type BOOLEAN."
	vqmc1b_default_template: STRING is "[$1] class $5 ($6,$3,$4): boolean constant attribute `$7' is not declared of type BOOLEAN."
	vqmc2a_default_template: STRING is "[$1] class $5 ($3,$4): character constant attribute `$6' is not declared of type CHARACTER."
	vqmc2b_default_template: STRING is "[$1] class $5 ($6,$3,$4): character constant attribute `$7' is not declared of type CHARACTER."
	vqmc3a_default_template: STRING is "[$1] class $5 ($3,$4): integer constant attribute `$6' is not declared of type INTEGER."
	vqmc3b_default_template: STRING is "[$1] class $5 ($6,$3,$4): integer constant attribute `$7' is not declared of type INTEGER."
	vqmc4a_default_template: STRING is "[$1] class $5 ($3,$4): real constant attribute `$6' is not declared of type REAL or DOUBLE."
	vqmc4b_default_template: STRING is "[$1] class $5 ($6,$3,$4): real constant attribute `$7' is not declared of type REAL or DOUBLE."
	vqmc5a_default_template: STRING is "[$1] class $5 ($3,$4): string constant attribute `$6' is not declared of type STRING."
	vqmc5b_default_template: STRING is "[$1] class $5 ($6,$3,$4): string constant attribute `$7' is not declared of type STRING."
	vqmc6a_default_template: STRING is "[$1] class $5 ($3,$4): bit constant attribute `$6' is not declared of Bit_type."
	vqmc6b_default_template: STRING is "[$1] class $5 ($6,$3,$4): bit constant attribute `$7' is not declared of Bit_type."
	vqui0a_default_template: STRING is "[$1] class $5 ($3,$4): unique attribute `$6' is not declared of type INTEGER."
	vqui0b_default_template: STRING is "[$1] class $5 ($6,$3,$4): unique attribute `$7' is not declared of type INTEGER."
	vreg0a_default_template: STRING is "[$1] class $5 ($3,$4): argument name '$6' appear twice in feature `$7'."
	vreg0b_default_template: STRING is "[$1] class $5 ($3,$4): local variable name '$6' appear twice in feature `$7'."
	vrfa0a_default_template: STRING is "[$1] class $5 ($3,$4): argument name '$6' in feature `$7' is also the final name of feature."
	vrle1a_default_template: STRING is "[$1] class $5 ($3,$4): local variable name '$6' in feature `$7' is also the final name of feature."
	vrle2a_default_template: STRING is "[$1] class $5 ($3,$4): local variable name '$6' in feature `$7' is also the name of a formal argument of this feature."
	vscn0a_default_template: STRING is "[$1] class $5: class appears in files '$7' and '$9'."
	vtat1a_default_template: STRING is "[$1] class $5 ($3,$4): invalid type '$6': the anchor `$7' must be the final name of a query."
	vtat1b_default_template: STRING is "[$1] class $5 ($3,$4): invalid type '$6': the anchor `$7' must be the final name of a query, or an argument of routine `$8'."
	vtat2a_default_template: STRING is "[$1] class $5 ($3,$4): anchor cycle $6."
	vtbt0a_default_template: STRING is "[$1] class $5 ($3,$4): invalid type '$6': `$7' is not the final name of a constant attribute of type INTEGER."
	vtbt0b_default_template: STRING is "[$1] class $5 ($3,$4): invalid type '$6': `$7' is not the final name of a feature."
	vtbt0c_default_template: STRING is "[$1] class $5 ($3,$4): invalid type '$6': bit size must be a positive integer constant."
	vtbt0d_default_template: STRING is "[$1] class $5 ($3,$4): invalid type '$6': bit size must be a positive integer constant."
	vtcg3a_default_template: STRING is "[$1] class $5 ($3,$4): actual generic parameter '$6' does not conform to constraint '$7'."
	vtcg4a_default_template: STRING is "[$1] class $5 ($3,$4): base class $8 of the $6-th actual generic parameter of $9 does not make feature `$7' available as creation procedure to class $9."
	vtcg4b_default_template: STRING is "[$1] class $5 ($6,$3,$4): base class $9 of the $7-th actual generic parameter of $10 does not make feature `$8' available as creation procedure to class $10."
	vtcg4c_default_template: STRING is "[$1] class $5 ($3,$4): the $6-th actual generic parameter of $9, which is the $8-th formal generic parameter of class $5, does not list feature `$7' as creation procedure in its generic constraint."
	vtcg4d_default_template: STRING is "[$1] class $5 ($6,$3,$4): the $7-th actual generic parameter of $10, which is the $9-th formal generic parameter of class $5, does not list feature `$8' as creation procedure in its generic constraint."
	vtct0a_default_template: STRING is "[$1] class $5 ($3,$4): type based on unknown class $6."
	vtct0b_default_template: STRING is "[$1] class $5 ($3,$4): type based on unknown class $6."
	vtgc0a_default_template: STRING is "[$1] class $5 ($3,$4): `$6' is not the final name of a procedure in constraint's base class $7."
	vtgc0b_default_template: STRING is "[$1] class $5 ($3,$4): `$6' is not the final name of a procedure in constraint's base class $7."
	vtug1a_default_template: STRING is "[$1] class $5 ($3,$4): type '$6' has actual generic parameters but class $7 is not generic."
	vtug2a_default_template: STRING is "[$1] class $5 ($3,$4): type '$6' has wrong number of actual generic parameters."
	vuar1a_default_template: STRING is "[$1] class $5 ($3,$4): the number of actual arguments is not the same as the number of formal arguments of feature `$7' in class $8."
	vuar1c_default_template: STRING is "[$1] class $5 ($3,$4): the number of actual arguments is not the same as the number of formal arguments of feature `$7'."
	vuar2a_default_template: STRING is "[$1] class $5 ($3,$4): the $9-th actual argument (of type '$10') does not conform to the corresponding formal argument (of type '$11') of feature `$7' in class $8."
	vuar2b_default_template: STRING is "[$1] class $5 ($6,$3,$4): the $10-th actual argument (of type '$11') does not conform to the corresponding formal argument (of type '$12') of feature `$8' in class $9."
	vuar2c_default_template: STRING is "[$1] class $5 ($3,$4): the $8-th actual argument (of type '$9') does not conform to the corresponding formal argument (of type '$10') of feature `$7'."
	vuar2d_default_template: STRING is "[$1] class $5 ($6,$3,$4): the $9-th actual argument (of type '$10') does not conform to the corresponding formal argument (of type '$11') of feature `$8'."
	vuar4a_default_template: STRING is "[$1] class $5 ($3,$4): `$6' is not the final name of a feature in class $5."
	vuex1a_default_template: STRING is "[$1] class $5 ($3,$4): `$6' is not the final name of a feature in class $5."
	vuex2a_default_template: STRING is "[$1] class $5 ($3,$4): `$6' is not the final name of a feature in class $7."
	vuex2b_default_template: STRING is "[$1] class $5 ($3,$4): feature `$7' of class $8 is not exported to class $5."
	vuex2c_default_template: STRING is "[$1] class $5 ($6,$3,$4): feature `$8' of class $9 is not exported to class $5."
	vwbe0a_default_template: STRING is "[$1] class $5 ($3,$4): boolean expression of non-BOOLEAN type '$6'."
	vwbe0b_default_template: STRING is "[$1] class $5 ($6,$3,$4): boolean expression of non-BOOLEAN type '$7'."
	vweq0a_default_template: STRING is "[$1] class $5 ($3,$4): none of the operands of '$6' (of types '$7' and '$8') conforms to the other."
	vweq0b_default_template: STRING is "[$1] class $5 ($6,$3,$4): none of the operands of '$7' (of types '$8' and '$9') conforms to the other."
	vwst1a_default_template: STRING is "[$1] class $5 ($3,$4): feature name `$6' is not the final name of a feature in class $5."
	vwst1b_default_template: STRING is "[$1] class $5 ($3,$4): feature name `$6' is not the final name of an attribute in class $5."
	vwst2a_default_template: STRING is "[$1] class $5 ($3,$4): feature name `$6' appears twice in strip expression."
	vxrt0a_default_template: STRING is "[$1] class $5 ($3,$4): Retry instruction does not appear in a Rescue clause."
	gvagp0a_default_template: STRING is "[$1] class $5: ancestors with generic parameter mismatch: '$6' and '$7'."
	gvhpr4a_default_template: STRING is "[$1] class $5: cannot inherit from Bit_type '$6'."
	gvhpr5a_default_template: STRING is "[$1] class $5: cannot inherit from Tuple_type '$6'."
	gvtcg5a_default_template: STRING is "[$1] class $5 ($3,$4): actual generic parameter '$6' is not a reference type but the corresponding formal parameter is marked as reference."
	gvtcg5b_default_template: STRING is "[$1] class $5 ($3,$4): actual generic parameter '$6' is not expanded type but the corresponding formal parameter is marked as expanded."
	gvuaa0a_default_template: STRING is "[$1] class $5 ($3,$4): `$6' is a formal argument of feature `$7' and hence cannot have actual arguments."
	gvual0a_default_template: STRING is "[$1] class $5 ($3,$4): `$6' is a local variable of feature `$7' and hence cannot have actual arguments."
	gvuia0a_default_template: STRING is "[$1] class $5 ($3,$4): `$6' is a formal argument of feature `$7' and hence cannot be an instruction."
	gvuil0a_default_template: STRING is "[$1] class $5 ($3,$4): `$6' is a local variable of feature `$7' and hence cannot be an instruction."
	gvzzz0a_default_template: STRING is "[$1] class $5 ($3,$4): validity error"
			-- Default templates

	vaol1_etl_code: STRING is "VAOL-1"
	vape_etl_code: STRING is "VAPE"
	vave_etl_code: STRING is "VAVE"
	vcch1_etl_code: STRING is "VCCH-1"
	vcch2_etl_code: STRING is "VCCH-2"
	vcfg1_etl_code: STRING is "VCFG-1"
	vcfg2_etl_code: STRING is "VCFG-2"
	vcfg3_etl_code: STRING is "VCFG-3"
	vdjr_etl_code: STRING is "VDJR"
	vdpr1_etl_code: STRING is "VDPR-1"
	vdpr2_etl_code: STRING is "VDPR-2"
	vdpr3_etl_code: STRING is "VDPR-3"
	vdpr4a_etl_code: STRING is "VDPR-4A"
	vdpr4b_etl_code: STRING is "VDPR-4B"
	vdrd2_etl_code: STRING is "VDRD-2"
	vdrd3_etl_code: STRING is "VDRD-3"
	vdrd4_etl_code: STRING is "VDRD-4"
	vdrd5_etl_code: STRING is "VDRD-5"
	vdrd6_etl_code: STRING is "VDRD-6"
	vdrs1_etl_code: STRING is "VDRS-1"
	vdrs2_etl_code: STRING is "VDRS-2"
	vdrs3_etl_code: STRING is "VDRS-3"
	vdrs4_etl_code: STRING is "VDRS-4"
	vdus1_etl_code: STRING is "VDUS-1"
	vdus2_etl_code: STRING is "VDUS-2"
	vdus3_etl_code: STRING is "VDUS-3"
	vdus4_etl_code: STRING is "VDUS-4"
	veen_etl_code: STRING is "VEEN"
	veen2_etl_code: STRING is "VEEN-2"
	vffd4_etl_code: STRING is "VFFD-4"
	vffd5_etl_code: STRING is "VFFD-5"
	vffd6_etl_code: STRING is "VFFD-6"
	vffd7_etl_code: STRING is "VFFD-7"
	vhpr1_etl_code: STRING is "VHPR-1"
	vgcc3_etl_code: STRING is "VGCC-3"
	vgcc5_etl_code: STRING is "VGCC-5"
	vgcc6_etl_code: STRING is "VGCC-6"
	vgcc8_etl_code: STRING is "VGCC-8"
	vgcp1_etl_code: STRING is "VGCP-1"
	vgcp2_etl_code: STRING is "VGCP-2"
	vgcp3_etl_code: STRING is "VGCP-3"
	vhay_etl_code: STRING is "VHAY"
	vhpr3_etl_code: STRING is "VHPR-3"
	vhrc1_etl_code: STRING is "VHRC-1"
	vhrc2_etl_code: STRING is "VHRC-2"
	vhrc4_etl_code: STRING is "VHRC-4"
	vhrc5_etl_code: STRING is "VHRC-5"
	vjar_etl_code: STRING is "VJAR"
	vjaw_etl_code: STRING is "VJAW"
	vjrv_etl_code: STRING is "VJRV"
	vkcn1_etl_code: STRING is "VKCN-1"
	vkcn2_etl_code: STRING is "VKCN-2"
	vlel1_etl_code: STRING is "VLEL-1"
	vlel2_etl_code: STRING is "VLEL-2"
	vlel3_etl_code: STRING is "VLEL-3"
	vmfn_etl_code: STRING is "VMFN"
	vmrc2_etl_code: STRING is "VMRC-2"
	vmss1_etl_code: STRING is "VMSS-1"
	vmss2_etl_code: STRING is "VMSS-2"
	vmss3_etl_code: STRING is "VMSS-3"
	vomb1_etl_code: STRING is "VOMB-1"
	vomb2_etl_code: STRING is "VOMB-2"
	vpca1_etl_code: STRING is "VPCA-1"
	vpca2_etl_code: STRING is "VPCA-2"
	vpca3_etl_code: STRING is "VPCA-3"
	vpca4_etl_code: STRING is "VPCA-4"
	vpca5_etl_code: STRING is "VPCA-5"
	vqmc1_etl_code: STRING is "VQMC-1"
	vqmc2_etl_code: STRING is "VQMC-2"
	vqmc3_etl_code: STRING is "VQMC-3"
	vqmc4_etl_code: STRING is "VQMC-4"
	vqmc5_etl_code: STRING is "VQMC-5"
	vqmc6_etl_code: STRING is "VQMC-6"
	vqui_etl_code: STRING is "VQUI"
	vreg_etl_code: STRING is "VREG"
	vrfa_etl_code: STRING is "VRFA"
	vrle1_etl_code: STRING is "VRLE-1"
	vrle2_etl_code: STRING is "VRLE-2"
	vscn_etl_code: STRING is "VSCN"
	vtat1_etl_code: STRING is "VTAT-1"
	vtat2_etl_code: STRING is "VTAT-2"
	vtbt_etl_code: STRING is "VTBT"
	vtcg3_etl_code: STRING is "VTCG-3"
	vtcg4_etl_code: STRING is "VTCG-4"
	vtct_etl_code: STRING is "VTCT"
	vtgc_etl_code: STRING is "VTGC"
	vtug1_etl_code: STRING is "VTUG-1"
	vtug2_etl_code: STRING is "VTUG-2"
	vuar1_etl_code: STRING is "VUAR-1"
	vuar2_etl_code: STRING is "VUAR-2"
	vuar4_etl_code: STRING is "VUAR-4"
	vuex1_etl_code: STRING is "VUEX-1"
	vuex2_etl_code: STRING is "VUEX-2"
	vwbe_etl_code: STRING is "VWBE"
	vweq_etl_code: STRING is "VWEQ"
	vwst1_etl_code: STRING is "VWST-1"
	vwst2_etl_code: STRING is "VWST-2"
	vxrt_etl_code: STRING is "VXRT"
	gvagp_etl_code: STRING is "GVAGP"
	gvhpr4_etl_code: STRING is "GVHPR-4"
	gvhpr5_etl_code: STRING is "GVHPR-5"
	gvtcg5_etl_code: STRING is "GVTCG-5"
	gvuaa_etl_code: STRING is "GVUAA"
	gvual_etl_code: STRING is "GVUAL"
	gvuia_etl_code: STRING is "GVUIA"
	gvuil_etl_code: STRING is "GVUIL"
	gvzzz_etl_code: STRING is "GVZZZ"
			-- ETL validity codes

	vaol1a_template_code: STRING is "vaol1a"
	vape0a_template_code: STRING is "vape0a"
	vape0b_template_code: STRING is "vape0b"
	vape0c_template_code: STRING is "vape0c"
	vape0d_template_code: STRING is "vape0d"
	vape0e_template_code: STRING is "vape0e"
	vape0f_template_code: STRING is "vape0f"
	vape0g_template_code: STRING is "vape0g"
	vape0h_template_code: STRING is "vape0h"
	vave0a_template_code: STRING is "vave0a"
	vave0b_template_code: STRING is "vave0b"
	vcch1a_template_code: STRING is "vcch1a"
	vcch1b_template_code: STRING is "vcch1b"
	vcch2a_template_code: STRING is "vcch2a"
	vcfg1a_template_code: STRING is "vcfg1a"
	vcfg2a_template_code: STRING is "vcfg2a"
	vcfg3a_template_code: STRING is "vcfg3a"
	vcfg3b_template_code: STRING is "vcfg3b"
	vcfg3c_template_code: STRING is "vcfg3c"
	vcfg3d_template_code: STRING is "vcfg3d"
	vcfg3e_template_code: STRING is "vcfg3e"
	vcfg3g_template_code: STRING is "vcfg3g"
	vcfg3h_template_code: STRING is "vcfg3h"
	vcfg3j_template_code: STRING is "vcfg3j"
	vdjr0a_template_code: STRING is "vdjr0a"
	vdjr0b_template_code: STRING is "vdjr0b"
	vdjr0c_template_code: STRING is "vdjr0c"
	vdpr1a_template_code: STRING is "vdpr1a"
	vdpr1b_template_code: STRING is "vdpr1b"
	vdpr2a_template_code: STRING is "vdpr2a"
	vdpr3a_template_code: STRING is "vdpr3a"
	vdpr3b_template_code: STRING is "vdpr3b"
	vdpr3c_template_code: STRING is "vdpr3c"
	vdpr3d_template_code: STRING is "vdpr3d"
	vdpr4a_template_code: STRING is "vdpr4a"
	vdpr4c_template_code: STRING is "vdpr4c"
	vdpr4d_template_code: STRING is "vdpr4d"
	vdrd2a_template_code: STRING is "vdrd2a"
	vdrd2b_template_code: STRING is "vdrd2b"
	vdrd2c_template_code: STRING is "vdrd2c"
	vdrd2d_template_code: STRING is "vdrd2d"
	vdrd3a_template_code: STRING is "vdrd3a"
	vdrd3b_template_code: STRING is "vdrd3b"
	vdrd4a_template_code: STRING is "vdrd4a"
	vdrd4b_template_code: STRING is "vdrd4b"
	vdrd4c_template_code: STRING is "vdrd4c"
	vdrd5a_template_code: STRING is "vdrd5a"
	vdrd6a_template_code: STRING is "vdrd6a"
	vdrd6b_template_code: STRING is "vdrd6b"
	vdrs1a_template_code: STRING is "vdrs1a"
	vdrs2a_template_code: STRING is "vdrs2a"
	vdrs2b_template_code: STRING is "vdrs2b"
	vdrs3a_template_code: STRING is "vdrs3a"
	vdrs4a_template_code: STRING is "vdrs4a"
	vdrs4b_template_code: STRING is "vdrs4b"
	vdus1a_template_code: STRING is "vdus1a"
	vdus2a_template_code: STRING is "vdus2a"
	vdus2b_template_code: STRING is "vdus2b"
	vdus3a_template_code: STRING is "vdus3a"
	vdus4a_template_code: STRING is "vdus4a"
	veen0a_template_code: STRING is "veen0a"
	veen2a_template_code: STRING is "veen2a"
	veen2b_template_code: STRING is "veen2b"
	veen2c_template_code: STRING is "veen2c"
	veen2d_template_code: STRING is "veen2d"
	vffd4a_template_code: STRING is "vffd4a"
	vffd5a_template_code: STRING is "vffd5a"
	vffd6a_template_code: STRING is "vffd6a"
	vffd7a_template_code: STRING is "vffd7a"
	vffd7b_template_code: STRING is "vffd7b"
	vgcc3a_template_code: STRING is "vgcc3a"
	vgcc3b_template_code: STRING is "vgcc3b"
	vgcc5a_template_code: STRING is "vgcc5a"
	vgcc5b_template_code: STRING is "vgcc5b"
	vgcc5c_template_code: STRING is "vgcc5c"
	vgcc5d_template_code: STRING is "vgcc5d"
	vgcc6a_template_code: STRING is "vgcc6a"
	vgcc6b_template_code: STRING is "vgcc6b"
	vgcc6d_template_code: STRING is "vgcc6d"
	vgcc6e_template_code: STRING is "vgcc6e"
	vgcc6f_template_code: STRING is "vgcc6f"
	vgcc6h_template_code: STRING is "vgcc6h"
	vgcc6i_template_code: STRING is "vgcc6i"
	vgcc8a_template_code: STRING is "vgcc8a"
	vgcc8b_template_code: STRING is "vgcc8b"
	vgcc8c_template_code: STRING is "vgcc8c"
	vgcc8d_template_code: STRING is "vgcc8d"
	vgcp1a_template_code: STRING is "vgcp1a"
	vgcp2a_template_code: STRING is "vgcp2a"
	vgcp2b_template_code: STRING is "vgcp2b"
	vgcp3a_template_code: STRING is "vgcp3a"
	vgcp3b_template_code: STRING is "vgcp3b"
	vgcp3c_template_code: STRING is "vgcp3c"
	vhay0a_template_code: STRING is "vhay0a"
	vhpr1a_template_code: STRING is "vhpr1a"
	vhpr1b_template_code: STRING is "vhpr1b"
	vhpr3a_template_code: STRING is "vhpr3a"
	vhpr3b_template_code: STRING is "vhpr3b"
	vhpr3c_template_code: STRING is "vhpr3c"
	vhrc1a_template_code: STRING is "vhrc1a"
	vhrc2a_template_code: STRING is "vhrc2a"
	vhrc4a_template_code: STRING is "vhrc4a"
	vhrc5a_template_code: STRING is "vhrc5a"
	vjar0a_template_code: STRING is "vjar0a"
	vjar0b_template_code: STRING is "vjar0b"
	vjar0c_template_code: STRING is "vjar0c"
	vjar0d_template_code: STRING is "vjar0d"
	vjaw0a_template_code: STRING is "vjaw0a"
	vjaw0c_template_code: STRING is "vjaw0c"
	vjrv0a_template_code: STRING is "vjrv0a"
	vjrv0b_template_code: STRING is "vjrv0b"
	vkcn1a_template_code: STRING is "vkcn1a"
	vkcn1c_template_code: STRING is "vkcn1c"
	vkcn2a_template_code: STRING is "vkcn2a"
	vkcn2c_template_code: STRING is "vkcn2c"
	vlel1a_template_code: STRING is "vlel1a"
	vlel2a_template_code: STRING is "vlel2a"
	vlel3a_template_code: STRING is "vlel3a"
	vmfn0a_template_code: STRING is "vmfn0a"
	vmfn0b_template_code: STRING is "vmfn0b"
	vmfn0c_template_code: STRING is "vmfn0c"
	vmrc2a_template_code: STRING is "vmrc2a"
	vmrc2b_template_code: STRING is "vmrc2b"
	vmss1a_template_code: STRING is "vmss1a"
	vmss2a_template_code: STRING is "vmss2a"
	vmss3a_template_code: STRING is "vmss3a"
	vomb1a_template_code: STRING is "vomb1a"
	vomb1b_template_code: STRING is "vomb1b"
	vomb2a_template_code: STRING is "vomb2a"
	vomb2b_template_code: STRING is "vomb2b"
	vpca1a_template_code: STRING is "vpca1a"
	vpca1b_template_code: STRING is "vpca1b"
	vpca2a_template_code: STRING is "vpca2a"
	vpca2b_template_code: STRING is "vpca2b"
	vpca3a_template_code: STRING is "vpca3a"
	vpca3c_template_code: STRING is "vpca3c"
	vpca4a_template_code: STRING is "vpca4a"
	vpca4b_template_code: STRING is "vpca4b"
	vpca4c_template_code: STRING is "vpca4c"
	vpca4d_template_code: STRING is "vpca4d"
	vpca5a_template_code: STRING is "vpca5a"
	vpca5b_template_code: STRING is "vpca5b"
	vpca5c_template_code: STRING is "vpca5c"
	vpca5d_template_code: STRING is "vpca5d"
	vqmc1a_template_code: STRING is "vqmc1a"
	vqmc1b_template_code: STRING is "vqmc1b"
	vqmc2a_template_code: STRING is "vqmc2a"
	vqmc2b_template_code: STRING is "vqmc2b"
	vqmc3a_template_code: STRING is "vqmc3a"
	vqmc3b_template_code: STRING is "vqmc3b"
	vqmc4a_template_code: STRING is "vqmc4a"
	vqmc4b_template_code: STRING is "vqmc4b"
	vqmc5a_template_code: STRING is "vqmc5a"
	vqmc5b_template_code: STRING is "vqmc5b"
	vqmc6a_template_code: STRING is "vqmc6a"
	vqmc6b_template_code: STRING is "vqmc6b"
	vqui0a_template_code: STRING is "vqui0a"
	vqui0b_template_code: STRING is "vqui0b"
	vreg0a_template_code: STRING is "vreg0a"
	vreg0b_template_code: STRING is "vreg0b"
	vrfa0a_template_code: STRING is "vrfa0a"
	vrle1a_template_code: STRING is "vrle1a"
	vrle2a_template_code: STRING is "vrle2a"
	vscn0a_template_code: STRING is "vscn0a"
	vtat1a_template_code: STRING is "vtat1a"
	vtat1b_template_code: STRING is "vtat1b"
	vtat2a_template_code: STRING is "vtat2a"
	vtbt0a_template_code: STRING is "vtbt0a"
	vtbt0b_template_code: STRING is "vtbt0b"
	vtbt0c_template_code: STRING is "vtbt0c"
	vtbt0d_template_code: STRING is "vtbt0d"
	vtcg3a_template_code: STRING is "vtcg3a"
	vtcg4a_template_code: STRING is "vtcg4a"
	vtcg4b_template_code: STRING is "vtcg4b"
	vtcg4c_template_code: STRING is "vtcg4c"
	vtcg4d_template_code: STRING is "vtcg4d"
	vtct0a_template_code: STRING is "vtct0a"
	vtct0b_template_code: STRING is "vtct0b"
	vtgc0a_template_code: STRING is "vtgc0a"
	vtgc0b_template_code: STRING is "vtgc0b"
	vtug1a_template_code: STRING is "vtug1a"
	vtug2a_template_code: STRING is "vtug2a"
	vuar1a_template_code: STRING is "vuar1a"
	vuar1c_template_code: STRING is "vuar1c"
	vuar2a_template_code: STRING is "vuar2a"
	vuar2b_template_code: STRING is "vuar2b"
	vuar2c_template_code: STRING is "vuar2c"
	vuar2d_template_code: STRING is "vuar2d"
	vuar4a_template_code: STRING is "vuar4a"
	vuex1a_template_code: STRING is "vuex1a"
	vuex2a_template_code: STRING is "vuex2a"
	vuex2b_template_code: STRING is "vuex2b"
	vuex2c_template_code: STRING is "vuex2c"
	vwbe0a_template_code: STRING is "vwbe0a"
	vwbe0b_template_code: STRING is "vwbe0b"
	vweq0a_template_code: STRING is "vweq0a"
	vweq0b_template_code: STRING is "vweq0b"
	vwst1a_template_code: STRING is "vwst1a"
	vwst1b_template_code: STRING is "vwst1b"
	vwst2a_template_code: STRING is "vwst2a"
	vxrt0a_template_code: STRING is "vxrt0a"
	gvagp0a_template_code: STRING is "gvagp0a"
	gvhpr4a_template_code: STRING is "gvhpr4a"
	gvhpr5a_template_code: STRING is "gvhpr5a"
	gvtcg5a_template_code: STRING is "gvtcg5a"
	gvtcg5b_template_code: STRING is "gvtcg5b"
	gvuaa0a_template_code: STRING is "gvuaa0a"
	gvual0a_template_code: STRING is "gvual0a"
	gvuia0a_template_code: STRING is "gvuia0a"
	gvuil0a_template_code: STRING is "gvuil0a"
	gvzzz0a_template_code: STRING is "gvzzz0a"
			-- Template error codes

invariant

	current_class_not_void: current_class /= Void
	class_impl_preparsed: class_impl.is_preparsed

end
