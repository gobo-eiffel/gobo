note

	description:

		"ECF option default values"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2018-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_OPTION_DEFAULTS

inherit

	ANY

	UT_SHARED_ECF_VERSIONS
		export {NONE} all end

	KL_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

feature -- Access

	default_options (a_ecf_version: UT_VERSION): ET_ECF_OPTIONS
			-- Default option values for ECF version `a_ecf_version'
		require
			a_ecf_version_not_void: a_ecf_version /= Void
		do
			if a_ecf_version >= ecf_1_22_0 then
				Result := default_options_1_22_0
			elseif a_ecf_version >= ecf_1_21_0 then
				Result := default_options_1_21_0
			elseif a_ecf_version >= ecf_1_18_0 then
				Result := default_options_1_18_0
			elseif a_ecf_version >= ecf_1_15_0 then
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
			instance_free: class
			default_options_not_void: Result /= Void
		end

	default_options_1_22_0: ET_ECF_OPTIONS
			-- Default option values for ECF 1.22.0 and above
		once
			create Result.make
			set_default_options_1_22_0 (Result)
		ensure
			instance_free: class
			default_options_1_22_0_not_void: Result /= Void
		end

	default_options_1_21_0: ET_ECF_OPTIONS
			-- Default option values for ECF 1.21.0 and above
		once
			create Result.make
			set_default_options_1_21_0 (Result)
		ensure
			instance_free: class
			default_options_1_21_0_not_void: Result /= Void
		end

	default_options_1_18_0: ET_ECF_OPTIONS
			-- Default option values for ECF 1.18.0 and above
		once
			create Result.make
			set_default_options_1_18_0 (Result)
		ensure
			instance_free: class
			default_options_1_18_0_not_void: Result /= Void
		end

	default_options_1_15_0: ET_ECF_OPTIONS
			-- Default option values for ECF 1.15.0 and above
		once
			create Result.make
			set_default_options_1_15_0 (Result)
		ensure
			instance_free: class
			default_options_1_15_0_not_void: Result /= Void
		end

	default_options_1_11_0: ET_ECF_OPTIONS
			-- Default option values for ECF 1.11.0 and above
		once
			create Result.make
			set_default_options_1_11_0 (Result)
		ensure
			instance_free: class
			default_options_1_11_0_not_void: Result /= Void
		end

	default_options_1_9_0: ET_ECF_OPTIONS
			-- Default option values for ECF 1.9.0 and above
		once
			create Result.make
			set_default_options_1_9_0 (Result)
		ensure
			instance_free: class
			default_options_1_9_0_not_void: Result /= Void
		end

	default_options_1_5_0: ET_ECF_OPTIONS
			-- Default option values for ECF 1.5.0 and above
		once
			create Result.make
			set_default_options_1_5_0 (Result)
		ensure
			instance_free: class
			default_options_1_5_0_not_void: Result /= Void
		end

	default_options_1_0_0: ET_ECF_OPTIONS
			-- Default option values for ECF 1.0.0 and above
		once
			create Result.make
			set_default_options_1_0_0 (Result)
		ensure
			instance_free: class
			default_options_1_0_0_not_void: Result /= Void
		end

	valid_assertions (a_ecf_version: UT_VERSION): DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid assertion values for ECF version `a_ecf_version'
			--
			-- A void regexp means that there is no constraint on the assertion value.
		require
			a_ecf_version_not_void: a_ecf_version /= Void
		do
			if a_ecf_version >= ecf_1_2_0 then
				Result := valid_assertions_1_2_0
			else
				Result := valid_assertions_1_0_0
			end
		ensure
			instance_free: class
			valid_assertions_not_void: Result /= Void
			no_void_assertion_name: not Result.has_void
		end

	valid_assertions_latest: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid assertion values for the latest version of ECF
			--
			-- A void regexp means that there is no constraint on the assertion value.
		local
			l_hash_function: KL_AGENT_HASH_FUNCTION [STRING]
		once
			create Result.make_map (10)
			Result.set_key_equality_tester (case_insensitive_string_equality_tester)
			create l_hash_function.make (agent STRING_.case_insensitive_hash_code ({STRING} ?))
			Result.set_hash_function (l_hash_function)
			Result.force_last (boolean_option_value_regexp, {ET_ECF_OPTION_NAMES}.assertions_check_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_ECF_OPTION_NAMES}.assertions_invariant_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_ECF_OPTION_NAMES}.assertions_loop_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_ECF_OPTION_NAMES}.assertions_postcondition_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_ECF_OPTION_NAMES}.assertions_precondition_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_ECF_OPTION_NAMES}.assertions_supplier_precondition_option_name)
		ensure
			instance_free: class
			valid_assertions_latest_not_void: Result /= Void
			no_void_assertion_name: not Result.has_void
		end

	valid_assertions_1_2_0: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid assertion values for ECF 1.2.0 and above
			--
			-- A void regexp means that there is no constraint on the assertion value.
		once
			Result := valid_assertions_latest
		ensure
			instance_free: class
			valid_assertions_1_2_0_not_void: Result /= Void
			no_void_assertion_name: not Result.has_void
		end

	valid_assertions_1_0_0: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid assertion values for ECF 1.0.0 and above
			--
			-- A void regexp means that there is no constraint on the assertion value.
		once
			Result := valid_assertions_1_2_0.twin
			Result.remove ({ET_ECF_OPTION_NAMES}.assertions_supplier_precondition_option_name)
		ensure
			instance_free: class
			valid_assertions_1_0_0_not_void: Result /= Void
			no_void_assertion_name: not Result.has_void
		end

	valid_options (a_ecf_version: UT_VERSION): DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid option values for ECF version `a_ecf_version'
			--
			-- A void regexp means that there is no constraint on the option value.
		require
			a_ecf_version_not_void: a_ecf_version /= Void
		do
			if a_ecf_version >= ecf_1_22_0 then
				Result := valid_options_1_22_0
			elseif a_ecf_version >= ecf_1_21_0 then
				Result := valid_options_1_21_0
			elseif a_ecf_version >= ecf_1_18_0 then
				Result := valid_options_1_18_0
			elseif a_ecf_version >= ecf_1_16_0 then
				Result := valid_options_1_16_0
			elseif a_ecf_version >= ecf_1_15_0 then
				Result := valid_options_1_15_0
			elseif a_ecf_version >= ecf_1_14_0 then
				Result := valid_options_1_14_0
			elseif a_ecf_version >= ecf_1_11_0 then
				Result := valid_options_1_11_0
			elseif a_ecf_version >= ecf_1_10_0 then
				Result := valid_options_1_10_0
			elseif a_ecf_version >= ecf_1_9_0 then
				Result := valid_options_1_9_0
			elseif a_ecf_version >= ecf_1_5_0 then
				Result := valid_options_1_5_0
			elseif a_ecf_version >= ecf_1_4_0 then
				Result := valid_options_1_4_0
			elseif a_ecf_version >= ecf_1_3_0 then
				Result := valid_options_1_3_0
			elseif a_ecf_version >= ecf_1_2_0 then
				Result := valid_options_1_2_0
			else
				Result := valid_options_1_0_0
			end
		ensure
			instance_free: class
			valid_options_not_void: Result /= Void
			no_void_option_name: not Result.has_void
		end

	valid_options_latest: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid option values for the latest version of ECF
			--
			-- A void regexp means that there is no constraint on the option value.
		local
			l_hash_function: KL_AGENT_HASH_FUNCTION [STRING]
		once
			create Result.make_map (15)
			Result.set_key_equality_tester (case_insensitive_string_equality_tester)
			create l_hash_function.make (agent STRING_.case_insensitive_hash_code ({STRING} ?))
			Result.set_hash_function (l_hash_function)
			Result.force_last (boolean_option_value_regexp, {ET_ECF_OPTION_NAMES}.debug_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_ECF_OPTION_NAMES}.full_class_checking_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_ECF_OPTION_NAMES}.is_attached_by_default_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_ECF_OPTION_NAMES}.is_obsolete_iteration_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_ECF_OPTION_NAMES}.is_obsolete_routine_type_option_name)
			Result.force_last (manifest_array_type_option_value_regexp, {ET_ECF_OPTION_NAMES}.manifest_array_type_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_ECF_OPTION_NAMES}.msil_application_optimize_option_name)
			Result.force_last (Void, {ET_ECF_OPTION_NAMES}.namespace_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_ECF_OPTION_NAMES}.optimize_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_ECF_OPTION_NAMES}.profile_option_name)
			Result.force_last (syntax_option_value_regexp, {ET_ECF_OPTION_NAMES}.syntax_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_ECF_OPTION_NAMES}.trace_option_name)
			Result.force_last (warning_option_value_regexp, {ET_ECF_OPTION_NAMES}.warning_option_name)
		ensure
			instance_free: class
			valid_options_latest_not_void: Result /= Void
			no_void_option_name: not Result.has_void
		end

	valid_options_1_22_0: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid option values for ECF 1.22.0 and above
			--
			-- A void regexp means that there is no constraint on the option value.
		once
			Result := valid_options_latest
		ensure
			instance_free: class
			valid_options_1_22_0_not_void: Result /= Void
			no_void_option_name: not Result.has_void
		end

	valid_options_1_21_0: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid option values for ECF 1.21.0 and above
			--
			-- A void regexp means that there is no constraint on the option value.
		once
			Result := valid_options_1_22_0.twin
			Result.remove ({ET_ECF_OPTION_NAMES}.is_obsolete_iteration_option_name)
		ensure
			instance_free: class
			valid_options_1_21_0_not_void: Result /= Void
			no_void_option_name: not Result.has_void
		end

	valid_options_1_18_0: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid option values for ECF 1.18.0 and above
			--
			-- A void regexp means that there is no constraint on the option value.
		once
			Result := valid_options_1_21_0.twin
			Result.force_last (boolean_option_value_regexp, {ET_ECF_OPTION_NAMES}.warning_option_name)
		ensure
			instance_free: class
			valid_options_1_18_0_not_void: Result /= Void
			no_void_option_name: not Result.has_void
		end

	valid_options_1_16_0: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid option values for ECF 1.16.0 and above
			--
			-- A void regexp means that there is no constraint on the option value.
		once
			Result := valid_options_1_18_0.twin
			Result.remove ({ET_ECF_OPTION_NAMES}.manifest_array_type_option_name)
		ensure
			instance_free: class
			valid_options_1_16_0_not_void: Result /= Void
			no_void_option_name: not Result.has_void
		end

	valid_options_1_15_0: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid option values for ECF 1.15.0 and above
			--
			-- A void regexp means that there is no constraint on the option value.
		once
			Result := valid_options_1_16_0.twin
			Result.force_last (cat_call_detection_option_value_regexp, {ET_ECF_OPTION_NAMES}.cat_call_detection_option_name)
			Result.force_last (void_safety_option_value_regexp, {ET_ECF_OPTION_NAMES}.void_safety_option_name)
		ensure
			instance_free: class
			valid_options_1_15_0_not_void: Result /= Void
			no_void_option_name: not Result.has_void
		end

	valid_options_1_14_0: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid option values for ECF 1.14.0 and above
			--
			-- A void regexp means that there is no constraint on the option value.
		once
			Result := valid_options_1_15_0.twin
			Result.remove ({ET_ECF_OPTION_NAMES}.is_obsolete_routine_type_option_name)
		ensure
			instance_free: class
			valid_options_1_14_0_not_void: Result /= Void
			no_void_option_name: not Result.has_void
		end

	valid_options_1_11_0: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid option values for ECF 1.11.0 and above
			--
			-- A void regexp means that there is no constraint on the option value.
		once
			Result := valid_options_1_14_0.twin
			Result.force_last (boolean_option_value_regexp, {ET_ECF_OPTION_NAMES}.cat_call_detection_option_name)
		ensure
			instance_free: class
			valid_options_1_11_0_not_void: Result /= Void
			no_void_option_name: not Result.has_void
		end

	valid_options_1_10_0: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid option values for ECF 1.10.0 and above
			--
			-- A void regexp means that there is no constraint on the option value.
		once
			Result := valid_options_1_11_0.twin
			Result.force_last (boolean_option_value_regexp, {ET_ECF_OPTION_NAMES}.is_void_safe_option_name)
			Result.force_last (void_safety_old_option_value_regexp, {ET_ECF_OPTION_NAMES}.void_safety_option_name)
		ensure
			instance_free: class
			valid_options_1_10_0_not_void: Result /= Void
			no_void_option_name: not Result.has_void
		end

	valid_options_1_9_0: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid option values for ECF 1.9.0 and above
			--
			-- A void regexp means that there is no constraint on the option value.
		once
			Result := valid_options_1_10_0.twin
			Result.remove ({ET_ECF_OPTION_NAMES}.cat_call_detection_option_name)
		ensure
			instance_free: class
			valid_options_1_9_0_not_void: Result /= Void
			no_void_option_name: not Result.has_void
		end

	valid_options_1_5_0: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid option values for ECF 1.5.0 and above
			--
			-- A void regexp means that there is no constraint on the option value.
		once
			Result := valid_options_1_9_0.twin
			Result.remove ({ET_ECF_OPTION_NAMES}.is_void_safe_option_name)
		ensure
			instance_free: class
			valid_options_1_5_0_not_void: Result /= Void
			no_void_option_name: not Result.has_void
		end

	valid_options_1_4_0: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid option values for ECF 1.4.0 and above
			--
			-- A void regexp means that there is no constraint on the option value.
		once
			Result := valid_options_1_5_0.twin
			Result.force_last (boolean_option_value_regexp, {ET_ECF_OPTION_NAMES}.is_void_safe_option_name)
			Result.remove ({ET_ECF_OPTION_NAMES}.syntax_option_name)
			Result.force_last (syntax_level_option_value_regexp, {ET_ECF_OPTION_NAMES}.syntax_level_option_name)
			Result.remove ({ET_ECF_OPTION_NAMES}.void_safety_option_name)
		ensure
			instance_free: class
			valid_options_1_4_0_not_void: Result /= Void
			no_void_option_name: not Result.has_void
		end

	valid_options_1_3_0: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid option values for ECF 1.3.0 and above
			--
			-- A void regexp means that there is no constraint on the option value.
		once
			Result := valid_options_1_4_0.twin
			Result.remove ({ET_ECF_OPTION_NAMES}.syntax_level_option_name)
		ensure
			instance_free: class
			valid_options_1_4_0_not_void: Result /= Void
			no_void_option_name: not Result.has_void
		end

	valid_options_1_2_0: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid option values for ECF 1.2.0 and above
			--
			-- A void regexp means that there is no constraint on the option value.
		once
			Result := valid_options_1_3_0.twin
			Result.remove ({ET_ECF_OPTION_NAMES}.is_attached_by_default_option_name)
			Result.remove ({ET_ECF_OPTION_NAMES}.is_void_safe_option_name)
		ensure
			instance_free: class
			valid_options_1_2_0_not_void: Result /= Void
			no_void_option_name: not Result.has_void
		end

	valid_options_1_0_0: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid option values for ECF 1.0.0 and above
			--
			-- A void regexp means that there is no constraint on the option value.
		once
			Result := valid_options_1_2_0.twin
			Result.remove ({ET_ECF_OPTION_NAMES}.full_class_checking_option_name)
		ensure
			instance_free: class
			valid_options_1_0_0_not_void: Result /= Void
			no_void_option_name: not Result.has_void
		end

	valid_warnings (a_ecf_version: UT_VERSION): DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid warning values for ECF version `a_ecf_version'
			--
			-- A void regexp means that there is no constraint on the warning value.
		require
			a_ecf_version_not_void: a_ecf_version /= Void
		do
			if a_ecf_version >= ecf_1_18_0 then
				Result := valid_warnings_1_18_0
			elseif a_ecf_version >= ecf_1_17_0 then
				Result := valid_warnings_1_17_0
			elseif a_ecf_version >= ecf_1_10_0 then
				Result := valid_warnings_1_10_0
			else
				Result := valid_warnings_1_0_0
			end
		ensure
			instance_free: class
			valid_warnings_not_void: Result /= Void
			no_void_warning_name: not Result.has_void
		end

	valid_warnings_latest: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid warning values for the latest version of ECF
			--
			-- A void regexp means that there is no constraint on the warning value.
		local
			l_hash_function: KL_AGENT_HASH_FUNCTION [STRING]
		once
			create Result.make_map (15)
			Result.set_key_equality_tester (case_insensitive_string_equality_tester)
			create l_hash_function.make (agent STRING_.case_insensitive_hash_code ({STRING} ?))
			Result.set_hash_function (l_hash_function)
			Result.force_last (boolean_option_value_regexp, {ET_ECF_OPTION_NAMES}.warning_export_class_missing_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_ECF_OPTION_NAMES}.warning_obsolete_class_option_name)
			Result.force_last (warning_obsolete_feature_option_value_regexp, {ET_ECF_OPTION_NAMES}.warning_obsolete_feature_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_ECF_OPTION_NAMES}.warning_old_verbatim_strings_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_ECF_OPTION_NAMES}.warning_once_in_generic_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_ECF_OPTION_NAMES}.warning_option_unknown_class_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_ECF_OPTION_NAMES}.warning_renaming_unknown_class_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_ECF_OPTION_NAMES}.warning_same_uuid_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_ECF_OPTION_NAMES}.warning_syntax_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_ECF_OPTION_NAMES}.warning_unused_local_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_ECF_OPTION_NAMES}.warning_vjrv_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_ECF_OPTION_NAMES}.warning_vwab_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_ECF_OPTION_NAMES}.warning_vweq_option_name)
		ensure
			instance_free: class
			valid_warnings_latest_not_void: Result /= Void
			no_void_warning_name: not Result.has_void
		end

	valid_warnings_1_21_0: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid warning values for ECF 1.21.0 and above
			--
			-- A void regexp means that there is no constraint on the warning value.
		once
			Result := valid_warnings_latest
		ensure
			instance_free: class
			valid_warnings_1_21_0_not_void: Result /= Void
			no_void_warning_name: not Result.has_void
		end

	valid_warnings_1_18_0: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid warning values for ECF 1.18.0 and above
			--
			-- A void regexp means that there is no constraint on the warning value.
		once
			Result := valid_warnings_1_21_0.twin
			Result.force_last (boolean_option_value_regexp, {ET_ECF_OPTION_NAMES}.warning_obsolete_feature_option_name)
		ensure
			instance_free: class
			valid_warnings_1_18_0_not_void: Result /= Void
			no_void_warning_name: not Result.has_void
		end

	valid_warnings_1_17_0: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid warning values for ECF 1.17.0 and above
			--
			-- A void regexp means that there is no constraint on the warning value.
		once
			Result := valid_warnings_1_18_0.twin
			Result.force_last (boolean_option_value_regexp, {ET_ECF_OPTION_NAMES}.warning_manifest_array_type_name)
		ensure
			instance_free: class
			valid_warnings_1_17_0_not_void: Result /= Void
			no_void_warning_name: not Result.has_void
		end

	valid_warnings_1_10_0: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid warning values for ECF 1.10.0 and above
			--
			-- A void regexp means that there is no constraint on the warning value.
		once
			Result := valid_warnings_1_17_0.twin
			Result.remove ({ET_ECF_OPTION_NAMES}.warning_manifest_array_type_name)
		ensure
			instance_free: class
			valid_warnings_1_10_0_not_void: Result /= Void
			no_void_warning_name: not Result.has_void
		end

	valid_warnings_1_0_0: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid warning values for ECF 1.0.0 and above
			--
			-- A void regexp means that there is no constraint on the warning value.
		once
			Result := valid_warnings_1_10_0.twin
			Result.remove ({ET_ECF_OPTION_NAMES}.warning_vwab_option_name)
		ensure
			instance_free: class
			valid_warnings_1_0_0_not_void: Result /= Void
			no_void_warning_name: not Result.has_void
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
			a_options.set_primary_value ({ET_ECF_OPTION_NAMES}.is_obsolete_iteration_option_name, {ET_ECF_OPTION_NAMES}.false_option_value)
			a_options.set_primary_value ({ET_ECF_OPTION_NAMES}.is_obsolete_routine_type_option_name, {ET_ECF_OPTION_NAMES}.false_option_value)
			a_options.set_primary_value ({ET_ECF_OPTION_NAMES}.manifest_array_type_option_name, {ET_ECF_OPTION_NAMES}.standard_option_value)
			a_options.set_primary_value ({ET_ECF_OPTION_NAMES}.msil_application_optimize_option_name, {ET_ECF_OPTION_NAMES}.false_option_value)
			a_options.set_primary_value ({ET_ECF_OPTION_NAMES}.optimize_option_name, {ET_ECF_OPTION_NAMES}.false_option_value)
			a_options.set_primary_value ({ET_ECF_OPTION_NAMES}.profile_option_name, {ET_ECF_OPTION_NAMES}.false_option_value)
			a_options.set_primary_value ({ET_ECF_OPTION_NAMES}.syntax_option_name, {ET_ECF_OPTION_NAMES}.standard_option_value)
			a_options.set_primary_value ({ET_ECF_OPTION_NAMES}.trace_option_name, {ET_ECF_OPTION_NAMES}.false_option_value)
			a_options.set_primary_value ({ET_ECF_OPTION_NAMES}.warning_option_name, {ET_ECF_OPTION_NAMES}.warning_option_value)
			a_options.set_primary_assertion_value ({ET_ECF_OPTION_NAMES}.assertions_check_option_name, {ET_ECF_OPTION_NAMES}.false_option_value)
			a_options.set_primary_assertion_value ({ET_ECF_OPTION_NAMES}.assertions_invariant_option_name, {ET_ECF_OPTION_NAMES}.false_option_value)
			a_options.set_primary_assertion_value ({ET_ECF_OPTION_NAMES}.assertions_loop_option_name, {ET_ECF_OPTION_NAMES}.false_option_value)
			a_options.set_primary_assertion_value ({ET_ECF_OPTION_NAMES}.assertions_postcondition_option_name, {ET_ECF_OPTION_NAMES}.false_option_value)
			a_options.set_primary_assertion_value ({ET_ECF_OPTION_NAMES}.assertions_precondition_option_name, {ET_ECF_OPTION_NAMES}.false_option_value)
			a_options.set_primary_assertion_value ({ET_ECF_OPTION_NAMES}.assertions_supplier_precondition_option_name, {ET_ECF_OPTION_NAMES}.false_option_value)
			a_options.set_primary_warning_value ({ET_ECF_OPTION_NAMES}.warning_export_class_missing_option_name, {ET_ECF_OPTION_NAMES}.true_option_value)
			a_options.set_primary_warning_value ({ET_ECF_OPTION_NAMES}.warning_manifest_array_type_name, {ET_ECF_OPTION_NAMES}.false_option_value)
			a_options.set_primary_warning_value ({ET_ECF_OPTION_NAMES}.warning_obsolete_class_option_name, {ET_ECF_OPTION_NAMES}.true_option_value)
			a_options.set_primary_warning_value ({ET_ECF_OPTION_NAMES}.warning_obsolete_feature_option_name, {ET_ECF_OPTION_NAMES}.current_option_value)
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
		ensure
			instance_free: class
		end

	set_default_options_1_22_0 (a_options: ET_ECF_OPTIONS)
			-- Set in `a_options' the default values for ECF 1.22.0 and above.
		require
			a_options_not_void: a_options /= Void
		do
			set_default_options_latest (a_options)
		ensure
			instance_free: class
		end

	set_default_options_1_21_0 (a_options: ET_ECF_OPTIONS)
			-- Set in `a_options' the default values for ECF 1.21.0 and above.
		require
			a_options_not_void: a_options /= Void
		do
			set_default_options_1_22_0 (a_options)
			a_options.set_primary_value ({ET_ECF_OPTION_NAMES}.is_obsolete_iteration_option_name, {ET_ECF_OPTION_NAMES}.true_option_value)
		ensure
			instance_free: class
		end

	set_default_options_1_18_0 (a_options: ET_ECF_OPTIONS)
			-- Set in `a_options' the default values for ECF 1.18.0 and above.
		require
			a_options_not_void: a_options /= Void
		do
			set_default_options_1_21_0 (a_options)
			a_options.set_primary_value ({ET_ECF_OPTION_NAMES}.warning_option_name, {ET_ECF_OPTION_NAMES}.none_option_value)
			a_options.set_primary_value ({ET_ECF_OPTION_NAMES}.warning_obsolete_feature_option_name, {ET_ECF_OPTION_NAMES}.true_option_value)
		ensure
			instance_free: class
		end

	set_default_options_1_15_0 (a_options: ET_ECF_OPTIONS)
			-- Set in `a_options' the default values for ECF 1.15.0 and above.
		require
			a_options_not_void: a_options /= Void
		do
			set_default_options_1_18_0 (a_options)
			a_options.set_primary_value ({ET_ECF_OPTION_NAMES}.manifest_array_type_option_name, {ET_ECF_OPTION_NAMES}.mismatch_warning_option_value)
			a_options.set_primary_warning_value ({ET_ECF_OPTION_NAMES}.warning_manifest_array_type_name, {ET_ECF_OPTION_NAMES}.true_option_value)
		ensure
			instance_free: class
		end

	set_default_options_1_11_0 (a_options: ET_ECF_OPTIONS)
			-- Set in `a_options' the default values for ECF 1.11.0 and above.
		require
			a_options_not_void: a_options /= Void
		do
			set_default_options_1_15_0 (a_options)
			a_options.set_primary_value ({ET_ECF_OPTION_NAMES}.is_obsolete_routine_type_option_name, {ET_ECF_OPTION_NAMES}.true_option_value)
		ensure
			instance_free: class
		end

	set_default_options_1_9_0 (a_options: ET_ECF_OPTIONS)
			-- Set in `a_options' the default values for ECF 1.9.0 and above.
		require
			a_options_not_void: a_options /= Void
		do
			set_default_options_1_11_0 (a_options)
			a_options.set_primary_value ({ET_ECF_OPTION_NAMES}.full_class_checking_option_name, {ET_ECF_OPTION_NAMES}.false_option_value)
		ensure
			instance_free: class
		end

	set_default_options_1_5_0 (a_options: ET_ECF_OPTIONS)
			-- Set in `a_options' the default values for ECF 1.5.0 and above.
		require
			a_options_not_void: a_options /= Void
		do
			set_default_options_1_9_0 (a_options)
			a_options.set_primary_value ({ET_ECF_OPTION_NAMES}.is_attached_by_default_option_name, {ET_ECF_OPTION_NAMES}.false_option_value)
			a_options.set_primary_value ({ET_ECF_OPTION_NAMES}.syntax_option_name, {ET_ECF_OPTION_NAMES}.transitional_option_value)
		ensure
			instance_free: class
		end

	set_default_options_1_0_0 (a_options: ET_ECF_OPTIONS)
			-- Set in `a_options' the default values for ECF 1.0.0 and above.
		require
			a_options_not_void: a_options /= Void
		do
			set_default_options_1_5_0 (a_options)
			a_options.set_primary_value ({ET_ECF_OPTION_NAMES}.syntax_option_name, {ET_ECF_OPTION_NAMES}.obsolete_option_value)
		ensure
			instance_free: class
		end

