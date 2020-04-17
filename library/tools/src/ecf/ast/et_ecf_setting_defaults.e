note

	description:

		"ECF setting default values"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2018-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_SETTING_DEFAULTS

inherit

	ANY

	UT_SHARED_ECF_VERSIONS
		export {NONE} all end

	KL_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

feature -- Access

	default_settings (a_ecf_version: UT_VERSION): ET_ECF_SETTINGS
			-- Default setting values for ECF version `a_ecf_version'
		require
			a_ecf_version_not_void: a_ecf_version /= Void
		do
			if a_ecf_version >= ecf_1_20_0 then
				Result := default_settings_1_20_0
			else
				Result := default_settings_1_0_0
			end
		ensure
			instance_free: class
			default_settings_not_void: Result /= Void
		end

	default_settings_1_20_0: ET_ECF_SETTINGS
			-- Default setting values for ECF 1.20.0 and above
		once
			create Result.make
			set_default_settings_1_20_0 (Result)
		ensure
			instance_free: class
			default_settings_1_20_0_not_void: Result /= Void
		end

	default_settings_1_0_0: ET_ECF_SETTINGS
			-- Default setting values for ECF 1.0.0 and above
		once
			create Result.make
			set_default_settings_1_0_0 (Result)
		ensure
			instance_free: class
			default_settings_1_0_0_not_void: Result /= Void
		end

	valid_settings (a_ecf_version: UT_VERSION): DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid setting values for ECF version `a_ecf_version'
			--
			-- A void regexp means that there is no constraint on the setting value.
		require
			a_ecf_version_not_void: a_ecf_version /= Void
		do
			if a_ecf_version >= ecf_1_20_0 then
				Result := valid_settings_1_20_0
			elseif a_ecf_version >= ecf_1_18_0 then
				Result := valid_settings_1_18_0
			elseif a_ecf_version >= ecf_1_17_0 then
				Result := valid_settings_1_17_0
			elseif a_ecf_version >= ecf_1_16_0 then
				Result := valid_settings_1_16_0
			elseif a_ecf_version >= ecf_1_11_0 then
				Result := valid_settings_1_11_0
			elseif a_ecf_version >= ecf_1_7_0 then
				Result := valid_settings_1_7_0
			elseif a_ecf_version >= ecf_1_6_0 then
				Result := valid_settings_1_6_0
			elseif a_ecf_version >= ecf_1_4_0 then
				Result := valid_settings_1_4_0
			elseif a_ecf_version >= ecf_1_2_0 then
				Result := valid_settings_1_2_0
			else
				Result := valid_settings_1_0_0
			end
		ensure
			instance_free: class
			valid_settings_not_void: Result /= Void
			no_void_setting_name: not Result.has_void
		end

	valid_settings_latest: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid setting values for the latest version of ECF
			--
			-- A void regexp means that there is no constraint on the setting value.
		local
			l_hash_function: KL_AGENT_HASH_FUNCTION [STRING]
		once
			create Result.make_map (50)
			Result.set_key_equality_tester (case_insensitive_string_equality_tester)
			create l_hash_function.make (agent STRING_.case_insensitive_hash_code ({STRING} ?))
			Result.set_hash_function (l_hash_function)
			Result.force_last (boolean_setting_value_regexp, {ET_ECF_SETTING_NAMES}.absent_explicit_assertion_setting_name)
			Result.force_last (boolean_setting_value_regexp, {ET_ECF_SETTING_NAMES}.address_expression_setting_name)
			Result.force_last (boolean_setting_value_regexp, {ET_ECF_SETTING_NAMES}.array_optimization_setting_name)
			Result.force_last (boolean_setting_value_regexp, {ET_ECF_SETTING_NAMES}.automatic_backup_setting_name)
			Result.force_last (boolean_setting_value_regexp, {ET_ECF_SETTING_NAMES}.check_for_void_target_setting_name)
			Result.force_last (boolean_setting_value_regexp, {ET_ECF_SETTING_NAMES}.check_generic_creation_constraint_setting_name)
			Result.force_last (boolean_setting_value_regexp, {ET_ECF_SETTING_NAMES}.check_vape_setting_name)
			Result.force_last (boolean_setting_value_regexp, {ET_ECF_SETTING_NAMES}.cls_compliant_setting_name)
			Result.force_last (boolean_setting_value_regexp, {ET_ECF_SETTING_NAMES}.console_application_setting_name)
			Result.force_last (dead_code_removal_setting_value_regexp, {ET_ECF_SETTING_NAMES}.dead_code_removal_setting_name)
			Result.force_last (boolean_setting_value_regexp, {ET_ECF_SETTING_NAMES}.dotnet_naming_convention_setting_name)
			Result.force_last (boolean_setting_value_regexp, {ET_ECF_SETTING_NAMES}.dynamic_runtime_setting_name)
			Result.force_last (boolean_setting_value_regexp, {ET_ECF_SETTING_NAMES}.enforce_unique_class_names_setting_name)
			Result.force_last (boolean_setting_value_regexp, {ET_ECF_SETTING_NAMES}.exception_trace_setting_name)
			Result.force_last (Void, {ET_ECF_SETTING_NAMES}.executable_name_setting_name)
			Result.force_last (Void, {ET_ECF_SETTING_NAMES}.external_runtime_setting_name)
			Result.force_last (boolean_setting_value_regexp, {ET_ECF_SETTING_NAMES}.force_32bits_setting_name)
			Result.force_last (boolean_setting_value_regexp, {ET_ECF_SETTING_NAMES}.il_verifiable_setting_name)
			Result.force_last (boolean_setting_value_regexp, {ET_ECF_SETTING_NAMES}.inlining_setting_name)
			Result.force_last (inline_size_setting_value_regexp, {ET_ECF_SETTING_NAMES}.inlining_size_setting_name)
			Result.force_last (boolean_setting_value_regexp, {ET_ECF_SETTING_NAMES}.java_generation_setting_name)
			Result.force_last (Void, {ET_ECF_SETTING_NAMES}.library_root_setting_name)
			Result.force_last (boolean_setting_value_regexp, {ET_ECF_SETTING_NAMES}.line_generation_setting_name)
			Result.force_last (manifest_array_type_setting_value_regexp, {ET_ECF_SETTING_NAMES}.manifest_array_type_setting_name)
			Result.force_last (Void, {ET_ECF_SETTING_NAMES}.metadata_cache_path_setting_name)
			Result.force_last (msil_classes_per_module_setting_value_regexp, {ET_ECF_SETTING_NAMES}.msil_classes_per_module_setting_name)
			Result.force_last (Void, {ET_ECF_SETTING_NAMES}.msil_clr_version_setting_name)
			Result.force_last (Void, {ET_ECF_SETTING_NAMES}.msil_culture_setting_name)
			Result.force_last (boolean_setting_value_regexp, {ET_ECF_SETTING_NAMES}.msil_generation_setting_name)
			Result.force_last (msil_generation_type_setting_value_regexp, {ET_ECF_SETTING_NAMES}.msil_generation_type_setting_name)
			Result.force_last (Void, {ET_ECF_SETTING_NAMES}.msil_key_file_name_setting_name)
			Result.force_last (boolean_setting_value_regexp, {ET_ECF_SETTING_NAMES}.msil_use_optimized_precompile_setting_name)
			Result.force_last (boolean_setting_value_regexp, {ET_ECF_SETTING_NAMES}.old_feature_replication_setting_name)
			Result.force_last (boolean_setting_value_regexp, {ET_ECF_SETTING_NAMES}.old_verbatim_strings_setting_name)
			Result.force_last (platform_setting_value_regexp, {ET_ECF_SETTING_NAMES}.platform_setting_name)
			Result.force_last (Void, {ET_ECF_SETTING_NAMES}.shared_library_definition_setting_name)
			Result.force_last (boolean_setting_value_regexp, {ET_ECF_SETTING_NAMES}.total_order_on_reals_setting_name)
			Result.force_last (boolean_setting_value_regexp, {ET_ECF_SETTING_NAMES}.use_all_cluster_name_as_namespace_setting_name)
			Result.force_last (boolean_setting_value_regexp, {ET_ECF_SETTING_NAMES}.use_cluster_name_as_namespace_setting_name)
		ensure
			instance_free: class
			valid_settings_latest_not_void: Result /= Void
			no_void_setting_name: not Result.has_void
		end

	valid_settings_1_20_0: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid setting values for ECF 1.20.0 and above
			--
			-- A void regexp means that there is no constraint on the setting value.
		once
			Result := valid_settings_latest
		ensure
			instance_free: class
			valid_settings_1_20_0_not_void: Result /= Void
			no_void_setting_name: not Result.has_void
		end

	valid_settings_1_18_0: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid setting values for ECF 1.18.0 and above
			--
			-- A void regexp means that there is no constraint on the setting value.
		once
			Result := valid_settings_1_20_0.twin
			Result.force_last (boolean_setting_value_regexp, {ET_ECF_SETTING_NAMES}.dead_code_removal_setting_name)
		ensure
			instance_free: class
			valid_settings_1_18_0_not_void: Result /= Void
			no_void_setting_name: not Result.has_void
		end

	valid_settings_1_17_0: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid setting values for ECF 1.17.0 and above
			--
			-- A void regexp means that there is no constraint on the setting value.
		once
			Result := valid_settings_1_18_0.twin
			Result.remove ({ET_ECF_SETTING_NAMES}.manifest_array_type_setting_name)
			Result.force_last (Void, {ET_ECF_SETTING_NAMES}.msil_assembly_compatibility_setting_name)
		ensure
			instance_free: class
			valid_settings_1_17_0_not_void: Result /= Void
			no_void_setting_name: not Result.has_void
		end

	valid_settings_1_16_0: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid setting values for ECF 1.16.0 and above
			--
			-- A void regexp means that there is no constraint on the setting value.
		once
			Result := valid_settings_1_17_0.twin
			Result.remove ({ET_ECF_SETTING_NAMES}.absent_explicit_assertion_setting_name)
		ensure
			instance_free: class
			valid_settings_1_16_0_not_void: Result /= Void
			no_void_setting_name: not Result.has_void
		end

	valid_settings_1_11_0: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid setting values for ECF 1.11.0 and above
			--
			-- A void regexp means that there is no constraint on the setting value.
		once
			Result := valid_settings_1_16_0.twin
			Result.force_last (concurrency_setting_value_regexp, {ET_ECF_SETTING_NAMES}.concurrency_setting_name)
		ensure
			instance_free: class
			valid_settings_1_11_0_not_void: Result /= Void
			no_void_setting_name: not Result.has_void
		end

	valid_settings_1_7_0: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid setting values for ECF 1.7.0 and above
			--
			-- A void regexp means that there is no constraint on the setting value.
		once
			Result := valid_settings_1_11_0.twin
			Result.remove ({ET_ECF_SETTING_NAMES}.check_for_void_target_setting_name)
		ensure
			instance_free: class
			valid_settings_1_7_0_not_void: Result /= Void
			no_void_setting_name: not Result.has_void
		end

	valid_settings_1_6_0: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid setting values for ECF 1.6.0 and above
			--
			-- A void regexp means that there is no constraint on the setting value.
		once
			Result := valid_settings_1_7_0.twin
			Result.remove ({ET_ECF_SETTING_NAMES}.concurrency_setting_name)
			Result.force_last (boolean_setting_value_regexp, {ET_ECF_SETTING_NAMES}.multithreaded_setting_name)
		ensure
			instance_free: class
			valid_settings_1_16_0_not_void: Result /= Void
			no_void_setting_name: not Result.has_void
		end

	valid_settings_1_4_0: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid setting values for ECF 1.4.0 and above
			--
			-- A void regexp means that there is no constraint on the setting value.
		once
			Result := valid_settings_1_6_0.twin
			Result.remove ({ET_ECF_SETTING_NAMES}.total_order_on_reals_setting_name)
		ensure
			instance_free: class
			valid_settings_1_4_0_not_void: Result /= Void
			no_void_setting_name: not Result.has_void
		end

	valid_settings_1_2_0: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid setting values for ECF 1.2.0 and above
			--
			-- A void regexp means that there is no constraint on the setting value.
		once
			Result := valid_settings_1_4_0.twin
			Result.remove ({ET_ECF_SETTING_NAMES}.old_feature_replication_setting_name)
		ensure
			instance_free: class
			valid_settings_1_2_0_not_void: Result /= Void
			no_void_setting_name: not Result.has_void
		end

	valid_settings_1_0_0: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid setting values for ECF 1.0.0 and above
			--
			-- A void regexp means that there is no constraint on the setting value.
		once
			Result := valid_settings_1_2_0.twin
			Result.force_last (boolean_setting_value_regexp, {ET_ECF_SETTING_NAMES}.full_type_checking_setting_name)
		ensure
			instance_free: class
			valid_settings_1_0_0_not_void: Result /= Void
			no_void_setting_name: not Result.has_void
		end

