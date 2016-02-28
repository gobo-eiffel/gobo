note

	description:

		"Xace option names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_OPTION_NAMES

inherit

	UC_SHARED_STRING_EQUALITY_TESTER

feature -- Option names

	abstract_name: STRING = "abstract"
	address_expression_name: STRING = "address_expression"
	arguments_name: STRING = "arguments"
	array_optimization_name: STRING = "array_optimization"
	assembly_name: STRING = "assembly"
	assertion_name: STRING = "assertion"
	attached_by_default_name: STRING = "attached_by_default"
	automatic_backup_name: STRING = "automatic_backup"
	callback_name: STRING = "callback"
	case_insensitive_name: STRING = "case_insensitive"
	check_generic_creation_constraint_name: STRING = "check_generic_creation_constraint"
	check_vape_name: STRING = "check_vape"
	clean_name: STRING = "clean"
	cls_compliant_name: STRING = "cls_compliant"
	component_name: STRING = "component"
	console_application_name: STRING = "console_application"
	create_keyword_extension_name: STRING = "create_keyword_extension"
	culture_name: STRING = "culture"
	c_compiler_options_name: STRING = "c_compiler_options"
	dead_code_removal_name: STRING = "dead_code_removal"
	debug_option_name: STRING = "debug"
	debug_tag_name: STRING = "debug_tag"
	debugger_name: STRING = "debugger"
	document_name: STRING = "document"
	dotnet_naming_convention_name: STRING = "dotnet_naming_convention"
	dynamic_runtime_name: STRING = "dynamic_runtime"
	ecf_library_name: STRING = "ecf_library"
	enforce_unique_class_names_name: STRING = "enforce_unique_class_names"
	exception_trace_name: STRING = "exception_trace"
	exclude_name: STRING = "exclude"
	export_option_name: STRING = "export"
	external_runtime_name: STRING = "external_runtime"
	finalize_option_name: STRING = "finalize"
	flat_fst_optimization_name: STRING = "flat_fst_optimization"
	force_32bits_name: STRING = "force_32bits"
	fst_expansion_factor_name: STRING = "fst_expansion_factor"
	fst_optimization_name: STRING = "fst_optimization"
	full_class_checking_name: STRING = "full_class_checking"
	garbage_collector_name: STRING = "garbage_collector"
	gc_info_name: STRING = "gc_info"
	heap_size_name: STRING = "heap_size"
	header_name: STRING = "header"
	high_memory_compiler_name: STRING = "high_memory_compiler"
	il_verifiable_name: STRING = "il_verifiable"
	include_name: STRING = "include"
	inlining_name: STRING = "inlining"
	inlining_size_name: STRING = "inlining_size"
	jumps_optimization_name: STRING = "jumps_optimization"
	layout_name: STRING = "layout"
	layout_optimization_name: STRING = "layout_optimization"
	leaves_optimization_name: STRING = "leaves_optimization"
	line_generation_name: STRING = "line_generation"
	link_name: STRING = "link"
	linker_name: STRING = "linker"
	linux_fpu_double_precision_name: STRING = "linux_fpu_double_precision"
	manifest_string_trace_name: STRING = "manifest_string_trace"
	map_name: STRING = "map"
	metadata_cache_path_name: STRING = "metadata_cache_path"
	msil_assembly_compatibility_name: STRING = "msil_assembly_compatibility"
	msil_classes_per_module_name: STRING = "msil_classes_per_module"
	msil_clr_version_name: STRING = "msil_clr_version"
	msil_culture_name: STRING = "msil_culture"
	msil_generation_name: STRING = "msil_generation"
	msil_generation_version_name: STRING = "msil_generation_version"
	msil_key_file_name_name: STRING = "msil_key_file_name"
	msil_use_optimized_precompile_name: STRING = "msil_use_optimized_precompile"
	multithreaded_name: STRING = "multithreaded"
	namespace_name: STRING = "namespace"
	no_default_lib_name: STRING = "no_default_lib"
	old_verbatim_strings_name: STRING = "old_verbatim_strings"
	override_cluster_name: STRING = "override_cluster"
	portable_code_generation_name: STRING = "portable_code_generation"
	precompiled_name: STRING = "precompiled"
	prefix_option_name: STRING = "prefix"
	profile_name: STRING = "profile"
	public_key_token_name: STRING = "public_key_token"
	read_only_name: STRING = "read_only"
	recursive_name: STRING = "recursive"
	reloads_optimization_name: STRING = "reloads_optimization"
	shared_library_definition_name: STRING = "shared_library_definition"
	split_name: STRING = "split"
	stack_size_name: STRING = "stack_size"
	storable_name: STRING = "storable"
	storable_filename_name: STRING = "storable_filename"
	strip_option_name: STRING = "strip"
	syntax_name: STRING = "syntax"
	target_name: STRING = "target"
	trace_name: STRING = "trace"
	use_cluster_name_as_namespace_name: STRING = "use_cluster_name_as_namespace"
	use_full_cluster_name_as_namespace_name: STRING = "use_full_cluster_name_as_namespace"
	verbose_name: STRING = "verbose"
	version_name: STRING = "version"
	visible_filename_name: STRING = "visible_filename"
	void_safety_name: STRING = "void_safety"
	warning_name: STRING = "warning"
	wedit_name: STRING = "wedit"

