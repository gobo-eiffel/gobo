note

	description:

		"Eiffel validity errors"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2012, Eric Bezault and others"
	license: "MIT License"
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
	make_vave0a,
	make_vbac1a,
	make_vbac2a,
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
	make_vdjr2a,
	make_vdjr2b,
	make_vdpr1a,
	make_vdpr1b,
	make_vdpr2a,
	make_vdpr3a,
	make_vdpr3b,
	make_vdpr3c,
	make_vdpr3d,
	make_vdpr3e,
	make_vdpr4a,
	make_vdpr4b,
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
	make_vdrd7a,
	make_vdrd7b,
	make_vdrd7c,
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
	make_veen0b,
	make_veen2a,
	make_veen2b,
	make_veen2c,
	make_veen2d,
	make_veen2e,
	make_veen2f,
	make_veen2g,
	make_veen8a,
	make_veen8b,
	make_veen9a,
	make_veen9b,
	make_vevi0a,
	make_vevi0b,
	make_vevi0c,
	make_vevi0d,
	make_vevi0e,
	make_vfac1a,
	make_vfac1b,
	make_vfac2a,
	make_vfac3a,
	make_vfac4a,
	make_vfav1a,
	make_vfav1b,
	make_vfav1c,
	make_vfav1d,
	make_vfav1e,
	make_vfav1f,
	make_vfav1g,
	make_vfav1h,
	make_vfav2a,
	make_vfav2b,
	make_vfav2c,
	make_vfav2d,
	make_vffd4a,
	make_vffd5a,
	make_vffd6a,
	make_vffd7a,
	make_vffd7b,
	make_vgcc1a,
	make_vgcc1b,
	make_vgcc3a,
	make_vgcc5a,
	make_vgcc5b,
	make_vgcc6a,
	make_vgcc6b,
	make_vgcc6c,
	make_vgcc6d,
	make_vgcc6e,
	make_vgcc8a,
	make_vgcc8b,
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
	make_vhrc4b,
	make_vhrc4c,
	make_vhrc4d,
	make_vhrc5a,
	make_vjar0a,
	make_vjaw0a,
	make_vjaw0b,
	make_vjaw0c,
	make_vjrv0a,
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
	make_vmfn2a,
	make_vmfn2b,
	make_vmrc2a,
	make_vmrc2b,
	make_vmss1a,
	make_vmss2a,
	make_vmss3a,
	make_voit1a,
	make_voit2a,
	make_voit2b,
	make_voit2c,
	make_voit2d,
	make_voit2e,
	make_vomb1a,
	make_vomb2a,
	make_vomb2b,
	make_vpca1a,
	make_vpca1b,
	make_vpca2a,
	make_vpca3a,
	make_vpca3b,
	make_vpca4a,
	make_vpca4b,
	make_vpca5a,
	make_vpca5b,
	make_vpir1a,
	make_vpir1b,
	make_vpir1c,
	make_vpir1d,
	make_vpir1e,
	make_vpir1f,
	make_vpir1g,
	make_vpir1h,
	make_vpir3a,
	make_vpir3b,
	make_vqmc1a,
	make_vqmc2a,
	make_vqmc3a,
	make_vqmc3b,
	make_vqmc4a,
	make_vqmc5a,
	make_vqmc6a,
	make_vqui0a,
	make_vred0a,
	make_vred0b,
	make_vred0c,
	make_vred0d,
	make_vreg0a,
	make_vreg0b,
	make_vrfa0a,
	make_vrfa0b,
	make_vrle1a,
	make_vrle2a,
	make_vrlv1a,
	make_vrlv1b,
	make_vrlv2a,
	make_vrlv2b,
	make_vtat1a,
	make_vtat1b,
	make_vtat1c,
	make_vtat2a,
	make_vtat2b,
	make_vtbt0a,
	make_vtbt0b,
	make_vtbt0c,
	make_vtbt0d,
	make_vtcg3a,
	make_vtcg4a,
	make_vtcg4b,
	make_vtct0a,
	make_vtct0b,
	make_vtgc0a,
	make_vtgc0b,
	make_vtug1a,
	make_vtug2a,
	make_vuar1a,
	make_vuar1b,
	make_vuar1c,
	make_vuar2a,
	make_vuar2b,
	make_vuar4a,
	make_vuex1a,
	make_vuex2a,
	make_vuex2b,
	make_vuot1a,
	make_vuot1b,
	make_vuot1c,
	make_vuot1d,
	make_vuot1e,
	make_vuot1f,
	make_vuot3a,
	make_vuot3b,
	make_vuot4a,
	make_vuot4b,
	make_vuta2a,
	make_vuta2b,
	make_vvok1a,
	make_vvok2a,
	make_vwbe0a,
	make_vweq0a,
	make_vweq0b,
	make_vwmq0a,
	make_vwmq0b,
	make_vwmq0c,
	make_vwmq0d,
	make_vwst1a,
	make_vwst1b,
	make_vwst2a,
	make_vxrt0a,
	make_gvagp0a,
	make_gvhpr4a,
	make_gvhpr5a,
	make_gvhso1a,
	make_gvhso2a,
	make_gvkbs0a,
	make_gvkbu1a,
	make_gvkfe1a,
	make_gvkfe2a,
	make_gvkfe3a,
	make_gvkfe4a,
	make_gvkfe5a,
	make_gvscn1a,
	make_gvscn1b,
	make_gvtcg5a,
	make_gvtcg5b,
	make_gvuaa0a,
	make_gvuaa0b,
	make_gvual0a,
	make_gvual0b,
	make_gvuia0a,
	make_gvuia0b,
	make_gvuil0a,
	make_gvuil0b,
	make_gvwmc2a

