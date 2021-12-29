note

	description:

		"Error handlers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ERROR_HANDLER

inherit

	UT_ERROR_HANDLER
		redefine
			make_standard,
			make_null,
			is_verbose,
			report_error_message
		end

	KL_IMPORTED_ARRAY_ROUTINES

create

	make_standard, make_null

feature {NONE} -- Initialization

	make_standard
			-- <Precursor>
		do
			create mutex.make
			precursor
		end

	make_null
			-- <Precursor>
		do
			create mutex.make
			precursor
		end

feature -- Status report

	is_ise: BOOLEAN

	is_ge: BOOLEAN

	is_etl: BOOLEAN

	is_pedantic: BOOLEAN

	is_verbose: BOOLEAN
			-- Should status be reported for each class processed?

	has_error: BOOLEAN
			-- Has an error been reported?

	has_eiffel_error: BOOLEAN
			-- Has an Eiffel error been reported?

	has_internal_error: BOOLEAN
			-- Has an internal error been reported?

feature -- Status setting

	set_ise
			-- Set `is_ise' to True.
		do
			is_ise := True
		end

	set_compilers
			-- Set `is_ise' and `is_ge' to True.
		do
			is_ise := True
			is_ge := True
		end

	set_verbose (b: BOOLEAN)
			-- Set `is_verbose' to `b'.
		do
			is_verbose := b
		ensure
			verbose_set: is_verbose = b
		end

	set_has_error (b: BOOLEAN)
			-- Set `has_error' to `b'.
		do
			has_error := b
			if not b then
				has_eiffel_error := False
				has_internal_error := False
			end
		ensure
			has_error_set: has_error = b
			not_has_eiffel_error: not b implies not has_eiffel_error
			not_has_internal_error: not b implies not has_internal_error
		end

	set_has_eiffel_error (b: BOOLEAN)
			-- Set `has_eiffel_error' to `b'.
		do
			has_eiffel_error := b
			if b then
				has_error := True
			end
		ensure
			has_eiffel_error_set: has_eiffel_error = b
			has_error: b implies has_error
		end

	set_has_internal_error (b: BOOLEAN)
			-- Set `has_internal_error' to `b'.
		do
			has_internal_error := b
			if b then
				has_error := True
			end
		ensure
			has_internal_error_set: has_internal_error = b
			has_error: b implies has_error
		end

feature -- Compilation report

	report_preparsing_status (a_group: ET_GROUP)
			-- Report that `a_group' is currently being preparsed.
		require
			a_group_not_void: a_group /= Void
		do
			if is_verbose then
				if info_file /= Void then
					mutex.lock
					info_file.put_string ("Degree 6 ")
					info_file.put_string (a_group.kind_lower_name)
					info_file.put_character (' ')
					info_file.put_line (a_group.full_lower_name ('/'))
					mutex.unlock
				end
			end
		end

	report_compilation_status (a_processor: ET_AST_PROCESSOR; a_class: ET_CLASS; a_system_processor: ET_SYSTEM_PROCESSOR)
			-- Report that `a_processor' is currently processing `a_class'.
		require
			a_processor_not_void: a_processor /= Void
			a_class_not_void: a_class /= Void
			a_class_is_preparsed: a_class.is_preparsed
			a_system_processor_not_void: a_system_processor /= Void
		do
			if is_verbose then
				if info_file /= Void then
					mutex.lock
					if a_processor = a_system_processor.eiffel_parser then
						info_file.put_string ("Degree 5 class ")
						info_file.put_line (a_class.upper_name)
					elseif a_processor = a_system_processor.ancestor_builder then
						info_file.put_string ("Degree 4.3 class ")
						info_file.put_line (a_class.upper_name)
					elseif a_processor = a_system_processor.feature_flattener then
						info_file.put_string ("Degree 4.2 class ")
						info_file.put_line (a_class.upper_name)
					elseif a_processor = a_system_processor.interface_checker then
						info_file.put_string ("Degree 4.1 class ")
						info_file.put_line (a_class.upper_name)
					elseif a_processor = a_system_processor.implementation_checker then
						if a_system_processor.flat_mode then
							info_file.put_string ("Degree 3 (flat) class ")
						else
							info_file.put_string ("Degree 3 class ")
						end
						info_file.put_line (a_class.upper_name)
					end
					mutex.unlock
				end
			end
		end

feature -- Cluster errors

	report_cluster_error (an_error: ET_CLUSTER_ERROR)
			-- Report cluster error.
		require
			an_error_not_void: an_error /= Void
		do
			mutex.lock
			report_info (an_error)
			set_has_eiffel_error (True)
			if attached {KL_STDOUT_FILE} info_file then
				info_file.put_line ("----")
			end
			mutex.unlock
		end

	report_gcaaa_error (a_cluster: ET_CLUSTER; a_dirname: STRING)
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

	report_gcaab_error (a_cluster: ET_CLUSTER; a_filename: STRING)
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

	report_gcdep_error (a_cluster: ET_CLUSTER; a_class, a_dependant: ET_CLASS; a_constraint: ET_CLUSTER_DEPENDENCE_CONSTRAINT)
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

	report_gcpro_error (a_cluster: ET_CLUSTER; a_class, a_provider: ET_CLASS; a_constraint: ET_CLUSTER_DEPENDENCE_CONSTRAINT)
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

	report_gcscm_error (a_cluster: ET_CLUSTER; a_message: STRING)
			-- Report GCSCM error: there was an error when retrieving the
			-- SCM mapping description for `a_cluster', as explained in
			-- `a_message'.
		require
			a_cluster_not_void: a_cluster /= Void
			a_message_not_void: a_message /= Void
		local
			an_error: ET_CLUSTER_ERROR
		do
			if reportable_gcscm_error (a_cluster) then
				create an_error.make_gcscm (a_cluster, a_message)
				report_cluster_error (an_error)
			end
		end

feature -- Cluster error status

	reportable_gcaaa_error (a_cluster: ET_CLUSTER): BOOLEAN
			-- Can a GCAAA error be reported when it
			-- appears in `a_cluster'?
		require
			a_cluster_not_void: a_cluster /= Void
		do
			Result := True
		end

	reportable_gcaab_error (a_cluster: ET_CLUSTER): BOOLEAN
			-- Can a GCAAB error be reported when it
			-- appears in `a_cluster'?
		require
			a_cluster_not_void: a_cluster /= Void
		do
			Result := True
		end

	reportable_gcdep_error (a_cluster: ET_CLUSTER): BOOLEAN
			-- Can a GCDEP error be reported when it
			-- appears in `a_cluster'?
		require
			a_cluster_not_void: a_cluster /= Void
		do
			Result := True
		end

	reportable_gcpro_error (a_cluster: ET_CLUSTER): BOOLEAN
			-- Can a GCPRO error be reported when it
			-- appears in `a_cluster'?
		require
			a_cluster_not_void: a_cluster /= Void
		do
			Result := True
		end

	reportable_gcscm_error (a_cluster: ET_CLUSTER): BOOLEAN
			-- Can a GCSCM error be reported when it
			-- appears in `a_cluster'?
		require
			a_cluster_not_void: a_cluster /= Void
		do
			Result := True
		end

feature -- Universe errors

	report_universe_error (an_error: ET_UNIVERSE_ERROR)
			-- Report universe error.
		require
			an_error_not_void: an_error /= Void
		do
			mutex.lock
			report_info (an_error)
			set_has_eiffel_error (True)
			if attached {KL_STDOUT_FILE} info_file then
				info_file.put_line ("----")
			end
			mutex.unlock
		end

	report_vscn0a_error (a_universe: ET_UNIVERSE; a_current_class: ET_MASTER_CLASS; a_class1, a_class2: ET_NAMED_CLASS)
			-- Report VSCN error: two different classes `a_class1' and `a_class2'
			-- with the same name corresponding to `a_current_class' in `a_universe'.
			--
			-- ETL2: p.38
		require
			a_universe_not_void: a_universe /= Void
			a_current_class_not_void: a_current_class /= Void
			a_class1_not_void: a_class1 /= Void
			a_class2_not_void: a_class2 /= Void
		local
			an_error: ET_UNIVERSE_ERROR
		do
			if reportable_vscn_error (a_universe) then
				create an_error.make_vscn0a (a_universe, a_current_class, a_class1, a_class2)
				report_universe_error (an_error)
			end
		end

	report_vscn0b_error (a_universe: ET_UNIVERSE; a_current_class: ET_MASTER_CLASS; a_override_class: ET_NAMED_CLASS)
			-- Report VSCN error: built-in class "NONE" cannot be overridden
			-- but `a_override_class' corresponding to `a_current_class' in `a_universe'.
			--
			-- ETL2: p.38
		require
			a_universe_not_void: a_universe /= Void
			a_current_class_not_void: a_current_class /= Void
			a_override_class_not_void: a_override_class /= Void
		local
			an_error: ET_UNIVERSE_ERROR
		do
			if reportable_vscn_error (a_universe) then
				create an_error.make_vscn0b (a_universe, a_current_class, a_override_class)
				report_universe_error (an_error)
			end
		end

	report_vscn0c_error (a_universe: ET_UNIVERSE; a_current_class: ET_MASTER_CLASS; a_class1, a_class2: ET_NAMED_CLASS)
			-- Report VSCN error:  class `a_class1' appearing in a .NET assembly
			-- cannot be overridden by `a_class2' corresponding to `a_current_class'
			-- in `a_universe'.
			--
			-- ETL2: p.38
		require
			a_universe_not_void: a_universe /= Void
			a_current_class_not_void: a_current_class /= Void
			a_class1_not_void: a_class1 /= Void
			a_class2_not_void: a_class2 /= Void
		local
			an_error: ET_UNIVERSE_ERROR
		do
			if reportable_vscn_error (a_universe) then
				create an_error.make_vscn0c (a_universe, a_current_class, a_class1, a_class2)
				report_universe_error (an_error)
			end
		end

	report_vscn0d_error (a_universe: ET_UNIVERSE; a_current_class: ET_MASTER_CLASS; a_class1, a_class2: ET_MASTER_CLASS)
			-- Report VSCN error: class `a_current_class' in `a_universe' cannot
			-- be overridden both by class `a_class1' and by class `a_class2'.
			--
			-- ETL2: p.38
		require
			a_universe_not_void: a_universe /= Void
			a_current_class_not_void: a_current_class /= Void
			a_class1_not_void: a_class1 /= Void
			a_class2_not_void: a_class2 /= Void
		local
			an_error: ET_UNIVERSE_ERROR
		do
			if reportable_vscn_error (a_universe) then
				create an_error.make_vscn0d (a_universe, a_current_class, a_class1, a_class2)
				report_universe_error (an_error)
			end
		end

feature -- Universe error status

	reportable_vscn_error (a_universe: ET_UNIVERSE): BOOLEAN
			-- Can a VSCN error be reported when it
			-- appears in `a_universe'?
		require
			a_universe_not_void: a_universe /= Void
		do
			Result := True
		end

feature -- .NET assembly errors

	report_assembly_error (an_error: ET_DOTNET_ASSEMBLY_ERROR)
			-- Report .NET assembly error.
		require
			an_error_not_void: an_error /= Void
		do
			mutex.lock
			report_info (an_error)
			set_has_eiffel_error (True)
			if attached {KL_STDOUT_FILE} info_file then
				info_file.put_line ("----")
			end
			mutex.unlock
		end

	report_gaaaa_error (an_assembly: ET_DOTNET_ASSEMBLY)
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

	report_gazzz_error (an_assembly: ET_DOTNET_ASSEMBLY; a_message: STRING)
			-- Report GAZZZ error: error explained as plain text in `a_message'.
		require
			an_assembly_not_void: an_assembly /= Void
			a_message_not_void: a_message /= Void
		local
			an_error: ET_DOTNET_ASSEMBLY_ERROR
		do
			if reportable_gazzz_error (an_assembly) then
				create an_error.make_gazzz (an_assembly, a_message)
				report_assembly_error (an_error)
			end
		end

feature -- .NET assembly error status

	reportable_gaaaa_error (an_assembly: ET_DOTNET_ASSEMBLY): BOOLEAN
			-- Can a GAAAA error be reported when it
			-- appears in `an_assembly'?
		require
			an_assembly_not_void: an_assembly /= Void
		do
			Result := True
		end

	reportable_gazzz_error (an_assembly: ET_DOTNET_ASSEMBLY): BOOLEAN
			-- Can a GAZZZ error be reported when it
			-- appears in `an_assembly'?
		require
			an_assembly_not_void: an_assembly /= Void
		do
			Result := True
		end

feature -- Syntax errors

	report_syntax_error (a_filename: STRING; p: ET_POSITION)
			-- Report a syntax error.
		require
			a_filename_not_void: a_filename /= Void
			p_not_void: p /= Void
		local
			an_error: ET_SYNTAX_ERROR
		do
			mutex.lock
			create an_error.make (a_filename, p)
			report_info (an_error)
			set_has_eiffel_error (True)
			mutex.unlock
		end

	report_SCAC_error (a_filename: STRING; p: ET_POSITION)
			-- Missing ASCII code in special character
			-- specification %/code/ in character constant.
			-- (SCAC: Syntax Character Ascii Code)
		require
			a_filename_not_void: a_filename /= Void
			p_not_void: p /= Void
		do
			report_syntax_error (a_filename, p)
		end

	report_SCAS_error (a_filename: STRING; p: ET_POSITION)
			-- Missing character / at end of special character
			-- specification %/code/ in character constant.
			-- (SCAS: Syntax Character Ascii-code Slash)
		require
			a_filename_not_void: a_filename /= Void
			p_not_void: p /= Void
		do
			report_syntax_error (a_filename, p)
		end

	report_SCCU_error (a_filename: STRING; p: ET_POSITION)
			-- Special character specification %l where l is a letter
			-- code should be in upper-case in character constant.
			-- (SSCU: Syntax Character special-Character Upper-case)
		require
			a_filename_not_void: a_filename /= Void
			p_not_void: p /= Void
		do
			report_syntax_error (a_filename, p)
		end

	report_SCEQ_error (a_filename: STRING; p: ET_POSITION)
			-- Missing quote at end of character constant.
			-- (SCEQ: Syntax Character End Quote)
		require
			a_filename_not_void: a_filename /= Void
			p_not_void: p /= Void
		do
			report_syntax_error (a_filename, p)
		end

	report_SCQQ_error (a_filename: STRING; p: ET_POSITION)
			-- Missing character between quotes in character constant.
			-- (SCQQ: Syntax Character Quote Quote)
		require
			a_filename_not_void: a_filename /= Void
			p_not_void: p /= Void
		do
			report_syntax_error (a_filename, p)
		end

	report_SCSC_error (a_filename: STRING; p: ET_POSITION)
			-- Invalid special character %l in character constant.
			-- (SCSC: Syntax Character Special Character)
		require
			a_filename_not_void: a_filename /= Void
			p_not_void: p /= Void
		do
			report_syntax_error (a_filename, p)
		end

	report_SIFU_error (a_filename: STRING; p: ET_POSITION)
			-- An underscore may not be the first character
			-- of an integer constant. (ETL2 p.420)
			-- (SIFU: Syntax Integer First Underscore)
		require
			a_filename_not_void: a_filename /= Void
			p_not_void: p /= Void
		do
			report_syntax_error (a_filename, p)
		end

	report_SILU_error (a_filename: STRING; p: ET_POSITION)
			-- An underscore may not be the last character
			-- of an integer constant. (ECMA p.157)
			-- (SILU: Syntax Integer Last Underscore)
		require
			a_filename_not_void: a_filename /= Void
			p_not_void: p /= Void
		do
			report_syntax_error (a_filename, p)
		end

	report_SSAC_error (a_filename: STRING; p: ET_POSITION)
			-- Missing ASCII code in special character
			-- specification %/code/ in manifest string.
			-- (SSAC: Syntax String Ascii Code)
		require
			a_filename_not_void: a_filename /= Void
			p_not_void: p /= Void
		do
			report_syntax_error (a_filename, p)
		end

	report_SSAO_error (a_filename: STRING; p: ET_POSITION)
			-- ASCII code too big in special character
			-- specification %/code/ in manifest string.
			-- (SSAO: Syntax String Ascii-code Overflow)
		require
			a_filename_not_void: a_filename /= Void
			p_not_void: p /= Void
		do
			report_syntax_error (a_filename, p)
		end

	report_SSAS_error (a_filename: STRING; p: ET_POSITION)
			-- Missing character / at end of special character
			-- specification %/code/ in manifest string.
			-- (SSAS: Syntax String Ascii-code Slash)
		require
			a_filename_not_void: a_filename /= Void
			p_not_void: p /= Void
		do
			report_syntax_error (a_filename, p)
		end

	report_SSCU_error (a_filename: STRING; p: ET_POSITION)
			-- Special character specification %l where l is a letter
			-- code should be in upper-case in manifest strings.
			-- (SSCU: Syntax String special-Character Upper-case)
		require
			a_filename_not_void: a_filename /= Void
			p_not_void: p /= Void
		do
			report_syntax_error (a_filename, p)
		end

	report_SSEL_error (a_filename: STRING; p: ET_POSITION)
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

	report_SSEQ_error (a_filename: STRING; p: ET_POSITION)
			-- Missing double quote at end of manifest string.
			-- (SSEQ: Syntax String End double-Quote)
		require
			a_filename_not_void: a_filename /= Void
			p_not_void: p /= Void
		do
			report_syntax_error (a_filename, p)
		end

	report_SSNL_error (a_filename: STRING; p: ET_POSITION)
			-- Invalid new-line in middle of manifest string.
			-- (SSNL: Syntax String New-Line)
		require
			a_filename_not_void: a_filename /= Void
			p_not_void: p /= Void
		do
			report_syntax_error (a_filename, p)
		end

	report_SSNP_error (a_filename: STRING; p: ET_POSITION)
			-- Missing character % at beginning of
			-- line in multi-line manifest string.
			-- (SSNP: Syntax String New-line Percent)
		require
			a_filename_not_void: a_filename /= Void
			p_not_void: p /= Void
		do
			report_syntax_error (a_filename, p)
		end

	report_SSSC_error (a_filename: STRING; p: ET_POSITION)
			-- Invalid special character %l in manifest strings.
			-- (SSSC: Syntax String Special Character)
		require
			a_filename_not_void: a_filename /= Void
			p_not_void: p /= Void
		do
			report_syntax_error (a_filename, p)
		end

feature -- System errors

	report_system_error (an_error: ET_SYSTEM_ERROR)
			-- Report system error.
		require
			an_error_not_void: an_error /= Void
		do
			mutex.lock
			report_info (an_error)
			set_has_eiffel_error (True)
			if attached {KL_STDOUT_FILE} info_file then
				info_file.put_line ("----")
			end
			mutex.unlock
		end

	report_catcall_error (an_error: STRING)
			-- Report CAT-call error.
		require
			an_error_not_void: an_error /= Void
		do
			mutex.lock
			set_has_eiffel_error (True)
			report_info_message (an_error)
			mutex.unlock
		end

	report_vsrc1a_error (a_class: ET_CLASS)
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

	report_gvknl1a_error (a_class: ET_CLASS)
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

	report_gvsrc3a_error
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

	report_gvsrc4a_error (a_class: ET_CLASS)
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

	report_gvsrc5a_error (a_class: ET_CLASS; a_feature_name: ET_FEATURE_NAME)
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

	report_gvsrc6a_error (a_class: ET_CLASS; a_feature_name: ET_FEATURE_NAME)
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

	reportable_vsrc1_error: BOOLEAN
			-- Can a VSRC-1 error be reported?
		do
			Result := True
		end

	reportable_gvknl1_error: BOOLEAN
			-- Can a GVKNL-1 error be reported?
		do
			Result := True
		end

	reportable_gvsrc3_error: BOOLEAN
			-- Can a GVSRC-3 error be reported?
		do
			Result := True
		end

	reportable_gvsrc4_error: BOOLEAN
			-- Can a GVSRC-4 error be reported?
		do
			Result := True
		end

	reportable_gvsrc5_error: BOOLEAN
			-- Can a GVSRC-5 error be reported?
		do
			Result := True
		end

	reportable_gvsrc6_error: BOOLEAN
			-- Can a GVSRC-6 error be reported?
		do
			Result := True
		end

