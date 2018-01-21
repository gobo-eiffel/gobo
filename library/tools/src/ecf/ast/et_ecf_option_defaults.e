note

	description:

		"ECF option default values"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_OPTION_DEFAULTS

inherit

	ANY

	UT_SHARED_ECF_VERSIONS
		export {NONE} all end

feature -- Access

	default_options (a_ecf_version: UT_VERSION): ET_ECF_OPTIONS
			-- Default option values for ECF version `a_ecf_version'
		require
			a_ecf_version_not_void: a_ecf_version /= Void
		do
			if a_ecf_version >= ecf_1_15_0 then
				Result := default_options_1_15_0
			elseif a_ecf_version >= ecf_1_11_0 then
				Result := default_options_1_11_0
			elseif a_ecf_version >= ecf_1_9_0 then
				Result := default_options_1_9_0
			elseif a_ecf_version >= ecf_1_5_0 then
				Result := default_options_1_5_0
			else
				Result := default_options_1_0_0
			end
		ensure
			default_options_not_void: Result /= Void
		end

	default_options_1_15_0: ET_ECF_OPTIONS
			-- Default option values for ECF 1.15.0 and above
		once
			create Result.make
			set_default_options_1_15_0 (Result)
		ensure
			default_options_1_15_0_not_void: Result /= Void
		end

	default_options_1_11_0: ET_ECF_OPTIONS
			-- Default option values for ECF 1.11.0 and above
		once
			create Result.make
			set_default_options_1_11_0 (Result)
		ensure
			default_options_1_11_0_not_void: Result /= Void
		end

	default_options_1_9_0: ET_ECF_OPTIONS
			-- Default option values for ECF 1.9.0 and above
		once
			create Result.make
			set_default_options_1_9_0 (Result)
		ensure
			default_options_1_9_0_not_void: Result /= Void
		end

	default_options_1_5_0: ET_ECF_OPTIONS
			-- Default option values for ECF 1.5.0 and above
		once
			create Result.make
			set_default_options_1_5_0 (Result)
		ensure
			default_options_1_5_0_not_void: Result /= Void
		end

	default_options_1_0_0: ET_ECF_OPTIONS
			-- Default option values for ECF 1.0.0 and above
		once
			create Result.make
			set_default_options_1_0_0 (Result)
		ensure
			default_options_1_0_0_not_void: Result /= Void
		end

feature -- Setting

	set_default_options_latest (a_options: ET_ECF_OPTIONS)
			-- Set in `a_options' the default values for the latest version of ECF.
		require
			a_options_not_void: a_options /= Void
		do
			a_options.set_primary_value ({ET_ECF_OPTION_NAMES}.debug_option_name, {ET_ECF_OPTION_NAMES}.false_option_value)
			a_options.set_primary_value ({ET_ECF_OPTION_NAMES}.full_class_checking_option_name, {ET_ECF_OPTION_NAMES}.true_option_value)
			a_options.set_primary_value ({ET_ECF_OPTION_NAMES}.is_attached_by_default_option_name, {ET_ECF_OPTION_NAMES}.true_option_value)
			a_options.set_primary_value ({ET_ECF_OPTION_NAMES}.is_obsolete_routine_type_option_name, {ET_ECF_OPTION_NAMES}.false_option_value)
			a_options.set_primary_value ({ET_ECF_OPTION_NAMES}.msil_application_optimize_option_name, {ET_ECF_OPTION_NAMES}.false_option_value)
			a_options.set_primary_value ({ET_ECF_OPTION_NAMES}.optimize_option_name, {ET_ECF_OPTION_NAMES}.false_option_value)
			a_options.set_primary_value ({ET_ECF_OPTION_NAMES}.profile_option_name, {ET_ECF_OPTION_NAMES}.false_option_value)
			a_options.set_primary_value ({ET_ECF_OPTION_NAMES}.syntax_option_name, {ET_ECF_OPTION_NAMES}.standard_option_value)
			a_options.set_primary_value ({ET_ECF_OPTION_NAMES}.trace_option_name, {ET_ECF_OPTION_NAMES}.false_option_value)
			a_options.set_primary_value ({ET_ECF_OPTION_NAMES}.warning_option_name, {ET_ECF_OPTION_NAMES}.false_option_value)
			a_options.set_primary_assertion_value ({ET_ECF_OPTION_NAMES}.assertions_check_option_name, {ET_ECF_OPTION_NAMES}.false_option_value)
			a_options.set_primary_assertion_value ({ET_ECF_OPTION_NAMES}.assertions_invariant_option_name, {ET_ECF_OPTION_NAMES}.false_option_value)
			a_options.set_primary_assertion_value ({ET_ECF_OPTION_NAMES}.assertions_loop_option_name, {ET_ECF_OPTION_NAMES}.false_option_value)
			a_options.set_primary_assertion_value ({ET_ECF_OPTION_NAMES}.assertions_postcondition_option_name, {ET_ECF_OPTION_NAMES}.false_option_value)
			a_options.set_primary_assertion_value ({ET_ECF_OPTION_NAMES}.assertions_precondition_option_name, {ET_ECF_OPTION_NAMES}.false_option_value)
			a_options.set_primary_assertion_value ({ET_ECF_OPTION_NAMES}.assertions_supplier_precondition_option_name, {ET_ECF_OPTION_NAMES}.false_option_value)
			a_options.set_primary_warning_value ({ET_ECF_OPTION_NAMES}.warning_export_class_missing_option_name, {ET_ECF_OPTION_NAMES}.true_option_value)
			a_options.set_primary_warning_value ({ET_ECF_OPTION_NAMES}.warning_manifest_array_type_name, {ET_ECF_OPTION_NAMES}.true_option_value)
			a_options.set_primary_warning_value ({ET_ECF_OPTION_NAMES}.warning_obsolete_class_option_name, {ET_ECF_OPTION_NAMES}.true_option_value)
			a_options.set_primary_warning_value ({ET_ECF_OPTION_NAMES}.warning_obsolete_feature_option_name, {ET_ECF_OPTION_NAMES}.true_option_value)
			a_options.set_primary_warning_value ({ET_ECF_OPTION_NAMES}.warning_old_verbatim_strings_option_name, {ET_ECF_OPTION_NAMES}.true_option_value)
			a_options.set_primary_warning_value ({ET_ECF_OPTION_NAMES}.warning_once_in_generic_option_name, {ET_ECF_OPTION_NAMES}.true_option_value)
			a_options.set_primary_warning_value ({ET_ECF_OPTION_NAMES}.warning_option_unknown_class_option_name, {ET_ECF_OPTION_NAMES}.true_option_value)
			a_options.set_primary_warning_value ({ET_ECF_OPTION_NAMES}.warning_renaming_unknown_class_option_name, {ET_ECF_OPTION_NAMES}.true_option_value)
			a_options.set_primary_warning_value ({ET_ECF_OPTION_NAMES}.warning_same_uuid_option_name, {ET_ECF_OPTION_NAMES}.true_option_value)
			a_options.set_primary_warning_value ({ET_ECF_OPTION_NAMES}.warning_syntax_option_name, {ET_ECF_OPTION_NAMES}.true_option_value)
			a_options.set_primary_warning_value ({ET_ECF_OPTION_NAMES}.warning_unused_local_option_name, {ET_ECF_OPTION_NAMES}.true_option_value)
			a_options.set_primary_warning_value ({ET_ECF_OPTION_NAMES}.warning_vjrv_option_name, {ET_ECF_OPTION_NAMES}.true_option_value)
			a_options.set_primary_warning_value ({ET_ECF_OPTION_NAMES}.warning_vwab_option_name, {ET_ECF_OPTION_NAMES}.true_option_value)
			a_options.set_primary_warning_value ({ET_ECF_OPTION_NAMES}.warning_vweq_option_name, {ET_ECF_OPTION_NAMES}.true_option_value)
		end

	set_default_options_1_15_0 (a_options: ET_ECF_OPTIONS)
			-- Set in `a_options' the default values for ECF 1.15.0 and above.
		require
			a_options_not_void: a_options /= Void
		do
			set_default_options_latest (a_options)
		end

	set_default_options_1_11_0 (a_options: ET_ECF_OPTIONS)
			-- Set in `a_options' the default values for ECF 1.11.0 and above.
		require
			a_options_not_void: a_options /= Void
		do
			set_default_options_1_15_0 (a_options)
			a_options.set_primary_value ({ET_ECF_OPTION_NAMES}.is_obsolete_routine_type_option_name, {ET_ECF_OPTION_NAMES}.true_option_value)
		end

	set_default_options_1_9_0 (a_options: ET_ECF_OPTIONS)
			-- Set in `a_options' the default values for ECF 1.9.0 and above.
		require
			a_options_not_void: a_options /= Void
		do
			set_default_options_1_11_0 (a_options)
			a_options.set_primary_value ({ET_ECF_OPTION_NAMES}.full_class_checking_option_name, {ET_ECF_OPTION_NAMES}.false_option_value)
		end

	set_default_options_1_5_0 (a_options: ET_ECF_OPTIONS)
			-- Set in `a_options' the default values for ECF 1.5.0 and above.
		require
			a_options_not_void: a_options /= Void
		do
			set_default_options_1_9_0 (a_options)
			a_options.set_primary_value ({ET_ECF_OPTION_NAMES}.is_attached_by_default_option_name, {ET_ECF_OPTION_NAMES}.false_option_value)
			a_options.set_primary_value ({ET_ECF_OPTION_NAMES}.syntax_option_name, {ET_ECF_OPTION_NAMES}.transitional_option_value)
		end

	set_default_options_1_0_0 (a_options: ET_ECF_OPTIONS)
			-- Set in `a_options' the default values for ECF 1.0.0 and above.
		require
			a_options_not_void: a_options /= Void
		do
			set_default_options_1_5_0 (a_options)
			a_options.set_primary_value ({ET_ECF_OPTION_NAMES}.syntax_option_name, {ET_ECF_OPTION_NAMES}.obsolete_option_value)
		end

end
