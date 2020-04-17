note

	description:

		"Xace option default values"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2018-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_OPTION_DEFAULTS

obsolete

	"Use ET_ECF_* classes instead. [2019-03-17]"

inherit

	ANY

	UT_SHARED_ECF_VERSIONS
		export {NONE} all end

	KL_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

feature -- Access

	default_options: ET_XACE_OPTIONS
			-- Default Xace option values
		once
			create Result.make
			Result.set_primary_value ({ET_XACE_OPTION_NAMES}.abstract_option_name, {ET_XACE_OPTION_NAMES}.false_option_value)
			Result.set_primary_value ({ET_XACE_OPTION_NAMES}.address_expression_option_name, {ET_XACE_OPTION_NAMES}.false_option_value)
			Result.set_primary_value ({ET_XACE_OPTION_NAMES}.array_optimization_option_name, {ET_XACE_OPTION_NAMES}.false_option_value)
			Result.set_primary_value ({ET_XACE_OPTION_NAMES}.assertion_option_name, {ET_XACE_OPTION_NAMES}.require_option_value)
			Result.set_primary_value ({ET_XACE_OPTION_NAMES}.attached_by_default_option_name, {ET_XACE_OPTION_NAMES}.false_option_value)
			Result.set_primary_value ({ET_XACE_OPTION_NAMES}.automatic_backup_option_name, {ET_XACE_OPTION_NAMES}.false_option_value)
			Result.set_primary_value ({ET_XACE_OPTION_NAMES}.check_generic_creation_constraint_option_name, {ET_XACE_OPTION_NAMES}.true_option_value)
			Result.set_primary_value ({ET_XACE_OPTION_NAMES}.check_vape_option_name, {ET_XACE_OPTION_NAMES}.true_option_value)
			Result.set_primary_value ({ET_XACE_OPTION_NAMES}.cls_compliant_option_name, {ET_XACE_OPTION_NAMES}.true_option_value)
			Result.set_primary_value ({ET_XACE_OPTION_NAMES}.console_application_option_name, {ET_XACE_OPTION_NAMES}.true_option_value)
			Result.set_primary_value ({ET_XACE_OPTION_NAMES}.culture_option_name, {ET_XACE_OPTION_NAMES}.neutral_option_value)
			Result.set_primary_value ({ET_XACE_OPTION_NAMES}.dead_code_removal_option_name, {ET_XACE_OPTION_NAMES}.all_option_value)
			Result.set_primary_value ({ET_XACE_OPTION_NAMES}.debug_option_name, {ET_XACE_OPTION_NAMES}.false_option_value)
			Result.set_primary_value ({ET_XACE_OPTION_NAMES}.dotnet_naming_convention_option_name, {ET_XACE_OPTION_NAMES}.false_option_value)
			Result.set_primary_value ({ET_XACE_OPTION_NAMES}.dynamic_runtime_option_name, {ET_XACE_OPTION_NAMES}.false_option_value)
			Result.set_primary_value ({ET_XACE_OPTION_NAMES}.enforce_unique_class_names_option_name, {ET_XACE_OPTION_NAMES}.false_option_value)
			Result.set_primary_value ({ET_XACE_OPTION_NAMES}.exception_trace_option_name, {ET_XACE_OPTION_NAMES}.false_option_value)
			Result.set_primary_value ({ET_XACE_OPTION_NAMES}.force_32bits_option_name, {ET_XACE_OPTION_NAMES}.false_option_value)
			Result.set_primary_value ({ET_XACE_OPTION_NAMES}.full_class_checking_option_name, {ET_XACE_OPTION_NAMES}.false_option_value)
			Result.set_primary_value ({ET_XACE_OPTION_NAMES}.garbage_collector_option_name, {ET_XACE_OPTION_NAMES}.internal_option_value)
			Result.set_primary_value ({ET_XACE_OPTION_NAMES}.il_verifiable_option_name, {ET_XACE_OPTION_NAMES}.true_option_value)
			Result.set_primary_value ({ET_XACE_OPTION_NAMES}.inlining_option_name, {ET_XACE_OPTION_NAMES}.all_option_value)
			Result.set_primary_value ({ET_XACE_OPTION_NAMES}.inlining_size_option_name, "0")
			Result.set_primary_value ({ET_XACE_OPTION_NAMES}.line_generation_option_name, {ET_XACE_OPTION_NAMES}.false_option_value)
			Result.set_primary_value ({ET_XACE_OPTION_NAMES}.msil_classes_per_module_option_name, "5")
			Result.set_primary_value ({ET_XACE_OPTION_NAMES}.msil_generation_option_name, {ET_XACE_OPTION_NAMES}.false_option_value)
			Result.set_primary_value ({ET_XACE_OPTION_NAMES}.msil_use_optimized_precompile_option_name, {ET_XACE_OPTION_NAMES}.false_option_value)
			Result.set_primary_value ({ET_XACE_OPTION_NAMES}.multithreaded_option_name, {ET_XACE_OPTION_NAMES}.false_option_value)
			Result.set_primary_value ({ET_XACE_OPTION_NAMES}.old_verbatim_strings_option_name, {ET_XACE_OPTION_NAMES}.false_option_value)
			Result.set_primary_value ({ET_XACE_OPTION_NAMES}.profile_option_name, {ET_XACE_OPTION_NAMES}.false_option_value)
			Result.set_primary_value ({ET_XACE_OPTION_NAMES}.public_key_token_option_name, {ET_XACE_OPTION_NAMES}.default_public_key_token_option_value)
			Result.set_primary_value ({ET_XACE_OPTION_NAMES}.read_only_option_name, {ET_XACE_OPTION_NAMES}.false_option_value)
			Result.set_primary_value ({ET_XACE_OPTION_NAMES}.recursive_option_name, {ET_XACE_OPTION_NAMES}.false_option_value)
			Result.set_primary_value ({ET_XACE_OPTION_NAMES}.syntax_option_name, {ET_XACE_OPTION_NAMES}.standard_option_value)
			Result.set_primary_value ({ET_XACE_OPTION_NAMES}.target_option_name, {ET_XACE_OPTION_NAMES}.exe_option_value)
			Result.set_primary_value ({ET_XACE_OPTION_NAMES}.trace_option_name, {ET_XACE_OPTION_NAMES}.false_option_value)
			Result.set_primary_value ({ET_XACE_OPTION_NAMES}.use_cluster_name_as_namespace_option_name, {ET_XACE_OPTION_NAMES}.true_option_value)
			Result.set_primary_value ({ET_XACE_OPTION_NAMES}.use_full_cluster_name_as_namespace_option_name, {ET_XACE_OPTION_NAMES}.true_option_value)
			Result.set_primary_value ({ET_XACE_OPTION_NAMES}.version_option_name, {ET_XACE_OPTION_NAMES}.default_version_option_value)
			Result.set_primary_value ({ET_XACE_OPTION_NAMES}.void_safety_option_name, {ET_XACE_OPTION_NAMES}.none_option_value)
			Result.set_primary_value ({ET_XACE_OPTION_NAMES}.warning_option_name, {ET_XACE_OPTION_NAMES}.default_option_value)
		ensure
			default_options_not_void: Result /= Void
		end

	valid_system_options: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid Xace system-level option values
			--
			-- A void regexp means that there is no constraint on the option value.
		local
			l_hash_function: KL_AGENT_HASH_FUNCTION [STRING]
		once
			create Result.make_map (15)
			Result.set_key_equality_tester (case_insensitive_string_equality_tester)
			create l_hash_function.make (agent STRING_.case_insensitive_hash_code ({STRING} ?))
			Result.set_hash_function (l_hash_function)
			Result.force_last (boolean_option_value_regexp, {ET_XACE_OPTION_NAMES}.address_expression_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_XACE_OPTION_NAMES}.array_optimization_option_name)
			Result.force_last (assertion_option_value_regexp, {ET_XACE_OPTION_NAMES}.assertion_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_XACE_OPTION_NAMES}.attached_by_default_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_XACE_OPTION_NAMES}.automatic_backup_option_name)
			Result.force_last (Void, {ET_XACE_OPTION_NAMES}.c_compiler_options_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_XACE_OPTION_NAMES}.check_generic_creation_constraint_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_XACE_OPTION_NAMES}.check_vape_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_XACE_OPTION_NAMES}.cls_compliant_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_XACE_OPTION_NAMES}.console_application_option_name)
			Result.force_last (dead_code_removal_option_value_regexp, {ET_XACE_OPTION_NAMES}.dead_code_removal_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_XACE_OPTION_NAMES}.debug_option_name)
			Result.force_last (Void, {ET_XACE_OPTION_NAMES}.debug_tag_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_XACE_OPTION_NAMES}.dotnet_naming_convention_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_XACE_OPTION_NAMES}.dynamic_runtime_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_XACE_OPTION_NAMES}.enforce_unique_class_names_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_XACE_OPTION_NAMES}.exception_trace_option_name)
			Result.force_last (Void, {ET_XACE_OPTION_NAMES}.exclude_option_name)
			Result.force_last (Void, {ET_XACE_OPTION_NAMES}.external_runtime_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_XACE_OPTION_NAMES}.force_32bits_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_XACE_OPTION_NAMES}.full_class_checking_option_name)
			Result.force_last (garbage_collector_option_value_regexp, {ET_XACE_OPTION_NAMES}.garbage_collector_option_name)
			Result.force_last (Void, {ET_XACE_OPTION_NAMES}.header_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_XACE_OPTION_NAMES}.il_verifiable_option_name)
			Result.force_last (Void, {ET_XACE_OPTION_NAMES}.include_option_name)
			Result.force_last (inlining_option_value_regexp, {ET_XACE_OPTION_NAMES}.inlining_option_name)
			Result.force_last (inlining_size_option_value_regexp, {ET_XACE_OPTION_NAMES}.inlining_size_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_XACE_OPTION_NAMES}.line_generation_option_name)
			Result.force_last (Void, {ET_XACE_OPTION_NAMES}.link_option_name)
			Result.force_last (Void, {ET_XACE_OPTION_NAMES}.metadata_cache_path_option_name)
			Result.force_last (msil_classes_per_module_option_value_regexp, {ET_XACE_OPTION_NAMES}.msil_classes_per_module_option_name)
			Result.force_last (Void, {ET_XACE_OPTION_NAMES}.msil_clr_version_option_name)
			Result.force_last (Void, {ET_XACE_OPTION_NAMES}.msil_culture_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_XACE_OPTION_NAMES}.msil_generation_option_name)
			Result.force_last (Void, {ET_XACE_OPTION_NAMES}.msil_key_file_name_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_XACE_OPTION_NAMES}.msil_use_optimized_precompile_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_XACE_OPTION_NAMES}.multithreaded_option_name)
			Result.force_last (Void, {ET_XACE_OPTION_NAMES}.namespace_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_XACE_OPTION_NAMES}.old_verbatim_strings_option_name)
			Result.force_last (Void, {ET_XACE_OPTION_NAMES}.override_cluster_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_XACE_OPTION_NAMES}.profile_option_name)
			Result.force_last (Void, {ET_XACE_OPTION_NAMES}.shared_library_definition_option_name)
			Result.force_last (syntax_option_value_regexp, {ET_XACE_OPTION_NAMES}.syntax_option_name)
			Result.force_last (target_option_value_regexp, {ET_XACE_OPTION_NAMES}.target_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_XACE_OPTION_NAMES}.trace_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_XACE_OPTION_NAMES}.use_cluster_name_as_namespace_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_XACE_OPTION_NAMES}.use_full_cluster_name_as_namespace_option_name)
			Result.force_last (void_safety_option_value_regexp, {ET_XACE_OPTION_NAMES}.void_safety_option_name)
			Result.force_last (warning_option_value_regexp, {ET_XACE_OPTION_NAMES}.warning_option_name)
		ensure
			valid_system_options_not_void: Result /= Void
			no_void_option_name: not Result.has_void
		end

	valid_cluster_options: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid Xace cluster-level option values
			--
			-- A void regexp means that there is no constraint on the option value.
		local
			l_hash_function: KL_AGENT_HASH_FUNCTION [STRING]
		once
			create Result.make_map (15)
			Result.set_key_equality_tester (case_insensitive_string_equality_tester)
			create l_hash_function.make (agent STRING_.case_insensitive_hash_code ({STRING} ?))
			Result.set_hash_function (l_hash_function)
			Result.force_last (boolean_option_value_regexp, {ET_XACE_OPTION_NAMES}.abstract_option_name)
			Result.force_last (Void, {ET_XACE_OPTION_NAMES}.assembly_option_name)
			Result.force_last (assertion_option_value_regexp, {ET_XACE_OPTION_NAMES}.assertion_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_XACE_OPTION_NAMES}.attached_by_default_option_name)
			Result.force_last (Void, {ET_XACE_OPTION_NAMES}.culture_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_XACE_OPTION_NAMES}.debug_option_name)
			Result.force_last (Void, {ET_XACE_OPTION_NAMES}.debug_tag_option_name)
			Result.force_last (Void, {ET_XACE_OPTION_NAMES}.ecf_library_option_name)
			Result.force_last (Void, {ET_XACE_OPTION_NAMES}.exclude_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_XACE_OPTION_NAMES}.full_class_checking_option_name)
			Result.force_last (Void, {ET_XACE_OPTION_NAMES}.header_option_name)
			Result.force_last (Void, {ET_XACE_OPTION_NAMES}.include_option_name)
			Result.force_last (Void, {ET_XACE_OPTION_NAMES}.link_option_name)
			Result.force_last (Void, {ET_XACE_OPTION_NAMES}.namespace_option_name)
			Result.force_last (Void, {ET_XACE_OPTION_NAMES}.prefix_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_XACE_OPTION_NAMES}.profile_option_name)
			Result.force_last (Void, {ET_XACE_OPTION_NAMES}.public_key_token_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_XACE_OPTION_NAMES}.read_only_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_XACE_OPTION_NAMES}.recursive_option_name)
			Result.force_last (syntax_option_value_regexp, {ET_XACE_OPTION_NAMES}.syntax_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_XACE_OPTION_NAMES}.trace_option_name)
			Result.force_last (Void, {ET_XACE_OPTION_NAMES}.version_option_name)
			Result.force_last (warning_option_value_regexp, {ET_XACE_OPTION_NAMES}.warning_option_name)
		ensure
			valid_cluster_options_not_void: Result /= Void
			no_void_option_name: not Result.has_void
		end

	valid_class_options: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid Xace class-level option values
			--
			-- A void regexp means that there is no constraint on the option value.
		local
			l_hash_function: KL_AGENT_HASH_FUNCTION [STRING]
		once
			create Result.make_map (15)
			Result.set_key_equality_tester (case_insensitive_string_equality_tester)
			create l_hash_function.make (agent STRING_.case_insensitive_hash_code ({STRING} ?))
			Result.set_hash_function (l_hash_function)
			Result.force_last (assertion_option_value_regexp, {ET_XACE_OPTION_NAMES}.assertion_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_XACE_OPTION_NAMES}.attached_by_default_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_XACE_OPTION_NAMES}.debug_option_name)
			Result.force_last (Void, {ET_XACE_OPTION_NAMES}.debug_tag_option_name)
			Result.force_last (Void, {ET_XACE_OPTION_NAMES}.export_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_XACE_OPTION_NAMES}.full_class_checking_option_name)
			Result.force_last (Void, {ET_XACE_OPTION_NAMES}.namespace_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_XACE_OPTION_NAMES}.profile_option_name)
			Result.force_last (syntax_option_value_regexp, {ET_XACE_OPTION_NAMES}.syntax_option_name)
			Result.force_last (boolean_option_value_regexp, {ET_XACE_OPTION_NAMES}.trace_option_name)
			Result.force_last (warning_option_value_regexp, {ET_XACE_OPTION_NAMES}.warning_option_name)
		ensure
			valid_class_options_not_void: Result /= Void
			no_void_option_name: not Result.has_void
		end

	valid_feature_options: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			-- Valid Xace feature-level option values
			--
			-- A void regexp means that there is no constraint on the option value.
		local
			l_hash_function: KL_AGENT_HASH_FUNCTION [STRING]
		once
			create Result.make_map (5)
			Result.set_key_equality_tester (case_insensitive_string_equality_tester)
			create l_hash_function.make (agent STRING_.case_insensitive_hash_code ({STRING} ?))
			Result.set_hash_function (l_hash_function)
			Result.force_last (Void, {ET_XACE_OPTION_NAMES}.export_option_name)
		ensure
			valid_feature_options_not_void: Result /= Void
			no_void_option_name: not Result.has_void
		end

