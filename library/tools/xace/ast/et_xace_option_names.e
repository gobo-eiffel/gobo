indexing

	description:

		"Xace option names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_OPTION_NAMES

inherit

	UC_SHARED_STRING_EQUALITY_TESTER

feature -- Option names

	abstract_name: STRING is "abstract"
	address_expression_name: STRING is "address_expression"
	arguments_name: STRING is "arguments"
	array_optimization_name: STRING is "array_optimization"
	assembly_name: STRING is "assembly"
	assertion_name: STRING is "assertion"
	callback_name: STRING is "callback"
	case_insensitive_name: STRING is "case_insensitive"
	check_vape_name: STRING is "check_vape"
	clean_name: STRING is "clean"
	cls_compliant_name: STRING is "cls_compliant"
	component_name: STRING is "component"
	console_application_name: STRING is "console_application"
	create_keyword_extension_name: STRING is "create_keyword_extension"
	culture_name: STRING is "culture"
	c_compiler_options_name: STRING is "c_compiler_options"
	dead_code_removal_name: STRING is "dead_code_removal"
	debug_option_name: STRING is "debug"
	debug_tag_name: STRING is "debug_tag"
	debugger_name: STRING is "debugger"
	document_name: STRING is "document"
	dotnet_naming_convention_name: STRING is "dotnet_naming_convention"
	dynamic_runtime_name: STRING is "dynamic_runtime"
	exception_trace_name: STRING is "exception_trace"
	exclude_name: STRING is "exclude"
	export_option_name: STRING is "export"
	finalize_option_name: STRING is "finalize"
	flat_fst_optimization_name: STRING is "flat_fst_optimization"
	fst_expansion_factor_name: STRING is "fst_expansion_factor"
	fst_optimization_name: STRING is "fst_optimization"
	garbage_collector_name: STRING is "garbage_collector"
	gc_info_name: STRING is "gc_info"
	heap_size_name: STRING is "heap_size"
	header_name: STRING is "header"
	high_memory_compiler_name: STRING is "high_memory_compiler"
	il_verifiable_name: STRING is "il_verifiable"
	include_name: STRING is "include"
	inlining_name: STRING is "inlining"
	inlining_size_name: STRING is "inlining_size"
	jumps_optimization_name: STRING is "jumps_optimization"
	layout_name: STRING is "layout"
	layout_optimization_name: STRING is "layout_optimization"
	leaves_optimization_name: STRING is "leaves_optimization"
	line_generation_name: STRING is "line_generation"
	link_name: STRING is "link"
	linker_name: STRING is "linker"
	linux_fpu_double_precision_name: STRING is "linux_fpu_double_precision"
	manifest_string_trace_name: STRING is "manifest_string_trace"
	map_name: STRING is "map"
	metadata_cache_path_name: STRING is "metadata_cache_path"
	msil_assembly_compatibility_name: STRING is "msil_assembly_compatibility"
	msil_clr_version_name: STRING is "msil_clr_version"
	msil_generation_name: STRING is "msil_generation"
	msil_generation_version_name: STRING is "msil_generation_version"
	multithreaded_name: STRING is "multithreaded"
	namespace_name: STRING is "namespace"
	no_default_lib_name: STRING is "no_default_lib"
	override_cluster_name: STRING is "override_cluster"
	portable_code_generation_name: STRING is "portable_code_generation"
	precompiled_name: STRING is "precompiled"
	prefix_option_name: STRING is "prefix"
	profile_name: STRING is "profile"
	public_key_token_name: STRING is "public_key_token"
	read_only_name: STRING is "read_only"
	recursive_name: STRING is "recursive"
	reloads_optimization_name: STRING is "reloads_optimization"
	shared_library_definition_name: STRING is "shared_library_definition"
	split_name: STRING is "split"
	stack_size_name: STRING is "stack_size"
	storable_name: STRING is "storable"
	storable_filename_name: STRING is "storable_filename"
	strip_option_name: STRING is "strip"
	target_name: STRING is "target"
	trace_name: STRING is "trace"
	use_cluster_name_as_namespace_name: STRING is "use_cluster_name_as_namespace"
	use_full_cluster_name_as_namespace_name: STRING is "use_full_cluster_name_as_namespace"
	verbose_name: STRING is "verbose"
	version_name: STRING is "version"
	visible_filename_name: STRING is "visible_filename"
	warning_name: STRING is "warning"
	wedit_name: STRING is "wedit"