feature {NONE} -- Implementation

	boolean_option_value_regexp: RX_REGULAR_EXPRESSION
			-- Regular expression for validation of boolean option values
		once
			create {RX_PCRE_REGULAR_EXPRESSION} Result.make
			Result.compile ("(?i)(" + {ET_ECF_OPTION_NAMES}.true_option_value + "|" + {ET_ECF_OPTION_NAMES}.true_option_value + ")")
		ensure
			instance_free: class
			boolean_option_value_regexp_not_void: Result /= Void
			boolean_option_value_regexp_compiled: Result.is_compiled
		end

	cat_call_detection_option_value_regexp: RX_REGULAR_EXPRESSION
			-- Regular expression for validation of "cat_call_detection" option values
		once
			create {RX_PCRE_REGULAR_EXPRESSION} Result.make
			Result.compile ("(?i)(" + {ET_ECF_OPTION_NAMES}.none_option_value + "|" + {ET_ECF_OPTION_NAMES}.conformance_option_value + "|" + {ET_ECF_OPTION_NAMES}.all_option_value + ")")
		ensure
			instance_free: class
			cat_call_detection_option_value_regexp_not_void: Result /= Void
			cat_call_detection_option_value_regexp_compiled: Result.is_compiled
		end

	manifest_array_type_option_value_regexp: RX_REGULAR_EXPRESSION
			-- Regular expression for validation of "manifest_array_type" option values
		once
			create {RX_PCRE_REGULAR_EXPRESSION} Result.make
			Result.compile ("(?i)(" + {ET_ECF_OPTION_NAMES}.mismatch_error_option_value + "|" + {ET_ECF_OPTION_NAMES}.mismatch_warning_option_value + "|" + {ET_ECF_OPTION_NAMES}.standard_option_value + ")")
		ensure
			instance_free: class
			manifest_array_type_option_value_regexp_not_void: Result /= Void
			manifest_array_type_option_value_regexp_compiled: Result.is_compiled
		end

	syntax_option_value_regexp: RX_REGULAR_EXPRESSION
			-- Regular expression for validation of "syntax" option values
		once
			create {RX_PCRE_REGULAR_EXPRESSION} Result.make
			Result.compile ("(?i)(" + {ET_ECF_OPTION_NAMES}.obsolete_option_value + "|" + {ET_ECF_OPTION_NAMES}.transitional_option_value + "|" + {ET_ECF_OPTION_NAMES}.standard_option_value + "|" + {ET_ECF_OPTION_NAMES}.provisional_option_value + ")")
		ensure
			instance_free: class
			syntax_option_value_regexp_not_void: Result /= Void
			syntax_option_value_regexp_compiled: Result.is_compiled
		end

	syntax_level_option_value_regexp: RX_REGULAR_EXPRESSION
			-- Regular expression for validation of "syntax_level" option values
		once
			create {RX_PCRE_REGULAR_EXPRESSION} Result.make
			Result.compile ("[012]")
		ensure
			instance_free: class
			syntax_level_option_value_regexp_not_void: Result /= Void
			syntax_level_option_value_regexp_compiled: Result.is_compiled
		end

	void_safety_option_value_regexp: RX_REGULAR_EXPRESSION
			-- Regular expression for validation of "void_safety" option values
		once
			create {RX_PCRE_REGULAR_EXPRESSION} Result.make
			Result.compile ("(?i)(" + {ET_ECF_OPTION_NAMES}.none_option_value + "|" + {ET_ECF_OPTION_NAMES}.conformance_option_value + "|" + {ET_ECF_OPTION_NAMES}.initialization_option_value + "|" + {ET_ECF_OPTION_NAMES}.transitional_option_value + "|" + {ET_ECF_OPTION_NAMES}.all_option_value + ")")
		ensure
			instance_free: class
			void_safety_option_value_regexp_not_void: Result /= Void
			void_safety_option_value_regexp_compiled: Result.is_compiled
		end

	void_safety_old_option_value_regexp: RX_REGULAR_EXPRESSION
			-- Regular expression for validation of "void_safety" old option values
		once
			create {RX_PCRE_REGULAR_EXPRESSION} Result.make
			Result.compile ("(?i)(" + {ET_ECF_OPTION_NAMES}.none_option_value + "|" + {ET_ECF_OPTION_NAMES}.initialization_option_value + "|" + {ET_ECF_OPTION_NAMES}.all_option_value + ")")
		ensure
			instance_free: class
			void_safety_old_option_value_regexp_not_void: Result /= Void
			void_safety_old_option_value_regexp_compiled: Result.is_compiled
		end

	warning_option_value_regexp: RX_REGULAR_EXPRESSION
			-- Regular expression for validation of "warning" option values
		once
			create {RX_PCRE_REGULAR_EXPRESSION} Result.make
			Result.compile ("(?i)(" + {ET_ECF_OPTION_NAMES}.none_option_value + "|" + {ET_ECF_OPTION_NAMES}.warning_option_value + "|" + {ET_ECF_OPTION_NAMES}.error_option_value + ")")
		ensure
			instance_free: class
			warning_option_value_regexp_not_void: Result /= Void
			warning_option_value_regexp_compiled: Result.is_compiled
		end

	warning_obsolete_feature_option_value_regexp: RX_REGULAR_EXPRESSION
			-- Regular expression for validation of "warning" option "obsolete_feature" values
		once
			create {RX_PCRE_REGULAR_EXPRESSION} Result.make
			Result.compile ("(?i)(" + {ET_ECF_OPTION_NAMES}.none_option_value + "|" + {ET_ECF_OPTION_NAMES}.current_option_value + "|" + {ET_ECF_OPTION_NAMES}.all_option_value + ")")
		ensure
			instance_free: class
			warning_obsolete_feature_option_value_regexp_not_void: Result /= Void
			warning_obsolete_feature_option_value_regexp_compiled: Result.is_compiled
		end

end