feature {NONE} -- Implementation

	assertion_option_value_regexp: RX_REGULAR_EXPRESSION
			-- Regular expression for validation of "assertion" option values
		once
			create {RX_PCRE_REGULAR_EXPRESSION} Result.make
			Result.compile ("(?i)(" + {ET_XACE_OPTION_NAMES}.none_option_value + "|" + {ET_XACE_OPTION_NAMES}.generate_option_value + "|" + {ET_XACE_OPTION_NAMES}.require_option_value + "|" + {ET_XACE_OPTION_NAMES}.supplier_precondition_option_value + "|" + {ET_XACE_OPTION_NAMES}.ensure_option_value + "|" + {ET_XACE_OPTION_NAMES}.invariant_option_value + "|" + {ET_XACE_OPTION_NAMES}.loop_invariant_option_value + "|" + {ET_XACE_OPTION_NAMES}.loop_variant_option_value + "|" + {ET_XACE_OPTION_NAMES}.check_option_value + "|" + {ET_XACE_OPTION_NAMES}.all_option_value + ")")
		ensure
			assertion_option_value_regexp_not_void: Result /= Void
			assertion_option_value_regexp_compiled: Result.is_compiled
		end

	boolean_option_value_regexp: RX_REGULAR_EXPRESSION
			-- Regular expression for validation of boolean option values
		once
			create {RX_PCRE_REGULAR_EXPRESSION} Result.make
			Result.compile ("(?i)(" + {ET_XACE_OPTION_NAMES}.true_option_value + "|" + {ET_XACE_OPTION_NAMES}.true_option_value + ")")
		ensure
			boolean_option_value_regexp_not_void: Result /= Void
			boolean_option_value_regexp_compiled: Result.is_compiled
		end

	dead_code_removal_option_value_regexp: RX_REGULAR_EXPRESSION
			-- Regular expression for validation of "dead_code_removal" option values
		once
			create {RX_PCRE_REGULAR_EXPRESSION} Result.make
			Result.compile ("(?i)(" + {ET_XACE_OPTION_NAMES}.none_option_value + "|" + {ET_XACE_OPTION_NAMES}.low_level_option_value + "|" + {ET_XACE_OPTION_NAMES}.feature_option_value + "|" + {ET_XACE_OPTION_NAMES}.class_option_value + "|" + {ET_XACE_OPTION_NAMES}.all_option_value + ")")
		ensure
			dead_code_removal_option_value_regexp_not_void: Result /= Void
			dead_code_removal_option_value_regexp_compiled: Result.is_compiled
		end

	garbage_collector_option_value_regexp: RX_REGULAR_EXPRESSION
			-- Regular expression for validation of "garbage_collector" option values
		once
			create {RX_PCRE_REGULAR_EXPRESSION} Result.make
			Result.compile ("(?i)(" + {ET_XACE_OPTION_NAMES}.none_option_value + "|" + {ET_XACE_OPTION_NAMES}.internal_option_value + "|" + {ET_XACE_OPTION_NAMES}.boehm_option_value + ")")
		ensure
			garbage_collector_option_value_regexp_not_void: Result /= Void
			garbage_collector_option_value_regexp_compiled: Result.is_compiled
		end

	inlining_option_value_regexp: RX_REGULAR_EXPRESSION
			-- Regular expression for validation of "inlining" option values
		once
			create {RX_PCRE_REGULAR_EXPRESSION} Result.make
			Result.compile ("(?i)(" + {ET_XACE_OPTION_NAMES}.none_option_value + "|" + {ET_XACE_OPTION_NAMES}.array_option_value + "|" + {ET_XACE_OPTION_NAMES}.constant_option_value + "|" + {ET_XACE_OPTION_NAMES}.once_option_value + "|" + {ET_XACE_OPTION_NAMES}.all_option_value + ")")
		ensure
			inlining_option_value_regexp_not_void: Result /= Void
			inlining_option_value_regexp_compiled: Result.is_compiled
		end

	inlining_size_option_value_regexp: RX_REGULAR_EXPRESSION
			-- Regular expression for validation of "inlining_size" option values
		once
			create {RX_PCRE_REGULAR_EXPRESSION} Result.make
			Result.compile ("[0-9]|[1-9][0-9]|100")
		ensure
			inlining_size_option_value_regexp_not_void: Result /= Void
			inlining_size_option_value_regexp_compiled: Result.is_compiled
		end

	msil_classes_per_module_option_value_regexp: RX_REGULAR_EXPRESSION
			-- Regular expression for validation of "msil_classes_per_module" option values
		once
			create {RX_PCRE_REGULAR_EXPRESSION} Result.make
			Result.compile ("[1-9][0-9]*")
		ensure
			msil_classes_per_module_option_value_regexp_not_void: Result /= Void
			msil_classes_per_module_option_value_regexp_compiled: Result.is_compiled
		end

	syntax_option_value_regexp: RX_REGULAR_EXPRESSION
			-- Regular expression for validation of "syntax" option values
		once
			create {RX_PCRE_REGULAR_EXPRESSION} Result.make
			Result.compile ("(?i)(" + {ET_XACE_OPTION_NAMES}.obsolete_option_value + "|" + {ET_XACE_OPTION_NAMES}.transitional_option_value + "|" + {ET_XACE_OPTION_NAMES}.standard_option_value + "|" + {ET_XACE_OPTION_NAMES}.provisional_option_value + ")")
		ensure
			syntax_option_value_regexp_not_void: Result /= Void
			syntax_option_value_regexp_compiled: Result.is_compiled
		end

	target_option_value_regexp: RX_REGULAR_EXPRESSION
			-- Regular expression for validation of "target" option values
		once
			create {RX_PCRE_REGULAR_EXPRESSION} Result.make
			Result.compile ("(?i)(" + {ET_XACE_OPTION_NAMES}.exe_option_value + "|" + {ET_XACE_OPTION_NAMES}.dll_option_value + "|" + {ET_XACE_OPTION_NAMES}.com_option_value + "|" + {ET_XACE_OPTION_NAMES}.no_main_option_value + ")")
		ensure
			target_option_value_regexp_not_void: Result /= Void
			target_option_value_regexp_compiled: Result.is_compiled
		end

	void_safety_option_value_regexp: RX_REGULAR_EXPRESSION
			-- Regular expression for validation of "void_safety" option values
		once
			create {RX_PCRE_REGULAR_EXPRESSION} Result.make
			Result.compile ("(?i)(" + {ET_ECF_OPTION_NAMES}.none_option_value + "|" + {ET_ECF_OPTION_NAMES}.conformance_option_value + "|" + {ET_ECF_OPTION_NAMES}.initialization_option_value + "|" + {ET_ECF_OPTION_NAMES}.transitional_option_value + "|" + {ET_ECF_OPTION_NAMES}.all_option_value + ")")
		ensure
			void_safety_option_value_regexp_not_void: Result /= Void
			void_safety_option_value_regexp_compiled: Result.is_compiled
		end

	warning_option_value_regexp: RX_REGULAR_EXPRESSION
			-- Regular expression for validation of "warning" option values
		once
			create {RX_PCRE_REGULAR_EXPRESSION} Result.make
			Result.compile ("(?i)(" + {ET_XACE_OPTION_NAMES}.none_option_value + "|" + {ET_XACE_OPTION_NAMES}.style_option_value + "|" + {ET_XACE_OPTION_NAMES}.default_option_value + "|" + {ET_XACE_OPTION_NAMES}.all_option_value + ")")
		ensure
			warning_option_value_regexp_not_void: Result /= Void
			warning_option_value_regexp_compiled: Result.is_compiled
		end

end
