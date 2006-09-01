indexing

	description:

		"Error handlers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_ERROR_HANDLER

inherit

	UT_ERROR_HANDLER
		redefine
			is_verbose,
			report_error_message
		end

create

	make_standard, make_null

feature -- Status report

	is_ise: BOOLEAN

	is_se: BOOLEAN

	is_ve: BOOLEAN

	is_ge: BOOLEAN

	is_etl: BOOLEAN

	is_pedantic: BOOLEAN

	is_verbose: BOOLEAN
			-- Should status be reported for each class processed?

	benchmark_shown: BOOLEAN
			-- Should benchmark be shown for each Degree?

	has_error: BOOLEAN
			-- Has an error been reported?

	has_eiffel_error: BOOLEAN
			-- Has an Eiffel error been reported?

	has_internal_error: BOOLEAN
			-- Has an internal error been reported?

feature -- Status setting

	set_ise is
		do
			is_ise := True
		end

	set_compilers is
		do
			is_ise := True
			is_se := True
			is_ve := True
			is_ge := True
		end

	set_verbose (b: BOOLEAN) is
			-- Set `is_verbose' to `b'.
		do
			is_verbose := b
		ensure
			verbose_set: is_verbose = b
		end

	set_benchmark_shown (b: BOOLEAN) is
			-- Set `benchmark_shown' to `b'.
		do
			benchmark_shown := b
		ensure
			benchmark_shown_set: benchmark_shown = b
		end

feature -- Compilation report

	report_preparsing_status (a_cluster: ET_CLUSTER) is
			-- Report that `a_cluster' is currently being preparsed.
		require
			a_cluster_not_void: a_cluster /= Void
		do
			if is_verbose then
				if info_file /= Void then
					info_file.put_string ("Degree 6 cluster ")
					info_file.put_line (a_cluster.full_name ('.'))
				end
			end
		end

	report_compilation_status (a_processor: ET_AST_PROCESSOR; a_class: ET_CLASS) is
			-- Report that `a_processor' is currently processing `a_class'.
		require
			a_processor_not_void: a_processor /= Void
			a_class_not_void: a_class /= Void
		local
			a_universe: ET_UNIVERSE
		do
			if is_verbose then
				if info_file /= Void then
					a_universe := a_processor.universe
					if a_processor = a_universe.eiffel_parser then
						info_file.put_string ("Degree 5 class ")
						info_file.put_line (a_class.name.name)
					elseif a_processor = a_universe.ancestor_builder then
						info_file.put_string ("Degree 4.3 class ")
						info_file.put_line (a_class.name.name)
					elseif a_processor = a_universe.feature_flattener then
						info_file.put_string ("Degree 4.2 class ")
						info_file.put_line (a_class.name.name)
					elseif a_processor = a_universe.interface_checker then
						info_file.put_string ("Degree 4.1 class ")
						info_file.put_line (a_class.name.name)
					elseif a_processor = a_universe.implementation_checker then
						info_file.put_string ("Degree 3 class ")
						info_file.put_line (a_class.name.name)
					elseif a_processor = a_universe.flat_implementation_checker then
						info_file.put_string ("Degree 3 (flat) class ")
						info_file.put_line (a_class.name.name)
					end
				end
			end
		end

feature -- Cluster errors

	report_cluster_error (an_error: ET_CLUSTER_ERROR) is
			-- Report cluster error.
		require
			an_error_not_void: an_error /= Void
		do
			has_eiffel_error := True
			report_info (an_error)
			if info_file = std.output then
				info_file.put_line ("----")
			end
		end

	report_gcaaa_error (a_cluster: ET_CLUSTER; a_dirname: STRING) is
			-- Report GCAAA error: cannot read
			-- `a_cluster''s directory `a_dirname'.
		require
			a_cluster_not_void: a_cluster /= Void
			a_dirname_not_void: a_dirname /= Void
		local
			an_error: ET_CLUSTER_ERROR
		do
			if reportable_gcaaa_error (a_cluster) then
				create an_error.make_gcaaa (a_cluster, a_dirname)
				report_cluster_error (an_error)
			end
		end

	report_gcaab_error (a_cluster: ET_CLUSTER; a_filename: STRING) is
			-- Report GCAAB error: cannot read Eiffel file
			-- `a_filename' in `a_cluster'.
		require
			a_cluster_not_void: a_cluster /= Void
			a_filename_not_void: a_filename /= Void
		local
			an_error: ET_CLUSTER_ERROR
		do
			if reportable_gcaab_error (a_cluster) then
				create an_error.make_gcaab (a_cluster, a_filename)
				report_cluster_error (an_error)
			end
		end

	report_gcdep_error (a_cluster: ET_CLUSTER; a_class, a_dependant: ET_CLASS; a_constraint: ET_CLUSTER_DEPENDENCE_CONSTRAINT) is
			-- Report GCDEP error: class `a_class' (recursively) from cluster
			-- `a_cluster' has a dependant class `a_dependant' which is not
			-- contained in the dependence constraint `a_constraint'.
		require
			a_cluster_not_void: a_cluster /= Void
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_dependant_not_void: a_dependant /= Void
			a_dependant_preparsed: a_dependant.is_preparsed
			a_constraint_not_void: a_constraint /= Void
		local
			an_error: ET_CLUSTER_ERROR
		do
			if reportable_gcdep_error (a_cluster) then
				create an_error.make_gcdep (a_cluster, a_class, a_dependant, a_constraint)
				report_cluster_error (an_error)
			end
		end

	report_gcpro_error (a_cluster: ET_CLUSTER; a_class, a_provider: ET_CLASS; a_constraint: ET_CLUSTER_DEPENDENCE_CONSTRAINT) is
			-- Report GCPRO error: class `a_class' (recursively) from cluster
			-- `a_cluster' has a provider class `a_provider' which is not
			-- contained in the dependence constraint `a_constraint'.
		require
			a_cluster_not_void: a_cluster /= Void
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_provider_not_void: a_provider /= Void
			a_provider_preparsed: a_provider.is_preparsed
			a_constraint_not_void: a_constraint /= Void
		local
			an_error: ET_CLUSTER_ERROR
		do
			if reportable_gcpro_error (a_cluster) then
				create an_error.make_gcpro (a_cluster, a_class, a_provider, a_constraint)
				report_cluster_error (an_error)
			end
		end

feature -- Cluster error status

	reportable_gcaaa_error (a_cluster: ET_CLUSTER): BOOLEAN is
			-- Can a GCAAA error be reported when it
			-- appears in `a_cluster'?
		require
			a_cluster_not_void: a_cluster /= Void
		do
			Result := True
		end

	reportable_gcaab_error (a_cluster: ET_CLUSTER): BOOLEAN is
			-- Can a GCAAB error be reported when it
			-- appears in `a_cluster'?
		require
			a_cluster_not_void: a_cluster /= Void
		do
			Result := True
		end

	reportable_gcdep_error (a_cluster: ET_CLUSTER): BOOLEAN is
			-- Can a GCDEP error be reported when it
			-- appears in `a_cluster'?
		require
			a_cluster_not_void: a_cluster /= Void
		do
			Result := True
		end

	reportable_gcpro_error (a_cluster: ET_CLUSTER): BOOLEAN is
			-- Can a GCPRO error be reported when it
			-- appears in `a_cluster'?
		require
			a_cluster_not_void: a_cluster /= Void
		do
			Result := True
		end

feature -- .NET assembly errors

	report_assembly_error (an_error: ET_DOTNET_ASSEMBLY_ERROR) is
			-- Report .NET assembly error.
		require
			an_error_not_void: an_error /= Void
		do
			has_eiffel_error := True
			report_info (an_error)
			if info_file = std.output then
				info_file.put_line ("----")
			end
		end

	report_gaaaa_error (an_assembly: ET_DOTNET_ASSEMBLY) is
			-- Report GAAAA error: .NET assemblies not supported.
		require
			an_assembly_not_void: an_assembly /= Void
		local
			an_error: ET_DOTNET_ASSEMBLY_ERROR
		do
			if reportable_gaaaa_error (an_assembly) then
				create an_error.make_gaaaa (an_assembly)
				report_assembly_error (an_error)
			end
		end

feature -- .NET assembly error status

	reportable_gaaaa_error (an_assembly: ET_DOTNET_ASSEMBLY): BOOLEAN is
			-- Can a GAAAA error be reported when it
			-- appears in `an_assembly'?
		require
			an_assembly_not_void: an_assembly /= Void
		do
			Result := True
		end