feature -- Option codes

	abstract_code: INTEGER is 1
	address_expression_code: INTEGER is 2
	arguments_code: INTEGER is 3
	array_optimization_code: INTEGER is 4
	assembly_code: INTEGER is 5
	assertion_code: INTEGER is 6
	callback_code: INTEGER is 7
	case_insensitive_code: INTEGER is 8
	check_vape_code: INTEGER is 9
	clean_code: INTEGER is 10
	cls_compliant_code: INTEGER is 11
	component_code: INTEGER is 12
	console_application_code: INTEGER is 13
	create_keyword_extension_code: INTEGER is 14
	culture_code: INTEGER is 15
	c_compiler_options_code: INTEGER is 16
	dead_code_removal_code: INTEGER is 17
	debug_option_code: INTEGER is 18
	debug_tag_code: INTEGER is 19
	debugger_code: INTEGER is 20
	document_code: INTEGER is 21
	dotnet_naming_convention_code: INTEGER is 22
	dynamic_runtime_code: INTEGER is 23
	exception_trace_code: INTEGER is 24
	exclude_code: INTEGER is 25
	export_option_code: INTEGER is 26
	finalize_option_code: INTEGER is 27
	flat_fst_optimization_code: INTEGER is 28
	fst_expansion_factor_code: INTEGER is 29
	fst_optimization_code: INTEGER is 30
	garbage_collector_code: INTEGER is 31
	gc_info_code: INTEGER is 32
	heap_size_code: INTEGER is 33
	header_code: INTEGER is 34
	high_memory_compiler_code: INTEGER is 35
	il_verifiable_code: INTEGER is 36
	include_code: INTEGER is 37
	inlining_code: INTEGER is 38
	inlining_size_code: INTEGER is 39
	jumps_optimization_code: INTEGER is 40
	layout_code: INTEGER is 41
	layout_optimization_code: INTEGER is 42
	leaves_optimization_code: INTEGER is 43
	line_generation_code: INTEGER is 44
	link_code: INTEGER is 45
	linker_code: INTEGER is 46
	linux_fpu_double_precision_code: INTEGER is 47
	manifest_string_trace_code: INTEGER is 48
	map_code: INTEGER is 49
	metadata_cache_path_code: INTEGER is 75
	msil_assembly_compatibility_code: INTEGER is 79
	msil_clr_version_code: INTEGER is 78
	msil_generation_code: INTEGER is 50
	msil_generation_version_code: INTEGER is 81
	multithreaded_code: INTEGER is 51
	namespace_code: INTEGER is 80
	no_default_lib_code: INTEGER is 52
	override_cluster_code: INTEGER is 53
	portable_code_generation_code: INTEGER is 54
	precompiled_code: INTEGER is 55
	prefix_option_code: INTEGER is 56
	profile_code: INTEGER is 57
	public_key_token_code: INTEGER is 58
	read_only_code: INTEGER is 59
	recursive_code: INTEGER is 60
	reloads_optimization_code: INTEGER is 61
	shared_library_definition_code: INTEGER is 62
	split_code: INTEGER is 63
	stack_size_code: INTEGER is 64
	storable_code: INTEGER is 65
	storable_filename_code: INTEGER is 66
	strip_option_code: INTEGER is 67
	target_code: INTEGER is 68
	trace_code: INTEGER is 69
	use_cluster_name_as_namespace_code: INTEGER is 77
	use_full_cluster_name_as_namespace_code: INTEGER is 76
	verbose_code: INTEGER is 70
	version_code: INTEGER is 71
	visible_filename_code: INTEGER is 72
	warning_code: INTEGER is 73
	wedit_code: INTEGER is 74

	option_codes: DS_HASH_TABLE [INTEGER, STRING] is
			-- Mapping option names -> option codes
		once
			create Result.make_map (81)
			Result.set_key_equality_tester (string_equality_tester)
			Result.put_new (abstract_code, abstract_name)
			Result.put_new (address_expression_code, address_expression_name)
			Result.put_new (arguments_code, arguments_name)
			Result.put_new (array_optimization_code, array_optimization_name)
			Result.put_new (assembly_code, assembly_name)
			Result.put_new (assertion_code, assertion_name)
			Result.put_new (callback_code, callback_name)
			Result.put_new (case_insensitive_code, case_insensitive_name)
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
			Result.put_new (exception_trace_code, exception_trace_name)
			Result.put_new (exclude_code, exclude_name)
			Result.put_new (export_option_code, export_option_name)
			Result.put_new (finalize_option_code, finalize_option_name)
			Result.put_new (flat_fst_optimization_code, flat_fst_optimization_name)
			Result.put_new (fst_expansion_factor_code, fst_expansion_factor_name)
			Result.put_new (fst_optimization_code, fst_optimization_name)
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
			Result.put_new (msil_clr_version_code, msil_clr_version_name)
			Result.put_new (msil_generation_code, msil_generation_name)
			Result.put_new (msil_generation_version_code, msil_generation_version_name)
			Result.put_new (multithreaded_code, multithreaded_name)
			Result.put_new (namespace_code, namespace_name)
			Result.put_new (no_default_lib_code, no_default_lib_name)
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
			Result.put_new (target_code, target_name)
			Result.put_new (trace_code, trace_name)
			Result.put_new (use_cluster_name_as_namespace_code, use_cluster_name_as_namespace_name)
			Result.put_new (use_full_cluster_name_as_namespace_code, use_full_cluster_name_as_namespace_name)
			Result.put_new (verbose_code, verbose_name)
			Result.put_new (version_code, version_name)
			Result.put_new (visible_filename_code, visible_filename_name)
			Result.put_new (warning_code, warning_name)
			Result.put_new (wedit_code, wedit_name)
		ensure
			options_code_not_void: Result /= Void
			no_void_option_name: not Result.has (Void)
		end

feature -- Option values

	all_value: STRING is "all"
	array_value: STRING is "array"
	auto_value: STRING is "auto"
	boehm_value: STRING is "boehm"
	check_value: STRING is "check"
	class_value: STRING is "class"
	com_value: STRING is "com"
	constant_value: STRING is "constant"
	default_value: STRING is "default"
	dll_value: STRING is "dll"
	ensure_value: STRING is "ensure"
	exe_value: STRING is "exe"
	feature_value: STRING is "feature"
	generate_value: STRING is "generate"
	internal_value: STRING is "internal"
	invariant_value: STRING is "invariant"
	loop_invariant_value: STRING is "loop_invariant"
	loop_variant_value: STRING is "loop_variant"
	low_level_value: STRING is "low_level"
	microsoft_value: STRING is "microsoft"
	no_main_value: STRING is "no_main"
	none_value: STRING is "none"
	once_value: STRING is "once"
	require_value: STRING is "require"
	sequential_value: STRING is "sequential"
	style_value: STRING is "style"
	utf8_value: STRING is "utf8"
	winapi_value: STRING is "winapi"

end
