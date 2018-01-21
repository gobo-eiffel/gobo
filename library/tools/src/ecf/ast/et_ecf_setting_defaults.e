note

	description:

		"ECF setting default values"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_SETTING_DEFAULTS

inherit

	ANY

	UT_SHARED_ECF_VERSIONS
		export {NONE} all end

feature -- Access

	default_settings (a_ecf_version: UT_VERSION): ET_ECF_SETTINGS
			-- Default setting values for ECF version `a_ecf_version'
		require
			a_ecf_version_not_void: a_ecf_version /= Void
		do
			Result := default_settings_1_0_0
		ensure
			default_settings_not_void: Result /= Void
		end

	default_settings_1_0_0: ET_ECF_SETTINGS
			-- Default setting values for ECF 1.0.0 and above
		once
			create Result.make
			set_default_settings_1_0_0 (Result)
		ensure
			default_settings_1_0_0_not_void: Result /= Void
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
			a_settings.set_primary_value ({ET_ECF_SETTING_NAMES}.dead_code_removal_setting_name, {ET_ECF_SETTING_NAMES}.true_setting_value)
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
			a_settings.set_primary_value ({ET_ECF_SETTING_NAMES}.msil_generation_setting_name, {ET_ECF_SETTING_NAMES}.false_setting_value)
			a_settings.set_primary_value ({ET_ECF_SETTING_NAMES}.msil_generation_type_setting_name, {ET_ECF_SETTING_NAMES}.exe_setting_value)
			a_settings.set_primary_value ({ET_ECF_SETTING_NAMES}.msil_use_optimized_precompile_setting_name, {ET_ECF_SETTING_NAMES}.false_setting_value)
			a_settings.set_primary_value ({ET_ECF_SETTING_NAMES}.old_feature_replication_setting_name, {ET_ECF_SETTING_NAMES}.false_setting_value)
			a_settings.set_primary_value ({ET_ECF_SETTING_NAMES}.old_verbatim_strings_setting_name, {ET_ECF_SETTING_NAMES}.false_setting_value)
			a_settings.set_primary_value ({ET_ECF_SETTING_NAMES}.total_order_on_reals_setting_name, {ET_ECF_SETTING_NAMES}.false_setting_value)
			a_settings.set_primary_value ({ET_ECF_SETTING_NAMES}.use_all_cluster_name_as_namespace_setting_name, {ET_ECF_SETTING_NAMES}.true_setting_value)
			a_settings.set_primary_value ({ET_ECF_SETTING_NAMES}.use_cluster_name_as_namespace_setting_name, {ET_ECF_SETTING_NAMES}.true_setting_value)
		end

	set_default_settings_1_0_0 (a_settings: ET_ECF_SETTINGS)
			-- Set in `a_settings' the default values for ECF 1.0.0 and above.
		require
			a_settings_not_void: a_settings /= Void
		do
			set_default_settings_latest (a_settings)
		end

end
