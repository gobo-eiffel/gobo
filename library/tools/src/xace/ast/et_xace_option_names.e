note

	description:

		"Xace option names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_OPTION_NAMES

obsolete

	"Use ET_ECF_* classes instead. [2019-03-17]"

inherit

	UC_SHARED_STRING_EQUALITY_TESTER

feature -- Names

	abstract_option_name: STRING = "abstract"
			-- Name of option "abstract"
			--
			-- Values: true|false

	address_expression_option_name: STRING = "address_expression"
			-- Name of option "address_expression"
			--
			-- Values: true|false

	array_optimization_option_name: STRING = "array_optimization"
			-- Name of option "array_optimization"
			--
			-- Values: true|false

	assembly_option_name: STRING = "assembly"
			-- Name of option "assembly"

	assertion_option_name: STRING = "assertion"
			-- Name of option "assertion"
			--
			-- Values: none|generate|require|supplier_precondition|ensure|invariant|loop_invariant|loop_variant|check|all

	attached_by_default_option_name: STRING = "attached_by_default"
			-- Name of option "attached_by_default"
			--
			-- Values: true|false

	automatic_backup_option_name: STRING = "automatic_backup"
			-- Name of option "automatic_backup"
			--
			-- Values: true|false

	c_compiler_options_option_name: STRING = "c_compiler_options"
			-- Name of option "c_compiler_options"

	check_generic_creation_constraint_option_name: STRING = "check_generic_creation_constraint"
			-- Name of option "check_generic_creation_constraint"
			--
			-- Values: true|false

	check_vape_option_name: STRING = "check_vape"
			-- Name of option "check_vape"
			--
			-- Values: true|false

	cls_compliant_option_name: STRING = "cls_compliant"
			-- Name of option "cls_compliant"
			--
			-- Values: true|false

	console_application_option_name: STRING = "console_application"
			-- Name of option "console_application"
			--
			-- Values: true|false

	culture_option_name: STRING = "culture"
			-- Name of option "culture"

	dead_code_removal_option_name: STRING = "dead_code_removal"
			-- Name of option "dead_code_removal"
			--
			-- Values: none|low_level|feature|class|all

	debug_option_name: STRING = "debug"
			-- Name of option "debug"
			--
			-- Values: true|false

	debug_tag_option_name: STRING = "debug_tag"
			-- Name of option "debug_tag"

	dotnet_naming_convention_option_name: STRING = "dotnet_naming_convention"
			-- Name of option "dotnet_naming_convention"
			--
			-- Values: true|false

	dynamic_runtime_option_name: STRING = "dynamic_runtime"
			-- Name of option "dynamic_runtime"
			--
			-- Values: true|false

	ecf_library_option_name: STRING = "ecf_library"
			-- Name of option "ecf_library"

	enforce_unique_class_names_option_name: STRING = "enforce_unique_class_names"
			-- Name of option "enforce_unique_class_names"
			--
			-- Values: true|false

	exception_trace_option_name: STRING = "exception_trace"
			-- Name of option "exception_trace"
			--
			-- Values: true|false

	exclude_option_name: STRING = "exclude"
			-- Name of option "exclude"

	export_option_name: STRING = "export"
			-- Name of option "export"

	external_runtime_option_name: STRING = "external_runtime"
			-- Name of option "external_runtime"

	force_32bits_option_name: STRING = "force_32bits"
			-- Name of option "force_32bits"
			--
			-- Values: true|false

	full_class_checking_option_name: STRING = "full_class_checking"
			-- Name of option "full_class_checking"
			--
			-- Values: true|false

	garbage_collector_option_name: STRING = "garbage_collector"
			-- Name of option "garbage_collector"
			--
			-- Values: none|internal|boehm

	header_option_name: STRING = "header"
			-- Name of option "header"

	il_verifiable_option_name: STRING = "il_verifiable"
			-- Name of option "il_verifiable"
			--
			-- Values: true|false

	include_option_name: STRING = "include"
			-- Name of option "include"

	inlining_option_name: STRING = "inlining"
			-- Name of option "inlining"
			--
			-- Values: none|array|constant|once|all

	inlining_size_option_name: STRING = "inlining_size"
			-- Name of option "inlining_size"
			--
			-- Values: Integers >= 0 and <= 100

	line_generation_option_name: STRING = "line_generation"
			-- Name of option "line_generation"
			--
			-- Values: true|false

	link_option_name: STRING = "link"
			-- Name of option "link"

	metadata_cache_path_option_name: STRING = "metadata_cache_path"
			-- Name of option "metadata_cache_path"

	msil_classes_per_module_option_name: STRING = "msil_classes_per_module"
			-- Name of option "msil_classes_per_module"
			--
			-- Values: Integers > 0

	msil_clr_version_option_name: STRING = "msil_clr_version"
			-- Name of option "msil_clr_version"

	msil_culture_option_name: STRING = "msil_culture"
			-- Name of option "msil_culture"

	msil_generation_option_name: STRING = "msil_generation"
			-- Name of option "msil_generation"
			--
			-- Values: true|false

	msil_key_file_name_option_name: STRING = "msil_key_file_name"
			-- Name of option "msil_key_file_name"

	msil_use_optimized_precompile_option_name: STRING = "msil_use_optimized_precompile"
			-- Name of option "msil_use_optimized_precompile"
			--
			-- Values: true|false

	multithreaded_option_name: STRING = "multithreaded"
			-- Name of option "multithreaded"
			--
			-- Values: true|false

	namespace_option_name: STRING = "namespace"
			-- Name of option "namespace"

	old_verbatim_strings_option_name: STRING = "old_verbatim_strings"
			-- Name of option "old_verbatim_strings"
			--
			-- Values: true|false

	override_cluster_option_name: STRING = "override_cluster"
			-- Name of option "override_cluster"

	prefix_option_name: STRING = "prefix"
			-- Name of option "prefix"

	profile_option_name: STRING = "profile"
			-- Name of option "profile"
			--
			-- Values: true|false

	public_key_token_option_name: STRING = "public_key_token"
			-- Name of option "public_key_token"

	read_only_option_name: STRING = "read_only"
			-- Name of option "read_only"
			--
			-- Values: true|false

	recursive_option_name: STRING = "recursive"
			-- Name of option "recursive"
			--
			-- Values: true|false

	shared_library_definition_option_name: STRING = "shared_library_definition"
			-- Name of option "shared_library_definition"

	syntax_option_name: STRING = "syntax"
			-- Name of option "syntax"
			--
			-- Values: obsolete|transitional|standard|provisional

	target_option_name: STRING = "target"
			-- Name of option "target"
			--
			-- Values: exe|dll|com|no_main

	trace_option_name: STRING = "trace"
			-- Name of option "trace"
			--
			-- Values: true|false

	use_cluster_name_as_namespace_option_name: STRING = "use_cluster_name_as_namespace"
			-- Name of option "use_cluster_name_as_namespace"
			--
			-- Values: true|false

	use_full_cluster_name_as_namespace_option_name: STRING = "use_full_cluster_name_as_namespace"
			-- Name of option "use_full_cluster_name_as_namespace"
			--
			-- Values: true|false

	version_option_name: STRING = "version"
			-- Name of option "version"

	void_safety_option_name: STRING = "void_safety"
			-- Name of option "void_safety"
			--
			-- Values: none|on_demand|complete

	warning_option_name: STRING = "warning"
			-- Name of option "warning"
			--
			-- Values: none|style|default|all