feature -- Syntax errors

	report_syntax_error (a_filename: STRING; p: ET_POSITION) is
			-- Report a syntax error.
		require
			a_filename_not_void: a_filename /= Void
			p_not_void: p /= Void
		local
			an_error: ET_SYNTAX_ERROR
		do
			has_eiffel_error := True
			create an_error.make (a_filename, p)
			report_info (an_error)
		end

	report_SCAC_error (a_filename: STRING; p: ET_POSITION) is
			-- Missing ASCII code in special character
			-- specification %/code/ in character constant.
			-- (SCAC: Syntax Character Ascii Code)
		require
			a_filename_not_void: a_filename /= Void
			p_not_void: p /= Void
		do
			report_syntax_error (a_filename, p)
		end

	report_SCAO_error (a_filename: STRING; p: ET_POSITION) is
			-- ASCII code too big in special character
			-- specification %/code/ in character constant.
			-- (SCAO: Syntax Character Ascii-code Overflow)
		require
			a_filename_not_void: a_filename /= Void
			p_not_void: p /= Void
		do
			report_syntax_error (a_filename, p)
		end

	report_SCAS_error (a_filename: STRING; p: ET_POSITION) is
			-- Missing character / at end of special character
			-- specification %/code/ in character constant.
			-- (SCAS: Syntax Character Ascii-code Slash)
		require
			a_filename_not_void: a_filename /= Void
			p_not_void: p /= Void
		do
			report_syntax_error (a_filename, p)
		end

	report_SCCU_error (a_filename: STRING; p: ET_POSITION) is
			-- Special character specification %l where l is a letter
			-- code should be in upper-case in character constant.
			-- (SSCU: Syntax Character special-Character Upper-case)
		require
			a_filename_not_void: a_filename /= Void
			p_not_void: p /= Void
		do
			report_syntax_error (a_filename, p)
		end

	report_SCEQ_error (a_filename: STRING; p: ET_POSITION) is
			-- Missing quote at end of character constant.
			-- (SCEQ: Syntax Character End Quote)
		require
			a_filename_not_void: a_filename /= Void
			p_not_void: p /= Void
		do
			report_syntax_error (a_filename, p)
		end

	report_SCQQ_error (a_filename: STRING; p: ET_POSITION) is
			-- Missing character between quotes in character constant.
			-- (SCQQ: Syntax Character Quote Quote)
		require
			a_filename_not_void: a_filename /= Void
			p_not_void: p /= Void
		do
			report_syntax_error (a_filename, p)
		end

	report_SCSC_error (a_filename: STRING; p: ET_POSITION) is
			-- Invalid special character %l in character constant.
			-- (SCSC: Syntax Character Special Character)
		require
			a_filename_not_void: a_filename /= Void
			p_not_void: p /= Void
		do
			report_syntax_error (a_filename, p)
		end

	report_SCTQ_error (a_filename: STRING; p: ET_POSITION) is
			-- Character quote should be declared as '%''
			-- and not as ''' in character constant.
			-- (SCTQ: Syntax Character Triple-Quote)
		require
			a_filename_not_void: a_filename /= Void
			p_not_void: p /= Void
		do
			report_syntax_error (a_filename, p)
		end

	report_SIFU_error (a_filename: STRING; p: ET_POSITION) is
			-- An underscore may not be the first character
			-- of an integer constant. (ETL2 p.420)
			-- (SIFU: Syntax Integer First Underscore)
		require
			a_filename_not_void: a_filename /= Void
			p_not_void: p /= Void
		do
			report_syntax_error (a_filename, p)
		end

	report_SILU_error (a_filename: STRING; p: ET_POSITION) is
			-- An underscore may not be the last character
			-- of an integer constant. (ECMA p.157)
			-- (SILU: Syntax Integer Last Underscore)
		require
			a_filename_not_void: a_filename /= Void
			p_not_void: p /= Void
		do
			report_syntax_error (a_filename, p)
		end

	report_SSAC_error (a_filename: STRING; p: ET_POSITION) is
			-- Missing ASCII code in special character
			-- specification %/code/ in manifest string.
			-- (SSAC: Syntax String Ascii Code)
		require
			a_filename_not_void: a_filename /= Void
			p_not_void: p /= Void
		do
			report_syntax_error (a_filename, p)
		end

	report_SSAO_error (a_filename: STRING; p: ET_POSITION) is
			-- ASCII code too big in special character
			-- specification %/code/ in manifest string.
			-- (SSAO: Syntax String Ascii-code Overflow)
		require
			a_filename_not_void: a_filename /= Void
			p_not_void: p /= Void
		do
			report_syntax_error (a_filename, p)
		end

	report_SSAS_error (a_filename: STRING; p: ET_POSITION) is
			-- Missing character / at end of special character
			-- specification %/code/ in manifest string.
			-- (SSAS: Syntax String Ascii-code Slash)
		require
			a_filename_not_void: a_filename /= Void
			p_not_void: p /= Void
		do
			report_syntax_error (a_filename, p)
		end

	report_SSCU_error (a_filename: STRING; p: ET_POSITION) is
			-- Special character specification %l where l is a letter
			-- code should be in upper-case in manifest strings.
			-- (SSCU: Syntax String special-Character Upper-case)
		require
			a_filename_not_void: a_filename /= Void
			p_not_void: p /= Void
		do
			report_syntax_error (a_filename, p)
		end

	report_SSEL_error (a_filename: STRING; p: ET_POSITION) is
			-- Empty line in middle of multi-line manifest string.
			-- (SSEL: Syntax String Empty Line)
		require
			a_filename_not_void: a_filename /= Void
			p_not_void: p /= Void
		local
			--an_error: ET_SSEL_ERROR
		do
			report_syntax_error (a_filename, p)
		end

	report_SSEQ_error (a_filename: STRING; p: ET_POSITION) is
			-- Missing double quote at end of manifest string.
			-- (SSEQ: Syntax String End double-Quote)
		require
			a_filename_not_void: a_filename /= Void
			p_not_void: p /= Void
		do
			report_syntax_error (a_filename, p)
		end

	report_SSNL_error (a_filename: STRING; p: ET_POSITION) is
			-- Invalid new-line in middle of manifest string.
			-- (SSNL: Syntax String New-Line)
		require
			a_filename_not_void: a_filename /= Void
			p_not_void: p /= Void
		do
			report_syntax_error (a_filename, p)
		end

	report_SSNP_error (a_filename: STRING; p: ET_POSITION) is
			-- Missing character % at beginning of
			-- line in multi-line manifest string.
			-- (SSNP: Syntax String New-line Percent)
		require
			a_filename_not_void: a_filename /= Void
			p_not_void: p /= Void
		do
			report_syntax_error (a_filename, p)
		end

	report_SSSC_error (a_filename: STRING; p: ET_POSITION) is
			-- Invalid special character %l in manifest strings.
			-- (SSSC: Syntax String Special Character)
		require
			a_filename_not_void: a_filename /= Void
			p_not_void: p /= Void
		do
			report_syntax_error (a_filename, p)
		end

feature -- System errors

	report_system_error (an_error: ET_SYSTEM_ERROR) is
			-- Report system error.
		require
			an_error_not_void: an_error /= Void
		do
			has_eiffel_error := True
			report_info (an_error)
			if info_file = std.output then
				info_file.put_line ("----")
			end
		end

	report_catcall_error (an_error: STRING) is
			-- Report CAT-call error.
		require
			an_error_not_void: an_error /= Void
		do
			has_eiffel_error := True
			report_info_message (an_error)
		end

	report_vsrc1a_error (a_class: ET_CLASS) is
			-- Report VSRC-1 error: root class `a_class' should not be generic.
			--
			-- ETL2: p.36
		require
			a_class_not_void: a_class /= Void
		local
			an_error: ET_SYSTEM_ERROR
		do
			if reportable_vsrc1_error then
				create an_error.make_vsrc1a (a_class)
				report_system_error (an_error)
			end
		end

	report_gvknl1a_error (a_class: ET_CLASS) is
			-- Report GVKNL-1 error: unknown kernel class `a_class'.
			--
			-- Not in ETL
			-- GVKNL: Gobo Validity KerNeL
		require
			a_class_not_void: a_class /= Void
		local
			an_error: ET_SYSTEM_ERROR
		do
			if reportable_gvknl1_error then
				create an_error.make_gvknl1a (a_class)
				report_system_error (an_error)
			end
		end

	report_gvsrc3a_error is
			-- Report GVSRC-3 error: missing root class.
			--
			-- Not in ETL
			-- GVSRC-3: See ETL2 VSRC p.36
		local
			an_error: ET_SYSTEM_ERROR
		do
			if reportable_gvsrc3_error then
				create an_error.make_gvsrc3a
				report_system_error (an_error)
			end
		end

	report_gvsrc4a_error (a_class: ET_CLASS) is
			-- Report GVSRC-4 error: unknown root class `a_class'.
			--
			-- Not in ETL
			-- GVSRC-4: See ETL2 VSRC p.36
		require
			a_class_not_void: a_class /= Void
		local
			an_error: ET_SYSTEM_ERROR
		do
			if reportable_gvsrc4_error then
				create an_error.make_gvsrc4a (a_class)
				report_system_error (an_error)
			end
		end

	report_gvsrc5a_error (a_class: ET_CLASS; a_feature_name: ET_FEATURE_NAME) is
			-- Report GVSRC-5 error: root creation procedure `a_feature_name'
			-- is not a feature of root class `a_class'.
			--
			-- Not in ETL
			-- GVSRC-5: See ETL2 VSRC p.36
		require
			a_class_not_void: a_class /= Void
			a_feature_name_not_void: a_feature_name /= Void
		local
			an_error: ET_SYSTEM_ERROR
		do
			if reportable_gvsrc5_error then
				create an_error.make_gvsrc5a (a_class, a_feature_name)
				report_system_error (an_error)
			end
		end

	report_gvsrc6a_error (a_class: ET_CLASS; a_feature_name: ET_FEATURE_NAME) is
			-- Report GVSRC-6 error: root creation feature `a_feature_name'
			-- is not declared as publicly available creation procedure
			-- in root class `a_class'.
			--
			-- Not in ETL
			-- GVSRC-6: See ETL2 VSRC p.36
		require
			a_class_not_void: a_class /= Void
			a_feature_name_not_void: a_feature_name /= Void
		local
			an_error: ET_SYSTEM_ERROR
		do
			if reportable_gvsrc6_error then
				create an_error.make_gvsrc6a (a_class, a_feature_name)
				report_system_error (an_error)
			end
		end

feature -- System error status

	reportable_vsrc1_error: BOOLEAN is
			-- Can a VSRC-1 error be reported?
		do
			Result := True
		end

	reportable_gvknl1_error: BOOLEAN is
			-- Can a GVKNL-1 error be reported?
		do
			Result := True
		end

	reportable_gvsrc3_error: BOOLEAN is
			-- Can a GVSRC-3 error be reported?
		do
			Result := True
		end

	reportable_gvsrc4_error: BOOLEAN is
			-- Can a GVSRC-4 error be reported?
		do
			Result := True
		end

	reportable_gvsrc5_error: BOOLEAN is
			-- Can a GVSRC-5 error be reported?
		do
			Result := True
		end

	reportable_gvsrc6_error: BOOLEAN is
			-- Can a GVSRC-6 error be reported?
		do
			Result := True
		end

feature -- Validity errors

	report_validity_error (an_error: ET_VALIDITY_ERROR) is
			-- Report validity error.
		require
			an_error_not_void: an_error /= Void
		do
			has_eiffel_error := True
			report_info (an_error)
			if info_file = std.output then
				info_file.put_line ("----")
			end
		end

	report_vaol1a_error (a_class: ET_CLASS; an_expression: ET_OLD_EXPRESSION) is
			-- Report VAOL-1 error: `an_expression', found in `a_class',
			-- does not appear in a postcondition.
			--
			-- ETL2: p.124
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_expression_not_void: an_expression /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vaol1_error (a_class) then
				create an_error.make_vaol1a (a_class, an_expression)
				report_validity_error (an_error)
			end
		end

	report_vape0a_error (a_class: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE;
		a_pre_feature: ET_FEATURE; a_client: ET_CLASS) is
			-- Report VAPE error: `a_feature' named `a_name', appearing in an unqualified
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vape_error (a_class) then
				create an_error.make_vape0a (a_class, a_name, a_feature, a_pre_feature, a_client)
				report_validity_error (an_error)
			end
		end

	report_vape0b_error (a_class, a_class_impl: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE;
		a_pre_feature: ET_FEATURE; a_client: ET_CLASS) is
			-- Report VAPE error: `a_feature' named `a_name', appearing in an unqualified
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vape_error (a_class) then
				create an_error.make_vape0b (a_class, a_class_impl, a_name, a_feature, a_pre_feature, a_client)
				report_validity_error (an_error)
			end
		end

	report_vape0c_error (a_class: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE;
		a_target_class: ET_CLASS; a_pre_feature: ET_FEATURE; a_client: ET_CLASS) is
			-- Report VAPE error: `a_feature' named `a_name', appearing in a qualified
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vape_error (a_class) then
				create an_error.make_vape0c (a_class, a_name, a_feature, a_target_class, a_pre_feature, a_client)
				report_validity_error (an_error)
			end
		end

	report_vape0d_error (a_class, a_class_impl: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE;
		a_target_class: ET_CLASS; a_pre_feature: ET_FEATURE; a_client: ET_CLASS) is
			-- Report VAPE error: `a_feature' named `a_name', appearing in a qualified
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vape_error (a_class) then
				create an_error.make_vape0d (a_class, a_class_impl, a_name, a_feature, a_target_class, a_pre_feature, a_client)
				report_validity_error (an_error)
			end
		end

	report_vape0e_error (a_class: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE;
		a_pre_feature: ET_FEATURE; a_client: ET_CLASS_NAME) is
			-- Report VAPE error: `a_feature' named `a_name', appearing in an unqualified
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vape_error (a_class) then
				create an_error.make_vape0e (a_class, a_name, a_feature, a_pre_feature, a_client)
				report_validity_error (an_error)
			end
		end

	report_vape0f_error (a_class, a_class_impl: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE;
		a_pre_feature: ET_FEATURE; a_client: ET_CLASS_NAME) is
			-- Report VAPE error: `a_feature' named `a_name', appearing in an unqualified
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vape_error (a_class) then
				create an_error.make_vape0f (a_class, a_class_impl, a_name, a_feature, a_pre_feature, a_client)
				report_validity_error (an_error)
			end
		end

	report_vape0g_error (a_class: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE;
		a_target_class: ET_CLASS; a_pre_feature: ET_FEATURE; a_client: ET_CLASS_NAME) is
			-- Report VAPE error: `a_feature' named `a_name', appearing in a qualified
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vape_error (a_class) then
				create an_error.make_vape0g (a_class, a_name, a_feature, a_target_class, a_pre_feature, a_client)
				report_validity_error (an_error)
			end
		end

	report_vape0h_error (a_class, a_class_impl: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE;
		a_target_class: ET_CLASS; a_pre_feature: ET_FEATURE; a_client: ET_CLASS_NAME) is
			-- Report VAPE error: `a_feature' named `a_name', appearing in a qualified
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vape_error (a_class) then
				create an_error.make_vape0h (a_class, a_class_impl, a_name, a_feature, a_target_class, a_pre_feature, a_client)
				report_validity_error (an_error)
			end
		end

	report_vave0a_error (a_class: ET_CLASS; an_expression: ET_EXPRESSION; a_type: ET_NAMED_TYPE) is
			-- Report VAVE error: the expression `an_expression' of a
			-- loop variant in `a_class' is of type `a_type' which is
			-- not "INTEGER".
			--
			-- ETL2: p.130
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_expression_not_void: an_expression /= Void
			a_type_not_void: a_type /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vave_error (a_class) then
				create an_error.make_vave0a (a_class, an_expression, a_type)
				report_validity_error (an_error)
			end
		end

	report_vave0b_error (a_class, a_class_impl: ET_CLASS; an_expression: ET_EXPRESSION; a_type: ET_NAMED_TYPE) is
			-- Report VAVE error: the expression `an_expression' of a
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vave_error (a_class) then
				create an_error.make_vave0b (a_class, a_class_impl, an_expression, a_type)
				report_validity_error (an_error)
			end
		end

	report_vcch1a_error (a_class: ET_CLASS; f: ET_FEATURE) is
			-- Report VCCH-1 error: `a_class' has deferred features
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vcch1_error (a_class) then
				create an_error.make_vcch1a (a_class, f)
				report_validity_error (an_error)
			end
		end

	report_vcch1b_error (a_class: ET_CLASS; f: ET_INHERITED_FEATURE) is
			-- Report VCCH-1 error: `a_class' has deferred features
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vcch1_error (a_class) then
				create an_error.make_vcch1b (a_class, f)
				report_validity_error (an_error)
			end
		end

	report_vcch2a_error (a_class: ET_CLASS) is
			-- Report VCCH-2 error: `a_class' is marked as deferred
			-- but has no deferred feature.
			--
			-- ETL2: p.51
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_class_deferred: a_class.has_deferred_mark
		local
			an_error: ET_VALIDITY_ERROR
		do
			if is_se or is_ve or is_ge then
				if reportable_vcch2_error (a_class) then
					create an_error.make_vcch2a (a_class)
					report_validity_error (an_error)
				end
			end
		end

	report_vcfg1a_error (a_class: ET_CLASS; a_formal: ET_FORMAL_PARAMETER; other_class: ET_CLASS) is
			-- Report VCFG-1 error: the formal generic parameter `a_formal'
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vcfg1_error (a_class) then
				create an_error.make_vcfg1a (a_class, a_formal, other_class)
				report_validity_error (an_error)
			end
		end

	report_vcfg2a_error (a_class: ET_CLASS; a_formal1, a_formal2: ET_FORMAL_PARAMETER) is
			-- Report VCFG-2 error: a formal generic name is declared
			-- twice in generic class `a_class'.
			--
			-- ETL2: p.52
			-- ETR: p.16
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_formal1_not_void: a_formal1 /= Void
			a_formal2_not_void: a_formal2 /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vcfg2_error (a_class) then
				create an_error.make_vcfg2a (a_class, a_formal1, a_formal2)
				report_validity_error (an_error)
			end
		end

	report_vcfg3a_error (a_class: ET_CLASS; a_type: ET_BIT_FEATURE) is
			-- Report VCFG-3 error: invalid type `a_type' in
			-- constraint of formal generic parameter of `a_class'.
			--
			-- ETR: p.16
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vcfg3_error (a_class) then
				create an_error.make_vcfg3a (a_class, a_type)
				an_error.set_ise_reported (False)
				an_error.set_se_reported (False)
				an_error.set_se_fatal (False)
				report_validity_error (an_error)
			end
		end

	report_vcfg3b_error (a_class: ET_CLASS; a_type: ET_BIT_N) is
			-- Report VCFG-3 error: invalid type `a_type' in
			-- constraint of formal generic parameter of `a_class'.
			--
			-- ETR: p.16
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if is_pedantic then
				if reportable_vcfg3_error (a_class) then
					create an_error.make_vcfg3b (a_class, a_type)
					report_validity_error (an_error)
				end
			end
		end

	report_vcfg3c_error (a_class: ET_CLASS; a_type: ET_LIKE_TYPE) is
			-- Report VCFG-3 error: invalid type `a_type' in
			-- constraint of formal generic parameter of `a_class'.
			--
			-- ETR: p.16
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vcfg3_error (a_class) then
				create an_error.make_vcfg3c (a_class, a_type)
				an_error.set_se_reported (False)
				an_error.set_se_fatal (False)
				report_validity_error (an_error)
			end
		end

	report_vcfg3d_error (a_class: ET_CLASS; a_formal: ET_FORMAL_PARAMETER; a_constraint: ET_FORMAL_PARAMETER_TYPE) is
			-- Report VCFG-3 error: the constraint of `a_formal'
			-- in `a_class' is the formal generic parameter itself.
			--
			-- ETR: p.16
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_formal_not_void: a_formal /= Void
			a_constraint_not_void: a_constraint /= Void
			valid_constraint: a_formal.constraint = a_constraint
		local
			an_error: ET_VALIDITY_ERROR
		do
			if is_se then
				if reportable_vtct_error (a_class) then
					create an_error.make_vtct0b (a_class, a_constraint)
					an_error.set_compilers (False)
					an_error.set_se_reported (True)
					an_error.set_se_fatal (True)
					report_validity_error (an_error)
				end
			end
			if reportable_vcfg3_error (a_class) then
				if is_ise or is_ge then
					create an_error.make_vcfg3d (a_class, a_formal, a_constraint)
					an_error.set_ise_reported (False)
					report_validity_error (an_error)
				end
			end
		end

	report_vcfg3e_error (a_class: ET_CLASS; a_formal: ET_FORMAL_PARAMETER; a_constraint: ET_FORMAL_PARAMETER_TYPE) is
			-- Report VCFG-3 error: the constraint of `a_formal'
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vcfg3_error (a_class) then
				if is_ise then
					create an_error.make_vcfg3e (a_class, a_formal, a_constraint)
					an_error.set_compilers (False)
					an_error.set_ise_fatal (True)
					report_validity_error (an_error)
				end
			end
		end

	report_vcfg3f_error (a_class: ET_CLASS; a_formal: ET_FORMAL_PARAMETER; a_constraint: ET_FORMAL_PARAMETER_TYPE) is
			-- Report VCFG-3 error: the constraint of `a_formal'
			-- in `a_class' is another formal generic parameter
			-- appearing after `a_formal' in the list of formal
			-- generic parameters.
			--
			-- ETR: p.16
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_formal_not_void: a_formal /= Void
			a_constraint_not_void: a_constraint /= Void
			valid_constraint: a_formal.constraint = a_constraint
		local
			an_error: ET_VALIDITY_ERROR
		do
			if is_ise then
				if reportable_vtct_error (a_class) then
					create an_error.make_vtct0b (a_class, a_constraint)
					an_error.set_compilers (False)
					an_error.set_ise_reported (True)
					an_error.set_ise_fatal (True)
					report_validity_error (an_error)
				end
			end
		end

	report_vcfg3g_error (a_class: ET_CLASS; a_cycle: DS_LIST [ET_FORMAL_PARAMETER]) is
			-- Report VCFG-3 error: the constraints of the formal
			-- generic parameters `a_cycle' of `a_class' are
			-- involved in a cycle.
			--
			-- ETR: p.16
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_cyle_not_void: a_cycle /= Void
			no_void_formal: not a_cycle.has (Void)
			is_cycle: a_cycle.count >= 2
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vcfg3_error (a_class) then
				if is_se or is_ge then
					create an_error.make_vcfg3g (a_class, a_cycle)
					an_error.set_compilers (False)
					an_error.set_se_fatal (True)
					an_error.set_ge_reported (True)
					an_error.set_ge_fatal (True)
					report_validity_error (an_error)
				end
			end
		end

	report_vcfg3h_error (a_class: ET_CLASS; a_formal: ET_FORMAL_PARAMETER; a_type: ET_FORMAL_PARAMETER_TYPE) is
			-- Report VCFG-3 error: the constraint of `a_formal'
			-- in `a_class' contains the formal generic parameter
			-- itself.
			--
			-- ETR: p.16
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_formal_not_void: a_formal /= Void
			a_type_not_void: a_type /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if is_se then
				if reportable_vtct_error (a_class) then
					create an_error.make_vtct0b (a_class, a_type)
					an_error.set_compilers (False)
					an_error.set_se_reported (True)
					an_error.set_se_fatal (True)
					report_validity_error (an_error)
				end
			end
			if reportable_vcfg3_error (a_class) then
				if
					not (is_ise or is_se or is_ve) and
					not is_ge and is_pedantic
				then
					create an_error.make_vcfg3h (a_class, a_formal, a_type)
					report_validity_error (an_error)
				end
			end
		end

	report_vcfg3i_error (a_class: ET_CLASS; a_formal: ET_FORMAL_PARAMETER; a_type: ET_FORMAL_PARAMETER_TYPE) is
			-- Report VCFG-3 error: the constraint of `a_formal' in
			-- `a_class' contains another formal generic parameter
			-- appearing after `a_formal' in the list of formal
			-- generic parameters.
			--
			-- ETR: p.16
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_formal_not_void: a_formal /= Void
			a_type_not_void: a_type /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if is_ise then
				if reportable_vtct_error (a_class) then
					create an_error.make_vtct0b (a_class, a_type)
					an_error.set_compilers (False)
					an_error.set_ise_reported (True)
					an_error.set_ise_fatal (True)
					report_validity_error (an_error)
				end
			end
		end

	report_vcfg3j_error (a_class: ET_CLASS; a_cycle: DS_LIST [ET_FORMAL_PARAMETER]) is
			-- Report VCFG-3 error: the constraints of the formal
			-- generic parameters `a_cycle' of `a_class' are
			-- involved in a cycle.
			--
			-- ETR: p.16
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_cyle_not_void: a_cycle /= Void
			no_void_formal: not a_cycle.has (Void)
			is_cycle: a_cycle.count >= 2
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vcfg3_error (a_class) then
				if is_se then
					create an_error.make_vcfg3j (a_class, a_cycle)
					an_error.set_compilers (False)
					an_error.set_se_fatal (True)
					report_validity_error (an_error)
				end
			end
		end

	report_vdjr0a_error (a_class: ET_CLASS; f1, f2: ET_PARENT_FEATURE) is
			-- Report VDJR error: Features `f1' and `f2'
			-- don't have the same number of arguments when
			-- joining these two deferred features in `a_class'.
			--
			-- ETL2: p.165
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdjr_error (a_class) then
				create an_error.make_vdjr0a (a_class, f1, f2)
				report_validity_error (an_error)
			end
		end

	report_vdjr0b_error (a_class: ET_CLASS; f1, f2: ET_PARENT_FEATURE; arg: INTEGER) is
			-- Report VDJR error: the type of the `arg'-th
			-- argument is not identical in `f1' and `f2' when
			-- joining these two deferred features in `a_class'.
			--
			-- ETL2: p.165
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdjr_error (a_class) then
				create an_error.make_vdjr0b (a_class, f1, f2, arg)
				report_validity_error (an_error)
			end
		end

	report_vdjr0c_error (a_class: ET_CLASS; f1, f2: ET_PARENT_FEATURE) is
			-- Resport VDJR error: the type of the result is
			-- not identical in `f1' and `f2' when joining these
			-- two deferred features in `a_class'.
			--
			-- ETL2: p.165
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdjr_error (a_class) then
				create an_error.make_vdjr0c (a_class, f1, f2)
				report_validity_error (an_error)
			end
		end

	report_vdjr2a_error (a_class: ET_CLASS; f1, f2: ET_PARENT_FEATURE) is
			-- Report VDJR-2 error: features `f1' and `f2' are joined/merged,
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdjr2_error (a_class) then
				create an_error.make_vdjr2a (a_class, f1, f2)
				report_validity_error (an_error)
			end
		end

	report_vdjr2b_error (a_class: ET_CLASS; f1, f2: ET_PARENT_FEATURE) is
			-- Report VDJR-2 error: features `f1' and `f2' are joined/merged,
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdjr2_error (a_class) then
				create an_error.make_vdjr2b (a_class, f1, f2)
				report_validity_error (an_error)
			end
		end

	report_vdpr1a_error (a_class: ET_CLASS; a_precursor: ET_PRECURSOR_INSTRUCTION) is
			-- Report VDPR-1 error: instruction `a_precursor' does not
			-- appear in a routine body in `a_class'.
			--
			-- ETL3-4.82-00-00: p.215
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_precursor_not_void: a_precursor /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdpr1_error (a_class) then
				create an_error.make_vdpr1a (a_class, a_precursor)
				report_validity_error (an_error)
			end
		end

	report_vdpr1b_error (a_class: ET_CLASS; a_precursor: ET_PRECURSOR_EXPRESSION) is
			-- Report VDPR-1 error: expression `a_precursor' does not
			-- appear in a routine body in `a_class'.
			--
			-- ETL3-4.82-00-00: p.215
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_precursor_not_void: a_precursor /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdpr1_error (a_class) then
				create an_error.make_vdpr1b (a_class, a_precursor)
				report_validity_error (an_error)
			end
		end

	report_vdpr2a_error (a_class: ET_CLASS; a_precursor: ET_PRECURSOR) is
			-- Report VDPR-2 error: the parent name specified in `a_precursor'
			-- is not the name of a parent of `a_class'.
			--
			-- ETL3-4.82-00-00: p.215
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_precursor_not_void: a_precursor /= Void
			a_precursor_qualified: a_precursor.parent_name /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdpr2_error (a_class) then
				create an_error.make_vdpr2a (a_class, a_precursor)
				report_validity_error (an_error)
			end
		end

	report_vdpr3a_error (a_class: ET_CLASS; a_precursor: ET_PRECURSOR; a_redefined_feature: ET_FEATURE; f1, f2: ET_PARENT_FEATURE) is
			-- Report VDPR-3 error: two effective features `f1' and `f2' redefined into
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdpr3_error (a_class) then
				create an_error.make_vdpr3a (a_class, a_precursor, a_redefined_feature, f1, f2)
				report_validity_error (an_error)
			end
		end

	report_vdpr3b_error (a_class: ET_CLASS; a_precursor: ET_PRECURSOR; a_redefined_feature: ET_FEATURE; an_inherited_feature: ET_PARENT_FEATURE) is
			-- Report VDPR-3 error: feature `a_redefined_feature' where `a_precursor' appears
			-- is the redefinition of a deferred feature `an_inherited_feature' in `a_class'.
			--
			-- ETL3-4.82-00-00: p.215
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_precursor_not_void: a_precursor /= Void
			a_redefined_feature_not_void: a_redefined_feature /= Void
			an_inherited_feature_not_void: an_inherited_feature /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdpr3_error (a_class) then
				create an_error.make_vdpr3b (a_class, a_precursor, a_redefined_feature, an_inherited_feature)
				report_validity_error (an_error)
			end
		end

	report_vdpr3c_error (a_class: ET_CLASS; a_precursor: ET_PRECURSOR; a_redefined_feature: ET_FEATURE) is
			-- Report VDPR-3 error: feature `a_redefined_feature' where `a_precursor' appears
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
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdpr3_error (a_class) then
				create an_error.make_vdpr3c (a_class, a_precursor, a_redefined_feature)
				report_validity_error (an_error)
			end
		end

	report_vdpr3d_error (a_class: ET_CLASS; a_precursor: ET_PRECURSOR; a_feature: ET_FEATURE) is
			-- Report VDPR-3 error: `a_precursor' appears in `a_feature' in `a_class',
			-- but `a_feature' is not a redeclared feature.
			--
			-- ETL3-4.82-00-00: p.215
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_precursor_not_void: a_precursor /= Void
			a_feature_not_void: a_feature /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdpr3_error (a_class) then
				create an_error.make_vdpr3d (a_class, a_precursor, a_feature)
				report_validity_error (an_error)
			end
		end

	report_vdpr4a_error (a_class: ET_CLASS; a_precursor: ET_PRECURSOR_KEYWORD; a_feature: ET_FEATURE; a_parent: ET_CLASS) is
			-- Report VDPR-4A error: the number of actual arguments in
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdpr4_error (a_class) then
				create an_error.make_vdpr4a (a_class, a_precursor, a_feature, a_parent)
				report_validity_error (an_error)
			end
		end

	report_vdpr4c_error (a_class: ET_CLASS; a_precursor: ET_PRECURSOR_KEYWORD; a_feature: ET_FEATURE;
		a_parent: ET_CLASS; arg: INTEGER; an_actual, a_formal: ET_NAMED_TYPE) is
			-- Report VDPR-4B error: the `arg'-th actual argument in the precursor
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdpr4_error (a_class) then
				create an_error.make_vdpr4c (a_class, a_precursor, a_feature, a_parent, arg, an_actual, a_formal)
				report_validity_error (an_error)
			end
		end

	report_vdpr4d_error (a_class, a_class_impl: ET_CLASS; a_precursor: ET_PRECURSOR_KEYWORD; a_feature: ET_FEATURE;
		a_parent: ET_CLASS; arg: INTEGER; an_actual, a_formal: ET_NAMED_TYPE) is
			-- Report VDPR-4B error: the `arg'-th actual argument in the precursor
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdpr4_error (a_class) then
				create an_error.make_vdpr4d (a_class, a_class_impl, a_precursor, a_feature, a_parent, arg, an_actual, a_formal)
				report_validity_error (an_error)
			end
		end

	report_vdrd2a_error (a_class: ET_CLASS; f1: ET_FEATURE; f2: ET_PARENT_FEATURE) is
			-- Report VDRD-2 error: the feature `f2' is redeclared
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdrd2_error (a_class) then
				create an_error.make_vdrd2a (a_class, f1, f2)
				report_validity_error (an_error)
			end
		end

	report_vdrd2b_error (a_class: ET_CLASS; f1, f2: ET_PARENT_FEATURE) is
			-- Report VDRD-2 error: the feature `f2' is redeclared
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdrd2_error (a_class) then
				create an_error.make_vdrd2b (a_class, f1, f2)
				report_validity_error (an_error)
			end
		end

	report_vdrd2c_error (a_class: ET_CLASS; f1: ET_FEATURE; f2: ET_PARENT_FEATURE) is
			-- Report VDRD-2 error: the inherited feature `f2', replicated
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdrd2_error (a_class) then
				create an_error.make_vdrd2c (a_class, f1, f2)
				report_validity_error (an_error)
			end
		end

	report_vdrd2d_error (a_class: ET_CLASS; f1, f2: ET_PARENT_FEATURE) is
			-- Report VDRD-2 error: the inherited feature `f2', replicated
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdrd2_error (a_class) then
				create an_error.make_vdrd2d (a_class, f1, f2)
				report_validity_error (an_error)
			end
		end

	report_vdrd3a_error (a_class: ET_CLASS; p: ET_PRECONDITIONS; f: ET_FEATURE) is
			-- Report VDRD-3 error: the feature `f' is redeclared
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdrd3_error (a_class) then
				create an_error.make_vdrd3a (a_class, p, f)
				report_validity_error (an_error)
			end
		end

	report_vdrd3b_error (a_class: ET_CLASS; p: ET_POSTCONDITIONS; f: ET_FEATURE) is
			-- Report VDRD-3 error: the feature `f' is redeclared
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdrd3_error (a_class) then
				create an_error.make_vdrd3b (a_class, p, f)
				report_validity_error (an_error)
			end
		end

	report_vdrd4a_error (a_class: ET_CLASS; f1: ET_PARENT_FEATURE; f2: ET_FEATURE) is
			-- Report VDRD-4 error: the deferred feature `f1'
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdrd4_error (a_class) then
				if is_ge then
					create an_error.make_vdrd4a (a_class, f1, f2)
					report_validity_error (an_error)
				end
			end
		end

	report_vdrd4b_error (a_class: ET_CLASS; f1: ET_PARENT_FEATURE; f2: ET_FEATURE) is
			-- Report VDRD-4 error: the effective feature `f1'
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdrd4_error (a_class) then
				if is_se or is_ge then
					create an_error.make_vdrd4b (a_class, f1, f2)
					report_validity_error (an_error)
				end
			end
		end

	report_vdrd4c_error (a_class: ET_CLASS; f1: ET_PARENT_FEATURE; f2: ET_FEATURE) is
			-- Report VDRD-4 error: the effective feature `f1'
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdrd4_error (a_class) then
				if is_se or is_ge then
					create an_error.make_vdrd4c (a_class, f1, f2)
					report_validity_error (an_error)
				end
			end
		end

	report_vdrd5a_error (a_class: ET_CLASS; f1: ET_PARENT_FEATURE; f2: ET_FEATURE) is
			-- Report VDRD-5 error: the effective feature `f1'
			-- is redefined into the deferred feature `f2' in
			-- `a_class'.
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdrd5_error (a_class) then
				if is_ise or is_ge then
					create an_error.make_vdrd5a (a_class, f1, f2)
					report_validity_error (an_error)
				end
			end
		end

	report_vdrd6a_error (a_class: ET_CLASS; f1: ET_PARENT_FEATURE; f2: ET_FEATURE) is
			-- Report VDRD-6 error: the attribute `f1' is not redeclared into
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdrd6_error (a_class) then
				create an_error.make_vdrd6a (a_class, f1, f2)
				report_validity_error (an_error)
			end
		end

	report_vdrd6b_error (a_class: ET_CLASS; f1: ET_PARENT_FEATURE; f2: ET_FEATURE) is
			-- Report VDRD-6 error: the type of attribute `f1' has not the
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdrd6_error (a_class) then
				create an_error.make_vdrd6b (a_class, f1, f2)
				report_validity_error (an_error)
			end
		end

	report_vdrd7a_error (a_class: ET_CLASS; f1: ET_PARENT_FEATURE; f2: ET_FEATURE) is
			-- Report VDRD-7 error: `f1' has no alias but its redeclared version
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdrd7_error (a_class) then
				create an_error.make_vdrd7a (a_class, f1, f2)
				report_validity_error (an_error)
			end
		end

	report_vdrd7b_error (a_class: ET_CLASS; f1: ET_PARENT_FEATURE; f2: ET_FEATURE) is
			-- Report VDRD-7 error: `f1' has an alias but its redeclared version
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdrd7_error (a_class) then
				create an_error.make_vdrd7b (a_class, f1, f2)
				report_validity_error (an_error)
			end
		end

	report_vdrd7c_error (a_class: ET_CLASS; f1: ET_PARENT_FEATURE; f2: ET_FEATURE) is
			-- Report VDRD-7 error: `f1' and its redeclared version `f2'
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdrd7_error (a_class) then
				create an_error.make_vdrd7c (a_class, f1, f2)
				report_validity_error (an_error)
			end
		end

	report_vdrs1a_error (a_class: ET_CLASS; a_parent: ET_PARENT; f: ET_FEATURE_NAME) is
			-- Report VDRS-1 error: the Redefine subclause of `a_parent'
			-- in `a_class' lists `f' which is not the final name in
			-- `a_class' of a feature inherited from `a_parent'.
			--
			-- ETL2: p.159
			-- ETR: p.37
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
			f_not_void: f /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdrs1_error (a_class) then
				create an_error.make_vdrs1a (a_class, a_parent, f)
				report_validity_error (an_error)
			end
		end

	report_vdrs2a_error (a_class: ET_CLASS; a_parent: ET_PARENT; f: ET_FEATURE_NAME) is
			-- Report VDRS-2 error: the Redefine subclause of `a_parent'
			-- in `a_class' lists `f' which is the final name of a
			-- frozen feature.
			--
			-- ETL2: p.159
			-- ETR: p.37
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
			f_not_void: f /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdrs2_error (a_class) then
				create an_error.make_vdrs2a (a_class, a_parent, f)
				report_validity_error (an_error)
			end
		end

	report_vdrs2b_error (a_class: ET_CLASS; a_parent: ET_PARENT; f: ET_FEATURE_NAME) is
			-- Report VDRS-2 error: the Redefine subclause of `a_parent'
			-- in `a_class' lists `f' which is the final name of a
			-- constant attribute.
			--
			-- ETL2: p.159
			-- ETR: p.37
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
			f_not_void: f /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdrs2_error (a_class) then
				create an_error.make_vdrs2b (a_class, a_parent, f)
				report_validity_error (an_error)
			end
		end

	report_vdrs3a_error (a_class: ET_CLASS; a_parent: ET_PARENT; f1, f2: ET_FEATURE_NAME) is
			-- Report VDRS-3 error: feature name `f2' appears twice in the
			-- Redefine subclause of parent `a_parent' in `a_class'.
			--
			-- ETL2: p.159
			-- ETR: p.37
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdrs3_error (a_class) then
				create an_error.make_vdrs3a (a_class, a_parent, f1, f2)
				report_validity_error (an_error)
			end
		end

	report_vdrs4a_error (a_class: ET_CLASS; a_feature: ET_PARENT_FEATURE) is
			-- Report VDRS-4 error: `a_feature' is not redefined
			-- in `a_class' and therefore should not be listed in
			-- the Redefine subclause.
			--
			-- ETL2: p.159
			-- ETR: p.37
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_redefined: a_feature.has_redefine
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdrs4_error (a_class) then
				create an_error.make_vdrs4a (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_vdrs4b_error (a_class: ET_CLASS; a_deferred: ET_PARENT_FEATURE; an_effective: ET_FEATURE) is
			-- Report VDRS-4 error: deferred feature `a_deferred' should
			-- not be listed in the Redefine subclause when being effected
			-- to `an_effective' in `a_class'.
			--
			-- ETL2: p.159
			-- ETR: p.37
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_deffered_not_void: a_deferred /= Void
			a_deferred_deferred: a_deferred.is_deferred
			a_deffered_redefined: a_deferred.has_redefine
			an_effective_not_void: an_effective /= Void
			an_effective_not_deferred: not an_effective.is_deferred
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdrs4_error (a_class) then
				if is_ge then
					create an_error.make_vdrs4b (a_class, a_deferred, an_effective)
					report_validity_error (an_error)
				end
			end
		end

	report_vdus1a_error (a_class: ET_CLASS; a_parent: ET_PARENT; f: ET_FEATURE_NAME) is
			-- Report VDUS-1 error: the Undefine subclause
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdus1_error (a_class) then
				create an_error.make_vdus1a (a_class, a_parent, f)
				report_validity_error (an_error)
			end
		end

	report_vdus2a_error (a_class: ET_CLASS; a_parent: ET_PARENT; f: ET_FEATURE_NAME) is
			-- Report VDUS-2 error: the Undefine subclause
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdus2_error (a_class) then
				create an_error.make_vdus2a (a_class, a_parent, f)
				report_validity_error (an_error)
			end
		end

	report_vdus2b_error (a_class: ET_CLASS; a_parent: ET_PARENT; f: ET_FEATURE_NAME) is
			-- Report VDUS-2 error: the Undefine subclause of
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdus2_error (a_class) then
				create an_error.make_vdus2b (a_class, a_parent, f)
				report_validity_error (an_error)
			end
		end

	report_vdus3a_error (a_class: ET_CLASS; a_parent: ET_PARENT; f: ET_FEATURE_NAME) is
			-- Report VDUS-3 error: the Undefine subclause
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdus3_error (a_class) then
				if is_ise or is_ge then
					create an_error.make_vdus3a (a_class, a_parent, f)
					report_validity_error (an_error)
				end
			end
		end

	report_vdus4a_error (a_class: ET_CLASS; a_parent: ET_PARENT; f1, f2: ET_FEATURE_NAME) is
			-- Report VDUS-4 error: feature name `f2' appears
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdus4_error (a_class) then
				create an_error.make_vdus4a (a_class, a_parent, f1, f2)
				report_validity_error (an_error)
			end
		end

	report_veen0a_error (a_class: ET_CLASS; an_identifier: ET_IDENTIFIER; a_feature: ET_FEATURE) is
			-- Report VEEN error: `an_identifier', appearing in `a_feature'
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_veen_error (a_class) then
				create an_error.make_veen0a (a_class, an_identifier, a_feature)
				report_validity_error (an_error)
			end
		end

	report_veen2a_error (a_class: ET_CLASS; a_result: ET_RESULT; a_feature: ET_FEATURE) is
			-- Report VEEN-2 error: `a_result' appears in the body, postcondition
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_veen2_error (a_class) then
				create an_error.make_veen2a (a_class, a_result, a_feature)
				report_validity_error (an_error)
			end
		end

	report_veen2b_error (a_class: ET_CLASS; a_result: ET_RESULT; a_feature: ET_FEATURE) is
			-- Report VEEN-2 error: `a_result' appears in the precondition
			-- `a_feature' in `a_class'.
			--
			-- ETL2: p.276
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_result_not_void: a_result /= Void
			a_feature_not_void: a_feature /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_veen2_error (a_class) then
				create an_error.make_veen2b (a_class, a_result, a_feature)
				report_validity_error (an_error)
			end
		end

	report_veen2c_error (a_class: ET_CLASS; a_local: ET_FEATURE_NAME; a_feature: ET_FEATURE) is
			-- Report VEEN-2 error: the local variable `a_local' appears in the precondition
			-- or postcondition of `a_feature' in `a_class'.
			--
			-- ETL2: p.276
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_local_not_void: a_local /= Void
			a_local_is_local: a_local.is_local
			a_feature_not_void: a_feature /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_veen2_error (a_class) then
				create an_error.make_veen2c (a_class, a_local, a_feature)
				report_validity_error (an_error)
			end
		end

	report_veen2d_error (a_class: ET_CLASS; a_result: ET_RESULT) is
			-- Report VEEN-2 error: `a_result' appears in the invariant
			-- of `a_class'.
			--
			-- ETL2: p.276
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_result_not_void: a_result /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_veen2_error (a_class) then
				create an_error.make_veen2d (a_class, a_result)
				report_validity_error (an_error)
			end
		end

	report_vfav1a_error (a_class: ET_CLASS; a_feature: ET_FEATURE) is
			-- Report VFAV-1 error: `a_feature' has an infix operator alias
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav1_error (a_class) then
				create an_error.make_vfav1a (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_vfav1b_error (a_class: ET_CLASS; a_feature: ET_FEATURE) is
			-- Report VFAV-1 error: `a_feature' has a prefix operator alias
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav1_error (a_class) then
				create an_error.make_vfav1b (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_vfav1c_error (a_class: ET_CLASS; a_feature1, a_feature2: ET_FEATURE) is
			-- Report VFAV-1 error: `a_feature1' and `a_feature2' have
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav1_error (a_class) then
				create an_error.make_vfav1c (a_class, a_feature1, a_feature2)
				report_validity_error (an_error)
			end
		end

	report_vfav1d_error (a_class: ET_CLASS; a_feature1: ET_FEATURE; a_feature2: ET_PARENT_FEATURE) is
			-- Report VFAV-1 error: `a_feature1' and `a_feature2' have
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav1_error (a_class) then
				create an_error.make_vfav1d (a_class, a_feature1, a_feature2)
				report_validity_error (an_error)
			end
		end

	report_vfav1e_error (a_class: ET_CLASS; a_feature1, a_feature2: ET_PARENT_FEATURE) is
			-- Report VFAV-1 error: `a_feature1' and `a_feature2' have
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav1_error (a_class) then
				create an_error.make_vfav1e (a_class, a_feature1, a_feature2)
				report_validity_error (an_error)
			end
		end

	report_vfav1f_error (a_class: ET_CLASS; a_feature1, a_feature2: ET_FEATURE) is
			-- Report VFAV-1 error: `a_feature1' and `a_feature2' have
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav1_error (a_class) then
				create an_error.make_vfav1f (a_class, a_feature1, a_feature2)
				report_validity_error (an_error)
			end
		end

	report_vfav1g_error (a_class: ET_CLASS; a_feature1: ET_FEATURE; a_feature2: ET_PARENT_FEATURE) is
			-- Report VFAV-1 error: `a_feature1' and `a_feature2' have
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav1_error (a_class) then
				create an_error.make_vfav1g (a_class, a_feature1, a_feature2)
				report_validity_error (an_error)
			end
		end

	report_vfav1h_error (a_class: ET_CLASS; a_feature1, a_feature2: ET_PARENT_FEATURE) is
			-- Report VFAV-1 error: `a_feature1' and `a_feature2' have
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav1_error (a_class) then
				create an_error.make_vfav1h (a_class, a_feature1, a_feature2)
				report_validity_error (an_error)
			end
		end

	report_vfav2a_error (a_class: ET_CLASS; a_feature: ET_FEATURE) is
			-- Report VFAV-2 error: `a_feature' has a bracket alias
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav2_error (a_class) then
				create an_error.make_vfav2a (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_vfav2b_error (a_class: ET_CLASS; a_feature1, a_feature2: ET_FEATURE) is
			-- Report VFAV-2 error: `a_feature1' and `a_feature2' have both
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav2_error (a_class) then
				create an_error.make_vfav2b (a_class, a_feature1, a_feature2)
				report_validity_error (an_error)
			end
		end

	report_vfav2c_error (a_class: ET_CLASS; a_feature1: ET_FEATURE; a_feature2: ET_PARENT_FEATURE) is
			-- Report VFAV-2 error: `a_feature1' and `a_feature2' have both
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav2_error (a_class) then
				create an_error.make_vfav2c (a_class, a_feature1, a_feature2)
				report_validity_error (an_error)
			end
		end

	report_vfav2d_error (a_class: ET_CLASS; a_feature1, a_feature2: ET_PARENT_FEATURE) is
			-- Report VFAV-2 error: `a_feature1' and `a_feature2' have both
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav2_error (a_class) then
				create an_error.make_vfav2d (a_class, a_feature1, a_feature2)
				report_validity_error (an_error)
			end
		end

	report_vffd4a_error (a_class: ET_CLASS; a_feature: ET_FEATURE) is
			-- Report VFFD-4 error: deferred `a_feature' is marked as frozen.
			--
			-- ETL2: p.69
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_deferred: a_feature.is_deferred
			a_feature_frozen: a_feature.is_frozen
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vffd4_error (a_class) then
				create an_error.make_vffd4a (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_vffd5a_error (a_class: ET_CLASS; a_feature: ET_FEATURE) is
			-- Report VFFD-5 error: `a_feature' has a prefix name but is
			-- not an attribute or a function with no argument.
			--
			-- ETL2: p.69
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_name_prefix: a_feature.name.is_prefix
			a_feature_not_prefixable: not a_feature.is_prefixable
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vffd5_error (a_class) then
				create an_error.make_vffd5a (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_vffd6a_error (a_class: ET_CLASS; a_feature: ET_FEATURE) is
			-- Report VFFD-6 error: `a_feature' has an infix name but is
			-- not a function with exactly one argument.
			--
			-- ETL2: p.69
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_name_infix: a_feature.name.is_infix
			a_feature_not_infixable: not a_feature.is_infixable
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vffd6_error (a_class) then
				create an_error.make_vffd6a (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_vffd7a_error (a_class: ET_CLASS; a_feature: ET_FEATURE) is
			-- Report VFFD-7 error: the type of the once function `a_feature'
			-- contains an anchored type.
			--
			-- ETL2: p.69
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_once: a_feature.is_once
			a_feature_function: a_feature.type /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vffd6_error (a_class) then
				create an_error.make_vffd7a (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_vffd7b_error (a_class: ET_CLASS; a_feature: ET_FEATURE) is
			-- Report VFFD-7 error: the type of the once function `a_feature'
			-- contains an formal generic parameter.
			--
			-- ETL2: p.69
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_once: a_feature.is_once
			a_feature_function: a_feature.type /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vffd6_error (a_class) then
				create an_error.make_vffd7b (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_vgcc3a_error (a_class: ET_CLASS; a_creation: ET_CREATION_INSTRUCTION;
		a_creation_named_type, a_target_named_type: ET_NAMED_TYPE) is
			-- Report VGCC-3 error: the explicit creation type in creation instruction
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vgcc3_error (a_class) then
				create an_error.make_vgcc3a (a_class, a_creation, a_creation_named_type, a_target_named_type)
				report_validity_error (an_error)
			end
		end

	report_vgcc3b_error (a_class, a_class_impl: ET_CLASS; a_creation: ET_CREATION_INSTRUCTION;
		a_creation_named_type, a_target_named_type: ET_NAMED_TYPE) is
			-- Report VGCC-3 error: the explicit creation type in creation instruction
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vgcc3_error (a_class) then
				create an_error.make_vgcc3b (a_class, a_class_impl, a_creation, a_creation_named_type, a_target_named_type)
				report_validity_error (an_error)
			end
		end

	report_vgcc5a_error (a_class: ET_CLASS; a_position: ET_POSITION; a_target: ET_CLASS) is
			-- Report VGCC-5 error: the creation expression appearing in `a_class'
			-- at position `a_position', has no Creation_call part but the
			-- base class `a_target' of the creation type has a Creators part.
			--
			-- ETL2: p.286
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_position_not_void: a_position /= Void
			a_target_not_void: a_target /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vgcc5_error (a_class) then
				create an_error.make_vgcc5a (a_class, a_position, a_target)
				report_validity_error (an_error)
			end
		end

	report_vgcc5b_error (a_class, a_class_impl: ET_CLASS; a_position: ET_POSITION; a_target: ET_CLASS) is
			-- Report VGCC-5 error: the creation expression appearing in
			-- `a_class_impl' at position `a_position' and viewed from one
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vgcc5_error (a_class) then
				create an_error.make_vgcc5b (a_class, a_class_impl, a_position, a_target)
				report_validity_error (an_error)
			end
		end

	report_vgcc5c_error (a_class: ET_CLASS; a_creation: ET_CREATION_INSTRUCTION; a_target: ET_CLASS) is
			-- Report VGCC-5 error: the creation instruction `a_creation',
			-- appearing in `a_class', has no Creation_call part but the
			-- base class `a_target' of the creation type has a Creators part.
			--
			-- ETL2: p.286
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_creation_not_void: a_creation /= Void
			a_target_not_void: a_target /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vgcc5_error (a_class) then
				create an_error.make_vgcc5c (a_class, a_creation, a_target)
				report_validity_error (an_error)
			end
		end

	report_vgcc5d_error (a_class, a_class_impl: ET_CLASS; a_creation: ET_CREATION_INSTRUCTION; a_target: ET_CLASS) is
			-- Report VGCC-5 error: the creation instruction `a_creation',
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vgcc5_error (a_class) then
				create an_error.make_vgcc5d (a_class, a_class_impl, a_creation, a_target)
				report_validity_error (an_error)
			end
		end

	report_vgcc6a_error (a_class: ET_CLASS; cp: ET_FEATURE_NAME; f: ET_FEATURE) is
			-- Report VGCC-6 error: creation procedure name
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vgcc6_error (a_class) then
				create an_error.make_vgcc6a (a_class, cp, f)
				report_validity_error (an_error)
			end
		end

	report_vgcc6b_error (a_class: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS) is
			-- Report VGCC-6 error: the feature name `a_name', appearing
			-- in a creation expression in `a_class', is not a procedure.
			--
			-- ETL2: p.286
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_target_not_void: a_target /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vgcc6_error (a_class) then
				create an_error.make_vgcc6b (a_class, a_name, a_feature, a_target)
				report_validity_error (an_error)
			end
		end

	report_vgcc6d_error (a_class: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS) is
			-- Report VGCC-6 error: `a_feature' of class `a_target', appearing in
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vgcc6_error (a_class) then
				create an_error.make_vgcc6d (a_class, a_name, a_feature, a_target)
				report_validity_error (an_error)
			end
		end

	report_vgcc6e_error (a_class, a_class_impl: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS) is
			-- Report VGCC-6 error: `a_feature' of class `a_target', appearing in
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vgcc6_error (a_class) then
				create an_error.make_vgcc6e (a_class, a_class_impl, a_name, a_feature, a_target)
				report_validity_error (an_error)
			end
		end

	report_vgcc6f_error (a_class: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS) is
			-- Report VGCC-6 error: the feature name `a_name', appearing
			-- in a creation instruction in `a_class', is not a procedure.
			--
			-- ETL2: p.286
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_target_not_void: a_target /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vgcc6_error (a_class) then
				create an_error.make_vgcc6f (a_class, a_name, a_feature, a_target)
				report_validity_error (an_error)
			end
		end

	report_vgcc6h_error (a_class: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS) is
			-- Report VGCC-6 error: `a_feature' of class `a_target', appearing in
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vgcc6_error (a_class) then
				create an_error.make_vgcc6h (a_class, a_name, a_feature, a_target)
				report_validity_error (an_error)
			end
		end

	report_vgcc6i_error (a_class, a_class_impl: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS) is
			-- Report VGCC-6 error: `a_feature' of class `a_target', appearing in
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vgcc6_error (a_class) then
				create an_error.make_vgcc6i (a_class, a_class_impl, a_name, a_feature, a_target)
				report_validity_error (an_error)
			end
		end

	report_vgcc8a_error (a_class: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS; a_formal: ET_FORMAL_PARAMETER) is
			-- Report VGCC-8 error: `a_feature' of class `a_target', appearing in
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vgcc8_error (a_class) then
				create an_error.make_vgcc8a (a_class, a_name, a_feature, a_target, a_formal)
				report_validity_error (an_error)
			end
		end

	report_vgcc8b_error (a_class, a_class_impl: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS; a_formal: ET_FORMAL_PARAMETER) is
			-- Report VGCC-8 error: `a_feature' of class `a_target', appearing in
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vgcc8_error (a_class) then
				create an_error.make_vgcc8b (a_class, a_class_impl, a_name, a_feature, a_target, a_formal)
				report_validity_error (an_error)
			end
		end

	report_vgcc8c_error (a_class: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS; a_formal: ET_FORMAL_PARAMETER) is
			-- Report VGCC-8 error: `a_feature' of class `a_target', appearing in
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vgcc8_error (a_class) then
				create an_error.make_vgcc8c (a_class, a_name, a_feature, a_target, a_formal)
				report_validity_error (an_error)
			end
		end

	report_vgcc8d_error (a_class, a_class_impl: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS; a_formal: ET_FORMAL_PARAMETER) is
			-- Report VGCC-8 error: `a_feature' of class `a_target', appearing in
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vgcc8_error (a_class) then
				create an_error.make_vgcc8d (a_class, a_class_impl, a_name, a_feature, a_target, a_formal)
				report_validity_error (an_error)
			end
		end

	report_vgcp1a_error (a_class: ET_CLASS; a_creator: ET_CREATOR) is
			-- Report VGCP-1 error: `a_class' is deferred
			-- but has a Creation clause.
			--
			-- ETL2: p.285
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_creator_not_void: a_creator /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vgcp1_error (a_class) then
				create an_error.make_vgcp1a (a_class, a_creator)
				report_validity_error (an_error)
			end
		end

	report_vgcp2a_error (a_class: ET_CLASS; cp: ET_FEATURE_NAME) is
			-- Report VGCP-2 error: creation procedure name
			-- `cp' is not the final name of a feature in `a_class'.
			--
			-- ETL2: p.285
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			cp_not_void: cp /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vgcp2_error (a_class) then
				create an_error.make_vgcp2a (a_class, cp)
				report_validity_error (an_error)
			end
		end

	report_vgcp2b_error (a_class: ET_CLASS; cp: ET_FEATURE_NAME; f: ET_FEATURE) is
			-- Report VGCP-2 error: creation procedure name
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vgcp2_error (a_class) then
				create an_error.make_vgcp2b (a_class, cp, f)
				report_validity_error (an_error)
			end
		end

	report_vgcp3a_error (a_class: ET_CLASS; f1, f2: ET_FEATURE_NAME) is
			-- Report VGCP-3 error: procedure name
			-- appears twice in creation Feature_list.
			--
			-- ETL2: p.285
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vgcp3_error (a_class) then
				create an_error.make_vgcp3a (a_class, f1, f2)
				report_validity_error (an_error)
			end
		end

	report_vgcp3b_error (a_class: ET_CLASS; f1, f2: ET_FEATURE_NAME) is
			-- Report VGCP-3 error: procedure name appears
			-- in two different Creation clauses.
			--
			-- ETL2: p.285
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vgcp3_error (a_class) then
				create an_error.make_vgcp3b (a_class, f1, f2)
				report_validity_error (an_error)
			end
		end

	report_vgcp3c_error (a_class: ET_CLASS; f1, f2: ET_FEATURE_NAME) is
			-- Report VGCP-3 error: procedure name
			-- appears twice in creation Feature_list of
			-- a generic constraint.
			--
			-- ETL2: p.285
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vgcp3_error (a_class) then
				create an_error.make_vgcp3c (a_class, f1, f2)
				report_validity_error (an_error)
			end
		end

	report_vhay0a_error (a_class: ET_CLASS) is
			-- Report VHAY error: `a_class' implicitly inherits
			-- from unknown class ANY.
			--
			-- ETL2: p.88
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vhay_error (a_class) then
				create an_error.make_vhay0a (a_class)
				report_validity_error (an_error)
			end
		end

	report_vhpr1a_error (a_class: ET_CLASS; a_cycle: DS_LIST [ET_CLASS]) is
			-- Report VHPR-1 error: `a_class' is involved
			-- in the inheritance cycle `a_cycle'.
			--
			-- ETL2: p.79
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_cycle_not_void: a_cycle /= Void
			no_void_class: not a_cycle.has (Void)
			is_cycle: a_cycle.count >= 2
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vhpr1_error (a_class) then
				create an_error.make_vhpr1a (a_class, a_cycle)
				report_validity_error (an_error)
			end
		end

	report_vhpr1b_error (a_class: ET_CLASS; a_none: ET_BASE_TYPE) is
			-- Report VHPR-1 error: `a_class' is involved
			-- in the inheritance cycle: it inherits from NONE.
			--
			-- ETL2: p.79
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_none_not_void: a_none /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vhpr1_error (a_class) then
				create an_error.make_vhpr1b (a_class, a_none)
				report_validity_error (an_error)
			end
		end

	report_vhpr3a_error (a_class: ET_CLASS; a_type: ET_BIT_FEATURE) is
			-- Report VHPR-3 error: invalid type `a_type'
			-- in parent clause of `a_class'.
			--
			-- ETR: ?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vhpr3_error (a_class) then
				create an_error.make_vhpr3a (a_class, a_type)
				an_error.set_ise_reported (False)
				an_error.set_se_reported (False)
				an_error.set_se_fatal (False)
				report_validity_error (an_error)
			end
		end

	report_vhpr3b_error (a_class: ET_CLASS; a_type: ET_BIT_N) is
			-- Report VHPR-3 error: invalid type `a_type'
			-- in parent clause of `a_class'.
			--
			-- ETR: ?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if is_pedantic then
				if reportable_vhpr3_error (a_class) then
					create an_error.make_vhpr3b (a_class, a_type)
					an_error.set_ise_reported (False)
					an_error.set_se_reported (False)
					an_error.set_se_fatal (False)
					report_validity_error (an_error)
				end
			end
		end

	report_vhpr3c_error (a_class: ET_CLASS; a_type: ET_LIKE_TYPE) is
			-- Report VHPR-3 error: invalid type `a_type'
			-- in parent clause of `a_class'.
			--
			-- ETR: ?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vhpr3_error (a_class) then
				create an_error.make_vhpr3c (a_class, a_type)
				an_error.set_se_reported (False)
				an_error.set_se_fatal (False)
				report_validity_error (an_error)
			end
		end

	report_vhrc1a_error (a_class: ET_CLASS; a_parent: ET_PARENT; a_rename: ET_RENAME) is
			-- Report VHRC-1 error: the feature name appearing as first
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vhrc1_error (a_class) then
				create an_error.make_vhrc1a (a_class, a_parent, a_rename)
				report_validity_error (an_error)
			end
		end

	report_vhrc2a_error (a_class: ET_CLASS; a_parent: ET_PARENT; a_rename1, a_rename2: ET_RENAME) is
			-- Report VHRC-2 error: a feature name appears more
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vhrc2_error (a_class) then
				create an_error.make_vhrc2a (a_class, a_parent, a_rename1, a_rename2)
				report_validity_error (an_error)
			end
		end

	report_vhrc4a_error (a_class: ET_CLASS; a_parent: ET_PARENT; a_rename: ET_RENAME; f: ET_FEATURE) is
			-- Report VHRC-4 error: the Rename_pair
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vhrc4_error (a_class) then
				create an_error.make_vhrc4a (a_class, a_parent, a_rename, f)
				report_validity_error (an_error)
			end
		end

	report_vhrc4b_error (a_class: ET_CLASS; a_parent: ET_PARENT; a_rename: ET_RENAME; f: ET_FEATURE) is
			-- Report VHRC-4 error: the Rename_pair
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vhrc4_error (a_class) then
				create an_error.make_vhrc4b (a_class, a_parent, a_rename, f)
				report_validity_error (an_error)
			end
		end

	report_vhrc4c_error (a_class: ET_CLASS; a_parent: ET_PARENT; a_rename: ET_RENAME; f: ET_FEATURE) is
			-- Report VHRC-4 error: the Rename_pair `a_rename' has
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vhrc4_error (a_class) then
				create an_error.make_vhrc4c (a_class, a_parent, a_rename, f)
				report_validity_error (an_error)
			end
		end

	report_vhrc4d_error (a_class: ET_CLASS; a_parent: ET_PARENT; a_rename: ET_RENAME; f: ET_FEATURE) is
			-- Report VHRC-4 error: the Rename_pair `a_rename' has
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vhrc4_error (a_class) then
				create an_error.make_vhrc4d (a_class, a_parent, a_rename, f)
				report_validity_error (an_error)
			end
		end

	report_vhrc5a_error (a_class: ET_CLASS; a_parent: ET_PARENT; a_rename: ET_RENAME; f: ET_FEATURE) is
			-- Report VHRC-5 error: the Rename_pair `a_rename' has
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vhrc5_error (a_class) then
				create an_error.make_vhrc5a (a_class, a_parent, a_rename, f)
				report_validity_error (an_error)
			end
		end

	report_vjar0a_error (a_class: ET_CLASS; an_assignment: ET_ASSIGNMENT; a_source_type, a_target_type: ET_NAMED_TYPE) is
			-- Report VJAR error: the source expression of `an_assignment' does
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vjar_error (a_class) then
				create an_error.make_vjar0a (a_class, an_assignment, a_source_type, a_target_type)
				report_validity_error (an_error)
			end
		end

	report_vjar0b_error (a_class, a_class_impl: ET_CLASS; an_assignment: ET_ASSIGNMENT; a_source_type, a_target_type: ET_NAMED_TYPE) is
			-- Report VJAR error: the source expression of `an_assignment' does
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vjar_error (a_class) then
				create an_error.make_vjar0b (a_class, a_class_impl, an_assignment, a_source_type, a_target_type)
				report_validity_error (an_error)
			end
		end

	report_vjaw0a_error (a_class: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE) is
			-- Report VJAW error: `a_name' is supposed to be a Writable but
			-- the associated feature `a_feature' is not an attribute.
			--
			-- Only in ISE Eiffel.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vjaw_error (a_class) then
				create an_error.make_vjaw0a (a_class, a_name, a_feature)
				report_validity_error (an_error)
			end
		end

	report_vjaw0c_error (a_class: ET_CLASS; a_name: ET_IDENTIFIER; a_feature: ET_FEATURE) is
			-- Report VJAW error: `a_name' is supposed to be a Writable but
			-- it is a formal argument name of `a_feature'.
			--
			-- Only in ISE Eiffel.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vjaw_error (a_class) then
				create an_error.make_vjaw0c (a_class, a_name, a_feature)
				report_validity_error (an_error)
			end
		end

	report_vjrv0a_error (a_class: ET_CLASS; a_target: ET_WRITABLE; a_target_type: ET_NAMED_TYPE) is
			-- Report VJRV error: the type `a_target_type' of the target
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vjrv_error (a_class) then
				create an_error.make_vjrv0a (a_class, a_target, a_target_type)
				report_validity_error (an_error)
			end
		end

	report_vjrv0b_error (a_class, a_class_impl: ET_CLASS; a_target: ET_WRITABLE; a_target_type: ET_NAMED_TYPE) is
			-- Report VJRV error: the type `a_target_type' of the target
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vjrv_error (a_class) then
				create an_error.make_vjrv0b (a_class, a_class_impl, a_target, a_target_type)
				report_validity_error (an_error)
			end
		end

	report_vkcn1a_error (a_class: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS) is
			-- Report VKCN-1 error: `a_feature' of class `a_target', appearing
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vkcn1_error (a_class) then
				create an_error.make_vkcn1a (a_class, a_name, a_feature, a_target)
				report_validity_error (an_error)
			end
		end

	report_vkcn1c_error (a_class: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE) is
			-- Report VKCN-1 error: `a_feature' of `a_class', appearing
			-- in the unqualified instruction call `a_name' in `a_class',
			-- is not a procedure.
			--
			-- ETL2: p.341
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vkcn1_error (a_class) then
				create an_error.make_vkcn1c (a_class, a_name, a_feature)
				report_validity_error (an_error)
			end
		end

	report_vkcn2a_error (a_class: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS) is
			-- Report VKCN-2 error: `a_feature' of class `a_target', appearing
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vkcn2_error (a_class) then
				create an_error.make_vkcn2a (a_class, a_name, a_feature, a_target)
				report_validity_error (an_error)
			end
		end

	report_vkcn2c_error (a_class: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE) is
			-- Report VKCN-2 error: `a_feature' of `a_class', appearing
			-- in the unqualified expression call `a_name' in `a_class', is not
			-- an attribute or a function.
			--
			-- ETL2: p.341
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vkcn2_error (a_class) then
				create an_error.make_vkcn2c (a_class, a_name, a_feature)
				report_validity_error (an_error)
			end
		end

	report_vlel1a_error (a_class: ET_CLASS; a_parent: ET_PARENT; all1, all2: ET_ALL_EXPORT) is
			-- Report VLEL-1 error: the 'all' keyword appears twice in the
			-- Export subclause of parent `a_parent' in `a_class'.
			--
			-- ETL2: p.102
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
			all1_not_void: all1 /= Void
			all2_not_void: all2 /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vlel1_error (a_class) then
				create an_error.make_vlel1a (a_class, a_parent, all1, all2)
				report_validity_error (an_error)
			end
		end

	report_vlel2a_error (a_class: ET_CLASS; a_parent: ET_PARENT; f: ET_FEATURE_NAME) is
			-- Report VLEL-2 error: the Export subclause of `a_parent'
			-- in `a_class' lists `f' which is not the final name in
			-- `a_class' of a feature inherited from `a_parent'.
			--
			-- ETL2: p.102
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
			f_not_void: f /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vlel2_error (a_class) then
				create an_error.make_vlel2a (a_class, a_parent, f)
				report_validity_error (an_error)
			end
		end

	report_vlel3a_error (a_class: ET_CLASS; a_parent: ET_PARENT; f1, f2: ET_FEATURE_NAME) is
			-- Report VLEL-3 error: feature name `f2' appears twice in the
			-- Export subclause of parent `a_parent' in `a_class'.
			--
			-- ETL2: p.102
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vlel3_error (a_class) then
				create an_error.make_vlel3a (a_class, a_parent, f1, f2)
				report_validity_error (an_error)
			end
		end

	report_vmfn0a_error (a_class: ET_CLASS; f1, f2: ET_FEATURE) is
			-- Report VMFN error: `a_class' introduced two features
			-- `f1' and `f2' with the same name.
			--
			-- ETL2: p.188
			-- ETR: p.42
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vmfn_error (a_class) then
				create an_error.make_vmfn0a (a_class, f1, f2)
				report_validity_error (an_error)
			end
		end

	report_vmfn0b_error (a_class: ET_CLASS; f1: ET_PARENT_FEATURE; f2: ET_FEATURE) is
			-- Report VMFN error: `a_class' introduces feature `f2'
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vmfn_error (a_class) then
				if is_ise then
					create an_error.make_vmfn0b (a_class, f1, f2)
					an_error.set_compilers (False)
					an_error.set_ise_reported (True)
					an_error.set_ise_fatal (True)
					report_validity_error (an_error)
				end
			end
		end

	report_vmfn0c_error (a_class: ET_CLASS; f1, f2: ET_PARENT_FEATURE) is
			-- Report VMFN error: `a_class' inherits two effective
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vmfn_error (a_class) then
				create an_error.make_vmfn0c (a_class, f1, f2)
				report_validity_error (an_error)
			end
		end

	report_vmfn2a_error (a_class: ET_CLASS; f1, f2: ET_PARENT_FEATURE) is
			-- Report VMFN-2 error: features `f1' and `f2' are shared,
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vmfn2_error (a_class) then
				create an_error.make_vmfn2a (a_class, f1, f2)
				report_validity_error (an_error)
			end
		end

	report_vmfn2b_error (a_class: ET_CLASS; f1, f2: ET_PARENT_FEATURE) is
			-- Report VMFN-2 error: features `f1' and `f2' are shared,
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vmfn2_error (a_class) then
				create an_error.make_vmfn2b (a_class, f1, f2)
				report_validity_error (an_error)
			end
		end

	report_vmrc2a_error (a_class: ET_CLASS; replicated_features: DS_LIST [ET_PARENT_FEATURE]) is
			-- Report VMRC-2 error: the replicated features in
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
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vmrc2_error (a_class) then
				create an_error.make_vmrc2a (a_class, replicated_features)
				an_error.set_se_reported (False)
				report_validity_error (an_error)
			end
		end

	report_vmrc2b_error (a_class: ET_CLASS; replicated_features: DS_LIST [ET_PARENT_FEATURE]) is
			-- Report VMRC-2 error: the replicated features in
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
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vmrc2_error (a_class) then
				create an_error.make_vmrc2b (a_class, replicated_features)
				an_error.set_se_reported (False)
				report_validity_error (an_error)
			end
		end

	report_vmss1a_error (a_class: ET_CLASS; a_parent: ET_PARENT; f: ET_FEATURE_NAME) is
			-- Report VMSS-1 error: the Select subclause of `a_parent'
			-- in `a_class' lists `f' which is not the final name in
			-- `a_class' of a feature inherited from `a_parent'.
			--
			-- ETL2: p.192
			-- ETR: p.44
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vmss1_error (a_class) then
				create an_error.make_vmss1a (a_class, a_parent, f)
				report_validity_error (an_error)
			end
		end

	report_vmss2a_error (a_class: ET_CLASS; a_parent: ET_PARENT; f1, f2: ET_FEATURE_NAME) is
			-- Report VMSS-2 error: feature name `f2' appears twice
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vmss2_error (a_class) then
				create an_error.make_vmss2a (a_class, a_parent, f1, f2)
				report_validity_error (an_error)
			end
		end

	report_vmss3a_error (a_class: ET_CLASS; a_feature: ET_PARENT_FEATURE) is
			-- Report VMSS-3 error: the Select subclause
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vmss3_error (a_class) then
				if is_ise or is_ge then
					create an_error.make_vmss3a (a_class, a_feature)
					an_error.set_se_reported (False)
					an_error.set_se_fatal (False)
					report_validity_error (an_error)
				end
			end
		end

	report_vomb1a_error (a_class: ET_CLASS; an_expression: ET_EXPRESSION; a_type: ET_NAMED_TYPE) is
			-- Report VOMB-1 error: the inspect expression `an_expression'
			-- in `a_class' is of type `a_type' which is not "INTEGER" or
			-- "CHARACTER".
			--
			-- ETL2: p.239
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_expression_not_void: an_expression /= Void
			a_type_not_void: a_type /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vomb1_error (a_class) then
				create an_error.make_vomb1a (a_class, an_expression, a_type)
				report_validity_error (an_error)
			end
		end

	report_vomb1b_error (a_class, a_class_impl: ET_CLASS; an_expression: ET_EXPRESSION; a_type: ET_NAMED_TYPE) is
			-- Report VOMB-1 error: the inspect expression `an_expression'
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vomb1_error (a_class) then
				create an_error.make_vomb1b (a_class, a_class_impl, an_expression, a_type)
				report_validity_error (an_error)
			end
		end

	report_vomb2a_error (a_class: ET_CLASS; a_constant: ET_CHOICE_CONSTANT; a_constant_type, a_value_type: ET_NAMED_TYPE) is
			-- Report VOMB-2 error: the inspect constant `a_constant' in `a_class'
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vomb2_error (a_class) then
				create an_error.make_vomb2a (a_class, a_constant, a_constant_type, a_value_type)
				report_validity_error (an_error)
			end
		end

	report_vomb2b_error (a_class, a_class_impl: ET_CLASS; a_constant: ET_CHOICE_CONSTANT;
		a_constant_type, a_value_type: ET_NAMED_TYPE) is
			-- Report VOMB-2 error: the inspect constant `a_constant' in
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vomb2_error (a_class) then
				create an_error.make_vomb2b (a_class, a_class_impl, a_constant, a_constant_type, a_value_type)
				report_validity_error (an_error)
			end
		end

	report_vpca1a_error (a_class: ET_CLASS; a_name: ET_FEATURE_NAME) is
			-- Report VPCA-1 error: `a_name', appearing in an unqualified
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vpca1_error (a_class) then
				create an_error.make_vpca1a (a_class, a_name)
				report_validity_error (an_error)
			end
		end

	report_vpca1b_error (a_class: ET_CLASS; a_name: ET_FEATURE_NAME; a_target: ET_CLASS) is
			-- Report VPCA-1 error: `a_name', appearing in a qualified
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vpca1_error (a_class) then
				create an_error.make_vpca1b (a_class, a_name, a_target)
				report_validity_error (an_error)
			end
		end

	report_vpca2a_error (a_class: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS) is
			-- Report VPCA-2 error: `a_feature' of class `a_target',
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vpca2_error (a_class) then
				create an_error.make_vpca2a (a_class, a_name, a_feature, a_target)
				report_validity_error (an_error)
			end
		end

	report_vpca2b_error (a_class, a_class_impl: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS) is
			-- Report VPCA-2 error: `a_feature' of class `a_target'
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vpca2_error (a_class) then
				create an_error.make_vpca2b (a_class, a_class_impl, a_name, a_feature, a_target)
				report_validity_error (an_error)
			end
		end

	report_vpca3a_error (a_class: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS) is
			-- Report VPCA-3 error: the number of actual arguments in
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vpca3_error (a_class) then
				create an_error.make_vpca3a (a_class, a_name, a_feature, a_target)
				report_validity_error (an_error)
			end
		end

	report_vpca3c_error (a_class: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE) is
			-- Report VPCA-3 error: the number of actual arguments in
			-- the unqualified call agent `a_name' appearing in `a_class' is not the
			-- same as the number of formal arguments of `a_feature' in `a_class'.
			--
			-- ETL3 (4.82-00-00): p.581
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vpca3_error (a_class) then
				create an_error.make_vpca3c (a_class, a_name, a_feature)
				report_validity_error (an_error)
			end
		end

	report_vpca4a_error (a_class: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE;
		a_target: ET_CLASS; arg: INTEGER; an_actual, a_formal: ET_NAMED_TYPE) is
			-- Report VPCA-4 error: the `arg'-th actual argument in the qualified
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vpca4_error (a_class) then
				create an_error.make_vpca4a (a_class, a_name, a_feature, a_target, arg, an_actual, a_formal)
				report_validity_error (an_error)
			end
		end

	report_vpca4b_error (a_class, a_class_impl: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE;
		a_target: ET_CLASS; arg: INTEGER; an_actual, a_formal: ET_NAMED_TYPE) is
			-- Report VPCA-4 error: the `arg'-th actual argument in the qualified
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vpca4_error (a_class) then
				create an_error.make_vpca4b (a_class, a_class_impl, a_name, a_feature, a_target, arg, an_actual, a_formal)
				report_validity_error (an_error)
			end
		end

	report_vpca4c_error (a_class: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE;
		arg: INTEGER; an_actual, a_formal: ET_NAMED_TYPE) is
			-- Report VPCA-4 error: the `arg'-th actual argument in the unqualified
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vpca4_error (a_class) then
				create an_error.make_vpca4c (a_class, a_name, a_feature, arg, an_actual, a_formal)
				report_validity_error (an_error)
			end
		end

	report_vpca4d_error (a_class, a_class_impl: ET_CLASS; a_name: ET_FEATURE_NAME;
		a_feature: ET_FEATURE; arg: INTEGER; an_actual, a_formal: ET_NAMED_TYPE) is
			-- Report VPCA-4 error: the `arg'-th actual argument in the unqualified
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vpca4_error (a_class) then
				create an_error.make_vpca4d (a_class, a_class_impl, a_name, a_feature, arg, an_actual, a_formal)
				report_validity_error (an_error)
			end
		end

	report_vpca5a_error (a_class: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE;
		a_target: ET_CLASS; arg: INTEGER; an_actual, a_formal: ET_NAMED_TYPE) is
			-- Report VPCA-5 error: the type specified for the `arg'-th
			-- actual argument in the qualified call agent `a_name' appearing
			-- in `a_class' does not conform to the corresponding formal
			-- argument of `a_feature' in class `a_target'.
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vpca5_error (a_class) then
				create an_error.make_vpca5a (a_class, a_name, a_feature, a_target, arg, an_actual, a_formal)
				report_validity_error (an_error)
			end
		end

	report_vpca5b_error (a_class, a_class_impl: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE;
		a_target: ET_CLASS; arg: INTEGER; an_actual, a_formal: ET_NAMED_TYPE) is
			-- Report VPCA-5 error: the type specified for the `arg'-th actual
			-- argument in the qualified call agent `a_name' appearing in
			-- `a_class_impl' and viewed from one of its descendants `a_class'
			-- does not conform to the corresponding formal argument of `a_feature'
			-- in class `a_target'.
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vpca5_error (a_class) then
				create an_error.make_vpca5b (a_class, a_class_impl, a_name, a_feature, a_target, arg, an_actual, a_formal)
				report_validity_error (an_error)
			end
		end

	report_vpca5c_error (a_class: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE;
		arg: INTEGER; an_actual, a_formal: ET_NAMED_TYPE) is
			-- Report VPCA-5 error: the type specified for the `arg'-th actual
			-- argument in the unqualified call agent `a_name' appearing in
			-- `a_class' does not conform to the corresponding formal argument
			-- of `a_feature' in `a_class'.
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vpca5_error (a_class) then
				create an_error.make_vpca5c (a_class, a_name, a_feature, arg, an_actual, a_formal)
				report_validity_error (an_error)
			end
		end

	report_vpca5d_error (a_class, a_class_impl: ET_CLASS; a_name: ET_FEATURE_NAME;
		a_feature: ET_FEATURE; arg: INTEGER; an_actual, a_formal: ET_NAMED_TYPE) is
			-- Report VPCA-5 error: the type speciified for the `arg'-th actual
			-- argument in the unqualified call agent `a_name' appearing in
			-- `a_class_impl' and viewed from one of its descendants `a_class'
			-- does not conform to the corresponding formal argument of `a_feature'
			-- in `a_class_impl'.
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vpca5_error (a_class) then
				create an_error.make_vpca5d (a_class, a_class_impl, a_name, a_feature, arg, an_actual, a_formal)
				report_validity_error (an_error)
			end
		end

	report_vqmc1a_error (a_class: ET_CLASS; an_attribute: ET_CONSTANT_ATTRIBUTE) is
			-- Report VQMC-1 error: `an_attribute' introduces a boolean constant
			-- but its type is not "BOOLEAN".
			--
			-- ETL2: p.264
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_attribute_not_void: an_attribute /= Void
			boolean_constant: an_attribute.constant.is_boolean_constant
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vqmc1_error (a_class) then
				create an_error.make_vqmc1a (a_class, an_attribute)
				report_validity_error (an_error)
			end
		end

	report_vqmc1b_error (a_class, a_class_impl: ET_CLASS; an_attribute: ET_CONSTANT_ATTRIBUTE) is
			-- Report VQMC-1 error: `an_attribute' introduces a boolean constant
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vqmc1_error (a_class) then
				create an_error.make_vqmc1b (a_class, a_class_impl, an_attribute)
				report_validity_error (an_error)
			end
		end

	report_vqmc2a_error (a_class: ET_CLASS; an_attribute: ET_CONSTANT_ATTRIBUTE) is
			-- Report VQMC-2 error: `an_attribute' introduces a character constant
			-- but its type is not "CHARACTER".
			--
			-- ETL2: p.264
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_attribute_not_void: an_attribute /= Void
			character_constant: an_attribute.constant.is_character_constant
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vqmc2_error (a_class) then
				create an_error.make_vqmc2a (a_class, an_attribute)
				report_validity_error (an_error)
			end
		end

	report_vqmc2b_error (a_class, a_class_impl: ET_CLASS; an_attribute: ET_CONSTANT_ATTRIBUTE) is
			-- Report VQMC-2 error: `an_attribute' introduces a character constant
			-- but its type is not "CHARACTER" when viewed from `a_class' (a descendant
			-- of `a_class_impl' where `an_attribute' has been declared).
			--
			-- ETL2: p.264
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			an_attribute_not_void: an_attribute /= Void
			character_constant: an_attribute.constant.is_character_constant
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vqmc2_error (a_class) then
				create an_error.make_vqmc2b (a_class, a_class_impl, an_attribute)
				report_validity_error (an_error)
			end
		end

	report_vqmc3a_error (a_class: ET_CLASS; an_attribute: ET_CONSTANT_ATTRIBUTE) is
			-- Report VQMC-3 error: `an_attribute' introduces an integer constant
			-- but its type is not "INTEGER".
			--
			-- ETL2: p.264
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_attribute_not_void: an_attribute /= Void
			integer_constant: an_attribute.constant.is_integer_constant
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vqmc3_error (a_class) then
				create an_error.make_vqmc3a (a_class, an_attribute)
				report_validity_error (an_error)
			end
		end

	report_vqmc3b_error (a_class, a_class_impl: ET_CLASS; an_attribute: ET_CONSTANT_ATTRIBUTE) is
			-- Report VQMC-3 error: `an_attribute' introduces an integer constant
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vqmc3_error (a_class) then
				create an_error.make_vqmc3b (a_class, a_class_impl, an_attribute)
				report_validity_error (an_error)
			end
		end

	report_vqmc4a_error (a_class: ET_CLASS; an_attribute: ET_CONSTANT_ATTRIBUTE) is
			-- Report VQMC-4 error: `an_attribute' introduces a real constant
			-- but its type is not "REAL" or "DOUBLE".
			--
			-- ETL2: p.264
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_attribute_not_void: an_attribute /= Void
			real_constant: an_attribute.constant.is_real_constant
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vqmc4_error (a_class) then
				create an_error.make_vqmc4a (a_class, an_attribute)
				report_validity_error (an_error)
			end
		end

	report_vqmc4b_error (a_class, a_class_impl: ET_CLASS; an_attribute: ET_CONSTANT_ATTRIBUTE) is
			-- Report VQMC-4 error: `an_attribute' introduces a real constant
			-- but its type is not "REAL" or "DOUBLE" when viewed from `a_class' (a descendant
			-- of `a_class_impl' where `an_attribute' has been declared).
			--
			-- ETL2: p.264
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			an_attribute_not_void: an_attribute /= Void
			real_constant: an_attribute.constant.is_real_constant
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vqmc4_error (a_class) then
				create an_error.make_vqmc4b (a_class, a_class_impl, an_attribute)
				report_validity_error (an_error)
			end
		end

	report_vqmc5a_error (a_class: ET_CLASS; an_attribute: ET_CONSTANT_ATTRIBUTE) is
			-- Report VQMC-5 error: `an_attribute' introduces a string constant
			-- but its type is not "STRING".
			--
			-- ETL2: p.264
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_attribute_not_void: an_attribute /= Void
			string_constant: an_attribute.constant.is_string_constant
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vqmc5_error (a_class) then
				create an_error.make_vqmc5a (a_class, an_attribute)
				report_validity_error (an_error)
			end
		end

	report_vqmc5b_error (a_class, a_class_impl: ET_CLASS; an_attribute: ET_CONSTANT_ATTRIBUTE) is
			-- Report VQMC-5 error: `an_attribute' introduces a string constant
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vqmc5_error (a_class) then
				create an_error.make_vqmc5b (a_class, a_class_impl, an_attribute)
				report_validity_error (an_error)
			end
		end

	report_vqmc6a_error (a_class: ET_CLASS; an_attribute: ET_CONSTANT_ATTRIBUTE) is
			-- Report VQMC-6 error: `an_attribute' introduces a bit constant
			-- but its type is not a Bit_type.
			--
			-- ETL2: p.264
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_attribute_not_void: an_attribute /= Void
			bit_constant: an_attribute.constant.is_bit_constant
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vqmc6_error (a_class) then
				create an_error.make_vqmc6a (a_class, an_attribute)
				report_validity_error (an_error)
			end
		end

	report_vqmc6b_error (a_class, a_class_impl: ET_CLASS; an_attribute: ET_CONSTANT_ATTRIBUTE) is
			-- Report VQMC-6 error: `an_attribute' introduces a bit constant
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vqmc6_error (a_class) then
				create an_error.make_vqmc6b (a_class, a_class_impl, an_attribute)
				report_validity_error (an_error)
			end
		end

	report_vqui0a_error (a_class: ET_CLASS; a_unique: ET_UNIQUE_ATTRIBUTE) is
			-- Report VQUI error: the type of `a_unique' is not "INTEGER".
			--
			-- ETL2: p.266
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_unique_not_void: a_unique /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vqui_error (a_class) then
				create an_error.make_vqui0a (a_class, a_unique)
				report_validity_error (an_error)
			end
		end

	report_vqui0b_error (a_class, a_class_impl: ET_CLASS; a_unique: ET_UNIQUE_ATTRIBUTE) is
			-- Report VQUI error: the type of `a_unique' is not "INTEGER"
			-- when viewed from `a_class' (a descendant of `a_class_impl'
			-- where `a_unique' has been declared).
			--
			-- ETL2: p.266
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_unique_not_void: a_unique /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vqui_error (a_class) then
				create an_error.make_vqui0b (a_class, a_class_impl, a_unique)
				report_validity_error (an_error)
			end
		end

	report_vreg0a_error (a_class: ET_CLASS; arg1, arg2: ET_FORMAL_ARGUMENT; f: ET_FEATURE) is
			-- Report VREG error: `arg1' and `arg2' have the same
			-- name in feature `f' in `a_class'.
			--
			-- ETL2: p.110
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			arg1_not_void: arg1 /= Void
			arg2_not_void: arg2 /= Void
			f_not_void: f /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vreg_error (a_class) then
				create an_error.make_vreg0a (a_class, arg1, arg2, f)
				report_validity_error (an_error)
			end
		end

	report_vreg0b_error (a_class: ET_CLASS; local1, local2: ET_LOCAL_VARIABLE; f: ET_FEATURE) is
			-- Report VREG error: `local1' and `local2' have the same
			-- name in feature `f' in `a_class'.
			--
			-- ETL2: p.110
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			local1_not_void: local1 /= Void
			local2_not_void: local2 /= Void
			f_not_void: f /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vreg_error (a_class) then
				create an_error.make_vreg0b (a_class, local1, local2, f)
				report_validity_error (an_error)
			end
		end

	report_vrfa0a_error (a_class: ET_CLASS; arg: ET_FORMAL_ARGUMENT; f1, f2: ET_FEATURE) is
			-- Report VRFA error: `arg' in feature `f1' has
			-- the same name as feature `f2' in `a_class'.
			--
			-- ETL2: p.110
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			arg_not_void: arg /= Void
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vrfa_error (a_class) then
				create an_error.make_vrfa0a (a_class, arg, f1, f2)
				report_validity_error (an_error)
			end
		end

	report_vrle1a_error (a_class: ET_CLASS; a_local: ET_LOCAL_VARIABLE; f1, f2: ET_FEATURE) is
			-- Report VRLE-1 error: `a_local' in feature `f1' has
			-- the same name as feature `f2' in `a_class'.
			--
			-- ETL2: p.115
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_local_not_void: a_local /= Void
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vrle1_error (a_class) then
				create an_error.make_vrle1a (a_class, a_local, f1, f2)
				report_validity_error (an_error)
			end
		end

	report_vrle2a_error (a_class: ET_CLASS; a_local: ET_LOCAL_VARIABLE; f: ET_FEATURE; arg: ET_FORMAL_ARGUMENT) is
			-- Report VRLE-2 error: `a_local' in feature `f' has
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vrle2_error (a_class) then
				create an_error.make_vrle2a (a_class, a_local, f, arg)
				report_validity_error (an_error)
			end
		end

	report_vscn0a_error (a_class: ET_CLASS; other_cluster: ET_CLUSTER; other_filename: STRING) is
			-- Report VSCN error: `a_class' also appears in `other_cluster'.
			--
			-- ETL2: p.38
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			other_cluster_not_void: other_cluster /= Void
			other_filename_not_void: other_filename /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vscn_error (a_class) then
				create an_error.make_vscn0a (a_class, other_cluster, other_filename)
				report_validity_error (an_error)
			end
		end

	report_vscn0b_error (a_class: ET_CLASS; other_cluster: ET_CLUSTER; other_filename: STRING) is
			-- Report VSCN error: `a_class' also appears in `other_cluster'.
			--
			-- ETL2: p.38
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_class_in_dotnet_assembly: a_class.is_in_dotnet_assembly
			other_cluster_not_void: other_cluster /= Void
			other_filename_not_void: other_filename /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vscn_error (a_class) then
				create an_error.make_vscn0b (a_class, other_cluster, other_filename)
				report_validity_error (an_error)
			end
		end

	report_vtat1a_error (a_class: ET_CLASS; a_type: ET_LIKE_FEATURE) is
			-- Report VTAT error: the anchor in the Anchored_type
			-- must be the final name of a query in `a_class'.
			--
			-- ETL2: p.214
			-- ETL3 (4.82-00-00): p.252
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vtat_error (a_class) then
				create an_error.make_vtat1a (a_class, a_type)
				report_validity_error (an_error)
			end
		end

	report_vtat1b_error (a_class: ET_CLASS; a_feature: ET_FEATURE; a_type: ET_LIKE_FEATURE) is
			-- Report VTAT error: the anchor in the
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vtat_error (a_class) then
				create an_error.make_vtat1b (a_class, a_feature, a_type)
				report_validity_error (an_error)
			end
		end

	report_vtat2a_error (a_class: ET_CLASS; a_cycle: DS_LIST [ET_LIKE_IDENTIFIER]) is
			-- Report VTAT error: the anchors in `a_cycle'
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
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vtat_error (a_class) then
				create an_error.make_vtat2a (a_class, a_cycle)
				report_validity_error (an_error)
			end
		end

	report_vtbt0a_error (a_class: ET_CLASS; a_type: ET_BIT_FEATURE) is
			-- Report VTBT error: the identifier in Bit_type
			-- must be the final name of a constant attribute of
			-- type INTEGER.
			--
			-- ETL2: p.210
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vtbt_error (a_class) then
				create an_error.make_vtbt0a (a_class, a_type)
				report_validity_error (an_error)
			end
		end

	report_vtbt0b_error (a_class: ET_CLASS; a_type: ET_BIT_FEATURE) is
			-- Report VTBT error: the identifier in
			-- Bit_type must be the final name of a feature.
			--
			-- ETL2: p.210
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vtbt_error (a_class) then
				create an_error.make_vtbt0b (a_class, a_type)
				report_validity_error (an_error)
			end
		end

	report_vtbt0c_error (a_class: ET_CLASS; a_type: ET_BIT_TYPE) is
			-- Report VTBT error: size for Bit_type must
			-- be a positive integer constant.
			--
			-- ETL2: p.210
			-- ETR: p.47
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vtbt_error (a_class) then
				create an_error.make_vtbt0c (a_class, a_type)
				an_error.set_ise_reported (False)
				report_validity_error (an_error)
			end
		end

	report_vtbt0d_error (a_class: ET_CLASS; a_type: ET_BIT_TYPE) is
			-- Report VTBT error: size for Bit_type must
			-- be a positive integer constant but it is actually
			-- equal to -0.
			--
			-- ETL2: p.210
			-- ETR: p.47
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if is_se or is_pedantic then
				if reportable_vtbt_error (a_class) then
					create an_error.make_vtbt0d (a_class, a_type)
					an_error.set_ise_reported (False)
					an_error.set_ise_fatal (False)
					report_validity_error (an_error)
				end
			end
		end

	report_vtcg3a_error (a_class: ET_CLASS; a_type: ET_CLASS_TYPE; an_actual, a_constraint: ET_TYPE) is
			-- Report VTCG-3 error: actual generic paramater
			-- `an_actual' of `a_type' in `a_class' does not conform to
			-- constraint `a_constraint'.
			--
			-- ETL2: p.203
			-- ETR: p.46
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
			an_actual_not_void: an_actual /= Void
			a_constraint_not_void: a_constraint /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vtcg3_error (a_class) then
				create an_error.make_vtcg3a (a_class, a_type, an_actual, a_constraint)
				report_validity_error (an_error)
			end
		end

	report_vtcg4a_error (a_class: ET_CLASS; a_position: ET_POSITION; an_actual_index: INTEGER;
		a_name: ET_FEATURE_NAME; an_actual_base_class, a_generic_class: ET_CLASS) is
			-- Report VTCG-4 error: `an_actual_base_class' does not make
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vtcg4_error (a_class) then
				create an_error.make_vtcg4a (a_class, a_position, an_actual_index, a_name, an_actual_base_class, a_generic_class)
				report_validity_error (an_error)
			end
		end

	report_vtcg4b_error (a_class, a_class_impl: ET_CLASS; a_position: ET_POSITION; an_actual_index: INTEGER;
		a_name: ET_FEATURE_NAME; an_actual_base_class, a_generic_class: ET_CLASS) is
			-- Report VTCG-4 error: `an_actual_base_class' does not make
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vtcg4_error (a_class) then
				create an_error.make_vtcg4b (a_class, a_class_impl, a_position, an_actual_index, a_name, an_actual_base_class, a_generic_class)
				report_validity_error (an_error)
			end
		end

	report_vtcg4c_error (a_class: ET_CLASS; a_position: ET_POSITION; an_actual_index: INTEGER;
		a_name: ET_FEATURE_NAME; an_actual: ET_FORMAL_PARAMETER; a_generic_class: ET_CLASS) is
			-- Report VTCG-4 error: `an_actual', which is a formal generic parameter
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vtcg4_error (a_class) then
				create an_error.make_vtcg4c (a_class, a_position, an_actual_index, a_name, an_actual, a_generic_class)
				report_validity_error (an_error)
			end
		end

	report_vtcg4d_error (a_class, a_class_impl: ET_CLASS; a_position: ET_POSITION; an_actual_index: INTEGER;
		a_name: ET_FEATURE_NAME; an_actual: ET_FORMAL_PARAMETER; a_generic_class: ET_CLASS) is
			-- Report VTCG-4 error: `an_actual', which is a formal generic parameter
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vtcg4_error (a_class) then
				create an_error.make_vtcg4d (a_class, a_class_impl, a_position, an_actual_index, a_name, an_actual, a_generic_class)
				report_validity_error (an_error)
			end
		end

	report_vtct0a_error (a_class: ET_CLASS; a_type: ET_BASE_TYPE) is
			-- Report VTCT error: `a_type' based on unknown
			-- class in class `a_class'.
			--
			-- ETL2: p.199
			-- ETR: p.45
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vtct_error (a_class) then
				create an_error.make_vtct0a (a_class, a_type)
				report_validity_error (an_error)
			end
		end

	report_vtgc0a_error (a_class: ET_CLASS; cp: ET_FEATURE_NAME; a_constraint: ET_CLASS) is
			-- Report VTGC error: creation procedure name `cp'
			-- is not the final name of a feature in the base class
			-- `a_constraint' of a generic constraint of `a_class'.
			--
			-- ETL3 (4.82-00-00): p.261 (CTGC)
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			cp_not_void: cp /= Void
			a_constraint_not_void: a_constraint /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vtgc_error (a_class) then
				create an_error.make_vtgc0a (a_class, cp, a_constraint)
				report_validity_error (an_error)
			end
		end

	report_vtgc0b_error (a_class: ET_CLASS; cp: ET_FEATURE_NAME; f: ET_FEATURE; a_constraint: ET_CLASS) is
			-- Report VTGC error: creation procedure name `cp'
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vtgc_error (a_class) then
				create an_error.make_vtgc0b (a_class, cp, f, a_constraint)
				report_validity_error (an_error)
			end
		end

	report_vtug1a_error (a_class: ET_CLASS; a_type: ET_CLASS_TYPE) is
			-- Report VTUG-1 error: `a_type', which appears in
			-- source code of `a_class', has actual generic parameters
			-- but its base class is not generic.
			--
			-- ETL2: p.201
			-- ETR: p.46
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vtug1_error (a_class) then
				create an_error.make_vtug1a (a_class, a_type)
				report_validity_error (an_error)
			end
		end

	report_vtug2a_error (a_class: ET_CLASS; a_type: ET_CLASS_TYPE) is
			-- Report VTUG-2 error: `a_type', which appears
			-- in source code of `a_class', has the wrong number
			-- of actual generic parameters.
			--
			-- ETL2: p.201
			-- ETR: p.46
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vtug2_error (a_class) then
				create an_error.make_vtug2a (a_class, a_type)
				report_validity_error (an_error)
			end
		end

	report_vuar1a_error (a_class: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS) is
			-- Report VUAR-1 error: the number of actual arguments in
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vuar1_error (a_class) then
				create an_error.make_vuar1a (a_class, a_name, a_feature, a_target)
				report_validity_error (an_error)
			end
		end

	report_vuar1b_error (a_class: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE) is
			-- Report VUAR-1 error: the number of actual arguments in
			-- the unqualified call `a_name' appearing in `a_class' is not the
			-- same as the number of formal arguments of `a_feature' in `a_class'.
			--
			-- ETL2: p.369
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vuar1_error (a_class) then
				create an_error.make_vuar1b (a_class, a_name, a_feature)
				report_validity_error (an_error)
			end
		end

	report_vuar1c_error (a_class: ET_CLASS; a_label: ET_CALL_NAME) is
			-- Report VUAR-1 error: Tuple label calls cannot have arguments.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_label_not_void: a_label /= Void
			a_label_is_tuple_label: a_label.is_tuple_label
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vuar1_error (a_class) then
				create an_error.make_vuar1c (a_class, a_label)
				report_validity_error (an_error)
			end
		end

	report_vuar2a_error (a_class: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE;
		a_target: ET_CLASS; arg: INTEGER; an_actual, a_formal: ET_NAMED_TYPE) is
			-- Report VUAR-2 error: the `arg'-th actual argument in the qualified
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vuar2_error (a_class) then
				create an_error.make_vuar2a (a_class, a_name, a_feature, a_target, arg, an_actual, a_formal)
				report_validity_error (an_error)
			end
		end

	report_vuar2b_error (a_class, a_class_impl: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE;
		a_target: ET_CLASS; arg: INTEGER; an_actual, a_formal: ET_NAMED_TYPE) is
			-- Report VUAR-2 error: the `arg'-th actual argument in the qualified
			-- call `a_name' appearing in `a_class_impl' and viewed from one of its
			-- descendants `a_class' does not conform to the corresponding formal
			-- argument of `a_feature' in class `a_target'.
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vuar2_error (a_class) then
				create an_error.make_vuar2b (a_class, a_class_impl, a_name, a_feature, a_target, arg, an_actual, a_formal)
				report_validity_error (an_error)
			end
		end

	report_vuar2c_error (a_class: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE;
		arg: INTEGER; an_actual, a_formal: ET_NAMED_TYPE) is
			-- Report VUAR-2 error: the `arg'-th actual argument in the unqualified
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vuar2_error (a_class) then
				create an_error.make_vuar2c (a_class, a_name, a_feature, arg, an_actual, a_formal)
				report_validity_error (an_error)
			end
		end

	report_vuar2d_error (a_class, a_class_impl: ET_CLASS; a_name: ET_CALL_NAME;
		a_feature: ET_FEATURE; arg: INTEGER; an_actual, a_formal: ET_NAMED_TYPE) is
			-- Report VUAR-2 error: the `arg'-th actual argument in the unqualified
			-- call `a_name' appearing in `a_class_impl' and viewed from one of its
			-- descendants `a_class' does not conform to the corresponding formal
			-- argument of `a_feature' in `a_class_impl'.
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vuar2_error (a_class) then
				create an_error.make_vuar2d (a_class, a_class_impl, a_name, a_feature, arg, an_actual, a_formal)
				report_validity_error (an_error)
			end
		end

	report_vuar4a_error (a_class: ET_CLASS; a_name: ET_FEATURE_NAME) is
			-- Report VUAR-4 error: `a_name', appearing in an
			-- expression of Address form $`a_name' in `a_class', is
			-- not the final name of a feature in `a_class'.
			--
			-- ETL2: p.369
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vuar4_error (a_class) then
				create an_error.make_vuar4a (a_class, a_name)
				report_validity_error (an_error)
			end
		end

	report_vuex1a_error (a_class: ET_CLASS; a_name: ET_CALL_NAME) is
			-- Report VUEX-1 error: `a_name', appearing in an unqualified
			-- call in `a_class', is not the final name of a feature
			-- in `a_class'.
			--
			-- ETL2: p.368
			--
			-- Note: ISE Eiffel 5.4 reports this error as a VEEN.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vuex1_error (a_class) then
				create an_error.make_vuex1a (a_class, a_name)
				report_validity_error (an_error)
			end
		end

	report_vuex2a_error (a_class: ET_CLASS; a_name: ET_CALL_NAME; a_target: ET_CLASS) is
			-- Report VUEX-2 error: `a_name', appearing in a qualified
			-- call in `a_class', is not the final name of a feature
			-- in class `a_target'.
			--
			-- ETL2: p.368
			--
			-- Note: ISE Eiffel 5.4 reports this error as a VEEN.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_target_not_void: a_target /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vuex2_error (a_class) then
				create an_error.make_vuex2a (a_class, a_name, a_target)
				report_validity_error (an_error)
			end
		end

	report_vuex2b_error (a_class: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS) is
			-- Report VUEX-2 error: `a_feature' of class `a_target',
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vuex2_error (a_class) then
				create an_error.make_vuex2b (a_class, a_name, a_feature, a_target)
				report_validity_error (an_error)
			end
		end

	report_vuex2c_error (a_class, a_class_impl: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS) is
			-- Report VUEX-2 error: `a_feature' of class `a_target'
			-- is not exported to `a_class', one of the descendants
			-- of `a_class_impl' where the qualified call `a_name' appears.
			--
			-- ETL2: p.368
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_target_not_void: a_target /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vuex2_error (a_class) then
				create an_error.make_vuex2c (a_class, a_class_impl, a_name, a_feature, a_target)
				report_validity_error (an_error)
			end
		end

	report_vwbe0a_error (a_class: ET_CLASS; an_expression: ET_EXPRESSION; a_type: ET_NAMED_TYPE) is
			-- Report VWBE error: the boolean expression `an_expression'
			-- in `a_class' is of type `a_type' which is not "BOOLEAN".
			--
			-- ETL2: p.374
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_expression_not_void: an_expression /= Void
			a_type_not_void: a_type /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vwbe_error (a_class) then
				create an_error.make_vwbe0a (a_class, an_expression, a_type)
				report_validity_error (an_error)
			end
		end

	report_vwbe0b_error (a_class, a_class_impl: ET_CLASS; an_expression: ET_EXPRESSION; a_type: ET_NAMED_TYPE) is
			-- Report VWBE error: the boolean expression `an_expression'
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vwbe_error (a_class) then
				create an_error.make_vwbe0b (a_class, a_class_impl, an_expression, a_type)
				report_validity_error (an_error)
			end
		end

	report_vweq0a_error (a_class: ET_CLASS; an_expression: ET_EQUALITY_EXPRESSION;
		a_type1, a_type2: ET_NAMED_TYPE) is
			-- Report VWEQ error: none of the operands of the equality
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vweq_error (a_class) then
				create an_error.make_vweq0a (a_class, an_expression, a_type1, a_type2)
				report_validity_error (an_error)
			end
		end

	report_vweq0b_error (a_class, a_class_impl: ET_CLASS; an_expression: ET_EQUALITY_EXPRESSION;
		a_type1, a_type2: ET_NAMED_TYPE) is
			-- Report VWEQ error: none of the operands of the equality
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vweq_error (a_class) then
				create an_error.make_vweq0b (a_class, a_class_impl, an_expression, a_type1, a_type2)
				report_validity_error (an_error)
			end
		end

	report_vwst1a_error (a_class: ET_CLASS; a_name: ET_FEATURE_NAME) is
			-- Report VWST-1 error: `a_name', appearing in a strip
			-- expression in `a_class', is not the final name of a feature
			-- in `a_class'.
			--
			-- ETL2: p.397
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vwst1_error (a_class) then
				create an_error.make_vwst1a (a_class, a_name)
				report_validity_error (an_error)
			end
		end

	report_vwst1b_error (a_class: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE) is
			-- Report VWST-1 error: `a_feature', whose name `a_name' appears
			-- in a strip expression in `a_class', is not the final name of
			-- an attribute in `a_class'.
			--
			-- ETL2: p.397
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vwst1_error (a_class) then
				create an_error.make_vwst1b (a_class, a_name, a_feature)
				report_validity_error (an_error)
			end
		end

	report_vwst2a_error (a_class: ET_CLASS; a_name1, a_name2: ET_FEATURE_NAME) is
			-- Report VWST-2 error: an atttribute name appears twice in
			-- a strip expression in `a_class'.
			--
			-- ETL2: p.397
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name1_not_void: a_name1 /= Void
			a_name2_not_void: a_name2 /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vwst2_error (a_class) then
				create an_error.make_vwst2a (a_class, a_name1, a_name2)
				report_validity_error (an_error)
			end
		end

	report_vxrt0a_error (a_class: ET_CLASS; a_retry: ET_RETRY_INSTRUCTION) is
			-- Report VXRT error: instruction `a_retry' does not
			-- appear in a rescue clause in `a_class'.
			--
			-- ETL2: p.256
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_retry_not_void: a_retry /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vxrt_error (a_class) then
				create an_error.make_vxrt0a (a_class, a_retry)
				report_validity_error (an_error)
			end
		end

	report_gvagp0a_error (a_class: ET_CLASS; anc1, anc2: ET_BASE_TYPE) is
			-- Report GVAGP error: `anc1' and `anc2' are two ancestors
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvagp_error (a_class) then
				create an_error.make_gvagp0a (a_class, anc1, anc2)
				an_error.set_ise_reported (False)
				an_error.set_se_reported (False)
				an_error.set_ve_reported (False)
				report_validity_error (an_error)
			end
		end

	report_gvhpr4a_error (a_class: ET_CLASS; a_parent: ET_BIT_N) is
			-- Report GVHPR-4 error: cannot inherit from Bit_type.
			--
			-- Not in ETL as validity error but as syntax error
			-- GVHPR-4: See ETL2 VHPR
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvhpr4_error (a_class) then
				create an_error.make_gvhpr4a (a_class, a_parent)
				report_validity_error (an_error)
			end
		end

	report_gvhpr5a_error (a_class: ET_CLASS; a_parent: ET_TUPLE_TYPE) is
			-- Report GVHPR-5 error: cannot inherit from Tuple_type.
			--
			-- Not in ETL as validity error but as syntax error
			-- GVHPR-5: See ETL2 VHPR
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvhpr5_error (a_class) then
				create an_error.make_gvhpr5a (a_class, a_parent)
				report_validity_error (an_error)
			end
		end

	report_gvhso1a_error (a_class: ET_CLASS) is
			-- Report GVHSO-1 error: `a_class' implicitly inherits
			-- from unknown class SYSTEM_OBJECT.
			--
			-- Not in ETL
			-- GVHSO: see VHAY
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvhso1_error (a_class) then
				create an_error.make_gvhso1a (a_class)
				report_validity_error (an_error)
			end
		end

	report_gvhso2a_error (a_class: ET_CLASS) is
			-- Report GVHSO-2 error: `a_class' implicitly inherits
			-- from class SYSTEM_OBJECT but SYSTEM_OBJECT is not a .NET class.
			--
			-- Not in ETL
			-- GVHSO: see VHAY
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvhso2_error (a_class) then
				create an_error.make_gvhso2a (a_class)
				report_validity_error (an_error)
			end
		end

	report_gvkbs1a_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-1 error: wrong signature for 'ANY.twin' built-in
			-- routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs1_error (a_class) then
				create an_error.make_gvkbs1a (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs1b_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-1 error: wrong signature for 'ANY.standard_is_equal'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs1_error (a_class) then
				create an_error.make_gvkbs1b (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs1c_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-1 error: wrong signature for 'ANY.standard_copy'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs1_error (a_class) then
				create an_error.make_gvkbs1c (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs1d_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-1 error: wrong signature for 'ANY.same_type'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs1_error (a_class) then
				create an_error.make_gvkbs1d (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs1e_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-1 error: wrong signature for 'ANY.conforms_to'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs1_error (a_class) then
				create an_error.make_gvkbs1e (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs1f_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-1 error: wrong signature for 'ANY.generator'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs1_error (a_class) then
				create an_error.make_gvkbs1f (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs1g_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-1 error: wrong signature for 'ANY.generating_type'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs1_error (a_class) then
				create an_error.make_gvkbs1g (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs1h_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-1 error: wrong signature for 'ANY.tagged_out'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs1_error (a_class) then
				create an_error.make_gvkbs1h (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs1i_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-1 error: wrong signature for 'ANY.standard_twin'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs1_error (a_class) then
				create an_error.make_gvkbs1i (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs1j_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-1 error: wrong signature for 'ANY.is_deep_equal'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs1_error (a_class) then
				create an_error.make_gvkbs1j (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs1k_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-1 error: wrong signature for 'ANY.deep_twin'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs1_error (a_class) then
				create an_error.make_gvkbs1k (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs2a_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-2 error: wrong signature for 'SPECIAL.item'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs2_error (a_class) then
				create an_error.make_gvkbs2a (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs2b_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-2 error: wrong signature for 'SPECIAL.put'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs2_error (a_class) then
				create an_error.make_gvkbs2b (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs2c_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-2 error: wrong signature for 'SPECIAL.make'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs2_error (a_class) then
				create an_error.make_gvkbs2c (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs2d_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-2 error: wrong signature for 'SPECIAL.count'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs2_error (a_class) then
				create an_error.make_gvkbs2d (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs2e_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-2 error: wrong signature for 'SPECIAL.element_size'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs2_error (a_class) then
				create an_error.make_gvkbs2e (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs2f_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-2 error: wrong signature for 'SPECIAL.aliased_resized_area'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs2_error (a_class) then
				create an_error.make_gvkbs2f (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs3a_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-3 error: wrong signature for 'CHARACTER.code'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs3_error (a_class) then
				create an_error.make_gvkbs3a (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs3b_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE; a_character_class: ET_CLASS) is
			-- Report GVKBS-3 error: wrong signature for `a_feature' in `a_class',
			-- built-in routine 'item' from ref class of sized character class `a_character_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
			a_character_class_not_void: a_character_class /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs3_error (a_class) then
				create an_error.make_gvkbs3b (a_class, a_feature, a_character_class)
				report_validity_error (an_error)
			end
		end

	report_gvkbs3c_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE; a_character_class: ET_CLASS) is
			-- Report GVKBS-3 error: wrong signature for `a_feature' in `a_class',
			-- built-in routine 'set_item' from ref class of sized character class `a_character_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
			a_character_class_not_void: a_character_class /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs3_error (a_class) then
				create an_error.make_gvkbs3c (a_class, a_feature, a_character_class)
				report_validity_error (an_error)
			end
		end

	report_gvkbs4a_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-4 error: wrong signature for 'INTEGER.infix "+"'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs4_error (a_class) then
				create an_error.make_gvkbs4a (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs4b_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-4 error: wrong signature for 'INTEGER.infix "-"'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs4_error (a_class) then
				create an_error.make_gvkbs4b (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs4c_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-4 error: wrong signature for 'INTEGER.infix "*"'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs4_error (a_class) then
				create an_error.make_gvkbs4c (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs4d_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-4 error: wrong signature for 'INTEGER.infix "/"'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs4_error (a_class) then
				create an_error.make_gvkbs4d (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs4e_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-4 error: wrong signature for 'INTEGER.infix "//"'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs4_error (a_class) then
				create an_error.make_gvkbs4e (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs4f_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-4 error: wrong signature for 'INTEGER.infix "\\"'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs4_error (a_class) then
				create an_error.make_gvkbs4f (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs4g_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-4 error: wrong signature for 'INTEGER.prefix "-"'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs4_error (a_class) then
				create an_error.make_gvkbs4g (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs4h_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-4 error: wrong signature for 'INTEGER.infix "<"'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs4_error (a_class) then
				create an_error.make_gvkbs4h (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs4i_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-4 error: wrong signature for 'INTEGER.to_character'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs4_error (a_class) then
				create an_error.make_gvkbs4i (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs4j_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-4 error: wrong signature for 'INTEGER.bit_or'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs4_error (a_class) then
				create an_error.make_gvkbs4j (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs4k_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-4 error: wrong signature for 'INTEGER.bit_shift_left'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs4_error (a_class) then
				create an_error.make_gvkbs4k (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs4l_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-4 error: wrong signature for 'INTEGER.bit_shift_right'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs4_error (a_class) then
				create an_error.make_gvkbs4l (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs4m_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-4 error: wrong signature for 'INTEGER.bit_xor'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs4_error (a_class) then
				create an_error.make_gvkbs4m (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs4n_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-4 error: wrong signature for 'INTEGER.bit_not'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs4_error (a_class) then
				create an_error.make_gvkbs4n (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs4o_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-4 error: wrong signature for 'INTEGER.bit_and'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs4_error (a_class) then
				create an_error.make_gvkbs4o (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs4p_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE; an_integer_class: ET_CLASS) is
			-- Report GVKBS-4 error: wrong signature for `a_feature' in `a_class',
			-- built-in routine 'item' from ref class of sized integer class `an_integer_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
			an_integer_class_not_void: an_integer_class /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs4_error (a_class) then
				create an_error.make_gvkbs4p (a_class, a_feature, an_integer_class)
				report_validity_error (an_error)
			end
		end

	report_gvkbs4q_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE; an_integer_class: ET_CLASS) is
			-- Report GVKBS-4 error: wrong signature for `a_feature' in `a_class',
			-- built-in routine 'set_item' from ref class of sized integer class `an_integer_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
			an_integer_class_not_void: an_integer_class /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs4_error (a_class) then
				create an_error.make_gvkbs4q (a_class, a_feature, an_integer_class)
				report_validity_error (an_error)
			end
		end

	report_gvkbs4r_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-4 error: wrong signature for 'INTEGER.prefix "+"'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs4_error (a_class) then
				create an_error.make_gvkbs4r (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs4s_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-4 error: wrong signature for 'INTEGER.infix "^"'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs4_error (a_class) then
				create an_error.make_gvkbs4s (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs4t_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-4 error: wrong signature for 'INTEGER.to_real'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs4_error (a_class) then
				create an_error.make_gvkbs4t (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs4u_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-4 error: wrong signature for 'INTEGER.to_double'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs4_error (a_class) then
				create an_error.make_gvkbs4u (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs4v_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-4 error: wrong signature for 'INTEGER.as_natural_8'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs4_error (a_class) then
				create an_error.make_gvkbs4v (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs4w_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-4 error: wrong signature for 'INTEGER.as_natural_16'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs4_error (a_class) then
				create an_error.make_gvkbs4w (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs4x_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-4 error: wrong signature for 'INTEGER.as_natural_32'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs4_error (a_class) then
				create an_error.make_gvkbs4x (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs4y_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-4 error: wrong signature for 'INTEGER.as_natural_64'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs4_error (a_class) then
				create an_error.make_gvkbs4y (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs4z_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-4 error: wrong signature for 'INTEGER.as_integer_8'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs4_error (a_class) then
				create an_error.make_gvkbs4z (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs4aa_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-4 error: wrong signature for 'INTEGER.as_integer_16'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs4_error (a_class) then
				create an_error.make_gvkbs4aa (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs4ab_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-4 error: wrong signature for 'INTEGER.as_integer_32'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs4_error (a_class) then
				create an_error.make_gvkbs4ab (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs4ac_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-4 error: wrong signature for 'INTEGER.as_integer_64'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs4_error (a_class) then
				create an_error.make_gvkbs4ac (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs4ad_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-4 error: wrong signature for 'INTEGER.to_real_32'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs4_error (a_class) then
				create an_error.make_gvkbs4ad (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs4ae_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-4 error: wrong signature for 'INTEGER.to_real_64'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs4_error (a_class) then
				create an_error.make_gvkbs4ae (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs5a_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-5 error: wrong signature for 'BOOLEAN.infix "and then"'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs5_error (a_class) then
				create an_error.make_gvkbs5a (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs5b_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-5 error: wrong signature for 'BOOLEAN.infix "or else"'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs5_error (a_class) then
				create an_error.make_gvkbs5b (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs5c_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-5 error: wrong signature for 'BOOLEAN.infix "implies"'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs5_error (a_class) then
				create an_error.make_gvkbs5c (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs5d_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-5 error: wrong signature for 'BOOLEAN.infix "and"'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs5_error (a_class) then
				create an_error.make_gvkbs5d (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs5e_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-5 error: wrong signature for 'BOOLEAN.infix "or"'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs5_error (a_class) then
				create an_error.make_gvkbs5e (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs5f_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-5 error: wrong signature for 'BOOLEAN.infix "xor"'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs5_error (a_class) then
				create an_error.make_gvkbs5f (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs5g_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-5 error: wrong signature for 'BOOLEAN.prefix "not"'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs5_error (a_class) then
				create an_error.make_gvkbs5g (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs5h_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-5 error: wrong signature for 'BOOLEAN_REF.item'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs5_error (a_class) then
				create an_error.make_gvkbs5h (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs5i_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-5 error: wrong signature for 'BOOLEAN_REF.set_item'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs5_error (a_class) then
				create an_error.make_gvkbs5i (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs6a_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-6 error: wrong signature for 'POINTER_REF.item'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs6_error (a_class) then
				create an_error.make_gvkbs6a (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs6b_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-6 error: wrong signature for 'POINTER_REF.set_item'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs6_error (a_class) then
				create an_error.make_gvkbs6b (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs6c_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-6 error: wrong signature for 'POINTER.infix "+"'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs6_error (a_class) then
				create an_error.make_gvkbs6c (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs6d_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-6 error: wrong signature for 'POINTER.to_integer_32'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs6_error (a_class) then
				create an_error.make_gvkbs6d (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs6e_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-6 error: wrong signature for 'POINTER.out'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs6_error (a_class) then
				create an_error.make_gvkbs6e (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs6f_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-6 error: wrong signature for 'POINTER.hash_code'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs6_error (a_class) then
				create an_error.make_gvkbs6f (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs7a_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-7 error: wrong signature for 'ARGUMENTS.argument'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs7_error (a_class) then
				create an_error.make_gvkbs7a (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs7b_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-7 error: wrong signature for 'ARGUMENTS.argument_count'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs7_error (a_class) then
				create an_error.make_gvkbs7b (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs8a_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE; a_real_class: ET_CLASS) is
			-- Report GVKBS-8 error: wrong signature for `a_feature' in `a_class',
			-- built-in routine 'item' from ref class of sized real class `a_real_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
			a_real_class_not_void: a_real_class /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs8_error (a_class) then
				create an_error.make_gvkbs8a (a_class, a_feature, a_real_class)
				report_validity_error (an_error)
			end
		end

	report_gvkbs8b_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE; a_real_class: ET_CLASS) is
			-- Report GVKBS-8 error: wrong signature for `a_feature' in `a_class',
			-- built-in routine 'set_item' from ref class of sized real class `a_real_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
			a_real_class_not_void: a_real_class /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs8_error (a_class) then
				create an_error.make_gvkbs8b (a_class, a_feature, a_real_class)
				report_validity_error (an_error)
			end
		end

	report_gvkbs8c_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-8 error: wrong signature for 'REAL.infix "+"'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs8_error (a_class) then
				create an_error.make_gvkbs8c (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs8d_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-8 error: wrong signature for 'REAL.infix "-"'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs8_error (a_class) then
				create an_error.make_gvkbs8d (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs8e_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-8 error: wrong signature for 'REAL.infix "*"'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs8_error (a_class) then
				create an_error.make_gvkbs8e (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs8f_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-8 error: wrong signature for 'REAL.infix "/"'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs8_error (a_class) then
				create an_error.make_gvkbs8f (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs8g_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-8 error: wrong signature for 'REAL.infix "^"'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs8_error (a_class) then
				create an_error.make_gvkbs8g (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs8h_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-8 error: wrong signature for 'REAL.prefix "-"'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs8_error (a_class) then
				create an_error.make_gvkbs8h (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs8i_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-8 error: wrong signature for 'REAL.prefix "+"'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs8_error (a_class) then
				create an_error.make_gvkbs8i (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs8j_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-8 error: wrong signature for 'REAL.infix "<"'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs8_error (a_class) then
				create an_error.make_gvkbs8j (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs8k_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-8 error: wrong signature for 'REAL.truncated_to_integer'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs8_error (a_class) then
				create an_error.make_gvkbs8k (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs8l_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-8 error: wrong signature for 'REAL.truncated_to_integer_64'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs8_error (a_class) then
				create an_error.make_gvkbs8l (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs8m_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-8 error: wrong signature for 'REAL.truncated_to_real'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs8_error (a_class) then
				create an_error.make_gvkbs8m (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs8n_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-8 error: wrong signature for 'REAL.to_double'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs8_error (a_class) then
				create an_error.make_gvkbs8n (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs8o_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-8 error: wrong signature for 'REAL.ceiling_real_32'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs8_error (a_class) then
				create an_error.make_gvkbs8o (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs8p_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-8 error: wrong signature for 'REAL.ceiling_real_64'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs8_error (a_class) then
				create an_error.make_gvkbs8p (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs8q_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-8 error: wrong signature for 'REAL.floor_real_32'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs8_error (a_class) then
				create an_error.make_gvkbs8q (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs8r_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-8 error: wrong signature for 'REAL.floor_real_64'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs8_error (a_class) then
				create an_error.make_gvkbs8r (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs8s_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-8 error: wrong signature for 'REAL.out'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs8_error (a_class) then
				create an_error.make_gvkbs8s (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs9a_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-9 error: wrong signature for 'PLATFORM.is_dotnet'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs9_error (a_class) then
				create an_error.make_gvkbs9a (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs9b_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-9 error: wrong signature for 'PLATFORM.is_unix'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs9_error (a_class) then
				create an_error.make_gvkbs9b (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs9c_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-9 error: wrong signature for 'PLATFORM.is_vms'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs9_error (a_class) then
				create an_error.make_gvkbs9c (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs9d_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-9 error: wrong signature for 'PLATFORM.is_windows'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs9_error (a_class) then
				create an_error.make_gvkbs9d (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs9e_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-9 error: wrong signature for 'PLATFORM.boolean_bytes'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs9_error (a_class) then
				create an_error.make_gvkbs9e (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs9f_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-9 error: wrong signature for 'PLATFORM.character_bytes'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs9_error (a_class) then
				create an_error.make_gvkbs9f (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs9g_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-9 error: wrong signature for 'PLATFORM.integer_bytes'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs9_error (a_class) then
				create an_error.make_gvkbs9g (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs9h_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-9 error: wrong signature for 'PLATFORM.pointer_bytes'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs9_error (a_class) then
				create an_error.make_gvkbs9h (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs9i_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-9 error: wrong signature for 'PLATFORM.real_bytes'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs9_error (a_class) then
				create an_error.make_gvkbs9i (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs10a_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-10 error: wrong signature for 'PROCEDURE.call'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs10_error (a_class) then
				create an_error.make_gvkbs10a (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbs11a_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBS-11 error: wrong signature for 'FUNCTION.item'
			-- built-in routine `a_feature' in class `a_class'.
			--
			-- Not in ETL
			-- GVKBS: Gobo Validity Kernel Built-in routine wrong Signature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs11_error (a_class) then
				create an_error.make_gvkbs11a (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkbu1a_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE) is
			-- Report GVKBU-1 error: unknown built-in routine `a_feature'
			-- in class `a_class'.
			--
			-- Not in ETL
			-- GVKBU: Gobo Validity Kernel Built-in routine Unknown
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_builtin: a_feature.is_builtin
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbu1_error (a_class) then
				create an_error.make_gvkbu1a (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkfe1a_error (a_class: ET_CLASS; a_name: ET_FEATURE_NAME) is
			-- Report GVKFE-1 error: feature `a_name' is missing
			-- in kernel class `a_class'.
			--
			-- Not in ETL
			-- GVKFE: Gobo Validity Kernel FEature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkfe1_error (a_class) then
				create an_error.make_gvkfe1a (a_class, a_name)
				report_validity_error (an_error)
			end
		end

	report_gvkfe2a_error (a_class: ET_CLASS; a_feature: ET_FEATURE) is
			-- Report GVKFE-2 error: feature `a_feature' in kernel
			-- class `a_class' is not an attribute.
			--
			-- Not in ETL
			-- GVKFE: Gobo Validity Kernel FEature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_not_attribute: not a_feature.is_attribute
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkfe2_error (a_class) then
				create an_error.make_gvkfe2a (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkfe3a_error (a_class: ET_CLASS; a_feature: ET_FEATURE; a_type: ET_BASE_TYPE) is
			-- Report GVKFE-3 error: attribute `a_feature' in kernel
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkfe3_error (a_class) then
				create an_error.make_gvkfe3a (a_class, a_feature, a_type)
				report_validity_error (an_error)
			end
		end

	report_gvkfe4a_error (a_class: ET_CLASS; a_feature: ET_FEATURE) is
			-- Report GVKFE-4 error: feature `a_feature' in kernel
			-- class `a_class' is not a procedure.
			--
			-- Not in ETL
			-- GVKFE: Gobo Validity Kernel FEature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_not_procedure: not a_feature.is_procedure
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkfe4_error (a_class) then
				create an_error.make_gvkfe4a (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkfe5a_error (a_class: ET_CLASS; a_feature: ET_FEATURE) is
			-- Report GVKFE-5 error: feature `a_feature' in kernel
			-- class `a_class' is not a query.
			--
			-- Not in ETL
			-- GVKFE: Gobo Validity Kernel FEature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_not_procedure: not a_feature.is_procedure
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkfe5_error (a_class) then
				create an_error.make_gvkfe5a (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvtcg5a_error (a_class: ET_CLASS; a_type: ET_CLASS_TYPE; an_actual: ET_TYPE; a_formal: ET_FORMAL_PARAMETER) is
			-- Report GVTCG-5 error: actual generic paramater `an_actual' of `a_type' in
			-- `a_class' is not a reference type but the corresponding formal parameter
			-- `a_formal' is marked as reference.
			--
			-- Not in ETL
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
			an_actual_not_void: an_actual /= Void
			a_formal_not_void: a_formal /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvtcg5_error (a_class) then
				create an_error.make_gvtcg5a (a_class, a_type, an_actual, a_formal)
				report_validity_error (an_error)
			end
		end

	report_gvtcg5b_error (a_class: ET_CLASS; a_type: ET_CLASS_TYPE; an_actual: ET_TYPE; a_formal: ET_FORMAL_PARAMETER) is
			-- Report GVTCG-5 error: actual generic paramater `an_actual' of `a_type' in
			-- `a_class' is not expanded type but the corresponding formal parameter
			-- `a_formal' is marked as expanded.
			--
			-- Not in ETL
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
			an_actual_not_void: an_actual /= Void
			a_formal_not_void: a_formal /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvtcg5_error (a_class) then
				create an_error.make_gvtcg5b (a_class, a_type, an_actual, a_formal)
				report_validity_error (an_error)
			end
		end

	report_gvuaa0a_error (a_class: ET_CLASS; a_name: ET_IDENTIFIER; a_feature: ET_FEATURE) is
			-- Report GVUAA error: `a_name' is a formal argument of
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvuaa_error (a_class) then
				create an_error.make_gvuaa0a (a_class, a_name, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvual0a_error (a_class: ET_CLASS; a_name: ET_IDENTIFIER; a_feature: ET_FEATURE) is
			-- Report GVUAL error: `a_name' is a local variable of
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvual_error (a_class) then
				create an_error.make_gvual0a (a_class, a_name, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvuia0a_error (a_class: ET_CLASS; a_name: ET_IDENTIFIER; a_feature: ET_FEATURE) is
			-- Report GVUIA error: `a_name' is a formal argument of
			-- `a_feature' in `a_class', and hence cannot be an
			-- instruction.
			--
			-- Not in ETL as validity error but as syntax error
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvuia_error (a_class) then
				create an_error.make_gvuia0a (a_class, a_name, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvuil0a_error (a_class: ET_CLASS; a_name: ET_IDENTIFIER; a_feature: ET_FEATURE) is
			-- Report GVUIL error: `a_name' is a local variable of
			-- `a_feature' in `a_class', and hence cannot be an
			-- instruction.
			--
			-- Not in ETL as validity error but as syntax error
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvuil_error (a_class) then
				create an_error.make_gvuil0a (a_class, a_name, a_feature)
				report_validity_error (an_error)
			end
		end

feature -- Validity error status

	reportable_vaol1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VAOL-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vape_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VAPE error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vave_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VAVE error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vcch1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VCCH-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vcch2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VCCH-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vcfg1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VCFG-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vcfg2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VCFG-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vcfg3_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VCFG-3 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vdjr_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VDJR error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vdjr2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VDJR-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vdpr1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VDPR-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vdpr2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VDPR-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vdpr3_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VDPR-3 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vdpr4_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VDPR-4 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vdrd2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VDRD-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vdrd3_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VDRD-3 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vdrd4_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VDRD-4 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vdrd5_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VDRD-5 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vdrd6_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VDRD-6 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vdrd7_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VDRD-7 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vdrs1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VDRS-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vdrs2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VDRS-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vdrs3_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VDRS-3 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vdrs4_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VDRS-4 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vdus1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VDUS-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vdus2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VDUS-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vdus3_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VDUS-3 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vdus4_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VDUS-4 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_veen_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VEEN error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_veen2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VEEN-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vfav1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VFAV-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vfav2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VFAV-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vffd4_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VFFD-4 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vffd5_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VFFD-5 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vffd6_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VFFD-6 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vffd7_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VFFD-7 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vgcc3_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VGCC-3 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vgcc5_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VGCC-5 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vgcc6_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VGCC-6 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vgcc8_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VGCC-8 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vgcp1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VGCP-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vgcp2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VGCP-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vgcp3_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VGCP-3 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vhay_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VHAY error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vhpr1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VHPR-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vhpr3_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VHPR-3 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vhrc1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VHRC-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vhrc2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VHRC-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vhrc4_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VHRC-4 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vhrc5_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VHRC-5 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vjar_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VJAR error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vjaw_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VJAW error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vjrv_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VJRV error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vkcn1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VKCN-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vkcn2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VKCN-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vlel1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VLEL-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vlel2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VLEL-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vlel3_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VLEL-3 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vmfn_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VMFN error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vmfn2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VMFN-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vmrc2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VMRC-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vmss1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VMSS-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vmss2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VMSS-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vmss3_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VMSS-3 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vomb1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VOMB-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vomb2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VOMB-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vpca1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VPCA-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vpca2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VPCA-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vpca3_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VPCA-3 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vpca4_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VPCA-4 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vpca5_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VPCA-5 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vqmc1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VQMC-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vqmc2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VQMC-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vqmc3_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VQMC-3 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vqmc4_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VQMC-4 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vqmc5_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VQMC-5 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vqmc6_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VQMC-6 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vqui_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VQUI error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vreg_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VREG error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vrfa_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VRFA error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vrle1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VRLE-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vrle2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VRLE-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vscn_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VSCN error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vtat_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VTAT error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vtbt_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VTBT error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vtcg3_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VTCG-3 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vtcg4_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VTCG-4 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vtct_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VTCT error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vtgc_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VTGC error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vtug1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VTUG-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vtug2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VTUG-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vuar1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VUAR-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vuar2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VUAR-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vuar4_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VUAR-4 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vuex1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VUEX-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vuex2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VUEX-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vwbe_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VWBE error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vweq_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VWEQ error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vwst1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VWST-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vwst2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VWST-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vxrt_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a VXRT error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvagp_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a GVAGP error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvhpr4_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a GVHPR-4 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvhpr5_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a GVHPR-5 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvhso1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a GVHSO-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvhso2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a GVHSO-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvkbs1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a GVKBS-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvkbs2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a GVKBS-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvkbs3_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a GVKBS-3 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvkbs4_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a GVKBS-4 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvkbs5_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a GVKBS-5 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvkbs6_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a GVKBS-6 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvkbs7_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a GVKBS-7 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvkbs8_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a GVKBS-8 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvkbs9_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a GVKBS-9 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvkbs10_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a GVKBS-10 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvkbs11_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a GVKBS-11 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvkbu1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a GVKBU-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvkfe1_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a GVKFE-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvkfe2_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a GVKFE-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvkfe3_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a GVKFE-3 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvkfe4_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a GVKFE-4 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvkfe5_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a GVKFE-5 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvtcg5_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a GVTCG-5 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvuaa_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a GVUAA error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvual_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a GVUAL error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvuia_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a GVUIA error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvuil_error (a_class: ET_CLASS): BOOLEAN is
			-- Can a GVUIL error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

feature -- Internal errors

	report_internal_error (an_error: ET_INTERNAL_ERROR) is
			-- Report internal error.
		require
			an_error_not_void: an_error /= Void
		do
			has_internal_error := True
			report_error (an_error)
			if error_file = std.error then
				error_file.put_line ("----")
			end
		end

	report_giaaa_error is
			-- Report GIAAA internal error.
		local
			an_error: ET_INTERNAL_ERROR
		do
			create an_error.make_giaaa
			report_internal_error (an_error)
		end

feature -- Reporting

	report_error_message (an_error: STRING) is
			-- Report `an_error'.
		do
			precursor (an_error)
			has_error := True
		end

end