feature {NONE} -- Initialization

	make (a_class: ET_CLASS; a_position: like position)
			-- Create a new Eiffel validity error in `a_class' at `a_position'.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_position_not_void: a_position /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_position
			code := template_code (gvzzz0a_template_code)
			etl_code := gvzzz_etl_code
			default_template := default_message_template (gvzzz0a_default_template)
			create parameters.make_filled (empty_string, 1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
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
			-- dollar6: $6 = implementation class name
		end

	make_vaol1a (a_class: ET_CLASS; an_expression: ET_OLD_EXPRESSION)
			-- Create a new VAOL-1 error: `an_expression', found in `a_class',
			-- does not appear in a postcondition.
			--
			-- ETL2: p.124
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_expression_not_void: an_expression /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := an_expression.position
			code := template_code (vaol1a_template_code)
			etl_code := vaol1_etl_code
			default_template := default_message_template (vaol1a_default_template)
			create parameters.make_filled (empty_string, 1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
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
		end

	make_vape0a (a_class, a_class_impl: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE; a_pre_feature: ET_FEATURE; a_client: ET_CLIENT)
			-- Create a new VAPE error: `a_feature' named `a_name', appearing in an unqualified
			-- call in a precondition of `a_pre_feature' in `a_class_impl' and viewed from
			-- one of its descendants `a_class' (possibly itself), is not exported to class
			-- `a_client' to which `a_pre_feature' is exported.
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
			current_class := a_class
			class_impl := a_class_impl
			position := a_name.position
			code := template_code (vape0a_template_code)
			etl_code := vape_etl_code
			default_template := default_message_template (vape0a_default_template)
			create parameters.make_filled (empty_string, 1, 10)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
			parameters.put (a_feature.lower_name, 8)
			parameters.put (a_pre_feature.lower_name, 9)
			parameters.put (a_client.name.upper_name, 10)
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

	make_vape0b (a_class, a_class_impl: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE; a_target_class: ET_CLASS; a_pre_feature: ET_FEATURE; a_client: ET_CLIENT)
			-- Create a new VAPE error: `a_feature' named `a_name', appearing in a qualified
			-- call with target's base class `a_target_class' in a precondition of
			-- `a_pre_feature' in `a_class_impl' and view from one of its descendants
			-- a_class' (possibly itself), is not exported to class `a_client' to which
			-- `a_pre_feature' is exported.
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
			current_class := a_class
			class_impl := a_class_impl
			position := a_name.position
			code := template_code (vape0b_template_code)
			etl_code := vape_etl_code
			default_template := default_message_template (vape0b_default_template)
			create parameters.make_filled (empty_string, 1, 11)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
			parameters.put (a_feature.lower_name, 8)
			parameters.put (a_target_class.upper_name, 9)
			parameters.put (a_pre_feature.lower_name, 10)
			parameters.put (a_client.name.upper_name, 11)
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

	make_vave0a (a_class, a_class_impl: ET_CLASS; an_expression: ET_EXPRESSION; a_type: ET_NAMED_TYPE)
			-- Create a new VAVE error: the expression `an_expression' of a
			-- loop variant in `a_class_impl' and viewed from one of its
			-- descendants `a_class' (possibly itself) is of type `a_type'
			-- which is not "INTEGER".
			--
			-- ETL2: p.130
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			an_expression_not_void: an_expression /= Void
			a_type_not_void: a_type /= Void
		do
			current_class := a_class
			class_impl := a_class_impl
			position := an_expression.position
			code := template_code (vave0a_template_code)
			etl_code := vave_etl_code
			default_template := default_message_template (vave0a_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
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

	make_vbac1a (a_class, a_class_impl: ET_CLASS; an_assigner: ET_ASSIGNER_INSTRUCTION; a_source_type, a_target_type: ET_NAMED_TYPE)
			-- Create a new VBAC-1 error: the source expression of `an_assigner' in
			-- `a_class_impl' and viewed from one of its descendants `a_class'
			-- (possibly itself) does not conform nor convert to its target.
			--
			-- ECMA 367-2: p.119
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			an_assigner_not_void: an_assigner /= Void
			a_source_type_not_void: a_source_type /= Void
			a_source_type_is_named_type: a_source_type.is_named_type
			a_target_type_not_void: a_target_type /= Void
			a_target_type_is_named_type: a_target_type.is_named_type
		do
			current_class := a_class
			class_impl := a_class_impl
			position := an_assigner.source.position
			code := template_code (vbac1a_template_code)
			etl_code := vbac1_etl_code
			default_template := default_message_template (vbac1a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
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

	make_vbac2a (a_class: ET_CLASS; an_assigner: ET_ASSIGNER_INSTRUCTION; a_query: ET_QUERY; a_query_class: ET_CLASS)
			-- Create a new VBAC-2 error: `a_query' from class `a_query_class', used
			-- as query of the call in the assigner instruction `an_assigner', has
			-- no associated assigner command.
			--
			-- ECMA 367-2: p.119
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_assigner_not_void: an_assigner /= Void
			a_query_not_void: a_query /= Void
			a_query_class_not_void: a_query_class /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := an_assigner.call.name.position
			code := template_code (vbac2a_template_code)
			etl_code := vbac2_etl_code
			default_template := default_message_template (vbac2a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_query.lower_name, 7)
			parameters.put (a_query_class.upper_name, 8)
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
			-- dollar7: $7 = name of the query
			-- dollar8: $8 = name of the class to which the query belongs
		end

	make_vcch1a (a_class: ET_CLASS; f: ET_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := f.name.position
			code := template_code (vcch1a_template_code)
			etl_code := vcch1_etl_code
			default_template := default_message_template (vcch1a_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f.lower_name, 7)
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
			-- dollar7: $7 = feature name
		end

	make_vcch1b (a_class: ET_CLASS; f: ET_INHERITED_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			if f.parent_feature.has_undefine then
				position := f.parent_feature.undefine_name.position
			else
				position := f.parent_feature.parent.type.name.position
			end
			code := template_code (vcch1a_template_code)
			etl_code := vcch1_etl_code
			default_template := default_message_template (vcch1a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f.name.lower_name, 7)
			parameters.put (f.parent_feature.parent.type.upper_name, 8)
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
			-- dollar7: $7 = feature name
			-- dollar8: $8 = parent base class
		end

	make_vcch2a (a_class: ET_CLASS)
			-- Create a new VCCH-2 error: `a_class' is marked as deferred
			-- but has no deferred feature.
			--
			-- ETL2: p.51
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_class_deferred: a_class.has_deferred_mark
		do
			current_class := a_class
			class_impl := a_class
			position := a_class.class_mark.position
			code := template_code (vcch2a_template_code)
			etl_code := vcch2_etl_code
			default_template := default_message_template (vcch2a_default_template)
			create parameters.make_filled (empty_string, 1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
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
		end

	make_vcfg1a (a_class: ET_CLASS; a_formal: ET_FORMAL_PARAMETER; other_class: ET_CLASS)
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
			current_class := a_class
			class_impl := a_class
			position := a_formal.name.position
			code := template_code (vcfg1a_template_code)
			etl_code := vcfg1_etl_code
			default_template := default_message_template (vcfg1a_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_formal.upper_name, 7)
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
			-- dollar7: $7 = formal parameter
		end

	make_vcfg2a (a_class: ET_CLASS; a_formal1, a_formal2: ET_FORMAL_PARAMETER)
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
			current_class := a_class
			class_impl := a_class
			position := a_formal1.name.position
			code := template_code (vcfg2a_template_code)
			etl_code := vcfg2_etl_code
			default_template := default_message_template (vcfg2a_default_template)
			create parameters.make_filled (empty_string, 1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_formal1.upper_name, 7)
			parameters.put (a_formal1.index.out, 8)
			parameters.put (a_formal2.index.out, 9)
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
			-- dollar7: $7 = first formal name
			-- dollar8: $8 = first formal index
			-- dollar9: $9 = second formal index
		end

	make_vcfg3a (a_class: ET_CLASS; a_type: ET_BIT_FEATURE)
			-- Create a new VCFG-3 error: invalid type `a_type' in
			-- constraint of formal generic parameter of `a_class'.
			--
			-- ETR: p.16
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_type.position
			code := template_code (vcfg3a_template_code)
			etl_code := vcfg3_etl_code
			default_template := default_message_template (vcfg3a_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
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
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = invalid type
		end

	make_vcfg3b (a_class: ET_CLASS; a_type: ET_BIT_N)
			-- Create a new VCFG-3 error: invalid type `a_type' in
			-- constraint of formal generic parameter of `a_class'.
			--
			-- ETR: p.16
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_type.position
			code := template_code (vcfg3b_template_code)
			etl_code := vcfg3_etl_code
			default_template := default_message_template (vcfg3b_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
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
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = invalid type
		end

	make_vcfg3c (a_class: ET_CLASS; a_type: ET_LIKE_TYPE)
			-- Create a new VCFG-3 error: invalid type `a_type' in
			-- constraint of formal generic parameter of `a_class'.
			--
			-- ETR: p.16
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_type.position
			code := template_code (vcfg3c_template_code)
			etl_code := vcfg3_etl_code
			default_template := default_message_template (vcfg3c_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
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
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = invalid type
		end

	make_vcfg3d (a_class: ET_CLASS; a_formal: ET_FORMAL_PARAMETER; a_constraint: ET_FORMAL_PARAMETER_TYPE)
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
			current_class := a_class
			class_impl := a_class
			position := a_constraint.position
			code := template_code (vcfg3d_template_code)
			etl_code := vcfg3_etl_code
			default_template := default_message_template (vcfg3d_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_formal.upper_name, 7)
			parameters.put (a_constraint.to_text, 8)
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
			-- dollar7: $7 = formal parameter
			-- dollar8: $8 = constraint
		end

	make_vcfg3e (a_class: ET_CLASS; a_formal: ET_FORMAL_PARAMETER; a_constraint: ET_FORMAL_PARAMETER_TYPE)
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
			current_class := a_class
			class_impl := a_class
			position := a_constraint.position
			code := template_code (vcfg3e_template_code)
			etl_code := vcfg3_etl_code
			default_template := default_message_template (vcfg3e_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_formal.upper_name, 7)
			parameters.put (a_constraint.to_text, 8)
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
			-- dollar7: $7 = formal parameter
			-- dollar8: $8 = constraint
		end

	make_vcfg3g (a_class: ET_CLASS; a_cycle: DS_LIST [ET_FORMAL_PARAMETER])
			-- Create a new VCFG-3 error: the constraints of the formal
			-- generic parameters `a_cycle' of `a_class' are involved
			-- in a cycle.
			--
			-- ETR: p.16
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_cyle_not_void: a_cycle /= Void
			no_void_formal: not a_cycle.has_void
			is_cycle: a_cycle.count >= 2
		local
			a_cursor: DS_LIST_CURSOR [ET_FORMAL_PARAMETER]
			a_string: STRING
		do
			current_class := a_class
			class_impl := a_class
			position := a_cycle.first.name.position
			code := template_code (vcfg3g_template_code)
			etl_code := vcfg3_etl_code
			default_template := default_message_template (vcfg3g_default_template)
			from
				create a_string.make (20)
				a_cursor := a_cycle.new_cursor
				a_cursor.start
				a_string.append_string (a_cursor.item.upper_name)
				a_cursor.forth
			until
				a_cursor.after
			loop
				a_string.append_string (" -> ")
				a_string.append_string (a_cursor.item.upper_name)
				a_cursor.forth
			end
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_string, 7)
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
			-- dollar7: $7 = cycle
		end

	make_vcfg3h (a_class: ET_CLASS; a_formal: ET_FORMAL_PARAMETER; a_type: ET_FORMAL_PARAMETER_TYPE)
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
			current_class := a_class
			class_impl := a_class
			position := a_type.position
			code := template_code (vcfg3h_template_code)
			etl_code := vcfg3_etl_code
			default_template := default_message_template (vcfg3h_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_formal.upper_name, 7)
			parameters.put (a_type.to_text, 8)
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
			-- dollar7: $7 = formal parameter
			-- dollar8: $8 = formal type in constraint
		end

	make_vcfg3j (a_class: ET_CLASS; a_cycle: DS_LIST [ET_FORMAL_PARAMETER])
			-- Create a new VCFG-3 error: the constraints of the formal
			-- generic parameters `a_cycle' of `a_class' are involved
			-- in a cycle.
			--
			-- ETR: p.16
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_cyle_not_void: a_cycle /= Void
			no_void_formal: not a_cycle.has_void
			is_cycle: a_cycle.count >= 2
		local
			a_cursor: DS_LIST_CURSOR [ET_FORMAL_PARAMETER]
			a_string: STRING
		do
			current_class := a_class
			class_impl := a_class
			position := a_cycle.first.name.position
			code := template_code (vcfg3j_template_code)
			etl_code := vcfg3_etl_code
			default_template := default_message_template (vcfg3j_default_template)
			from
				create a_string.make (20)
				a_cursor := a_cycle.new_cursor
				a_cursor.start
				a_string.append_string (a_cursor.item.upper_name)
				a_cursor.forth
			until
				a_cursor.after
			loop
				a_string.append_string (" -> ")
				a_string.append_string (a_cursor.item.upper_name)
				a_cursor.forth
			end
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_string, 7)
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
			-- dollar7: $7 = cycle
		end

	make_vdjr0a (a_class: ET_CLASS; f1, f2: ET_PARENT_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := f1.parent.type.name.position
			code := template_code (vdjr0a_template_code)
			etl_code := vdjr_etl_code
			default_template := default_message_template (vdjr0a_default_template)
			create parameters.make_filled (empty_string, 1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f1.name.lower_name, 7)
			parameters.put (f1.parent.type.upper_name, 8)
			parameters.put (f2.parent.type.upper_name, 9)
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
			-- dollar7: $7 = feature name
			-- dollar8: $8 = first parent base class
			-- dollar9: $9 = second parent base class
		end

	make_vdjr0b (a_class: ET_CLASS; f1, f2: ET_PARENT_FEATURE; arg: INTEGER)
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
			current_class := a_class
			class_impl := a_class
			position := f1.parent.type.name.position
			code := template_code (vdjr0b_template_code)
			etl_code := vdjr_etl_code
			default_template := default_message_template (vdjr0b_default_template)
			create parameters.make_filled (empty_string, 1, 10)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f1.name.lower_name, 7)
			parameters.put (f1.parent.type.upper_name, 8)
			parameters.put (f2.parent.type.upper_name, 9)
			parameters.put (arg.out, 10)
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
			-- dollar7: $7 = feature name
			-- dollar8: $8 = first parent base class
			-- dollar9: $9 = second parent base class
			-- dollar10: $10 = argument index
		end

	make_vdjr0c (a_class: ET_CLASS; f1, f2: ET_PARENT_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := f1.parent.type.name.position
			code := template_code (vdjr0c_template_code)
			etl_code := vdjr_etl_code
			default_template := default_message_template (vdjr0c_default_template)
			create parameters.make_filled (empty_string, 1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f1.name.lower_name, 7)
			parameters.put (f1.parent.type.upper_name, 8)
			parameters.put (f2.parent.type.upper_name, 9)
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
			-- dollar7: $7 = feature name
			-- dollar8: $8 = first parent base class
			-- dollar9: $9 = second parent base class
		end

	make_vdjr2a (a_class: ET_CLASS; f1, f2: ET_PARENT_FEATURE)
			-- Create a new VDJR-2 error: features `f1' and `f2' are joined/merged,
			-- but `f1' has an alias and not `f2'.
			--
			-- ECMA: p.69
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f1_no_alias: f1.alias_name /= Void
			f2_not_void: f2 /= Void
			f2_alias: f2.alias_name = Void
		do
			current_class := a_class
			class_impl := a_class
			position := f1.parent.type.name.position
			code := template_code (vdjr2a_template_code)
			etl_code := vdjr2_etl_code
			default_template := default_message_template (vdjr2a_default_template)
			create parameters.make_filled (empty_string, 1, 10)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f1.name.lower_name, 7)
			parameters.put (f1.alias_name.alias_lower_name, 8)
			parameters.put (f1.parent.type.upper_name, 9)
			parameters.put (f2.parent.type.upper_name, 10)
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
			-- dollar7: $7 = feature name
			-- dollar8: $8 = first alias name
			-- dollar9: $9 = first parent base class
			-- dollar10: $10 = second parent base class
		end

	make_vdjr2b (a_class: ET_CLASS; f1, f2: ET_PARENT_FEATURE)
			-- Create a new VDJR-2 error: features `f1' and `f2' are joined/merged,
			-- they both have an alias but it is not the same.
			--
			-- ECMA: p.69
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f1_alias: f1.alias_name /= Void
			f2_not_void: f2 /= Void
			f2_alias: f2.alias_name /= Void
			not_same_alias: not f1.alias_name.same_alias_name (f2.alias_name)
		do
			current_class := a_class
			class_impl := a_class
			position := f1.parent.type.name.position
			code := template_code (vdjr2b_template_code)
			etl_code := vdjr2_etl_code
			default_template := default_message_template (vdjr2b_default_template)
			create parameters.make_filled (empty_string, 1, 11)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f1.name.lower_name, 7)
			parameters.put (f1.alias_name.alias_lower_name, 8)
			parameters.put (f1.parent.type.upper_name, 9)
			parameters.put (f2.alias_name.alias_lower_name, 10)
			parameters.put (f2.parent.type.upper_name, 11)
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
			-- dollar7: $7 = feature name
			-- dollar8: $8 = first alias name
			-- dollar9: $9 = first parent base class
			-- dollar10: $10 = second alias name
			-- dollar11: $11 = second parent base class
		end

	make_vdpr1a (a_class: ET_CLASS; a_precursor: ET_PRECURSOR_INSTRUCTION)
			-- Create a new VDPR-1 error: instruction `a_precursor' does not
			-- appear in a routine body in `a_class'.
			--
			-- ETL3-4.82-00-00: p.215
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_precursor_not_void: a_precursor /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_precursor.position
			code := template_code (vdpr1a_template_code)
			etl_code := vdpr1_etl_code
			default_template := default_message_template (vdpr1a_default_template)
			create parameters.make_filled (empty_string, 1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
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
		end

	make_vdpr1b (a_class: ET_CLASS; a_precursor: ET_PRECURSOR_EXPRESSION)
			-- Create a new VDPR-1 error: expression `a_precursor' does not
			-- appear in a routine body in `a_class'.
			--
			-- ETL3-4.82-00-00: p.215
		do
			current_class := a_class
			class_impl := a_class
			position := a_precursor.position
			code := template_code (vdpr1b_template_code)
			etl_code := vdpr1_etl_code
			default_template := default_message_template (vdpr1b_default_template)
			create parameters.make_filled (empty_string, 1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
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
		end

	make_vdpr2a (a_class: ET_CLASS; a_precursor: ET_PRECURSOR)
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
			current_class := a_class
			class_impl := a_class
			a_class_name := a_precursor.parent_name.class_name
			position := a_class_name.position
			code := template_code (vdpr2a_template_code)
			etl_code := vdpr2_etl_code
			default_template := default_message_template (vdpr2a_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_class_name.upper_name, 7)
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
			-- dollar7: $7 = parent class name
		end

	make_vdpr3a (a_class: ET_CLASS; a_precursor: ET_PRECURSOR; a_redefined_feature: ET_FEATURE; f1, f2: ET_PARENT_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := a_precursor.position
			code := template_code (vdpr3a_template_code)
			etl_code := vdpr3_etl_code
			default_template := default_message_template (vdpr3a_default_template)
			create parameters.make_filled (empty_string, 1, 10)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f1.precursor_feature.name.name, 7)
			parameters.put (f1.parent.type.to_text, 8)
			parameters.put (f2.precursor_feature.name.name, 9)
			parameters.put (f2.parent.type.to_text, 10)
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
			-- dollar7: $7 = first feature name
			-- dollar8: $8 = first feature parent class name
			-- dollar9: $9 = second feature name
			-- dollar10: $10 = second feature parent class name
		end

	make_vdpr3b (a_class: ET_CLASS; a_precursor: ET_PRECURSOR; a_redefined_feature: ET_FEATURE; an_inherited_feature: ET_PARENT_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := a_precursor.position
			code := template_code (vdpr3b_template_code)
			etl_code := vdpr3_etl_code
			default_template := default_message_template (vdpr3b_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_redefined_feature.lower_name, 7)
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
			-- dollar7: $7 = redefined feature name
		end

	make_vdpr3c (a_class: ET_CLASS; a_precursor: ET_PRECURSOR; a_redefined_feature: ET_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			a_class_name := a_precursor.parent_name.class_name
			position := a_class_name.position
			code := template_code (vdpr3b_template_code)
			etl_code := vdpr3_etl_code
			default_template := default_message_template (vdpr3b_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_redefined_feature.lower_name, 7)
			parameters.put (a_class_name.upper_name, 8)
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
			-- dollar7: $7 = redefined feature name
			-- dollar8: $8 = parent class name
		end

	make_vdpr3d (a_class: ET_CLASS; a_precursor: ET_PRECURSOR; a_feature: ET_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := a_precursor.position
			code := template_code (vdpr3d_template_code)
			etl_code := vdpr3_etl_code
			default_template := default_message_template (vdpr3d_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_feature.lower_name, 7)
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
			-- dollar7: $7 = feature name
		end

	make_vdpr3e (a_class: ET_CLASS; a_precursor: ET_PRECURSOR; an_agent: ET_INLINE_AGENT; a_feature: ET_STANDALONE_CLOSURE)
			-- Create a new VDPR-3 error: `a_precursor' appears in inline agent
			-- `an_agent' of `a_feature' in `a_class', but the associated feature
			-- of inline agents cannot be redefined.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_precursor_not_void: a_precursor /= Void
			an_agent_not_void: an_agent /= Void
			a_feature_not_void: a_feature /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_precursor.position
			code := template_code (vdpr3e_template_code)
			etl_code := vdpr3_etl_code
			default_template := default_message_template (vdpr3e_default_template)
			create parameters.make_filled (empty_string, 1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
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
		end

	make_vdpr4a (a_class: ET_CLASS; a_precursor: ET_PRECURSOR_KEYWORD; a_feature: ET_FEATURE; a_parent: ET_CLASS)
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
			current_class := a_class
			class_impl := a_class
			position := a_precursor.position
			code := template_code (vdpr4a_template_code)
			etl_code := vdpr4a_etl_code
			default_template := default_message_template (vdpr4a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_feature.lower_name, 7)
			parameters.put (a_parent.upper_name, 8)
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
			-- dollar7: $7 = name of corresponding feature in class $8
			-- dollar8: $8 = parent base class
		end

	make_vdpr4b (a_class, a_class_impl: ET_CLASS; a_precursor: ET_PRECURSOR_KEYWORD; a_feature: ET_FEATURE; a_parent: ET_CLASS; arg: INTEGER; an_actual, a_formal: ET_NAMED_TYPE)
			-- Create a new VDPR-4B error: the `arg'-th actual argument in the precursor
			-- call `a_precursor' appearing in `a_class_impl' and viewed from one of its
			-- descendants `a_class' (possibly itself) does not conform to the corresponding
			-- formal argument of `a_feature' in class `a_parent'.
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
			current_class := a_class
			class_impl := a_class_impl
			position := a_precursor.position
			code := template_code (vdpr4b_template_code)
			etl_code := vdpr4b_etl_code
			default_template := default_message_template (vdpr4b_default_template)
			create parameters.make_filled (empty_string, 1, 11)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_feature.lower_name, 7)
			parameters.put (a_parent.upper_name, 8)
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

	make_vdrd2a (a_class: ET_CLASS; f1: ET_FEATURE; f2: ET_PARENT_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := f1.name.position
			code := template_code (vdrd2a_template_code)
			etl_code := vdrd2_etl_code
			default_template := default_message_template (vdrd2a_default_template)
			create parameters.make_filled (empty_string, 1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f1.lower_name, 7)
			parameters.put (f2.precursor_feature.lower_name, 8)
			parameters.put (f2.parent.type.upper_name, 9)
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
			-- dollar7: $7 = feature name
			-- dollar8: $8 = precursor feature name
			-- dollar9: $9 = parent base class
		end

	make_vdrd2b (a_class: ET_CLASS; f1, f2: ET_PARENT_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := f1.parent.type.name.position
			code := template_code (vdrd2b_template_code)
			etl_code := vdrd2_etl_code
			default_template := default_message_template (vdrd2b_default_template)
			create parameters.make_filled (empty_string, 1, 10)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f1.name.lower_name, 7)
			parameters.put (f1.parent.type.upper_name, 8)
			parameters.put (f2.precursor_feature.lower_name, 9)
			parameters.put (f2.parent.type.upper_name, 10)
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
			-- dollar7: $7 = feature name
			-- dollar8: $8 = parent base class of feature
			-- dollar9: $9 = redeclared feature name
			-- dollar10: $10 = parent base class of redeclared feature
		end

	make_vdrd2c (a_class: ET_CLASS; f1: ET_FEATURE; f2: ET_PARENT_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := f1.name.position
			code := template_code (vdrd2c_template_code)
			etl_code := vdrd2_etl_code
			default_template := default_message_template (vdrd2c_default_template)
			create parameters.make_filled (empty_string, 1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f1.lower_name, 7)
			parameters.put (f2.precursor_feature.lower_name, 8)
			parameters.put (f2.parent.type.upper_name, 9)
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
			-- dollar7: $7 = selected feature name
			-- dollar8: $8 = replicated feature name
			-- dollar9: $9 = parent base class of replicated feature
		end

	make_vdrd2d (a_class: ET_CLASS; f1, f2: ET_PARENT_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := f1.parent.type.name.position
			code := template_code (vdrd2d_template_code)
			etl_code := vdrd2_etl_code
			default_template := default_message_template (vdrd2d_default_template)
			create parameters.make_filled (empty_string, 1, 10)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f1.name.lower_name, 7)
			parameters.put (f1.parent.type.upper_name, 8)
			parameters.put (f2.precursor_feature.lower_name, 9)
			parameters.put (f2.parent.type.upper_name, 10)
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
			-- dollar7: $7 = selected feature name
			-- dollar8: $8 = parent base class of selected feature
			-- dollar9: $9 = replicated feature name
			-- dollar10: $10 = parent base class of replicated feature
		end

	make_vdrd3a (a_class: ET_CLASS; p: ET_PRECONDITIONS; f: ET_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := p.position
			code := template_code (vdrd3a_template_code)
			etl_code := vdrd3_etl_code
			default_template := default_message_template (vdrd3a_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f.lower_name, 7)
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
			-- dollar7: $7 = feature name
		end

	make_vdrd3b (a_class: ET_CLASS; p: ET_POSTCONDITIONS; f: ET_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := p.position
			code := template_code (vdrd3b_template_code)
			etl_code := vdrd3_etl_code
			default_template := default_message_template (vdrd3b_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f.lower_name, 7)
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
			-- dollar7: $7 = feature name
		end

	make_vdrd4a (a_class: ET_CLASS; f1: ET_PARENT_FEATURE; f2: ET_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := f2.name.position
			code := template_code (vdrd4a_template_code)
			etl_code := vdrd4_etl_code
			default_template := default_message_template (vdrd4a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f1.name.lower_name, 7)
			parameters.put (f1.parent.type.upper_name, 8)
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
			-- dollar7: $7 = feature name
			-- dollar8: $8 = parent base class
		end

	make_vdrd4b (a_class: ET_CLASS; f1: ET_PARENT_FEATURE; f2: ET_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := f2.name.position
			code := template_code (vdrd4b_template_code)
			etl_code := vdrd4_etl_code
			default_template := default_message_template (vdrd4b_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f1.name.lower_name, 7)
			parameters.put (f1.parent.type.upper_name, 8)
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
			-- dollar7: $7 = feature name
			-- dollar8: $8 = parent base class
		end

	make_vdrd4c (a_class: ET_CLASS; f1: ET_PARENT_FEATURE; f2: ET_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := f2.name.position
			code := template_code (vdrd4c_template_code)
			etl_code := vdrd4_etl_code
			default_template := default_message_template (vdrd4c_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f1.name.lower_name, 7)
			parameters.put (f1.parent.type.upper_name, 8)
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
			-- dollar7: $7 = feature name
			-- dollar8: $8 = parent base class
		end

	make_vdrd5a (a_class: ET_CLASS; f1: ET_PARENT_FEATURE; f2: ET_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := f1.redefine_name.position
			code := template_code (vdrd5a_template_code)
			etl_code := vdrd5_etl_code
			default_template := default_message_template (vdrd5a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f1.name.lower_name, 7)
			parameters.put (f1.parent.type.upper_name, 8)
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
			-- dollar7: $7 = feature name
			-- dollar8: $8 = parent base class
		end

	make_vdrd6a (a_class: ET_CLASS; f1: ET_PARENT_FEATURE; f2: ET_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := f2.name.position
			code := template_code (vdrd6a_template_code)
			etl_code := vdrd6_etl_code
			default_template := default_message_template (vdrd6a_default_template)
			create parameters.make_filled (empty_string, 1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f1.name.lower_name, 7)
			parameters.put (f1.parent.type.upper_name, 8)
			parameters.put (f2.lower_name, 9)
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
			-- dollar7: $7 = inherited attribute name
			-- dollar8: $8 = parent base class
			-- dollar9: $9 = redeclared feature name
		end

	make_vdrd6b (a_class: ET_CLASS; f1: ET_PARENT_FEATURE; f2: ET_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := f2.name.position
			code := template_code (vdrd6b_template_code)
			etl_code := vdrd6_etl_code
			default_template := default_message_template (vdrd6b_default_template)
			create parameters.make_filled (empty_string, 1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f1.name.lower_name, 7)
			parameters.put (f1.parent.type.upper_name, 8)
			parameters.put (f2.lower_name, 9)
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
			-- dollar7: $7 = inherited attribute name
			-- dollar8: $8 = parent base class
			-- dollar9: $9 = redeclared attribute name
		end

	make_vdrd7a (a_class: ET_CLASS; f1: ET_PARENT_FEATURE; f2: ET_FEATURE)
			-- Create a new VDRD-7 error: `f1' has no alias but its redeclared version
			-- `f2' has one.
			--
			-- ECMA: p.68
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f1_no_alias: f1.alias_name = Void
			f2_not_void: f2 /= Void
			f2_alias: f2.alias_name /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := f2.alias_name.position
			code := template_code (vdrd7a_template_code)
			etl_code := vdrd7_etl_code
			default_template := default_message_template (vdrd7a_default_template)
			create parameters.make_filled (empty_string, 1, 10)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f1.name.lower_name, 7)
			parameters.put (f1.parent.type.upper_name, 8)
			parameters.put (f2.lower_name, 9)
			parameters.put (f2.alias_name.alias_lower_name, 10)
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
			-- dollar7: $7 = inherited feature name
			-- dollar8: $8 = parent base class
			-- dollar9: $9 = redeclared feature name
			-- dollar10: $10 = redeclared alias name
		end

	make_vdrd7b (a_class: ET_CLASS; f1: ET_PARENT_FEATURE; f2: ET_FEATURE)
			-- Create a new VDRD-7 error: `f1' has an alias but its redeclared version
			-- `f2' has none.
			--
			-- ECMA: p.68
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f1_alias: f1.alias_name /= Void
			f2_not_void: f2 /= Void
			f2_no_alias: f2.alias_name = Void
		do
			current_class := a_class
			class_impl := a_class
			position := f2.name.position
			code := template_code (vdrd7b_template_code)
			etl_code := vdrd7_etl_code
			default_template := default_message_template (vdrd7b_default_template)
			create parameters.make_filled (empty_string, 1, 10)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f1.name.lower_name, 7)
			parameters.put (f1.alias_name.alias_lower_name, 8)
			parameters.put (f1.parent.type.upper_name, 9)
			parameters.put (f2.lower_name, 10)
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
			-- dollar7: $7 = inherited feature name
			-- dollar8: $8 = inherited alias name
			-- dollar9: $9 = parent base class
			-- dollar10: $10 = redeclared feature name
		end

	make_vdrd7c (a_class: ET_CLASS; f1: ET_PARENT_FEATURE; f2: ET_FEATURE)
			-- Create a new VDRD-7 error: `f1' and its redeclared version `f2'
			-- have both an alias, but it is not the same.
			--
			-- ECMA: p.68
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f1_alias: f1.alias_name /= Void
			f2_not_void: f2 /= Void
			f2_alias: f2.alias_name /= Void
			not_same_alias: not f1.alias_name.same_alias_name (f2.alias_name)
		do
			current_class := a_class
			class_impl := a_class
			position := f2.alias_name.position
			code := template_code (vdrd7c_template_code)
			etl_code := vdrd7_etl_code
			default_template := default_message_template (vdrd7c_default_template)
			create parameters.make_filled (empty_string, 1, 11)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f1.name.lower_name, 7)
			parameters.put (f1.alias_name.alias_lower_name, 8)
			parameters.put (f1.parent.type.upper_name, 9)
			parameters.put (f2.lower_name, 10)
			parameters.put (f2.alias_name.alias_lower_name, 11)
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
			-- dollar7: $7 = inherited feature name
			-- dollar8: $8 = inherited alias name
			-- dollar9: $9 = parent base class
			-- dollar10: $10 = redeclared feature name
			-- dollar11: $11 = redeclared alias name
		end

	make_vdrs1a (a_class: ET_CLASS; a_parent: ET_PARENT; f: ET_FEATURE_NAME)
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
			current_class := a_class
			class_impl := a_class
			position := f.position
			code := template_code (vdrs1a_template_code)
			etl_code := vdrs1_etl_code
			default_template := default_message_template (vdrs1a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f.lower_name, 7)
			parameters.put (a_parent.type.upper_name, 8)
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
			-- dollar7: $7 = feature name
			-- dollar8: $8 = parent base class
		end

	make_vdrs2a (a_class: ET_CLASS; a_parent: ET_PARENT; f: ET_FEATURE_NAME)
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
			current_class := a_class
			class_impl := a_class
			position := f.position
			code := template_code (vdrs2a_template_code)
			etl_code := vdrs2_etl_code
			default_template := default_message_template (vdrs2a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f.lower_name, 7)
			parameters.put (a_parent.type.upper_name, 8)
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
			-- dollar7: $7 = feature name
			-- dollar8: $8 = parent base class
		end

	make_vdrs2b (a_class: ET_CLASS; a_parent: ET_PARENT; f: ET_FEATURE_NAME)
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
			current_class := a_class
			class_impl := a_class
			position := f.position
			code := template_code (vdrs2b_template_code)
			etl_code := vdrs2_etl_code
			default_template := default_message_template (vdrs2b_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f.lower_name, 7)
			parameters.put (a_parent.type.upper_name, 8)
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
			-- dollar7: $7 = feature name
			-- dollar8: $8 = parent base class
		end

	make_vdrs3a (a_class: ET_CLASS; a_parent: ET_PARENT; f1, f2: ET_FEATURE_NAME)
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
			current_class := a_class
			class_impl := a_class
			position := f2.position
			code := template_code (vdrs3a_template_code)
			etl_code := vdrs3_etl_code
			default_template := default_message_template (vdrs3a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f2.lower_name, 7)
			parameters.put (a_parent.type.upper_name, 8)
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
			-- dollar7: $7 = feature name
			-- dollar8: $8 = parent base class
		end

	make_vdrs4a (a_class: ET_CLASS; a_feature: ET_PARENT_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := a_feature.redefine_name.position
			code := template_code (vdrs4a_template_code)
			etl_code := vdrs4_etl_code
			default_template := default_message_template (vdrs4a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_feature.redefine_name.lower_name, 7)
			parameters.put (a_feature.parent.type.upper_name, 8)
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
			-- dollar7: $7 = feature name
			-- dollar8: $8 = parent base class
		end

	make_vdrs4b (a_class: ET_CLASS; a_deferred: ET_PARENT_FEATURE; an_effective: ET_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := a_deferred.redefine_name.position
			code := template_code (vdrs4b_template_code)
			etl_code := vdrs4_etl_code
			default_template := default_message_template (vdrs4b_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_deferred.redefine_name.lower_name, 7)
			parameters.put (a_deferred.parent.type.upper_name, 8)
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
			-- dollar7: $7 = feature name
			-- dollar8: $8 = parent base class
		end

	make_vdus1a (a_class: ET_CLASS; a_parent: ET_PARENT; f: ET_FEATURE_NAME)
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
			current_class := a_class
			class_impl := a_class
			position := f.position
			code := template_code (vdus1a_template_code)
			etl_code := vdus1_etl_code
			default_template := default_message_template (vdus1a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f.lower_name, 7)
			parameters.put (a_parent.type.upper_name, 8)
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
			-- dollar7: $7 = feature name
			-- dollar8: $8 = parent base class
		end

	make_vdus2a (a_class: ET_CLASS; a_parent: ET_PARENT; f: ET_FEATURE_NAME)
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
			current_class := a_class
			class_impl := a_class
			position := f.position
			code := template_code (vdus2a_template_code)
			etl_code := vdus2_etl_code
			default_template := default_message_template (vdus2a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f.lower_name, 7)
			parameters.put (a_parent.type.upper_name, 8)
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
			-- dollar7: $7 = feature name
			-- dollar8: $8 = parent base class
		end

	make_vdus2b (a_class: ET_CLASS; a_parent: ET_PARENT; f: ET_FEATURE_NAME)
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
			current_class := a_class
			class_impl := a_class
			position := f.position
			code := template_code (vdus2b_template_code)
			etl_code := vdus2_etl_code
			default_template := default_message_template (vdus2b_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f.lower_name, 7)
			parameters.put (a_parent.type.upper_name, 8)
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
			-- dollar7: $7 = feature name
			-- dollar8: $8 = parent base class
		end

	make_vdus3a (a_class: ET_CLASS; a_parent: ET_PARENT; f: ET_FEATURE_NAME)
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
			current_class := a_class
			class_impl := a_class
			position := f.position
			code := template_code (vdus3a_template_code)
			etl_code := vdus3_etl_code
			default_template := default_message_template (vdus3a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f.lower_name, 7)
			parameters.put (a_parent.type.upper_name, 8)
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
			-- dollar7: $7 = feature name
			-- dollar8: $8 = parent base class
		end

	make_vdus4a (a_class: ET_CLASS; a_parent: ET_PARENT; f1, f2: ET_FEATURE_NAME)
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
			current_class := a_class
			class_impl := a_class
			position := f2.position
			code := template_code (vdus4a_template_code)
			etl_code := vdus4_etl_code
			default_template := default_message_template (vdus4a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f2.lower_name, 7)
			parameters.put (a_parent.type.upper_name, 8)
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
			-- dollar7: $7 = feature name
			-- dollar8: $8 = parent base class
		end

	make_veen0a (a_class: ET_CLASS; an_identifier: ET_IDENTIFIER; a_feature: ET_FEATURE)
			-- Create a new VEEN error: `an_identifier', appearing in `a_feature'
			-- of `a_class', is not the final name of a feature in `a_class'
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
			current_class := a_class
			class_impl := a_class
			position := an_identifier.position
			code := template_code (veen0a_template_code)
			etl_code := veen_etl_code
			default_template := default_message_template (veen0a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (an_identifier.lower_name, 7)
			parameters.put (a_feature.lower_name, 8)
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
			-- dollar7: $7 = identifier
			-- dollar8: $8 = feature name
		end

	make_veen0b (a_class: ET_CLASS; an_identifier: ET_IDENTIFIER; an_agent: ET_INLINE_AGENT)
			-- Create a new VEEN error: `an_identifier', appearing in inline agent
			-- `an_agent' in `a_class', is not the final name of a feature in `a_class'
			-- nor the name of a local variable or a formal argument of
			-- `an_agent'.
			--
			-- ETL2: p.276
			-- ETR: p.61
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_identifier_not_void: an_identifier /= Void
			an_agent_not_void: an_agent /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := an_identifier.position
			code := template_code (veen0b_template_code)
			etl_code := veen_etl_code
			default_template := default_message_template (veen0b_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (an_identifier.lower_name, 7)
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
			-- dollar7: $7 = identifier
		end

	make_veen2a (a_class: ET_CLASS; a_result: ET_RESULT; a_feature: ET_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := a_result.position
			code := template_code (veen2a_template_code)
			etl_code := veen2_etl_code
			default_template := default_message_template (veen2a_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_feature.lower_name, 7)
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
			-- dollar7: $7 = feature name
		end

	make_veen2b (a_class: ET_CLASS; a_result: ET_RESULT; a_feature: ET_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := a_result.position
			code := template_code (veen2b_template_code)
			etl_code := veen2_etl_code
			default_template := default_message_template (veen2b_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_feature.lower_name, 7)
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
			-- dollar7: $7 = feature name
		end

	make_veen2c (a_class: ET_CLASS; a_local: ET_FEATURE_NAME; a_feature: ET_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := a_local.position
			code := template_code (veen2c_template_code)
			etl_code := veen2_etl_code
			default_template := default_message_template (veen2c_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_local.lower_name, 7)
			parameters.put (a_feature.lower_name, 8)
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
			-- dollar7: $7 = local name
			-- dollar8: $8 = feature name
		end

	make_veen2d (a_class: ET_CLASS; a_result: ET_RESULT)
			-- Create a new VEEN-2 error: `a_result' appears in the invariant
			-- of `a_class'.
			--
			-- ETL2: p.276
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_result_not_void: a_result /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_result.position
			code := template_code (veen2d_template_code)
			etl_code := veen2_etl_code
			default_template := default_message_template (veen2d_default_template)
			create parameters.make_filled (empty_string, 1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
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
		end

	make_veen2e (a_class: ET_CLASS; a_local: ET_FEATURE_NAME; an_agent: ET_INLINE_AGENT)
			-- Create a new VEEN-2 error: the local variable `a_local' appears in the precondition
			-- or postcondition of inline agent `an_agent' in `a_class'.
			--
			-- ETL2: p.276
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_local_not_void: a_local /= Void
			a_local_is_local: a_local.is_local
			an_agent_not_void: an_agent /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_local.position
			code := template_code (veen2e_template_code)
			etl_code := veen2_etl_code
			default_template := default_message_template (veen2e_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_local.lower_name, 7)
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
			-- dollar7: $7 = local name
		end

	make_veen2f (a_class: ET_CLASS; a_result: ET_RESULT; an_agent: ET_INLINE_AGENT)
			-- Create a new VEEN-2 error: `a_result' appears in the precondition
			-- of inline agent `an_agent' in `a_class'.
			--
			-- ETL2: p.276
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_result_not_void: a_result /= Void
			an_agent_not_void: an_agent /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_result.position
			code := template_code (veen2b_template_code)
			etl_code := veen2_etl_code
			default_template := default_message_template (veen2b_default_template)
			create parameters.make_filled (empty_string, 1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
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
		end

	make_veen2g (a_class: ET_CLASS; a_result: ET_RESULT; an_agent: ET_INLINE_AGENT)
			-- Create a new VEEN-2 error: `a_result' appears in the body, postcondition
			-- or rescue clause of inline agent `an_agent' in `a_class', but the associated
			-- feature of `an_agent' is a procedure.
			--
			-- ETL2: p.276
			-- ETR: p.61
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_result_not_void: a_result /= Void
			an_agent_not_void: an_agent /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_result.position
			code := template_code (veen2g_template_code)
			etl_code := veen2_etl_code
			default_template := default_message_template (veen2g_default_template)
			create parameters.make_filled (empty_string, 1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
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
		end

	make_veen8a (a_class: ET_CLASS; an_identifier: ET_IDENTIFIER; a_feature: ET_FEATURE)
			-- Create a new VEEN-8 error: `an_identifier', appearing in `a_feature'
			-- of `a_class' or one of its (possibly nested) inline agents, is an
			-- object-test local that is used outside of its scope.
			--
			-- ECMA-367-2: p.103
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_identifier_not_void: an_identifier /= Void
			an_identifier_object_test_local: an_identifier.is_object_test_local
			a_feature_not_void: a_feature /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := an_identifier.position
			code := template_code (veen8a_template_code)
			etl_code := veen8_etl_code
			default_template := default_message_template (veen8a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (an_identifier.lower_name, 7)
			parameters.put (a_feature.lower_name, 8)
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
			-- dollar7: $7 = object-test local
			-- dollar8: $8 = feature name
		end

	make_veen8b (a_class: ET_CLASS; an_identifier: ET_IDENTIFIER)
			-- Create a new VEEN-8 error: `an_identifier', appearing in the invariant
			-- of `a_class' or one of its (possibly nested) inline agents, is an
			-- object-test local that is used outside of its scope.
			--
			-- ECMA-367-2: p.103
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_identifier_not_void: an_identifier /= Void
			an_identifier_object_test_local: an_identifier.is_object_test_local
		do
			current_class := a_class
			class_impl := a_class
			position := an_identifier.position
			code := template_code (veen8b_template_code)
			etl_code := veen8_etl_code
			default_template := default_message_template (veen8b_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (an_identifier.lower_name, 7)
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
			-- dollar7: $7 = object-test local
		end

	make_veen9a (a_class: ET_CLASS; an_identifier: ET_IDENTIFIER; a_feature: ET_FEATURE)
			-- Create a new VEEN-9 error: `an_identifier', appearing in `a_feature'
			-- of `a_class' or one of its (possibly nested) inline agents, is an
			-- across cursor that is used outside of its scope.
			--
			-- Not in ECMA-367-2.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_identifier_not_void: an_identifier /= Void
			an_identifier_across_cursor: an_identifier.is_across_cursor
			a_feature_not_void: a_feature /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := an_identifier.position
			code := template_code (veen9a_template_code)
			etl_code := veen9_etl_code
			default_template := default_message_template (veen9a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (an_identifier.lower_name, 7)
			parameters.put (a_feature.lower_name, 8)
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
			-- dollar7: $7 = across cursor
			-- dollar8: $8 = feature name
		end

	make_veen9b (a_class: ET_CLASS; an_identifier: ET_IDENTIFIER)
			-- Create a new VEEN-9 error: `an_identifier', appearing in the invariant
			-- of `a_class' or one of its (possibly nested) inline agents, is an
			-- across cursor that is used outside of its scope.
			--
			-- Not in ECMA-367-2.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_identifier_not_void: an_identifier /= Void
			an_identifier_across_cursor: an_identifier.is_across_cursor
		do
			current_class := a_class
			class_impl := a_class
			position := an_identifier.position
			code := template_code (veen9b_template_code)
			etl_code := veen9_etl_code
			default_template := default_message_template (veen9b_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (an_identifier.lower_name, 7)
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
			-- dollar7: $7 = across cursor
		end

	make_vevi0a (a_class, a_class_impl: ET_CLASS; a_name: ET_IDENTIFIER; a_local: ET_LOCAL_VARIABLE)
			-- Create a new VEVI error: the local variable `a_local', declared of attached type
			-- is used before being initialized in class `a_class_impl' and viewed from
			-- one of its descendants `a_class' (possibly itself).
			--
			-- ECMA-367-2: p.105
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_name_not_void: a_name /= Void
			a_local_not_void: a_local /= Void
		do
			current_class := a_class
			class_impl := a_class_impl
			position := a_name.position
			code := template_code (vevi0a_template_code)
			etl_code := vevi_etl_code
			default_template := default_message_template (vevi0a_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
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
			-- dollar7: $7 = local variable name
		end

	make_vevi0b (a_class, a_class_impl: ET_CLASS; a_result: ET_RESULT)
			-- Create a new VEVI error: the 'Result' entity `a_result', declared of attached type
			-- is used before being initialized in class `a_class_impl' and viewed from
			-- one of its descendants `a_class' (possibly itself).
			--
			-- ECMA-367-2: p.105
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_result_not_void: a_result /= Void
		do
			current_class := a_class
			class_impl := a_class_impl
			position := a_result.position
			code := template_code (vevi0b_template_code)
			etl_code := vevi_etl_code
			default_template := default_message_template (vevi0b_default_template)
			create parameters.make_filled (empty_string, 1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
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
		end

	make_vevi0c (a_class, a_class_impl: ET_CLASS; a_function: ET_INTERNAL_FUNCTION)
			-- Create a new VEVI error: the 'Result' entity declared of attached type
			-- is not initialized at the end of the function `a_function' declared
			-- in class `a_class_impl' and viewed from one of its descendants
			-- `a_class' (possibly itself).
			--
			-- ECMA-367-2: p.105
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_function_not_void: a_function /= Void
		do
			current_class := a_class
			class_impl := a_class_impl
			position := a_function.end_keyword.position
			if position.is_null then
				position := a_function.name.position
			end
			code := template_code (vevi0c_template_code)
			etl_code := vevi_etl_code
			default_template := default_message_template (vevi0c_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_function.lower_name, 7)
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
			-- dollar7: $7 = function name
		end

	make_vevi0d (a_class, a_class_impl: ET_CLASS; a_agent: ET_INTERNAL_FUNCTION_INLINE_AGENT)
			-- Create a new VEVI error: the 'Result' entity declared of attached type
			-- is not initialized at the end of the inline agent `a_agent' appearing
			-- in class `a_class_impl' and viewed from one of its descendants
			-- `a_class' (possibly itself).
			--
			-- ECMA-367-2: p.105
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_agent_not_void: a_agent /= Void
		do
			current_class := a_class
			class_impl := a_class_impl
			position := a_agent.end_keyword.position
			if position.is_null then
				position := a_agent.position
			end
			code := template_code (vevi0d_template_code)
			etl_code := vevi_etl_code
			default_template := default_message_template (vevi0d_default_template)
			create parameters.make_filled (empty_string, 1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
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
		end

	make_vevi0e (a_class, a_class_impl: ET_CLASS; a_attribute: ET_EXTENDED_ATTRIBUTE)
			-- Report VEVI error: the 'Result' entity declared of attached type
			-- is not initialized at the end of the attribute body of `a_attribute'
			-- declared in class `a_class_impl' and viewed from one of its descendants
			-- `a_class' (possibly itself).
			--
			-- ECMA-367-2: p.105
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_attribute_not_void: a_attribute /= Void
		do
			current_class := a_class
			class_impl := a_class_impl
			position := a_attribute.end_keyword.position
			if position.is_null then
				position := a_attribute.name.position
			end
			code := template_code (vevi0e_template_code)
			etl_code := vevi_etl_code
			default_template := default_message_template (vevi0e_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_attribute.lower_name, 7)
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
			-- dollar7: $7 = attribute name
		end

	make_vfac1a (a_class: ET_CLASS; an_assigner: ET_FEATURE_NAME; a_query: ET_QUERY)
			-- Create a new VFAC-1 error: `a_query' has an assigner `an_assigner'
			-- but there is not feature with that name in `a_class'.
			--
			-- ECMA 367-2: p.41
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_assigner_not_void: an_assigner /= Void
			a_query_not_void: a_query /= Void
			a_query_has_assigner: a_query.assigner /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := an_assigner.position
			code := template_code (vfac1a_template_code)
			etl_code := vfac1_etl_code
			default_template := default_message_template (vfac1a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_query.name.lower_name, 7)
			parameters.put (an_assigner.lower_name, 8)
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
			-- dollar7: $7 = query name
			-- dollar8: $8 = assigner name
		end

	make_vfac1b (a_class: ET_CLASS; an_assigner: ET_FEATURE_NAME; a_query: ET_QUERY)
			-- Create a new VFAC-1 error: `a_query' has an assigner `an_assigner'
			-- but this feature is not a procedure.
			--
			-- ECMA 367-2: p.41
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_assigner_not_void: an_assigner /= Void
			a_query_not_void: a_query /= Void
			a_query_has_assigner: a_query.assigner /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := an_assigner.position
			code := template_code (vfac1b_template_code)
			etl_code := vfac1_etl_code
			default_template := default_message_template (vfac1b_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_query.name.lower_name, 7)
			parameters.put (an_assigner.lower_name, 8)
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
			-- dollar7: $7 = query name
			-- dollar8: $8 = assigner name
		end

	make_vfac2a (a_class: ET_CLASS; an_assigner: ET_FEATURE_NAME; a_query: ET_QUERY; a_procedure: ET_PROCEDURE)
			-- Create a new VFAC-2 error: the number of argument in the
			-- assigner procedure `a_procedure' is not one more than the
			-- number of arguments in `a_query'.
			--
			-- ECMA 367-2: p.41
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_assigner_not_void: an_assigner /= Void
			a_query_not_void: a_query /= Void
			a_query_has_assigner: a_query.assigner /= Void
			a_procedure_not_void: a_procedure /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := an_assigner.position
			code := template_code (vfac2a_template_code)
			etl_code := vfac2_etl_code
			default_template := default_message_template (vfac2a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_query.name.lower_name, 7)
			parameters.put (a_procedure.name.lower_name, 8)
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
			-- dollar7: $7 = query name
			-- dollar8: $8 = assigner procedure name
		end

	make_vfac3a (a_class, a_class_impl: ET_CLASS; an_assigner: ET_FEATURE_NAME; a_query: ET_QUERY; a_procedure: ET_PROCEDURE)
			-- Create a new VFAC-3 error: the type of the first argument of the
			-- assigner procedure `a_procedure' in `a_class' and the result type
			-- of `a_query' declared in `a_class_impl' (an ancestor of `a_class',
			-- possibly itself) do not have the same deanchored form.
			--
			-- Note that under .NET the value is passed as the last argument of the assigner,
			-- and not as the first one like in Eiffel classic.
			--
			-- ECMA 367-2: p.41
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			an_assigner_not_void: an_assigner /= Void
			a_query_not_void: a_query /= Void
			a_query_has_assigner: a_query.assigner /= Void
			a_procedure_not_void: a_procedure /= Void
		do
			current_class := a_class
			class_impl := a_class_impl
			position := an_assigner.position
			code := template_code (vfac3a_template_code)
			etl_code := vfac3_etl_code
			default_template := default_message_template (vfac3a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_query.name.lower_name, 7)
			parameters.put (a_procedure.name.lower_name, 8)
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
			-- dollar6: $7 = query name
			-- dollar7: $8 = assigner procedure name
		end

	make_vfac4a (a_class, a_class_impl: ET_CLASS; an_assigner: ET_FEATURE_NAME; a_query: ET_QUERY; a_procedure: ET_PROCEDURE; arg: INTEGER)
			-- Create a new VFAC-4 error: the type of the `arg'-th + 1 argument of the
			-- assigner procedure `a_procedure' in `a_class' and the type of the
			-- `arg'-th argument of `a_query' declared in `a_class_impl' (an ancestor
			-- of `a_class', possibly itself) do not have the same deanchored form.
			--
			-- Note that under .NET the value is passed as the last argument of the assigner,
			-- and not as the first one like in Eiffel classic. In that case it's the type
			-- of the `arg'-th argument of both the assigner procedure and the query that
			-- are taken into account.
			--
			-- ECMA 367-2: p.41
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			an_assigner_not_void: an_assigner /= Void
			a_query_not_void: a_query /= Void
			a_query_has_assigner: a_query.assigner /= Void
			a_procedure_not_void: a_procedure /= Void
			arg_not_negative: arg > 0
		do
			current_class := a_class
			class_impl := a_class_impl
			position := an_assigner.position
			code := template_code (vfac4a_template_code)
			etl_code := vfac4_etl_code
			default_template := default_message_template (vfac4a_default_template)
			create parameters.make_filled (empty_string, 1, 10)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_query.name.lower_name, 7)
			parameters.put (a_procedure.name.lower_name, 8)
			parameters.put (arg.out, 9)
			if a_class_impl.is_dotnet then
					-- Note that under .NET the value is passed as the last argument of the assigner,
					-- and not as the first one like in Eiffel classic. In that case it's the type
					-- of the `arg'-th argument of both the assigner procedure and the query that
					-- are taken into account.
				parameters.put (arg.out, 10)
			else
				parameters.put ((arg + 1).out, 10)
			end
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
			-- dollar6: $7 = query name
			-- dollar7: $8 = assigner procedure name
			-- dollar9: $9 = argument index in query
			-- dollar10: $10 = argument index in assigner procedure
		end

	make_vfav1a (a_class: ET_CLASS; a_feature: ET_FEATURE)
			-- Create a new VFAV-1 error: `a_feature' has an infix operator alias
			-- but is not a function with exactly one argument.
			--
			-- ECMA: p.42
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_has_alias: a_feature.alias_name /= Void
			a_feature_alias_infix: a_feature.alias_name.is_infix
			a_feature_not_infixable: not a_feature.is_infixable
		do
			current_class := a_class
			class_impl := a_class
			position := a_feature.alias_name.position
			code := template_code (vfav1a_template_code)
			etl_code := vfav1_etl_code
			default_template := default_message_template (vfav1a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_feature.lower_name, 7)
			parameters.put (a_feature.alias_name.alias_lower_name, 8)
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
			-- dollar7: $7 = feature name
			-- dollar8: $8 = alias name
		end

	make_vfav1b (a_class: ET_CLASS; a_feature: ET_FEATURE)
			-- Create a new VFAV-1 error: `a_feature' has a prefix operator alias
			-- but is not a query with no argument.
			--
			-- ECMA: p.42
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_has_alias: a_feature.alias_name /= Void
			a_feature_alias_prefix: a_feature.alias_name.is_prefix
			a_feature_not_prefixable: not a_feature.is_prefixable
		do
			current_class := a_class
			class_impl := a_class
			position := a_feature.alias_name.position
			code := template_code (vfav1b_template_code)
			etl_code := vfav1_etl_code
			default_template := default_message_template (vfav1b_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_feature.lower_name, 7)
			parameters.put (a_feature.alias_name.alias_lower_name, 8)
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
			-- dollar7: $7 = feature name
			-- dollar8: $8 = alias name
		end

	make_vfav1c (a_class: ET_CLASS; a_feature1, a_feature2: ET_FEATURE)
			-- Create a new VFAV-1 error: `a_feature1' and `a_feature2' have
			-- the same unary operator alias.
			--
			-- ECMA: p.42
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature1_not_void: a_feature1 /= Void
			a_feature1_has_alias: a_feature1.alias_name /= Void
			a_feature1_alias_prefix: a_feature1.alias_name.is_prefix
			a_feature2_not_void: a_feature2 /= Void
			a_feature2_has_alias: a_feature2.alias_name /= Void
			a_feature2_alias_prefix: a_feature2.alias_name.is_prefix
		do
			current_class := a_class
			class_impl := a_class
			position := a_feature1.alias_name.position
			code := template_code (vfav1c_template_code)
			etl_code := vfav1_etl_code
			default_template := default_message_template (vfav1c_default_template)
			create parameters.make_filled (empty_string, 1, 10)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_feature1.lower_name, 7)
			parameters.put (a_feature1.alias_name.alias_lower_name, 8)
			parameters.put (a_feature2.lower_name, 9)
			parameters.put (a_feature2.alias_name.alias_lower_name, 10)
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
			-- dollar7: $7 = first feature name
			-- dollar8: $8 = first alias name
			-- dollar9: $9 = second feature name
			-- dollar10: $10 = second alias name
		end

	make_vfav1d (a_class: ET_CLASS; a_feature1: ET_FEATURE; a_feature2: ET_PARENT_FEATURE)
			-- Create a new VFAV-1 error: `a_feature1' and `a_feature2' have
			-- the same unary operator alias.
			--
			-- ECMA: p.42
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature1_not_void: a_feature1 /= Void
			a_feature1_has_alias: a_feature1.alias_name /= Void
			a_feature1_alias_prefix: a_feature1.alias_name.is_prefix
			a_feature2_not_void: a_feature2 /= Void
			a_feature2_has_alias: a_feature2.alias_name /= Void
			a_feature2_alias_prefix: a_feature2.alias_name.is_prefix
		do
			current_class := a_class
			class_impl := a_class
			position := a_feature1.alias_name.position
			code := template_code (vfav1d_template_code)
			etl_code := vfav1_etl_code
			default_template := default_message_template (vfav1d_default_template)
			create parameters.make_filled (empty_string, 1, 11)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_feature1.lower_name, 7)
			parameters.put (a_feature1.alias_name.alias_lower_name, 8)
			parameters.put (a_feature2.name.lower_name, 9)
			parameters.put (a_feature2.alias_name.alias_lower_name, 10)
			parameters.put (a_feature2.parent.type.upper_name, 11)
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
			-- dollar7: $7 = first feature name
			-- dollar8: $8 = first alias name
			-- dollar9: $9 = second feature name
			-- dollar10: $10 = second alias name
			-- dollar11: $11 = second parent base class
		end

	make_vfav1e (a_class: ET_CLASS; a_feature1, a_feature2: ET_PARENT_FEATURE)
			-- Create a new VFAV-1 error: `a_feature1' and `a_feature2' have
			-- the same unary operator alias.
			--
			-- ECMA: p.42
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature1_not_void: a_feature1 /= Void
			a_feature1_has_alias: a_feature1.alias_name /= Void
			a_feature1_alias_prefix: a_feature1.alias_name.is_prefix
			a_feature2_not_void: a_feature2 /= Void
			a_feature2_has_alias: a_feature2.alias_name /= Void
			a_feature2_alias_prefix: a_feature2.alias_name.is_prefix
		do
			current_class := a_class
			class_impl := a_class
			position := a_feature1.parent.type.name.position
			code := template_code (vfav1e_template_code)
			etl_code := vfav1_etl_code
			default_template := default_message_template (vfav1e_default_template)
			create parameters.make_filled (empty_string, 1, 12)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_feature1.name.lower_name, 7)
			parameters.put (a_feature1.alias_name.alias_lower_name, 8)
			parameters.put (a_feature1.parent.type.upper_name, 9)
			parameters.put (a_feature2.name.lower_name, 10)
			parameters.put (a_feature2.alias_name.alias_lower_name, 11)
			parameters.put (a_feature2.parent.type.upper_name, 12)
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
			-- dollar7: $7 = first feature name
			-- dollar8: $8 = first alias name
			-- dollar9: $9 = first parent base class
			-- dollar10: $10 = second feature name
			-- dollar11: $11 = second alias name
			-- dollar12: $12 = second parent base class
		end

	make_vfav1f (a_class: ET_CLASS; a_feature1, a_feature2: ET_FEATURE)
			-- Create a new VFAV-1 error: `a_feature1' and `a_feature2' have
			-- the same binary operator alias.
			--
			-- ECMA: p.42
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature1_not_void: a_feature1 /= Void
			a_feature1_has_alias: a_feature1.alias_name /= Void
			a_feature1_alias_infix: a_feature1.alias_name.is_infix
			a_feature2_not_void: a_feature2 /= Void
			a_feature2_has_alias: a_feature2.alias_name /= Void
			a_feature2_alias_infix: a_feature2.alias_name.is_infix
		do
			current_class := a_class
			class_impl := a_class
			position := a_feature1.alias_name.position
			code := template_code (vfav1f_template_code)
			etl_code := vfav1_etl_code
			default_template := default_message_template (vfav1f_default_template)
			create parameters.make_filled (empty_string, 1, 10)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_feature1.lower_name, 7)
			parameters.put (a_feature1.alias_name.alias_lower_name, 8)
			parameters.put (a_feature2.lower_name, 9)
			parameters.put (a_feature2.alias_name.alias_lower_name, 10)
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
			-- dollar7: $7 = first feature name
			-- dollar8: $8 = first alias name
			-- dollar9: $9 = second feature name
			-- dollar10: $10 = second alias name
		end

	make_vfav1g (a_class: ET_CLASS; a_feature1: ET_FEATURE; a_feature2: ET_PARENT_FEATURE)
			-- Create a new VFAV-1 error: `a_feature1' and `a_feature2' have
			-- the same binary operator alias.
			--
			-- ECMA: p.42
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature1_not_void: a_feature1 /= Void
			a_feature1_has_alias: a_feature1.alias_name /= Void
			a_feature1_alias_infix: a_feature1.alias_name.is_infix
			a_feature2_not_void: a_feature2 /= Void
			a_feature2_has_alias: a_feature2.alias_name /= Void
			a_feature2_alias_infix: a_feature2.alias_name.is_infix
		do
			current_class := a_class
			class_impl := a_class
			position := a_feature1.alias_name.position
			code := template_code (vfav1g_template_code)
			etl_code := vfav1_etl_code
			default_template := default_message_template (vfav1g_default_template)
			create parameters.make_filled (empty_string, 1, 11)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_feature1.lower_name, 7)
			parameters.put (a_feature1.alias_name.alias_lower_name, 8)
			parameters.put (a_feature2.name.lower_name, 9)
			parameters.put (a_feature2.alias_name.alias_lower_name, 10)
			parameters.put (a_feature2.parent.type.upper_name, 11)
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
			-- dollar7: $7 = first feature name
			-- dollar8: $8 = first alias name
			-- dollar9: $9 = second feature name
			-- dollar10: $10 = second alias name
			-- dollar11: $11 = second parent base class
		end

	make_vfav1h (a_class: ET_CLASS; a_feature1, a_feature2: ET_PARENT_FEATURE)
			-- Create a new VFAV-1 error: `a_feature1' and `a_feature2' have
			-- the same binary operator alias.
			--
			-- ECMA: p.42
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature1_not_void: a_feature1 /= Void
			a_feature1_has_alias: a_feature1.alias_name /= Void
			a_feature1_alias_infix: a_feature1.alias_name.is_infix
			a_feature2_not_void: a_feature2 /= Void
			a_feature2_has_alias: a_feature2.alias_name /= Void
			a_feature2_alias_infix: a_feature2.alias_name.is_infix
		do
			current_class := a_class
			class_impl := a_class
			position := a_feature1.parent.type.name.position
			code := template_code (vfav1h_template_code)
			etl_code := vfav1_etl_code
			default_template := default_message_template (vfav1h_default_template)
			create parameters.make_filled (empty_string, 1, 12)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_feature1.name.lower_name, 7)
			parameters.put (a_feature1.alias_name.alias_lower_name, 8)
			parameters.put (a_feature1.parent.type.upper_name, 9)
			parameters.put (a_feature2.name.lower_name, 10)
			parameters.put (a_feature2.alias_name.alias_lower_name, 11)
			parameters.put (a_feature2.parent.type.upper_name, 12)
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
			-- dollar7: $7 = first feature name
			-- dollar8: $8 = first alias name
			-- dollar9: $9 = first parent base class
			-- dollar10: $10 = second feature name
			-- dollar11: $11 = second alias name
			-- dollar12: $12 = second parent base class
		end

	make_vfav2a (a_class: ET_CLASS; a_feature: ET_FEATURE)
			-- Create a new VFAV-2 error: `a_feature' has a bracket alias
			-- but is not a function with at least one argument.
			--
			-- ECMA: p.42
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_has_alias: a_feature.alias_name /= Void
			a_feature_alias_bracket: a_feature.alias_name.is_bracket
			a_feature_not_bracketable: not a_feature.is_bracketable
		do
			current_class := a_class
			class_impl := a_class
			position := a_feature.alias_name.position
			code := template_code (vfav2a_template_code)
			etl_code := vfav2_etl_code
			default_template := default_message_template (vfav2a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_feature.lower_name, 7)
			parameters.put (a_feature.alias_name.alias_lower_name, 8)
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
			-- dollar7: $7 = feature name
			-- dollar8: $8 = alias name
		end

	make_vfav2b (a_class: ET_CLASS; a_feature1, a_feature2: ET_FEATURE)
			-- Create a new VFAV-2 error: `a_feature1' and `a_feature2' have both
			-- a bracket alias.
			--
			-- ECMA: p.42
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature1_not_void: a_feature1 /= Void
			a_feature1_has_alias: a_feature1.alias_name /= Void
			a_feature1_alias_bracket: a_feature1.alias_name.is_bracket
			a_feature2_not_void: a_feature2 /= Void
			a_feature2_has_alias: a_feature2.alias_name /= Void
			a_feature2_alias_bracket: a_feature2.alias_name.is_bracket
		do
			current_class := a_class
			class_impl := a_class
			position := a_feature1.alias_name.position
			code := template_code (vfav2b_template_code)
			etl_code := vfav2_etl_code
			default_template := default_message_template (vfav2b_default_template)
			create parameters.make_filled (empty_string, 1, 10)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_feature1.lower_name, 7)
			parameters.put (a_feature1.alias_name.alias_lower_name, 8)
			parameters.put (a_feature2.lower_name, 9)
			parameters.put (a_feature2.alias_name.alias_lower_name, 10)
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
			-- dollar7: $7 = first feature name
			-- dollar8: $8 = first alias name
			-- dollar9: $9 = second feature name
			-- dollar10: $10 = second alias name
		end

	make_vfav2c (a_class: ET_CLASS; a_feature1: ET_FEATURE; a_feature2: ET_PARENT_FEATURE)
			-- Create a new VFAV-2 error: `a_feature1' and `a_feature2' have both
			-- a bracket alias.
			--
			-- ECMA: p.42
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature1_not_void: a_feature1 /= Void
			a_feature1_has_alias: a_feature1.alias_name /= Void
			a_feature1_alias_bracket: a_feature1.alias_name.is_bracket
			a_feature2_not_void: a_feature2 /= Void
			a_feature2_has_alias: a_feature2.alias_name /= Void
			a_feature2_alias_bracket: a_feature2.alias_name.is_bracket
		do
			current_class := a_class
			class_impl := a_class
			position := a_feature1.alias_name.position
			code := template_code (vfav2c_template_code)
			etl_code := vfav2_etl_code
			default_template := default_message_template (vfav2c_default_template)
			create parameters.make_filled (empty_string, 1, 11)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_feature1.lower_name, 7)
			parameters.put (a_feature1.alias_name.alias_lower_name, 8)
			parameters.put (a_feature2.name.lower_name, 9)
			parameters.put (a_feature2.alias_name.alias_lower_name, 10)
			parameters.put (a_feature2.parent.type.upper_name, 11)
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
			-- dollar7: $7 = first feature name
			-- dollar8: $8 = first alias name
			-- dollar9: $9 = second feature name
			-- dollar10: $10 = second alias name
			-- dollar11: $11 = second parent base class
		end

	make_vfav2d (a_class: ET_CLASS; a_feature1, a_feature2: ET_PARENT_FEATURE)
			-- Create a new VFAV-2 error: `a_feature1' and `a_feature2' have both
			-- a bracket alias.
			--
			-- ECMA: p.42
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature1_not_void: a_feature1 /= Void
			a_feature1_has_alias: a_feature1.alias_name /= Void
			a_feature1_alias_bracket: a_feature1.alias_name.is_bracket
			a_feature2_not_void: a_feature2 /= Void
			a_feature2_has_alias: a_feature2.alias_name /= Void
			a_feature2_alias_bracket: a_feature2.alias_name.is_bracket
		do
			current_class := a_class
			class_impl := a_class
			position := a_feature1.parent.type.name.position
			code := template_code (vfav2d_template_code)
			etl_code := vfav2_etl_code
			default_template := default_message_template (vfav2d_default_template)
			create parameters.make_filled (empty_string, 1, 12)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_feature1.name.lower_name, 7)
			parameters.put (a_feature1.alias_name.alias_lower_name, 8)
			parameters.put (a_feature1.parent.type.upper_name, 9)
			parameters.put (a_feature2.name.lower_name, 10)
			parameters.put (a_feature2.alias_name.alias_lower_name, 11)
			parameters.put (a_feature2.parent.type.upper_name, 12)
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
			-- dollar7: $7 = first feature name
			-- dollar8: $8 = first alias name
			-- dollar9: $9 = first parent base class
			-- dollar10: $10 = second feature name
			-- dollar11: $11 = second alias name
			-- dollar12: $12 = second parent base class
		end

	make_vffd4a (a_class: ET_CLASS; a_feature: ET_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := a_feature.name.position
			code := template_code (vffd4a_template_code)
			etl_code := vffd4_etl_code
			default_template := default_message_template (vffd4a_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_feature.lower_name, 7)
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
			-- dollar7: $7 = feature name
		end

	make_vffd5a (a_class: ET_CLASS; a_feature: ET_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := a_feature.name.position
			code := template_code (vffd5a_template_code)
			etl_code := vffd5_etl_code
			default_template := default_message_template (vffd5a_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_feature.lower_name, 7)
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
			-- dollar7: $7 = feature name
		end

	make_vffd6a (a_class: ET_CLASS; a_feature: ET_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := a_feature.name.position
			code := template_code (vffd6a_template_code)
			etl_code := vffd6_etl_code
			default_template := default_message_template (vffd6a_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_feature.lower_name, 7)
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
			-- dollar7: $7 = feature name
		end

	make_vffd7a (a_class: ET_CLASS; a_feature: ET_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := a_feature.name.position
			code := template_code (vffd7a_template_code)
			etl_code := vffd7_etl_code
			default_template := default_message_template (vffd7a_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_feature.lower_name, 7)
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
			-- dollar7: $7 = feature name
		end

	make_vffd7b (a_class: ET_CLASS; a_feature: ET_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := a_feature.name.position
			code := template_code (vffd7b_template_code)
			etl_code := vffd7_etl_code
			default_template := default_message_template (vffd7b_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_feature.lower_name, 7)
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
			-- dollar7: $7 = feature name
		end

	make_vgcc1a (a_class, a_class_impl: ET_CLASS; a_creation: ET_CREATION_EXPRESSION; a_target: ET_CLASS)
			-- Create a new VGCC-1 error: the creation expression `a_creation',
			-- appearing in `a_class_impl' and viewed from one
			-- of its descendants `a_class' (possibly iteself), has no
			-- Creation_call part but the base class `a_target' of the
			-- creation type is deferred.
			--
			-- ECMA 367-2: p.109
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_creation_not_void: a_creation /= Void
			a_target_not_void: a_target /= Void
		do
			current_class := a_class
			class_impl := a_class_impl
			position := a_creation.position
			code := template_code (vgcc1a_template_code)
			etl_code := vgcc1_etl_code
			default_template := default_message_template (vgcc1a_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_target.upper_name, 7)
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

	make_vgcc1b (a_class, a_class_impl: ET_CLASS; a_creation: ET_CREATION_INSTRUCTION; a_target: ET_CLASS)
			-- Create a new VGCC-1 error: the creation instruction `a_creation',
			-- appearing in `a_class_impl' and viewed from one of its
			-- descendants `a_class' (possibly itself), has no Creation_call
			-- part but the base class `a_target' of the creation type
			-- is deferred.
			--
			-- ECMA 367-2: p.109
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_creation_not_void: a_creation /= Void
			a_target_not_void: a_target /= Void
		do
			current_class := a_class
			class_impl := a_class_impl
			position := a_creation.position
			code := template_code (vgcc1b_template_code)
			etl_code := vgcc1_etl_code
			default_template := default_message_template (vgcc1b_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_target.upper_name, 7)
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

	make_vgcc3a (a_class, a_class_impl: ET_CLASS; a_creation: ET_CREATION_INSTRUCTION; a_creation_named_type, a_target_named_type: ET_NAMED_TYPE)
			-- Create a new VGCC-3 error: the explicit creation type in creation instruction
			-- `a_creation' appearing in `a_class_impl' does not conform to the declared
			-- type of the target entity when viewed from one of its descendants
			-- `a_class' (possibly `a_class_impl' itself).
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
			current_class := a_class
			class_impl := a_class_impl
			position := a_creation.type.position
			code := template_code (vgcc3a_template_code)
			etl_code := vgcc3_etl_code
			default_template := default_message_template (vgcc3a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
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

	make_vgcc5a (a_class, a_class_impl: ET_CLASS; a_creation: ET_CREATION_EXPRESSION; a_target: ET_CLASS)
			-- Create a new VGCC-5 error: the creation expression `a_creation',
			-- appearing in `a_class_impl' and viewed from one
			-- of its descendants `a_class' (possibly iteself), has no
			-- Creation_call part but the base class `a_target' of the
			-- creation type has a Creators part.
			--
			-- ETL2: p.286
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_creation_not_void: a_creation /= Void
			a_target_not_void: a_target /= Void
		do
			current_class := a_class
			class_impl := a_class_impl
			position := a_creation.position
			code := template_code (vgcc5a_template_code)
			etl_code := vgcc5_etl_code
			default_template := default_message_template (vgcc5a_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_target.upper_name, 7)
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

	make_vgcc5b (a_class, a_class_impl: ET_CLASS; a_creation: ET_CREATION_INSTRUCTION; a_target: ET_CLASS)
			-- Create a new VGCC-5 error: the creation instruction `a_creation',
			-- appearing in `a_class_impl' and viewed from one of its
			-- descendants `a_class' (possibly itself), has no Creation_call
			-- part but the base class `a_target' of the creation type
			-- has a Creators part.
			--
			-- ETL2: p.286
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_creation_not_void: a_creation /= Void
			a_target_not_void: a_target /= Void
		do
			current_class := a_class
			class_impl := a_class_impl
			position := a_creation.position
			code := template_code (vgcc5b_template_code)
			etl_code := vgcc5_etl_code
			default_template := default_message_template (vgcc5b_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_target.upper_name, 7)
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

	make_vgcc6a (a_class: ET_CLASS; cp: ET_FEATURE_NAME; f: ET_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := cp.position
			code := template_code (vgcc6a_template_code)
			etl_code := vgcc6_etl_code
			default_template := default_message_template (vgcc6a_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (cp.lower_name, 7)
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
			-- dollar7: $7 = creation procedure name
		end

	make_vgcc6b (a_class: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS)
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
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			code := template_code (vgcc6b_template_code)
			etl_code := vgcc6_etl_code
			default_template := default_message_template (vgcc6b_default_template)
			create parameters.make_filled (empty_string, 1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
			parameters.put (a_feature.name.name, 8)
			parameters.put (a_target.upper_name, 9)
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
			-- dollar7: $7 = feature name of the creation call
			-- dollar8: $8 = name of corresponding feature in class $9
			-- dollar9: $9 = base class of creation type
		end

	make_vgcc6c (a_class, a_class_impl: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS)
			-- Create a new VGCC-6 error: `a_feature' of class `a_target', appearing in
			-- a creation expression with creation procedure name `a_name' in `a_class_impl'
			-- and viewed from one of its descendants `a_class' (possibly itself),
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
			current_class := a_class
			class_impl := a_class_impl
			position := a_name.position
			code := template_code (vgcc6c_template_code)
			etl_code := vgcc6_etl_code
			default_template := default_message_template (vgcc6c_default_template)
			create parameters.make_filled (empty_string, 1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
			parameters.put (a_feature.lower_name, 8)
			parameters.put (a_target.upper_name, 9)
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
			-- dollar8: $8 = name of corresponding feature in class $9
			-- dollar9: $9 = base class of creation type
		end

	make_vgcc6d (a_class: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS)
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
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			code := template_code (vgcc6d_template_code)
			etl_code := vgcc6_etl_code
			default_template := default_message_template (vgcc6d_default_template)
			create parameters.make_filled (empty_string, 1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
			parameters.put (a_feature.lower_name, 8)
			parameters.put (a_target.upper_name, 9)
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
			-- dollar7: $7 = feature name of the creation call
			-- dollar8: $8 = name of corresponding feature in class $9
			-- dollar9: $9 = base class of creation type
		end

	make_vgcc6e (a_class, a_class_impl: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS)
			-- Create a new VGCC-6 error: `a_feature' of class `a_target', appearing in
			-- a creation instruction with creation procedure name `a_name' in `a_class_impl'
			-- and viewed from one of its descendants `a_class' (possibly itself),
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
			current_class := a_class
			class_impl := a_class_impl
			position := a_name.position
			code := template_code (vgcc6e_template_code)
			etl_code := vgcc6_etl_code
			default_template := default_message_template (vgcc6e_default_template)
			create parameters.make_filled (empty_string, 1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
			parameters.put (a_feature.lower_name, 8)
			parameters.put (a_target.upper_name, 9)
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
			-- dollar8: $8 = name of corresponding feature in class $9
			-- dollar9: $9 = base class of creation type
		end

	make_vgcc8a (a_class, a_class_impl: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS; a_formal: ET_FORMAL_PARAMETER)
			-- Create a new VGCC-8 error: `a_feature' of class `a_target', appearing in
			-- a creation expression with creation procedure name `a_name' in `a_class_impl'
			-- and viewed from one of its descendants `a_class' (possibly itself), is not
			-- listed as creation procedure for the formal parameter `a_formal' in `a_class'.
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
			current_class := a_class
			class_impl := a_class_impl
			position := a_name.position
			code := template_code (vgcc8a_template_code)
			etl_code := vgcc8_etl_code
			default_template := default_message_template (vgcc8a_default_template)
			create parameters.make_filled (empty_string, 1, 10)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
			parameters.put (a_feature.lower_name, 8)
			parameters.put (a_target.upper_name, 9)
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
			-- dollar8: $8 = name of corresponding feature in class $9
			-- dollar9: $9 = base class of creation type
			-- dollar10: $10 = index of formal parameter in class $5
		end

	make_vgcc8b (a_class, a_class_impl: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS; a_formal: ET_FORMAL_PARAMETER)
			-- Create a new VGCC-8 error: `a_feature' of class `a_target', appearing in
			-- a creation instruction with creation procedure name `a_name' in `a_class_impl'
			-- and viewed from one of its descendants `a_class' (possibly itself), is not
			-- listed as creation procedure for the formal parameter `a_formal' in `a_class'.
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
			current_class := a_class
			class_impl := a_class_impl
			position := a_name.position
			code := template_code (vgcc8b_template_code)
			etl_code := vgcc8_etl_code
			default_template := default_message_template (vgcc8b_default_template)
			create parameters.make_filled (empty_string, 1, 10)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
			parameters.put (a_feature.lower_name, 8)
			parameters.put (a_target.upper_name, 9)
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
			-- dollar8: $8 = name of corresponding feature in class $9
			-- dollar9: $9 = base class of creation type
			-- dollar10: $10 = index of formal parameter in class $5
		end

	make_vgcp1a (a_class: ET_CLASS; a_creator: ET_CREATOR)
			-- Create a new VGCP-1 error: `a_class' is deferred
			-- but has a Creation clause.
			--
			-- ETL2: p.285
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_creator_not_void: a_creator /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_creator.position
			code := template_code (vgcp1a_template_code)
			etl_code := vgcp1_etl_code
			default_template := default_message_template (vgcp1a_default_template)
			create parameters.make_filled (empty_string, 1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
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
		end

	make_vgcp2a (a_class: ET_CLASS; cp: ET_FEATURE_NAME)
			-- Create a new VGCP-2 error: creation procedure name
			-- `cp' is not the final name of a feature in `a_class'.
			--
			-- ETL2: p.285
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			cp_not_void: cp /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := cp.position
			code := template_code (vgcp2a_template_code)
			etl_code := vgcp2_etl_code
			default_template := default_message_template (vgcp2a_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (cp.lower_name, 7)
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
			-- dollar7: $7 = creation procedure name
		end

	make_vgcp2b (a_class: ET_CLASS; cp: ET_FEATURE_NAME; f: ET_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := cp.position
			code := template_code (vgcp2b_template_code)
			etl_code := vgcp2_etl_code
			default_template := default_message_template (vgcp2b_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (cp.lower_name, 7)
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
			-- dollar7: $7 = creation procedure name
		end

	make_vgcp3a (a_class: ET_CLASS; f1, f2: ET_FEATURE_NAME)
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
			current_class := a_class
			class_impl := a_class
			position := f2.position
			code := template_code (vgcp3a_template_code)
			etl_code := vgcp3_etl_code
			default_template := default_message_template (vgcp3a_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f2.lower_name, 7)
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
			-- dollar7: $7 = procedure name
		end

	make_vgcp3b (a_class: ET_CLASS; f1, f2: ET_FEATURE_NAME)
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
			current_class := a_class
			class_impl := a_class
			position := f2.position
			code := template_code (vgcp3b_template_code)
			etl_code := vgcp3_etl_code
			default_template := default_message_template (vgcp3b_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f2.lower_name, 7)
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
			-- dollar7: $7 = procedure name
		end

	make_vgcp3c (a_class: ET_CLASS; f1, f2: ET_FEATURE_NAME)
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
			current_class := a_class
			class_impl := a_class
			position := f2.position
			code := template_code (vgcp3c_template_code)
			etl_code := vgcp3_etl_code
			default_template := default_message_template (vgcp3c_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f2.lower_name, 7)
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
			-- dollar7: $7 = procedure name
		end

	make_vhay0a (a_class: ET_CLASS)
			-- Create a new VHAY error: `a_class' implicitly inherits
			-- from unknown class ANY.
			--
			-- ETL2: p.88
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			current_class := a_class
			class_impl := a_class
			position := null_position
			code := template_code (vhay0a_template_code)
			etl_code := vhay_etl_code
			default_template := default_message_template (vhay0a_default_template)
			create parameters.make_filled (empty_string, 1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
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
		end

	make_vhpr1a (a_class: ET_CLASS; a_cycle: DS_LIST [ET_CLASS])
			-- Create a new VHPR-1 error: `a_class' is
			-- involved in the inheritance cycle `a_cycle'.
			--
			-- ETL2: p.79
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_cycle_not_void: a_cycle /= Void
			no_void_class: not a_cycle.has_void
			is_cycle: a_cycle.count >= 2
		local
			a_cursor: DS_LIST_CURSOR [ET_CLASS]
			a_string: STRING
		do
			current_class := a_class
			class_impl := a_class
			position := null_position
			code := template_code (vhpr1a_template_code)
			etl_code := vhpr1_etl_code
			default_template := default_message_template (vhpr1a_default_template)
			from
				create a_string.make (20)
				a_cursor := a_cycle.new_cursor
				a_cursor.start
				a_string.append_string (a_cursor.item.upper_name)
				a_cursor.forth
			until
				a_cursor.after
			loop
				a_string.append_string (" -> ")
				a_string.append_string (a_cursor.item.upper_name)
				a_cursor.forth
			end
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_string, 7)
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
			-- dollar7: $7 = cycle
		end

	make_vhpr1b (a_class: ET_CLASS; a_none: ET_BASE_TYPE)
			-- Create a new VHPR-1 error: `a_class' is involved
			-- in the inheritance cycle: it inherits from NONE.
			--
			-- ETL2: p.79
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_none_not_void: a_none /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_none.position
			code := template_code (vhpr1b_template_code)
			etl_code := vhpr1_etl_code
			default_template := default_message_template (vhpr1b_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_none.to_text, 7)
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
			-- dollar7: $7 = class NONE
		end

	make_vhpr3a (a_class: ET_CLASS; a_type: ET_BIT_FEATURE)
			-- Create a new VHPR-3 error: invalid type `a_type'
			-- in parent clause of `a_class'.
			--
			-- ETR: ?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_type.position
			code := template_code (vhpr3a_template_code)
			etl_code := vhpr3_etl_code
			default_template := default_message_template (vhpr3a_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
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
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = invalid type
		end

	make_vhpr3b (a_class: ET_CLASS; a_type: ET_BIT_N)
			-- Create a new VHPR-3 error: invalid type `a_type'
			-- in parent clause of `a_class'.
			--
			-- ETR: ?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_type.position
			code := template_code (vhpr3b_template_code)
			etl_code := vhpr3_etl_code
			default_template := default_message_template (vhpr3b_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
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
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = invalid type
		end

	make_vhpr3c (a_class: ET_CLASS; a_type: ET_LIKE_TYPE)
			-- Create a new VHPR-3 error: invalid type `a_type'
			-- in parent clause of `a_class'.
			--
			-- ETR: ?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_type.position
			code := template_code (vhpr3c_template_code)
			etl_code := vhpr3_etl_code
			default_template := default_message_template (vhpr3c_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
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
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = invalid type
		end

	make_vhrc1a (a_class: ET_CLASS; a_parent: ET_PARENT; a_rename: ET_RENAME)
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
			current_class := a_class
			class_impl := a_class
			position := a_rename.old_name.position
			code := template_code (vhrc1a_template_code)
			etl_code := vhrc1_etl_code
			default_template := default_message_template (vhrc1a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_rename.old_name.lower_name, 7)
			parameters.put (a_parent.type.upper_name, 8)
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
			-- dollar7: $7 = feature name
			-- dollar8: $8 = parent base class
		end

	make_vhrc2a (a_class: ET_CLASS; a_parent: ET_PARENT; a_rename1, a_rename2: ET_RENAME)
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
			current_class := a_class
			class_impl := a_class
			position := a_rename2.old_name.position
			code := template_code (vhrc2a_template_code)
			etl_code := vhrc2_etl_code
			default_template := default_message_template (vhrc2a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_rename2.old_name.lower_name, 7)
			parameters.put (a_parent.type.upper_name, 8)
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
			-- dollar7: $7 = feature name
			-- dollar8: $8 = parent base class
		end

	make_vhrc4a (a_class: ET_CLASS; a_parent: ET_PARENT; a_rename: ET_RENAME; f: ET_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := a_rename.new_name.position
			code := template_code (vhrc4a_template_code)
			etl_code := vhrc4_etl_code
			default_template := default_message_template (vhrc4a_default_template)
			create parameters.make_filled (empty_string, 1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_rename.new_name.feature_name.lower_name, 7)
			parameters.put (f.lower_name, 8)
			parameters.put (a_parent.type.upper_name, 9)
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
			-- dollar7: $7 = new prefix name
			-- dollar8: $8 = old feature name
			-- dollar9: $9 = parent base class
		end

	make_vhrc4b (a_class: ET_CLASS; a_parent: ET_PARENT; a_rename: ET_RENAME; f: ET_FEATURE)
			-- Create a new VHRC-4 error: the Rename_pair
			-- `a_rename' has a new_name with a bracket alias,
			-- but the corresponding feature `f' is not a
			-- function with at least one argument.
			--
			-- ECMA: p.46
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
			a_rename_not_void: a_rename /= Void
			a_rename_has_alias: a_rename.new_name.alias_name /= Void
			a_rename_alias_bracket: a_rename.new_name.alias_name.is_bracket
			f_not_void: f /= Void
			f_not_brackable: not f.is_bracketable
		do
			current_class := a_class
			class_impl := a_class
			position := a_rename.new_name.alias_name.position
			code := template_code (vhrc4b_template_code)
			etl_code := vhrc4_etl_code
			default_template := default_message_template (vhrc4b_default_template)
			create parameters.make_filled (empty_string, 1, 10)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_rename.new_name.feature_name.lower_name, 7)
			parameters.put (a_rename.new_name.alias_name.alias_lower_name, 8)
			parameters.put (f.lower_name, 9)
			parameters.put (a_parent.type.upper_name, 10)
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
			-- dollar7: $7 = new feature name
			-- dollar8: $8 = new alias name
			-- dollar9: $9 = old feature name
			-- dollar10: $10 = parent base class
		end

	make_vhrc4c (a_class: ET_CLASS; a_parent: ET_PARENT; a_rename: ET_RENAME; f: ET_FEATURE)
			-- Create a new VHRC-4 error: the Rename_pair `a_rename' has
			-- a new_name with a binary operator alias,
			-- but the corresponding feature `f' is not a
			-- function with exactly one argument.
			--
			-- ECMA: p.46
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
			a_rename_not_void: a_rename /= Void
			a_rename_has_alias: a_rename.new_name.alias_name /= Void
			a_rename_alias_infix: a_rename.new_name.alias_name.is_infix
			f_not_void: f /= Void
			f_not_infixable: not f.is_infixable
		do
			current_class := a_class
			class_impl := a_class
			position := a_rename.new_name.alias_name.position
			code := template_code (vhrc4c_template_code)
			etl_code := vhrc4_etl_code
			default_template := default_message_template (vhrc4c_default_template)
			create parameters.make_filled (empty_string, 1, 10)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_rename.new_name.feature_name.lower_name, 7)
			parameters.put (a_rename.new_name.alias_name.alias_lower_name, 8)
			parameters.put (f.lower_name, 9)
			parameters.put (a_parent.type.upper_name, 10)
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
			-- dollar7: $7 = new feature name
			-- dollar8: $8 = new alias name
			-- dollar9: $9 = old feature name
			-- dollar10: $10 = parent base class
		end

	make_vhrc4d (a_class: ET_CLASS; a_parent: ET_PARENT; a_rename: ET_RENAME; f: ET_FEATURE)
			-- Create a new VHRC-4 error: the Rename_pair `a_rename' has
			-- a new_name with a unary operator alias,
			-- but the corresponding feature `f' is not a
			-- query with no argument.
			--
			-- ECMA: p.46
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
			a_rename_not_void: a_rename /= Void
			a_rename_has_alias: a_rename.new_name.alias_name /= Void
			a_rename_alias_prefix: a_rename.new_name.alias_name.is_prefix
			f_not_void: f /= Void
			f_not_prefixable: not f.is_prefixable
		do
			current_class := a_class
			class_impl := a_class
			position := a_rename.new_name.alias_name.position
			code := template_code (vhrc4d_template_code)
			etl_code := vhrc4_etl_code
			default_template := default_message_template (vhrc4d_default_template)
			create parameters.make_filled (empty_string, 1, 10)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_rename.new_name.feature_name.lower_name, 7)
			parameters.put (a_rename.new_name.alias_name.alias_lower_name, 8)
			parameters.put (f.lower_name, 9)
			parameters.put (a_parent.type.upper_name, 10)
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
			-- dollar7: $7 = new feature name
			-- dollar8: $8 = new alias name
			-- dollar9: $9 = old feature name
			-- dollar10: $10 = parent base class
		end

	make_vhrc5a (a_class: ET_CLASS; a_parent: ET_PARENT; a_rename: ET_RENAME; f: ET_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := a_rename.new_name.position
			code := template_code (vhrc5a_template_code)
			etl_code := vhrc5_etl_code
			default_template := default_message_template (vhrc5a_default_template)
			create parameters.make_filled (empty_string, 1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_rename.new_name.feature_name.lower_name, 7)
			parameters.put (f.lower_name, 8)
			parameters.put (a_parent.type.upper_name, 9)
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
			-- dollar7: $7 = new infix name
			-- dollar8: $8 = old feature name
			-- dollar9: $9 = parent base class
		end

	make_vjar0a (a_class, a_class_impl: ET_CLASS; an_assignment: ET_ASSIGNMENT; a_source_type, a_target_type: ET_NAMED_TYPE)
			-- Create a new VJAR error: the source expression of `an_assignment' in `a_class_impl'
			-- does not conform to its target entity when viewed from `one of its descendants
			-- a_class' (possibly itself).
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
			current_class := a_class
			class_impl := a_class_impl
			position := an_assignment.source.position
			code := template_code (vjar0a_template_code)
			etl_code := vjar_etl_code
			default_template := default_message_template (vjar0a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
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

	make_vjaw0a (a_class: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			code := template_code (vjaw0a_template_code)
			etl_code := vjaw_etl_code
			default_template := default_message_template (vjaw0a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
			parameters.put (a_feature.lower_name, 8)
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
			-- dollar7: $7 = feature name
			-- dollar8: $8 = name of corresponding feature in class $5
		end

	make_vjaw0b (a_class: ET_CLASS; a_name: ET_IDENTIFIER; a_feature: ET_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			code := template_code (vjaw0b_template_code)
			etl_code := vjaw_etl_code
			default_template := default_message_template (vjaw0b_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
			parameters.put (a_feature.lower_name, 8)
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
			-- dollar7: $7 = formal argument name
			-- dollar8: $8 = feature name
		end

	make_vjaw0c (a_class: ET_CLASS; a_name: ET_IDENTIFIER; an_agent: ET_INLINE_AGENT)
			-- Report VJAW error: `a_name' is supposed to be a Writable but
			-- it is a formal argument name of inline agent `an_agent'.
			--
			-- Only in ISE Eiffel.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			an_agent_not_void: an_agent /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			code := template_code (vjaw0c_template_code)
			etl_code := vjaw_etl_code
			default_template := default_message_template (vjaw0c_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
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
			-- dollar7: $7 = formal argument name
		end

	make_vjrv0a (a_class, a_class_impl: ET_CLASS; a_target: ET_WRITABLE; a_target_type: ET_NAMED_TYPE)
			-- Create a new VJRV error: the type `a_target_type' of the target
			-- `a_target' of an assignment attempt appearing in `a_class_impl'
			-- and viewed from one of its descedants `a_class' (possibly itselft)
			-- is not a reference type.
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
			current_class := a_class
			class_impl := a_class_impl
			position := a_target.position
			code := template_code (vjrv0a_template_code)
			etl_code := vjrv_etl_code
			default_template := default_message_template (vjrv0a_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
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

	make_vkcn1a (a_class: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS)
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
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			code := template_code (vkcn1a_template_code)
			etl_code := vkcn1_etl_code
			default_template := default_message_template (vkcn1a_default_template)
			create parameters.make_filled (empty_string, 1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
			parameters.put (a_feature.lower_name, 8)
			parameters.put (a_target.upper_name, 9)
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
			-- dollar7: $7 = feature name of the call
			-- dollar8: $8 = name of corresponding feature in class $9
			-- dollar9: $9 = base class of target of the call
		end

	make_vkcn1c (a_class: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			code := template_code (vkcn1c_template_code)
			etl_code := vkcn1_etl_code
			default_template := default_message_template (vkcn1c_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
			parameters.put (a_feature.lower_name, 8)
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
			-- dollar7: $7 = feature name of the call
			-- dollar8: $8 = name of corresponding feature in class $5
		end

	make_vkcn2a (a_class: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS)
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
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			code := template_code (vkcn2a_template_code)
			etl_code := vkcn2_etl_code
			default_template := default_message_template (vkcn2a_default_template)
			create parameters.make_filled (empty_string, 1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
			parameters.put (a_feature.lower_name, 8)
			parameters.put (a_target.upper_name, 9)
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
			-- dollar7: $7 = feature name of the call
			-- dollar8: $8 = name of corresponding feature in class $9
			-- dollar9: $9 = base class of target of the call
		end

	make_vkcn2c (a_class: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			code := template_code (vkcn2c_template_code)
			etl_code := vkcn2_etl_code
			default_template := default_message_template (vkcn2c_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
			parameters.put (a_feature.lower_name, 8)
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
			-- dollar7: $7 = feature name of the call
			-- dollar8: $8 = name of corresponding feature in class $5
		end

	make_vlel1a (a_class: ET_CLASS; a_parent: ET_PARENT; all1, all2: ET_ALL_EXPORT)
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
			current_class := a_class
			class_impl := a_class
			position := all2.all_keyword.position
			code := template_code (vlel1a_template_code)
			etl_code := vlel1_etl_code
			default_template := default_message_template (vlel1a_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_parent.type.upper_name, 7)
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
			-- dollar7: $7 = parent base class
		end

	make_vlel2a (a_class: ET_CLASS; a_parent: ET_PARENT; f: ET_FEATURE_NAME)
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
			current_class := a_class
			class_impl := a_class
			position := f.position
			code := template_code (vlel2a_template_code)
			etl_code := vlel2_etl_code
			default_template := default_message_template (vlel2a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f.lower_name, 7)
			parameters.put (a_parent.type.upper_name, 8)
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
			-- dollar7: $7 = feature name
			-- dollar8: $8 = parent base class
		end

	make_vlel3a (a_class: ET_CLASS; a_parent: ET_PARENT; f1, f2: ET_FEATURE_NAME)
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
			current_class := a_class
			class_impl := a_class
			position := f2.position
			code := template_code (vlel3a_template_code)
			etl_code := vlel3_etl_code
			default_template := default_message_template (vlel3a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f2.lower_name, 7)
			parameters.put (a_parent.type.upper_name, 8)
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
			-- dollar7: $7 = feature name
			-- dollar8: $8 = parent base class
		end

	make_vmfn0a (a_class: ET_CLASS; f1, f2: ET_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := f2.name.position
			code := template_code (vmfn0a_template_code)
			etl_code := vmfn_etl_code
			default_template := default_message_template (vmfn0a_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f2.lower_name, 7)
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
			-- dollar7: $7 = feature name
		end

	make_vmfn0b (a_class: ET_CLASS; f1: ET_PARENT_FEATURE; f2: ET_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := f2.name.position
			code := template_code (vmfn0b_template_code)
			etl_code := vmfn_etl_code
			default_template := default_message_template (vmfn0b_default_template)
			create parameters.make_filled (empty_string, 1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f2.lower_name, 7)
			parameters.put (f1.precursor_feature.lower_name, 8)
			parameters.put (f1.parent.type.upper_name, 9)
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
			-- dollar7: $7 = first feature name (in current class)
			-- dollar8: $8 = second feature name (in parent)
			-- dollar9: $9 = parent base class
		end

	make_vmfn0c (a_class: ET_CLASS; f1, f2: ET_PARENT_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := f1.parent.type.name.position
			code := template_code (vmfn0c_template_code)
			etl_code := vmfn_etl_code
			default_template := default_message_template (vmfn0c_default_template)
			create parameters.make_filled (empty_string, 1, 10)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f1.precursor_feature.lower_name, 7)
			parameters.put (f1.parent.type.upper_name, 8)
			parameters.put (f2.precursor_feature.lower_name, 9)
			parameters.put (f2.parent.type.upper_name, 10)
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
			-- dollar7: $7 = first feature name
			-- dollar8: $8 = first parent base class
			-- dollar9: $9 = second feature name
			-- dollar10: $10 = second parent base class
		end

	make_vmfn2a (a_class: ET_CLASS; f1, f2: ET_PARENT_FEATURE)
			-- Create a new VMFN-2 error: features `f1' and `f2' are shared,
			-- but `f1' has an alias and not `f2'.
			--
			-- ECMA: p.93
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f1_no_alias: f1.alias_name /= Void
			f2_not_void: f2 /= Void
			f2_alias: f2.alias_name = Void
		do
			current_class := a_class
			class_impl := a_class
			position := f1.parent.type.name.position
			code := template_code (vmfn2a_template_code)
			etl_code := vmfn2_etl_code
			default_template := default_message_template (vmfn2a_default_template)
			create parameters.make_filled (empty_string, 1, 10)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f1.name.lower_name, 7)
			parameters.put (f1.alias_name.alias_lower_name, 8)
			parameters.put (f1.parent.type.upper_name, 9)
			parameters.put (f2.parent.type.upper_name, 10)
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
			-- dollar7: $7 = feature name
			-- dollar7: $8 = first alias name
			-- dollar9: $9 = first parent base class
			-- dollar10: $10 = second parent base class
		end

	make_vmfn2b (a_class: ET_CLASS; f1, f2: ET_PARENT_FEATURE)
			-- Create a new VMFN-2 error: features `f1' and `f2' are shared,
			-- they both have an alias but it is not the same.
			--
			-- ECMA: p.93
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f1_alias: f1.alias_name /= Void
			f2_not_void: f2 /= Void
			f2_alias: f2.alias_name /= Void
			not_same_alias: not f1.alias_name.same_alias_name (f2.alias_name)
		do
			current_class := a_class
			class_impl := a_class
			position := f1.parent.type.name.position
			code := template_code (vmfn2b_template_code)
			etl_code := vmfn2_etl_code
			default_template := default_message_template (vmfn2b_default_template)
			create parameters.make_filled (empty_string, 1, 11)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f1.name.lower_name, 7)
			parameters.put (f1.alias_name.alias_lower_name, 8)
			parameters.put (f1.parent.type.upper_name, 9)
			parameters.put (f2.alias_name.alias_lower_name, 10)
			parameters.put (f2.parent.type.upper_name, 11)
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
			-- dollar7: $7 = feature name
			-- dollar8: $8 = first alias name
			-- dollar9: $9 = first parent base class
			-- dollar10: $10 = second alias name
			-- dollar11: $11 = second parent base class
		end

	make_vmrc2a (a_class: ET_CLASS; replicated_features: DS_LIST [ET_PARENT_FEATURE])
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
			no_void_feature: not replicated_features.has_void
			replicated: replicated_features.count >= 2
		local
			a_cursor: DS_LIST_CURSOR [ET_PARENT_FEATURE]
			a_feature: ET_PARENT_FEATURE
			a_string: STRING
		do
			current_class := a_class
			class_impl := a_class
			a_feature := replicated_features.first
			position := a_feature.parent.type.name.position
			code := template_code (vmrc2a_template_code)
			etl_code := vmrc2_etl_code
			default_template := default_message_template (vmrc2a_default_template)
			a_cursor := replicated_features.new_cursor
			from
				create a_string.make (20)
				a_cursor.start
				a_feature := a_cursor.item
				a_string.append_string (a_feature.parent.type.upper_name)
				a_string.append_character ('.')
				a_string.append_string (a_feature.precursor_feature.lower_name)
				a_cursor.forth
			until
				a_cursor.after
			loop
				a_string.append_string (", ")
				a_feature := a_cursor.item
				a_string.append_string (a_feature.parent.type.upper_name)
				a_string.append_character ('.')
				a_string.append_string (a_feature.precursor_feature.lower_name)
				a_cursor.forth
			end
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_string, 7)
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
			-- dollar7: $7 = replicated features
		end

	make_vmrc2b (a_class: ET_CLASS; replicated_features: DS_LIST [ET_PARENT_FEATURE])
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
			no_void_feature: not replicated_features.has_void
			-- all_selected: forall f in replicated_features, f.has_select
			replicated: replicated_features.count >= 2
		local
			a_cursor: DS_LIST_CURSOR [ET_PARENT_FEATURE]
			a_feature: ET_PARENT_FEATURE
			a_string: STRING
		do
			current_class := a_class
			class_impl := a_class
			a_feature := replicated_features.first
			position := a_feature.select_name.position
			code := template_code (vmrc2b_template_code)
			etl_code := vmrc2_etl_code
			default_template := default_message_template (vmrc2b_default_template)
			a_cursor := replicated_features.new_cursor
			from
				create a_string.make (20)
				a_cursor.start
				a_feature := a_cursor.item
				a_string.append_string (a_feature.parent.type.upper_name)
				a_string.append_character ('.')
				a_string.append_string (a_feature.precursor_feature.lower_name)
				a_cursor.forth
			until
				a_cursor.after
			loop
				a_string.append_string (", ")
				a_feature := a_cursor.item
				a_string.append_string (a_feature.parent.type.upper_name)
				a_string.append_character ('.')
				a_string.append_string (a_feature.precursor_feature.lower_name)
				a_cursor.forth
			end
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_string, 7)
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
			-- dollar7: $7 = replicated features
		end

	make_vmss1a (a_class: ET_CLASS; a_parent: ET_PARENT; f: ET_FEATURE_NAME)
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
			current_class := a_class
			class_impl := a_class
			position := f.position
			code := template_code (vmss1a_template_code)
			etl_code := vmss1_etl_code
			default_template := default_message_template (vmss1a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f.lower_name, 7)
			parameters.put (a_parent.type.upper_name, 8)
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
			-- dollar7: $7 = feature name
			-- dollar8: $8 = parent base class
		end

	make_vmss2a (a_class: ET_CLASS; a_parent: ET_PARENT; f1, f2: ET_FEATURE_NAME)
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
			current_class := a_class
			class_impl := a_class
			position := f2.position
			code := template_code (vmss2a_template_code)
			etl_code := vmss2_etl_code
			default_template := default_message_template (vmss2a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (f2.lower_name, 7)
			parameters.put (a_parent.type.upper_name, 8)
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
			-- dollar7: $7 = feature name
			-- dollar8: $8 = parent base class
		end

	make_vmss3a (a_class: ET_CLASS; a_feature: ET_PARENT_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := a_feature.select_name.position
			code := template_code (vmss3a_template_code)
			etl_code := vmss3_etl_code
			default_template := default_message_template (vmss3a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_feature.select_name.lower_name, 7)
			parameters.put (a_feature.parent.type.upper_name, 8)
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
			-- dollar7: $7 = feature name
			-- dollar8: $8 = parent base class
		end

	make_voit1a (a_class, a_class_impl: ET_CLASS; an_expression: ET_EXPRESSION; a_type: ET_NAMED_TYPE)
			-- Create a new VOIT-1 error: the type `a_type' of the across iterable expression
			-- `an_expression' appearing in `a_class_impl' and viewed from one of its
			-- descendants `a_class' (possibly itself) does not conform to "ITERABLE".
			--
			-- Not in ECMA.
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			an_expression_not_void: an_expression /= Void
			a_type_not_void: a_type /= Void
		do
			current_class := a_class
			class_impl := a_class_impl
			position := an_expression.position
			code := template_code (voit1a_template_code)
			etl_code := voit1_etl_code
			default_template := default_message_template (voit1a_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
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
			-- dollar7: $7 = base type of across iterable expression
		end

	make_voit2a (a_class: ET_CLASS; a_across_component: ET_ACROSS_COMPONENT; a_feature: ET_FEATURE)
			-- Create a new VOIT-2 error: The cursor of `a_across_component' has the same
			-- name as `a_feature' in `a_class'.
			--
			-- Not in ECMA.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_across_component_not_void: a_across_component /= Void
			a_feature_not_void: a_feature /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_across_component.cursor_name.position
			code := template_code (voit2a_template_code)
			etl_code := voit2_etl_code
			default_template := default_message_template (voit2a_default_template)
			create parameters.make_filled (empty_string, 1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (a_across_component.cursor_name.lower_name, 6)
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
			-- dollar6: $6 = across cursor name
		end

	make_voit2b (a_class: ET_CLASS; a_across_component: ET_ACROSS_COMPONENT; arg: ET_FORMAL_ARGUMENT)
			-- Create a new VOIT-2 error: The cursor of `a_across_component' has
			-- the same name as argument `arg' of an enclosing feature or
			-- inline agent.
			--
			-- Not in ECMA.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_across_component_not_void: a_across_component /= Void
			arg_not_void: arg /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_across_component.cursor_name.position
			code := template_code (voit2b_template_code)
			etl_code := voit2_etl_code
			default_template := default_message_template (voit2b_default_template)
			create parameters.make_filled (empty_string, 1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (a_across_component.cursor_name.lower_name, 6)
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
			-- dollar6: $6 = across cursor name
		end

	make_voit2c (a_class: ET_CLASS; a_across_component: ET_ACROSS_COMPONENT; a_local: ET_LOCAL_VARIABLE)
			-- Create a new VOIT-2 error: The cursor of `a_across_component' has
			-- the same name as local variable `a_local' of an enclosing
			-- feature or inline agent.
			--
			-- Not in ECMA.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_across_component_not_void: a_across_component /= Void
			a_local_not_void: a_local /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_across_component.cursor_name.position
			code := template_code (voit2c_template_code)
			etl_code := voit2_etl_code
			default_template := default_message_template (voit2c_default_template)
			create parameters.make_filled (empty_string, 1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (a_across_component.cursor_name.lower_name, 6)
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
			-- dollar6: $6 = across cursor name
		end

	make_voit2d (a_class: ET_CLASS; a_across_component: ET_ACROSS_COMPONENT; a_object_test: ET_NAMED_OBJECT_TEST)
			-- Create a new VOIT-2 error: `a_across_component' appears in the scope
			-- of the local of `a_object_test' with the same local name.
			--
			-- ECMA 367-2: p.127
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_across_component_not_void: a_across_component /= Void
			a_object_test_not_void: a_object_test /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_across_component.cursor_name.position
			code := template_code (voit2d_template_code)
			etl_code := voit2_etl_code
			default_template := default_message_template (voit2d_default_template)
			create parameters.make_filled (empty_string, 1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (a_across_component.cursor_name.lower_name, 6)
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
			-- dollar6: $6 = across cursor name
		end

	make_voit2e (a_class: ET_CLASS; a_across_component1, a_across_component2: ET_ACROSS_COMPONENT)
			-- Create a new VUOT-1 error: `a_across_component1' appears in the scope
			-- of the cursor of `a_across_component2' with the same cursor name.
			--
			-- Not in ECMA.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_across_component1_not_void: a_across_component1 /= Void
			a_across_component2_not_void: a_across_component2 /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_across_component1.cursor_name.position
			code := template_code (voit2e_template_code)
			etl_code := voit2_etl_code
			default_template := default_message_template (voit2e_default_template)
			create parameters.make_filled (empty_string, 1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (a_across_component1.cursor_name.lower_name, 6)
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
			-- dollar6: $6 = across cursor name
		end

	make_vomb1a (a_class, a_class_impl: ET_CLASS; an_expression: ET_EXPRESSION; a_type: ET_NAMED_TYPE)
			-- Create a new VOMB-1 error: the inspect expression `an_expression'
			-- in `a_class_impl' and viewed from one of its descendants `a_class'
			-- (possibly itself) is of type `a_type' which is not "INTEGER"
			-- or "CHARACTER".
			--
			-- ETL2: p.239
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			an_expression_not_void: an_expression /= Void
			a_type_not_void: a_type /= Void
		do
			current_class := a_class
			class_impl := a_class_impl
			position := an_expression.position
			code := template_code (vomb1a_template_code)
			etl_code := vomb1_etl_code
			default_template := default_message_template (vomb1a_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
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

	make_vomb2a (a_class, a_class_impl: ET_CLASS; a_constant: ET_CHOICE_CONSTANT; a_constant_type, a_value_type: ET_NAMED_TYPE)
			-- Create a new VOMB-2 error: the inspect constant `a_constant' in
			-- `a_class_impl' and viewed from one of its descendants `a_class'
			-- (possibly itself) is of type `a_constant_type' which is not the
			-- same as the type `a_value_type' of the inspect expression.
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
			current_class := a_class
			class_impl := a_class_impl
			position := a_constant.position
			code := template_code (vomb2a_template_code)
			etl_code := vomb2_etl_code
			default_template := default_message_template (vomb2a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
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

	make_vomb2b (a_class, a_class_impl: ET_CLASS; a_constant: ET_CHOICE_CONSTANT)
			-- Create a new VOMB-2 error: the inspect choice `a_constant' in
			-- `a_class_impl' and viewed from one of its descendants `a_class'
			-- (possibly itself) is not a constant attribute.
			--
			-- ETL2: p.239
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_constant_not_void: a_constant /= Void
		do
			current_class := a_class
			class_impl := a_class_impl
			position := a_constant.position
			code := template_code (vomb2b_template_code)
			etl_code := vomb2_etl_code
			default_template := default_message_template (vomb2b_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			if attached {ET_IDENTIFIER} a_constant as l_identifier then
				parameters.put (l_identifier.lower_name, 7)
			elseif attached {ET_STATIC_CALL_EXPRESSION} a_constant as l_static_call then
				parameters.put (l_static_call.name.lower_name, 7)
			else
-- TODO: Should never happen. Find a better way to handle that.
				parameters.put ("", 7)
			end
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
			-- dollar7: $7 = choice name
		end

	make_vpca1a (a_class: ET_CLASS; a_name: ET_FEATURE_NAME)
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
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			code := template_code (vpca1a_template_code)
			etl_code := vpca1_etl_code
			default_template := default_message_template (vpca1a_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
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
			-- dollar7: $7 = feature name of the call agent
		end

	make_vpca1b (a_class: ET_CLASS; a_name: ET_FEATURE_NAME; a_target: ET_CLASS)
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
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			code := template_code (vpca1b_template_code)
			etl_code := vpca1_etl_code
			default_template := default_message_template (vpca1b_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
			parameters.put (a_target.upper_name, 8)
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
			-- dollar7: $7 = feature name of the call agent
			-- dollar8: $8 = base class of target of the call agent
		end

	make_vpca2a (a_class, a_class_impl: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS)
			-- Create a new VPCA-2 error: `a_feature' of class `a_target'
			-- is not exported to `a_class', one of the descendants
			-- of `a_class_impl' (possibly itself) where the qualified call agent
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
			current_class := a_class
			class_impl := a_class_impl
			position := a_name.position
			code := template_code (vpca2a_template_code)
			etl_code := vpca2_etl_code
			default_template := default_message_template (vpca2a_default_template)
			create parameters.make_filled (empty_string, 1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
			parameters.put (a_feature.lower_name, 8)
			parameters.put (a_target.upper_name, 9)
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

	make_vpca3a (a_class: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS)
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
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			code := template_code (vpca3a_template_code)
			etl_code := vpca3_etl_code
			default_template := default_message_template (vpca3a_default_template)
			create parameters.make_filled (empty_string, 1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
			parameters.put (a_feature.lower_name, 8)
			parameters.put (a_target.upper_name, 9)
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
			-- dollar7: $7 = feature name of the call agent
			-- dollar8: $8 = name of corresponding feature in class $9
			-- dollar9: $9 = base class of target of the call agent
		end

	make_vpca3b (a_class: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			code := template_code (vpca3b_template_code)
			etl_code := vpca3_etl_code
			default_template := default_message_template (vpca3b_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
			parameters.put (a_feature.lower_name, 8)
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
			-- dollar7: $7 = feature name of the call agent
			-- dollar8: $8 = name of corresponding feature in class $5
		end

	make_vpca4a (a_class, a_class_impl: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS; arg: INTEGER; an_actual, a_formal: ET_NAMED_TYPE)
			-- Create a new VPCA-4 error: the `arg'-th actual argument in the qualified
			-- call agent `a_name' appearing in `a_class_impl' and viewed from one of its
			-- descendants `a_class' (possibly itself) does not conform to the corresponding
			-- formal argument of `a_feature' in class `a_target'.
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
			current_class := a_class
			class_impl := a_class_impl
			position := a_name.position
			code := template_code (vpca4a_template_code)
			etl_code := vpca4_etl_code
			default_template := default_message_template (vpca4a_default_template)
			create parameters.make_filled (empty_string, 1, 12)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
			parameters.put (a_feature.name.name, 8)
			parameters.put (a_target.upper_name, 9)
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

	make_vpca4b (a_class, a_class_impl: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; arg: INTEGER; an_actual, a_formal: ET_NAMED_TYPE)
			-- Create a new VPCA-4 error: the `arg'-th actual argument in the unqualified
			-- call agent `a_name' appearing in `a_class_impl' and viewed from one of its
			-- descendants `a_class' (possibly itself) does not conform to the corresponding
			-- formal argument of `a_feature' in `a_class_impl'.
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
			current_class := a_class
			class_impl := a_class_impl
			position := a_name.position
			code := template_code (vpca4b_template_code)
			etl_code := vpca4_etl_code
			default_template := default_message_template (vpca4b_default_template)
			create parameters.make_filled (empty_string, 1, 11)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
			parameters.put (a_feature.lower_name, 8)
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

	make_vpca5a (a_class, a_class_impl: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS; arg: INTEGER; an_actual, a_formal: ET_NAMED_TYPE)
			-- Create a new VPCA-5 error: the type specified for the `arg'-th actual
			-- argument in the qualified call agent `a_name' appearing in `a_class_impl'
			-- and viewed from one of its descendants `a_class' (possibly itself) does
			-- not conform to the corresponding formal argument of `a_feature' in
			-- class `a_target'.
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
			current_class := a_class
			class_impl := a_class_impl
			position := a_name.position
			code := template_code (vpca5a_template_code)
			etl_code := vpca5_etl_code
			default_template := default_message_template (vpca5a_default_template)
			create parameters.make_filled (empty_string, 1, 12)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
			parameters.put (a_feature.lower_name, 8)
			parameters.put (a_target.upper_name, 9)
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

	make_vpca5b (a_class, a_class_impl: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; arg: INTEGER; an_actual, a_formal: ET_NAMED_TYPE)
			-- Create a new VPCA-5 error: the type specified for the `arg'-th actual
			-- argument in the unqualified call agent `a_name' appearing in `a_class_impl'
			-- and viewed from one of its descendants `a_class' (possiby itself) does not
			-- conform to the corresponding formal argument of `a_feature' in `a_class_impl'.
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
			current_class := a_class
			class_impl := a_class_impl
			position := a_name.position
			code := template_code (vpca5b_template_code)
			etl_code := vpca5_etl_code
			default_template := default_message_template (vpca5b_default_template)
			create parameters.make_filled (empty_string, 1, 11)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
			parameters.put (a_feature.lower_name, 8)
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

	make_vpir1a (a_class: ET_CLASS; arg1: ET_FORMAL_ARGUMENT; an_agent: ET_INLINE_AGENT; arg2: ET_FORMAL_ARGUMENT)
			-- Create a new VPIR-1 error: `arg1' in inline agent `an_agent' has
			-- the same name as argument `arg2' of an enclosing feature or
			-- inline agent.
			--
			-- ECMA 367-2: p.136
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			arg1_not_void: arg1 /= Void
			an_agent_not_void: an_agent /= Void
			arg2_not_void: arg2 /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := arg1.name.position
			code := template_code (vpir1a_template_code)
			etl_code := vpir1_etl_code
			default_template := default_message_template (vpir1a_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (arg1.name.lower_name, 7)
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
			-- dollar7: $7 = argument name
		end

	make_vpir1b (a_class: ET_CLASS; arg1: ET_FORMAL_ARGUMENT; an_agent: ET_INLINE_AGENT; a_local2: ET_LOCAL_VARIABLE)
			-- Create a new VPIR-1 error: `arg1' in inline agent `an_agent' has
			-- the same name as local variable `a_local2' of an enclosing
			-- feature or inline agent.
			--
			-- ECMA 367-2: p.136
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			arg1_not_void: arg1 /= Void
			an_agent_not_void: an_agent /= Void
			a_local2_not_void: a_local2 /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := arg1.name.position
			code := template_code (vpir1b_template_code)
			etl_code := vpir1_etl_code
			default_template := default_message_template (vpir1b_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (arg1.name.lower_name, 7)
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
			-- dollar7: $7 = argument name
		end

	make_vpir1c (a_class: ET_CLASS; a_local1: ET_LOCAL_VARIABLE; an_agent: ET_INLINE_AGENT; arg2: ET_FORMAL_ARGUMENT)
			-- Create a new VPIR-1 error: `a_local1' in inline agent `an_agent' has
			-- the same name as argument `arg2' of an enclosing feature or
			-- inline agent.
			--
			-- ECMA 367-2: p.136
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_local1_not_void: a_local1 /= Void
			an_agent_not_void: an_agent /= Void
			arg2_not_void: arg2 /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_local1.name.position
			code := template_code (vpir1c_template_code)
			etl_code := vpir1_etl_code
			default_template := default_message_template (vpir1c_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_local1.name.lower_name, 7)
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
			-- dollar7: $7 = local variable name
		end

	make_vpir1d (a_class: ET_CLASS; a_local1: ET_LOCAL_VARIABLE; an_agent: ET_INLINE_AGENT; a_local2: ET_LOCAL_VARIABLE)
			-- Create a new VPIR-1 error: `a_local1' in inline agent `an_agent' has
			-- the same name as local variable `a_local2' of an enclosing feature or
			-- inline agent.
			--
			-- ECMA 367-2: p.136
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_local1_not_void: a_local1 /= Void
			an_agent_not_void: an_agent /= Void
			a_local2_not_void: a_local2 /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_local1.name.position
			code := template_code (vpir1d_template_code)
			etl_code := vpir1_etl_code
			default_template := default_message_template (vpir1d_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_local1.name.lower_name, 7)
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
			-- dollar7: $7 = local variable name
		end

	make_vpir1e (a_class: ET_CLASS; arg: ET_FORMAL_ARGUMENT; an_agent: ET_INLINE_AGENT; a_object_test: ET_NAMED_OBJECT_TEST)
			-- Create a new VPIR-1 error: `arg' in inline agent `an_agent' has
			-- the same name as object-test local `a_object_test' of an enclosing
			-- feature or inline agent whose scope contains the inline agent.
			--
			-- ECMA 367-2: p.136
			-- This rule should be extended to say they should not have the same lower-name
			-- as an object-test local of an enclosing feature or inline agent whose scope
			-- contains the inline agent. See message sent by Eric Bezault to ECMA on 9 April 2008.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			arg_not_void: arg /= Void
			an_agent_not_void: an_agent /= Void
			a_object_test_not_void: a_object_test /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := arg.name.position
			code := template_code (vpir1e_template_code)
			etl_code := vpir1_etl_code
			default_template := default_message_template (vpir1e_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (arg.name.lower_name, 7)
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
			-- dollar7: $7 = argument name
		end

	make_vpir1f (a_class: ET_CLASS; a_local: ET_LOCAL_VARIABLE; an_agent: ET_INLINE_AGENT; a_object_test: ET_NAMED_OBJECT_TEST)
			-- Create a new VPIR-1 error: `a_local' in inline agent `an_agent' has
			-- the same name as object-test local `a_object_test' of an enclosing
			-- feature or inline agent whose scope contains the inline agent.
			--
			-- ECMA 367-2: p.136
			-- This rule should be extended to say they should not have the same lower-name
			-- as an object-test local of an enclosing feature or inline agent whose scope
			-- contains the inline agent. See message sent by Eric Bezault to ECMA on 9 April 2008.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_local_not_void: a_local /= Void
			an_agent_not_void: an_agent /= Void
			a_object_test_not_void: a_object_test /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_local.name.position
			code := template_code (vpir1f_template_code)
			etl_code := vpir1_etl_code
			default_template := default_message_template (vpir1f_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_local.name.lower_name, 7)
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
			-- dollar7: $7 = local name
		end

	make_vpir1g (a_class: ET_CLASS; arg: ET_FORMAL_ARGUMENT; an_agent: ET_INLINE_AGENT; a_across_component: ET_ACROSS_COMPONENT)
			-- Create a new VPIR-1 error: `arg' in inline agent `an_agent' has
			-- the same name as the cursor of `a_across_component' of an enclosing
			-- feature or inline agent whose scope contains the inline agent.
			--
			-- Not in ECMA.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			arg_not_void: arg /= Void
			an_agent_not_void: an_agent /= Void
			a_across_component_not_void: a_across_component /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := arg.name.position
			code := template_code (vpir1g_template_code)
			etl_code := vpir1_etl_code
			default_template := default_message_template (vpir1g_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (arg.name.lower_name, 7)
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
			-- dollar7: $7 = argument name
		end

	make_vpir1h (a_class: ET_CLASS; a_local: ET_LOCAL_VARIABLE; an_agent: ET_INLINE_AGENT; a_across_component: ET_ACROSS_COMPONENT)
			-- Create a new VPIR-1 error: `a_local' in inline agent `an_agent' has
			-- the same name as the cursor of `a_across_component' of an enclosing
			-- feature or inline agent whose scope contains the inline agent.
			--
			-- Not in ECMA.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_local_not_void: a_local /= Void
			an_agent_not_void: an_agent /= Void
			a_across_component_not_void: a_across_component /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_local.name.position
			code := template_code (vpir1h_template_code)
			etl_code := vpir1_etl_code
			default_template := default_message_template (vpir1h_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_local.name.lower_name, 7)
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
			-- dollar7: $7 = local name
		end

	make_vpir3a (a_class: ET_CLASS; an_agent: ET_ONCE_ROUTINE_INLINE_AGENT)
			-- Create a new VPIR-3 error: an inline agent cannot be of the once form.
			--
			-- Only in ISE.
			-- See ECMA 367-2: p.136
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_agent_not_void: an_agent /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := an_agent.position
			code := template_code (vpir3a_template_code)
			etl_code := vpir3_etl_code
			default_template := default_message_template (vpir3a_default_template)
			create parameters.make_filled (empty_string, 1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
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
		end

	make_vpir3b (a_class: ET_CLASS; an_agent: ET_EXTERNAL_ROUTINE_INLINE_AGENT)
			-- Create a new VPIR-3 error: an inline agent cannot be of the external form.
			--
			-- Only in ISE.
			-- See ECMA 367-2: p.136
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_agent_not_void: an_agent /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := an_agent.position
			code := template_code (vpir3b_template_code)
			etl_code := vpir3_etl_code
			default_template := default_message_template (vpir3b_default_template)
			create parameters.make_filled (empty_string, 1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
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
		end

	make_vqmc1a (a_class, a_class_impl: ET_CLASS; an_attribute: ET_CONSTANT_ATTRIBUTE)
			-- Create a new VQMC-1 error: `an_attribute', declared in `a_class_impl, introduces
			-- a boolean constant but its type is not "BOOLEAN" when viewed from one of its
			-- descendants `a_class' (possibly itself).
			--
			-- ETL2: p.264
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			an_attribute_not_void: an_attribute /= Void
			boolean_constant: an_attribute.constant.is_boolean_constant
		do
			current_class := a_class
			class_impl := a_class_impl
			position := an_attribute.type.position
			code := template_code (vqmc1a_template_code)
			etl_code := vqmc1_etl_code
			default_template := default_message_template (vqmc1a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (an_attribute.lower_name, 7)
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

	make_vqmc2a (a_class, a_class_impl: ET_CLASS; an_attribute: ET_CONSTANT_ATTRIBUTE)
			-- Create a new VQMC-2 error: `an_attribute', declared in `a_class_impl', introduces
			-- a character constant but its type is not "CHARACTER" when viewed from one of its
			-- descendants `a_class' (possibly itself).
			--
			-- ETL2: p.264
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			an_attribute_not_void: an_attribute /= Void
			characterconstant: an_attribute.constant.is_character_constant
		do
			current_class := a_class
			class_impl := a_class_impl
			position := an_attribute.type.position
			code := template_code (vqmc2a_template_code)
			etl_code := vqmc2_etl_code
			default_template := default_message_template (vqmc2a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (an_attribute.lower_name, 7)
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

	make_vqmc3a (a_class, a_class_impl: ET_CLASS; an_attribute: ET_CONSTANT_ATTRIBUTE)
			-- Create a new VQMC-3 error: `an_attribute', declared in `a_class_impl', introduces
			-- an integer constant but its type is not "INTEGER" when viewed from one of its
			-- descendants `a_class' (possibly itself).
			--
			-- ETL2: p.264
			-- ECMA 367-2: p.100
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			an_attribute_not_void: an_attribute /= Void
			integer_constant: an_attribute.constant.is_integer_constant
		do
			current_class := a_class
			class_impl := a_class_impl
			position := an_attribute.type.position
			code := template_code (vqmc3a_template_code)
			etl_code := vqmc3_etl_code
			default_template := default_message_template (vqmc3a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (an_attribute.lower_name, 7)
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

	make_vqmc3b (a_class, a_class_impl: ET_CLASS; a_attribute: ET_CONSTANT_ATTRIBUTE; a_constant: ET_INTEGER_CONSTANT)
			-- Create a new VQMC-3 error: `a_attribute', declared in `a_class_impl', introduces
			-- an integer constant `a_constant' but its value is not representable as an instance
			-- of its integer type when viewed from one of its descendants `a_class' (possibly itself).
			--
			-- ETL2: p.264
			-- ECMA 367-2: p.100
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_attribute_not_void: a_attribute /= Void
			integer_constant: a_attribute.constant = a_constant
		local
			l_literal: STRING
		do
			current_class := a_class
			class_impl := a_class_impl
			position := a_attribute.type.position
			code := template_code (vqmc3b_template_code)
			etl_code := vqmc3_etl_code
			default_template := default_message_template (vqmc3b_default_template)
			if a_constant.sign = Void then
				l_literal := a_constant.literal
			elseif a_constant.sign.is_minus then
				l_literal := "-" + a_constant.literal
			else
				l_literal := "+" + a_constant.literal
			end
			create parameters.make_filled (empty_string, 1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_attribute.lower_name, 7)
			parameters.put (a_attribute.type.to_text, 8)
			parameters.put (l_literal, 9)
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
			-- dollar8: $8 = integer type
			-- dollar9: $9 = integer value
		end

	make_vqmc4a (a_class, a_class_impl: ET_CLASS; an_attribute: ET_CONSTANT_ATTRIBUTE)
			-- Create a new VQMC-4 error: `an_attribute', declared in `a_class_imp', introduces
			-- a real constant but its type is not "REAL" or "DOUBLE" when viewed from one of
			-- its descendants `a_class' (possiby itself).
			--
			-- ETL2: p.264
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			an_attribute_not_void: an_attribute /= Void
			real_constant: an_attribute.constant.is_real_constant
		do
			current_class := a_class
			class_impl := a_class_impl
			position := an_attribute.type.position
			code := template_code (vqmc4a_template_code)
			etl_code := vqmc4_etl_code
			default_template := default_message_template (vqmc4a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (an_attribute.lower_name, 7)
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

	make_vqmc5a (a_class, a_class_impl: ET_CLASS; an_attribute: ET_CONSTANT_ATTRIBUTE)
			-- Create a new VQMC-5 error: `an_attribute', declared in `a_class_impl', introduces
			-- a string constant but its type is not "STRING" when viewed from one of its
			-- descendants `a_class' (possibly itself).
			--
			-- ETL2: p.264
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			an_attribute_not_void: an_attribute /= Void
			string_constant: an_attribute.constant.is_string_constant
		do
			current_class := a_class
			class_impl := a_class_impl
			position := an_attribute.type.position
			code := template_code (vqmc5a_template_code)
			etl_code := vqmc5_etl_code
			default_template := default_message_template (vqmc5a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (an_attribute.lower_name, 7)
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

	make_vqmc6a (a_class, a_class_impl: ET_CLASS; an_attribute: ET_CONSTANT_ATTRIBUTE)
			-- Create a new VQMC-6 error: `an_attribute', declared in `a_class_impl, introduces
			-- a bit constant but its type is not a Bit_type when viewed from one of its
			-- descendants `a_class' (possibly itself).
			--
			-- ETL2: p.264
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			an_attribute_not_void: an_attribute /= Void
			bit_constant: an_attribute.constant.is_bit_constant
		do
			current_class := a_class
			class_impl := a_class_impl
			position := an_attribute.type.position
			code := template_code (vqmc6a_template_code)
			etl_code := vqmc6_etl_code
			default_template := default_message_template (vqmc6a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (an_attribute.lower_name, 7)
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

	make_vqui0a (a_class, a_class_impl: ET_CLASS; a_unique: ET_UNIQUE_ATTRIBUTE)
			-- Create a new VQUI error: the type of `a_unique', declared in `a_class_impl', is
			-- not "INTEGER" when viewed from one of its descendants `a_class' (possibly itself).
			--
			-- ETL2: p.266
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_unique_not_void: a_unique /= Void
		do
			current_class := a_class
			class_impl := a_class_impl
			position := a_unique.type.position
			code := template_code (vqui0a_template_code)
			etl_code := vqui_etl_code
			default_template := default_message_template (vqui0a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_unique.lower_name, 7)
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

	make_vred0a (a_class: ET_CLASS; arg1, arg2: ET_FORMAL_ARGUMENT; f: ET_FEATURE)
			-- Create a new VRED error: `arg1' and `arg2' have the same
			-- name in feature `f' in `a_class'.
			--
			-- ECMA 367-2: p.55
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			arg1_not_void: arg1 /= Void
			arg2_not_void: arg2 /= Void
			f_not_void: f /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := arg2.name.position
			code := template_code (vred0a_template_code)
			etl_code := vred_etl_code
			default_template := default_message_template (vred0a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (arg2.name.lower_name, 7)
			parameters.put (f.lower_name, 8)
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
			-- dollar7: $7 = argument name
			-- dollar8: $8 = feature name (where the arguments appear)
		end

	make_vred0b (a_class: ET_CLASS; local1, local2: ET_LOCAL_VARIABLE; f: ET_FEATURE)
			-- Create a new VRED error: `local1' and `local2' have the same
			-- name in feature `f' in `a_class'.
			--
			-- ECMA 367-2: p.55
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			local1_not_void: local1 /= Void
			local2_not_void: local2 /= Void
			f_not_void: f /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := local2.name.position
			code := template_code (vred0b_template_code)
			etl_code := vred_etl_code
			default_template := default_message_template (vred0b_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (local2.name.lower_name, 7)
			parameters.put (f.lower_name, 8)
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
			-- dollar7: $7 = local name
			-- dollar8: $8 = feature name (where the local variables appear)
		end

	make_vred0c (a_class: ET_CLASS; arg1, arg2: ET_FORMAL_ARGUMENT; an_agent: ET_INLINE_AGENT; f: ET_STANDALONE_CLOSURE)
			-- Create a new VRED error: `arg1' and `arg2' have the same
			-- name in inline agent `an_agent' of feature `f' in `a_class'.
			--
			-- ECMA 367-2: p.55
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			arg1_not_void: arg1 /= Void
			arg2_not_void: arg2 /= Void
			an_agent_not_void: an_agent /= Void
			f_not_void: f /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := arg2.name.position
			code := template_code (vred0c_template_code)
			etl_code := vred_etl_code
			default_template := default_message_template (vred0c_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (arg2.name.lower_name, 7)
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
			-- dollar7: $7 = argument name
		end

	make_vred0d (a_class: ET_CLASS; local1, local2: ET_LOCAL_VARIABLE; an_agent: ET_INLINE_AGENT; f: ET_STANDALONE_CLOSURE)
			-- Create a new VRED error: `local1' and `local2' have the same
			-- name in inline agent `an_agent' of feature `f' in `a_class'.
			--
			-- ECMA 367-2: p.55
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			local1_not_void: local1 /= Void
			local2_not_void: local2 /= Void
			an_agent_not_void: an_agent /= Void
			f_not_void: f /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := local2.name.position
			code := template_code (vred0d_template_code)
			etl_code := vred_etl_code
			default_template := default_message_template (vred0d_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (local2.name.lower_name, 7)
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
			-- dollar7: $7 = local name
		end

	make_vreg0a (a_class: ET_CLASS; arg1, arg2: ET_FORMAL_ARGUMENT; f: ET_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := arg2.name.position
			code := template_code (vreg0a_template_code)
			etl_code := vreg_etl_code
			default_template := default_message_template (vreg0a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (arg2.name.lower_name, 7)
			parameters.put (f.lower_name, 8)
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
			-- dollar7: $7 = argument name
			-- dollar8: $8 = feature name (where the arguments appear)
		end

	make_vreg0b (a_class: ET_CLASS; local1, local2: ET_LOCAL_VARIABLE; f: ET_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := local2.name.position
			code := template_code (vreg0b_template_code)
			etl_code := vreg_etl_code
			default_template := default_message_template (vreg0b_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (local2.name.lower_name, 7)
			parameters.put (f.lower_name, 8)
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
			-- dollar7: $7 = local name
			-- dollar8: $8 = feature name (where the local variables appear)
		end

	make_vrfa0a (a_class: ET_CLASS; arg: ET_FORMAL_ARGUMENT; f1, f2: ET_FEATURE)
			-- Create a new VRFA error: `arg' in feature `f1' has
			-- the same name as feature `f2' in `a_class'.
			--
			-- ETL2: p.110
			-- ECMA 367-2: p.55
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			arg_not_void: arg /= Void
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := arg.name.position
			code := template_code (vrfa0a_template_code)
			etl_code := vrfa_etl_code
			default_template := default_message_template (vrfa0a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (arg.name.lower_name, 7)
			parameters.put (f1.lower_name, 8)
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
			-- dollar7: $7 = argument name
			-- dollar8: $8 = feature name (where argument appears)
		end

	make_vrfa0b (a_class: ET_CLASS; arg: ET_FORMAL_ARGUMENT; an_agent: ET_INLINE_AGENT; f1: ET_STANDALONE_CLOSURE; f2: ET_FEATURE)
			-- Create a new VRFA error: `arg' in inline agent `an_agent' of
			-- feature `f1' has the same name as feature `f2' in `a_class'.
			--
			-- ECMA 367-2: p.55
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			arg_not_void: arg /= Void
			an_agent_not_void: an_agent /= Void
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := arg.name.position
			code := template_code (vrfa0b_template_code)
			etl_code := vrfa_etl_code
			default_template := default_message_template (vrfa0b_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (arg.name.lower_name, 7)
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
			-- dollar7: $7 = argument name
		end

	make_vrle1a (a_class: ET_CLASS; a_local: ET_LOCAL_VARIABLE; f1, f2: ET_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := a_local.name.position
			code := template_code (vrle1a_template_code)
			etl_code := vrle1_etl_code
			default_template := default_message_template (vrle1a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_local.name.lower_name, 7)
			parameters.put (f1.lower_name, 8)
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
			-- dollar7: $7 = local name
			-- dollar8: $8 = feature name (where local variable appears)
		end

	make_vrle2a (a_class: ET_CLASS; a_local: ET_LOCAL_VARIABLE; f: ET_FEATURE; arg: ET_FORMAL_ARGUMENT)
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
			current_class := a_class
			class_impl := a_class
			position := a_local.name.position
			code := template_code (vrle2a_template_code)
			etl_code := vrle2_etl_code
			default_template := default_message_template (vrle2a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_local.name.lower_name, 7)
			parameters.put (f.lower_name, 8)
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
			-- dollar7: $7 = local name
			-- dollar8: $8 = feature name (where local variable and argument appears)
		end

	make_vrlv1a (a_class: ET_CLASS; a_local: ET_LOCAL_VARIABLE; f1, f2: ET_FEATURE)
			-- Create a new VRLV-1 error: `a_local' in feature `f1' has
			-- the same name as feature `f2' in `a_class'.
			--
			-- ECMA 367-2: p.56
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_local_not_void: a_local /= Void
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_local.name.position
			code := template_code (vrlv1a_template_code)
			etl_code := vrlv1_etl_code
			default_template := default_message_template (vrlv1a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_local.name.lower_name, 7)
			parameters.put (f1.lower_name, 8)
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
			-- dollar7: $7 = local name
			-- dollar8: $8 = feature name (where local variable appears)
		end

	make_vrlv1b (a_class: ET_CLASS; a_local: ET_LOCAL_VARIABLE; an_agent: ET_INLINE_AGENT; f1: ET_STANDALONE_CLOSURE; f2: ET_FEATURE)
			-- Create a new VRLV-1 error: `a_local' in inline agent `an_agent'
			-- of feature `f1' has the same name as feature `f2' in `a_class'.
			--
			-- ECMA 367-2: p.56
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_local_not_void: a_local /= Void
			an_agent_not_void: an_agent /= Void
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_local.name.position
			code := template_code (vrlv1b_template_code)
			etl_code := vrlv1_etl_code
			default_template := default_message_template (vrlv1b_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_local.name.lower_name, 7)
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
			-- dollar7: $7 = local name
		end

	make_vrlv2a (a_class: ET_CLASS; a_local: ET_LOCAL_VARIABLE; f: ET_FEATURE; arg: ET_FORMAL_ARGUMENT)
			-- Create a new VRLV-2 error: `a_local' in feature `f' has
			-- the same name as formal argument `arg' of this feature
			-- in `a_class'.
			--
			-- ECMA 367-2: p.56
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_local_not_void: a_local /= Void
			f_not_void: f /= Void
			arg_not_void: arg /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_local.name.position
			code := template_code (vrlv2a_template_code)
			etl_code := vrlv2_etl_code
			default_template := default_message_template (vrlv2a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_local.name.lower_name, 7)
			parameters.put (f.lower_name, 8)
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
			-- dollar7: $7 = local name
			-- dollar8: $8 = feature name (where local variable and argument appears)
		end

	make_vrlv2b (a_class: ET_CLASS; a_local: ET_LOCAL_VARIABLE; an_agent: ET_INLINE_AGENT; f: ET_STANDALONE_CLOSURE; arg: ET_FORMAL_ARGUMENT)
			-- Create a new VRLV-2 error: `a_local' in inline agent `an_agent'
			-- of feature `f' has the same name as formal argument `arg' of this
			-- inline agent in `a_class'.
			--
			-- ECMA 367-2: p.56
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_local_not_void: a_local /= Void
			an_agent_not_void: an_agent /= Void
			f_not_void: f /= Void
			arg_not_void: arg /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_local.name.position
			code := template_code (vrlv2b_template_code)
			etl_code := vrlv2_etl_code
			default_template := default_message_template (vrlv2b_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_local.name.lower_name, 7)
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
			-- dollar7: $7 = local name
		end

	make_vtat1a (a_class: ET_CLASS; a_type: ET_LIKE_FEATURE)
			-- Create a new VTAT-1 error: the anchor in the Anchored_type
			-- must be the final name of a query in `a_class'.
			--
			-- ETL2: p.214
			-- ETL3 (4.82-00-00): p.252
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_type.name.position
			code := template_code (vtat1a_template_code)
			etl_code := vtat1_etl_code
			default_template := default_message_template (vtat1a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_type.to_text, 7)
			parameters.put (a_type.name.lower_name, 8)
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
			-- dollar7: $7 = invalid type
			-- dollar8: $8 = anchor name
		end

	make_vtat1b (a_class: ET_CLASS; a_feature: ET_FEATURE; a_type: ET_LIKE_FEATURE)
			-- Create a new VTAT-1 error: the anchor in the
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
			current_class := a_class
			class_impl := a_class
			position := a_type.name.position
			code := template_code (vtat1b_template_code)
			etl_code := vtat1_etl_code
			default_template := default_message_template (vtat1b_default_template)
			create parameters.make_filled (empty_string, 1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_type.to_text, 7)
			parameters.put (a_type.name.lower_name, 8)
			parameters.put (a_feature.lower_name, 9)
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
			-- dollar7: $7 = invalid type
			-- dollar8: $8 = anchor name
			-- dollar9: $9 = feature name
		end

	make_vtat1c (a_class: ET_CLASS; a_type: ET_QUALIFIED_LIKE_IDENTIFIER; other_class: ET_CLASS)
			-- Create a new VTAT-1 error: the anchor in the Anchored_type
			-- must be the final name of a query in `other_class'.
			--
			-- Not in ETL
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
			other_class_not_void: other_class /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_type.name.position
			code := template_code (vtat1c_template_code)
			etl_code := vtat1_etl_code
			default_template := default_message_template (vtat1c_default_template)
			create parameters.make_filled (empty_string, 1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_type.to_text, 7)
			parameters.put (a_type.name.name, 8)
			parameters.put (other_class.name.name, 9)
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
			-- dollar7: $7 = invalid type
			-- dollar8: $8 = anchor name
			-- dollar9: $9 = remote class name
		end

	make_vtat2a (a_class: ET_CLASS; a_cycle: DS_LIST [ET_LIKE_FEATURE])
			-- Create a new VTAT-2 error: the anchors in `a_cycle'
			-- are cyclic anchors in `a_class'.
			--
			-- ETL3 (4.82-00-00): p.252
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_cycle_not_void: a_cycle /= Void
			no_void_anchor: not a_cycle.has_void
			is_cycle: a_cycle.count >= 2
		local
			a_cursor: DS_LIST_CURSOR [ET_LIKE_FEATURE]
			a_like: ET_LIKE_FEATURE
			a_feature: ET_FEATURE
			a_query: ET_QUERY
			a_string: STRING
		do
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
				--      f: like g do ... end
				--      g: ANY deferred end
				--   end
				--
				--   deferred class B
				--   feature
				--      f: ANY deferred end
				--      g: like f do ... end
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
				--   f: like g do ... end
				--   g: like f do ... end
				--
				-- `position' is set to null in that case.
			position := null_position
			a_cursor := a_cycle.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_like := a_cursor.item
				if a_like.is_procedure then
					a_feature := a_class.seeded_procedure (a_like.seed)
				else
					a_feature := a_class.seeded_query (a_like.seed)
				end
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
			code := template_code (vtat2a_template_code)
			etl_code := vtat2_etl_code
			default_template := default_message_template (vtat2a_default_template)
			from
				create a_string.make (20)
				a_cursor.start
				a_like := a_cursor.item
				if a_like.is_like_argument then
					a_string.append_string (a_like.name.lower_name)
				else
						-- Take care of possible renaming.
					a_query := a_class.seeded_query (a_like.seed)
					if a_query /= Void then
						a_string.append_string (a_query.lower_name)
					else
						a_string.append_string (a_like.name.lower_name)
					end
				end
				a_cursor.forth
			until
				a_cursor.after
			loop
				a_string.append_string (" -> ")
				a_like := a_cursor.item
				if a_like.is_like_argument then
					a_string.append_string (a_like.name.lower_name)
				else
						-- Take care of possible renaming.
					a_query := a_class.seeded_query (a_like.seed)
					if a_query /= Void then
						a_string.append_string (a_query.lower_name)
					else
						a_string.append_string (a_like.name.lower_name)
					end
				end
				a_cursor.forth
			end
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_string, 7)
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
			-- dollar7: $7 = cycle
		end

	make_vtat2b (a_class, a_class_impl: ET_CLASS; a_type: ET_LIKE_IDENTIFIER)
			-- Create a new VTAT-2 error: the type of the anchor of `a_type' appearing in
			-- a qualified anchored type in `a_class_impl' depends on a qualified
			-- anchored type when viewed from `a_class'.
			--
			-- Not in ECMA, similar to VTAT-1 in ETL2 page 214, but applied to
			-- qualified anchored types.
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_type_not_void: a_type /= Void
		do
			current_class := a_class
			class_impl := a_class_impl
			position := a_type.name.position
			code := template_code (vtat2b_template_code)
			etl_code := vtat2_etl_code
			default_template := default_message_template (vtat2b_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.name.name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_type.to_text, 7)
			parameters.put (a_type.name.name, 8)
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
			-- dollar7: $7 = invalid type
			-- dollar8: $8 = anchor name
		end

	make_vtbt0a (a_class: ET_CLASS; a_type: ET_BIT_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := a_type.position
			code := template_code (vtbt0a_template_code)
			etl_code := vtbt_etl_code
			default_template := default_message_template (vtbt0a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_type.to_text, 7)
			parameters.put (a_type.name.lower_name, 8)
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
			-- dollar7: $7 = invalid type
			-- dollar8: $8 = constant feature name
		end

	make_vtbt0b (a_class: ET_CLASS; a_type: ET_BIT_FEATURE)
			-- Create a new VTBT error: the identifier in
			-- Bit_type must be the final name of a feature.
			--
			-- ETL2: p.210
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_type.position
			code := template_code (vtbt0b_template_code)
			etl_code := vtbt_etl_code
			default_template := default_message_template (vtbt0b_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_type.to_text, 7)
			parameters.put (a_type.name.lower_name, 8)
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
			-- dollar7: $7 = invalid type
			-- dollar8: $8 = constant feature name
		end

	make_vtbt0c (a_class: ET_CLASS; a_type: ET_BIT_TYPE)
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
			current_class := a_class
			class_impl := a_class
			position := a_type.position
			code := template_code (vtbt0c_template_code)
			etl_code := vtbt_etl_code
			default_template := default_message_template (vtbt0c_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
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
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = invalid type
		end

	make_vtbt0d (a_class: ET_CLASS; a_type: ET_BIT_TYPE)
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
			current_class := a_class
			class_impl := a_class
			position := a_type.position
			code := template_code (vtbt0d_template_code)
			etl_code := vtbt_etl_code
			default_template := default_message_template (vtbt0d_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
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
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = invalid type
		end

	make_vtcg3a (a_class, a_class_impl: ET_CLASS; a_type: ET_CLASS_TYPE; an_actual, a_constraint: ET_TYPE)
			-- Create a new VTCG-3 error: actual generic paramater `an_actual'
			-- of `a_type' appearing in `a_class_impl' and viewed from one of
			-- its decendants `a_class' (possibly itself) does not conform to
			-- constraint `a_constraint'.
			--
			-- Note that it is possible that the actual paramater conforms
			-- to the constraint in `a_class_impl' but not in `a_class'.
			-- Here is an example:
			--
			--   class A
			--   feature
			--       y: Y [like Current, X [A]]
			--   end
			--
			--   class B
			--   inherit
			--       A
			--   end
			--
			--   class X
			--   end
			--
			--   class Y [G, H -> X [G]]
			--   end
			--
			-- In class B the actual generic parameter 'X [A]' does not conform
			-- to its constraint 'X [like Current]'.
			--
			-- ETL2: p.203
			-- ETR: p.46
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_type_not_void: a_type /= Void
			an_actual_not_void: an_actual /= Void
			a_constraint_not_void: a_constraint /= Void
		do
			current_class := a_class
			class_impl := a_class_impl
			position := an_actual.position
			code := template_code (vtcg3a_template_code)
			etl_code := vtcg3_etl_code
			default_template := default_message_template (vtcg3a_default_template)
			create parameters.make_filled (empty_string, 1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (an_actual.to_text, 7)
			parameters.put (a_constraint.to_text, 8)
			parameters.put (a_type.to_text, 9)
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
			-- dollar7: $7 = actual generic parameter
			-- dollar8: $8 = generic constraint
			-- dollar9: $9 = generic type
		end

	make_vtcg4a (a_class, a_class_impl: ET_CLASS; a_position: ET_POSITION; an_actual_index: INTEGER; a_name: ET_FEATURE_NAME; an_actual_base_class, a_generic_class: ET_CLASS)
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
			current_class := a_class
			class_impl := a_class_impl
			position := a_position
			code := template_code (vtcg4a_template_code)
			etl_code := vtcg4_etl_code
			default_template := default_message_template (vtcg4a_default_template)
			create parameters.make_filled (empty_string, 1, 10)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (an_actual_index.out, 7)
			parameters.put (a_name.lower_name, 8)
			parameters.put (an_actual_base_class.upper_name, 9)
			parameters.put (a_generic_class.upper_name, 10)
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

	make_vtcg4b (a_class, a_class_impl: ET_CLASS; a_position: ET_POSITION; an_actual_index: INTEGER; a_name: ET_FEATURE_NAME; an_actual: ET_FORMAL_PARAMETER; a_generic_class: ET_CLASS)
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
			current_class := a_class
			class_impl := a_class_impl
			position := a_position
			code := template_code (vtcg4b_template_code)
			etl_code := vtcg4_etl_code
			default_template := default_message_template (vtcg4b_default_template)
			create parameters.make_filled (empty_string, 1, 10)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (an_actual_index.out, 7)
			parameters.put (a_name.lower_name, 8)
			parameters.put (an_actual.index.out, 9)
			parameters.put (a_generic_class.upper_name, 10)
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

	make_vtct0a (a_class: ET_CLASS; a_type: ET_BASE_TYPE)
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
			current_class := a_class
			class_impl := a_class
			position := a_type.name.position
			code := template_code (vtct0a_template_code)
			etl_code := vtct_etl_code
			default_template := default_message_template (vtct0a_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_type.upper_name, 7)
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
			-- dollar7: $7 = type base class
		end

	make_vtct0b (a_class: ET_CLASS; a_type: ET_FORMAL_PARAMETER_TYPE)
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
			current_class := a_class
			class_impl := a_class
			position := a_type.name.position
			code := template_code (vtct0b_template_code)
			etl_code := vtct_etl_code
			default_template := default_message_template (vtct0b_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_type.upper_name, 7)
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
			-- dollar7: $7 = type base class
		end

	make_vtgc0a (a_class: ET_CLASS; cp: ET_FEATURE_NAME; a_constraint: ET_CLASS)
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
			current_class := a_class
			class_impl := a_class
			position := cp.position
			code := template_code (vtgc0a_template_code)
			etl_code := vtgc_etl_code
			default_template := default_message_template (vtgc0a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (cp.lower_name, 7)
			parameters.put (a_constraint.upper_name, 8)
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
			-- dollar7: $7 = creation procedure name
			-- dollar8: $8 = constraint base class name
		end

	make_vtgc0b (a_class: ET_CLASS; cp: ET_FEATURE_NAME; f: ET_FEATURE; a_constraint: ET_CLASS)
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
			current_class := a_class
			class_impl := a_class
			position := cp.position
			code := template_code (vtgc0b_template_code)
			etl_code := vtgc_etl_code
			default_template := default_message_template (vtgc0b_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (cp.lower_name, 7)
			parameters.put (a_constraint.upper_name, 8)
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
			-- dollar7: $7 = creation procedure name
			-- dollar8: $8 = constraint base class name
		end

	make_vtug1a (a_class: ET_CLASS; a_type: ET_CLASS_TYPE)
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
			current_class := a_class
			class_impl := a_class
			position := a_type.name.position
			code := template_code (vtug1a_template_code)
			etl_code := vtug1_etl_code
			default_template := default_message_template (vtug1a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_type.to_text, 7)
			parameters.put (a_type.upper_name, 8)
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
			-- dollar7: $7 = invalid type
			-- dollar8: $8 = invalid type's base class
		end

	make_vtug2a (a_class: ET_CLASS; a_type: ET_CLASS_TYPE)
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
			current_class := a_class
			class_impl := a_class
			position := a_type.name.position
			code := template_code (vtug2a_template_code)
			etl_code := vtug2_etl_code
			default_template := default_message_template (vtug2a_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
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
			-- dollar6: $6 = implementation class name
			-- dollar7: $7 = invalid type
		end

	make_vuar1a (a_class: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS)
			-- Create a new VUAR-1 error: the number of actual arguments in
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
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			code := template_code (vuar1a_template_code)
			etl_code := vuar1_etl_code
			default_template := default_message_template (vuar1a_default_template)
			create parameters.make_filled (empty_string, 1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
			parameters.put (a_feature.lower_name, 8)
			parameters.put (a_target.upper_name, 9)
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
			-- dollar7: $7 = feature name of the call
			-- dollar8: $8 = name of corresponding feature in class $9
			-- dollar9: $9 = base class of target of the call
		end

	make_vuar1b (a_class: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE)
			-- Create a new VUAR-1 error: the number of actual arguments in
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
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			code := template_code (vuar1b_template_code)
			etl_code := vuar1_etl_code
			default_template := default_message_template (vuar1b_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
			parameters.put (a_feature.lower_name, 8)
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
			-- dollar7: $7 = feature name of the call
			-- dollar8: $8 = name of corresponding feature in class $5
		end

	make_vuar1c (a_class: ET_CLASS; a_label: ET_CALL_NAME)
			-- Create a new VUAR-1 error: Tuple label calls cannot have arguments.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_label_not_void: a_label /= Void
			a_label_is_tuple_label: a_label.is_tuple_label
		do
			current_class := a_class
			class_impl := a_class
			position := a_label.position
			code := template_code (vuar1c_template_code)
			etl_code := vuar1_etl_code
			default_template := default_message_template (vuar1c_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_label.lower_name, 7)
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
			-- dollar7: $7 = label name of the call
		end

	make_vuar2a (a_class, a_class_impl: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS; arg: INTEGER; an_actual, a_formal: ET_NAMED_TYPE)
			-- Create a new VUAR-2 error: the `arg'-th actual argument in the qualified
			-- call `a_name' appearing in `a_class_impl' and viewed from one of its descendants
			-- `a_class' (possibly itself) does not conform to the corresponding formal argument
			-- of `a_feature' in class `a_target'.
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
			current_class := a_class
			class_impl := a_class_impl
			position := a_name.position
			code := template_code (vuar2a_template_code)
			etl_code := vuar2_etl_code
			default_template := default_message_template (vuar2a_default_template)
			create parameters.make_filled (empty_string, 1, 12)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
			parameters.put (a_feature.lower_name, 8)
			parameters.put (a_target.upper_name, 9)
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

	make_vuar2b (a_class, a_class_impl: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE; arg: INTEGER; an_actual, a_formal: ET_NAMED_TYPE)
			-- Create a new VUAR-2 error: the `arg'-th actual argument in the unqualified
			-- call `a_name' appearing in `a_class_impl' and viewed from one of its descendants
			-- `a_class' (possibly itself) does not conform to the corresponding formal argument
			-- of `a_feature' in `a_class'.
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
			current_class := a_class
			class_impl := a_class_impl
			position := a_name.position
			code := template_code (vuar2b_template_code)
			etl_code := vuar2_etl_code
			default_template := default_message_template (vuar2b_default_template)
			create parameters.make_filled (empty_string, 1, 11)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
			parameters.put (a_feature.lower_name, 8)
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

	make_vuar4a (a_class: ET_CLASS; a_name: ET_FEATURE_NAME)
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
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			code := template_code (vuar4a_template_code)
			etl_code := vuar4_etl_code
			default_template := default_message_template (vuar4a_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
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
			-- dollar7: $7 = feature name in the Address form
		end

	make_vuex1a (a_class: ET_CLASS; a_name: ET_CALL_NAME)
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
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			code := template_code (vuex1a_template_code)
			etl_code := vuex1_etl_code
			default_template := default_message_template (vuex1a_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
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
			-- dollar7: $7 = feature name of the call
		end

	make_vuex2a (a_class: ET_CLASS; a_name: ET_CALL_NAME; a_target: ET_CLASS)
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
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			code := template_code (vuex2a_template_code)
			etl_code := vuex2_etl_code
			default_template := default_message_template (vuex2a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
			parameters.put (a_target.upper_name, 8)
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
			-- dollar7: $7 = feature name of the call
			-- dollar8: $8 = base class of target of the call
		end

	make_vuex2b (a_class, a_class_impl: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS)
			-- Create a new VUEX-2 error: `a_feature' of class `a_target'
			-- is not exported to `a_class', one of the descendants of
			-- `a_class_impl' (possibly itself) where the qualified
			-- call `a_name' appears.
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
			current_class := a_class
			class_impl := a_class_impl
			position := a_name.position
			code := template_code (vuex2b_template_code)
			etl_code := vuex2_etl_code
			default_template := default_message_template (vuex2b_default_template)
			create parameters.make_filled (empty_string, 1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
			parameters.put (a_feature.lower_name, 8)
			parameters.put (a_target.upper_name, 9)
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

	make_vuot1a (a_class: ET_CLASS; a_object_test: ET_NAMED_OBJECT_TEST; a_feature: ET_FEATURE)
			-- Create a new VUOT-1 error: The local of `a_object_test' has the same
			-- name as `a_feature' in `a_class'.
			--
			-- ECMA 367-2: p.127
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_object_test_not_void: a_object_test /= Void
			a_feature_not_void: a_feature /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_object_test.name.position
			code := template_code (vuot1a_template_code)
			etl_code := vuot1_etl_code
			default_template := default_message_template (vuot1a_default_template)
			create parameters.make_filled (empty_string, 1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (a_object_test.name.lower_name, 6)
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
			-- dollar6: $6 = object-test local name
		end

	make_vuot1b (a_class: ET_CLASS; a_object_test: ET_NAMED_OBJECT_TEST; arg: ET_FORMAL_ARGUMENT)
			-- Create a new VUOT-1 error: The local of `a_object_test' has
			-- the same name as argument `arg' of an enclosing feature or
			-- inline agent.
			--
			-- ECMA 367-2: p.127
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_object_test_not_void: a_object_test /= Void
			arg_not_void: arg /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_object_test.name.position
			code := template_code (vuot1b_template_code)
			etl_code := vuot1_etl_code
			default_template := default_message_template (vuot1b_default_template)
			create parameters.make_filled (empty_string, 1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (a_object_test.name.lower_name, 6)
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
			-- dollar6: $6 = object-test local name
		end

	make_vuot1c (a_class: ET_CLASS; a_object_test: ET_NAMED_OBJECT_TEST; a_local: ET_LOCAL_VARIABLE)
			-- Create a new VUOT-1 error: The local of `a_object_test' has
			-- the same name as local variable `a_local' of an enclosing
			-- feature or inline agent.
			--
			-- ECMA 367-2: p.127
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_object_test_not_void: a_object_test /= Void
			a_local_not_void: a_local /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_object_test.name.position
			code := template_code (vuot1c_template_code)
			etl_code := vuot1_etl_code
			default_template := default_message_template (vuot1c_default_template)
			create parameters.make_filled (empty_string, 1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (a_object_test.name.lower_name, 6)
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
			-- dollar6: $6 = object-test local name
		end

	make_vuot1d (a_class: ET_CLASS; a_object_test1, a_object_test2: ET_NAMED_OBJECT_TEST)
			-- Create a new VUOT-1 error: `a_object_test1' appears in the scope
			-- of the local of `a_object_test2' with the same local name.
			--
			-- ECMA 367-2: p.127
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_object_test1_not_void: a_object_test1 /= Void
			a_object_test2_not_void: a_object_test2 /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_object_test1.name.position
			code := template_code (vuot1d_template_code)
			etl_code := vuot1_etl_code
			default_template := default_message_template (vuot1d_default_template)
			create parameters.make_filled (empty_string, 1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (a_object_test1.name.lower_name, 6)
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
			-- dollar6: $6 = object-test local name
		end

	make_vuot1e (a_class: ET_CLASS; a_object_test: ET_NAMED_OBJECT_TEST; a_across_component: ET_ACROSS_COMPONENT)
			-- Create a new VUOT-1 error: `a_object_test' appears in the scope
			-- of the cursor of `a_across_component' with the same local name.
			--
			-- Not in ECMA.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_object_test_not_void: a_object_test /= Void
			a_across_component_not_void: a_across_component /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_object_test.name.position
			code := template_code (vuot1e_template_code)
			etl_code := vuot1_etl_code
			default_template := default_message_template (vuot1e_default_template)
			create parameters.make_filled (empty_string, 1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (a_object_test.name.lower_name, 6)
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
			-- dollar6: $6 = object-test local name
		end

	make_vuot1f (a_class: ET_CLASS; a_object_test1, a_object_test2: ET_NAMED_OBJECT_TEST)
			-- Create a new VUOT-1 error: `a_object_test1' and `a_object_test2' have the same
			-- local name and their scope overlap.
			--
			-- Not in ECMA yet
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_object_test1_not_void: a_object_test1 /= Void
			a_object_test2_not_void: a_object_test2 /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_object_test1.name.position
			code := template_code (vuot1f_template_code)
			etl_code := vuot1_etl_code
			default_template := default_message_template (vuot1f_default_template)
			create parameters.make_filled (empty_string, 1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (a_object_test1.name.lower_name, 6)
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
			-- dollar6: $6 = object-test local name
		end

	make_vuot3a (a_class: ET_CLASS; a_object_test1, a_object_test2: ET_NAMED_OBJECT_TEST; a_feature: ET_FEATURE)
			-- Create a new VUOT-3 error: The local of `a_object_test1' has
			-- the same name as the local of `a_object_test2' appearing in
			-- the same `a_feature' of `a_class' or in the same inline agent.
			--
			-- Only in ISE.
			-- See ECMA 367-2: p.127
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_object_test1_not_void: a_object_test1 /= Void
			a_object_test2_not_void: a_object_test2 /= Void
			a_feature_not_void: a_feature /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_object_test1.name.position
			code := template_code (vuot3a_template_code)
			etl_code := vuot3_etl_code
			default_template := default_message_template (vuot3a_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (a_object_test1.name.lower_name, 6)
			parameters.put (a_feature.lower_name, 7)
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
			-- dollar6: $6 = object-test local name
			-- dollar7: $7 = feature name
		end

	make_vuot3b (a_class: ET_CLASS; a_object_test1, a_object_test2: ET_NAMED_OBJECT_TEST)
			-- Create a new VUOT-3 error: The local of `a_object_test1' has
			-- the same name as the local of `a_object_test2' appearing in
			-- the invariant of `a_class' or in the same inline agent.
			--
			-- Only in ISE.
			-- See ECMA 367-2: p.127
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_object_test1_not_void: a_object_test1 /= Void
			a_object_test2_not_void: a_object_test2 /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_object_test1.name.position
			code := template_code (vuot3b_template_code)
			etl_code := vuot3_etl_code
			default_template := default_message_template (vuot3b_default_template)
			create parameters.make_filled (empty_string, 1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (a_object_test1.name.lower_name, 6)
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
			-- dollar6: $6 = object-test local name
		end

	make_vuot4a (a_class: ET_CLASS; a_object_test: ET_NAMED_OBJECT_TEST)
			-- Create a new VUOT-4 error: ISE does not support object-tests in preconditions.
			--
			-- Only in ISE.
			-- See ECMA 367-2: p.127
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_object_test_not_void: a_object_test /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_object_test.name.position
			code := template_code (vuot4a_template_code)
			etl_code := vuot4_etl_code
			default_template := default_message_template (vuot4a_default_template)
			create parameters.make_filled (empty_string, 1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (a_object_test.name.lower_name, 6)
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
			-- dollar6: $6 = object-test local name
		end

	make_vuot4b (a_class: ET_CLASS; a_object_test: ET_NAMED_OBJECT_TEST)
			-- Create a new VUOT-4 error: ISE does not support object-tests in check instructions.
			--
			-- Only in ISE.
			-- See ECMA 367-2: p.127
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_object_test_not_void: a_object_test /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_object_test.name.position
			code := template_code (vuot4b_template_code)
			etl_code := vuot4_etl_code
			default_template := default_message_template (vuot4b_default_template)
			create parameters.make_filled (empty_string, 1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (a_object_test.name.lower_name, 6)
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
			-- dollar6: $6 = object-test local name
		end

	make_vuta2a (a_class, a_class_impl: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE; a_target_type: ET_NAMED_TYPE)
			-- Create a new VUTA-2 error: the target, of type `a_target_type', of the call to feature `a_feature'
			-- is not attached when viewed from `a_class', one of the descendants of `a_class_impl' (possibly itself)
			-- where the qualified call `a_name' appears.
			--
			-- ECMA-367-2: p.123
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
		do
			current_class := a_class
			class_impl := a_class_impl
			position := a_name.position
			code := template_code (vuta2a_template_code)
			etl_code := vuta2_etl_code
			default_template := default_message_template (vuta2a_default_template)
			create parameters.make_filled (empty_string, 1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
			parameters.put (a_feature.lower_name, 8)
			parameters.put (a_target_type.to_text, 9)
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
			-- dollar8: $8 = name of corresponding feature in base class of $9
			-- dollar9: $9 = type of the target
		end

	make_vuta2b (a_class, a_class_impl: ET_CLASS; a_name: ET_CALL_NAME; a_target_type: ET_NAMED_TYPE)
			-- Create a new VUTA-2 error: the target, of type `a_target_type', of the call to Tuple label `a_name'
			-- appearing in `a_class_impl' and viewed from one of its descendants `a_class'
			-- (possibly itself), is not attached.
			--
			-- ECMA-367-2: p.123
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_name_not_void: a_name /= Void
			a_name_is_tuple_label: a_name.is_tuple_label
			a_target_type_not_void: a_target_type /= Void
		do
			current_class := a_class
			class_impl := a_class_impl
			position := a_name.position
			code := template_code (vuta2b_template_code)
			etl_code := vuta2_etl_code
			default_template := default_message_template (vuta2b_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
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
			-- dollar7: $7 = Tuple label
			-- dollar8: $8 = type of the target
		end

	make_vvok1a (a_class: ET_CLASS; a_once_key1, a_once_key2: ET_MANIFEST_STRING)
			-- Create a new VVOK-1 error: `a_once_key1' and `a_once_key2' cannot be
			-- combined. The supported once keys "PROCESS", "THREAD" and "OBJECT"
			-- cannot be combined.
			--
			-- Not in ECMA, only in ISE
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_once_key1_not_void: a_once_key1 /= Void
			a_once_key2_not_void: a_once_key2 /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_once_key2.position
			code := template_code (vvok1a_template_code)
			etl_code := vvok1_etl_code
			default_template := default_message_template (vvok1a_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (a_once_key1.value, 6)
			parameters.put (a_once_key2.value, 7)
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
			-- dollar6: $6 = first once key
			-- dollar7: $7 = second once key
		end

	make_vvok2a (a_class: ET_CLASS; a_once_key: ET_MANIFEST_STRING)
			-- Create a new VVOK-2 error: `a_once_key' is not one of the supported
			-- once keys. The supported once keys are "PROCESS", "THREAD" and "OBJECT".
			--
			-- Not in ECMA, only in ISE
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_once_key_not_void: a_once_key /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_once_key.position
			code := template_code (vvok2a_template_code)
			etl_code := vvok2_etl_code
			default_template := default_message_template (vvok2a_default_template)
			create parameters.make_filled (empty_string, 1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (a_once_key.value, 6)
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
			-- dollar6: $6 = once key
		end

	make_vwbe0a (a_class, a_class_impl: ET_CLASS; an_expression: ET_EXPRESSION; a_type: ET_NAMED_TYPE)
			-- Create a new VWBE error: the boolean expression `an_expression'
			-- in `a_class_impl' and viewed from one of its descendants
			-- `a_class' (possibly itself) is of type `a_type' which is
			-- not "BOOLEAN".
			--
			-- ETL2: p.374
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			an_expression_not_void: an_expression /= Void
			a_type_not_void: a_type /= Void
		do
			current_class := a_class
			class_impl := a_class_impl
			position := an_expression.position
			code := template_code (vwbe0a_template_code)
			etl_code := vwbe_etl_code
			default_template := default_message_template (vwbe0a_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
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

	make_vweq0a (a_class, a_class_impl: ET_CLASS; an_expression: ET_EQUALITY_EXPRESSION; a_type1, a_type2: ET_NAMED_TYPE)
			-- Create a new VWEQ error: none of the operands of the equality
			-- expression `an_expression' appearing in `a_class_impl' and viewed
			-- from one of its descendants `a_class' (possibly itself) conforms
			-- to the other.
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
			current_class := a_class
			class_impl := a_class_impl
			position := an_expression.operator.position
			code := template_code (vweq0a_template_code)
			etl_code := vweq_etl_code
			default_template := default_message_template (vweq0a_default_template)
			create parameters.make_filled (empty_string, 1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
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

	make_vweq0b (a_class, a_class_impl: ET_CLASS; an_expression: ET_OBJECT_EQUALITY_EXPRESSION; a_type1, a_type2: ET_NAMED_TYPE)
			-- Create a new VWEQ error: none of the operands of the object-equality
			-- expression `an_expression' appearing in `a_class_impl' and viewed
			-- from one of its descendants `a_class' (possibly itself) conforms
			-- or converts to the other.
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
			current_class := a_class
			class_impl := a_class_impl
			position := an_expression.operator.position
			code := template_code (vweq0b_template_code)
			etl_code := vweq_etl_code
			default_template := default_message_template (vweq0b_default_template)
			create parameters.make_filled (empty_string, 1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
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
			-- dollar7: $7 = object-equality operator
			-- dollar8: $8 = base type of left operand
			-- dollar9: $9 = base type of right operand
		end

	make_vwmq0a (a_class, a_class_impl: ET_CLASS; a_constant: ET_INTEGER_CONSTANT)
			-- Create a new VWMQ error: the cast type of `a_constant' appearing in
			-- `a_class_impl' and viewed from one of its descendants `a_class'
			-- (possibly itself) is not one of the sized variants of "INTEGER".
			--
			-- ECMA-367-2: p.144
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_constant_not_void: a_constant /= Void
			a_cast_type_not_void: a_constant.cast_type /= Void
		do
			current_class := a_class
			class_impl := a_class_impl
			position := a_constant.cast_type.position
			code := template_code (vwmq0a_template_code)
			etl_code := vwmq_etl_code
			default_template := default_message_template (vwmq0a_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_constant.cast_type.type.to_text, 7)
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
			-- dollar7: $7 = cast type
		end

	make_vwmq0b (a_class, a_class_impl: ET_CLASS; a_constant: ET_REAL_CONSTANT)
			-- Create a new VWMQ error: the cast type of `a_constant' appearing in
			-- `a_class_impl' and viewed from one of its descendants `a_class'
			-- (possibly itself) is not one of the sized variants of "REAL".
			--
			-- ECMA-367-2: p.144
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_constant_not_void: a_constant /= Void
			a_cast_type_not_void: a_constant.cast_type /= Void
		do
			current_class := a_class
			class_impl := a_class_impl
			position := a_constant.cast_type.position
			code := template_code (vwmq0b_template_code)
			etl_code := vwmq_etl_code
			default_template := default_message_template (vwmq0b_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_constant.cast_type.type.to_text, 7)
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
			-- dollar7: $7 = cast type
		end

	make_vwmq0c (a_class, a_class_impl: ET_CLASS; a_constant: ET_CHARACTER_CONSTANT)
			-- Create a new VWMQ error: the cast type of `a_constant' appearing in
			-- `a_class_impl' and viewed from one of its descendants `a_class'
			-- (possibly itself) is not one of the sized variants of "CHARACTER".
			--
			-- ECMA-367-2: p.144
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_constant_not_void: a_constant /= Void
			a_cast_type_not_void: a_constant.cast_type /= Void
		do
			current_class := a_class
			class_impl := a_class_impl
			position := a_constant.cast_type.position
			code := template_code (vwmq0c_template_code)
			etl_code := vwmq_etl_code
			default_template := default_message_template (vwmq0c_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_constant.cast_type.type.to_text, 7)
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
			-- dollar7: $7 = cast type
		end

	make_vwmq0d (a_class, a_class_impl: ET_CLASS; a_constant: ET_MANIFEST_STRING)
			-- Create a new VWMQ error: the cast type of `a_constant' appearing in
			-- `a_class_impl' and viewed from one of its descendants `a_class'
			-- (possibly itself) is not one of the sized variants of "STRING".
			--
			-- ECMA-367-2: p.144
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_constant_not_void: a_constant /= Void
			a_cast_type_not_void: a_constant.cast_type /= Void
		do
			current_class := a_class
			class_impl := a_class_impl
			position := a_constant.cast_type.position
			code := template_code (vwmq0d_template_code)
			etl_code := vwmq_etl_code
			default_template := default_message_template (vwmq0d_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_constant.cast_type.type.to_text, 7)
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
			-- dollar7: $7 = cast type
		end

	make_vwst1a (a_class: ET_CLASS; a_name: ET_FEATURE_NAME)
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
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			code := template_code (vwst1a_template_code)
			etl_code := vwst1_etl_code
			default_template := default_message_template (vwst1a_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
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
			-- dollar7: $7 = attribute name
		end

	make_vwst1b (a_class: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			code := template_code (vwst1a_template_code)
			etl_code := vwst1_etl_code
			default_template := default_message_template (vwst1a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
			parameters.put (a_feature.lower_name, 8)
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
			-- dollar7: $7 = attribute name
			-- dollar8: $8 = name of actual feature
		end

	make_vwst2a (a_class: ET_CLASS; a_name1, a_name2: ET_FEATURE_NAME)
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
			current_class := a_class
			class_impl := a_class
			position := a_name2.position
			code := template_code (vwst2a_template_code)
			etl_code := vwst2_etl_code
			default_template := default_message_template (vwst2a_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name2.lower_name, 7)
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
			-- dollar7: $7 = attribute name
		end

	make_vxrt0a (a_class: ET_CLASS; a_retry: ET_RETRY_INSTRUCTION)
			-- Create a new VXRT error: instruction `a_retry' does not
			-- appear in a rescue clause in `a_class'.
			--
			-- ETL2: p.256
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_retry_not_void: a_retry /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_retry.position
			code := template_code (vxrt0a_template_code)
			etl_code := vxrt_etl_code
			default_template := default_message_template (vxrt0a_default_template)
			create parameters.make_filled (empty_string, 1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
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
		end

	make_gvagp0a (a_class: ET_CLASS; anc1, anc2: ET_BASE_TYPE)
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
			current_class := a_class
			class_impl := a_class
			position := null_position
			code := template_code (gvagp0a_template_code)
			etl_code := gvagp_etl_code
			default_template := default_message_template (gvagp0a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (anc1.to_text, 7)
			parameters.put (anc2.to_text, 8)
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
			-- dollar7: $7 = ancestor1
			-- dollar8: $8 = ancestor2
		end

	make_gvhpr4a (a_class: ET_CLASS; a_parent: ET_BIT_N)
			-- Create a new GVHPR-4 error: cannot inherit from Bit_type.
			--
			-- Not in ETL as validity error but as syntax error
			-- GVHPR-4: See ETL2 VHPR
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_parent.position
			code := template_code (gvhpr4a_template_code)
			etl_code := gvhpr4_etl_code
			default_template := default_message_template (gvhpr4a_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_parent.position.to_text, 7)
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
			-- dollar7: $7 = parent
		end

	make_gvhpr5a (a_class: ET_CLASS; a_parent: ET_TUPLE_TYPE)
			-- Create a new GVHPR-5 error: cannot inherit from Tuple_type.
			--
			-- Not in ETL as validity error but as syntax error
			-- GVHPR-5: See ETL2 VHPR
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_parent.position
			code := template_code (gvhpr5a_template_code)
			etl_code := gvhpr5_etl_code
			default_template := default_message_template (gvhpr5a_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_parent.position.to_text, 7)
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
			-- dollar7: $7 = parent
		end

	make_gvhso1a (a_class: ET_CLASS)
			-- Create a new GVHSO-1 error: `a_class' implicitly inherits
			-- from unknown class SYSTEM_OBJECT.
			--
			-- Not in ETL
			-- GVHSO: see VHAY
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			current_class := a_class
			class_impl := a_class
			position := null_position
			code := template_code (gvhso1a_template_code)
			etl_code := gvhso1_etl_code
			default_template := default_message_template (gvhso1a_default_template)
			create parameters.make_filled (empty_string, 1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
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
		end

	make_gvhso2a (a_class: ET_CLASS)
			-- Create a new GVHSO-2 error: `a_class' implicitly inherits
			-- from class SYSTEM_OBJECT but SYSTEM_OBJECT is not a .NET class.
			--
			-- Not in ETL
			-- GVHSO: see VHAY
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			current_class := a_class
			class_impl := a_class
			position := null_position
			code := template_code (gvhso2a_template_code)
			etl_code := gvhso2_etl_code
			default_template := default_message_template (gvhso2a_default_template)
			create parameters.make_filled (empty_string, 1, 6)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
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
		end

	make_gvkbs0a (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE; a_expected_arguments: ARRAY [ET_TYPE]; a_expected_type: ET_TYPE)
			-- Create a new GVKBS error: wrong signature for built-in
			-- routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
			no_void_argument: a_expected_arguments /= Void implies not ANY_ARRAY_.has (a_expected_arguments, Void)
		local
			l_signature: STRING
			i, nb: INTEGER
		do
			current_class := a_class
			class_impl := a_class
			position := a_feature.name.position
			code := template_code (gvkbs0a_template_code)
			etl_code := gvkbs_etl_code
			default_template := default_message_template (gvkbs0a_default_template)
			create l_signature.make (512)
			l_signature.append_string (a_feature.lower_name)
			if a_expected_arguments /= Void then
				i := a_expected_arguments.lower
				nb := a_expected_arguments.upper
				if i <= nb then
					l_signature.append_string (" (")
					from until i > nb loop
						l_signature.append_string (a_expected_arguments.item (i).to_text)
						if i /= nb then
							l_signature.append_string (", ")
						end
						i := i + 1
					end
					l_signature.append_character (')')
				end
			end
			if a_expected_type /= Void then
				l_signature.append_string (": ")
				l_signature.append_string (a_expected_type.to_text)
			end
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_feature.lower_name, 7)
			parameters.put (l_signature, 8)
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
			-- dollar7: $7 = feature name
			-- dollar8: $8 = expected signature
		end

	make_gvkbu1a (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE)
			-- Create a new GVKBU-1 error: unknown built-in routine `a_feature'
			-- in class `a_class'.
			--
			-- Not in ETL
			-- GVKBU: Gobo Validity Kernel Built-in routine Unknown
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		do
			current_class := a_class
			class_impl := a_class
			position := a_feature.name.position
			code := template_code (gvkbu1a_template_code)
			etl_code := gvkbu1_etl_code
			default_template := default_message_template (gvkbu1a_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_feature.lower_name, 7)
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
			-- dollar7: $7 = feature name
		end

	make_gvkfe1a (a_class: ET_CLASS; a_name: ET_FEATURE_NAME)
			-- Create a new GVKFE-1 error: feature `a_name' is missing
			-- in kernel class `a_class'.
			--
			-- Not in ETL
			-- GVKFE: Gobo Validity Kernel FEature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := null_position
			code := template_code (gvkfe1a_template_code)
			etl_code := gvkfe1_etl_code
			default_template := default_message_template (gvkfe1a_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
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
			-- dollar7: $7 = feature name
		end

	make_gvkfe2a (a_class: ET_CLASS; a_feature: ET_FEATURE)
			-- Create a new GVKFE-2 error: feature `a_feature' in kernel
			-- class `a_class' is not an attribute.
			--
			-- Not in ETL
			-- GVKFE: Gobo Validity Kernel FEature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_not_attribute: not a_feature.is_attribute
		do
			current_class := a_class
			class_impl := a_class
			if a_feature.implementation_class = a_class then
				position := a_feature.name.position
			else
				position := null_position
			end
			code := template_code (gvkfe2a_template_code)
			etl_code := gvkfe2_etl_code
			default_template := default_message_template (gvkfe2a_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_feature.lower_name, 7)
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
			-- dollar7: $7 = feature name
		end

	make_gvkfe3a (a_class: ET_CLASS; a_feature: ET_FEATURE; a_type: ET_BASE_TYPE)
			-- Create a new GVKFE-3 error: attribute `a_feature' in kernel
			-- class `a_class' has not the expected type `a_type'.
			--
			-- Not in ETL
			-- GVKFE: Gobo Validity Kernel FEature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_is_attribute: a_feature.is_attribute
			a_type_not_void: a_type /= Void
			a_type_is_named_type: a_type.is_named_type
		do
			current_class := a_class
			class_impl := a_class
			if a_feature.implementation_class = a_class then
				position := a_feature.name.position
			else
				position := null_position
			end
			code := template_code (gvkfe3a_template_code)
			etl_code := gvkfe3_etl_code
			default_template := default_message_template (gvkfe3a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_feature.lower_name, 7)
			parameters.put (a_type.to_text, 8)
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
			-- dollar7: $7 = feature name
			-- dollar8: $8 = expected type
		end

	make_gvkfe4a (a_class: ET_CLASS; a_feature: ET_FEATURE)
			-- Create a new GVKFE-4 error: feature `a_feature' in kernel
			-- class `a_class' is not a procedure.
			--
			-- Not in ETL
			-- GVKFE: Gobo Validity Kernel FEature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_not_procedure: not a_feature.is_procedure
		do
			current_class := a_class
			class_impl := a_class
			if a_feature.implementation_class = a_class then
				position := a_feature.name.position
			else
				position := null_position
			end
			code := template_code (gvkfe4a_template_code)
			etl_code := gvkfe4_etl_code
			default_template := default_message_template (gvkfe4a_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_feature.lower_name, 7)
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
			-- dollar7: $7 = feature name
		end

	make_gvkfe5a (a_class: ET_CLASS; a_feature: ET_FEATURE)
			-- Create a new GVKFE-5 error: feature `a_feature' in kernel
			-- class `a_class' is not a query.
			--
			-- Not in ETL
			-- GVKFE: Gobo Validity Kernel FEature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_not_query: not a_feature.is_query
		do
			current_class := a_class
			class_impl := a_class
			if a_feature.implementation_class = a_class then
				position := a_feature.name.position
			else
				position := null_position
			end
			code := template_code (gvkfe5a_template_code)
			etl_code := gvkfe5_etl_code
			default_template := default_message_template (gvkfe5a_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_feature.lower_name, 7)
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
			-- dollar7: $7 = feature name
		end

	make_gvscn1a (a_class: ET_CLASS; a_name: ET_CLASS_NAME)
			-- Create a new GVSCN-1 error: the file `a_class.filename' is
			-- supposed to contain a class of name `a_class.name', but it
			-- actually contains a class of name `a_name'.
			--
			-- Not in ETL
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_in_cluster
			a_name_not_void: a_name /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			code := template_code (gvscn1a_template_code)
			etl_code := gvscn1_etl_code
			default_template := default_message_template (gvscn1a_default_template)
			create parameters.make_filled (empty_string, 1, 9)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_class.group.full_lower_name ('/'), 7)
			parameters.put (a_class.filename, 8)
			parameters.put (a_name.upper_name, 9)
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
			-- dollar7: $7 = group name
			-- dollar8: $8 = filename
			-- dollar9: $9 = name of class actually found in that file
		end

	make_gvscn1b (a_class: ET_CLASS)
			-- Create a new GVSCN-1 error: the file `a_class.filename' is
			-- supposed to contain a class of name `a_class.name', but it
			-- does not.
			--
			-- Not in ETL
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_in_cluster
		do
			current_class := a_class
			class_impl := a_class
			position := null_position
			code := template_code (gvscn1b_template_code)
			etl_code := gvscn1_etl_code
			default_template := default_message_template (gvscn1b_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_class.group.full_lower_name ('/'), 7)
			parameters.put (a_class.filename, 8)
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
			-- dollar7: $7 = group name
			-- dollar8: $8 = filename
		end

	make_gvtcg5a (a_class, a_class_impl: ET_CLASS; a_type: ET_CLASS_TYPE; an_actual: ET_TYPE; a_formal: ET_FORMAL_PARAMETER)
			-- Create a new GVTCG-5 error: actual generic paramater `an_actual' of `a_type' in
			-- `a_class_impl' and viewed from one of its descendants `a_class' is not a
			-- reference type but the corresponding formal parameter `a_formal' is marked
			-- as reference.
			--
			-- Not in ETL
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_type_not_void: a_type /= Void
			an_actual_not_void: an_actual /= Void
			a_formal_not_void: a_formal /= Void
		do
			current_class := a_class
			class_impl := a_class_impl
			position := an_actual.position
			code := template_code (gvtcg5a_template_code)
			etl_code := gvtcg5_etl_code
			default_template := default_message_template (gvtcg5a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (an_actual.to_text, 7)
			parameters.put (a_type.to_text, 8)
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
			-- dollar7: $7 = actual generic parameter
			-- dollar8: $8 = generic type
		end

	make_gvtcg5b (a_class, a_class_impl: ET_CLASS; a_type: ET_CLASS_TYPE; an_actual: ET_TYPE; a_formal: ET_FORMAL_PARAMETER)
			-- Create a new GVTCG-5 error: actual generic paramater `an_actual' of `a_type' in
			-- `a_class_impl' and viewed from one of its descendants `a_class' is not a
			-- expanded type but the corresponding formal parameter `a_formal' is marked
			-- as expanded.
			--
			-- Not in ETL
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_type_not_void: a_type /= Void
			an_actual_not_void: an_actual /= Void
			a_formal_not_void: a_formal /= Void
		do
			current_class := a_class
			class_impl := a_class_impl
			position := an_actual.position
			code := template_code (gvtcg5b_template_code)
			etl_code := gvtcg5_etl_code
			default_template := default_message_template (gvtcg5b_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (an_actual.to_text, 7)
			parameters.put (a_type.to_text, 8)
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
			-- dollar7: $7 = actual generic parameter
			-- dollar8: $8 = generic type
		end

	make_gvuaa0a (a_class: ET_CLASS; a_name: ET_IDENTIFIER; a_feature: ET_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			code := template_code (gvuaa0a_template_code)
			etl_code := gvuaa_etl_code
			default_template := default_message_template (gvuaa0a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
			parameters.put (a_feature.lower_name, 8)
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
			-- dollar7: $7 = formal argument name
			-- dollar8: $8 = feature name
		end

	make_gvuaa0b (a_class: ET_CLASS; a_name: ET_IDENTIFIER; an_agent: ET_INLINE_AGENT)
			-- Create a new GVUAA error: `a_name' is a formal argument of
			-- inline agent `an_agent' in `a_class', and hence cannot have actual
			-- arguments.
			--
			-- Not in ETL as validity error but as syntax error
			-- GVUAA: See ETL2 VUAR
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			an_agent_not_void: an_agent /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			code := template_code (gvuaa0b_template_code)
			etl_code := gvuaa_etl_code
			default_template := default_message_template (gvuaa0b_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
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
			-- dollar7: $7 = formal argument name
		end

	make_gvual0a (a_class: ET_CLASS; a_name: ET_IDENTIFIER; a_feature: ET_FEATURE)
			-- Create a new GVUAL error: `a_name' is a local variable of
			-- `a_feature' in `a_class', and hence cannot have actual
			-- arguments.
			--
			-- Not in ETL as validity error but as syntax error
			-- GVUAL: See ETL2 VUAR
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			code := template_code (gvual0a_template_code)
			etl_code := gvual_etl_code
			default_template := default_message_template (gvual0a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
			parameters.put (a_feature.lower_name, 8)
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
			-- dollar7: $7 = local variable name
			-- dollar8: $8 = feature name
		end

	make_gvual0b (a_class: ET_CLASS; a_name: ET_IDENTIFIER; an_agent: ET_INLINE_AGENT)
			-- Create a new GVUAL error: `a_name' is a local variable of
			-- inline agent `an_agent' in `a_class', and hence cannot have actual
			-- arguments.
			--
			-- Not in ETL as validity error but as syntax error
			-- GVUAL: See ETL2 VUAR
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			an_agent_not_void: an_agent /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			code := template_code (gvual0b_template_code)
			etl_code := gvual_etl_code
			default_template := default_message_template (gvual0b_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
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
			-- dollar7: $7 = local variable name
		end

	make_gvuia0a (a_class: ET_CLASS; a_name: ET_IDENTIFIER; a_feature: ET_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			code := template_code (gvuia0a_template_code)
			etl_code := gvuia_etl_code
			default_template := default_message_template (gvuia0a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
			parameters.put (a_feature.lower_name, 8)
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
			-- dollar7: $7 = formal argument name
			-- dollar8: $8 = feature name
		end

	make_gvuia0b (a_class: ET_CLASS; a_name: ET_IDENTIFIER; an_agent: ET_INLINE_AGENT)
			-- Create a new GVUIA error: `a_name' is a formal argument of
			-- inline agent `an_agent' in `a_class', and hence cannot be an
			-- instruction.
			--
			-- Not in ETL as validity error but as syntax error
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			an_agent_not_void: an_agent /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			code := template_code (gvuia0b_template_code)
			etl_code := gvuia_etl_code
			default_template := default_message_template (gvuia0b_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
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
			-- dollar7: $7 = formal argument name
		end

	make_gvuil0a (a_class: ET_CLASS; a_name: ET_IDENTIFIER; a_feature: ET_FEATURE)
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
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			code := template_code (gvuil0a_template_code)
			etl_code := gvuil_etl_code
			default_template := default_message_template (gvuil0a_default_template)
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
			parameters.put (a_feature.lower_name, 8)
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
			-- dollar7: $7 = local variable name
			-- dollar8: $8 = feature name
		end

	make_gvuil0b (a_class: ET_CLASS; a_name: ET_IDENTIFIER; an_agent: ET_INLINE_AGENT)
			-- Create a new GVUIL error: `a_name' is a local variable of
			-- inline agent `an_agent' in `a_class', and hence cannot be an
			-- instruction.
			--
			-- Not in ETL as validity error but as syntax error
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			an_agent_not_void: an_agent /= Void
		do
			current_class := a_class
			class_impl := a_class
			position := a_name.position
			code := template_code (gvuil0b_template_code)
			etl_code := gvuil_etl_code
			default_template := default_message_template (gvuil0b_default_template)
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (a_name.lower_name, 7)
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
			-- dollar7: $7 = local variable name
		end

	make_gvwmc2a (a_class, a_class_impl: ET_CLASS; a_constant: ET_INTEGER_CONSTANT; a_type: ET_NAMED_TYPE)
			-- Create a new GVWMC-2 error: `a_constant' in `a_class_impl' and viewed
			-- from one of its descendants `a_class' (possibly itself) is not
			-- representable as an instance of the integer type `a_type'.
			--
			-- Not in ECMA-367-2
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_constant_not_void: a_constant /= Void
			a_type_not_void: a_type /= Void
		local
			l_literal: STRING
		do
			current_class := a_class
			class_impl := a_class_impl
			position := a_constant.value_position
			code := template_code (gvwmc2a_template_code)
			etl_code := gvwmc2_etl_code
			default_template := default_message_template (gvwmc2a_default_template)
			if a_constant.sign = Void then
				l_literal := a_constant.literal
			elseif a_constant.sign.is_minus then
				l_literal := "-" + a_constant.literal
			else
				l_literal := "+" + a_constant.literal
			end
			create parameters.make_filled (empty_string, 1, 8)
			parameters.put (etl_code, 1)
			parameters.put (filename, 2)
			parameters.put (position.line.out, 3)
			parameters.put (position.column.out, 4)
			parameters.put (current_class.upper_name, 5)
			parameters.put (class_impl.upper_name, 6)
			parameters.put (l_literal, 7)
			parameters.put (a_type.to_text, 8)
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
			-- dollar7: $7 = constant value
			-- dollar8: $8 = integer type
		end

feature -- Access

	class_impl: ET_CLASS
			-- Class where current error was written

	filename: STRING
			-- Name of file where current error occurred
		do
			if class_impl.is_in_cluster then
				Result := class_impl.filename
			else
				Result := "not in a cluster"
			end
		end

feature -- Setting

	set_class_impl (a_class: like class_impl)
			-- Set `class_impl' to `a_class'.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			class_impl := a_class
		ensure
			class_impl_set: class_impl = a_class
		end

	set_current_class (a_class: like current_class)
			-- Set `current_class' to `a_class'.
		require
			a_class_not_void: a_class /= Void
		do
			current_class := a_class
		ensure
			current_class_set: current_class = a_class
		end

feature {NONE} -- Implementation

	default_message_template (a_template: STRING): STRING
			-- Default error message template of the form:
			--    [$1] class $5 ($3,$4): `a_template'
			-- if `class_impl' = `current_class', or:
			--    [$1] class $5 ($6,$3,$4): `a_template'
			-- otherwise, where:
			--    $1 = ETL code
			--    $2 = filename
			--    $3 = line
			--    $4 = column
			--    $5 = class name
			--    $6 = implementation class name
			-- Omit parantheses when no location is provided.
		require
			a_template_not_void: a_template /= Void
		do
			if class_impl = current_class then
				if position = null_position then
					Result := "[$1] class $5: " + a_template
				else
					Result := "[$1] class $5 ($3,$4): " + a_template
				end
			else
				Result := "[$1] class $5 ($6,$3,$4): " + a_template
			end
		ensure
			template_not_void: Result /= Void
		end

	vaol1a_default_template: STRING = "old expression does not appear in a postcondition."
	vape0a_default_template: STRING = "feature `$8' of class $5 appearing in the precondition of `$9' is not exported to class $10 to which feature `$9' is exported."
	vape0b_default_template: STRING = "feature `$8' of class $9 appearing in the precondition of `$10' is not exported to class $11 to which feature `$10' is exported."
	vave0a_default_template: STRING = "loop variant expression of non-INTEGER type '$7'."
	vbac1a_default_template: STRING = "the source of the assigner call (of type '$7') does not conform nor convert to its target (of type '$8')."
	vbac2a_default_template: STRING = "query `$7' in class $8 has no assigner command."
	vcch1a_default_template: STRING = "class is not marked as deferred but has deferred feature `$7'."
	vcch1b_default_template: STRING = "class is not marked as deferred but has deferred feature `$7' inherited from $8."
	vcch2a_default_template: STRING = "class is marked as deferred but has no deferred feature."
	vcfg1a_default_template: STRING = "formal generic parameter '$7' has the same name as a class in the surrounding universe."
	vcfg2a_default_template: STRING = "'$7' is the name of formal generic parameters #$7 and #$8."
	vcfg3a_default_template: STRING = "invalid type '$7' in constraint of formal generic parameter."
	vcfg3b_default_template: STRING = "invalid type '$7' in constraint of formal generic parameter."
	vcfg3c_default_template: STRING = "invalid type '$7' in constraint of formal generic parameter."
	vcfg3d_default_template: STRING = "constraint of formal generic parameter '$7' is '$8' itself."
	vcfg3e_default_template: STRING = "constraint of formal generic parameter '$7' is another formal generic parameter '$8'."
	vcfg3g_default_template: STRING = "formal generic constraint cycle $7."
	vcfg3h_default_template: STRING = "constraint of formal generic parameter '$7' contains '$8' itself."
	vcfg3j_default_template: STRING = "formal generic constraint cycle $7."
	vdjr0a_default_template: STRING = "joined deferred features `$7' inherited from $8 and $9 don't have the same signature. Different number of arguments."
	vdjr0b_default_template: STRING = "joined deferred features `$7' inherited from $8 and $9 don't have the same signature. Type of argument number $10 differs."
	vdjr0c_default_template: STRING = "joined deferred features `$7' inherited from $8 and $9 don't have the same signature. Type of result differs."
	vdjr2a_default_template: STRING = "feature `$7' inherited from $9 has an alias `$8' but the version inherited from $10 has none."
	vdjr2b_default_template: STRING = "feature `$7' inherited from $9 has an alias `$8' but the version inherited from $11 has a different one `$10'."
	vdpr1a_default_template: STRING = "Precursor instruction does not appear in a Routine_body."
	vdpr1b_default_template: STRING = "Precursor expression does not appear in a Routine_body."
	vdpr2a_default_template: STRING = "class $7 in Precursor construct is not a parent of class $6."
	vdpr3a_default_template: STRING = "conflict in Precursor construct between effective features `$7' inherited from '$8' and `$9' inherited from '$10'."
	vdpr3b_default_template: STRING = "feature `$7' is not the redefinition of an effective feature."
	vdpr3c_default_template: STRING = "feature `$7' is not the redefinition of a feature from parent '$8'."
	vdpr3d_default_template: STRING = "feature `$7' is not the redeclaration of a feature."
	vdpr3e_default_template: STRING = "the associated feature of inline agents cannot be redefined."
	vdpr4a_default_template: STRING = "the number of actual arguments in Precursor call is not the same as the number of formal arguments of feature `$7' in class $8."
	vdpr4b_default_template: STRING = "the $9-th actual argument (of type '$10') does not conform to the corresponding formal argument (of type '$11') of feature `$7' in class $8."
	vdrd2a_default_template: STRING = "signature of feature `$7' does not conform to the signature of redeclared feature `$8' in parent $9."
	vdrd2b_default_template: STRING = "signature of feature `$7' inherited from $8 does not conform to the signature of redeclared feature `$9' in parent $10."
	vdrd2c_default_template: STRING = "signature of selected feature `$7' does not conform to the signature of replicated feature `$8' in parent $9."
	vdrd2d_default_template: STRING = "signature of selected feature `$7' inherited from $8 does not conform to the signature of replicated feature `$9' in parent $10."
	vdrd3a_default_template: STRING = "feature `$7' is redeclared but its preconditions do not begin with 'require else'."
	vdrd3b_default_template: STRING = "feature `$7' is redeclared but its postconditions do not begin with 'ensure then'."
	vdrd4a_default_template: STRING = "deferred feature `$7' inherited from $8 is redefined but is not listed in the Redefine subclause."
	vdrd4b_default_template: STRING = "effective feature `$7' inherited from $8 is redefined but is not listed in the Redefine subclause."
	vdrd4c_default_template: STRING = "effective feature `$8' inherited from $9 is redefined into a deferred one but is not listed in the Undefine and Redefine subclauses."
	vdrd5a_default_template: STRING = "effective feature `$7' inherited from $8 is redefined into a deferred one."
	vdrd6a_default_template: STRING = "attribute `$7' inherited from $8 is not redeclared into an attribute."
	vdrd6b_default_template: STRING = "attribute `$7' inherited from $8 and its redeclared version don't have the same type expandedness."
	vdrd7a_default_template: STRING = "feature `$7' inherited from $8 has no alias but its redeclared version has one `$10'."
	vdrd7b_default_template: STRING = "feature `$7' inherited from $9 has an alias `$8' but its redeclared version has none."
	vdrd7c_default_template: STRING = "feature `$7' inherited from $9 has an alias `$8' but its redeclared version has a different one `$11'."
	vdrs1a_default_template: STRING = "`$7' is not the final name of a feature inherited from $8."
	vdrs2a_default_template: STRING = "cannot redefine the frozen feature `$7'."
	vdrs2b_default_template: STRING = "cannot redefine the constant attribute `$7'."
	vdrs3a_default_template: STRING = "feature name `$7' appears twice in the Redefine subclause of parent $8."
	vdrs4a_default_template: STRING = "Redefine subclause of $8 lists feature `$7' but it is not redefined."
	vdrs4b_default_template: STRING = "redeclaration of feature `$7' from $8 is an effecting and should not appear in the Redefine subclause."
	vdus1a_default_template: STRING = "`$7' is not the final name of a feature inherited from $8."
	vdus2a_default_template: STRING = "cannot undefine the frozen feature `$7'."
	vdus2b_default_template: STRING = "cannot undefine the attribute `$7'."
	vdus3a_default_template: STRING = "cannot undefine the deferred feature `$7'."
	vdus4a_default_template: STRING = "feature name `$7' appears twice in the Undefine subclause of parent $8."
	veen0a_default_template: STRING = "`$7' appears in feature `$8', but it is not the final name of a feature in class $6 nor the name of a local variable or formal argument of feature `$8'."
	veen0b_default_template: STRING = "`$7' appears in an inline agent, but it is not the final name of a feature in class $6 nor the name of a local variable or formal argument of this inline agent."
	veen2a_default_template: STRING = "entity 'Result' appears in the body, postcondition or rescue clause of a procedure `$7'."
	veen2b_default_template: STRING = "entity 'Result' appears in the precondition of feature `$7'."
	veen2c_default_template: STRING = "local entity `$7' appears in the precondition or postcondition of feature `$8'."
	veen2d_default_template: STRING = "entity 'Result' appears in the invariant of the class."
	veen2e_default_template: STRING = "local entity `$7' appears in the precondition or postcondition of an inline agent."
	veen2f_default_template: STRING = "entity 'Result' appears in the precondition of an inline agent."
	veen2g_default_template: STRING = "entity 'Result' appears in the body, postcondition or rescue clause of an inline agent whose associated feature is a procedure."
	veen8a_default_template: STRING = "`$7' appearing in feature `$8' or one of its possibly nested inline agents, is an object-test local that is used outside of its scope."
	veen8b_default_template: STRING = "`$7' appearing in the invariant or one of its possibly nested inline agents, is an object-test local that is used outside of its scope."
	veen9a_default_template: STRING = "`$7' appearing in feature `$8' or one of its possibly nested inline agents, is an across cursor that is used outside of its scope."
	veen9b_default_template: STRING = "`$7' appearing in the invariant or one of its possibly nested inline agents, is an across cursor that is used outside of its scope."
	vevi0a_default_template: STRING = "local entity `$7' declared as attached is used before being initialized."
	vevi0b_default_template: STRING = "entity 'Result' declared as attached is used before being initialized."
	vevi0c_default_template: STRING = "entity 'Result' declared as attached is not initialized at the end of the body of function `$7'."
	vevi0d_default_template: STRING = "entity 'Result' declared as attached is not initialized at the end of the body of inline agent."
	vevi0e_default_template: STRING = "entity 'Result' declared as attached is not initialized at the end of the body of attribute `$7'."
	vfac1a_default_template: STRING = "query `$7' has an assigner mark `$8' but there is no feature with that name."
	vfac1b_default_template: STRING = "query `$7' has an assigner mark `$8' but this feature is not a procedure."
	vfac2a_default_template: STRING = "the number of arguments in assigner procedure `$8' is not one more than the number of arguments in query `$7'."
	vfac3a_default_template: STRING = "the type of the first argument of assigner procedure `$8' and the result type of query `$7' do not have the same deanchored form."
	vfac4a_default_template: STRING = "the type of the $10-th argument of assigner procedure `$8' and of the $9-th argument of query `$7' do not have the same deanchored form."
	vfav1a_default_template: STRING = "feature `$7' has a binary Operator alias `$8' but is not a query with at exactly one argument."
	vfav1b_default_template: STRING = "feature `$7' has a unary Operator alias `$8' but is not a query with no argument."
	vfav1c_default_template: STRING = "features `$7' and `$9' have both the same unary Operator alias `$8'."
	vfav1d_default_template: STRING = "features `$7' and `$9' inherited from $11 have both the same unary Operator alias `$8'."
	vfav1e_default_template: STRING = "features `$7' inherited from $9 and `$10' inherited from $12 have both the same unary Operator alias `$8'."
	vfav1f_default_template: STRING = "features `$7' and `$9' have both the same binary Operator alias `$8'."
	vfav1g_default_template: STRING = "features `$7' and `$9' inherited from $11 have both the same binary Operator alias `$8'."
	vfav1h_default_template: STRING = "features `$7' inherited from $9 and `$10' inherited from $12 have both the same binary Operator alias `$8'."
	vfav2a_default_template: STRING = "feature `$7' has a Bracket alias `$8' but is not a query with at least one argument."
	vfav2b_default_template: STRING = "features `$7' and `$9' have both the same Bracket alias `$8'."
	vfav2c_default_template: STRING = "features `$7' and `$9' inherited from $11 have both the same Bracket alias `$8'."
	vfav2d_default_template: STRING = "features `$7' inherited from $9 and `$10' inherited from $12 have both the same Bracket alias `$8'."
	vffd4a_default_template: STRING = "deferred feature `$7' is marked as frozen."
	vffd5a_default_template: STRING = "feature `$7' has a Prefix name but is not an attribute or a function with no argument."
	vffd6a_default_template: STRING = "feature `$7' has an Infix name but is not a function with exactly one argument."
	vffd7a_default_template: STRING = "feature `$7' is a once funtion but its type contains an anchored type."
	vffd7b_default_template: STRING = "feature `$7' is a once funtion but its type contains a formal generic parameter."
	vgcc1a_default_template: STRING = "creation expression with no Creation_call part, but $7 is deferred."
	vgcc1b_default_template: STRING = "creation instruction with no Creation_call part, but $7 is deferred."
	vgcc3a_default_template: STRING = "explicit creation type '$7' does not conform to target entity type '$8'."
	vgcc5a_default_template: STRING = "creation expression with no Creation_call part, but $7 has a Creators part."
	vgcc5b_default_template: STRING = "creation instruction with no Creation_call part, but $7 has a Creators part."
	vgcc6a_default_template: STRING = "`$7' is the final name of a once-procedure."
	vgcc6b_default_template: STRING = "`$7' is not the final name of a procedure in class $9."
	vgcc6c_default_template: STRING = "procedure `$8' of class $9 is not exported for creation to class $5."
	vgcc6d_default_template: STRING = "`$7' is not the final name of a procedure in class $9."
	vgcc6e_default_template: STRING = "procedure `$8' of class $9 is not exported for creation to class $5."
	vgcc8a_default_template: STRING = "procedure `$8' of class $9 is not listed as creation procedure of the $10-th formal generic parameter of class $5."
	vgcc8b_default_template: STRING = "procedure `$8' of class $9 is not listed as creation procedure of the $10-th formal generic parameter of class $5."
	vgcp1a_default_template: STRING = "deferred class has a creation clause."
	vgcp2a_default_template: STRING = "`$7' is not the final name of a procedure."
	vgcp2b_default_template: STRING = "`$7' is not the final name of a procedure."
	vgcp3a_default_template: STRING = "procedure name `$7' appears twice in creation clause."
	vgcp3b_default_template: STRING = "procedure name `$7' appears in two different creation clauses."
	vgcp3c_default_template: STRING = "procedure name `$7' appears twice in creation clause of constraint."
	vhay0a_default_template: STRING = "implicitly inherits from unknown class ANY."
	vhpr1a_default_template: STRING = "inheritance cycle $7."
	vhpr1b_default_template: STRING = "inheritance cycle when inheriting from $7."
	vhpr3a_default_template: STRING = "invalid type '$7' in parent clause."
	vhpr3b_default_template: STRING = "invalid type '$7' in parent clause."
	vhpr3c_default_template: STRING = "invalid type '$7' in parent clause."
	vhrc1a_default_template: STRING = "`$7' is not the final name of a feature in $8."
	vhrc2a_default_template: STRING = "feature name `$7' appears as first element of two Rename_pairs."
	vhrc4a_default_template: STRING = "`$7' is of the Prefix form but `$8' in $9 is not an attribute nor a function with no argument."
	vhrc4b_default_template: STRING = "`$7' has a Bracket alias `$8' but `$9' in $10 is not a query with at least one argument."
	vhrc4c_default_template: STRING = "`$7' has a binary Operator alias `$8' but `$9' in $10 is not a query with exactly one argument."
	vhrc4d_default_template: STRING = "`$7' has a unary Operator alias `$8' but `$9' in $10 is not a query with no argument."
	vhrc5a_default_template: STRING = "`$7' is of the Infix form but `$8' in $9 is not a function with one argument."
	vjar0a_default_template: STRING = "the source of the assignment (of type '$7') does not conform nor convert to its target entity (of type '$8')."
	vjaw0a_default_template: STRING = "feature `$7' is not an attribute. A Writable is either a local variable (including Result) or an attribute."
	vjaw0b_default_template: STRING = "`$7' is the name of a formal argument of feature `$8'. A Writable is either a local variable (including Result) or an attribute."
	vjaw0c_default_template: STRING = "`$7' is the name of a formal argument of an inline agent. A Writable is either a local variable (including Result) or an attribute."
	vjrv0a_default_template: STRING = "the type '$7' of the target entity of the assignment attempt is not a reference type."
	vkcn1a_default_template: STRING = "query `$8' of class $9 appears in a call instruction."
	vkcn1c_default_template: STRING = "query `$8' appears in a call instruction."
	vkcn2a_default_template: STRING = "procedure `$8' of class $9 appears in a call expression."
	vkcn2c_default_template: STRING = "procedure `$8' appears in a call expression."
	vlel1a_default_template: STRING = "'all' keyword appears twice in the Export subclause of parent $7."
	vlel2a_default_template: STRING = "`$7' is not the final name of a feature inherited from $8."
	vlel3a_default_template: STRING = "feature name `$7' appears twice in the Export subclause of parent $8."
	vmfn0a_default_template: STRING = "two features with the same name `$7'."
	vmfn0b_default_template: STRING = "two features with the same name `$7' in current class and `$8' inherited from $9."
	vmfn0c_default_template: STRING = "two features with the same name `$7' inherited from $8 and `$9' inherited from $10."
	vmfn2a_default_template: STRING = "feature `$7' inherited from $9 has an alias `$8' but the version inherited from $10 has none."
	vmfn2b_default_template: STRING = "feature `$7' inherited from $9 has an alias `$8' but the version inherited from $11 has a different one `$10'."
	vmrc2a_default_template: STRING = "replicated features $7 have not been selected."
	vmrc2b_default_template: STRING = "replicated features $7 have been selected more than once."
	vmss1a_default_template: STRING = "`$7' is not the final name of a feature inherited from $8."
	vmss2a_default_template: STRING = "feature name `$7' appears twice in the Select subclause of parent $8."
	vmss3a_default_template: STRING = "feature name `$7' appears in the Select subclause of parent $8 but is not replicated."
	voit1a_default_template: STRING = "the type '$7' of the across iterable expression does not conform to any generic derivation of ITERABLE."
	voit2a_default_template: STRING = "across cursor name '$6' is also the final name of a feature."
	voit2b_default_template: STRING = "across cursor name '$6' is also the name of a formal argument of an enclosing feature or inline agent."
	voit2c_default_template: STRING = "across cursor name '$6' is also the name of a local variable of an enclosing feature or inline agent."
	voit2d_default_template: STRING = "across with cursor name '$6' appears in the scope of an object-test local with the same name."
	voit2e_default_template: STRING = "across with cursor name '$6' appears in the scope of another across cursor with the same name."
	vomb1a_default_template: STRING = "inspect expression of type '$7' different from INTEGER or CHARACTER."
	vomb2a_default_template: STRING = "inspect constant of type '$7' different from type '$8' of inspect expression."
	vomb2b_default_template: STRING = "inspect choice `$7' is not a constant attribute."
	vpca1a_default_template: STRING = "`$7' is not the final name of a feature in class $5."
	vpca1b_default_template: STRING = "`$7' is not the final name of a feature in class $8."
	vpca2a_default_template: STRING = "feature `$8' of class $9 is not exported to class $5."
	vpca3a_default_template: STRING = "the number of actual arguments is not the same as the number of formal arguments of feature `$8' in class $9."
	vpca3b_default_template: STRING = "the number of actual arguments is not the same as the number of formal arguments of feature `$8'."
	vpca4a_default_template: STRING = "the $10-th actual argument (of type '$11') does not conform to the corresponding formal argument (of type '$12') of feature `$8' in class $9."
	vpca4b_default_template: STRING = "the $9-th actual argument (of type '$10') does not conform to the corresponding formal argument (of type '$11') of feature `$8'."
	vpca5a_default_template: STRING = "the type '$11' specified for the $10-th actual argument of Call_agent does not conform to the corresponding formal argument (of type '$12') of feature `$8' in class $9."
	vpca5b_default_template: STRING = "the type '$10' specified for the $9-th actual argument of Call_agent does not conform to the corresponding formal argument (of type '$11') of feature `$8'."
	vpir1a_default_template: STRING = "argument name '$7' in inline agent is also the name of a formal argument of an enclosing feature or inline agent."
	vpir1b_default_template: STRING = "argument name '$7' in inline agent is also the name of a local variable of an enclosing feature or inline agent."
	vpir1c_default_template: STRING = "local variable name '$7' in inline agent is also the name of a formal argument of an enclosing feature or inline agent."
	vpir1d_default_template: STRING = "local variable name '$7' in inline agent is also the name of a local variable of an enclosing feature or inline agent."
	vpir1e_default_template: STRING = "argument name '$7' in inline agent is also the name of an object-test local of an enclosing feature or inline agent whose scope contains the inline agent."
	vpir1f_default_template: STRING = "local variable name '$7' in inline agent is also the name of an object-test local of an enclosing feature or inline agent whose scope contains the inline agent."
	vpir1g_default_template: STRING = "argument name '$7' in inline agent is also the name of an across cursor of an enclosing feature or inline agent whose scope contains the inline agent."
	vpir1h_default_template: STRING = "local variable name '$7' in inline agent is also the name of an across cursor of an enclosing feature or inline agent whose scope contains the inline agent."
	vpir3a_default_template: STRING = "inline agents cannot be of the once form."
	vpir3b_default_template: STRING = "inline agents cannot be of the external form."
	vqmc1a_default_template: STRING = "boolean constant attribute `$7' is not declared of type BOOLEAN."
	vqmc2a_default_template: STRING = "character constant attribute `$7' is not declared of type CHARACTER."
	vqmc3a_default_template: STRING = "integer constant attribute `$7' is not declared of type INTEGER."
	vqmc3b_default_template: STRING = "integer value '$9' in constant attribute `$7' is not representable as an instance of '$8'."
	vqmc4a_default_template: STRING = "real constant attribute `$7' is not declared of type REAL or DOUBLE."
	vqmc5a_default_template: STRING = "string constant attribute `$7' is not declared of type STRING."
	vqmc6a_default_template: STRING = "bit constant attribute `$7' is not declared of Bit_type."
	vqui0a_default_template: STRING = "unique attribute `$7' is not declared of type INTEGER."
	vred0a_default_template: STRING = "argument name '$7' appear twice in feature `$8'."
	vred0b_default_template: STRING = "local variable name '$7' appear twice in feature `$8'."
	vred0c_default_template: STRING = "argument name '$7' appear twice in inline agent."
	vred0d_default_template: STRING = "local variable name '$7' appear twice in inline agent."
	vreg0a_default_template: STRING = "argument name '$7' appear twice in feature `$8'."
	vreg0b_default_template: STRING = "local variable name '$7' appear twice in feature `$8'."
	vrfa0a_default_template: STRING = "argument name '$7' in feature `$8' is also the final name of a feature."
	vrfa0b_default_template: STRING = "argument name '$7' in inline agent is also the final name of a feature."
	vrle1a_default_template: STRING = "local variable name '$7' in feature `$8' is also the final name of a feature."
	vrle2a_default_template: STRING = "local variable name '$7' in feature `$8' is also the name of a formal argument of this feature."
	vrlv1a_default_template: STRING = "local variable name '$7' in feature `$8' is also the final name of a feature."
	vrlv1b_default_template: STRING = "local variable name '$7' in inline agent is also the final name of a feature."
	vrlv2a_default_template: STRING = "local variable name '$7' in feature `$8' is also the name of a formal argument of this feature."
	vrlv2b_default_template: STRING = "local variable name '$7' in inline agent is also the name of a formal argument of this agent."
	vtat1a_default_template: STRING = "invalid type '$7': the anchor `$8' must be the final name of a query."
	vtat1b_default_template: STRING = "invalid type '$7': the anchor `$8' must be the final name of a query, or an argument of routine `$9'."
	vtat1c_default_template: STRING = "invalid type '$7': the anchor `$8' must be the final name of a query in class $9."
	vtat2a_default_template: STRING = "anchor cycle $7."
	vtat2b_default_template: STRING = "invalid type '$7' when part of a qualified anchored type: the type of anchor `$8' must not depend (possibly recursively) on a qualified anchored type."
	vtbt0a_default_template: STRING = "invalid type '$7': `$8' is not the final name of a constant attribute of type INTEGER."
	vtbt0b_default_template: STRING = "invalid type '$7': `$8' is not the final name of a feature."
	vtbt0c_default_template: STRING = "invalid type '$7': bit size must be a positive integer constant."
	vtbt0d_default_template: STRING = "invalid type '$7': bit size must be a positive integer constant."
	vtcg3a_default_template: STRING = "actual generic parameter '$7' in type '$9' does not conform to constraint '$8'."
	vtcg4a_default_template: STRING = "base class $9 of the $7-th actual generic parameter of $10 does not make feature `$8' available as creation procedure to class $10."
	vtcg4b_default_template: STRING = "the $7-th actual generic parameter of $10, which is the $9-th formal generic parameter of class $5, does not list feature `$8' as creation procedure in its generic constraint."
	vtct0a_default_template: STRING = "type based on unknown class $7."
	vtct0b_default_template: STRING = "type based on unknown class $7."
	vtgc0a_default_template: STRING = "`$7' is not the final name of a procedure in constraint's base class $8."
	vtgc0b_default_template: STRING = "`$7' is not the final name of a procedure in constraint's base class $8."
	vtug1a_default_template: STRING = "type '$7' has actual generic parameters but class $8 is not generic."
	vtug2a_default_template: STRING = "type '$7' has wrong number of actual generic parameters."
	vuar1a_default_template: STRING = "the number of actual arguments is not the same as the number of formal arguments of feature `$8' in class $9."
	vuar1b_default_template: STRING = "the number of actual arguments is not the same as the number of formal arguments of feature `$8'."
	vuar1c_default_template: STRING = "call to Tuple label `$7' cannot have arguments."
	vuar2a_default_template: STRING = "the $10-th actual argument (of type '$11') does not conform to the corresponding formal argument (of type '$12') of feature `$8' in class $9."
	vuar2b_default_template: STRING = "the $9-th actual argument (of type '$10') does not conform to the corresponding formal argument (of type '$11') of feature `$8'."
	vuar4a_default_template: STRING = "`$7' is not the final name of a feature in class $5."
	vuex1a_default_template: STRING = "`$7' is not the final name of a feature in class $5."
	vuex2a_default_template: STRING = "`$7' is not the final name of a feature in class $8."
	vuex2b_default_template: STRING = "feature `$8' of class $9 is not exported to class $5."
	vuot1a_default_template: STRING = "object-test local name '$6' is also the final name of a feature."
	vuot1b_default_template: STRING = "object-test local name '$6' is also the name of a formal argument of an enclosing feature or inline agent."
	vuot1c_default_template: STRING = "object-test local name '$6' is also the name of a local variable of an enclosing feature or inline agent."
	vuot1d_default_template: STRING = "object-test with local name '$6' appears in the scope of another object-test local with the same name."
	vuot1e_default_template: STRING = "object-test with local name '$6' appears in the scope of an across cursor with the same name."
	vuot1f_default_template: STRING = "the scope of object-test with local name '$6' overlaps with the scope of another object-test with the same local name."
	vuot3a_default_template: STRING = "object-test with local name '$6' has the same name as another object-test local appearing in the same feature `$7' or in the same inline agent."
	vuot3b_default_template: STRING = "object-test with local name '$6' has the same name as another object-test local appearing in the invariant or in the same inline agent."
	vuot4a_default_template: STRING = "ISE does not support object-tests in preconditions."
	vuot4b_default_template: STRING = "ISE does not support object-tests in check instructions."
	vuta2a_default_template: STRING = "the target (of type '$9') of the call to feature `$8' is not attached."
	vuta2b_default_template: STRING = "the target (of type '$8') of the call to Tuple label `$7' is not attached."
	vvok1a_default_template: STRING = "once keys %"$6%" and %"$7%" cannot be combined."
	vvok2a_default_template: STRING = "once key %"$6%" is not supported. The supported once keys are %"THREAD%", %"PROCESS%" and %"OBJECT%"."
	vwbe0a_default_template: STRING = "boolean expression of non-BOOLEAN type '$7'."
	vweq0a_default_template: STRING = "none of the operands of '$7' (of types '$8' and '$9') conforms or converts to the other."
	vweq0b_default_template: STRING = "none of the operands of '$7' (of types '$8' and '$9') conforms or converts to the other."
	vwmq0a_default_template: STRING = "type '$7' in the integer constant is not one of the sized variants of INTEGER."
	vwmq0b_default_template: STRING = "type '$7' in the real constant is not one of the sized variants of REAL."
	vwmq0c_default_template: STRING = "type '$7' in the character constant is not one of the sized variants of CHARACTER."
	vwmq0d_default_template: STRING = "type '$7' in the string constant is not one of the sized variants of STRING."
	vwst1a_default_template: STRING = "feature name `$7' is not the final name of a feature in class $5."
	vwst1b_default_template: STRING = "feature name `$7' is not the final name of an attribute in class $5."
	vwst2a_default_template: STRING = "feature name `$7' appears twice in strip expression."
	vxrt0a_default_template: STRING = "Retry instruction does not appear in a Rescue clause."
	gvagp0a_default_template: STRING = "ancestors with generic parameter mismatch: '$7' and '$8'."
	gvhpr4a_default_template: STRING = "cannot inherit from Bit_type '$7'."
	gvhpr5a_default_template: STRING = "cannot inherit from Tuple_type '$7'."
	gvhso1a_default_template: STRING = "implicitly inherits from unknown class SYSTEM_OBJECT."
	gvhso2a_default_template: STRING = "implicitly inherits from class SYSTEM_OBJECT but SYSTEM_OBJECT is not a .NET class."
	gvkbs0a_default_template: STRING = "built-in routine `$7' in class $5 has not the expected signature '$8'."
	gvkbu1a_default_template: STRING = "unknown built-in routine `$7' in class $5."
	gvkfe1a_default_template: STRING = "feature `$7' is missing in kernel class $5."
	gvkfe2a_default_template: STRING = "feature `$7' in kernel class $5 is not an attribute."
	gvkfe3a_default_template: STRING = "attribute `$7' in kernel class $5 has not the expected type '$8'."
	gvkfe4a_default_template: STRING = "feature `$7' in kernel class $5 is not a procedure."
	gvkfe5a_default_template: STRING = "feature `$7' in kernel class $5 is not a query."
	gvscn1a_default_template: STRING = "file '$8' contains class $9 instead of the expected class $5."
	gvscn1b_default_template: STRING = "file '$8' does not contain the expected class $5."
	gvtcg5a_default_template: STRING = "actual generic parameter '$7' in type '$8' is not a reference type but the corresponding formal parameter is marked as reference."
	gvtcg5b_default_template: STRING = "actual generic parameter '$7' in type '$8' is not expanded type but the corresponding formal parameter is marked as expanded."
	gvuaa0a_default_template: STRING = "`$7' is a formal argument of feature `$8' and hence cannot have actual arguments."
	gvuaa0b_default_template: STRING = "`$7' is a formal argument of an inline agent and hence cannot have actual arguments."
	gvual0a_default_template: STRING = "`$7' is a local variable of feature `$8' and hence cannot have actual arguments."
	gvual0b_default_template: STRING = "`$7' is a local variable of an inline agent and hence cannot have actual arguments."
	gvuia0a_default_template: STRING = "`$7' is a formal argument of feature `$8' and hence cannot be an instruction."
	gvuia0b_default_template: STRING = "`$7' is a formal argument of an inline agent and hence cannot be an instruction."
	gvuil0a_default_template: STRING = "`$7' is a local variable of feature `$8' and hence cannot be an instruction."
	gvuil0b_default_template: STRING = "`$7' is a local variable of an inline agent and hence cannot be an instruction."
	gvwmc2a_default_template: STRING = "integer constant '$7' is not representable as an instance of '$8'."
	gvzzz0a_default_template: STRING = "validity error"
			-- Default templates

	vaol1_etl_code: STRING = "VAOL-1"
	vape_etl_code: STRING = "VAPE"
	vave_etl_code: STRING = "VAVE"
	vbac1_etl_code: STRING = "VBAC-1"
	vbac2_etl_code: STRING = "VBAC-2"
	vcch1_etl_code: STRING = "VCCH-1"
	vcch2_etl_code: STRING = "VCCH-2"
	vcfg1_etl_code: STRING = "VCFG-1"
	vcfg2_etl_code: STRING = "VCFG-2"
	vcfg3_etl_code: STRING = "VCFG-3"
	vdjr_etl_code: STRING = "VDJR"
	vdjr2_etl_code: STRING = "VDJR-2"
	vdpr1_etl_code: STRING = "VDPR-1"
	vdpr2_etl_code: STRING = "VDPR-2"
	vdpr3_etl_code: STRING = "VDPR-3"
	vdpr4a_etl_code: STRING = "VDPR-4A"
	vdpr4b_etl_code: STRING = "VDPR-4B"
	vdrd2_etl_code: STRING = "VDRD-2"
	vdrd3_etl_code: STRING = "VDRD-3"
	vdrd4_etl_code: STRING = "VDRD-4"
	vdrd5_etl_code: STRING = "VDRD-5"
	vdrd6_etl_code: STRING = "VDRD-6"
	vdrd7_etl_code: STRING = "VDRD-7"
	vdrs1_etl_code: STRING = "VDRS-1"
	vdrs2_etl_code: STRING = "VDRS-2"
	vdrs3_etl_code: STRING = "VDRS-3"
	vdrs4_etl_code: STRING = "VDRS-4"
	vdus1_etl_code: STRING = "VDUS-1"
	vdus2_etl_code: STRING = "VDUS-2"
	vdus3_etl_code: STRING = "VDUS-3"
	vdus4_etl_code: STRING = "VDUS-4"
	veen_etl_code: STRING = "VEEN"
	veen2_etl_code: STRING = "VEEN-2"
	veen8_etl_code: STRING = "VEEN-8"
	veen9_etl_code: STRING = "VEEN-9"
	vevi_etl_code: STRING = "VEVI"
	vfac1_etl_code: STRING = "VFAC-1"
	vfac2_etl_code: STRING = "VFAC-2"
	vfac3_etl_code: STRING = "VFAC-3"
	vfac4_etl_code: STRING = "VFAC-4"
	vfav1_etl_code: STRING = "VFAV-1"
	vfav2_etl_code: STRING = "VFAV-2"
	vffd4_etl_code: STRING = "VFFD-4"
	vffd5_etl_code: STRING = "VFFD-5"
	vffd6_etl_code: STRING = "VFFD-6"
	vffd7_etl_code: STRING = "VFFD-7"
	vhpr1_etl_code: STRING = "VHPR-1"
	vgcc1_etl_code: STRING = "VGCC-1"
	vgcc3_etl_code: STRING = "VGCC-3"
	vgcc5_etl_code: STRING = "VGCC-5"
	vgcc6_etl_code: STRING = "VGCC-6"
	vgcc8_etl_code: STRING = "VGCC-8"
	vgcp1_etl_code: STRING = "VGCP-1"
	vgcp2_etl_code: STRING = "VGCP-2"
	vgcp3_etl_code: STRING = "VGCP-3"
	vhay_etl_code: STRING = "VHAY"
	vhpr3_etl_code: STRING = "VHPR-3"
	vhrc1_etl_code: STRING = "VHRC-1"
	vhrc2_etl_code: STRING = "VHRC-2"
	vhrc4_etl_code: STRING = "VHRC-4"
	vhrc5_etl_code: STRING = "VHRC-5"
	vjar_etl_code: STRING = "VJAR"
	vjaw_etl_code: STRING = "VJAW"
	vjrv_etl_code: STRING = "VJRV"
	vkcn1_etl_code: STRING = "VKCN-1"
	vkcn2_etl_code: STRING = "VKCN-2"
	vlel1_etl_code: STRING = "VLEL-1"
	vlel2_etl_code: STRING = "VLEL-2"
	vlel3_etl_code: STRING = "VLEL-3"
	vmfn_etl_code: STRING = "VMFN"
	vmfn2_etl_code: STRING = "VMFN-2"
	vmrc2_etl_code: STRING = "VMRC-2"
	vmss1_etl_code: STRING = "VMSS-1"
	vmss2_etl_code: STRING = "VMSS-2"
	vmss3_etl_code: STRING = "VMSS-3"
	voit1_etl_code: STRING = "VOIT-1"
	voit2_etl_code: STRING = "VOIT-2"
	vomb1_etl_code: STRING = "VOMB-1"
	vomb2_etl_code: STRING = "VOMB-2"
	vpca1_etl_code: STRING = "VPCA-1"
	vpca2_etl_code: STRING = "VPCA-2"
	vpca3_etl_code: STRING = "VPCA-3"
	vpca4_etl_code: STRING = "VPCA-4"
	vpca5_etl_code: STRING = "VPCA-5"
	vpir1_etl_code: STRING = "VPIR-1"
	vpir3_etl_code: STRING = "VPIR-3"
	vqmc1_etl_code: STRING = "VQMC-1"
	vqmc2_etl_code: STRING = "VQMC-2"
	vqmc3_etl_code: STRING = "VQMC-3"
	vqmc4_etl_code: STRING = "VQMC-4"
	vqmc5_etl_code: STRING = "VQMC-5"
	vqmc6_etl_code: STRING = "VQMC-6"
	vqui_etl_code: STRING = "VQUI"
	vred_etl_code: STRING = "VRED"
	vreg_etl_code: STRING = "VREG"
	vrfa_etl_code: STRING = "VRFA"
	vrle1_etl_code: STRING = "VRLE-1"
	vrle2_etl_code: STRING = "VRLE-2"
	vrlv1_etl_code: STRING = "VRLV-1"
	vrlv2_etl_code: STRING = "VRLV-2"
	vtat1_etl_code: STRING = "VTAT-1"
	vtat2_etl_code: STRING = "VTAT-2"
	vtbt_etl_code: STRING = "VTBT"
	vtcg3_etl_code: STRING = "VTCG-3"
	vtcg4_etl_code: STRING = "VTCG-4"
	vtct_etl_code: STRING = "VTCT"
	vtgc_etl_code: STRING = "VTGC"
	vtug1_etl_code: STRING = "VTUG-1"
	vtug2_etl_code: STRING = "VTUG-2"
	vuar1_etl_code: STRING = "VUAR-1"
	vuar2_etl_code: STRING = "VUAR-2"
	vuar4_etl_code: STRING = "VUAR-4"
	vuex1_etl_code: STRING = "VUEX-1"
	vuex2_etl_code: STRING = "VUEX-2"
	vuot1_etl_code: STRING = "VUOT-1"
	vuot3_etl_code: STRING = "VUOT-3"
	vuot4_etl_code: STRING = "VUOT-4"
	vuta2_etl_code: STRING = "VUTA-2"
	vvok1_etl_code: STRING = "VVOK-1"
	vvok2_etl_code: STRING = "VVOK-2"
	vwbe_etl_code: STRING = "VWBE"
	vweq_etl_code: STRING = "VWEQ"
	vwmq_etl_code: STRING = "VWMQ"
	vwst1_etl_code: STRING = "VWST-1"
	vwst2_etl_code: STRING = "VWST-2"
	vxrt_etl_code: STRING = "VXRT"
	gvagp_etl_code: STRING = "GVAGP"
	gvhpr4_etl_code: STRING = "GVHPR-4"
	gvhpr5_etl_code: STRING = "GVHPR-5"
	gvhso1_etl_code: STRING = "GVHSO-1"
	gvhso2_etl_code: STRING = "GVHSO-2"
	gvkbs_etl_code: STRING = "GVKBS"
	gvkbu1_etl_code: STRING = "GVKBU-1"
	gvkfe1_etl_code: STRING = "GVKFE-1"
	gvkfe2_etl_code: STRING = "GVKFE-2"
	gvkfe3_etl_code: STRING = "GVKFE-3"
	gvkfe4_etl_code: STRING = "GVKFE-4"
	gvkfe5_etl_code: STRING = "GVKFE-5"
	gvscn1_etl_code: STRING = "GVSCN-1"
	gvtcg5_etl_code: STRING = "GVTCG-5"
	gvuaa_etl_code: STRING = "GVUAA"
	gvual_etl_code: STRING = "GVUAL"
	gvuia_etl_code: STRING = "GVUIA"
	gvuil_etl_code: STRING = "GVUIL"
	gvwmc2_etl_code: STRING = "GVWMC-2"
	gvzzz_etl_code: STRING = "GVZZZ"
			-- ETL validity codes

	template_code (a_code: STRING): STRING
			-- Template error code of the form:
			--    `a_code'
			-- if `class_impl' = `current_class', or:
			--    `a_code'-2
			-- otherwise
		require
			a_code_not_void: a_code /= Void
		do
			if class_impl = current_class then
				Result := a_code
			else
				Result := a_code + "-2"
			end
		ensure
			template_code_not_void: Result /= Void
		end

	vaol1a_template_code: STRING = "vaol1a"
	vape0a_template_code: STRING = "vape0a"
	vape0b_template_code: STRING = "vape0b"
	vave0a_template_code: STRING = "vave0a"
	vbac1a_template_code: STRING = "vbac1a"
	vbac2a_template_code: STRING = "vbac2a"
	vcch1a_template_code: STRING = "vcch1a"
	vcch1b_template_code: STRING = "vcch1b"
	vcch2a_template_code: STRING = "vcch2a"
	vcfg1a_template_code: STRING = "vcfg1a"
	vcfg2a_template_code: STRING = "vcfg2a"
	vcfg3a_template_code: STRING = "vcfg3a"
	vcfg3b_template_code: STRING = "vcfg3b"
	vcfg3c_template_code: STRING = "vcfg3c"
	vcfg3d_template_code: STRING = "vcfg3d"
	vcfg3e_template_code: STRING = "vcfg3e"
	vcfg3g_template_code: STRING = "vcfg3g"
	vcfg3h_template_code: STRING = "vcfg3h"
	vcfg3j_template_code: STRING = "vcfg3j"
	vdjr0a_template_code: STRING = "vdjr0a"
	vdjr0b_template_code: STRING = "vdjr0b"
	vdjr0c_template_code: STRING = "vdjr0c"
	vdjr2a_template_code: STRING = "vdjr2a"
	vdjr2b_template_code: STRING = "vdjr2b"
	vdpr1a_template_code: STRING = "vdpr1a"
	vdpr1b_template_code: STRING = "vdpr1b"
	vdpr2a_template_code: STRING = "vdpr2a"
	vdpr3a_template_code: STRING = "vdpr3a"
	vdpr3b_template_code: STRING = "vdpr3b"
	vdpr3c_template_code: STRING = "vdpr3c"
	vdpr3d_template_code: STRING = "vdpr3d"
	vdpr3e_template_code: STRING = "vdpr3e"
	vdpr4a_template_code: STRING = "vdpr4a"
	vdpr4b_template_code: STRING = "vdpr4b"
	vdrd2a_template_code: STRING = "vdrd2a"
	vdrd2b_template_code: STRING = "vdrd2b"
	vdrd2c_template_code: STRING = "vdrd2c"
	vdrd2d_template_code: STRING = "vdrd2d"
	vdrd3a_template_code: STRING = "vdrd3a"
	vdrd3b_template_code: STRING = "vdrd3b"
	vdrd4a_template_code: STRING = "vdrd4a"
	vdrd4b_template_code: STRING = "vdrd4b"
	vdrd4c_template_code: STRING = "vdrd4c"
	vdrd5a_template_code: STRING = "vdrd5a"
	vdrd6a_template_code: STRING = "vdrd6a"
	vdrd6b_template_code: STRING = "vdrd6b"
	vdrd7a_template_code: STRING = "vdrd7a"
	vdrd7b_template_code: STRING = "vdrd7b"
	vdrd7c_template_code: STRING = "vdrd7c"
	vdrs1a_template_code: STRING = "vdrs1a"
	vdrs2a_template_code: STRING = "vdrs2a"
	vdrs2b_template_code: STRING = "vdrs2b"
	vdrs3a_template_code: STRING = "vdrs3a"
	vdrs4a_template_code: STRING = "vdrs4a"
	vdrs4b_template_code: STRING = "vdrs4b"
	vdus1a_template_code: STRING = "vdus1a"
	vdus2a_template_code: STRING = "vdus2a"
	vdus2b_template_code: STRING = "vdus2b"
	vdus3a_template_code: STRING = "vdus3a"
	vdus4a_template_code: STRING = "vdus4a"
	veen0a_template_code: STRING = "veen0a"
	veen0b_template_code: STRING = "veen0b"
	veen2a_template_code: STRING = "veen2a"
	veen2b_template_code: STRING = "veen2b"
	veen2c_template_code: STRING = "veen2c"
	veen2d_template_code: STRING = "veen2d"
	veen2e_template_code: STRING = "veen2e"
	veen2f_template_code: STRING = "veen2f"
	veen2g_template_code: STRING = "veen2g"
	veen8a_template_code: STRING = "veen8a"
	veen8b_template_code: STRING = "veen8b"
	veen9a_template_code: STRING = "veen9a"
	veen9b_template_code: STRING = "veen9b"
	vevi0a_template_code: STRING = "vevi0a"
	vevi0b_template_code: STRING = "vevi0b"
	vevi0c_template_code: STRING = "vevi0c"
	vevi0d_template_code: STRING = "vevi0d"
	vevi0e_template_code: STRING = "vevi0e"
	vfac1a_template_code: STRING = "vfac1a"
	vfac1b_template_code: STRING = "vfac1b"
	vfac2a_template_code: STRING = "vfac2a"
	vfac3a_template_code: STRING = "vfac3a"
	vfac4a_template_code: STRING = "vfac4a"
	vfav1a_template_code: STRING = "vfav1a"
	vfav1b_template_code: STRING = "vfav1b"
	vfav1c_template_code: STRING = "vfav1c"
	vfav1d_template_code: STRING = "vfav1d"
	vfav1e_template_code: STRING = "vfav1e"
	vfav1f_template_code: STRING = "vfav1f"
	vfav1g_template_code: STRING = "vfav1g"
	vfav1h_template_code: STRING = "vfav1h"
	vfav2a_template_code: STRING = "vfav2a"
	vfav2b_template_code: STRING = "vfav2b"
	vfav2c_template_code: STRING = "vfav2c"
	vfav2d_template_code: STRING = "vfav2d"
	vffd4a_template_code: STRING = "vffd4a"
	vffd5a_template_code: STRING = "vffd5a"
	vffd6a_template_code: STRING = "vffd6a"
	vffd7a_template_code: STRING = "vffd7a"
	vffd7b_template_code: STRING = "vffd7b"
	vgcc1a_template_code: STRING = "vgcc1a"
	vgcc1b_template_code: STRING = "vgcc1b"
	vgcc3a_template_code: STRING = "vgcc3a"
	vgcc5a_template_code: STRING = "vgcc5a"
	vgcc5b_template_code: STRING = "vgcc5b"
	vgcc6a_template_code: STRING = "vgcc6a"
	vgcc6b_template_code: STRING = "vgcc6b"
	vgcc6c_template_code: STRING = "vgcc6c"
	vgcc6d_template_code: STRING = "vgcc6d"
	vgcc6e_template_code: STRING = "vgcc6e"
	vgcc8a_template_code: STRING = "vgcc8a"
	vgcc8b_template_code: STRING = "vgcc8b"
	vgcp1a_template_code: STRING = "vgcp1a"
	vgcp2a_template_code: STRING = "vgcp2a"
	vgcp2b_template_code: STRING = "vgcp2b"
	vgcp3a_template_code: STRING = "vgcp3a"
	vgcp3b_template_code: STRING = "vgcp3b"
	vgcp3c_template_code: STRING = "vgcp3c"
	vhay0a_template_code: STRING = "vhay0a"
	vhpr1a_template_code: STRING = "vhpr1a"
	vhpr1b_template_code: STRING = "vhpr1b"
	vhpr3a_template_code: STRING = "vhpr3a"
	vhpr3b_template_code: STRING = "vhpr3b"
	vhpr3c_template_code: STRING = "vhpr3c"
	vhrc1a_template_code: STRING = "vhrc1a"
	vhrc2a_template_code: STRING = "vhrc2a"
	vhrc4a_template_code: STRING = "vhrc4a"
	vhrc4b_template_code: STRING = "vhrc4b"
	vhrc4c_template_code: STRING = "vhrc4c"
	vhrc4d_template_code: STRING = "vhrc4d"
	vhrc5a_template_code: STRING = "vhrc5a"
	vjar0a_template_code: STRING = "vjar0a"
	vjaw0a_template_code: STRING = "vjaw0a"
	vjaw0b_template_code: STRING = "vjaw0b"
	vjaw0c_template_code: STRING = "vjaw0c"
	vjrv0a_template_code: STRING = "vjrv0a"
	vkcn1a_template_code: STRING = "vkcn1a"
	vkcn1c_template_code: STRING = "vkcn1c"
	vkcn2a_template_code: STRING = "vkcn2a"
	vkcn2c_template_code: STRING = "vkcn2c"
	vlel1a_template_code: STRING = "vlel1a"
	vlel2a_template_code: STRING = "vlel2a"
	vlel3a_template_code: STRING = "vlel3a"
	vmfn0a_template_code: STRING = "vmfn0a"
	vmfn0b_template_code: STRING = "vmfn0b"
	vmfn0c_template_code: STRING = "vmfn0c"
	vmfn2a_template_code: STRING = "vmfn2a"
	vmfn2b_template_code: STRING = "vmfn2b"
	vmrc2a_template_code: STRING = "vmrc2a"
	vmrc2b_template_code: STRING = "vmrc2b"
	vmss1a_template_code: STRING = "vmss1a"
	vmss2a_template_code: STRING = "vmss2a"
	vmss3a_template_code: STRING = "vmss3a"
	voit1a_template_code: STRING = "voit1a"
	voit2a_template_code: STRING = "voit2a"
	voit2b_template_code: STRING = "voit2b"
	voit2c_template_code: STRING = "voit2c"
	voit2d_template_code: STRING = "voit2d"
	voit2e_template_code: STRING = "voit2e"
	vomb1a_template_code: STRING = "vomb1a"
	vomb2a_template_code: STRING = "vomb2a"
	vomb2b_template_code: STRING = "vomb2b"
	vpca1a_template_code: STRING = "vpca1a"
	vpca1b_template_code: STRING = "vpca1b"
	vpca2a_template_code: STRING = "vpca2a"
	vpca3a_template_code: STRING = "vpca3a"
	vpca3b_template_code: STRING = "vpca3b"
	vpca4a_template_code: STRING = "vpca4a"
	vpca4b_template_code: STRING = "vpca4b"
	vpca5a_template_code: STRING = "vpca5a"
	vpca5b_template_code: STRING = "vpca5b"
	vpir1a_template_code: STRING = "vpir1a"
	vpir1b_template_code: STRING = "vpir1b"
	vpir1c_template_code: STRING = "vpir1c"
	vpir1d_template_code: STRING = "vpir1d"
	vpir1e_template_code: STRING = "vpir1e"
	vpir1f_template_code: STRING = "vpir1f"
	vpir1g_template_code: STRING = "vpir1g"
	vpir1h_template_code: STRING = "vpir1h"
	vpir3a_template_code: STRING = "vpir3a"
	vpir3b_template_code: STRING = "vpir3b"
	vqmc1a_template_code: STRING = "vqmc1a"
	vqmc2a_template_code: STRING = "vqmc2a"
	vqmc3a_template_code: STRING = "vqmc3a"
	vqmc3b_template_code: STRING = "vqmc3b"
	vqmc4a_template_code: STRING = "vqmc4a"
	vqmc5a_template_code: STRING = "vqmc5a"
	vqmc6a_template_code: STRING = "vqmc6a"
	vqui0a_template_code: STRING = "vqui0a"
	vred0a_template_code: STRING = "vred0a"
	vred0b_template_code: STRING = "vred0b"
	vred0c_template_code: STRING = "vred0c"
	vred0d_template_code: STRING = "vred0d"
	vreg0a_template_code: STRING = "vreg0a"
	vreg0b_template_code: STRING = "vreg0b"
	vrfa0a_template_code: STRING = "vrfa0a"
	vrfa0b_template_code: STRING = "vrfa0b"
	vrle1a_template_code: STRING = "vrle1a"
	vrle2a_template_code: STRING = "vrle2a"
	vrlv1a_template_code: STRING = "vrlv1a"
	vrlv1b_template_code: STRING = "vrlv1b"
	vrlv2a_template_code: STRING = "vrlv2a"
	vrlv2b_template_code: STRING = "vrlv2b"
	vtat1a_template_code: STRING = "vtat1a"
	vtat1b_template_code: STRING = "vtat1b"
	vtat1c_template_code: STRING = "vtat1c"
	vtat2a_template_code: STRING = "vtat2a"
	vtat2b_template_code: STRING = "vtat2b"
	vtbt0a_template_code: STRING = "vtbt0a"
	vtbt0b_template_code: STRING = "vtbt0b"
	vtbt0c_template_code: STRING = "vtbt0c"
	vtbt0d_template_code: STRING = "vtbt0d"
	vtcg3a_template_code: STRING = "vtcg3a"
	vtcg4a_template_code: STRING = "vtcg4a"
	vtcg4b_template_code: STRING = "vtcg4b"
	vtct0a_template_code: STRING = "vtct0a"
	vtct0b_template_code: STRING = "vtct0b"
	vtgc0a_template_code: STRING = "vtgc0a"
	vtgc0b_template_code: STRING = "vtgc0b"
	vtug1a_template_code: STRING = "vtug1a"
	vtug2a_template_code: STRING = "vtug2a"
	vuar1a_template_code: STRING = "vuar1a"
	vuar1b_template_code: STRING = "vuar1b"
	vuar1c_template_code: STRING = "vuar1c"
	vuar2a_template_code: STRING = "vuar2a"
	vuar2b_template_code: STRING = "vuar2b"
	vuar4a_template_code: STRING = "vuar4a"
	vuex1a_template_code: STRING = "vuex1a"
	vuex2a_template_code: STRING = "vuex2a"
	vuex2b_template_code: STRING = "vuex2b"
	vuot1a_template_code: STRING = "vuot1a"
	vuot1b_template_code: STRING = "vuot1b"
	vuot1c_template_code: STRING = "vuot1c"
	vuot1d_template_code: STRING = "vuot1d"
	vuot1e_template_code: STRING = "vuot1e"
	vuot1f_template_code: STRING = "vuot1f"
	vuot3a_template_code: STRING = "vuot3a"
	vuot3b_template_code: STRING = "vuot3b"
	vuot4a_template_code: STRING = "vuot4a"
	vuot4b_template_code: STRING = "vuot4b"
	vuta2a_template_code: STRING = "vuta2a"
	vuta2b_template_code: STRING = "vuta2b"
	vvok1a_template_code: STRING = "vvok1a"
	vvok2a_template_code: STRING = "vvok2a"
	vwbe0a_template_code: STRING = "vwbe0a"
	vweq0a_template_code: STRING = "vweq0a"
	vweq0b_template_code: STRING = "vweq0b"
	vwmq0a_template_code: STRING = "vwmq0a"
	vwmq0b_template_code: STRING = "vwmq0b"
	vwmq0c_template_code: STRING = "vwmq0c"
	vwmq0d_template_code: STRING = "vwmq0d"
	vwst1a_template_code: STRING = "vwst1a"
	vwst1b_template_code: STRING = "vwst1b"
	vwst2a_template_code: STRING = "vwst2a"
	vxrt0a_template_code: STRING = "vxrt0a"
	gvagp0a_template_code: STRING = "gvagp0a"
	gvhpr4a_template_code: STRING = "gvhpr4a"
	gvhpr5a_template_code: STRING = "gvhpr5a"
	gvhso1a_template_code: STRING = "gvhso1a"
	gvhso2a_template_code: STRING = "gvhso2a"
	gvkbs0a_template_code: STRING = "gvkbs0a"
	gvkbu1a_template_code: STRING = "gvkbu1a"
	gvkfe1a_template_code: STRING = "gvkfe1a"
	gvkfe2a_template_code: STRING = "gvkfe2a"
	gvkfe3a_template_code: STRING = "gvkfe3a"
	gvkfe4a_template_code: STRING = "gvkfe4a"
	gvkfe5a_template_code: STRING = "gvkfe5a"
	gvscn1a_template_code: STRING = "gvscn1a"
	gvscn1b_template_code: STRING = "gvscn1b"
	gvtcg5a_template_code: STRING = "gvtcg5a"
	gvtcg5b_template_code: STRING = "gvtcg5b"
	gvuaa0a_template_code: STRING = "gvuaa0a"
	gvuaa0b_template_code: STRING = "gvuaa0b"
	gvual0a_template_code: STRING = "gvual0a"
	gvual0b_template_code: STRING = "gvual0b"
	gvuia0a_template_code: STRING = "gvuia0a"
	gvuia0b_template_code: STRING = "gvuia0b"
	gvuil0a_template_code: STRING = "gvuil0a"
	gvuil0b_template_code: STRING = "gvuil0b"
	gvwmc2a_template_code: STRING = "gvwmc2a"
	gvzzz0a_template_code: STRING = "gvzzz0a"
			-- Template error codes

invariant

	current_class_not_void: current_class /= Void
	class_impl_not_void: class_impl /= Void
	class_impl_preparsed: class_impl.is_preparsed

end