feature -- Setting

	set_default_settings_latest (a_settings: ET_ECF_SETTINGS)
			-- Set in `a_settings' the default values for the latest version of ECF.
		require
			a_settings_not_void: a_settings /= Void
		do
			a_settings.set_primary_value ({ET_ECF_SETTING_NAMES}.absent_explicit_assertion_setting_name, {ET_ECF_SETTING_NAMES}.false_setting_value)
			a_settings.set_primary_value ({ET_ECF_SETTING_NAMES}.address_expression_setting_name, {ET_ECF_SETTING_NAMES}.false_setting_value)
			a_settings.set_primary_value ({ET_ECF_SETTING_NAMES}.array_optimization_setting_name, {ET_ECF_SETTING_NAMES}.false_setting_value)
			a_settings.set_primary_value ({ET_ECF_SETTING_NAMES}.automatic_backup_setting_name, {ET_ECF_SETTING_NAMES}.false_setting_value)
			a_settings.set_primary_value ({ET_ECF_SETTING_NAMES}.check_for_void_target_setting_name, {ET_ECF_SETTING_NAMES}.true_setting_value)
			a_settings.set_primary_value ({ET_ECF_SETTING_NAMES}.check_generic_creation_constraint_setting_name, {ET_ECF_SETTING_NAMES}.true_setting_value)
			a_settings.set_primary_value ({ET_ECF_SETTING_NAMES}.check_vape_setting_name, {ET_ECF_SETTING_NAMES}.true_setting_value)
			a_settings.set_primary_value ({ET_ECF_SETTING_NAMES}.cls_compliant_setting_name, {ET_ECF_SETTING_NAMES}.true_setting_value)
			a_settings.set_primary_value ({ET_ECF_SETTING_NAMES}.console_application_setting_name, {ET_ECF_SETTING_NAMES}.false_setting_value)
			a_settings.set_primary_value ({ET_ECF_SETTING_NAMES}.dead_code_removal_setting_name, {ET_ECF_SETTING_NAMES}.all_setting_value)
			a_settings.set_primary_value ({ET_ECF_SETTING_NAMES}.dotnet_naming_convention_setting_name, {ET_ECF_SETTING_NAMES}.false_setting_value)
			a_settings.set_primary_value ({ET_ECF_SETTING_NAMES}.dynamic_runtime_setting_name, {ET_ECF_SETTING_NAMES}.false_setting_value)
			a_settings.set_primary_value ({ET_ECF_SETTING_NAMES}.enforce_unique_class_names_setting_name, {ET_ECF_SETTING_NAMES}.false_setting_value)
			a_settings.set_primary_value ({ET_ECF_SETTING_NAMES}.exception_trace_setting_name, {ET_ECF_SETTING_NAMES}.false_setting_value)
			a_settings.set_primary_value ({ET_ECF_SETTING_NAMES}.force_32bits_setting_name, {ET_ECF_SETTING_NAMES}.false_setting_value)
			a_settings.set_primary_value ({ET_ECF_SETTING_NAMES}.il_verifiable_setting_name, {ET_ECF_SETTING_NAMES}.true_setting_value)
			a_settings.set_primary_value ({ET_ECF_SETTING_NAMES}.inlining_setting_name, {ET_ECF_SETTING_NAMES}.true_setting_value)
			a_settings.set_primary_value ({ET_ECF_SETTING_NAMES}.inlining_size_setting_name, "4")
			a_settings.set_primary_value ({ET_ECF_SETTING_NAMES}.java_generation_setting_name, {ET_ECF_SETTING_NAMES}.false_setting_value)
			a_settings.set_primary_value ({ET_ECF_SETTING_NAMES}.line_generation_setting_name, {ET_ECF_SETTING_NAMES}.false_setting_value)
			a_settings.set_primary_value ({ET_ECF_SETTING_NAMES}.manifest_array_type_setting_name, {ET_ECF_SETTING_NAMES}.default_setting_value)
			a_settings.set_primary_value ({ET_ECF_SETTING_NAMES}.msil_generation_setting_name, {ET_ECF_SETTING_NAMES}.false_setting_value)
			a_settings.set_primary_value ({ET_ECF_SETTING_NAMES}.msil_generation_type_setting_name, {ET_ECF_SETTING_NAMES}.exe_setting_value)
			a_settings.set_primary_value ({ET_ECF_SETTING_NAMES}.msil_use_optimized_precompile_setting_name, {ET_ECF_SETTING_NAMES}.false_setting_value)
			a_settings.set_primary_value ({ET_ECF_SETTING_NAMES}.old_feature_replication_setting_name, {ET_ECF_SETTING_NAMES}.false_setting_value)
			a_settings.set_primary_value ({ET_ECF_SETTING_NAMES}.old_verbatim_strings_setting_name, {ET_ECF_SETTING_NAMES}.false_setting_value)
			a_settings.set_primary_value ({ET_ECF_SETTING_NAMES}.total_order_on_reals_setting_name, {ET_ECF_SETTING_NAMES}.true_setting_value)
			a_settings.set_primary_value ({ET_ECF_SETTING_NAMES}.use_all_cluster_name_as_namespace_setting_name, {ET_ECF_SETTING_NAMES}.true_setting_value)
			a_settings.set_primary_value ({ET_ECF_SETTING_NAMES}.use_cluster_name_as_namespace_setting_name, {ET_ECF_SETTING_NAMES}.true_setting_value)
		ensure
			instance_free: class
		end

	set_default_settings_1_20_0 (a_settings: ET_ECF_SETTINGS)
			-- Set in `a_settings' the default values for ECF 1.20.0 and above.
		require
			a_settings_not_void: a_settings /= Void
		do
			set_default_settings_latest (a_settings)
		ensure
			instance_free: class
		end

	set_default_settings_1_0_0 (a_settings: ET_ECF_SETTINGS)
			-- Set in `a_settings' the default values for ECF 1.0.0 and above.
		require
			a_settings_not_void: a_settings /= Void
		do
			set_default_settings_1_20_0 (a_settings)
			a_settings.set_primary_value ({ET_ECF_SETTING_NAMES}.dead_code_removal_setting_name, {ET_ECF_SETTING_NAMES}.true_setting_value)
			a_settings.set_primary_value ({ET_ECF_SETTING_NAMES}.total_order_on_reals_setting_name, {ET_ECF_SETTING_NAMES}.false_setting_value)
		ensure
			instance_free: class
		end

feature {NONE} -- Implementation

	boolean_setting_value_regexp: RX_REGULAR_EXPRESSION
			-- Regular expression for validation of boolean setting values
		once
			create {RX_PCRE_REGULAR_EXPRESSION} Result.make
			Result.compile ("(?i)(" + {ET_ECF_SETTING_NAMES}.true_setting_value + "|" + {ET_ECF_SETTING_NAMES}.true_setting_value + ")")
		ensure
			instance_free: class
			boolean_setting_value_regexp_not_void: Result /= Void
			boolean_setting_value_regexp_compiled: Result.is_compiled
		end

	concurrency_setting_value_regexp: RX_REGULAR_EXPRESSION
			-- Regular expression for validation of "concurrency" setting values
		once
			create {RX_PCRE_REGULAR_EXPRESSION} Result.make
			Result.compile ("(?i)(" + {ET_ECF_SETTING_NAMES}.none_setting_value + "|" + {ET_ECF_SETTING_NAMES}.thread_setting_value + "|" + {ET_ECF_SETTING_NAMES}.scoop_setting_value + ")")
		ensure
			instance_free: class
			concurrency_setting_value_regexp_not_void: Result /= Void
			concurrency_setting_value_regexp_compiled: Result.is_compiled
		end

	dead_code_removal_setting_value_regexp: RX_REGULAR_EXPRESSION
			-- Regular expression for validation of "dead_code_removal" setting values
		once
			create {RX_PCRE_REGULAR_EXPRESSION} Result.make
			Result.compile ("(?i)(" + {ET_ECF_SETTING_NAMES}.none_setting_value + "|" + {ET_ECF_SETTING_NAMES}.feature_setting_value + "|" + {ET_ECF_SETTING_NAMES}.all_setting_value + ")")
		ensure
			instance_free: class
			dead_code_removal_setting_value_regexp_not_void: Result /= Void
			dead_code_removal_setting_value_regexp_compiled: Result.is_compiled
		end

	inline_size_setting_value_regexp: RX_REGULAR_EXPRESSION
			-- Regular expression for validation of "inline_size" setting values
		once
			create {RX_PCRE_REGULAR_EXPRESSION} Result.make
			Result.compile ("[0-9]|[1-9][0-9]|100")
		ensure
			instance_free: class
			inline_size_setting_value_regexp_not_void: Result /= Void
			inline_size_setting_value_regexp_compiled: Result.is_compiled
		end

	manifest_array_type_setting_value_regexp: RX_REGULAR_EXPRESSION
			-- Regular expression for validation of "manifest_array_type" setting values
		once
			create {RX_PCRE_REGULAR_EXPRESSION} Result.make
			Result.compile ("(?i)(" + {ET_ECF_SETTING_NAMES}.default_setting_value + "|" + {ET_ECF_SETTING_NAMES}.standard_setting_value + "|" + {ET_ECF_SETTING_NAMES}.mismatch_warning_setting_value + "|" + {ET_ECF_SETTING_NAMES}.mismatch_error_setting_value + ")")
		ensure
			instance_free: class
			manifest_array_type_setting_value_regexp_not_void: Result /= Void
			manifest_array_type_setting_value_regexp_compiled: Result.is_compiled
		end

	msil_classes_per_module_setting_value_regexp: RX_REGULAR_EXPRESSION
			-- Regular expression for validation of "msil_classes_per_module" setting values
		once
			create {RX_PCRE_REGULAR_EXPRESSION} Result.make
			Result.compile ("[1-9][0-9]*")
		ensure
			instance_free: class
			msil_classes_per_module_setting_value_regexp_not_void: Result /= Void
			msil_classes_per_module_setting_value_regexp_compiled: Result.is_compiled
		end

	msil_generation_type_setting_value_regexp: RX_REGULAR_EXPRESSION
			-- Regular expression for validation of "msil_generation_type" setting values
		once
			create {RX_PCRE_REGULAR_EXPRESSION} Result.make
			Result.compile ("(?i)(" + {ET_ECF_SETTING_NAMES}.exe_setting_value + "|" + {ET_ECF_SETTING_NAMES}.dll_setting_value + ")")
		ensure
			instance_free: class
			msil_generation_type_setting_value_regexp_not_void: Result /= Void
			msil_generation_type_setting_value_regexp_compiled: Result.is_compiled
		end

	platform_setting_value_regexp: RX_REGULAR_EXPRESSION
			-- Regular expression for validation of "platform" setting values
		once
			create {RX_PCRE_REGULAR_EXPRESSION} Result.make
			Result.compile ("(?i)(" + {ET_ECF_SETTING_NAMES}.windows_setting_value + "|" + {ET_ECF_SETTING_NAMES}.unix_setting_value + "|" + {ET_ECF_SETTING_NAMES}.macintosh_setting_value + "|" + {ET_ECF_SETTING_NAMES}.vxworks_setting_value + ")")
		ensure
			instance_free: class
			platform_setting_value_regexp_not_void: Result /= Void
			platform_setting_value_regexp_compiled: Result.is_compiled
		end

end