feature -- Validity errors

	report_validity_error (an_error: ET_VALIDITY_ERROR)
			-- Report validity error.
		require
			an_error_not_void: an_error /= Void
		do
			if
				(is_ise and an_error.ise_reported) or
				(is_ge and an_error.ge_reported)
			then
				mutex.lock
				report_info (an_error)
				set_has_eiffel_error (True)
				if attached {KL_STDOUT_FILE} info_file then
					info_file.put_line ("----")
				end
				mutex.unlock
			end
		end

	report_vaol1a_error (a_class: ET_CLASS; an_expression: ET_OLD_EXPRESSION)
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

	report_vape1a_error (a_class, a_class_impl: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE; a_pre_feature: ET_FEATURE; a_client: ET_CLIENT)
			-- Report VAPE-1 error: `a_feature' named `a_name' of an unqualified call
			-- appearing in a precondition of `a_pre_feature' in `a_class_impl' and view from
			-- one of its descendants `a_class' (possibly itself), is not exported to class
			-- `a_client' to which `a_pre_feature' is exported.
			--
			-- ECMA 367-2, 8.9.5 page 58.
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
			if reportable_vape1_error (a_class) then
				create an_error.make_vape1a (a_class, a_class_impl, a_name, a_feature, a_pre_feature, a_client)
				report_validity_error (an_error)
			end
		end

	report_vape1b_error (a_class, a_class_impl: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE; a_target_class: ET_CLASS; a_pre_feature: ET_FEATURE; a_client: ET_CLIENT)
			-- Report VAPE-1 error: `a_feature' named `a_name' of a qualified
			-- call with target's base class `a_target_class', appearing in a precondition
			-- of `a_pre_feature' in `a_class_impl' and view from one of its descendants
			-- a_class' (possibly itself), is not exported to class `a_client' to which
			-- `a_pre_feature' is exported.
			--
			-- ECMA 367-2, 8.9.5 page 58.
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
			if reportable_vape1_error (a_class) then
				create an_error.make_vape1b (a_class, a_class_impl, a_name, a_feature, a_target_class, a_pre_feature, a_client)
				report_validity_error (an_error)
			end
		end

	report_vape2a_error (a_class, a_class_impl: ET_CLASS; a_name: ET_CALL_NAME; a_procedure: ET_PROCEDURE; a_target_class: ET_CLASS; a_pre_feature: ET_FEATURE; a_client: ET_CLIENT)
			-- Report VAPE-2 error: `a_procedure' named `a_name' of a creation instruction
			-- or expression with creation type's base class `a_target_class', appearing in a
			-- precondition of `a_pre_feature' in `a_class_impl' and view from one of its descendants
			-- a_class' (possibly itself), is not exported for creation to class `a_client'
			-- to which `a_pre_feature' is exported.
			--
			-- ECMA 367-2, 8.9.5 page 58.
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_name_not_void: a_name /= Void
			a_procedure_not_void: a_procedure /= Void
			a_target_class_not_void: a_target_class /= Void
			a_pre_feature_not_void: a_pre_feature /= Void
			a_client_not_void: a_client /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vape2_error (a_class) then
				create an_error.make_vape2a (a_class, a_class_impl, a_name, a_procedure, a_target_class, a_pre_feature, a_client)
				report_validity_error (an_error)
			end
		end

	report_vape2b_error (a_class, a_class_impl: ET_CLASS; a_name: ET_CALL_NAME; a_procedure: ET_PROCEDURE; a_formal: ET_FORMAL_PARAMETER; a_pre_feature: ET_FEATURE; a_client: ET_CLIENT)
			-- Report VAPE-2 error: `a_procedure' named `a_name' of a creation instruction
			-- or expression with `a_formal' as creation type, appearing in a precondition of
			-- `a_pre_feature' in `a_class_impl' and view from one of its descendants
			-- a_class' (possibly itself), is not exported for creation to class `a_client'
			-- to which `a_pre_feature' is exported.
			--
			-- ECMA 367-2, 8.9.5 page 58.
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_name_not_void: a_name /= Void
			a_procedure_not_void: a_procedure /= Void
			a_formal_not_void: a_formal /= Void
			a_pre_feature_not_void: a_pre_feature /= Void
			a_client_not_void: a_client /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vape2_error (a_class) then
				create an_error.make_vape2b (a_class, a_class_impl, a_name, a_procedure, a_formal, a_pre_feature, a_client)
				report_validity_error (an_error)
			end
		end

	report_vave0a_error (a_class, a_class_impl: ET_CLASS; an_expression: ET_EXPRESSION; a_type: ET_NAMED_TYPE)
			-- Report VAVE error: the expression `an_expression' of a
			-- loop variant in `a_class_impl' and viewed from one of
			-- its descendants `a_class' (possibly itself) is of type
			-- `a_type' which is not a sized variant of "INTEGER".
			--
			-- ETL2: p.130
			-- ECMA 367-2: p.48
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
				create an_error.make_vave0a (a_class, a_class_impl, an_expression, a_type)
				report_validity_error (an_error)
			end
		end

	report_vbac1a_error (a_class, a_class_impl: ET_CLASS; an_assigner: ET_ASSIGNER_INSTRUCTION; a_source_type, a_target_type: ET_NAMED_TYPE)
			-- Report VBAC-1 error: the source expression of `an_assigner' in
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vbac1_error (a_class) then
				create an_error.make_vbac1a (a_class, a_class_impl, an_assigner, a_source_type, a_target_type)
				report_validity_error (an_error)
			end
		end

	report_vbac2a_error (a_class: ET_CLASS; an_assigner: ET_ASSIGNER_INSTRUCTION; a_query: ET_QUERY; a_query_class: ET_CLASS)
			-- Report VBAC-2 error: `a_query' from class `a_query_class', used
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vbac2_error (a_class) then
				create an_error.make_vbac2a (a_class, an_assigner, a_query, a_query_class)
				report_validity_error (an_error)
			end
		end

	report_vcch1a_error (a_class: ET_CLASS; f: ET_FEATURE)
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

	report_vcch1b_error (a_class: ET_CLASS; f: ET_INHERITED_FEATURE)
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

	report_vcch2a_error (a_class: ET_CLASS)
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
			if reportable_vcch2_error (a_class) then
				create an_error.make_vcch2a (a_class)
				an_error.set_ise_reported (False)
				report_validity_error (an_error)
			end
		end

	report_vcfg1a_error (a_class: ET_CLASS; a_formal: ET_FORMAL_PARAMETER; other_class: ET_CLASS)
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

	report_vcfg2a_error (a_class: ET_CLASS; a_formal1, a_formal2: ET_FORMAL_PARAMETER)
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

	report_vdjr0a_error (a_class: ET_CLASS; f1, f2: ET_PARENT_FEATURE)
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

	report_vdjr0b_error (a_class: ET_CLASS; f1, f2: ET_PARENT_FEATURE; arg: INTEGER)
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

	report_vdjr0c_error (a_class: ET_CLASS; f1, f2: ET_PARENT_FEATURE)
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

	report_vdjr2a_error (a_class: ET_CLASS; f1, f2: ET_PARENT_FEATURE)
			-- Report VDJR-2 error: features `f1' and `f2' are joined/merged,
			-- but `f1' has an alias and not `f2'.
			--
			-- ECMA: p.69
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f1_no_alias: attached f1.alias_names as l_f1_alias_names and then not l_f1_alias_names.is_empty
			f2_not_void: f2 /= Void
			f2_alias: not attached f2.alias_names as l_f2_alias_names or else l_f2_alias_names.is_empty
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdjr2_error (a_class) then
				create an_error.make_vdjr2a (a_class, f1, f2)
				report_validity_error (an_error)
			end
		end

	report_vdjr2b_error (a_class: ET_CLASS; f1, f2: ET_PARENT_FEATURE)
			-- Report VDJR-2 error: features `f1' and `f2' are joined/merged,
			-- they both have an alias but it is not the same.
			--
			-- ECMA: p.69
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f1_alias: attached f1.alias_names as l_f1_alias_names and then not l_f1_alias_names.is_empty
			f2_not_void: f2 /= Void
			f2_alias: attached f2.alias_names as l_f2_alias_names and then not l_f2_alias_names.is_empty
			not_same_alias: not l_f1_alias_names.same_alias_names (l_f2_alias_names)
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdjr2_error (a_class) then
				create an_error.make_vdjr2b (a_class, f1, f2)
				report_validity_error (an_error)
			end
		end

	report_vdpr1a_error (a_class: ET_CLASS; a_precursor: ET_PRECURSOR_INSTRUCTION)
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

	report_vdpr1b_error (a_class: ET_CLASS; a_precursor: ET_PRECURSOR_EXPRESSION)
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

	report_vdpr2a_error (a_class: ET_CLASS; a_precursor: ET_PRECURSOR_CALL)
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

	report_vdpr3a_error (a_class: ET_CLASS; a_precursor: ET_PRECURSOR_CALL; a_redefined_feature: ET_FEATURE; f1, f2: ET_PARENT_FEATURE)
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

	report_vdpr3b_error (a_class: ET_CLASS; a_precursor: ET_PRECURSOR_CALL; a_redefined_feature: ET_FEATURE; an_inherited_feature: ET_PARENT_FEATURE)
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

	report_vdpr3c_error (a_class: ET_CLASS; a_precursor: ET_PRECURSOR_CALL; a_redefined_feature: ET_FEATURE)
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

	report_vdpr3d_error (a_class: ET_CLASS; a_precursor: ET_PRECURSOR_CALL; a_feature: ET_FEATURE)
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

	report_vdpr3e_error (a_class: ET_CLASS; a_precursor: ET_PRECURSOR_CALL; an_agent: ET_INLINE_AGENT; a_feature: ET_STANDALONE_CLOSURE)
			-- Report VDPR-3 error: `a_precursor' appears in inline agent `an_agent'
			-- of `a_feature' in `a_class', but the associated feature of inline
			-- agents cannot be redefined.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_precursor_not_void: a_precursor /= Void
			an_agent_not_void: an_agent /= Void
			a_feature_not_void: a_feature /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdpr3_error (a_class) then
				create an_error.make_vdpr3e (a_class, a_precursor, an_agent, a_feature)
				report_validity_error (an_error)
			end
		end

	report_vdpr4a_error (a_class: ET_CLASS; a_precursor: ET_PRECURSOR_KEYWORD; a_feature: ET_FEATURE; a_parent: ET_CLASS)
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

	report_vdpr4b_error (a_class, a_class_impl: ET_CLASS; a_precursor: ET_PRECURSOR_KEYWORD; a_feature: ET_FEATURE; a_parent: ET_CLASS; arg: INTEGER; an_actual, a_formal: ET_NAMED_TYPE)
			-- Report VDPR-4B error: the `arg'-th actual argument in the precursor
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdpr4_error (a_class) then
				create an_error.make_vdpr4b (a_class, a_class_impl, a_precursor, a_feature, a_parent, arg, an_actual, a_formal)
				report_validity_error (an_error)
			end
		end

	report_vdrd2a_error (a_class: ET_CLASS; f1: ET_FEATURE; f2: ET_PARENT_FEATURE)
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

	report_vdrd2b_error (a_class: ET_CLASS; f1, f2: ET_PARENT_FEATURE)
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

	report_vdrd2c_error (a_class: ET_CLASS; f1: ET_FEATURE; f2: ET_PARENT_FEATURE)
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

	report_vdrd2d_error (a_class: ET_CLASS; f1, f2: ET_PARENT_FEATURE)
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

	report_vdrd3a_error (a_class: ET_CLASS; p: ET_PRECONDITIONS; f: ET_FEATURE)
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

	report_vdrd3b_error (a_class: ET_CLASS; p: ET_POSTCONDITIONS; f: ET_FEATURE)
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

	report_vdrd4a_error (a_class: ET_CLASS; f1: ET_PARENT_FEATURE; f2: ET_FEATURE)
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
				create an_error.make_vdrd4a (a_class, f1, f2)
				an_error.set_ise_reported (False)
				report_validity_error (an_error)
			end
		end

	report_vdrd4b_error (a_class: ET_CLASS; f1: ET_PARENT_FEATURE; f2: ET_FEATURE)
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
				create an_error.make_vdrd4b (a_class, f1, f2)
				an_error.set_ise_reported (False)
				report_validity_error (an_error)
			end
		end

	report_vdrd4c_error (a_class: ET_CLASS; f1: ET_PARENT_FEATURE; f2: ET_FEATURE)
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
				create an_error.make_vdrd4c (a_class, f1, f2)
				an_error.set_ise_reported (False)
				report_validity_error (an_error)
			end
		end

	report_vdrd5a_error (a_class: ET_CLASS; f1: ET_PARENT_FEATURE; f2: ET_FEATURE)
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
				create an_error.make_vdrd5a (a_class, f1, f2)
				report_validity_error (an_error)
			end
		end

	report_vdrd6a_error (a_class: ET_CLASS; f1: ET_PARENT_FEATURE; f2: ET_FEATURE)
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

	report_vdrd6b_error (a_class: ET_CLASS; f1: ET_PARENT_FEATURE; f2: ET_FEATURE)
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

	report_vdrd7a_error (a_class: ET_CLASS; f1: ET_PARENT_FEATURE; f2: ET_FEATURE)
			-- Report VDRD-7 error: `f1' has no alias but its redeclared version
			-- `f2' has one.
			--
			-- ECMA: p.68
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f1_no_alias: not attached f1.alias_names as l_f1_alias_names or else l_f1_alias_names.is_empty
			f2_not_void: f2 /= Void
			f2_alias: attached f2.alias_names as l_f2_alias_names and then not l_f2_alias_names.is_empty
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdrd7_error (a_class) then
				create an_error.make_vdrd7a (a_class, f1, f2)
				report_validity_error (an_error)
			end
		end

	report_vdrd7b_error (a_class: ET_CLASS; f1: ET_PARENT_FEATURE; f2: ET_FEATURE)
			-- Report VDRD-7 error: `f1' has an alias but its redeclared version
			-- `f2' has none.
			--
			-- ECMA: p.68
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f1_alias: attached f1.alias_names as l_f1_alias_names and then not l_f1_alias_names.is_empty
			f2_not_void: f2 /= Void
			f2_no_alias: not attached f2.alias_names as l_f2_alias_names or else l_f2_alias_names.is_empty
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdrd7_error (a_class) then
				create an_error.make_vdrd7b (a_class, f1, f2)
				report_validity_error (an_error)
			end
		end

	report_vdrd7c_error (a_class: ET_CLASS; f1: ET_PARENT_FEATURE; f2: ET_FEATURE)
			-- Report VDRD-7 error: `f1' and its redeclared version `f2'
			-- have both an alias, but it is not the same.
			--
			-- ECMA: p.68
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f1_alias: attached f1.alias_names as l_f1_alias_names and then not l_f1_alias_names.is_empty
			f2_not_void: f2 /= Void
			f2_alias: attached f2.alias_names as l_f2_alias_names and then not l_f2_alias_names.is_empty
			not_same_alias: not l_f1_alias_names.same_alias_names (l_f2_alias_names)
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vdrd7_error (a_class) then
				create an_error.make_vdrd7c (a_class, f1, f2)
				report_validity_error (an_error)
			end
		end

	report_vdrs1a_error (a_class: ET_CLASS; a_parent: ET_PARENT; f: ET_FEATURE_NAME)
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

	report_vdrs2a_error (a_class: ET_CLASS; a_parent: ET_PARENT; f: ET_FEATURE_NAME)
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

	report_vdrs2b_error (a_class: ET_CLASS; a_parent: ET_PARENT; f: ET_FEATURE_NAME)
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

	report_vdrs3a_error (a_class: ET_CLASS; a_parent: ET_PARENT; f1, f2: ET_FEATURE_NAME)
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

	report_vdrs4a_error (a_class: ET_CLASS; a_feature: ET_PARENT_FEATURE)
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

	report_vdrs4b_error (a_class: ET_CLASS; a_deferred: ET_PARENT_FEATURE; an_effective: ET_FEATURE)
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
				create an_error.make_vdrs4b (a_class, a_deferred, an_effective)
				report_validity_error (an_error)
			end
		end

	report_vdus1a_error (a_class: ET_CLASS; a_parent: ET_PARENT; f: ET_FEATURE_NAME)
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

	report_vdus2a_error (a_class: ET_CLASS; a_parent: ET_PARENT; f: ET_FEATURE_NAME)
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

	report_vdus2b_error (a_class: ET_CLASS; a_parent: ET_PARENT; f: ET_FEATURE_NAME)
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

	report_vdus3a_error (a_class: ET_CLASS; a_parent: ET_PARENT; f: ET_FEATURE_NAME)
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
				create an_error.make_vdus3a (a_class, a_parent, f)
				report_validity_error (an_error)
			end
		end

	report_vdus4a_error (a_class: ET_CLASS; a_parent: ET_PARENT; f1, f2: ET_FEATURE_NAME)
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

	report_veen0a_error (a_class: ET_CLASS; an_identifier: ET_IDENTIFIER; a_feature: ET_FEATURE)
			-- Report VEEN error: `an_identifier', appearing in `a_feature'
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_veen_error (a_class) then
				create an_error.make_veen0a (a_class, an_identifier, a_feature)
				report_validity_error (an_error)
			end
		end

	report_veen0b_error (a_class: ET_CLASS; an_identifier: ET_IDENTIFIER; an_agent: ET_INLINE_AGENT)
			-- Report VEEN error: `an_identifier', appearing in inline
			-- agent `an_agent' in `a_class', is not the final name of a feature
			-- in `a_class' nor the name of a local variable or a formal argument of
			-- `an_agent'.
			--
			-- ETL2: p.276
			-- ETR: p.61
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_identifier_not_void: an_identifier /= Void
			an_agent_not_void: an_agent /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_veen_error (a_class) then
				create an_error.make_veen0b (a_class, an_identifier, an_agent)
				report_validity_error (an_error)
			end
		end

	report_veen2a_error (a_class: ET_CLASS; a_result: ET_RESULT; a_feature: ET_FEATURE)
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

	report_veen2b_error (a_class: ET_CLASS; a_result: ET_RESULT; a_feature: ET_FEATURE)
			-- Report VEEN-2 error: `a_result' appears in the precondition
			-- of `a_feature' in `a_class'.
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

	report_veen2c_error (a_class: ET_CLASS; a_local: ET_FEATURE_NAME; a_feature: ET_FEATURE)
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

	report_veen2d_error (a_class: ET_CLASS; a_result: ET_RESULT)
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

	report_veen2e_error (a_class: ET_CLASS; a_local: ET_FEATURE_NAME; an_agent: ET_INLINE_AGENT)
			-- Report VEEN-2 error: the local variable `a_local' appears in the precondition
			-- or postcondition of inline agent `an_agent' in `a_class'.
			--
			-- ETL2: p.276
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_local_not_void: a_local /= Void
			a_local_is_local: a_local.is_local
			an_agent_not_void: an_agent /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_veen2_error (a_class) then
				create an_error.make_veen2e (a_class, a_local, an_agent)
				report_validity_error (an_error)
			end
		end

	report_veen2f_error (a_class: ET_CLASS; a_result: ET_RESULT; an_agent: ET_INLINE_AGENT)
			-- Report VEEN-2 error: `a_result' appears in the precondition
			-- of inline agent `an_agent' in `a_class'.
			--
			-- ETL2: p.276
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_result_not_void: a_result /= Void
			an_agent_not_void: an_agent /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_veen2_error (a_class) then
				create an_error.make_veen2f (a_class, a_result, an_agent)
				report_validity_error (an_error)
			end
		end

	report_veen2g_error (a_class: ET_CLASS; a_result: ET_RESULT; an_agent: ET_INLINE_AGENT)
			-- Report VEEN-2 error: `a_result' appears in the body, postcondition
			-- or rescue clause of inline agent `an_agent' in `a_class', but the
			-- associated feature of `an_agent' is a procedure.
			--
			-- ETL2: p.276
			-- ETR: p.61
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_result_not_void: a_result /= Void
			an_agent_not_void: an_agent /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_veen2_error (a_class) then
				create an_error.make_veen2g (a_class, a_result, an_agent)
				report_validity_error (an_error)
			end
		end

	report_veen8a_error (a_class: ET_CLASS; an_identifier: ET_IDENTIFIER; a_feature: ET_FEATURE)
			-- Report VEEN-8 error: `an_identifier', appearing in `a_feature'
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_veen8_error (a_class) then
				create an_error.make_veen8a (a_class, an_identifier, a_feature)
				report_validity_error (an_error)
			end
		end

	report_veen8b_error (a_class: ET_CLASS; an_identifier: ET_IDENTIFIER)
			-- Report VEEN-8 error: `an_identifier', appearing in the invariant
			-- of `a_class' or one of its (possibly nested) inline agents, is an
			-- object-test local that is used outside of its scope.
			--
			-- ECMA-367-2: p.103
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_identifier_not_void: an_identifier /= Void
			an_identifier_object_test_local: an_identifier.is_object_test_local
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_veen8_error (a_class) then
				create an_error.make_veen8b (a_class, an_identifier)
				report_validity_error (an_error)
			end
		end

	report_veen9a_error (a_class: ET_CLASS; an_identifier: ET_IDENTIFIER; a_feature: ET_FEATURE)
			-- Report VEEN-9 error: `an_identifier', appearing in `a_feature'
			-- of `a_class' or one of its (possibly nested) inline agents, is an
			-- iteration item that is used outside of its scope.
			--
			-- Not in ECMA-367-2.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_identifier_not_void: an_identifier /= Void
			an_identifier_iteration_item: an_identifier.is_iteration_item
			a_feature_not_void: a_feature /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_veen9_error (a_class) then
				create an_error.make_veen9a (a_class, an_identifier, a_feature)
				report_validity_error (an_error)
			end
		end

	report_veen9b_error (a_class: ET_CLASS; an_identifier: ET_IDENTIFIER)
			-- Report VEEN-9 error: `an_identifier', appearing in the invariant
			-- of `a_class' or one of its (possibly nested) inline agents, is an
			-- iteration item that is used outside of its scope.
			--
			-- Not in ECMA-367-2.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_identifier_not_void: an_identifier /= Void
			an_identifier_iteration_item: an_identifier.is_iteration_item
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_veen9_error (a_class) then
				create an_error.make_veen9b (a_class, an_identifier)
				report_validity_error (an_error)
			end
		end

	report_vevi0a_error (a_class, a_class_impl: ET_CLASS; a_name: ET_IDENTIFIER; a_local: ET_LOCAL_VARIABLE)
			-- Report VEVI error: the local variable `a_local', declared of attached type
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vevi_error (a_class) then
				create an_error.make_vevi0a (a_class, a_class_impl, a_name, a_local)
				report_validity_error (an_error)
			end
		end

	report_vevi0b_error (a_class, a_class_impl: ET_CLASS; a_result: ET_RESULT)
			-- Report VEVI error: the 'Result' entity `a_result', declared of attached type
			-- is used before being initialized in class `a_class_impl' and viewed from
			-- one of its descendants `a_class' (possibly itself).
			--
			-- ECMA-367-2: p.105
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_result_not_void: a_result /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vevi_error (a_class) then
				create an_error.make_vevi0b (a_class, a_class_impl, a_result)
				report_validity_error (an_error)
			end
		end

	report_vevi0c_error (a_class, a_class_impl: ET_CLASS; a_function: ET_INTERNAL_FUNCTION)
			-- Report VEVI error: the 'Result' entity declared of attached type
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vevi_error (a_class) then
				create an_error.make_vevi0c (a_class, a_class_impl, a_function)
				report_validity_error (an_error)
			end
		end

	report_vevi0d_error (a_class, a_class_impl: ET_CLASS; a_agent: ET_INTERNAL_FUNCTION_INLINE_AGENT)
			-- Report VEVI error: the 'Result' entity declared of attached type
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vevi_error (a_class) then
				create an_error.make_vevi0d (a_class, a_class_impl, a_agent)
				report_validity_error (an_error)
			end
		end

	report_vevi0e_error (a_class, a_class_impl: ET_CLASS; a_attribute: ET_EXTENDED_ATTRIBUTE)
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vevi_error (a_class) then
				create an_error.make_vevi0e (a_class, a_class_impl, a_attribute)
				report_validity_error (an_error)
			end
		end

	report_vfac1a_error (a_class: ET_CLASS; an_assigner: ET_FEATURE_NAME; a_query: ET_QUERY)
			-- Report VFAC-1 error: `a_query' has an assigner `an_assigner'
			-- but there is not feature with that name in `a_class'.
			--
			-- ECMA 367-2: p.41
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_assigner_not_void: an_assigner /= Void
			a_query_not_void: a_query /= Void
			a_query_has_assigner: a_query.assigner /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vfac1_error (a_class) then
				create an_error.make_vfac1a (a_class, an_assigner, a_query)
				report_validity_error (an_error)
			end
		end

	report_vfac1b_error (a_class: ET_CLASS; an_assigner: ET_FEATURE_NAME; a_query: ET_QUERY)
			-- Report VFAC-1 error: `a_query' has an assigner `an_assigner'
			-- but this feature is not a procedure.
			--
			-- ECMA 367-2: p.41
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_assigner_not_void: an_assigner /= Void
			a_query_not_void: a_query /= Void
			a_query_has_assigner: a_query.assigner /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vfac1_error (a_class) then
				create an_error.make_vfac1b (a_class, an_assigner, a_query)
				report_validity_error (an_error)
			end
		end

	report_vfac2a_error (a_class: ET_CLASS; an_assigner: ET_FEATURE_NAME; a_query: ET_QUERY; a_procedure: ET_PROCEDURE)
			-- Report VFAC-2 error: the number of argument in the
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vfac2_error (a_class) then
				create an_error.make_vfac2a (a_class, an_assigner, a_query, a_procedure)
				report_validity_error (an_error)
			end
		end

	report_vfac3a_error (a_class, a_class_impl: ET_CLASS; an_assigner: ET_FEATURE_NAME; a_query: ET_QUERY; a_procedure: ET_PROCEDURE)
			-- Report VFAC-3 error: the type of the first argument of the
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vfac3_error (a_class) then
				create an_error.make_vfac3a (a_class, a_class_impl, an_assigner, a_query, a_procedure)
				report_validity_error (an_error)
			end
		end

	report_vfac4a_error (a_class, a_class_impl: ET_CLASS; an_assigner: ET_FEATURE_NAME; a_query: ET_QUERY; a_procedure: ET_PROCEDURE; arg: INTEGER)
			-- Report VFAC-4 error: the type of the `arg'-th + 1 argument of the
			-- assigner procedure `a_procedure' in `a_class' and the type of the
			-- `arg'-th argument of `a_query' declared in `a_class_impl' (an ancestor
			-- of `a_class', possibly itself) do not have the same deanchored form.
			--
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vfac4_error (a_class) then
				create an_error.make_vfac4a (a_class, a_class_impl, an_assigner, a_query, a_procedure, arg)
				report_validity_error (an_error)
			end
		end

	report_vfav1a_error (a_class: ET_CLASS; a_feature: ET_FEATURE; a_alias_name: ET_ALIAS_NAME)
			-- Report VFAV-1 error: `a_feature' has a binary operator alias
			-- but is not a query with exactly one argument.
			--
			-- ECMA 367-2, 8.5.26 page 43.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_alias_name_not_void: a_alias_name /= Void
			a_feature_has_alias: attached a_feature.alias_names as l_alias_names and then l_alias_names.has (a_alias_name)
			a_alias_name_is_infix: a_alias_name.is_infix
			a_feature_not_infixable: not a_feature.is_infixable
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav1_error (a_class) then
				create an_error.make_vfav1a (a_class, a_feature, a_alias_name)
				report_validity_error (an_error)
			end
		end

	report_vfav1b_error (a_class: ET_CLASS; a_feature: ET_FEATURE; a_alias_name: ET_ALIAS_NAME)
			-- Report VFAV-1 error: `a_feature' has a unary operator alias
			-- but is not a query with no argument.
			--
			-- ECMA 367-2, 8.5.26 page 43.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_alias_name_not_void: a_alias_name /= Void
			a_feature_has_alias: attached a_feature.alias_names as l_alias_names and then l_alias_names.has (a_alias_name)
			a_alias_name_is_prefix: a_alias_name.is_prefix
			a_feature_not_prefixable: not a_feature.is_prefixable
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav1_error (a_class) then
				create an_error.make_vfav1b (a_class, a_feature, a_alias_name)
				report_validity_error (an_error)
			end
		end

	report_vfav1c_error (a_class: ET_CLASS; a_feature1: ET_FEATURE; a_alias_name1: ET_ALIAS_NAME; a_feature2: ET_FEATURE; a_alias_name2: ET_ALIAS_NAME)
			-- Report VFAV-1 error: `a_feature1' and `a_feature2' have
			-- the same unary operator alias.
			--
			-- ECMA 367-2, 8.5.26 page 43.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature1_not_void: a_feature1 /= Void
			a_alias_name1_not_void: a_alias_name1 /= Void
			a_feature1_has_alias: attached a_feature1.alias_names as l_feature1_alias_names and then l_feature1_alias_names.has (a_alias_name1)
			a_alias_name1_is_prefix: a_alias_name1.is_prefix
			a_feature2_not_void: a_feature2 /= Void
			a_alias_name2_not_void: a_alias_name2 /= Void
			a_feature2_has_alias: attached a_feature2.alias_names as l_feature2_alias_names and then l_feature2_alias_names.has (a_alias_name2)
			a_alias_name2_is_prefix: a_alias_name2.is_prefix
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav1_error (a_class) then
				create an_error.make_vfav1c (a_class, a_feature1, a_alias_name1, a_feature2, a_alias_name2)
				report_validity_error (an_error)
			end
		end

	report_vfav1d_error (a_class: ET_CLASS; a_feature1: ET_FEATURE; a_alias_name1: ET_ALIAS_NAME; a_feature2: ET_PARENT_FEATURE; a_alias_name2: ET_ALIAS_NAME)
			-- Report VFAV-1 error: `a_feature1' and `a_feature2' have
			-- the same unary operator alias.
			--
			-- ECMA 367-2, 8.5.26 page 43.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature1_not_void: a_feature1 /= Void
			a_alias_name1_not_void: a_alias_name1 /= Void
			a_feature1_has_alias: attached a_feature1.alias_names as l_feature1_alias_names and then l_feature1_alias_names.has (a_alias_name1)
			a_alias_name1_is_prefix: a_alias_name1.is_prefix
			a_feature2_not_void: a_feature2 /= Void
			a_alias_name2_not_void: a_alias_name2 /= Void
			a_feature2_has_alias: attached a_feature2.alias_names as l_feature2_alias_names and then l_feature2_alias_names.has (a_alias_name2)
			a_alias_name2_is_prefix: a_alias_name2.is_prefix
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav1_error (a_class) then
				create an_error.make_vfav1d (a_class, a_feature1, a_alias_name1, a_feature2, a_alias_name2)
				report_validity_error (an_error)
			end
		end

	report_vfav1e_error (a_class: ET_CLASS; a_feature1: ET_PARENT_FEATURE; a_alias_name1: ET_ALIAS_NAME; a_feature2: ET_PARENT_FEATURE; a_alias_name2: ET_ALIAS_NAME)
			-- Report VFAV-1 error: `a_feature1' and `a_feature2' have
			-- the same unary operator alias.
			--
			-- ECMA 367-2, 8.5.26 page 43.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature1_not_void: a_feature1 /= Void
			a_alias_name1_not_void: a_alias_name1 /= Void
			a_feature1_has_alias: attached a_feature1.alias_names as l_feature1_alias_names and then l_feature1_alias_names.has (a_alias_name1)
			a_alias_name1_is_prefix: a_alias_name1.is_prefix
			a_feature2_not_void: a_feature2 /= Void
			a_alias_name2_not_void: a_alias_name2 /= Void
			a_feature2_has_alias: attached a_feature2.alias_names as l_feature2_alias_names and then l_feature2_alias_names.has (a_alias_name2)
			a_alias_name2_is_prefix: a_alias_name2.is_prefix
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav1_error (a_class) then
				create an_error.make_vfav1e (a_class, a_feature1, a_alias_name1, a_feature2, a_alias_name2)
				report_validity_error (an_error)
			end
		end

	report_vfav1f_error (a_class: ET_CLASS; a_feature1: ET_FEATURE; a_alias_name1: ET_ALIAS_NAME; a_feature2: ET_FEATURE; a_alias_name2: ET_ALIAS_NAME)
			-- Report VFAV-1 error: `a_feature1' and `a_feature2' have
			-- the same binary operator alias.
			--
			-- ECMA 367-2, 8.5.26 page 43.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature1_not_void: a_feature1 /= Void
			a_alias_name1_not_void: a_alias_name1 /= Void
			a_feature1_has_alias: attached a_feature1.alias_names as l_feature1_alias_names and then l_feature1_alias_names.has (a_alias_name1)
			a_alias_name1_is_infix: a_alias_name1.is_infix
			a_feature2_not_void: a_feature2 /= Void
			a_alias_name2_not_void: a_alias_name2 /= Void
			a_feature2_has_alias: attached a_feature2.alias_names as l_feature2_alias_names and then l_feature2_alias_names.has (a_alias_name2)
			a_alias_name2_is_infix: a_alias_name2.is_infix
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav1_error (a_class) then
				create an_error.make_vfav1f (a_class, a_feature1, a_alias_name1, a_feature2, a_alias_name2)
				report_validity_error (an_error)
			end
		end

	report_vfav1g_error (a_class: ET_CLASS; a_feature1: ET_FEATURE; a_alias_name1: ET_ALIAS_NAME; a_feature2: ET_PARENT_FEATURE; a_alias_name2: ET_ALIAS_NAME)
			-- Report VFAV-1 error: `a_feature1' and `a_feature2' have
			-- the same binary operator alias.
			--
			-- ECMA 367-2, 8.5.26 page 43.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature1_not_void: a_feature1 /= Void
			a_alias_name1_not_void: a_alias_name1 /= Void
			a_feature1_has_alias: attached a_feature1.alias_names as l_feature1_alias_names and then l_feature1_alias_names.has (a_alias_name1)
			a_alias_name1_is_infix: a_alias_name1.is_infix
			a_feature2_not_void: a_feature2 /= Void
			a_alias_name2_not_void: a_alias_name2 /= Void
			a_feature2_has_alias: attached a_feature2.alias_names as l_feature2_alias_names and then l_feature2_alias_names.has (a_alias_name2)
			a_alias_name2_is_infix: a_alias_name2.is_infix
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav1_error (a_class) then
				create an_error.make_vfav1g (a_class, a_feature1, a_alias_name1, a_feature2, a_alias_name2)
				report_validity_error (an_error)
			end
		end

	report_vfav1h_error (a_class: ET_CLASS; a_feature1: ET_PARENT_FEATURE; a_alias_name1: ET_ALIAS_NAME; a_feature2: ET_PARENT_FEATURE; a_alias_name2: ET_ALIAS_NAME)
			-- Report VFAV-1 error: `a_feature1' and `a_feature2' have
			-- the same binary operator alias.
			--
			-- ECMA 367-2, 8.5.26 page 43.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature1_not_void: a_feature1 /= Void
			a_alias_name1_not_void: a_alias_name1 /= Void
			a_feature1_has_alias: attached a_feature1.alias_names as l_alias_names1 and then l_alias_names1.has (a_alias_name1)
			a_alias_name1_is_infix: a_alias_name1.is_infix
			a_feature2_not_void: a_feature2 /= Void
			a_alias_name2_not_void: a_alias_name2 /= Void
			a_feature2_has_alias: attached a_feature2.alias_names as l_alias_names2 and then l_alias_names2.has (a_alias_name2)
			a_alias_name2_is_infix: a_alias_name2.is_infix
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav1_error (a_class) then
				create an_error.make_vfav1h (a_class, a_feature1, a_alias_name1, a_feature2, a_alias_name2)
				report_validity_error (an_error)
			end
		end

	report_vfav1k_error (a_class: ET_CLASS; a_feature: ET_FEATURE; a_alias_name: ET_ALIAS_NAME)
			-- Report VFAV-1 error: `a_feature' has an operator alias
			-- which can be either unary or binary, but it is not a
			-- query with no argument or exactly one argument.
			--
			-- ECMA 367-2, 8.5.26 page 43.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_alias_name_not_void: a_alias_name /= Void
			a_feature_has_alias: attached a_feature.alias_names as l_alias_names and then l_alias_names.has (a_alias_name)
			a_alias_name_is_prefixable_and_infixable: a_alias_name.is_prefixable and a_alias_name.is_infixable
			a_feature_not_prefixable_nor_infixable: not a_feature.is_prefixable and not a_feature.is_infixable
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav1_error (a_class) then
				create an_error.make_vfav1k (a_class, a_feature, a_alias_name)
				report_validity_error (an_error)
			end
		end

	report_vfav1m_error (a_class: ET_CLASS; a_type: ET_BASE_TYPE; a_rename: ET_RENAME; a_new_alias_name: ET_ALIAS_NAME; f: ET_FEATURE)
			-- Report VFAV-1 error: the Rename_pair `a_rename' has
			-- a new name with a binary operator alias,
			-- but the corresponding feature `f' is not a
			-- function with exactly one argument.
			-- `a_type' is either the parent or generic constraint
			-- where the rename clause appears.
			--
			-- ECMA 367-2, 8.5.26 page 43.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
			a_rename_not_void: a_rename /= Void
			a_new_alias_name_not_void: a_new_alias_name /= Void
			a_rename_has_alias: attached a_rename.new_name.alias_names as l_new_alias_names and then l_new_alias_names.has (a_new_alias_name)
			a_new_alias_name_is_infix: a_new_alias_name.is_infix
			f_not_void: f /= Void
			f_not_infixable: not f.is_infixable
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav1_error (a_class) then
				create an_error.make_vfav1m (a_class, a_type, a_rename, a_new_alias_name, f)
				report_validity_error (an_error)
			end
		end

	report_vfav1n_error (a_class: ET_CLASS; a_type: ET_BASE_TYPE; a_rename: ET_RENAME; a_new_alias_name: ET_ALIAS_NAME; f: ET_FEATURE)
			-- Report VFAV-1 error: the Rename_pair `a_rename' has
			-- a new name with a unary operator alias,
			-- but the corresponding feature `f' is not a
			-- query with no argument.
			-- `a_type' is either the parent or generic constraint
			-- where the rename clause appears.
			--
			-- ECMA 367-2, 8.5.26 page 43.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
			a_rename_not_void: a_rename /= Void
			a_new_alias_name_not_void: a_new_alias_name /= Void
			a_rename_has_alias: attached a_rename.new_name.alias_names as l_new_name_alias_names and then l_new_name_alias_names.has (a_new_alias_name)
			a_new_alias_name_is_prefix: a_new_alias_name.is_prefix
			f_not_void: f /= Void
			f_not_prefixable: not f.is_prefixable
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav1_error (a_class) then
				create an_error.make_vfav1n (a_class, a_type, a_rename, a_new_alias_name, f)
				report_validity_error (an_error)
			end
		end

	report_vfav1p_error (a_class: ET_CLASS; a_type: ET_BASE_TYPE; a_rename: ET_RENAME; a_new_alias_name: ET_ALIAS_NAME; f: ET_FEATURE)
			-- Report VFAV-1 error: the Rename_pair `a_rename' has a new name
			-- with an operator alias which can be either unary or binary,
			-- but the corresponding feature `f' is not a query with no argument
			-- or exactly one argument.
			-- `a_type' is either the parent or generic constraint
			-- where the rename clause appears
			--
			-- ECMA 367-2, 8.5.26 page 43.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
			a_rename_not_void: a_rename /= Void
			a_new_alias_name_not_void: a_new_alias_name /= Void
			a_rename_has_alias: attached a_rename.new_name.alias_names as l_new_name_alias_names and then l_new_name_alias_names.has (a_new_alias_name)
			a_new_alias_name_is_prefixable_and_infixable: a_new_alias_name.is_prefixable and a_new_alias_name.is_infixable
			f_not_void: f /= Void
			f_not_prefixable_nor_infixable: not f.is_prefixable and not not f.is_infixable
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav1_error (a_class) then
				create an_error.make_vfav1p (a_class, a_type, a_rename, a_new_alias_name, f)
				report_validity_error (an_error)
			end
		end

	report_vfav1q_error (a_class: ET_CLASS; a_constraint: ET_BASE_TYPE; a_rename1, a_rename2: ET_RENAME; a_alias_name: ET_ALIAS_NAME; a_formal: ET_FORMAL_PARAMETER)
			-- Report VFAV-1 error: a unary operator alias name appears more than once
			-- (e.g. also in `a_rename1') as second element of the Rename_pair
			-- `a_rename2' in the constraint `a_constraint' of formal parameter
			-- `a_formal' in `a_class'.
			--
			-- ECMA 367-2, 8.12.9 page 80.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_constraint_not_void: a_constraint /= Void
			a_rename1_not_void: a_rename1 /= Void
			a_rename2_not_void: a_rename2 /= Void
			a_alias_name_not_void: a_alias_name /= Void
			a_rename2_has_alias: attached a_rename2.new_name.alias_names as l_new_alias_names and then l_new_alias_names.has (a_alias_name)
			a_alias_name_is_prefix: a_alias_name.is_prefix
			a_formal_not_void: a_formal /= Void
		local
			l_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav1_error (a_class) then
				create l_error.make_vfav1q (a_class, a_constraint, a_rename1, a_rename2, a_alias_name, a_formal)
				report_validity_error (l_error)
			end
		end

	report_vfav1r_error (a_class: ET_CLASS; a_constraint: ET_BASE_TYPE; a_rename1, a_rename2: ET_RENAME; a_alias_name: ET_ALIAS_NAME; a_formal: ET_FORMAL_PARAMETER)
			-- Report VFAV-1 error: a binary operator alias name appears more than once
			-- (e.g. also in `a_rename1') as second element of the Rename_pair
			-- `a_rename2' in the constraint `a_constraint' of formal parameter
			-- `a_formal' in `a_class'.
			--
			-- ECMA 367-2, 8.12.9 page 80.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_constraint_not_void: a_constraint /= Void
			a_rename1_not_void: a_rename1 /= Void
			a_rename2_not_void: a_rename2 /= Void
			a_alias_name_not_void: a_alias_name /= Void
			a_rename2_has_alias: attached a_rename2.new_name.alias_names as l_new_alias_names and then l_new_alias_names.has (a_alias_name)
			a_alias_name_is_inefix: a_alias_name.is_infix
			a_formal_not_void: a_formal /= Void
		local
			l_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav1_error (a_class) then
				create l_error.make_vfav1r (a_class, a_constraint, a_rename1, a_rename2, a_alias_name, a_formal)
				report_validity_error (l_error)
			end
		end

	report_vfav1s_error (a_class: ET_CLASS; a_constraint: ET_BASE_TYPE; a_rename: ET_RENAME; a_alias_name: ET_ALIAS_NAME; a_feature: ET_FEATURE; a_formal: ET_FORMAL_PARAMETER)
			-- Report VFAV-1 error: the unary operator alias name which appears as second
			-- element of the Rename_pair `a_rename' in the constraint `a_constraint'
			-- of formal parameter `a_formal' in `a_class' is already the name of the
			-- alias of `a_feature' in `a_constraint'.
			--
			-- ECMA 367-2, 8.12.9 page 80.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_constraint_not_void: a_constraint /= Void
			a_rename_not_void: a_rename /= Void
			a_alias_name_not_void: a_alias_name /= Void
			a_rename_has_alias: attached a_rename.new_name.alias_names as l_new_alias_names and then l_new_alias_names.has (a_alias_name)
			a_alias_name_is_prefix: a_alias_name.is_prefix
			a_feature_not_void: a_feature /= Void
			a_formal_not_void: a_formal /= Void
		local
			l_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav1_error (a_class) then
				create l_error.make_vfav1s (a_class, a_constraint, a_rename, a_alias_name, a_feature, a_formal)
				report_validity_error (l_error)
			end
		end

	report_vfav1t_error (a_class: ET_CLASS; a_constraint: ET_BASE_TYPE; a_rename: ET_RENAME; a_alias_name: ET_ALIAS_NAME; a_feature: ET_FEATURE; a_formal: ET_FORMAL_PARAMETER)
			-- Report VFAV-1 error: the binary operator alias name which appears as second
			-- element of the Rename_pair `a_rename' in the constraint `a_constraint'
			-- of formal parameter `a_formal' in `a_class' is already the name of the
			-- alias of `a_feature' in `a_constraint'.
			--
			-- ECMA 367-2, 8.12.9 page 80.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_constraint_not_void: a_constraint /= Void
			a_rename_not_void: a_rename /= Void
			a_alias_name_not_void: a_alias_name /= Void
			a_rename_has_alias: attached a_rename.new_name.alias_names as l_new_alias_names and then l_new_alias_names.has (a_alias_name)
			a_alias_name_is_infix: a_alias_name.is_infix
			a_feature_not_void: a_feature /= Void
			a_formal_not_void: a_formal /= Void
		local
			l_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav1_error (a_class) then
				create l_error.make_vfav1t (a_class, a_constraint, a_rename, a_alias_name, a_feature, a_formal)
				report_validity_error (l_error)
			end
		end

	report_vfav2a_error (a_class: ET_CLASS; a_feature: ET_FEATURE; a_alias_name: ET_ALIAS_NAME)
			-- Report VFAV-2 error: `a_feature' has a bracket alias
			-- but is not a function with at least one argument.
			--
			-- ECMA 367-2, 8.5.26 page 43.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_alias_name_not_void: a_alias_name /= Void
			a_feature_has_alias: attached a_feature.alias_names as l_alias_names and then l_alias_names.has (a_alias_name)
			a_alias_name_is_bracket: a_alias_name.is_bracket
			a_feature_not_bracketable: not a_feature.is_bracketable
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav2_error (a_class) then
				create an_error.make_vfav2a (a_class, a_feature, a_alias_name)
				report_validity_error (an_error)
			end
		end

	report_vfav2b_error (a_class: ET_CLASS; a_feature1: ET_FEATURE; a_alias_name1: ET_ALIAS_NAME; a_feature2: ET_FEATURE; a_alias_name2: ET_ALIAS_NAME)
			-- Report VFAV-2 error: `a_feature1' and `a_feature2' have both
			-- a bracket alias.
			--
			-- ECMA 367-2, 8.5.26 page 43.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature1_not_void: a_feature1 /= Void
			a_alias_name1_not_void: a_alias_name1 /= Void
			a_feature1_has_alias: attached a_feature1.alias_names as l_alias_names1 and then l_alias_names1.has (a_alias_name1)
			a_alias_name1_is_bracket: a_alias_name1.is_bracket
			a_feature2_not_void: a_feature2 /= Void
			a_alias_name2_not_void: a_alias_name2 /= Void
			a_feature2_has_alias: attached a_feature2.alias_names as l_alias_names2 and then l_alias_names2.has (a_alias_name2)
			a_alias_name2_is_bracket: a_alias_name2.is_bracket
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav2_error (a_class) then
				create an_error.make_vfav2b (a_class, a_feature1, a_alias_name1, a_feature2, a_alias_name2)
				report_validity_error (an_error)
			end
		end

	report_vfav2c_error (a_class: ET_CLASS; a_feature1: ET_FEATURE; a_alias_name1: ET_ALIAS_NAME; a_feature2: ET_PARENT_FEATURE; a_alias_name2: ET_ALIAS_NAME)
			-- Report VFAV-2 error: `a_feature1' and `a_feature2' have both
			-- a bracket alias.
			--
			-- ECMA 367-2, 8.5.26 page 43.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature1_not_void: a_feature1 /= Void
			a_alias_name1_not_void: a_alias_name1 /= Void
			a_feature1_has_alias: attached a_feature1.alias_names as l_alias_names1 and then l_alias_names1.has (a_alias_name1)
			a_alias_name1_is_bracket: a_alias_name1.is_bracket
			a_feature2_not_void: a_feature2 /= Void
			a_alias_name2_not_void: a_alias_name2 /= Void
			a_feature2_has_alias: attached a_feature2.alias_names as l_alias_names2 and then l_alias_names2.has (a_alias_name2)
			a_alias_name2_is_bracket: a_alias_name2.is_bracket
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav2_error (a_class) then
				create an_error.make_vfav2c (a_class, a_feature1, a_alias_name1, a_feature2, a_alias_name2)
				report_validity_error (an_error)
			end
		end

	report_vfav2d_error (a_class: ET_CLASS; a_feature1: ET_PARENT_FEATURE; a_alias_name1: ET_ALIAS_NAME; a_feature2: ET_PARENT_FEATURE; a_alias_name2: ET_ALIAS_NAME)
			-- Report VFAV-2 error: `a_feature1' and `a_feature2' have both
			-- a bracket alias.
			--
			-- ECMA 367-2, 8.5.26 page 43.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature1_not_void: a_feature1 /= Void
			a_alias_name1_not_void: a_alias_name1 /= Void
			a_feature1_has_alias: attached a_feature1.alias_names as l_alias_names1 and then l_alias_names1.has (a_alias_name1)
			a_alias_name1_is_bracket: a_alias_name1.is_bracket
			a_feature2_not_void: a_feature2 /= Void
			a_alias_name2_not_void: a_alias_name2 /= Void
			a_feature2_has_alias: attached a_feature2.alias_names as l_alias_names2 and then l_alias_names2.has (a_alias_name2)
			a_alias_name2_is_bracket: a_alias_name2.is_bracket
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav2_error (a_class) then
				create an_error.make_vfav2d (a_class, a_feature1, a_alias_name1, a_feature2, a_alias_name2)
				report_validity_error (an_error)
			end
		end

	report_vfav2e_error (a_class: ET_CLASS; a_type: ET_BASE_TYPE; a_rename: ET_RENAME; a_new_alias_name: ET_ALIAS_NAME; f: ET_FEATURE)
			-- Report VFAV-2 error: the Rename_pair
			-- `a_rename' has a new_name with a bracket alias,
			-- but the corresponding feature `f' is not a
			-- function with at least one argument.
			-- `a_type' is either the parent or generic constraint
			-- where the rename clause appears.
			--
			-- ECMA 367-2, 8.5.26 page 43.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
			a_rename_not_void: a_rename /= Void
			a_new_alias_name_not_void: a_new_alias_name /= Void
			a_rename_has_alias: attached a_rename.new_name.alias_names as l_new_alias_names and then l_new_alias_names.has (a_new_alias_name)
			a_new_alias_name_is_bracket: a_new_alias_name.is_bracket
			f_not_void: f /= Void
			f_not_bracketable: not f.is_bracketable
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav2_error (a_class) then
				create an_error.make_vfav2e (a_class, a_type, a_rename, a_new_alias_name, f)
				report_validity_error (an_error)
			end
		end

	report_vfav2f_error (a_class: ET_CLASS; a_constraint: ET_BASE_TYPE; a_rename1, a_rename2: ET_RENAME; a_alias_name: ET_ALIAS_NAME; a_formal: ET_FORMAL_PARAMETER)
			-- Report VFAV-2 error: a bracket alias name appears more than once
			-- (e.g. also in `a_rename1') as second element of the Rename_pair
			-- `a_rename2' in the constraint `a_constraint' of formal parameter
			-- `a_formal' in `a_class'.
			--
			-- ECMA 367-2, 8.12.9 page 80.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_constraint_not_void: a_constraint /= Void
			a_rename1_not_void: a_rename1 /= Void
			a_rename2_not_void: a_rename2 /= Void
			a_alias_name_not_void: a_alias_name /= Void
			a_rename2_has_alias: attached a_rename2.new_name.alias_names as l_new_alias_names and then l_new_alias_names.has (a_alias_name)
			a_alias_name_is_bracket: a_alias_name.is_bracket
			a_formal_not_void: a_formal /= Void
		local
			l_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav2_error (a_class) then
				create l_error.make_vfav2f (a_class, a_constraint, a_rename1, a_rename2, a_alias_name, a_formal)
				report_validity_error (l_error)
			end
		end

	report_vfav2g_error (a_class: ET_CLASS; a_constraint: ET_BASE_TYPE; a_rename: ET_RENAME; a_alias_name: ET_ALIAS_NAME; a_feature: ET_FEATURE; a_formal: ET_FORMAL_PARAMETER)
			-- Report VFAV-2 error: the bracket alias name which appears as second
			-- element of the Rename_pair `a_rename' in the constraint `a_constraint'
			-- of formal parameter `a_formal' in `a_class' is already the name of the
			-- alias of `a_feature' in `a_constraint'.
			--
			-- ECMA 367-2, 8.12.9 page 80.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_constraint_not_void: a_constraint /= Void
			a_rename_not_void: a_rename /= Void
			a_alias_name_not_void: a_alias_name /= Void
			a_rename_has_alias: attached a_rename.new_name.alias_names as l_new_alias_names and then l_new_alias_names.has (a_alias_name)
			a_alias_name_is_bracket: a_alias_name.is_bracket
			a_feature_not_void: a_feature /= Void
			a_formal_not_void: a_formal /= Void
		local
			l_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav2_error (a_class) then
				create l_error.make_vfav2g (a_class, a_constraint, a_rename, a_alias_name, a_feature, a_formal)
				report_validity_error (l_error)
			end
		end

	report_vfav3a_error (a_class: ET_CLASS; a_feature: ET_FEATURE; a_alias_name: ET_ALIAS_NAME)
			-- Report VFAV-3 error: `a_feature' has a parenthesis alias
			-- but is not a feature with at least one argument.
			--
			-- ECMA 367-3 (working version 3-36), 8.5.27 page 25.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_alias_name_not_void: a_alias_name /= Void
			a_feature_has_alias: attached a_feature.alias_names as l_alias_names and then l_alias_names.has (a_alias_name)
			aa_alias_name_is_parenthesis: a_alias_name.is_parenthesis
			a_feature_not_parenthesisable: not a_feature.is_parenthesisable
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav3_error (a_class) then
				create an_error.make_vfav3a (a_class, a_feature, a_alias_name)
				report_validity_error (an_error)
			end
		end

	report_vfav3b_error (a_class: ET_CLASS; a_feature1: ET_FEATURE; a_alias_name1: ET_ALIAS_NAME; a_feature2: ET_FEATURE; a_alias_name2: ET_ALIAS_NAME)
			-- Report VFAV-3 error: `a_feature1' and `a_feature2' have both
			-- a parenthesis alias.
			--
			-- ECMA 367-3 (working version 3-36), 8.5.27 page 25.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature1_not_void: a_feature1 /= Void
			a_alias_name1_not_void: a_alias_name1 /= Void
			a_feature1_has_alias: attached a_feature1.alias_names as l_alias_names1 and then l_alias_names1.has (a_alias_name1)
			a_alias_name1_is_parenthesis: a_alias_name1.is_parenthesis
			a_feature2_not_void: a_feature2 /= Void
			a_alias_name2_not_void: a_alias_name2 /= Void
			a_feature2_has_alias: attached a_feature2.alias_names as l_alias_names2 and then l_alias_names2.has (a_alias_name2)
			a_alias_name2_is_parenthesis: a_alias_name2.is_parenthesis
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav3_error (a_class) then
				create an_error.make_vfav3b (a_class, a_feature1, a_alias_name1, a_feature2, a_alias_name2)
				report_validity_error (an_error)
			end
		end

	report_vfav3c_error (a_class: ET_CLASS; a_feature1: ET_FEATURE; a_alias_name1: ET_ALIAS_NAME; a_feature2: ET_PARENT_FEATURE; a_alias_name2: ET_ALIAS_NAME)
			-- Report VFAV-3 error: `a_feature1' and `a_feature2' have both
			-- a parenthesis alias.
			--
			-- ECMA 367-3 (working version 3-36), 8.5.27 page 25.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature1_not_void: a_feature1 /= Void
			a_alias_name1_not_void: a_alias_name1 /= Void
			a_feature1_has_alias: attached a_feature1.alias_names as l_alias_names1 and then l_alias_names1.has (a_alias_name1)
			a_alias_name1_is_parenthesis: a_alias_name1.is_parenthesis
			a_feature2_not_void: a_feature2 /= Void
			a_alias_name2_not_void: a_alias_name2 /= Void
			a_feature2_has_alias: attached a_feature2.alias_names as l_alias_names2 and then l_alias_names2.has (a_alias_name2)
			a_alias_name2_is_parenthesis: a_alias_name2.is_parenthesis
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav3_error (a_class) then
				create an_error.make_vfav3c (a_class, a_feature1, a_alias_name1, a_feature2, a_alias_name2)
				report_validity_error (an_error)
			end
		end

	report_vfav3d_error (a_class: ET_CLASS; a_feature1: ET_PARENT_FEATURE; a_alias_name1: ET_ALIAS_NAME; a_feature2: ET_PARENT_FEATURE; a_alias_name2: ET_ALIAS_NAME)
			-- Report VFAV-3 error: `a_feature1' and `a_feature2' have both
			-- a parenthesis alias.
			--
			-- ECMA 367-3 (working version 3-36), 8.5.27 page 25.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature1_not_void: a_feature1 /= Void
			a_alias_name1_not_void: a_alias_name1 /= Void
			a_feature1_has_alias: attached a_feature1.alias_names as l_alias_names1 and then l_alias_names1.has (a_alias_name1)
			a_alias_name1_is_parenthesis: a_alias_name1.is_parenthesis
			a_feature2_not_void: a_feature2 /= Void
			a_alias_name2_not_void: a_alias_name2 /= Void
			a_feature2_has_alias: attached a_feature2.alias_names as l_alias_names2 and then l_alias_names2.has (a_alias_name2)
			a_alias_name2_is_parenthesis: a_alias_name2.is_parenthesis
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav3_error (a_class) then
				create an_error.make_vfav3d (a_class, a_feature1, a_alias_name1, a_feature2, a_alias_name2)
				report_validity_error (an_error)
			end
		end

	report_vfav3e_error (a_class: ET_CLASS; a_type: ET_BASE_TYPE; a_rename: ET_RENAME; a_new_alias_name: ET_ALIAS_NAME; f: ET_FEATURE)
			-- Report VFAV-3 error: the Rename_pair
			-- `a_rename' has a new_name with a parenthesis alias,
			-- but the corresponding feature `f' is not a
			-- feature with at least one argument.
			-- `a_type' is either the parent or generic constraint
			-- where the rename clause appears.
			--
			-- ECMA 367-3 (working version 3-36), 8.5.27 page 25.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
			a_rename_not_void: a_rename /= Void
			a_new_alias_name_not_void: a_new_alias_name /= Void
			a_rename_has_alias: attached a_rename.new_name.alias_names as l_new_alias_names and then l_new_alias_names.has (a_new_alias_name)
			a_new_alias_name_is_parenthesis: a_new_alias_name.is_parenthesis
			f_not_void: f /= Void
			f_not_parenthesisable: not f.is_parenthesisable
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav3_error (a_class) then
				create an_error.make_vfav3e (a_class, a_type, a_rename, a_new_alias_name, f)
				report_validity_error (an_error)
			end
		end

	report_vfav3f_error (a_class: ET_CLASS; a_constraint: ET_BASE_TYPE; a_rename1, a_rename2: ET_RENAME; a_alias_name: ET_ALIAS_NAME; a_formal: ET_FORMAL_PARAMETER)
			-- Report VFAV-3 error: a parenthesis alias name appears more than
			-- once (e.g. also in `a_rename1') as second element of the Rename_pair
			-- `a_rename2' in the constraint `a_constraint' of formal parameter
			-- `a_formal' in `a_class'.
			--
			-- ECMA 367-3 (working version 3-36), 8.5.27 page 25.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_constraint_not_void: a_constraint /= Void
			a_rename1_not_void: a_rename1 /= Void
			a_rename2_not_void: a_rename2 /= Void
			a_alias_name_not_void: a_alias_name /= Void
			a_rename2_has_alias: attached a_rename2.new_name.alias_names as l_new_alias_names and then l_new_alias_names.has (a_alias_name)
			a_alias_name_is_parenthesis: a_alias_name.is_parenthesis
			a_formal_not_void: a_formal /= Void
		local
			l_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav3_error (a_class) then
				create l_error.make_vfav3f (a_class, a_constraint, a_rename1, a_rename2, a_alias_name, a_formal)
				report_validity_error (l_error)
			end
		end

	report_vfav3g_error (a_class: ET_CLASS; a_constraint: ET_BASE_TYPE; a_rename: ET_RENAME; a_alias_name: ET_ALIAS_NAME; a_feature: ET_FEATURE; a_formal: ET_FORMAL_PARAMETER)
			-- Report VFAV-3 error: the parenthesis alias name which appears as second
			-- element of the Rename_pair `a_rename' in the constraint `a_constraint'
			-- of formal parameter `a_formal' in `a_class' is already the name of the
			-- alias of `a_feature' in `a_constraint'.
			--
			-- ECMA 367-3 (working version 3-36), 8.5.27 page 25.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_constraint_not_void: a_constraint /= Void
			a_rename_not_void: a_rename /= Void
			a_alias_name_not_void: a_alias_name /= Void
			a_rename_has_alias: attached a_rename.new_name.alias_names as l_new_alias_names and then l_new_alias_names.has (a_alias_name)
			a_alias_name_is_parenthesis: a_alias_name.is_parenthesis
			a_feature_not_void: a_feature /= Void
			a_formal_not_void: a_formal /= Void
		local
			l_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav3_error (a_class) then
				create l_error.make_vfav3g (a_class, a_constraint, a_rename, a_alias_name, a_feature, a_formal)
				report_validity_error (l_error)
			end
		end

	report_vfav4a_error (a_class: ET_CLASS; a_feature: ET_FEATURE; a_alias_name: ET_ALIAS_NAME)
			-- Report VFAV-4 error: `a_feature' has more than once a bracket alias name.
			--
			-- Not in ECMA.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_alias_name_not_void: a_alias_name /= Void
			a_feature_has_alias: attached a_feature.alias_names as l_alias_names and then l_alias_names.has (a_alias_name)
			a_alias_name_is_bracket: a_alias_name.is_bracket
		local
			l_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav4_error (a_class) then
				create l_error.make_vfav4a (a_class, a_feature, a_alias_name)
				report_validity_error (l_error)
			end
		end

	report_vfav4b_error (a_class: ET_CLASS; a_feature: ET_FEATURE; a_alias_name: ET_ALIAS_NAME)
			-- Report VFAV-4 error: `a_feature' has more than once a parenthesis alias name.
			--
			-- Not in ECMA.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_alias_name_not_void: a_alias_name /= Void
			a_feature_has_alias: attached a_feature.alias_names as l_alias_names and then l_alias_names.has (a_alias_name)
			a_alias_name_is_parenthesis: a_alias_name.is_parenthesis
		local
			l_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav4_error (a_class) then
				create l_error.make_vfav4b (a_class, a_feature, a_alias_name)
				report_validity_error (l_error)
			end
		end

	report_vfav4c_error (a_class: ET_CLASS; a_feature: ET_FEATURE; a_alias_name: ET_ALIAS_NAME)
			-- Report VFAV-4 error: `a_feature' has more than once the same unary operator alias name.
			--
			-- Not in ECMA.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_alias_name_not_void: a_alias_name /= Void
			a_feature_has_alias: attached a_feature.alias_names as l_alias_names and then l_alias_names.has (a_alias_name)
			a_alias_name_is_prefix: a_alias_name.is_prefix
		local
			l_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav4_error (a_class) then
				create l_error.make_vfav4c (a_class, a_feature, a_alias_name)
				report_validity_error (l_error)
			end
		end

	report_vfav4d_error (a_class: ET_CLASS; a_feature: ET_FEATURE; a_alias_name: ET_ALIAS_NAME)
			-- Report VFAV-4 error: `a_feature' has more than once the same binary operator alias name.
			--
			-- Not in ECMA.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_alias_name_not_void: a_alias_name /= Void
			a_feature_has_alias: attached a_feature.alias_names as l_alias_names and then l_alias_names.has (a_alias_name)
			a_alias_name_is_infix: a_alias_name.is_infix
		local
			l_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav4_error (a_class) then
				create l_error.make_vfav4d (a_class, a_feature, a_alias_name)
				report_validity_error (l_error)
			end
		end

	report_vfav4e_error (a_class: ET_CLASS; a_parent_type: ET_BASE_TYPE; a_rename: ET_RENAME; a_alias_name: ET_ALIAS_NAME)
			-- Report VFAV-4 error: a bracket alias name appears more than once
			-- in the second element of the Rename_pair `a_rename' in the
			-- parent `a_parent_type' of `a_class'.
			--
			-- Not in ECMA.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_type_not_void: a_parent_type /= Void
			a_rename_not_void: a_rename /= Void
			a_alias_name_not_void: a_alias_name /= Void
			a_rename_has_alias: attached a_rename.new_name.alias_names as l_new_alias_names and then l_new_alias_names.has (a_alias_name)
			a_alias_name_is_bracket: a_alias_name.is_bracket
		local
			l_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav4_error (a_class) then
				create l_error.make_vfav4e (a_class, a_parent_type, a_rename, a_alias_name)
				report_validity_error (l_error)
			end
		end

	report_vfav4f_error (a_class: ET_CLASS; a_parent_type: ET_BASE_TYPE; a_rename: ET_RENAME; a_alias_name: ET_ALIAS_NAME)
			-- Report VFAV-4 error: a parenthesis alias name appears more than once
			-- in the second element of the Rename_pair `a_rename' in the
			-- parent `a_parent_type' of `a_class'.
			--
			-- Not in ECMA.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_type_not_void: a_parent_type /= Void
			a_rename_not_void: a_rename /= Void
			a_alias_name_not_void: a_alias_name /= Void
			a_rename_has_alias: attached a_rename.new_name.alias_names as l_new_alias_names and then l_new_alias_names.has (a_alias_name)
			a_alias_name_is_parenthesis: a_alias_name.is_parenthesis
		local
			l_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav4_error (a_class) then
				create l_error.make_vfav4f (a_class, a_parent_type, a_rename, a_alias_name)
				report_validity_error (l_error)
			end
		end

	report_vfav4g_error (a_class: ET_CLASS; a_parent_type: ET_BASE_TYPE; a_rename: ET_RENAME; a_alias_name: ET_ALIAS_NAME)
			-- Report VFAV-4 error: a unary operator alias name appears more than once
			-- in the second element of the Rename_pair `a_rename' in the
			-- parent `a_parent_type' of `a_class'.
			--
			-- Not in ECMA.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_type_not_void: a_parent_type /= Void
			a_rename_not_void: a_rename /= Void
			a_alias_name_not_void: a_alias_name /= Void
			a_rename_has_alias: attached a_rename.new_name.alias_names as l_new_alias_names and then l_new_alias_names.has (a_alias_name)
			a_alias_name_is_prefix: a_alias_name.is_prefix
		local
			l_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav4_error (a_class) then
				create l_error.make_vfav4g (a_class, a_parent_type, a_rename, a_alias_name)
				report_validity_error (l_error)
			end
		end

	report_vfav4h_error (a_class: ET_CLASS; a_parent_type: ET_BASE_TYPE; a_rename: ET_RENAME; a_alias_name: ET_ALIAS_NAME)
			-- Report VFAV-4 error: a binary operator alias name appears more than once
			-- in the second element of the Rename_pair `a_rename' in the
			-- parent `a_parent_type' of `a_class'.
			--
			-- Not in ECMA.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_type_not_void: a_parent_type /= Void
			a_rename_not_void: a_rename /= Void
			a_alias_name_not_void: a_alias_name /= Void
			a_rename_has_alias: attached a_rename.new_name.alias_names as l_new_alias_names and then l_new_alias_names.has (a_alias_name)
			a_alias_name_is_infix: a_alias_name.is_infix
		local
			l_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav4_error (a_class) then
				create l_error.make_vfav4h (a_class, a_parent_type, a_rename, a_alias_name)
				report_validity_error (l_error)
			end
		end

	report_vfav4i_error (a_class: ET_CLASS; a_constraint: ET_BASE_TYPE; a_rename: ET_RENAME; a_alias_name: ET_ALIAS_NAME; a_formal: ET_FORMAL_PARAMETER)
			-- Report VFAV-4 error: a bracket alias name appears more than once
			-- in the second element of the Rename_pair `a_rename' in the
			-- constraint `a_constraint' of formal parameter `a_formal' in
			-- `a_class'.
			--
			-- Not in ECMA.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_constraint_not_void: a_constraint /= Void
			a_rename_not_void: a_rename /= Void
			a_alias_name_not_void: a_alias_name /= Void
			a_rename_has_alias: attached a_rename.new_name.alias_names as l_new_alias_names and then l_new_alias_names.has (a_alias_name)
			a_alias_name_is_bracket: a_alias_name.is_bracket
			a_formal_not_void: a_formal /= Void
		local
			l_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav4_error (a_class) then
				create l_error.make_vfav4i (a_class, a_constraint, a_rename, a_alias_name, a_formal)
				report_validity_error (l_error)
			end
		end

	report_vfav4j_error (a_class: ET_CLASS; a_constraint: ET_BASE_TYPE; a_rename: ET_RENAME; a_alias_name: ET_ALIAS_NAME; a_formal: ET_FORMAL_PARAMETER)
			-- Report VFAV-4 error: a parenthesis alias name appears more than
			-- once in the second element of the Rename_pair `a_rename' in the
			-- constraint `a_constraint' of formal parameter `a_formal' in `a_class'.
			--
			-- Not in ECMA.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_constraint_not_void: a_constraint /= Void
			a_rename_not_void: a_rename /= Void
			a_alias_name_not_void: a_alias_name /= Void
			a_rename_has_alias: attached a_rename.new_name.alias_names as l_new_alias_names and then l_new_alias_names.has (a_alias_name)
			a_alias_name_is_parenthesis: a_alias_name.is_parenthesis
			a_formal_not_void: a_formal /= Void
		local
			l_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav4_error (a_class) then
				create l_error.make_vfav4j (a_class, a_constraint, a_rename, a_alias_name, a_formal)
				report_validity_error (l_error)
			end
		end

	report_vfav4k_error (a_class: ET_CLASS; a_constraint: ET_BASE_TYPE; a_rename: ET_RENAME; a_alias_name: ET_ALIAS_NAME; a_formal: ET_FORMAL_PARAMETER)
			-- Report VFAV-4 error: a unary operator alias name appears more than once
			-- in the second element of the Rename_pair `a_rename' in the constraint
			-- `a_constraint' of formal parameter `a_formal' in `a_class'.
			--
			-- Not in ECMA.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_constraint_not_void: a_constraint /= Void
			a_rename_not_void: a_rename /= Void
			a_alias_name_not_void: a_alias_name /= Void
			a_rename_has_alias: attached a_rename.new_name.alias_names as l_new_alias_names and then l_new_alias_names.has (a_alias_name)
			a_alias_name_is_prefix: a_alias_name.is_prefix
			a_formal_not_void: a_formal /= Void
		local
			l_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav4_error (a_class) then
				create l_error.make_vfav4k (a_class, a_constraint, a_rename, a_alias_name, a_formal)
				report_validity_error (l_error)
			end
		end

	report_vfav4l_error (a_class: ET_CLASS; a_constraint: ET_BASE_TYPE; a_rename: ET_RENAME; a_alias_name: ET_ALIAS_NAME; a_formal: ET_FORMAL_PARAMETER)
			-- Report VFAV-4 error: a binary operator alias name appears more than once
			-- in the second element of the Rename_pair `a_rename' in the constraint
			-- `a_constraint' of formal parameter `a_formal' in `a_class'.
			--
			-- Not in ECMA.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_constraint_not_void: a_constraint /= Void
			a_rename_not_void: a_rename /= Void
			a_alias_name_not_void: a_alias_name /= Void
			a_rename_has_alias: attached a_rename.new_name.alias_names as l_new_alias_names and then l_new_alias_names.has (a_alias_name)
			a_alias_name_is_inefix: a_alias_name.is_infix
			a_formal_not_void: a_formal /= Void
		local
			l_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav4_error (a_class) then
				create l_error.make_vfav4l (a_class, a_constraint, a_rename, a_alias_name, a_formal)
				report_validity_error (l_error)
			end
		end

	report_vfav5a_error (a_class: ET_CLASS; a_alias_name: ET_ALIAS_NAME)
			-- Report VFAV-5 error: `a_alias_name' has a convert mark
			-- but it is not binary operator alias.
			--
			-- ECMA 367-2, 8.5.26 page 43.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_alias_name_not_void: a_alias_name /= Void
			a_alias_name_not_infix: not a_alias_name.is_infix
			a_alias_name_has_convert: a_alias_name.convert_keyword /= Void
		local
			l_error: ET_VALIDITY_ERROR
		do
			if reportable_vfav5_error (a_class) then
				create l_error.make_vfav5a (a_class, a_alias_name)
				report_validity_error (l_error)
			end
		end

	report_vffd4a_error (a_class: ET_CLASS; a_feature: ET_FEATURE)
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

	report_vffd7a_error (a_class: ET_CLASS; a_feature: ET_FEATURE)
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
			if reportable_vffd7_error (a_class) then
				create an_error.make_vffd7a (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_vffd7b_error (a_class: ET_CLASS; a_feature: ET_FEATURE)
			-- Report VFFD-7 error: the type of the once function `a_feature'
			-- contains a formal generic parameter.
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
			if reportable_vffd7_error (a_class) then
				create an_error.make_vffd7b (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_vgcc1a_error (a_class, a_class_impl: ET_CLASS; a_creation: ET_CREATION_COMPONENT; a_target: ET_CLASS)
			-- Report VGCC-1 error: the creation instruction or expression
			-- `a_creation', appearing in `a_class_impl' and viewed from
			-- one of its descendants `a_class' (possibly itself), has no
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vgcc1_error (a_class) then
				create an_error.make_vgcc1a (a_class, a_class_impl, a_creation, a_target)
				report_validity_error (an_error)
			end
		end

	report_vgcc3a_error (a_class, a_class_impl: ET_CLASS; a_creation: ET_CREATION_INSTRUCTION; a_creation_named_type, a_target_named_type: ET_NAMED_TYPE)
			-- Report VGCC-3 error: the explicit creation type in creation instruction
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vgcc3_error (a_class) then
				create an_error.make_vgcc3a (a_class, a_class_impl, a_creation, a_creation_named_type, a_target_named_type)
				report_validity_error (an_error)
			end
		end

	report_vgcc5a_error (a_class, a_class_impl: ET_CLASS; a_creation: ET_CREATION_COMPONENT; a_target: ET_CLASS)
			-- Report VGCC-5 error: the creation instruction or expression
			-- `a_creation', appearing in  `a_class_impl' and viewed from one
			-- of its descendants `a_class' (possibly itself), has no
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vgcc5_error (a_class) then
				create an_error.make_vgcc5a (a_class, a_class_impl, a_creation, a_target)
				report_validity_error (an_error)
			end
		end

	report_vgcc6a_error (a_class: ET_CLASS; cp: ET_FEATURE_NAME; f: ET_FEATURE)
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

	report_vgcc6b_error (a_class: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS)
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

	report_vgcc6c_error (a_class, a_class_impl: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS)
			-- Report VGCC-6 error: `a_feature' of class `a_target', appearing in
			-- a creation instruction or expression with creation procedure name
			-- `a_name' in `a_class_impl' and viewed from one of its descendants
			-- `a_class' (possibly itself), is not exported for creation to `a_class'.
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
				create an_error.make_vgcc6c (a_class, a_class_impl, a_name, a_feature, a_target)
				report_validity_error (an_error)
			end
		end

	report_vgcc6d_error (a_class: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS)
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
				create an_error.make_vgcc6d (a_class, a_name, a_feature, a_target)
				report_validity_error (an_error)
			end
		end

	report_vgcc8a_error (a_class, a_class_impl: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS; a_formal: ET_FORMAL_PARAMETER)
			-- Report VGCC-8 error: `a_feature' of class `a_target', appearing in
			-- a creation instruction or expression with creation procedure name
			-- `a_name' in `a_class_impl' and viewed from one of its descendants
			-- `a_class' (possibly itself), is not listed as creation procedure
			-- for the formal parameter `a_formal' in `a_class'.
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
				create an_error.make_vgcc8a (a_class, a_class_impl, a_name, a_feature, a_target, a_formal)
				report_validity_error (an_error)
			end
		end

	report_vgcp1a_error (a_class: ET_CLASS; a_creator: ET_CREATOR)
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

	report_vgcp2a_error (a_class: ET_CLASS; cp: ET_FEATURE_NAME)
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

	report_vgcp2b_error (a_class: ET_CLASS; cp: ET_FEATURE_NAME; f: ET_FEATURE)
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

	report_vgcp3a_error (a_class: ET_CLASS; f1, f2: ET_FEATURE_NAME)
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

	report_vgcp3b_error (a_class: ET_CLASS; f1, f2: ET_FEATURE_NAME)
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

	report_vgcp3c_error (a_class: ET_CLASS; f1, f2: ET_FEATURE_NAME)
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

	report_vggc1a_error (a_class: ET_CLASS; a_type: ET_LIKE_TYPE)
			-- Report VGGC-1 error: invalid type `a_type' in
			-- constraint of formal generic parameter of `a_class'.
			--
			-- ECMA 367-2, 8.12.9 page 80.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vggc1_error (a_class) then
				create an_error.make_vggc1a (a_class, a_type)
				report_validity_error (an_error)
			end
		end

	report_vggc2a_error (a_class: ET_CLASS; a_constraint: ET_BASE_TYPE; a_rename: ET_RENAME; a_formal: ET_FORMAL_PARAMETER)
			-- Report VGGC-2 error: the feature name appearing as first
			-- element of the Rename_pair `a_rename' for the constraint type
			-- `a_constraint' of formal parameter `a_formal' in `a_class' is
			-- not the final name of a feature in the base class of `a_constraint'.
			--
			-- ECMA 367-2, 8.12.9 page 80.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_constraint_not_void: a_constraint /= Void
			a_rename_not_void: a_rename /= Void
			a_formal_not_void: a_formal /= Void
		local
			l_error: ET_VALIDITY_ERROR
		do
			if reportable_vggc2_error (a_class) then
				create l_error.make_vggc2a (a_class, a_constraint, a_rename, a_formal)
				report_validity_error (l_error)
			end
		end

	report_vggc2b_error (a_class: ET_CLASS; a_constraint: ET_FORMAL_PARAMETER_TYPE; a_renames: ET_CONSTRAINT_RENAME_LIST; a_formal: ET_FORMAL_PARAMETER)
			-- Report VGGC-2 error: the constraint type `a_constraint' of formal
			-- parameter `a_formal' in `a_class' is itself a formal parameter,
			-- and therefore cannot have a rename clause but has one (`a_renames').
			--
			-- Not in ECMA 367-2, 8.12.9 page 80.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_constraint_not_void: a_constraint /= Void
			a_renames_not_void: a_renames /= Void
			a_formal_not_void: a_formal /= Void
		local
			l_error: ET_VALIDITY_ERROR
		do
			if reportable_vggc2_error (a_class) then
				create l_error.make_vggc2b (a_class, a_constraint, a_renames, a_formal)
				report_validity_error (l_error)
			end
		end

	report_vggc2c_error (a_class: ET_CLASS; a_constraint: ET_BASE_TYPE; a_renames: ET_CONSTRAINT_RENAME_LIST; a_formal: ET_FORMAL_PARAMETER)
			-- Report VGGC-2 error: the constraint type `a_constraint' of formal
			-- parameter `a_formal' in `a_class' is "NONE", and therefore cannot have
			-- a rename clause but has one (`a_renames').
			--
			-- ECMA 367-2, 8.12.9 page 80.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_constraint_not_void: a_constraint /= Void
			a_constraint_is_none: a_constraint.base_class.is_none
			a_renames_not_void: a_renames /= Void
			a_formal_not_void: a_formal /= Void
		local
			l_error: ET_VALIDITY_ERROR
		do
			if reportable_vggc2_error (a_class) then
				create l_error.make_vggc2c (a_class, a_constraint, a_renames, a_formal)
				report_validity_error (l_error)
			end
		end

	report_vggc2d_error (a_class: ET_CLASS; a_constraint: ET_BASE_TYPE; a_rename1, a_rename2: ET_RENAME; a_formal: ET_FORMAL_PARAMETER)
			-- Report VGGC-2 error: a feature name appears more than once
			-- (e.g. also in `a_rename1') as first element of the Rename_pair
			-- `a_rename2' in the constraint `a_constraint' of formal parameter
			-- `a_formal' in `a_class'.
			--
			-- ECMA 367-2, 8.12.9 page 80.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_constraint_not_void: a_constraint /= Void
			a_rename1_not_void: a_rename1 /= Void
			a_rename2_not_void: a_rename2 /= Void
			a_formal_not_void: a_formal /= Void
		local
			l_error: ET_VALIDITY_ERROR
		do
			if reportable_vggc2_error (a_class) then
				create l_error.make_vggc2d (a_class, a_constraint, a_rename1, a_rename2, a_formal)
				report_validity_error (l_error)
			end
		end

	report_vggc2e_error (a_class: ET_CLASS; a_constraint: ET_BASE_TYPE; a_rename1, a_rename2: ET_RENAME; a_formal: ET_FORMAL_PARAMETER)
			-- Report VGGC-2 error: a feature name appears more than once
			-- (e.g. also in `a_rename1') as second element of the Rename_pair
			-- `a_rename2' in the constraint `a_constraint' of formal parameter
			-- `a_formal' in `a_class'.
			--
			-- ECMA 367-2, 8.12.9 page 80.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_constraint_not_void: a_constraint /= Void
			a_rename1_not_void: a_rename1 /= Void
			a_rename2_not_void: a_rename2 /= Void
			a_formal_not_void: a_formal /= Void
		local
			l_error: ET_VALIDITY_ERROR
		do
			if reportable_vggc2_error (a_class) then
				create l_error.make_vggc2e (a_class, a_constraint, a_rename1, a_rename2, a_formal)
				report_validity_error (l_error)
			end
		end

	report_vggc2f_error (a_class: ET_CLASS; a_constraint: ET_BASE_TYPE; a_rename: ET_RENAME; a_formal: ET_FORMAL_PARAMETER)
			-- Report VGGC-2 error: the feature name which appears as second
			-- element of the Rename_pair `a_rename' in the constraint `a_constraint'
			-- of formal parameter `a_formal' in `a_class' is already the final name
			-- of a feature in `a_constraint'.
			--
			-- ECMA 367-2, 8.12.9 page 80.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_constraint_not_void: a_constraint /= Void
			a_rename_not_void: a_rename /= Void
			a_formal_not_void: a_formal /= Void
		local
			l_error: ET_VALIDITY_ERROR
		do
			if reportable_vggc2_error (a_class) then
				create l_error.make_vggc2f (a_class, a_constraint, a_rename, a_formal)
				report_validity_error (l_error)
			end
		end

	report_vggc3a_error (a_class: ET_CLASS; cp: ET_FEATURE_NAME; a_constraint: ET_CLASS)
			-- Report VGGC-3 error: creation procedure name `cp'
			-- is not the final name of a feature in the base class
			-- `a_constraint' of a generic constraint in `a_class'.
			--
			-- ECMA 367-2, 8.12.9 page 80.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			cp_not_void: cp /= Void
			a_constraint_not_void: a_constraint /= Void
		local
			l_error: ET_VALIDITY_ERROR
		do
			if reportable_vggc3_error (a_class) then
				create l_error.make_vggc3a (a_class, cp, a_constraint)
				report_validity_error (l_error)
			end
		end

	report_vggc3b_error (a_class: ET_CLASS; cp: ET_FEATURE_NAME; a_constraints: ET_CONSTRAINT_BASE_TYPES)
			-- Report VGGC-3 error: creation procedure name `cp'
			-- is not the final name of a feature in the base class of
			-- any of the generic constraints `a_constraints' in `a_class'.
			--
			-- ECMA 367-2, 8.12.9 page 80.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			cp_not_void: cp /= Void
			a_constraints_not_void: a_constraints /= Void
		local
			l_error: ET_VALIDITY_ERROR
		do
			if reportable_vggc3_error (a_class) then
				create l_error.make_vggc3b (a_class, cp, a_constraints)
				report_validity_error (l_error)
			end
		end

	report_vggc3c_error (a_class: ET_CLASS; cp: ET_FEATURE_NAME; f: ET_FEATURE; a_constraint: ET_CLASS)
			-- Report VGGC-3 error: creation procedure name `cp'
			-- is the final name (after possible renaming) of `f' in the
			-- base class `a_constraint' of a generic constraint in `a_class',
			-- but `f' is not a procedure.
			-- Note that the name of `f' in `a_constraint' may be different from `cp'
			-- if it has been renamed in the rename clause of the generic constraint.
			--
			-- ECMA 367-2, 8.12.9 page 80.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			cp_not_void: cp /= Void
			f_not_void: f /= Void
			f_not_procedure: not f.is_procedure
			a_constraint_not_void: a_constraint /= Void
		local
			l_error: ET_VALIDITY_ERROR
		do
			if reportable_vggc3_error (a_class) then
				create l_error.make_vggc3c (a_class, cp, f, a_constraint)
				report_validity_error (l_error)
			end
		end

	report_vggc3d_error (a_class: ET_CLASS; cp: ET_FEATURE_NAME; f1: ET_FEATURE; a_constraint1: ET_BASE_TYPE_CONSTRAINT; f2: ET_FEATURE; a_constraint2: ET_BASE_TYPE_CONSTRAINT)
			-- Report VGGC-3 error: creation procedure name `cp' is the final name
			-- (after possible renaming) of a feature in the base class of both
			-- generic constraints `a_constraint1' and `a_constraint2' in `a_class'.
			-- Note that the name of `f1' in `a_constraint1' and of `f2' is `a_constraint2'
			-- may be different from `cp' if they have been renamed in the rename clause
			--  of the generic constraint.
			--
			-- ECMA 367-2, 8.12.9 page 80.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			cp_not_void: cp /= Void
			f1_not_void: f1 /= Void
			a_constraint1_not_void: a_constraint1 /= Void
			f2_not_void: f2 /= Void
			a_constraint2_not_void: a_constraint2 /= Void
		local
			l_error: ET_VALIDITY_ERROR
		do
			if reportable_vggc3_error (a_class) then
				create l_error.make_vggc3d (a_class, cp, f1, a_constraint1, f2, a_constraint2)
				report_validity_error (l_error)
			end
		end

	report_vgmc0a_error (a_class, a_class_impl: ET_CLASS; a_name: ET_CALL_NAME; a_constraints: DS_ARRAYED_LIST [ET_ADAPTED_CLASS])
			-- Report VGMC error: `a_name', appearing in `a_class_impl' and
			-- viewed from one of its descendants `a_class' (possibly itself), is
			-- not the final name of a feature in the base class of any of the
			-- generic constraints `a_constraints'.
			--
			-- ECMA 367-2, 8.12.22 page 83.
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_name_not_void: a_name /= Void
			a_constraints_not_void: a_constraints /= Void
			no_void_constraint: not a_constraints.has_void
			multiple_constraints: a_constraints.count > 1
		local
			l_error: ET_VALIDITY_ERROR
		do
			if reportable_vgmc_error (a_class) then
				create l_error.make_vgmc0a (a_class, a_class_impl, a_name, a_constraints)
				report_validity_error (l_error)
			end
		end

	report_vgmc0b_error (a_class, a_class_impl: ET_CLASS; a_name: ET_CALL_NAME; f1: ET_FEATURE; a_constraint1: ET_ADAPTED_CLASS; f2: ET_FEATURE; a_constraint2: ET_ADAPTED_CLASS)
			-- Report VGMC error: `a_name', appearing in `a_class_impl' and
			-- viewed from one of its descendants `a_class' (possibly itself), is
			-- the final name (after possible renaming) of a feature in the base
			-- class of both generic constraints `a_constraint1' and `a_constraint2'.
			-- Note that the name of `f1' in `a_constraint1' and of `f2' is `a_constraint2'
			-- may be different from `a_name' if they have been renamed in the rename clause
			-- of the generic constraint.
			--
			-- ECMA 367-2, 8.12.22 page 83.
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_name_not_void: a_name /= Void
			f1_not_void: f1 /= Void
			a_constraint1_not_void: a_constraint1 /= Void
			f2_not_void: f2 /= Void
			a_constraint2_not_void: a_constraint2 /= Void
		local
			l_error: ET_VALIDITY_ERROR
		do
			if reportable_vgmc_error (a_class) then
				create l_error.make_vgmc0b (a_class, a_class_impl, a_name, f1, a_constraint1, f2, a_constraint2)
				report_validity_error (l_error)
			end
		end

	report_vgmc0c_error (a_class, a_class_impl: ET_CLASS; a_name: ET_CALL_NAME; f1: ET_FEATURE; a_constraint1: ET_ADAPTED_CLASS; a_tuple_index2: INTEGER; a_constraint2: ET_ADAPTED_CLASS)
			-- Report VGMC error: `a_name', appearing in `a_class_impl' and
			-- viewed from one of its descendants `a_class' (possibly itself), is
			-- the final name (after possible renaming) of a feature in the base
			-- class of generic constraint `a_constraint1' and a tuple label in
			-- the generic constraint `a_constraint2'.
			-- Note that the name of `f1' in `a_constraint1' may be different from
			-- `a_name' if it has been renamed in the rename clause of the generic
			-- constraint.
			--
			-- ECMA 367-2, 8.12.22 page 83.
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_name_not_void: a_name /= Void
			f1_not_void: f1 /= Void
			a_constraint1_not_void: a_constraint1 /= Void
			a_constraint2_not_void: a_constraint2 /= Void
		local
			l_error: ET_VALIDITY_ERROR
		do
			if reportable_vgmc_error (a_class) then
				create l_error.make_vgmc0c (a_class, a_class_impl, a_name, f1, a_constraint1, a_tuple_index2, a_constraint2)
				report_validity_error (l_error)
			end
		end

	report_vgmc0d_error (a_class, a_class_impl: ET_CLASS; a_name: ET_CALL_NAME; a_tuple_index1: INTEGER; a_constraint1: ET_ADAPTED_CLASS; a_tuple_index2: INTEGER; a_constraint2: ET_ADAPTED_CLASS)
			-- Report VGMC error: `a_name', appearing in `a_class_impl' and
			-- viewed from one of its descendants `a_class' (possibly itself), is
			-- a tuple label in both generic constraints `a_constraint1' and
			-- `a_constraint2'.
			--
			-- ECMA 367-2, 8.12.22 page 83.
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_name_not_void: a_name /= Void
			a_constraint1_not_void: a_constraint1 /= Void
			a_constraint2_not_void: a_constraint2 /= Void
		local
			l_error: ET_VALIDITY_ERROR
		do
			if reportable_vgmc_error (a_class) then
				create l_error.make_vgmc0d (a_class, a_class_impl, a_name, a_tuple_index1, a_constraint1, a_tuple_index2, a_constraint2)
				report_validity_error (l_error)
			end
		end

	report_vgmc0e_error (a_class, a_class_impl: ET_CLASS; a_name: ET_CALL_NAME; f1: ET_QUERY; a_constraint1: ET_ADAPTED_CLASS; f2: ET_QUERY; a_constraint2: ET_ADAPTED_CLASS)
			-- Report VGMC error: `a_name', appearing in `a_class_impl' and
			-- viewed from one of its descendants `a_class' (possibly itself), is
			-- the final name (after possible renaming) of a query with two different
			-- versions in the base class of both generic constraints `a_constraint1'
			-- and `a_constraint2', and these versions have different types.
			-- Note that the name of `f1' in `a_constraint1' and of `f2' is `a_constraint2'
			-- may be different from `a_name' if they have been renamed in the rename clause
			-- of the generic constraint.
			--
			-- ECMA 367-2, 8.12.22 page 83.
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_name_not_void: a_name /= Void
			f1_not_void: f1 /= Void
			a_constraint1_not_void: a_constraint1 /= Void
			f2_not_void: f2 /= Void
			a_constraint2_not_void: a_constraint2 /= Void
		local
			l_error: ET_VALIDITY_ERROR
		do
			if reportable_vgmc_error (a_class) then
				create l_error.make_vgmc0e (a_class, a_class_impl, a_name, f1, a_constraint1, f2, a_constraint2)
				report_validity_error (l_error)
			end
		end

	report_vgmc0f_error (a_class, a_class_impl: ET_CLASS; a_name: ET_CALL_NAME; a_tuple_index: INTEGER; a_constraint1: ET_ADAPTED_CLASS; a_constraint2: ET_ADAPTED_CLASS)
			-- Report VGMC error: `a_name', appearing in `a_class_impl' and
			-- viewed from one of its descendants `a_class' (possibly itself), is
			-- a tuple label whose corresponding items at index `a_tuple_index'
			-- in generic constraints `a_constraint1' and `a_constraint2' have
			-- a different type.
			--
			-- ECMA 367-2, 8.12.22 page 83.
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_name_not_void: a_name /= Void
			a_constraint1_not_void: a_constraint1 /= Void
			a_constraint2_not_void: a_constraint2 /= Void
		local
			l_error: ET_VALIDITY_ERROR
		do
			if reportable_vgmc_error (a_class) then
				create l_error.make_vgmc0f (a_class, a_class_impl, a_name, a_tuple_index, a_constraint1, a_constraint2)
				report_validity_error (l_error)
			end
		end

	report_vgmc0g_error (a_class, a_class_impl: ET_CLASS; a_name: ET_CALL_NAME; f1: ET_FEATURE; a_constraint1: ET_ADAPTED_CLASS; f2: ET_FEATURE; a_constraint2: ET_ADAPTED_CLASS)
			-- Report VGMC error: `a_name', appearing in an agent in `a_class_impl'
			-- and viewed from one of its descendants `a_class' (possibly itself), is
			-- the final name (after possible renaming) of a feature with two different
			-- versions in the base class of both generic constraints `a_constraint1'
			-- and `a_constraint2', and these versions have different signatures.
			-- Note that the name of `f1' in `a_constraint1' and of `f2' is `a_constraint2'
			-- may be different from `a_name' if they have been renamed in the rename clause
			-- of the generic constraint.
			--
			-- ECMA 367-2, 8.12.22 page 83.
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_name_not_void: a_name /= Void
			f1_not_void: f1 /= Void
			a_constraint1_not_void: a_constraint1 /= Void
			f2_not_void: f2 /= Void
			a_constraint2_not_void: a_constraint2 /= Void
		local
			l_error: ET_VALIDITY_ERROR
		do
			if reportable_vgmc_error (a_class) then
				create l_error.make_vgmc0g (a_class, a_class_impl, a_name, f1, a_constraint1, f2, a_constraint2)
				report_validity_error (l_error)
			end
		end

	report_vhay0a_error (a_class: ET_CLASS)
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

	report_vhpr1a_error (a_class: ET_CLASS; a_cycle: DS_LIST [ET_CLASS])
			-- Report VHPR-1 error: `a_class' is involved
			-- in the inheritance cycle `a_cycle'.
			--
			-- ETL2: p.79
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_cycle_not_void: a_cycle /= Void
			no_void_class: not a_cycle.has_void
			is_cycle: a_cycle.count >= 2
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vhpr1_error (a_class) then
				create an_error.make_vhpr1a (a_class, a_cycle)
				report_validity_error (an_error)
			end
		end

	report_vhpr1b_error (a_class: ET_CLASS; a_none: ET_BASE_TYPE)
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

	report_vhpr2a_error (a_class: ET_CLASS; a_parent: ET_BASE_TYPE)
			-- Report VHPR-2 error: `a_class' inherits from frozen
			-- class `a_parent' through conforming inheritance.
			--
			-- ECMA 367-2: p.47
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_parent_not_void: a_parent /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vhpr2_error (a_class) then
				create an_error.make_vhpr2a (a_class, a_parent)
				report_validity_error (an_error)
			end
		end

	report_vhpr3a_error (a_class: ET_CLASS; a_type: ET_LIKE_TYPE)
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
				report_validity_error (an_error)
			end
		end

	report_vhrc1a_error (a_class: ET_CLASS; a_parent: ET_PARENT; a_rename: ET_RENAME)
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

	report_vhrc2a_error (a_class: ET_CLASS; a_parent: ET_PARENT; a_rename1, a_rename2: ET_RENAME)
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

	report_vjar0a_error (a_class, a_class_impl: ET_CLASS; an_assignment: ET_ASSIGNMENT; a_source_type, a_target_type: ET_NAMED_TYPE)
			-- Report VJAR error: the source expression of `an_assignment' in `a_class_impl'
			-- does not conform to its target entity when viewed from one of its descendants
			-- `a_class' (possibly itself).
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
				create an_error.make_vjar0a (a_class, a_class_impl, an_assignment, a_source_type, a_target_type)
				report_validity_error (an_error)
			end
		end

	report_vjar0b_error (a_class, a_class_impl: ET_CLASS; a_assignment: ET_ASSIGNMENT; a_source_type, a_target_type: ET_NAMED_TYPE)
			-- Report VJAR error: the target entity of `a_assignment' in `a_class_impl', and
			-- viewed from one of its descendants `a_class' (possibly itself), is a stable
			-- attribute but the source expression is not guaranteed to be attached.
			--
			-- Not in ECMA.
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_assignment_not_void: a_assignment /= Void
			a_source_type_not_void: a_source_type /= Void
			a_source_type_is_named_type: a_source_type.is_named_type
			a_target_type_not_void: a_target_type /= Void
			a_target_type_is_named_type: a_target_type.is_named_type
		local
			l_error: ET_VALIDITY_ERROR
		do
			if reportable_vjar_error (a_class) then
				create l_error.make_vjar0b (a_class, a_class_impl, a_assignment, a_source_type, a_target_type)
				report_validity_error (l_error)
			end
		end

	report_vjaw0a_error (a_class: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE)
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

	report_vjaw0b_error (a_class: ET_CLASS; a_name: ET_IDENTIFIER; a_feature: ET_FEATURE)
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
				create an_error.make_vjaw0b (a_class, a_name, a_feature)
				report_validity_error (an_error)
			end
		end

	report_vjaw0c_error (a_class: ET_CLASS; a_name: ET_IDENTIFIER; an_agent: ET_INLINE_AGENT)
			-- Report VJAW error: `a_name' is supposed to be a Writable but
			-- it is a formal argument name of inline agent `an_agent'.
			--
			-- Only in ISE Eiffel.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			an_agent_not_void: an_agent /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vjaw_error (a_class) then
				create an_error.make_vjaw0c (a_class, a_name, an_agent)
				report_validity_error (an_error)
			end
		end

	report_vjrv0a_error (a_class, a_class_impl: ET_CLASS; a_target: ET_WRITABLE; a_target_type: ET_NAMED_TYPE)
			-- Report VJRV error: the type `a_target_type' of the target
			-- `a_target' of an assignment attempt appearing in `a_class_impl'
			-- and viewed from one of its descedants `a_class' (possibly itself)
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vjrv_error (a_class) then
				create an_error.make_vjrv0a (a_class, a_class_impl, a_target, a_target_type)
				report_validity_error (an_error)
			end
		end

	report_vkcn1a_error (a_class: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS)
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

	report_vkcn1b_error (a_class: ET_CLASS; a_name: ET_IDENTIFIER; a_target: ET_CLASS)
			-- Report VKCN-1 error: tuple label `a_name' of tuple class `a_target', appearing
			-- in the qualified instruction call `a_name' in `a_class', is not
			-- a procedure.
			--
			-- ETL2: p.341
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_target_not_void: a_target /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vkcn1_error (a_class) then
				create an_error.make_vkcn1b (a_class, a_name, a_target)
				report_validity_error (an_error)
			end
		end

	report_vkcn1c_error (a_class: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE)
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

	report_vkcn2a_error (a_class: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS)
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

	report_vkcn2c_error (a_class: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE)
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

	report_vlel1a_error (a_class: ET_CLASS; a_parent: ET_PARENT; all1, all2: ET_ALL_EXPORT)
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

	report_vlel2a_error (a_class: ET_CLASS; a_parent: ET_PARENT; f: ET_FEATURE_NAME)
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

	report_vlel3a_error (a_class: ET_CLASS; a_parent: ET_PARENT; f1, f2: ET_FEATURE_NAME)
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

	report_vmfn0a_error (a_class: ET_CLASS; f1, f2: ET_FEATURE)
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

	report_vmfn0b_error (a_class: ET_CLASS; f1: ET_PARENT_FEATURE; f2: ET_FEATURE)
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
				create an_error.make_vmfn0b (a_class, f1, f2)
				an_error.set_ge_reported (False)
				report_validity_error (an_error)
			end
		end

	report_vmfn0c_error (a_class: ET_CLASS; f1, f2: ET_PARENT_FEATURE)
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

	report_vmfn2a_error (a_class: ET_CLASS; f1, f2: ET_PARENT_FEATURE)
			-- Report VMFN-2 error: features `f1' and `f2' are shared,
			-- but `f1' has an alias and not `f2'.
			--
			-- ECMA: p.93
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f1_no_alias: attached f1.alias_names as l_f1_alias_names and then not l_f1_alias_names.is_empty
			f2_not_void: f2 /= Void
			f2_alias: not attached f2.alias_names as l_f2_alias_names or else l_f2_alias_names.is_empty
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vmfn2_error (a_class) then
				create an_error.make_vmfn2a (a_class, f1, f2)
				report_validity_error (an_error)
			end
		end

	report_vmfn2b_error (a_class: ET_CLASS; f1, f2: ET_PARENT_FEATURE)
			-- Report VMFN-2 error: features `f1' and `f2' are shared,
			-- they both have an alias but it is not the same.
			--
			-- ECMA: p.93
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			f1_not_void: f1 /= Void
			f1_alias: attached f1.alias_names as l_f1_alias_names and then not l_f1_alias_names.is_empty
			f2_not_void: f2 /= Void
			f2_alias: attached f2.alias_names as l_f2_alias_names and then not l_f2_alias_names.is_empty
			not_same_alias: not l_f1_alias_names.same_alias_names (l_f2_alias_names)
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vmfn2_error (a_class) then
				create an_error.make_vmfn2b (a_class, f1, f2)
				report_validity_error (an_error)
			end
		end

	report_vmrc2a_error (a_class: ET_CLASS; replicated_features: DS_LIST [ET_PARENT_FEATURE])
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
			no_void_feature: not replicated_features.has_void
			replicated: replicated_features.count >= 2
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vmrc2_error (a_class) then
				create an_error.make_vmrc2a (a_class, replicated_features)
				report_validity_error (an_error)
			end
		end

	report_vmrc2b_error (a_class: ET_CLASS; replicated_features: DS_LIST [ET_PARENT_FEATURE])
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
			no_void_feature: not replicated_features.has_void
			-- all_selected: forall f in replicated_features, f.has_select
			replicated: replicated_features.count >= 2
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vmrc2_error (a_class) then
				create an_error.make_vmrc2b (a_class, replicated_features)
				report_validity_error (an_error)
			end
		end

	report_vmss1a_error (a_class: ET_CLASS; a_parent: ET_PARENT; f: ET_FEATURE_NAME)
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

	report_vmss2a_error (a_class: ET_CLASS; a_parent: ET_PARENT; f1, f2: ET_FEATURE_NAME)
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

	report_vmss3a_error (a_class: ET_CLASS; a_feature: ET_PARENT_FEATURE)
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
				create an_error.make_vmss3a (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_voit1a_error (a_class, a_class_impl: ET_CLASS; an_expression: ET_EXPRESSION; a_type: ET_NAMED_TYPE)
			-- Report VOIT-1 error: the type `a_type' of the across iterable expression
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_voit1_error (a_class) then
				create an_error.make_voit1a (a_class, a_class_impl, an_expression, a_type)
				report_validity_error (an_error)
			end
		end

	report_voit2a_error (a_class: ET_CLASS; a_iteration_component: ET_ITERATION_COMPONENT; a_feature: ET_FEATURE)
			-- Report VOIT-2 error: The iteration item of `a_iteration_component' has the same
			-- name as `a_feature' in `a_class'.
			--
			-- Not in ECMA.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_iteration_component_not_void: a_iteration_component /= Void
			a_feature_not_void: a_feature /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_voit2_error (a_class) then
				create an_error.make_voit2a (a_class, a_iteration_component, a_feature)
				report_validity_error (an_error)
			end
		end

	report_voit2b_error (a_class: ET_CLASS; a_iteration_component: ET_ITERATION_COMPONENT; arg: ET_FORMAL_ARGUMENT)
			-- Report VOIT-2 error: The iteration item of `a_iteration_component' has
			-- the same name as argument `arg' of an enclosing feature or
			-- inline agent.
			--
			-- Not in ECMA.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_iteration_component_not_void: a_iteration_component /= Void
			arg_not_void: arg /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_voit2_error (a_class) then
				create an_error.make_voit2b (a_class, a_iteration_component, arg)
				report_validity_error (an_error)
			end
		end

	report_voit2c_error (a_class: ET_CLASS; a_iteration_component: ET_ITERATION_COMPONENT; a_local: ET_LOCAL_VARIABLE)
			-- Report VOIT-2 error: The iteration item of `a_iteration_component' has
			-- the same name as local variable `a_local' of an enclosing
			-- feature or inline agent.
			--
			-- Not in ECMA.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_iteration_component_not_void: a_iteration_component /= Void
			a_local_not_void: a_local /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_voit2_error (a_class) then
				create an_error.make_voit2c (a_class, a_iteration_component, a_local)
				report_validity_error (an_error)
			end
		end

	report_voit2d_error (a_class: ET_CLASS; a_iteration_component: ET_ITERATION_COMPONENT; a_object_test: ET_NAMED_OBJECT_TEST)
			-- Report VOIT-2 error: `a_iteration_component' appears in the scope
			-- of the local of `a_object_test' with the same local name.
			--
			-- Not in ECMA.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_iteration_component_not_void: a_iteration_component /= Void
			a_object_test_not_void: a_object_test /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_voit2_error (a_class) then
				create an_error.make_voit2d (a_class, a_iteration_component, a_object_test)
				report_validity_error (an_error)
			end
		end

	report_voit2e_error (a_class: ET_CLASS; a_iteration_component1, a_iteration_component2: ET_ITERATION_COMPONENT)
			-- Report VOIT-2 error: `a_iteration_component1' appears in the scope
			-- of the iteration item of `a_iteration_component2' with the same 
			-- iteration item name.
			--
			-- Not in ECMA.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_iteration_component1_not_void: a_iteration_component1 /= Void
			a_iteration_component2_not_void: a_iteration_component2 /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_voit2_error (a_class) then
				create an_error.make_voit2e (a_class, a_iteration_component1, a_iteration_component2)
				report_validity_error (an_error)
			end
		end

	report_voit3a_error (a_class: ET_CLASS; a_iteration_cursor: ET_ITERATION_CURSOR)
			-- Create a new VUOT-3 error: the name appearing in `a_iteration_cursor`
			-- is not the name of an iteration item.
			--
			-- Not in ECMA.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_iteration_cursor_not_void: a_iteration_cursor /= Void
		local
			l_error: ET_VALIDITY_ERROR
		do
			if reportable_voit3_error (a_class) then
				create l_error.make_voit3a (a_class, a_iteration_cursor)
				report_validity_error (l_error)
			end
		end

	report_vomb1a_error (a_class, a_class_impl: ET_CLASS; an_expression: ET_EXPRESSION; a_type: ET_NAMED_TYPE)
			-- Report VOMB-1 error: the inspect expression `an_expression'
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vomb1_error (a_class) then
				create an_error.make_vomb1a (a_class, a_class_impl, an_expression, a_type)
				report_validity_error (an_error)
			end
		end

	report_vomb2a_error (a_class, a_class_impl: ET_CLASS; a_constant: ET_CHOICE_CONSTANT; a_constant_type, a_value_type: ET_NAMED_TYPE)
			-- Report VOMB-2 error: the inspect constant `a_constant' in
			-- `a_class_impl' and viewed from one of its descendants `a_class'
			-- (possibly itself) is of type `a_constant_type' which is not
			-- the same as the type `a_value_type' of the inspect expression.
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
				create an_error.make_vomb2a (a_class, a_class_impl, a_constant, a_constant_type, a_value_type)
				report_validity_error (an_error)
			end
		end

	report_vomb2b_error (a_class, a_class_impl: ET_CLASS; a_constant: ET_CHOICE_CONSTANT)
			-- Report VOMB-2 error: the inspect choice `a_constant' in
			-- `a_class_impl' and viewed from one of its descendants `a_class'
			-- (possibly itself) is not a constant attribute.
			--
			-- ETL2: p.239
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_constant_not_void: a_constant /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vomb2_error (a_class) then
				create an_error.make_vomb2b (a_class, a_class_impl, a_constant)
				report_validity_error (an_error)
			end
		end

	report_vpca1a_error (a_class: ET_CLASS; a_name: ET_FEATURE_NAME)
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

	report_vpca1b_error (a_class: ET_CLASS; a_name: ET_FEATURE_NAME; a_target: ET_CLASS)
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

	report_vpca2a_error (a_class, a_class_impl: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS)
			-- Report VPCA-2 error: `a_feature' of class `a_target'
			-- is not exported to `a_class', one of the descendants
			-- of `a_class_impl' (possibly itself) where the qualified
			-- call agent `a_name' appears.
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
				create an_error.make_vpca2a (a_class, a_class_impl, a_name, a_feature, a_target)
				report_validity_error (an_error)
			end
		end

	report_vpca3a_error (a_class: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS)
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

	report_vpca3b_error (a_class: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE)
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
				create an_error.make_vpca3b (a_class, a_name, a_feature)
				report_validity_error (an_error)
			end
		end

	report_vpca4a_error (a_class, a_class_impl: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS; arg: INTEGER; an_actual, a_formal: ET_NAMED_TYPE)
			-- Report VPCA-4 error: the `arg'-th actual argument in the qualified
			-- call agent `a_name' appearing in `a_class_impl' and viewed from one of its
			-- descendants `a_class' (possibly itself) does not conform to the
			-- corresponding formal argument of `a_feature' in class `a_target'.
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
				create an_error.make_vpca4a (a_class, a_class_impl, a_name, a_feature, a_target, arg, an_actual, a_formal)
				report_validity_error (an_error)
			end
		end

	report_vpca4b_error (a_class, a_class_impl: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; arg: INTEGER; an_actual, a_formal: ET_NAMED_TYPE)
			-- Report VPCA-4 error: the `arg'-th actual argument in the unqualified
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vpca4_error (a_class) then
				create an_error.make_vpca4b (a_class, a_class_impl, a_name, a_feature, arg, an_actual, a_formal)
				report_validity_error (an_error)
			end
		end

	report_vpca5a_error (a_class, a_class_impl: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS; arg: INTEGER; an_actual, a_formal: ET_NAMED_TYPE)
			-- Report VPCA-5 error: the type specified for the `arg'-th actual
			-- argument in the qualified call agent `a_name' appearing in
			-- `a_class_impl' and viewed from one of its descendants `a_class'
			-- (possibly itself) does not conform to the corresponding formal
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
			if reportable_vpca5_error (a_class) then
				create an_error.make_vpca5a (a_class, a_class_impl, a_name, a_feature, a_target, arg, an_actual, a_formal)
				report_validity_error (an_error)
			end
		end

	report_vpca5b_error (a_class, a_class_impl: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE; arg: INTEGER; an_actual, a_formal: ET_NAMED_TYPE)
			-- Report VPCA-5 error: the type speciified for the `arg'-th actual
			-- argument in the unqualified call agent `a_name' appearing in
			-- `a_class_impl' and viewed from one of its descendants `a_class'
			-- (possibly itself) does not conform to the corresponding formal
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
			if reportable_vpca5_error (a_class) then
				create an_error.make_vpca5b (a_class, a_class_impl, a_name, a_feature, arg, an_actual, a_formal)
				report_validity_error (an_error)
			end
		end

	report_vpir1a_error (a_class: ET_CLASS; arg1: ET_FORMAL_ARGUMENT; an_agent: ET_INLINE_AGENT; arg2: ET_FORMAL_ARGUMENT)
			-- Report VPIR-1 error: `arg1' in inline agent `an_agent' has the same
			-- name as argument `arg2' of an enclosing feature or inline agent.
			--
			-- ECMA 367-2: p.136
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			arg1_not_void: arg1 /= Void
			an_agent_not_void: an_agent /= Void
			arg2_not_void: arg2 /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vpir1_error (a_class) then
				create an_error.make_vpir1a (a_class, arg1, an_agent, arg2)
				report_validity_error (an_error)
			end
		end

	report_vpir1b_error (a_class: ET_CLASS; arg1: ET_FORMAL_ARGUMENT; an_agent: ET_INLINE_AGENT; a_local2: ET_LOCAL_VARIABLE)
			-- Report VPIR-1 error: `arg1' in inline agent `an_agent' has the same
			-- name as local variable `a_local2' of an enclosing feature or inline agent.
			--
			-- ECMA 367-2: p.136
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			arg1_not_void: arg1 /= Void
			an_agent_not_void: an_agent /= Void
			a_local2_not_void: a_local2 /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vpir1_error (a_class) then
				create an_error.make_vpir1b (a_class, arg1, an_agent, a_local2)
				report_validity_error (an_error)
			end
		end

	report_vpir1c_error (a_class: ET_CLASS; a_local1: ET_LOCAL_VARIABLE; an_agent: ET_INLINE_AGENT; arg2: ET_FORMAL_ARGUMENT)
			-- Report VPIR-1 error: `a_local1' in inline agent `an_agent' has the same
			-- name as argument `arg2' of an enclosing feature or inline agent.
			--
			-- ECMA 367-2: p.136
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_local1_not_void: a_local1 /= Void
			an_agent_not_void: an_agent /= Void
			arg2_not_void: arg2 /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vpir1_error (a_class) then
				create an_error.make_vpir1c (a_class, a_local1, an_agent, arg2)
				report_validity_error (an_error)
			end
		end

	report_vpir1d_error (a_class: ET_CLASS; a_local1: ET_LOCAL_VARIABLE; an_agent: ET_INLINE_AGENT; a_local2: ET_LOCAL_VARIABLE)
			-- Report VPIR-1 error: `a_local1' in inline agent `an_agent' has the same
			-- name as local variable `a_local2' of an enclosing feature or inline agent.
			--
			-- ECMA 367-2: p.136
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_local1_not_void: a_local1 /= Void
			an_agent_not_void: an_agent /= Void
			a_local2_not_void: a_local2 /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vpir1_error (a_class) then
				create an_error.make_vpir1d (a_class, a_local1, an_agent, a_local2)
				report_validity_error (an_error)
			end
		end

	report_vpir1e_error (a_class: ET_CLASS; arg: ET_FORMAL_ARGUMENT; an_agent: ET_INLINE_AGENT; a_object_test: ET_NAMED_OBJECT_TEST)
			-- Report VPIR-1 error: `arg' in inline agent `an_agent' has
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vpir1_error (a_class) then
				create an_error.make_vpir1e (a_class, arg, an_agent, a_object_test)
				report_validity_error (an_error)
			end
		end

	report_vpir1f_error (a_class: ET_CLASS; a_local: ET_LOCAL_VARIABLE; an_agent: ET_INLINE_AGENT; a_object_test: ET_NAMED_OBJECT_TEST)
			-- Report VPIR-1 error: `a_local' in inline agent `an_agent' has
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vpir1_error (a_class) then
				create an_error.make_vpir1f (a_class, a_local, an_agent, a_object_test)
				report_validity_error (an_error)
			end
		end

	report_vpir1g_error (a_class: ET_CLASS; arg: ET_FORMAL_ARGUMENT; an_agent: ET_INLINE_AGENT; a_iteration_component: ET_ITERATION_COMPONENT)
			-- Report VPIR-1 error: `arg' in inline agent `an_agent' has
			-- the same name as the cursor of `a_iteration_component' of an enclosing
			-- feature or inline agent whose scope contains the inline agent.
			--
			-- Not in ECMA.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			arg_not_void: arg /= Void
			an_agent_not_void: an_agent /= Void
			a_iteration_component_not_void: a_iteration_component /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vpir1_error (a_class) then
				create an_error.make_vpir1g (a_class, arg, an_agent, a_iteration_component)
				report_validity_error (an_error)
			end
		end

	report_vpir1h_error (a_class: ET_CLASS; a_local: ET_LOCAL_VARIABLE; an_agent: ET_INLINE_AGENT; a_iteration_component: ET_ITERATION_COMPONENT)
			-- Report VPIR-1 error: `a_local' in inline agent `an_agent' has
			-- the same name as the cursor of `a_iteration_component' of an enclosing
			-- feature or inline agent whose scope contains the inline agent.
			--
			-- Not in ECMA.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_local_not_void: a_local /= Void
			an_agent_not_void: an_agent /= Void
			a_iteration_component_not_void: a_iteration_component /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vpir1_error (a_class) then
				create an_error.make_vpir1h (a_class, a_local, an_agent, a_iteration_component)
				report_validity_error (an_error)
			end
		end

	report_vpir3a_error (a_class: ET_CLASS; an_agent: ET_ONCE_ROUTINE_INLINE_AGENT)
			-- Report VPIR-3 error: an inline agent cannot be of the once form.
			--
			-- Only in ISE.
			-- See ECMA 367-2: p.136
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_agent_not_void: an_agent /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vpir3_error (a_class) then
				create an_error.make_vpir3a (a_class, an_agent)
				report_validity_error (an_error)
			end
		end

	report_vpir3b_error (a_class: ET_CLASS; an_agent: ET_EXTERNAL_ROUTINE_INLINE_AGENT)
			-- Report VPIR-3 error: an inline agent cannot be of the external form.
			--
			-- Only in ISE.
			-- See ECMA 367-2: p.136
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			an_agent_not_void: an_agent /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vpir3_error (a_class) then
				create an_error.make_vpir3b (a_class, an_agent)
				report_validity_error (an_error)
			end
		end

	report_vqmc1a_error (a_class, a_class_impl: ET_CLASS; an_attribute: ET_CONSTANT_ATTRIBUTE)
			-- Report VQMC-1 error: `an_attribute', declared in `a_class_impl, introduces
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vqmc1_error (a_class) then
				create an_error.make_vqmc1a (a_class, a_class_impl, an_attribute)
				report_validity_error (an_error)
			end
		end

	report_vqmc2a_error (a_class, a_class_impl: ET_CLASS; an_attribute: ET_CONSTANT_ATTRIBUTE)
			-- Report VQMC-2 error: `an_attribute', declared in `a_class_impl', introduces
			-- a character constant but its type is not "CHARACTER" when viewed from one of its
			-- descendants `a_class' (possibly itself).
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
				create an_error.make_vqmc2a (a_class, a_class_impl, an_attribute)
				report_validity_error (an_error)
			end
		end

	report_vqmc2b_error (a_class, a_class_impl: ET_CLASS; a_attribute: ET_CONSTANT_ATTRIBUTE; a_constant: ET_CHARACTER_CONSTANT)
			-- Report VQMC-2 error: `a_attribute', declared in `a_class_impl', introduces
			-- a character constant `a_constant' but its value is not representable as an instance
			-- of its character type when viewed from one of its descendants `a_class' (possibly itself).
			--
			-- ECMA 367-2: p.100
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_attribute_not_void: a_attribute /= Void
			integer_constant: a_attribute.constant = a_constant
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vqmc2_error (a_class) then
				create an_error.make_vqmc2b (a_class, a_class_impl, a_attribute, a_constant)
				report_validity_error (an_error)
			end
		end

	report_vqmc3a_error (a_class, a_class_impl: ET_CLASS; an_attribute: ET_CONSTANT_ATTRIBUTE)
			-- Report VQMC-3 error: `an_attribute', declared in `a_class_impl', introduces
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vqmc3_error (a_class) then
				create an_error.make_vqmc3a (a_class, a_class_impl, an_attribute)
				report_validity_error (an_error)
			end
		end

	report_vqmc3b_error (a_class, a_class_impl: ET_CLASS; a_attribute: ET_CONSTANT_ATTRIBUTE; a_constant: ET_INTEGER_CONSTANT)
			-- Report VQMC-3 error: `a_attribute', declared in `a_class_impl', introduces
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
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vqmc3_error (a_class) then
				create an_error.make_vqmc3b (a_class, a_class_impl, a_attribute, a_constant)
				report_validity_error (an_error)
			end
		end

	report_vqmc4a_error (a_class, a_class_impl: ET_CLASS; an_attribute: ET_CONSTANT_ATTRIBUTE)
			-- Report VQMC-4 error: `an_attribute', declared in `a_class_imp', introduces
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vqmc4_error (a_class) then
				create an_error.make_vqmc4a (a_class, a_class_impl, an_attribute)
				report_validity_error (an_error)
			end
		end

	report_vqmc5a_error (a_class, a_class_impl: ET_CLASS; an_attribute: ET_CONSTANT_ATTRIBUTE)
			-- Report VQMC-5 error: `an_attribute', declared in `a_class_impl', introduces
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vqmc5_error (a_class) then
				create an_error.make_vqmc5a (a_class, a_class_impl, an_attribute)
				report_validity_error (an_error)
			end
		end

	report_vqmc5b_error (a_class, a_class_impl: ET_CLASS; a_attribute: ET_CONSTANT_ATTRIBUTE; a_constant: ET_MANIFEST_STRING)
			-- Report VQMC-5 error: `a_attribute', declared in `a_class_impl', introduces
			-- a string constant `a_constant' but its value is not representable as an instance
			-- of its string type when viewed from one of its descendants `a_class' (possibly itself).
			--
			-- ECMA 367-2: p.100
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_attribute_not_void: a_attribute /= Void
			integer_constant: a_attribute.constant = a_constant
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vqmc5_error (a_class) then
				create an_error.make_vqmc5b (a_class, a_class_impl, a_attribute, a_constant)
				report_validity_error (an_error)
			end
		end

	report_vqui0a_error (a_class, a_class_impl: ET_CLASS; a_unique: ET_UNIQUE_ATTRIBUTE)
			-- Report VQUI error: the type of `a_unique', declared in `a_class_impl', is
			-- not "INTEGER" when viewed from one of its descendants `a_class' (possibly itself).
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
				create an_error.make_vqui0a (a_class, a_class_impl, a_unique)
				report_validity_error (an_error)
			end
		end

	report_vred0a_error (a_class: ET_CLASS; arg1, arg2: ET_FORMAL_ARGUMENT; f: ET_FEATURE)
			-- Report VRED error: `arg1' and `arg2' have the same
			-- name in feature `f' in `a_class'.
			--
			-- ECMA 367-2: p.55
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
				create an_error.make_vred0a (a_class, arg1, arg2, f)
				report_validity_error (an_error)
			end
		end

	report_vred0b_error (a_class: ET_CLASS; local1, local2: ET_LOCAL_VARIABLE; f: ET_FEATURE)
			-- Report VRED error: `local1' and `local2' have the same
			-- name in feature `f' in `a_class'.
			--
			-- ECMA 367-2: p.55
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
				create an_error.make_vred0b (a_class, local1, local2, f)
				report_validity_error (an_error)
			end
		end

	report_vred0c_error (a_class: ET_CLASS; arg1, arg2: ET_FORMAL_ARGUMENT; an_agent: ET_INLINE_AGENT; f: ET_STANDALONE_CLOSURE)
			-- Report VRED error: `arg1' and `arg2' have the same
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vreg_error (a_class) then
				create an_error.make_vred0c (a_class, arg1, arg2, an_agent, f)
				report_validity_error (an_error)
			end
		end

	report_vred0d_error (a_class: ET_CLASS; local1, local2: ET_LOCAL_VARIABLE; an_agent: ET_INLINE_AGENT; f: ET_STANDALONE_CLOSURE)
			-- Report VRED error: `local1' and `local2' have the same
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vreg_error (a_class) then
				create an_error.make_vred0d (a_class, local1, local2, an_agent, f)
				report_validity_error (an_error)
			end
		end

	report_vreg0a_error (a_class: ET_CLASS; arg1, arg2: ET_FORMAL_ARGUMENT; f: ET_FEATURE)
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

	report_vreg0b_error (a_class: ET_CLASS; local1, local2: ET_LOCAL_VARIABLE; f: ET_FEATURE)
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

	report_vrfa0a_error (a_class: ET_CLASS; arg: ET_FORMAL_ARGUMENT; f1, f2: ET_FEATURE)
			-- Report VRFA error: `arg' in feature `f1' has
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vrfa_error (a_class) then
				create an_error.make_vrfa0a (a_class, arg, f1, f2)
				report_validity_error (an_error)
			end
		end

	report_vrfa0b_error (a_class: ET_CLASS; arg: ET_FORMAL_ARGUMENT; an_agent: ET_INLINE_AGENT; f1: ET_STANDALONE_CLOSURE; f2: ET_FEATURE)
			-- Report VRFA error: `arg' in inline agent `an_agent' of
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vrfa_error (a_class) then
				create an_error.make_vrfa0b (a_class, arg, an_agent, f1, f2)
				report_validity_error (an_error)
			end
		end

	report_vrle1a_error (a_class: ET_CLASS; a_local: ET_LOCAL_VARIABLE; f1, f2: ET_FEATURE)
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

	report_vrle2a_error (a_class: ET_CLASS; a_local: ET_LOCAL_VARIABLE; f: ET_FEATURE; arg: ET_FORMAL_ARGUMENT)
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

	report_vrlv1a_error (a_class: ET_CLASS; a_local: ET_LOCAL_VARIABLE; f1, f2: ET_FEATURE)
			-- Report VRLV-1 error: `a_local' in feature `f1' has
			-- the same name as feature `f2' in `a_class'.
			--
			-- ECMA 367-2: p.56
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_local_not_void: a_local /= Void
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vrlv1_error (a_class) then
				create an_error.make_vrlv1a (a_class, a_local, f1, f2)
				report_validity_error (an_error)
			end
		end

	report_vrlv1b_error (a_class: ET_CLASS; a_local: ET_LOCAL_VARIABLE; an_agent: ET_INLINE_AGENT; f1: ET_STANDALONE_CLOSURE; f2: ET_FEATURE)
			-- Report VRLV-1 error: `a_local' in inline agent `an_agent' of
			-- feature `f1' has the same name as feature `f2' in `a_class'.
			--
			-- ECMA 367-2: p.56
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_local_not_void: a_local /= Void
			an_agent_not_void: an_agent /= Void
			f1_not_void: f1 /= Void
			f2_not_void: f2 /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vrlv1_error (a_class) then
				create an_error.make_vrlv1b (a_class, a_local, an_agent, f1, f2)
				report_validity_error (an_error)
			end
		end

	report_vrlv2a_error (a_class: ET_CLASS; a_local: ET_LOCAL_VARIABLE; f: ET_FEATURE; arg: ET_FORMAL_ARGUMENT)
			-- Report VRLV-2 error: `a_local' in feature `f' has
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vrlv2_error (a_class) then
				create an_error.make_vrlv2a (a_class, a_local, f, arg)
				report_validity_error (an_error)
			end
		end

	report_vrlv2b_error (a_class: ET_CLASS; a_local: ET_LOCAL_VARIABLE; an_agent: ET_INLINE_AGENT; f: ET_STANDALONE_CLOSURE; arg: ET_FORMAL_ARGUMENT)
			-- Report VRLV-2 error: `a_local' in inline agent `an_agent' of
			-- feature `f' has the same name as formal argument `arg' of
			-- this agent in `a_class'.
			--
			-- ECMA 367-2: p.56
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_local_not_void: a_local /= Void
			an_agent_not_void: an_agent /= Void
			f_not_void: f /= Void
			arg_not_void: arg /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vrlv2_error (a_class) then
				create an_error.make_vrlv2b (a_class, a_local, an_agent, f, arg)
				report_validity_error (an_error)
			end
		end

	report_vtat1a_error (a_class: ET_CLASS; a_type: ET_LIKE_FEATURE)
			-- Report VTAT-1 error: the anchor in the Anchored_type
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
			if reportable_vtat1_error (a_class) then
				create an_error.make_vtat1a (a_class, a_type)
				report_validity_error (an_error)
			end
		end

	report_vtat1b_error (a_class: ET_CLASS; a_feature: ET_FEATURE; a_type: ET_LIKE_FEATURE)
			-- Report VTAT-1 error: the anchor in the
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
			if reportable_vtat1_error (a_class) then
				create an_error.make_vtat1b (a_class, a_feature, a_type)
				report_validity_error (an_error)
			end
		end

	report_vtat1c_error (a_class: ET_CLASS; a_type: ET_QUALIFIED_LIKE_IDENTIFIER; other_class: ET_CLASS)
			-- Report VTAT-1 error: the anchor in the Anchored_type
			-- must be the final name of a query in `other_class'.
			--
			-- Not in ETL
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_type_not_void: a_type /= Void
			other_class_not_void: other_class /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vtat1_error (a_class) then
				create an_error.make_vtat1c (a_class, a_type, other_class)
				report_validity_error (an_error)
			end
		end

	report_vtat2a_error (a_class: ET_CLASS; a_cycle: DS_LIST [ET_LIKE_FEATURE])
			-- Report VTAT-2 error: the anchors in `a_cycle'
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
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vtat2_error (a_class) then
				create an_error.make_vtat2a (a_class, a_cycle)
				report_validity_error (an_error)
			end
		end

	report_vtat2b_error (a_class, a_class_impl: ET_CLASS; a_type: ET_LIKE_IDENTIFIER)
			-- Report VTAT-2 error: the type of the anchor of `a_type' appearing in
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vtat2_error (a_class) then
				create an_error.make_vtat2b (a_class, a_class_impl, a_type)
				report_validity_error (an_error)
			end
		end

	report_vtcg3a_error (a_class, a_class_impl: ET_CLASS; a_type: ET_CLASS_TYPE; an_actual: ET_TYPE; a_constraint: ET_CONSTRAINT)
			-- Report VTCG-3 error: actual generic paramater `an_actual'
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
			--   class X [G]
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vtcg3_error (a_class) then
				create an_error.make_vtcg3a (a_class, a_class_impl, a_type, an_actual, a_constraint)
				report_validity_error (an_error)
			end
		end

	report_vtcg4a_error (a_class, a_class_impl: ET_CLASS; a_position: ET_POSITION; an_actual_index: INTEGER; a_name: ET_FEATURE_NAME; an_actual_base_class, a_generic_class: ET_CLASS)
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
				create an_error.make_vtcg4a (a_class, a_class_impl, a_position, an_actual_index, a_name, an_actual_base_class, a_generic_class)
				report_validity_error (an_error)
			end
		end

	report_vtcg4b_error (a_class, a_class_impl: ET_CLASS; a_position: ET_POSITION; an_actual_index: INTEGER; a_name: ET_FEATURE_NAME; an_actual: ET_FORMAL_PARAMETER; a_generic_class: ET_CLASS)
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
				create an_error.make_vtcg4b (a_class, a_class_impl, a_position, an_actual_index, a_name, an_actual, a_generic_class)
				report_validity_error (an_error)
			end
		end

	report_vtct0a_error (a_class: ET_CLASS; a_type: ET_BASE_TYPE)
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

	report_vtug1a_error (a_class: ET_CLASS; a_type: ET_CLASS_TYPE)
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

	report_vtug2a_error (a_class: ET_CLASS; a_type: ET_CLASS_TYPE)
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

	report_vuar1a_error (a_class: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS)
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

	report_vuar1b_error (a_class: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE)
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

	report_vuar1c_error (a_class: ET_CLASS; a_label: ET_CALL_NAME)
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

	report_vuar2a_error (a_class, a_class_impl: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS; arg: INTEGER; an_actual, a_formal: ET_NAMED_TYPE)
			-- Report VUAR-2 error: the `arg'-th actual argument in the qualified
			-- call `a_name' appearing in `a_class_impl' and viewed from one of its
			-- descendants `a_class' (possibly itself) does not conform to the
			-- corresponding formal argument of `a_feature' in class `a_target'.
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
				create an_error.make_vuar2a (a_class, a_class_impl, a_name, a_feature, a_target, arg, an_actual, a_formal)
				report_validity_error (an_error)
			end
		end

	report_vuar2b_error (a_class, a_class_impl: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE; arg: INTEGER; an_actual, a_formal: ET_NAMED_TYPE)
			-- Report VUAR-2 error: the `arg'-th actual argument in the unqualified
			-- call `a_name' appearing in `a_class_impl' and viewed from one of its
			-- descendants `a_class' (possibly itself) does not conform to the
			-- corresponding formal argument of `a_feature' in `a_class'.
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
				create an_error.make_vuar2b (a_class, a_class_impl, a_name, a_feature, arg, an_actual, a_formal)
				report_validity_error (an_error)
			end
		end

	report_vuar4a_error (a_class: ET_CLASS; a_name: ET_FEATURE_NAME)
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

	report_vucr0a_error (a_class: ET_CLASS; a_feature: ET_FEATURE)
			-- Report VUCR error: attributes cannot be used in static calls.
			--
			-- Only in ISE Eiffel
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_attribute: a_feature.is_attribute
			a_feature_static: a_feature.is_static
		local
			a_error: ET_VALIDITY_ERROR
		do
			if reportable_vucr_error (a_class) then
				create a_error.make_vucr0a (a_class, a_feature)
				report_validity_error (a_error)
			end
		end

	report_vucr0b_error (a_class: ET_CLASS; a_feature: ET_FEATURE)
			-- Report VUCR error: once-per-object features cannot be used in static calls.
			--
			-- Only in ISE Eiffel
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_deferred: a_feature.is_deferred
			a_feature_static: a_feature.is_static
		local
			a_error: ET_VALIDITY_ERROR
		do
			if reportable_vucr_error (a_class) then
				create a_error.make_vucr0b (a_class, a_feature)
				report_validity_error (a_error)
			end
		end

	report_vucr0c_error (a_class, a_class_impl: ET_CLASS; a_name: ET_FEATURE_NAME; a_attribute: ET_FEATURE)
			-- Report VUCR error: `a_name', appearing as target of an assignment or a creation instruction
			-- in a feature written in `a_class_impl' and viewed from `a_class' where this feature is marked
			-- as static, is the name of an attribute `a_attribute'.
			--
			-- Only in ISE Eiffel
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_name_not_void: a_name /= Void
			a_attribute_not_void: a_attribute /= Void
			a_attribute_is_attribute: a_attribute.is_attribute
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vucr_error (a_class) then
				create an_error.make_vucr0c (a_class, a_class_impl, a_name, a_attribute)
				report_validity_error (an_error)
			end
		end

	report_vucr0d_error (a_class, a_class_impl: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE)
			-- Report VUCR error: the unqualified call `a_name' written in `a_class_impl'
			-- is a call to the non-static feature `a_feature' from a static feature
			-- when viewed from `a_class'.
			--
			-- Only in ISE Eiffel
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_feature_not_static: not a_feature.is_static
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vucr_error (a_class) then
				create an_error.make_vucr0d (a_class, a_class_impl, a_name, a_feature)
				report_validity_error (an_error)
			end
		end

	report_vucr0e_error (a_class, a_class_impl: ET_CLASS; a_name: ET_CALL_NAME; a_attribute: ET_FEATURE)
			-- Report VUCR error: the access to the address of `a_name' written in `a_class_impl'
			-- if the access to the address of attribute `a_attribute' from a static feature
			-- when viewed from `a_class'.
			--
			-- Only in ISE Eiffel
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_name_not_void: a_name /= Void
			a_a_attribute_not_void: a_attribute /= Void
			a_attribute_is_attribute: a_attribute.is_attribute
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vucr_error (a_class) then
				create an_error.make_vucr0e (a_class, a_class_impl, a_name, a_attribute)
				report_validity_error (an_error)
			end
		end

	report_vucr0f_error (a_class, a_class_impl: ET_CLASS; a_current: ET_CURRENT)
			-- Report VUCR error: `a_current' written in `a_class_impl' is
			-- used in a static feature when viewed from `a_class'.
			--
			-- Only in ISE Eiffel
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_current_not_void: a_current /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vucr_error (a_class) then
				create an_error.make_vucr0f (a_class, a_class_impl, a_current)
				report_validity_error (an_error)
			end
		end

	report_vucr0g_error (a_class, a_class_impl: ET_CLASS; a_current_address: ET_CURRENT_ADDRESS)
			-- Report VUCR error: `a_current_address' written in `a_class_impl'
			-- is used in a static feature when viewed from `a_class'.
			--
			-- Only in ISE Eiffel
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_current_address_not_void: a_current_address /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vucr_error (a_class) then
				create an_error.make_vucr0g (a_class, a_class_impl, a_current_address)
				report_validity_error (an_error)
			end
		end

	report_vucr0h_error (a_class, a_class_impl: ET_CLASS; a_precursor: ET_PRECURSOR_KEYWORD; a_feature: ET_FEATURE)
			-- Report VUCR error: the call to `a_precursor' written in `a_class_impl'
			-- is a call to the non-static feature `a_feature' from a static feature
			-- when viewed from `a_class'.
			--
			-- Only in ISE Eiffel
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_precursor_not_void: a_precursor /= Void
			a_feature_not_void: a_feature /= Void
			a_feature_not_static: not a_feature.is_static
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vucr_error (a_class) then
				create an_error.make_vucr0h (a_class, a_class_impl, a_precursor, a_feature)
				report_validity_error (an_error)
			end
		end

	report_vucr0i_error (a_class, a_class_impl: ET_CLASS; a_agent: ET_INLINE_AGENT)
			-- Report VUCR error: the inline agent `a_agent' written in `a_class_impl'
			-- appears in a static feature when viewed from `a_class'.
			--
			-- Only in ISE Eiffel
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_agent_not_void: a_agent /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vucr_error (a_class) then
				create an_error.make_vucr0i (a_class, a_class_impl, a_agent)
				report_validity_error (an_error)
			end
		end

	report_vucr0j_error (a_class, a_class_impl: ET_CLASS; a_agent: ET_CALL_AGENT)
			-- Report VUCR error: the unqualified call agent `a_agent' written in `a_class_impl'
			-- appears in a static feature when viewed from `a_class'.
			--
			-- Only in ISE Eiffel
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_agent_not_void: a_agent /= Void
			a_unqualified_call_agent: not a_agent.is_qualified_call
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vucr_error (a_class) then
				create an_error.make_vucr0j (a_class, a_class_impl, a_agent)
				report_validity_error (an_error)
			end
		end

	report_vuex1a_error (a_class: ET_CLASS; a_name: ET_CALL_NAME)
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

	report_vuex2a_error (a_class: ET_CLASS; a_name: ET_CALL_NAME; a_target: ET_CLASS)
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

	report_vuex2b_error (a_class, a_class_impl: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS)
			-- Report VUEX-2 error: `a_feature' of class `a_target'
			-- is not exported to `a_class', one of the descendants
			-- of `a_class_impl' (possibly itself) where the qualified
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vuex2_error (a_class) then
				create an_error.make_vuex2b (a_class, a_class_impl, a_name, a_feature, a_target)
				report_validity_error (an_error)
			end
		end

	report_vuno3a_error (a_class, a_class_impl: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE; a_target: ET_CLASS)
			-- Report VUNO-3 error: `a_feature' of class `a_target' is not valid for
			-- static call when called from `a_class', one of the descendants
			-- of `a_class_impl' (possibly itself) where the static
			-- call `a_name' appears.
			--
			-- ECMA: 367-2: p.121
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
			if reportable_vuno3_error (a_class) then
				create an_error.make_vuno3a (a_class, a_class_impl, a_name, a_feature, a_target)
				report_validity_error (an_error)
			end
		end

	report_vuno5a_error (a_class, a_class_impl: ET_CLASS; a_target_type: ET_TYPE; a_target_class: ET_CLASS)
			-- Report VUNO-5 error: base class `a_target_class' of a static call with
			-- target type `a_target_type' is deferred when called from `a_class', one
			-- of the descendants of `a_class_impl' (possibly itself) where the static
			-- call appears.
			--
			-- Only in ISE Eiffel
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_target_type_not_void: a_target_type /= Void
			a_target_class_not_void: a_target_class /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vuno5_error (a_class) then
				create an_error.make_vuno5a (a_class, a_class_impl, a_target_type, a_target_class)
				report_validity_error (an_error)
			end
		end

	report_vuno5b_error (a_class, a_class_impl: ET_CLASS; a_target_type: ET_TYPE)
			-- Report VUNO-5 error: the target type `a_target_type' of a static call
			-- is of the form 'like Current' when called from `a_class', one of
			-- the descendants of `a_class_impl' (possibly itself) where the static
			-- call appears.
			--
			-- Only in ISE Eiffel
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_target_type_not_void: a_target_type /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vuno5_error (a_class) then
				create an_error.make_vuno5b (a_class, a_class_impl, a_target_type)
				report_validity_error (an_error)
			end
		end

	report_vuot1a_error (a_class: ET_CLASS; a_object_test: ET_NAMED_OBJECT_TEST; a_feature: ET_FEATURE)
			-- Report VUOT-1 error: The local of `a_object_test' has the same
			-- name as `a_feature' in `a_class'.
			--
			-- ECMA 367-2: p.127
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_object_test_not_void: a_object_test /= Void
			a_feature_not_void: a_feature /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vuot1_error (a_class) then
				create an_error.make_vuot1a (a_class, a_object_test, a_feature)
				report_validity_error (an_error)
			end
		end

	report_vuot1b_error (a_class: ET_CLASS; a_object_test: ET_NAMED_OBJECT_TEST; arg: ET_FORMAL_ARGUMENT)
			-- Report VUOT-1 error: The local of `a_object_test' has
			-- the same name as argument `arg' of an enclosing feature or
			-- inline agent.
			--
			-- ECMA 367-2: p.127
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_object_test_not_void: a_object_test /= Void
			arg_not_void: arg /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vuot1_error (a_class) then
				create an_error.make_vuot1b (a_class, a_object_test, arg)
				report_validity_error (an_error)
			end
		end

	report_vuot1c_error (a_class: ET_CLASS; a_object_test: ET_NAMED_OBJECT_TEST; a_local: ET_LOCAL_VARIABLE)
			-- Report VUOT-1 error: The local of `a_object_test' has
			-- the same name as local variable `a_local' of an enclosing
			-- feature or inline agent.
			--
			-- ECMA 367-2: p.127
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_object_test_not_void: a_object_test /= Void
			a_local_not_void: a_local /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vuot1_error (a_class) then
				create an_error.make_vuot1c (a_class, a_object_test, a_local)
				report_validity_error (an_error)
			end
		end

	report_vuot1d_error (a_class: ET_CLASS; a_object_test1, a_object_test2: ET_NAMED_OBJECT_TEST)
			-- Report VUOT-1 error: `a_object_test1' appears in the scope
			-- of the local of `a_object_test2' with the same local name.
			--
			-- ECMA 367-2: p.127
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_object_test1_not_void: a_object_test1 /= Void
			a_object_test2_not_void: a_object_test2 /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vuot1_error (a_class) then
				create an_error.make_vuot1d (a_class, a_object_test1, a_object_test2)
				report_validity_error (an_error)
			end
		end

	report_vuot1e_error (a_class: ET_CLASS; a_object_test: ET_NAMED_OBJECT_TEST; a_iteration_component: ET_ITERATION_COMPONENT)
			-- Report VUOT-1 error: `a_object_test' appears in the scope
			-- of the cursor of `a_iteration_component' with the same local name.
			--
			-- Not in ECMA.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_object_test_not_void: a_object_test /= Void
			a_iteration_component_not_void: a_iteration_component /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vuot1_error (a_class) then
				create an_error.make_vuot1e (a_class, a_object_test, a_iteration_component)
				report_validity_error (an_error)
			end
		end

	report_vuot1f_error (a_class: ET_CLASS; a_object_test1, a_object_test2: ET_NAMED_OBJECT_TEST)
			-- Report VUOT-1 error: `a_object_test1' and `a_object_test2' have the same
			-- local name and their scope overlap.
			--
			-- Not in ECMA yet
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_object_test1_not_void: a_object_test1 /= Void
			a_object_test2_not_void: a_object_test2 /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vuot1_error (a_class) then
				create an_error.make_vuot1f (a_class, a_object_test1, a_object_test2)
				report_validity_error (an_error)
			end
		end

	report_vuot3a_error (a_class: ET_CLASS; a_object_test1, a_object_test2: ET_NAMED_OBJECT_TEST; a_feature: ET_FEATURE)
			-- Report VUOT-3 error: The local of `a_object_test1' has
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vuot3_error (a_class) then
				create an_error.make_vuot3a (a_class, a_object_test1, a_object_test2, a_feature)
				report_validity_error (an_error)
			end
		end

	report_vuot3b_error (a_class: ET_CLASS; a_object_test1, a_object_test2: ET_NAMED_OBJECT_TEST)
			-- Report VUOT-3 error: The local of `a_object_test1' has
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vuot3_error (a_class) then
				create an_error.make_vuot3b (a_class, a_object_test1, a_object_test2)
				report_validity_error (an_error)
			end
		end

	report_vuot4a_error (a_class: ET_CLASS; a_object_test: ET_NAMED_OBJECT_TEST)
			-- Report VUOT-4 error: ISE does not support object-tests in preconditions.
			--
			-- Only in ISE.
			-- See ECMA 367-2: p.127
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_object_test_not_void: a_object_test /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vuot4_error (a_class) then
				create an_error.make_vuot4a (a_class, a_object_test)
				report_validity_error (an_error)
			end
		end

	report_vuot4b_error (a_class: ET_CLASS; a_object_test: ET_NAMED_OBJECT_TEST)
			-- Report VUOT-4 error: ISE does not support object-tests in check instructions.
			--
			-- Only in ISE.
			-- See ECMA 367-2: p.127
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_object_test_not_void: a_object_test /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vuot4_error (a_class) then
				create an_error.make_vuot4b (a_class, a_object_test)
				report_validity_error (an_error)
			end
		end

	report_vuta2a_error (a_class, a_class_impl: ET_CLASS; a_name: ET_CALL_NAME; a_feature: ET_FEATURE; a_target_type: ET_NAMED_TYPE)
			-- Report VUTA-2 error: the target, of type `a_target_type', of the call to feature `a_feature'
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vuta2_error (a_class) then
				create an_error.make_vuta2a (a_class, a_class_impl, a_name, a_feature, a_target_type)
				report_validity_error (an_error)
			end
		end

	report_vuta2b_error (a_class, a_class_impl: ET_CLASS; a_name: ET_CALL_NAME; a_target_type: ET_NAMED_TYPE)
			-- Report VUTA-2 error: the target, of type `a_target_type', of the call to Tuple label `a_name'
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vuta2_error (a_class) then
				create an_error.make_vuta2b (a_class, a_class_impl, a_name, a_target_type)
				report_validity_error (an_error)
			end
		end

	report_vvok1a_error (a_class: ET_CLASS; a_once_key1, a_once_key2: ET_MANIFEST_STRING)
			-- Report VVOK-1 error: `a_once_key1' and `a_once_key2' cannot be
			-- combined. The supported once keys "PROCESS", "THREAD" and "OBJECT"
			-- cannot be combined.
			--
			-- Not in ECMA, only in ISE
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_once_key1_not_void: a_once_key1 /= Void
			a_once_key2_not_void: a_once_key2 /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vvok1_error (a_class) then
				create an_error.make_vvok1a (a_class, a_once_key1, a_once_key2)
				report_validity_error (an_error)
			end
		end

	report_vvok1b_error (a_class: ET_CLASS; a_indexing_term1: ET_INDEXING_TERM; a_once_key2: ET_MANIFEST_STRING)
			-- Report VVOK-1 error: `a_indexing_term1' and `a_once_key2' cannot be
			-- combined. The supported once keys "PROCESS", "THREAD" and "OBJECT"
			-- cannot be combined.
			--
			-- Not in ECMA, only in ISE
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_indexing_term1_not_void: a_indexing_term1 /= Void
			a_once_key2_not_void: a_once_key2 /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vvok1_error (a_class) then
				create an_error.make_vvok1b (a_class, a_indexing_term1, a_once_key2)
				report_validity_error (an_error)
			end
		end

	report_vvok1c_error (a_class: ET_CLASS; a_indexing_term1, a_indexing_term2: ET_INDEXING_TERM)
			-- Report VVOK-1 error: `a_indexing_term1' and `a_indexing_term2' cannot be
			-- combined. The supported once keys "PROCESS", "THREAD" and "OBJECT"
			-- cannot be combined.
			--
			-- Not in ECMA, only in ISE
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_indexing_term1_not_void: a_indexing_term1 /= Void
			a_indexing_term2_not_void: a_indexing_term2 /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vvok1_error (a_class) then
				create an_error.make_vvok1c (a_class, a_indexing_term1, a_indexing_term2)
				report_validity_error (an_error)
			end
		end

	report_vvok2a_error (a_class: ET_CLASS; a_once_key: ET_MANIFEST_STRING)
			-- Report VVOK-2 error: `a_once_key' is not one of the supported
			-- once keys. The supported once keys are "PROCESS", "THREAD" and "OBJECT".
			--
			-- Not in ECMA, only in ISE
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_once_key_not_void: a_once_key /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vvok2_error (a_class) then
				create an_error.make_vvok2a (a_class, a_once_key)
				report_validity_error (an_error)
			end
		end

	report_vvok2b_error (a_class: ET_CLASS; a_indexing_term: ET_INDEXING_TERM)
			-- Report VVOK-2 error: `a_indexing_term' is not one of the supported
			-- once keys. The supported once keys are "PROCESS", "THREAD" and "OBJECT".
			--
			-- Not in ECMA, only in ISE
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_indexing_term_not_void: a_indexing_term /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vvok2_error (a_class) then
				create an_error.make_vvok2b (a_class, a_indexing_term)
				report_validity_error (an_error)
			end
		end

	report_vwab0a_error (a_class, a_class_impl: ET_CLASS; a_attribute: ET_EXTENDED_ATTRIBUTE)
			-- Report VWAB warning: the self-initializing code for
			-- attribute `a_attribute' appearing in `a_class_impl' and viewed
			-- from one of its descendants `a_class' (possibly itself),
			-- will never be executed because its type is either detachable
			-- or expanded.
			--
			-- Not in ECMA, only in ISE (as of ISE 20.03.10.3992).
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_attribute_not_void: a_attribute /= Void
		local
			l_error: ET_VALIDITY_ERROR
		do
			if reportable_vwab_error (a_class) then
				create l_error.make_vwab0a (a_class, a_class_impl, a_attribute)
				report_validity_error (l_error)
			end
		end

	report_vwbe0a_error (a_class, a_class_impl: ET_CLASS; an_expression: ET_EXPRESSION; a_type: ET_NAMED_TYPE)
			-- Report VWBE error: the boolean expression `an_expression'
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vwbe_error (a_class) then
				create an_error.make_vwbe0a (a_class, a_class_impl, an_expression, a_type)
				report_validity_error (an_error)
			end
		end

	report_vwce0a_error (a_class, a_class_impl: ET_CLASS; a_expression: ET_EXPRESSION; a_type, a_other_type: ET_NAMED_TYPE)
			-- Report VWCE error: the expression `a_expression' appearing
			-- in a conditional expression in `a_class_impl' and viewed
			-- from one of its descendants `a_class' (possibly itself) is
			-- of type `a_type' which does not conform to the type `a_other_type'
			-- of some other expression in this conditional expression.
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_expression_not_void: a_expression /= Void
			a_type_not_void: a_type /= Void
			a_other_type_not_void: a_other_type /= Void
		local
			a_error: ET_VALIDITY_ERROR
		do
			if reportable_vwce_error (a_class) then
				create a_error.make_vwce0a (a_class, a_class_impl, a_expression, a_type, a_other_type)
				report_validity_error (a_error)
			end
		end

	report_vweq0a_error (a_class, a_class_impl: ET_CLASS; an_expression: ET_EQUALITY_EXPRESSION; a_type1, a_type2: ET_NAMED_TYPE)
			-- Report VWEQ error: none of the operands of the equality
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vweq_error (a_class) then
				create an_error.make_vweq0a (a_class, a_class_impl, an_expression, a_type1, a_type2)
				report_validity_error (an_error)
			end
		end

	report_vweq0b_error (a_class, a_class_impl: ET_CLASS; an_expression: ET_OBJECT_EQUALITY_EXPRESSION; a_type1, a_type2: ET_NAMED_TYPE)
			-- Report VWEQ error: none of the operands of the object-equality
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vweq_error (a_class) then
				create an_error.make_vweq0b (a_class, a_class_impl, an_expression, a_type1, a_type2)
				report_validity_error (an_error)
			end
		end

	report_vwma1a_error (a_class, a_class_impl: ET_CLASS; a_manifest_array: ET_MANIFEST_ARRAY)
			-- Report VWMA-1 error: the cast type of `a_manifest_array' appearing in
			-- `a_class_impl' and viewed from one of its descendants `a_class'
			-- (possibly itself) is not an "ARRAY" type.
			--
			-- See https://www.eiffel.org/doc/version/trunk/eiffel/Manifest%20array
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_manifest_array_not_void: a_manifest_array /= Void
			a_cast_type_not_void: a_manifest_array.cast_type /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vwma1_error (a_class) then
				create an_error.make_vwma1a (a_class, a_class_impl, a_manifest_array)
				report_validity_error (an_error)
			end
		end

	report_vwma2a_error (a_class, a_class_impl: ET_CLASS; a_manifest_array_item: ET_EXPRESSION; i: INTEGER; a_item_type, a_array_parameter_type: ET_NAMED_TYPE)
			-- Report VWMA-2 error: the type `a_item_type' of the `i'-th item
			-- `a_manifest_array_item' in manifest array appearing in `a_class_impl'
			-- and viewed from one of its descendants `a_class' (possibly itself),
			-- does not conform nor convert to the generic parameter
			-- `a_array_parameter_type' of the array type specified
			-- for the manifest array.
			--
			-- See https://www.eiffel.org/doc/version/trunk/eiffel/Manifest%20array
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_manifest_array_item_not_void: a_manifest_array_item /= Void
			a_item_type_type_not_void: a_item_type /= Void
			a_item_type_type_is_named_type: a_item_type.is_named_type
			a_array_parameter_type_not_void: a_array_parameter_type /= Void
			a_array_parameter_type_is_named_type: a_array_parameter_type.is_named_type
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vwma2_error (a_class) then
				create an_error.make_vwma2a (a_class, a_class_impl, a_manifest_array_item, i, a_item_type, a_array_parameter_type)
				report_validity_error (an_error)
			end
		end

	report_vwmq0a_error (a_class, a_class_impl: ET_CLASS; a_constant: ET_INTEGER_CONSTANT)
			-- Report VWMQ error: the cast type of `a_constant' appearing in
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vwmq_error (a_class) then
				create an_error.make_vwmq0a (a_class, a_class_impl, a_constant)
				report_validity_error (an_error)
			end
		end

	report_vwmq0b_error (a_class, a_class_impl: ET_CLASS; a_constant: ET_REAL_CONSTANT)
			-- Report VWMQ error: the cast type of `a_constant' appearing in
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vwmq_error (a_class) then
				create an_error.make_vwmq0b (a_class, a_class_impl, a_constant)
				report_validity_error (an_error)
			end
		end

	report_vwmq0c_error (a_class, a_class_impl: ET_CLASS; a_constant: ET_CHARACTER_CONSTANT)
			-- Report VWMQ error: the cast type of `a_constant' appearing in
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vwmq_error (a_class) then
				create an_error.make_vwmq0c (a_class, a_class_impl, a_constant)
				report_validity_error (an_error)
			end
		end

	report_vwmq0d_error (a_class, a_class_impl: ET_CLASS; a_constant: ET_MANIFEST_STRING)
			-- Report VWMQ error: the cast type of `a_constant' appearing in
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_vwmq_error (a_class) then
				create an_error.make_vwmq0d (a_class, a_class_impl, a_constant)
				report_validity_error (an_error)
			end
		end

	report_vwst1a_error (a_class: ET_CLASS; a_name: ET_FEATURE_NAME)
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

	report_vwst1b_error (a_class: ET_CLASS; a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE)
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

	report_vwst2a_error (a_class: ET_CLASS; a_name1, a_name2: ET_FEATURE_NAME)
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

	report_vxrt0a_error (a_class: ET_CLASS; a_retry: ET_RETRY_INSTRUCTION)
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

	report_gvagp0a_error (a_class: ET_CLASS; anc1, anc2: ET_BASE_TYPE)
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
				report_validity_error (an_error)
			end
		end

	report_gvhpr5a_error (a_class: ET_CLASS; a_parent: ET_TUPLE_TYPE)
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

	report_gvhso1a_error (a_class: ET_CLASS)
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

	report_gvhso2a_error (a_class: ET_CLASS)
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

	report_gvkbs0a_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE; a_expected_arguments: detachable ARRAY [ET_TYPE]; a_expected_type: detachable ET_TYPE)
			-- Report GVKBS error: wrong signature for built-in
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
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkbs_error (a_class) then
				create an_error.make_gvkbs0a (a_class, a_feature, a_expected_arguments, a_expected_type)
				report_validity_error (an_error)
			end
		end

	report_gvkbu1a_error (a_class: ET_CLASS; a_feature: ET_EXTERNAL_ROUTINE)
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

	report_gvkfe1a_error (a_class: ET_CLASS; a_name: ET_FEATURE_NAME)
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

	report_gvkfe2a_error (a_class: ET_CLASS; a_feature: ET_FEATURE)
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

	report_gvkfe3a_error (a_class: ET_CLASS; a_feature: ET_FEATURE; a_type: ET_BASE_TYPE)
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

	report_gvkfe4a_error (a_class: ET_CLASS; a_feature: ET_FEATURE)
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

	report_gvkfe5a_error (a_class: ET_CLASS; a_feature: ET_FEATURE)
			-- Report GVKFE-5 error: feature `a_feature' in kernel
			-- class `a_class' is not a query.
			--
			-- Not in ETL
			-- GVKFE: Gobo Validity Kernel FEature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			a_feature_not_query: not a_feature.is_query
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkfe5_error (a_class) then
				create an_error.make_gvkfe5a (a_class, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvkfe6a_error (a_class: ET_CLASS; a_feature: ET_FEATURE; a_expected_arguments: detachable ARRAY [ET_TYPE]; a_expected_type: detachable ET_TYPE)
			-- Report GVKFE-6 error: wrong signature for routine `a_feature'
			-- in kernel class `a_class'.
			--
			-- Not in ETL
			-- GVKFE: Gobo Validity Kernel FEature
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_feature_not_void: a_feature /= Void
			no_void_argument: a_expected_arguments /= Void implies not ANY_ARRAY_.has (a_expected_arguments, Void)
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvkfe6_error (a_class) then
				create an_error.make_gvkfe6a (a_class, a_feature, a_expected_arguments, a_expected_type)
				report_validity_error (an_error)
			end
		end

	report_gvscn1a_error (a_class: ET_CLASS; a_name: ET_CLASS_NAME; a_filename: STRING)
			-- Report GVSCN-1 error: the class text in `a_filename' is
			-- supposed to contain a class of name `a_class.name', but it
			-- actually contains a class of name `a_name'.
			--
			-- Not in ETL
		require
			a_class_not_void: a_class /= Void
			a_name_not_void: a_name /= Void
			a_filename_not_void: a_filename /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvscn1_error (a_class) then
				create an_error.make_gvscn1a (a_class, a_name, a_filename)
				report_validity_error (an_error)
			end
		end

	report_gvscn1b_error (a_class: ET_CLASS; a_filename: STRING)
			-- Report GVSCN-1 error: the class text in `a_filename' is
			-- supposed to contain a class of name `a_class.name', but it
			-- does not.
			--
			-- Not in ETL
		require
			a_class_not_void: a_class /= Void
			a_filename_not_void: a_filename /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvscn1_error (a_class) then
				create an_error.make_gvscn1b (a_class, a_filename)
				report_validity_error (an_error)
			end
		end

	report_gvtcg5a_error (a_class, a_class_impl: ET_CLASS; a_type: ET_CLASS_TYPE; an_actual: ET_TYPE; a_formal: ET_FORMAL_PARAMETER)
			-- Report GVTCG-5 error: actual generic paramater `an_actual' of `a_type' in
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvtcg5_error (a_class) then
				create an_error.make_gvtcg5a (a_class, a_class_impl, a_type, an_actual, a_formal)
				report_validity_error (an_error)
			end
		end

	report_gvtcg5b_error (a_class, a_class_impl: ET_CLASS; a_type: ET_CLASS_TYPE; an_actual: ET_TYPE; a_formal: ET_FORMAL_PARAMETER)
			-- Report GVTCG-5 error: actual generic paramater `an_actual' of `a_type' in
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvtcg5_error (a_class) then
				create an_error.make_gvtcg5b (a_class, a_class_impl, a_type, an_actual, a_formal)
				report_validity_error (an_error)
			end
		end

	report_gvuaa0a_error (a_class: ET_CLASS; a_name: ET_IDENTIFIER; a_feature: ET_FEATURE)
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

	report_gvuaa0b_error (a_class: ET_CLASS; a_name: ET_IDENTIFIER; an_agent: ET_INLINE_AGENT)
			-- Report GVUAA error: `a_name' is a formal argument of
			-- inline agent `an_agent' in `a_class', and hence cannot
			-- have actual arguments.
			--
			-- Not in ETL as validity error but as syntax error
			-- GVUAA: See ETL2 VUAR
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			an_agent_not_void: an_agent /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvuaa_error (a_class) then
				create an_error.make_gvuaa0b (a_class, a_name, an_agent)
				report_validity_error (an_error)
			end
		end

	report_gvuac0a_error (a_class: ET_CLASS; a_name: ET_IDENTIFIER; a_feature: ET_FEATURE)
			-- Report GVUAC error: `a_name' is an across cursor of
			-- `a_feature' in `a_class', and hence cannot have actual
			-- arguments.
			--
			-- Not in ETL as validity error but as syntax error
			-- GVUAC: See ETL2 VUAR
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvuac_error (a_class) then
				create an_error.make_gvuac0a (a_class, a_name, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvuac0b_error (a_class: ET_CLASS; a_name: ET_IDENTIFIER; an_agent: ET_INLINE_AGENT)
			-- Report GVUAC error: `a_name' is an across cursor of
			-- inline agent `an_agent' in `a_class', and hence cannot
			-- have actual arguments.
			--
			-- Not in ETL as validity error but as syntax error
			-- GVUAC: See ETL2 VUAR
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			an_agent_not_void: an_agent /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvuac_error (a_class) then
				create an_error.make_gvuac0b (a_class, a_name, an_agent)
				report_validity_error (an_error)
			end
		end

	report_gvuac0c_error (a_class: ET_CLASS; a_name: ET_IDENTIFIER; a_invariants: ET_INVARIANTS)
			-- Report GVUAC error: `a_name' is an across cursor of
			-- invariants `a_invariants' in `a_class', and hence cannot
			-- have actual arguments.
			--
			-- Not in ETL as validity error but as syntax error
			-- GVUAC: See ETL2 VUAR
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_invariants_not_void: a_invariants /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvuac_error (a_class) then
				create an_error.make_gvuac0c (a_class, a_name, a_invariants)
				report_validity_error (an_error)
			end
		end

	report_gvual0a_error (a_class: ET_CLASS; a_name: ET_IDENTIFIER; a_feature: ET_FEATURE)
			-- Report GVUAL error: `a_name' is a local variable of
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
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvual_error (a_class) then
				create an_error.make_gvual0a (a_class, a_name, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvual0b_error (a_class: ET_CLASS; a_name: ET_IDENTIFIER; an_agent: ET_INLINE_AGENT)
			-- Report GVUAL error: `a_name' is a local variable of
			-- inline agent `an_agent' in `a_class', and hence cannot
			-- have actual arguments.
			--
			-- Not in ETL as validity error but as syntax error
			-- GVUAL: See ETL2 VUAR
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			an_agent_not_void: an_agent /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvual_error (a_class) then
				create an_error.make_gvual0b (a_class, a_name, an_agent)
				report_validity_error (an_error)
			end
		end

	report_gvuao0a_error (a_class: ET_CLASS; a_name: ET_IDENTIFIER; a_feature: ET_FEATURE)
			-- Report GVUAO error: `a_name' is an object-test local of
			-- `a_feature' in `a_class', and hence cannot have actual
			-- arguments.
			--
			-- Not in ETL as validity error but as syntax error
			-- GVUAO: See ETL2 VUAR
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvuao_error (a_class) then
				create an_error.make_gvuao0a (a_class, a_name, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvuao0b_error (a_class: ET_CLASS; a_name: ET_IDENTIFIER; an_agent: ET_INLINE_AGENT)
			-- Report GVUAO error: `a_name' is an object-test local of
			-- inline agent `an_agent' in `a_class', and hence cannot
			-- have actual arguments.
			--
			-- Not in ETL as validity error but as syntax error
			-- GVUAO: See ETL2 VUAR
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			an_agent_not_void: an_agent /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvuao_error (a_class) then
				create an_error.make_gvuao0b (a_class, a_name, an_agent)
				report_validity_error (an_error)
			end
		end

	report_gvuao0c_error (a_class: ET_CLASS; a_name: ET_IDENTIFIER; a_invariants: ET_INVARIANTS)
			-- Report GVUAO error: `a_name' is an object-test local of
			-- invariants `a_invariants' in `a_class', and hence cannot
			-- have actual arguments.
			--
			-- Not in ETL as validity error but as syntax error
			-- GVUAO: See ETL2 VUAR
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_invariants_not_void: a_invariants /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvuao_error (a_class) then
				create an_error.make_gvuao0c (a_class, a_name, a_invariants)
				report_validity_error (an_error)
			end
		end

	report_gvuia0a_error (a_class: ET_CLASS; a_name: ET_IDENTIFIER; a_feature: ET_FEATURE)
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

	report_gvuia0b_error (a_class: ET_CLASS; a_name: ET_IDENTIFIER; an_agent: ET_INLINE_AGENT)
			-- Report GVUIA error: `a_name' is a formal argument of
			-- inline agent `an_agent' in `a_class', and hence cannot
			-- be an instruction.
			--
			-- Not in ETL as validity error but as syntax error
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			an_agent_not_void: an_agent /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvuia_error (a_class) then
				create an_error.make_gvuia0b (a_class, a_name, an_agent)
				report_validity_error (an_error)
			end
		end

	report_gvuic0a_error (a_class: ET_CLASS; a_name: ET_IDENTIFIER; a_feature: ET_FEATURE)
			-- Report GVUIC error: `a_name' is an across cursor of
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
			if reportable_gvuic_error (a_class) then
				create an_error.make_gvuic0a (a_class, a_name, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvuic0b_error (a_class: ET_CLASS; a_name: ET_IDENTIFIER; an_agent: ET_INLINE_AGENT)
			-- Report GVUIC error: `a_name' is an across cursor of
			-- inline agent `an_agent' in `a_class', and hence cannot
			-- be an instruction.
			--
			-- Not in ETL as validity error but as syntax error
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			an_agent_not_void: an_agent /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvuic_error (a_class) then
				create an_error.make_gvuic0b (a_class, a_name, an_agent)
				report_validity_error (an_error)
			end
		end

	report_gvuic0c_error (a_class: ET_CLASS; a_name: ET_IDENTIFIER; a_invariants: ET_INVARIANTS)
			-- Report GVUIC error: `a_name' is an across cursor of
			-- invariants `a_invariants' in `a_class', and hence cannot
			-- be an instruction.
			--
			-- Not in ETL as validity error but as syntax error
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_invariants_not_void: a_invariants /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvuic_error (a_class) then
				create an_error.make_gvuic0c (a_class, a_name, a_invariants)
				report_validity_error (an_error)
			end
		end

	report_gvuil0a_error (a_class: ET_CLASS; a_name: ET_IDENTIFIER; a_feature: ET_FEATURE)
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

	report_gvuil0b_error (a_class: ET_CLASS; a_name: ET_IDENTIFIER; an_agent: ET_INLINE_AGENT)
			-- Report GVUIL error: `a_name' is a local variable of
			-- inline agent `an_agent' in `a_class', and hence cannot
			-- be an instruction.
			--
			-- Not in ETL as validity error but as syntax error
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			an_agent_not_void: an_agent /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvuil_error (a_class) then
				create an_error.make_gvuil0b (a_class, a_name, an_agent)
				report_validity_error (an_error)
			end
		end

	report_gvuio0a_error (a_class: ET_CLASS; a_name: ET_IDENTIFIER; a_feature: ET_FEATURE)
			-- Report GVUIO error: `a_name' is an object-test local of
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
			if reportable_gvuio_error (a_class) then
				create an_error.make_gvuio0a (a_class, a_name, a_feature)
				report_validity_error (an_error)
			end
		end

	report_gvuio0b_error (a_class: ET_CLASS; a_name: ET_IDENTIFIER; an_agent: ET_INLINE_AGENT)
			-- Report GVUIO error: `a_name' is an object-test local of
			-- inline agent `an_agent' in `a_class', and hence cannot
			-- be an instruction.
			--
			-- Not in ETL as validity error but as syntax error
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			an_agent_not_void: an_agent /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvuio_error (a_class) then
				create an_error.make_gvuio0b (a_class, a_name, an_agent)
				report_validity_error (an_error)
			end
		end

	report_gvuio0c_error (a_class: ET_CLASS; a_name: ET_IDENTIFIER; a_invariants: ET_INVARIANTS)
			-- Report GVUIO error: `a_name' is an object-test local of
			-- invariants `a_invariants' in `a_class', and hence cannot
			-- be an instruction.
			--
			-- Not in ETL as validity error but as syntax error
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_name_not_void: a_name /= Void
			a_invariants_not_void: a_invariants /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvuio_error (a_class) then
				create an_error.make_gvuio0c (a_class, a_name, a_invariants)
				report_validity_error (an_error)
			end
		end

	report_gvwmc2a_error (a_class, a_class_impl: ET_CLASS; a_constant: ET_INTEGER_CONSTANT; a_type: ET_NAMED_TYPE)
			-- Report GVWMC-2 error: `a_constant' in `a_class_impl' and viewed
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
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvwmc2_error (a_class) then
				create an_error.make_gvwmc2a (a_class, a_class_impl, a_constant, a_type)
				report_validity_error (an_error)
			end
		end

	report_gvwmc2b_error (a_class, a_class_impl: ET_CLASS; a_constant: ET_CHARACTER_CONSTANT; a_type: ET_NAMED_TYPE)
			-- Report GVWMC-2 error: `a_constant' in `a_class_impl' and viewed
			-- from one of its descendants `a_class' (possibly itself) is not
			-- representable as an instance of the character type `a_type'.
			--
			-- Not in ECMA-367-2
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_constant_not_void: a_constant /= Void
			a_type_not_void: a_type /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvwmc2_error (a_class) then
				create an_error.make_gvwmc2b (a_class, a_class_impl, a_constant, a_type)
				report_validity_error (an_error)
			end
		end

	report_gvwmc2c_error (a_class, a_class_impl: ET_CLASS; a_constant: ET_MANIFEST_STRING; a_type: ET_NAMED_TYPE)
			-- Report GVWMC-2 error: `a_constant' in `a_class_impl' and viewed
			-- from one of its descendants `a_class' (possibly itself) is not
			-- representable as an instance of the string type `a_type'.
			--
			-- Not in ECMA-367-2
		require
			a_class_not_void: a_class /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_impl_preparsed: a_class_impl.is_preparsed
			a_constant_not_void: a_constant /= Void
			a_type_not_void: a_type /= Void
		local
			an_error: ET_VALIDITY_ERROR
		do
			if reportable_gvwmc2_error (a_class) then
				create an_error.make_gvwmc2c (a_class, a_class_impl, a_constant, a_type)
				report_validity_error (an_error)
			end
		end

feature -- Validity error status

	reportable_vaol1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VAOL-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vape1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VAPE-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vape2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VAPE-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vave_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VAVE error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vbac1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VBAC-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vbac2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VBAC-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vcch1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VCCH-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vcch2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VCCH-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vcfg1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VCFG-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vcfg2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VCFG-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vdjr_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VDJR error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vdjr2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VDJR-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vdpr1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VDPR-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vdpr2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VDPR-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vdpr3_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VDPR-3 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vdpr4_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VDPR-4 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vdrd2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VDRD-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vdrd3_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VDRD-3 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vdrd4_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VDRD-4 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vdrd5_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VDRD-5 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vdrd6_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VDRD-6 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vdrd7_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VDRD-7 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vdrs1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VDRS-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vdrs2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VDRS-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vdrs3_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VDRS-3 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vdrs4_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VDRS-4 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vdus1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VDUS-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vdus2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VDUS-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vdus3_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VDUS-3 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vdus4_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VDUS-4 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_veen_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VEEN error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_veen2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VEEN-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_veen8_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VEEN-8 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_veen9_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VEEN-9 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vevi_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VEVI error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vfac1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VFAC-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vfac2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VFAC-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vfac3_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VFAC-3 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vfac4_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VFAC-4 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vfav1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VFAV-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vfav2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VFAV-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vfav3_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VFAV-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vfav4_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VFAV-4 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vfav5_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VFAV-5 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vffd4_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VFFD-4 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vffd7_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VFFD-7 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vgcc1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VGCC-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vgcc3_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VGCC-3 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vgcc5_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VGCC-5 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vgcc6_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VGCC-6 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vgcc8_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VGCC-8 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vgcp1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VGCP-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vgcp2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VGCP-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vgcp3_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VGCP-3 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vggc1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VGGC-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vggc2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VGGC-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vggc3_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VGGC-3 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vgmc_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VGMC error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vhay_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VHAY error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vhpr1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VHPR-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vhpr2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VHPR-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vhpr3_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VHPR-3 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vhrc1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VHRC-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vhrc2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VHRC-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vjar_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VJAR error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vjaw_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VJAW error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vjrv_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VJRV error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vkcn1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VKCN-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vkcn2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VKCN-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vlel1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VLEL-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vlel2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VLEL-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vlel3_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VLEL-3 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vmfn_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VMFN error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vmfn2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VMFN-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vmrc2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VMRC-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vmss1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VMSS-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vmss2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VMSS-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vmss3_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VMSS-3 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_voit1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VOIT-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_voit2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VOIT-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_voit3_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VOIT-3 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vomb1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VOMB-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vomb2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VOMB-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vpca1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VPCA-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vpca2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VPCA-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vpca3_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VPCA-3 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vpca4_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VPCA-4 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vpca5_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VPCA-5 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vpir1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VPIR-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vpir3_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VPIR-3 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vqmc1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VQMC-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vqmc2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VQMC-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vqmc3_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VQMC-3 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vqmc4_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VQMC-4 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vqmc5_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VQMC-5 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vqui_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VQUI error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vred_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VRED error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vreg_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VREG error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vrfa_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VRFA error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vrle1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VRLE-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vrle2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VRLE-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vrlv1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VRLV-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vrlv2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VRLV-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vtat1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VTAT-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vtat2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VTAT-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vtcg3_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VTCG-3 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vtcg4_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VTCG-4 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vtct_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VTCT error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vtug1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VTUG-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vtug2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VTUG-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vuar1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VUAR-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vuar2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VUAR-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vuar4_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VUAR-4 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vucr_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VUCR error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vuex1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VUEX-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vuex2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VUEX-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vuno3_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VUNO-3 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vuno5_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VUNO-5 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vuot1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VUOT-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vuot3_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VUOT-3 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vuot4_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VUOT-4 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vuta2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VUTA-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vvok1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VVOK-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vvok2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VVOK-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vwab_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VWAB error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vwbe_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VWBE error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vwce_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VWCE error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vweq_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VWEQ error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vwma1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VWMA-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vwma2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VWMA-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vwmq_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VWMQ error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vwst1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VWST-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vwst2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VWST-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_vxrt_error (a_class: ET_CLASS): BOOLEAN
			-- Can a VXRT error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvagp_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVAGP error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvhpr5_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVHPR-5 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvhso1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVHSO-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvhso2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVHSO-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvkbs_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVKBS error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvkbu1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVKBU-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvkfe1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVKFE-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvkfe2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVKFE-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvkfe3_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVKFE-3 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvkfe4_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVKFE-4 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvkfe5_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVKFE-5 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvkfe6_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVKFE-6 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvscn1_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVSCN-1 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvtcg5_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVTCG-5 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvuaa_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVUAA error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvuac_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVUAC error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvual_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVUAL error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvuao_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVUAO error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvuia_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVUIA error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvuic_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVUIC error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvuil_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVUIL error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvuio_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVUIO error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

	reportable_gvwmc2_error (a_class: ET_CLASS): BOOLEAN
			-- Can a GVWMC-2 error be reported when it
			-- appears in `a_class'?
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		do
			Result := True
		end

feature -- Internal errors

	report_internal_error (an_error: ET_INTERNAL_ERROR)
			-- Report internal error.
		require
			an_error_not_void: an_error /= Void
		do
			mutex.lock
			report_error (an_error)
			set_has_internal_error (True)
			if attached {KL_STDERR_FILE} error_file then
				error_file.put_line ("----")
			end
			mutex.unlock
		end

	report_giaaa_error
			-- Report GIAAA internal error.
		local
			an_error: ET_INTERNAL_ERROR
		do
			create an_error.make_giaaa
			report_internal_error (an_error)
		end

feature -- Reporting

	report_error_message (an_error: STRING)
			-- Report `an_error'.
		do
			mutex.lock
			precursor (an_error)
			set_has_error (True)
			mutex.unlock
		end

feature {NONE} -- Concurrency

	mutex: MUTEX
			-- Mutex to report errors in a multi-threaded environment

invariant

	has_eiffel_error: has_eiffel_error implies has_error
	has_internal_error: has_internal_error implies has_error
	not_has_eiffel_error: not has_error implies not has_eiffel_error
	not_has_internal_error: not has_error implies not has_internal_error
	mutex_not_void: mutex /= Void

end