feature -- Option codes

	abstract_code: INTEGER = 1
	address_expression_code: INTEGER = 2
	arguments_code: INTEGER = 3
	array_optimization_code: INTEGER = 4
	assembly_code: INTEGER = 5
	assertion_code: INTEGER = 6
	attached_by_default_code: INTEGER = 7
	automatic_backup_code: INTEGER = 8
	callback_code: INTEGER = 9
	case_insensitive_code: INTEGER = 10
	check_generic_creation_constraint_code: INTEGER = 11
	check_vape_code: INTEGER = 12
	clean_code: INTEGER = 13
	cls_compliant_code: INTEGER = 14
	component_code: INTEGER = 15
	console_application_code: INTEGER = 16
	create_keyword_extension_code: INTEGER = 17
	culture_code: INTEGER = 18
	c_compiler_options_code: INTEGER = 19
	dead_code_removal_code: INTEGER = 20
	debug_option_code: INTEGER = 21
	debug_tag_code: INTEGER = 22
	debugger_code: INTEGER = 23
	document_code: INTEGER = 24
	dotnet_naming_convention_code: INTEGER = 25
	dynamic_runtime_code: INTEGER = 26
	ecf_library_code: INTEGER = 27
	enforce_unique_class_names_code: INTEGER = 28
	exception_trace_code: INTEGER = 29
	exclude_code: INTEGER = 30
	export_option_code: INTEGER = 31
	external_runtime_code: INTEGER = 32
	finalize_option_code: INTEGER = 33
	flat_fst_optimization_code: INTEGER = 34
	force_32bits_code: INTEGER = 35
	fst_expansion_factor_code: INTEGER = 36
	fst_optimization_code: INTEGER = 37
	full_class_checking_code: INTEGER = 38
	garbage_collector_code: INTEGER = 39
	gc_info_code: INTEGER = 40
	heap_size_code: INTEGER = 41
	header_code: INTEGER = 42
	high_memory_compiler_code: INTEGER = 43
	il_verifiable_code: INTEGER = 44
	include_code: INTEGER = 45
	inlining_code: INTEGER = 46
	inlining_size_code: INTEGER = 47
	jumps_optimization_code: INTEGER = 48
	layout_code: INTEGER = 49
	layout_optimization_code: INTEGER = 50
	leaves_optimization_code: INTEGER = 51
	line_generation_code: INTEGER = 52
	link_code: INTEGER = 53
	linker_code: INTEGER = 54
	linux_fpu_double_precision_code: INTEGER = 55
	manifest_string_trace_code: INTEGER = 56
	map_code: INTEGER = 57
	metadata_cache_path_code: INTEGER = 58
	msil_assembly_compatibility_code: INTEGER = 59
	msil_classes_per_module_code: INTEGER = 60
	msil_clr_version_code: INTEGER = 61
	msil_culture_code: INTEGER = 62
	msil_generation_code: INTEGER = 63
	msil_generation_version_code: INTEGER = 64
	msil_key_file_name_code: INTEGER = 65
	msil_use_optimized_precompile_code: INTEGER = 66
	multithreaded_code: INTEGER = 67
	namespace_code: INTEGER = 68
	no_default_lib_code: INTEGER = 69
	old_verbatim_strings_code: INTEGER = 70
	override_cluster_code: INTEGER = 71
	portable_code_generation_code: INTEGER = 72
	precompiled_code: INTEGER = 73
	prefix_option_code: INTEGER = 74
	profile_code: INTEGER = 75
	public_key_token_code: INTEGER = 76
	read_only_code: INTEGER = 77
	recursive_code: INTEGER = 78
	reloads_optimization_code: INTEGER = 79
	shared_library_definition_code: INTEGER = 80
	split_code: INTEGER = 81
	stack_size_code: INTEGER = 82
	storable_code: INTEGER = 83
	storable_filename_code: INTEGER = 84
	strip_option_code: INTEGER = 85
	syntax_code: INTEGER = 86
	target_code: INTEGER = 87
	trace_code: INTEGER = 88
	use_cluster_name_as_namespace_code: INTEGER = 89
	use_full_cluster_name_as_namespace_code: INTEGER = 90
	verbose_code: INTEGER = 91
	version_code: INTEGER = 92
	visible_filename_code: INTEGER = 93
	void_safety_code: INTEGER = 94
	warning_code: INTEGER = 95
	wedit_code: INTEGER = 96

	option_codes: DS_HASH_TABLE [INTEGER, STRING]
			-- Mapping option names -> option codes
		once
			create Result.make_map (96)
			Result.set_key_equality_tester (string_equality_tester)
			Result.put_new (abstract_code, abstract_name)
			Result.put_new (address_expression_code, address_expression_name)
			Result.put_new (arguments_code, arguments_name)
			Result.put_new (array_optimization_code, array_optimization_name)
			Result.put_new (assembly_code, assembly_name)
			Result.put_new (assertion_code, assertion_name)
			Result.put_new (attached_by_default_code, attached_by_default_name)
			Result.put_new (automatic_backup_code, automatic_backup_name)
			Result.put_new (callback_code, callback_name)
			Result.put_new (case_insensitive_code, case_insensitive_name)
			Result.put_new (check_generic_creation_constraint_code, check_generic_creation_constraint_name)
			Result.put_new (check_vape_code, check_vape_name)
			Result.put_new (clean_code, clean_name)
			Result.put_new (cls_compliant_code, cls_compliant_name)
			Result.put_new (component_code, component_name)
			Result.put_new (console_application_code, console_application_name)
			Result.put_new (create_keyword_extension_code, create_keyword_extension_name)
			Result.put_new (culture_code, culture_name)
			Result.put_new (c_compiler_options_code, c_compiler_options_name)
			Result.put_new (dead_code_removal_code, dead_code_removal_name)
			Result.put_new (debug_option_code, debug_option_name)
			Result.put_new (debug_tag_code, debug_tag_name)
			Result.put_new (debugger_code, debugger_name)
			Result.put_new (document_code, document_name)
			Result.put_new (dotnet_naming_convention_code, dotnet_naming_convention_name)
			Result.put_new (dynamic_runtime_code, dynamic_runtime_name)
			Result.put_new (ecf_library_code, ecf_library_name)
			Result.put_new (enforce_unique_class_names_code, enforce_unique_class_names_name)
			Result.put_new (exception_trace_code, exception_trace_name)
			Result.put_new (exclude_code, exclude_name)
			Result.put_new (export_option_code, export_option_name)
			Result.put_new (external_runtime_code, external_runtime_name)
			Result.put_new (finalize_option_code, finalize_option_name)
			Result.put_new (flat_fst_optimization_code, flat_fst_optimization_name)
			Result.put_new (force_32bits_code, force_32bits_name)
			Result.put_new (fst_expansion_factor_code, fst_expansion_factor_name)
			Result.put_new (fst_optimization_code, fst_optimization_name)
			Result.put_new (full_class_checking_code, full_class_checking_name)
			Result.put_new (garbage_collector_code, garbage_collector_name)
			Result.put_new (gc_info_code, gc_info_name)
			Result.put_new (heap_size_code, heap_size_name)
			Result.put_new (header_code, header_name)
			Result.put_new (high_memory_compiler_code, high_memory_compiler_name)
			Result.put_new (il_verifiable_code, il_verifiable_name)
			Result.put_new (include_code, include_name)
			Result.put_new (inlining_code, inlining_name)
			Result.put_new (inlining_size_code, inlining_size_name)
			Result.put_new (jumps_optimization_code, jumps_optimization_name)
			Result.put_new (layout_code, layout_name)
			Result.put_new (layout_optimization_code, layout_optimization_name)
			Result.put_new (leaves_optimization_code, leaves_optimization_name)
			Result.put_new (line_generation_code, line_generation_name)
			Result.put_new (link_code, link_name)
			Result.put_new (linker_code, linker_name)
			Result.put_new (linux_fpu_double_precision_code, linux_fpu_double_precision_name)
			Result.put_new (manifest_string_trace_code, manifest_string_trace_name)
			Result.put_new (map_code, map_name)
			Result.put_new (metadata_cache_path_code, metadata_cache_path_name)
			Result.put_new (msil_assembly_compatibility_code, msil_assembly_compatibility_name)
			Result.put_new (msil_classes_per_module_code, msil_classes_per_module_name)
			Result.put_new (msil_clr_version_code, msil_clr_version_name)
			Result.put_new (msil_culture_code, msil_culture_name)
			Result.put_new (msil_generation_code, msil_generation_name)
			Result.put_new (msil_generation_version_code, msil_generation_version_name)
			Result.put_new (msil_key_file_name_code, msil_key_file_name_name)
			Result.put_new (msil_use_optimized_precompile_code, msil_use_optimized_precompile_name)
			Result.put_new (multithreaded_code, multithreaded_name)
			Result.put_new (namespace_code, namespace_name)
			Result.put_new (no_default_lib_code, no_default_lib_name)
			Result.put_new (old_verbatim_strings_code, old_verbatim_strings_name)
			Result.put_new (override_cluster_code, override_cluster_name)
			Result.put_new (portable_code_generation_code, portable_code_generation_name)
			Result.put_new (precompiled_code, precompiled_name)
			Result.put_new (prefix_option_code, prefix_option_name)
			Result.put_new (profile_code, profile_name)
			Result.put_new (public_key_token_code, public_key_token_name)
			Result.put_new (read_only_code, read_only_name)
			Result.put_new (recursive_code, recursive_name)
			Result.put_new (reloads_optimization_code, reloads_optimization_name)
			Result.put_new (shared_library_definition_code, shared_library_definition_name)
			Result.put_new (split_code, split_name)
			Result.put_new (stack_size_code, stack_size_name)
			Result.put_new (storable_code, storable_name)
			Result.put_new (storable_filename_code, storable_filename_name)
			Result.put_new (strip_option_code, strip_option_name)
			Result.put_new (syntax_code, syntax_name)
			Result.put_new (target_code, target_name)
			Result.put_new (trace_code, trace_name)
			Result.put_new (use_cluster_name_as_namespace_code, use_cluster_name_as_namespace_name)
			Result.put_new (use_full_cluster_name_as_namespace_code, use_full_cluster_name_as_namespace_name)
			Result.put_new (verbose_code, verbose_name)
			Result.put_new (version_code, version_name)
			Result.put_new (visible_filename_code, visible_filename_name)
			Result.put_new (void_safety_code, void_safety_name)
			Result.put_new (warning_code, warning_name)
			Result.put_new (wedit_code, wedit_name)
		ensure
			options_code_not_void: Result /= Void
			no_void_option_name: not Result.has_void
		end