feature -- values

	all_option_value: STRING = "all"
			-- Value "all"
			--
			-- Used in "assertion", "dead_code_removal", "inlining" and "warning".

	array_option_value: STRING = "array"
			-- Value "array"
			--
			-- Used in "inlining".

	boehm_option_value: STRING = "boehm"
			-- Value "boehm"
			--
			-- Used in "garbage_collector".

	check_option_value: STRING = "check"
			-- Value "check"
			--
			-- Used in "assertion".

	class_option_value: STRING = "class"
			-- Value "class"
			--
			-- Used in "dead_code_removal".

	com_option_value: STRING = "com"
			-- Value "com"
			--
			-- Used in "target".

	complete_option_value: STRING = "complete"
			-- Value "complete"
			--
			-- Used in "void_safety".

	constant_option_value: STRING = "constant"
			-- Value "constant"
			--
			-- Used in "inlining".

	default_option_value: STRING = "default"
			-- Value "default"
			--
			-- Used in "warning".

	default_public_key_token_option_value: STRING = "b77a5c561934e089"
			-- Default value for option "public_key_token"

	default_version_option_value: STRING = "1.0.5000.0"
			-- Default value for option "version"

	dll_option_value: STRING = "dll"
			-- Value "dll"
			--
			-- Used in "target".

	ensure_option_value: STRING = "ensure"
			-- Value "ensure"
			--
			-- Used in "assertion".

	exe_option_value: STRING = "exe"
			-- Value "exe"
			--
			-- Used in "target".

	false_option_value: STRING = "false"
			-- Value "false"

	feature_option_value: STRING = "feature"
			-- Value "feature"
			--
			-- Used in "dead_code_removal".

	generate_option_value: STRING = "generate"
			-- Value "generate"
			--
			-- Used in "assertion".	

	internal_option_value: STRING = "internal"
			-- Value "internal"
			--
			-- Used in "garbage_collector".

	invariant_option_value: STRING = "invariant"
			-- Value "invariant"
			--
			-- Used in "assertion".

	loop_invariant_option_value: STRING = "loop_invariant"
			-- Value "loop_invariant"
			--
			-- Used in "assertion".	

	loop_variant_option_value: STRING = "loop_variant"
			-- Value "loop_variant"
			--
			-- Used in "assertion".	

	low_level_option_value: STRING = "low_level"
			-- Value "low_level"
			--
			-- Used in "dead_code_removal".

	neutral_option_value: STRING = "neutral"
			-- Value "neutral"
			--
			-- Used in "culture".

	no_main_option_value: STRING = "no_main"
			-- Value "no_main"
			--
			-- Used in "target".

	none_option_value: STRING = "none"
			-- Value "none"
			--
			-- Used in "assertion", "dead_code_removal", "garbage_collector",
			-- "inlining", "void_safety" and "warning".

	obsolete_option_value: STRING = "obsolete"
			-- Value "obsolete"
			--
			-- Used in "syntax".

	on_demand_option_value: STRING = "on_demand"
			-- Value "on_demand"
			--
			-- Used in "void_safety".

	once_option_value: STRING = "on_demand"
			-- Value "once"
			--
			-- Used in "inlining".

	provisional_option_value: STRING = "provisional"
			-- Value "provisional"
			--
			-- Used in "syntax".

	require_option_value: STRING = "require"
			-- Value "require"
			--
			-- Used in "assertion".

	standard_option_value: STRING = "standard"
			-- Value "standard"
			--
			-- Used in "syntax".

	style_option_value: STRING = "style"
			-- Value "style"
			--
			-- Used in "warning".

	supplier_precondition_option_value: STRING = "supplier_precondition"
			-- Value "supplier_precondition"
			--
			-- Used in "assertion".

	transitional_option_value: STRING = "transitional"
			-- Value "transitional"
			--
			-- Used in "syntax".

	true_option_value: STRING = "true"
			-- Value "true"

end