feature -- Option values

	all_value: STRING = "all"
	array_value: STRING = "array"
	auto_value: STRING = "auto"
	boehm_value: STRING = "boehm"
	check_value: STRING = "check"
	class_value: STRING = "class"
	com_value: STRING = "com"
	complete_value: STRING = "complete"
	constant_value: STRING = "constant"
	default_value: STRING = "default"
	dll_value: STRING = "dll"
	ensure_value: STRING = "ensure"
	exe_value: STRING = "exe"
	feature_value: STRING = "feature"
	generate_value: STRING = "generate"
	internal_value: STRING = "internal"
	invariant_value: STRING = "invariant"
	loop_invariant_value: STRING = "loop_invariant"
	loop_variant_value: STRING = "loop_variant"
	low_level_value: STRING = "low_level"
	microsoft_value: STRING = "microsoft"
	no_main_value: STRING = "no_main"
	none_value: STRING = "none"
	obsolete_value: STRING = "obsolete"
	once_value: STRING = "once"
	on_demand_value: STRING = "on_demand"
	require_value: STRING = "require"
	sequential_value: STRING = "sequential"
	standard_value: STRING = "standard"
	style_value: STRING = "style"
	supplier_precondition_value: STRING = "supplier_precondition"
	transitional_value: STRING = "transitional"
	utf8_value: STRING = "utf8"
	winapi_value: STRING = "winapi"

end
