indexing

	description:

		"Xace option clauses"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2002, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_OPTIONS

inherit

	ET_SHARED_XACE_OPTION_NAMES

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create a new option clause.
		do
			declared_fst_expansion_factor := -1
			declared_heap_size := -1
			declared_inlining_size := -1
			declared_stack_size := -1
		end

feature -- Status report

	is_abstract_declared: BOOLEAN is
			-- Has 'abstract' option been declared?
		do
			Result := declared_abstract /= Void and then not declared_abstract.is_undefined
		ensure
			definition: Result = (declared_abstract /= Void and then not declared_abstract.is_undefined)
		end

	is_address_expression_declared: BOOLEAN is
			-- Has 'address_expression' option been declared?
		do
			Result := declared_address_expression /= Void and then not declared_address_expression.is_undefined
		ensure
			definition: Result = (declared_address_expression /= Void and then not declared_address_expression.is_undefined)
		end

	is_arguments_declared: BOOLEAN is
			-- Has 'arguments' option been declared?
		do
			Result := declared_arguments /= Void and then not declared_arguments.is_empty
		ensure
			definition: Result = (declared_arguments /= Void and then not declared_arguments.is_empty)
		end

	is_array_optimization_declared: BOOLEAN is
			-- Has 'array_optimization' option been declared?
		do
			Result := declared_array_optimization /= Void and then not declared_array_optimization.is_undefined
		ensure
			definition: Result = (declared_array_optimization /= Void and then not declared_array_optimization.is_undefined)
		end

	is_assertion_declared: BOOLEAN is
			-- Has 'assertion' option been declared?
		do
			Result := declared_assertion /= Void and then not declared_assertion.is_empty
		ensure
			definition: Result = (declared_assertion /= Void and then not declared_assertion.is_empty)
		end

	is_case_insensitive_declared: BOOLEAN is
			-- Has 'case_insensitive' option been declared?
		do
			Result := declared_case_insensitive /= Void and then not declared_case_insensitive.is_undefined
		ensure
			definition: Result = (declared_case_insensitive /= Void and then not declared_case_insensitive.is_undefined)
		end

	is_check_vape_declared: BOOLEAN is
			-- Has 'check_vape' option been declared?
		do
			Result := declared_check_vape /= Void and then not declared_check_vape.is_undefined
		ensure
			definition: Result = (declared_check_vape /= Void and then not declared_check_vape.is_undefined)
		end

	is_clean_declared: BOOLEAN is
			-- Has 'clean' option been declared?
		do
			Result := declared_clean /= Void and then not declared_clean.is_undefined
		ensure
			definition: Result = (declared_clean /= Void and then not declared_clean.is_undefined)
		end

	is_component_declared: BOOLEAN is
			-- Has 'component' option been declared?
		do
			Result := declared_component /= Void
		ensure
			definition: Result = (declared_component /= Void)
		end

	is_console_application_declared: BOOLEAN is
			-- Has 'console_application' option been declared?
		do
			Result := declared_console_application /= Void and then not declared_console_application.is_undefined
		ensure
			definition: Result = (declared_console_application /= Void and then not declared_console_application.is_undefined)
		end

	is_create_keyword_extension_declared: BOOLEAN is
			-- Has 'create_keyword_extension' option been declared?
		do
			Result := declared_create_keyword_extension /= Void and then not declared_create_keyword_extension.is_undefined
		ensure
			definition: Result = (declared_create_keyword_extension /= Void and then not declared_create_keyword_extension.is_undefined)
		end

	is_dead_code_removal_declared: BOOLEAN is
			-- Has 'dead_code_removal' option been declared?
		do
			Result := declared_dead_code_removal /= Void and then not declared_dead_code_removal.is_empty
		ensure
			definition: Result = (declared_dead_code_removal /= Void and then not declared_dead_code_removal.is_empty)
		end

	is_debug_option_declared: BOOLEAN is
			-- Has 'debug' option been declared?
		do
			Result := declared_debug_option /= Void and then not declared_debug_option.is_undefined
		ensure
			definition: Result = (declared_debug_option /= Void and then not declared_debug_option.is_undefined)
		end

	is_debug_tag_declared: BOOLEAN is
			-- Has 'debug_tag' option been declared?
		do
			Result := declared_debug_tag /= Void and then not declared_debug_tag.is_empty
		ensure
			definition: Result = (declared_debug_tag /= Void and then not declared_debug_tag.is_empty)
		end

	is_debugger_declared: BOOLEAN is
			-- Has 'debugger' option been declared?
		do
			Result := declared_debugger /= Void and then not declared_debugger.is_undefined
		ensure
			definition: Result = (declared_debugger /= Void and then not declared_debugger.is_undefined)
		end

	is_document_declared: BOOLEAN is
			-- Has 'document' option been declared?
		do
			Result := declared_document /= Void
		ensure
			definition: Result = (declared_document /= Void)
		end

	is_dynamic_runtime_declared: BOOLEAN is
			-- Has 'dynamic_runtime' option been declared?
		do
			Result := declared_dynamic_runtime /= Void and then not declared_dynamic_runtime.is_undefined
		ensure
			definition: Result = (declared_dynamic_runtime /= Void and then not declared_dynamic_runtime.is_undefined)
		end

	is_exception_trace_declared: BOOLEAN is
			-- Has 'exception_trace' option been declared?
		do
			Result := declared_exception_trace /= Void and then not declared_exception_trace.is_undefined
		ensure
			definition: Result = (declared_exception_trace /= Void and then not declared_exception_trace.is_undefined)
		end

	is_exclude_declared: BOOLEAN is
			-- Has 'exclude' option been declared?
		do
			Result := declared_exclude /= Void and then not declared_exclude.is_empty
		ensure
			definition: Result = (declared_exclude /= Void and then not declared_exclude.is_empty)
		end

	is_export_option_declared: BOOLEAN is
			-- Has 'export' option been declared?
		do
			Result := declared_export_option /= Void
		ensure
			definition: Result = (declared_export_option /= Void)
		end

	is_finalize_declared: BOOLEAN is
			-- Has 'finalize' option been declared?
		do
			Result := declared_finalize /= Void and then not declared_finalize.is_undefined
		ensure
			definition: Result = (declared_finalize /= Void and then not declared_finalize.is_undefined)
		end

	is_flat_fst_optimization_declared: BOOLEAN is
			-- Has 'flat_fst_optimization' option been declared?
		do
			Result := declared_flat_fst_optimization /= Void and then not declared_flat_fst_optimization.is_undefined
		ensure
			definition: Result = (declared_flat_fst_optimization /= Void and then not declared_flat_fst_optimization.is_undefined)
		end

	is_fst_expansion_factor_declared: BOOLEAN is
			-- Has 'fst_expansion_factor' option been declared?
		do
			Result := declared_fst_expansion_factor >= 0
		ensure
			definition: Result = (declared_fst_expansion_factor >= 0)
		end

	is_fst_optimization_declared: BOOLEAN is
			-- Has 'fst_optimization' option been declared?
		do
			Result := declared_fst_optimization /= Void and then not declared_fst_optimization.is_undefined
		ensure
			definition: Result = (declared_fst_optimization /= Void and then not declared_fst_optimization.is_undefined)
		end

	is_garbage_collector_declared: BOOLEAN is
			-- Has 'garbage_collector' option been declared?
		do
			Result := declared_garbage_collector /= Void
		ensure
			definition: Result = (declared_garbage_collector /= Void)
		end

	is_gc_info_declared: BOOLEAN is
			-- Has 'gc_info' option been declared?
		do
			Result := declared_gc_info /= Void and then not declared_gc_info.is_undefined
		ensure
			definition: Result = (declared_gc_info /= Void and then not declared_gc_info.is_undefined)
		end

	is_heap_size_declared: BOOLEAN is
			-- Has 'heap_size' option been declared?
		do
			Result := declared_heap_size >= 0
		ensure
			definition: Result = (declared_heap_size >= 0)
		end

	is_header_declared: BOOLEAN is
			-- Has 'header' option been declared?
		do
			Result := declared_header /= Void and then not declared_header.is_empty
		ensure
			definition: Result = (declared_header /= Void and then not declared_header.is_empty)
		end

	is_high_memory_compiler_declared: BOOLEAN is
			-- Has 'high_memory_compiler' option been declared?
		do
			Result := declared_high_memory_compiler /= Void and then not declared_high_memory_compiler.is_undefined
		ensure
			definition: Result = (declared_high_memory_compiler /= Void and then not declared_high_memory_compiler.is_undefined)
		end

	is_include_declared: BOOLEAN is
			-- Has 'include' option been declared?
		do
			Result := declared_include /= Void and then not declared_include.is_empty
		ensure
			definition: Result = (declared_include /= Void and then not declared_include.is_empty)
		end

	is_inlining_declared: BOOLEAN is
			-- Has 'inlining' option been declared?
		do
			Result := declared_inlining /= Void and then not declared_inlining.is_empty
		ensure
			definition: Result = (declared_inlining /= Void and then not declared_inlining.is_empty)
		end

	is_inlining_size_declared: BOOLEAN is
			-- Has 'inlining_size' option been declared?
		do
			Result := declared_inlining_size >= 0
		ensure
			definition: Result = (declared_inlining_size >= 0)
		end

	is_jumps_optimization_declared: BOOLEAN is
			-- Has 'jumps_optimization' option been declared?
		do
			Result := declared_jumps_optimization /= Void and then not declared_jumps_optimization.is_undefined
		ensure
			definition: Result = (declared_jumps_optimization /= Void and then not declared_jumps_optimization.is_undefined)
		end

	is_layout_optimization_declared: BOOLEAN is
			-- Has 'layout_optimization' option been declared?
		do
			Result := declared_layout_optimization /= Void and then not declared_layout_optimization.is_undefined
		ensure
			definition: Result = (declared_layout_optimization /= Void and then not declared_layout_optimization.is_undefined)
		end

	is_leaves_optimization_declared: BOOLEAN is
			-- Has 'leaves_optimization' option been declared?
		do
			Result := declared_leaves_optimization /= Void and then not declared_leaves_optimization.is_undefined
		ensure
			definition: Result = (declared_leaves_optimization /= Void and then not declared_leaves_optimization.is_undefined)
		end

	is_line_generation_declared: BOOLEAN is
			-- Has 'line_generation' option been declared?
		do
			Result := declared_line_generation /= Void and then not declared_line_generation.is_undefined
		ensure
			definition: Result = (declared_line_generation /= Void and then not declared_line_generation.is_undefined)
		end

	is_link_declared: BOOLEAN is
			-- Has 'link' option been declared?
		do
			Result := declared_link /= Void and then not declared_link.is_empty
		ensure
			definition: Result = (declared_link /= Void and then not declared_link.is_empty)
		end

	is_linker_declared: BOOLEAN is
			-- Has 'linker' option been declared?
		do
			Result := declared_linker /= Void
		ensure
			definition: Result = (declared_linker /= Void)
		end

	is_linux_fpu_double_precision_declared: BOOLEAN is
			-- Has 'linux_fpu_double_precision' option been declared?
		do
			Result := declared_linux_fpu_double_precision /= Void and then not declared_linux_fpu_double_precision.is_undefined
		ensure
			definition: Result = (declared_linux_fpu_double_precision /= Void and then not declared_linux_fpu_double_precision.is_undefined)
		end

	is_manifest_string_trace_declared: BOOLEAN is
			-- Has 'manifest_string_trace' option been declared?
		do
			Result := declared_manifest_string_trace /= Void and then not declared_manifest_string_trace.is_undefined
		ensure
			definition: Result = (declared_manifest_string_trace /= Void and then not declared_manifest_string_trace.is_undefined)
		end

	is_map_declared: BOOLEAN is
			-- Has 'map' option been declared?
		do
			Result := declared_map /= Void and then not declared_map.is_undefined
		ensure
			definition: Result = (declared_map /= Void and then not declared_map.is_undefined)
		end

	is_multithreaded_declared: BOOLEAN is
			-- Has 'multithreaded' option been declared?
		do
			Result := declared_multithreaded /= Void and then not declared_multithreaded.is_undefined
		ensure
			definition: Result = (declared_multithreaded /= Void and then not declared_multithreaded.is_undefined)
		end

	is_no_default_lib_declared: BOOLEAN is
			-- Has 'no_default_lib' option been declared?
		do
			Result := declared_no_default_lib /= Void and then not declared_no_default_lib.is_undefined
		ensure
			definition: Result = (declared_no_default_lib /= Void and then not declared_no_default_lib.is_undefined)
		end

	is_override_cluster_declared: BOOLEAN is
			-- Has 'override_cluster' option been declared?
		do
			Result := declared_override_cluster /= Void
		ensure
			definition: Result = (declared_override_cluster /= Void)
		end

	is_portable_code_generation_declared: BOOLEAN is
			-- Has 'portable_code_generation' option been declared?
		do
			Result := declared_portable_code_generation /= Void and then not declared_portable_code_generation.is_undefined
		ensure
			definition: Result = (declared_portable_code_generation /= Void and then not declared_portable_code_generation.is_undefined)
		end

	is_precompiled_declared: BOOLEAN is
			-- Has 'precompiled' option been declared?
		do
			Result := declared_precompiled /= Void
		ensure
			definition: Result = (declared_precompiled /= Void)
		end

	is_profile_declared: BOOLEAN is
			-- Has 'profile' option been declared?
		do
			Result := declared_profile /= Void and then not declared_profile.is_undefined
		ensure
			definition: Result = (declared_profile /= Void and then not declared_profile.is_undefined)
		end

	is_reloads_optimization_declared: BOOLEAN is
			-- Has 'reloads_optimization' option been declared?
		do
			Result := declared_reloads_optimization /= Void and then not declared_reloads_optimization.is_undefined
		ensure
			definition: Result = (declared_reloads_optimization /= Void and then not declared_reloads_optimization.is_undefined)
		end

	is_recursive_declared: BOOLEAN is
			-- Has 'recursive' option been declared?
		do
			Result := declared_recursive /= Void and then not declared_recursive.is_undefined
		ensure
			definition: Result = (declared_recursive /= Void and then not declared_recursive.is_undefined)
		end

	is_shared_library_definition_declared: BOOLEAN is
			-- Has 'shared_library_definition' option been declared?
		do
			Result := declared_shared_library_definition /= Void
		ensure
			definition: Result = (declared_shared_library_definition /= Void)
		end

	is_split_declared: BOOLEAN is
			-- Has 'split' option been declared?
		do
			Result := declared_split /= Void and then not declared_split.is_undefined
		ensure
			definition: Result = (declared_split /= Void and then not declared_split.is_undefined)
		end

	is_stack_size_declared: BOOLEAN is
			-- Has 'stack_size' option been declared?
		do
			Result := declared_stack_size >= 0
		ensure
			definition: Result = (declared_stack_size >= 0)
		end

	is_storable_declared: BOOLEAN is
			-- Has 'storable' option been declared?
		do
			Result := declared_storable /= Void and then not declared_storable.is_undefined
		ensure
			definition: Result = (declared_storable /= Void and then not declared_storable.is_undefined)
		end

	is_storable_filename_declared: BOOLEAN is
			-- Has 'storable_filename' option been declared?
		do
			Result := declared_storable_filename /= Void
		ensure
			definition: Result = (declared_storable_filename /= Void)
		end

	is_strip_option_declared: BOOLEAN is
			-- Has 'strip' option been declared?
		do
			Result := declared_strip_option /= Void and then not declared_strip_option.is_undefined
		ensure
			definition: Result = (declared_strip_option /= Void and then not declared_strip_option.is_undefined)
		end

	is_target_declared: BOOLEAN is
			-- Has 'target' option been declared?
		do
			Result := declared_target /= Void
		ensure
			definition: Result = (declared_target /= Void)
		end

	is_trace_declared: BOOLEAN is
			-- Has 'trace' option been declared?
		do
			Result := declared_trace /= Void and then not declared_trace.is_undefined
		ensure
			definition: Result = (declared_trace /= Void and then not declared_trace.is_undefined)
		end

	is_verbose_declared: BOOLEAN is
			-- Has 'verbose' option been declared?
		do
			Result := declared_verbose /= Void and then not declared_verbose.is_undefined
		ensure
			definition: Result = (declared_verbose /= Void and then not declared_verbose.is_undefined)
		end

	is_visible_filename_declared: BOOLEAN is
			-- Has 'visible_filename' option been declared?
		do
			Result := declared_visible_filename /= Void
		ensure
			definition: Result = (declared_visible_filename /= Void)
		end

	is_warning_declared: BOOLEAN is
			-- Has 'warning' option been declared?
		do
			Result := declared_warning /= Void
		ensure
			definition: Result = (declared_warning /= Void)
		end

	is_wedit_declared: BOOLEAN is
			-- Has 'wedit' option been declared?
		do
			Result := declared_wedit /= Void and then not declared_wedit.is_undefined
		ensure
			definition: Result = (declared_wedit /= Void and then not declared_wedit.is_undefined)
		end

feature -- Option values

	abstract: BOOLEAN is
			-- 'abstract' option
		do
			if is_abstract_declared then
				Result := declared_abstract.is_true
			else
				Result := default_abstract
			end
		end

	address_expression: BOOLEAN is
			-- 'address_expression' option
		do
			if is_address_expression_declared then
				Result := declared_address_expression.is_true
			else
				Result := default_address_expression
			end
		end

	array_optimization: BOOLEAN is
			-- Is 'array_optimization' option enabled?
		do
			if is_array_optimization_declared then
				Result := declared_array_optimization.is_true
			else
				Result := default_array_optimization
			end
		end

	arguments: DS_HASH_SET [STRING] is
			-- 'arguments' option
		do
			if is_arguments_declared then
				Result := declared_arguments
			else
				Result := default_arguments
			end
		ensure
			arguments_not_void: Result /= Void
			no_void_argument: not Result.has (Void)
		end

	assertion: DS_HASH_SET [STRING] is
			-- 'assertion' option
		do
			if is_assertion_declared then
				Result := declared_assertion
			else
				Result := default_assertion
			end
		ensure
			assertion_not_void: Result /= Void
			-- valid_value: forall v in Result, valid_assertion.has (v)
		end

	case_insensitive: BOOLEAN is
			-- 'case_insensitive' option
		do
			if is_case_insensitive_declared then
				Result := declared_case_insensitive.is_true
			else
				Result := default_case_insensitive
			end
		end

	check_vape: BOOLEAN is
			-- 'check_vape' option
		do
			if is_check_vape_declared then
				Result := declared_check_vape.is_true
			else
				Result := default_check_vape
			end
		end

	clean: BOOLEAN is
			-- 'clean' option
		do
			if is_clean_declared then
				Result := declared_clean.is_true
			else
				Result := default_clean
			end
		end

	component: STRING is
			-- 'component' option
		do
			if is_component_declared then
				Result := declared_component
			else
				Result := default_component
			end
		end

	console_application: BOOLEAN is
			-- 'console_application' option
		do
			if is_console_application_declared then
				Result := declared_console_application.is_true
			else
				Result := default_console_application
			end
		end

	create_keyword_extension: BOOLEAN is
			-- 'create_keyword_extension' option
		do
			if is_create_keyword_extension_declared then
				Result := declared_create_keyword_extension.is_true
			else
				Result := default_create_keyword_extension
			end
		end

	dead_code_removal: DS_HASH_SET [STRING] is
			-- 'dead_code_removal' option
		do
			if is_dead_code_removal_declared then
				Result := declared_dead_code_removal
			else
				Result := default_dead_code_removal
			end
		ensure
			dead_code_removal_not_void: Result /= Void
			-- valid_value: forall v in Result, valid_dead_code_removal.has (v)
		end

	debug_option: BOOLEAN is
			-- 'debug' option
		do
			if is_debug_option_declared then
				Result := declared_debug_option.is_true
			else
				Result := default_debug_option
			end
		end

	debug_tag: DS_HASH_SET [STRING] is
			-- 'debug_tag' option
		do
			if is_debug_tag_declared then
				Result := declared_debug_tag
			else
				Result := default_debug_tag
			end
		ensure
			debug_tag_not_void: Result /= Void
			no_void_debug_tag: not Result.has (Void)
		end

	debugger: BOOLEAN is
			-- 'debugger' option
		do
			if is_debugger_declared then
				Result := declared_debugger.is_true
			else
				Result := default_debugger
			end
		end

	document: STRING is
			-- 'document' option
		do
			if is_document_declared then
				Result := declared_document
			else
				Result := default_document
			end
		end

	dynamic_runtime: BOOLEAN is
			-- 'dynamic_runtime' option
		do
			if is_dynamic_runtime_declared then
				Result := declared_dynamic_runtime.is_true
			else
				Result := default_dynamic_runtime
			end
		end

	exception_trace: BOOLEAN is
			-- 'exception_trace' option
		do
			if is_exception_trace_declared then
				Result := declared_exception_trace.is_true
			else
				Result := default_exception_trace
			end
		end

	exclude: DS_HASH_SET [STRING] is
			-- 'exclude' option
		do
			if is_exclude_declared then
				Result := declared_exclude
			else
				Result := default_exclude
			end
		ensure
			exclude_not_void: Result /= Void
			no_void_exclude: not Result.has (Void)
		end

	export_option: STRING is
			-- 'export' option
		do
			if is_export_option_declared then
				Result := declared_export_option
			else
				Result := default_export_option
			end
		end

	finalize: BOOLEAN is
			-- 'finalize' option
		do
			if is_finalize_declared then
				Result := declared_finalize.is_true
			else
				Result := default_finalize
			end
		end

	flat_fst_optimization: BOOLEAN is
			-- 'flat_fst_optimization' option
		do
			if is_flat_fst_optimization_declared then
				Result := declared_flat_fst_optimization.is_true
			else
				Result := default_flat_fst_optimization
			end
		end

	fst_expansion_factor: INTEGER is
			-- 'fst_expansion_factor' option
		do
			if is_fst_expansion_factor_declared then
				Result := declared_fst_expansion_factor
			else
				Result := default_fst_expansion_factor
			end
		ensure
			fst_expansion_factor_positive: Result >= 0
		end

	fst_optimization: BOOLEAN is
			-- 'fst_optimization' option
		do
			if is_fst_optimization_declared then
				Result := declared_fst_optimization.is_true
			else
				Result := default_fst_optimization
			end
		end

	garbage_collector: STRING is
			-- 'garbage_collector' option
		do
			if is_garbage_collector_declared then
				Result := declared_garbage_collector
			else
				Result := default_garbage_collector
			end
		ensure
			valid_garbage_collector: valid_garbage_collector.has (Result)
		end

	gc_info: BOOLEAN is
			-- 'gc_info' option
		do
			if is_gc_info_declared then
				Result := declared_gc_info.is_true
			else
				Result := default_gc_info
			end
		end

	heap_size: INTEGER is
			-- 'heap_size' option
		do
			if is_heap_size_declared then
				Result := declared_heap_size
			else
				Result := default_heap_size
			end
		end

	header: DS_HASH_SET [STRING] is
			-- 'header' option
		do
			if is_header_declared then
				Result := declared_header
			else
				Result := default_header
			end
		ensure
			header_not_void: Result /= Void
			no_void_header: not Result.has (Void)
		end

	high_memory_compiler: BOOLEAN is
			-- 'high_memory_compiler' option
		do
			if is_high_memory_compiler_declared then
				Result := declared_high_memory_compiler.is_true
			else
				Result := default_high_memory_compiler
			end
		end

	include: DS_HASH_SET [STRING] is
			-- 'include' option
		do
			if is_include_declared then
				Result := declared_include
			else
				Result := default_include
			end
		ensure
			include_not_void: Result /= Void
			no_void_include: not Result.has (Void)
		end

	inlining: DS_HASH_SET [STRING] is
			-- 'inlining' option
		do
			if is_inlining_declared then
				Result := declared_inlining
			else
				Result := default_inlining
			end
		ensure
			inlining_not_void: Result /= Void
			-- valid_value: forall v in Result, valid_inlining.has (v)
		end

	inlining_size: INTEGER is
			-- 'inlining_size' option
		do
			if is_inlining_size_declared then
				Result := declared_inlining_size
			else
				Result := default_inlining_size
			end
		ensure
			inlining_size_positive: Result >= 0
		end

	jumps_optimization: BOOLEAN is
			-- 'jumps_optimization' option
		do
			if is_jumps_optimization_declared then
				Result := declared_jumps_optimization.is_true
			else
				Result := default_jumps_optimization
			end
		end

	layout_optimization: BOOLEAN is
			-- 'layout_optimization' option
		do
			if is_layout_optimization_declared then
				Result := declared_layout_optimization.is_true
			else
				Result := default_layout_optimization
			end
		end

	leaves_optimization: BOOLEAN is
			-- 'leaves_optimization' option
		do
			if is_leaves_optimization_declared then
				Result := declared_leaves_optimization.is_true
			else
				Result := default_leaves_optimization
			end
		end

	line_generation: BOOLEAN is
			-- 'line_generation' option
		do
			if is_line_generation_declared then
				Result := declared_line_generation.is_true
			else
				Result := default_line_generation
			end
		end

	link: DS_HASH_SET [STRING] is
			-- 'link' option
		do
			if is_link_declared then
				Result := declared_link
			else
				Result := default_link
			end
		ensure
			link_not_void: Result /= Void
			no_void_link: not Result.has (Void)
		end

	linker: STRING is
			-- 'linker' option
		do
			if is_linker_declared then
				Result := declared_linker
			else
				Result := default_linker
			end
		ensure
			valid_linker: valid_linker.has (Result)
		end

	linux_fpu_double_precision: BOOLEAN is
			-- 'linux_fpu_double_precision' option
		do
			if is_linux_fpu_double_precision_declared then
				Result := declared_linux_fpu_double_precision.is_true
			else
				Result := default_linux_fpu_double_precision
			end
		end

	manifest_string_trace: BOOLEAN is
			-- 'manifest_string_trace' option
		do
			if is_manifest_string_trace_declared then
				Result := declared_manifest_string_trace.is_true
			else
				Result := default_manifest_string_trace
			end
		end

	map: BOOLEAN is
			-- 'map' option
		do
			if is_map_declared then
				Result := declared_map.is_true
			else
				Result := default_map
			end
		end

	multithreaded: BOOLEAN is
			-- 'multithreaded' option
		do
			if is_multithreaded_declared then
				Result := declared_multithreaded.is_true
			else
				Result := default_multithreaded
			end
		end

	no_default_lib: BOOLEAN is
			-- 'no_default_lib' option
		do
			if is_no_default_lib_declared then
				Result := declared_no_default_lib.is_true
			else
				Result := default_no_default_lib
			end
		end

	override_cluster: STRING is
			-- 'override_cluster' option
		do
			if is_override_cluster_declared then
				Result := declared_override_cluster
			else
				Result := default_override_cluster
			end
		end

	portable_code_generation: BOOLEAN is
			-- 'portable_code_generation' option
		do
			if is_portable_code_generation_declared then
				Result := declared_portable_code_generation.is_true
			else
				Result := default_portable_code_generation
			end
		end

	precompiled: STRING is
			-- 'precompiled' option
		do
			if is_precompiled_declared then
				Result := declared_precompiled
			else
				Result := default_precompiled
			end
		end

	profile: BOOLEAN is
			-- 'profile' option
		do
			if is_profile_declared then
				Result := declared_profile.is_true
			else
				Result := default_profile
			end
		end

	recursive: BOOLEAN is
			-- 'recursive' option
		do
			if is_recursive_declared then
				Result := declared_recursive.is_true
			else
				Result := default_recursive
			end
		end

	reloads_optimization: BOOLEAN is
			-- 'reloads_optimization' option
		do
			if is_reloads_optimization_declared then
				Result := declared_reloads_optimization.is_true
			else
				Result := default_reloads_optimization
			end
		end

	shared_library_definition: STRING is
			-- 'shared_library_definition' option
		do
			if is_shared_library_definition_declared then
				Result := declared_shared_library_definition
			else
				Result := default_shared_library_definition
			end
		end

	split: BOOLEAN is
			-- 'split' option
		do
			if is_split_declared then
				Result := declared_split.is_true
			else
				Result := default_split
			end
		end

	stack_size: INTEGER is
			-- 'stack_size' option
		do
			if is_stack_size_declared then
				Result := declared_stack_size
			else
				Result := default_stack_size
			end
		end

	storable: BOOLEAN is
			-- 'storable' option
		do
			if is_storable_declared then
				Result := declared_storable.is_true
			else
				Result := default_storable
			end
		end

	storable_filename: STRING is
			-- 'storable_filename' option
		do
			if is_storable_filename_declared then
				Result := declared_storable_filename
			else
				Result := default_storable_filename
			end
		end

	strip_option: BOOLEAN is
			-- 'strip' option
		do
			if is_strip_option_declared then
				Result := declared_strip_option.is_true
			else
				Result := default_strip_option
			end
		end

	target: STRING is
			-- 'target' option
		do
			if is_target_declared then
				Result := declared_target
			else
				Result := default_target
			end
		ensure
			valid_target: valid_target.has (Result)
		end

	trace: BOOLEAN is
			-- 'trace' option
		do
			if is_trace_declared then
				Result := declared_trace.is_true
			else
				Result := default_trace
			end
		end

	verbose: BOOLEAN is
			-- 'verbose' option
		do
			if is_verbose_declared then
				Result := declared_verbose.is_true
			else
				Result := default_verbose
			end
		end

	visible_filename: STRING is
			-- 'visible_filename' option
		do
			if is_visible_filename_declared then
				Result := declared_visible_filename
			else
				Result := default_visible_filename
			end
		end

	warning: STRING is
			-- 'warning' option
		do
			if is_warning_declared then
				Result := declared_warning
			else
				Result := default_warning
			end
		ensure
			valid_warning: valid_warning.has (Result)
		end

	wedit: BOOLEAN is
			-- 'wedit' option
		do
			if is_wedit_declared then
				Result := declared_wedit.is_true
			else
				Result := default_wedit
			end
		end

feature -- Status setting

	set_abstract (b: BOOLEAN) is
			-- Set `abstract' to `b'.
		do
			if declared_abstract = Void then
				!! declared_abstract.make_undefined
			end
			if b then
				declared_abstract.set_true
			else
				declared_abstract.set_false
			end
		ensure
			abstract_declared: is_abstract_declared
			abstract_set: abstract = b
		end

	set_address_expression (b: BOOLEAN) is
			-- Set `address_expression' to `b'.
		do
			if declared_address_expression = Void then
				!! declared_address_expression.make_undefined
			end
			if b then
				declared_address_expression.set_true
			else
				declared_address_expression.set_false
			end
		ensure
			address_expression_declared: is_address_expression_declared
			address_expression_set: address_expression = b
		end

	set_arguments (a_value: STRING) is
			-- Set `arguments' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		do
			if declared_arguments = Void then
				!! declared_arguments.make_equal (10)
			end
			declared_arguments.force_last (a_value)
		ensure
			arguments_declared: is_arguments_declared
			arguments_set: arguments.has (a_value)
		end

	set_array_optimization (b: BOOLEAN) is
			-- Set `array_optimization' to `b'.
		do
			if declared_array_optimization = Void then
				!! declared_array_optimization.make_undefined
			end
			if b then
				declared_array_optimization.set_true
			else
				declared_array_optimization.set_false
			end
		ensure
			array_optimization_declared: is_array_optimization_declared
			array_optimization_set: array_optimization = b
		end

	set_assertion (a_value: STRING) is
			-- Set `assertion' to `a_value'.
		require
			a_value_valid: valid_assertion.has (a_value)
		do
			if declared_assertion = Void then
				!! declared_assertion.make_equal (valid_assertion.count)
			end
			declared_assertion.force_last (a_value)
		ensure
			assertion_declared: is_assertion_declared
			assertion_set: assertion.has (a_value)
		end

	set_case_insensitive (b: BOOLEAN) is
			-- Set `case_insensitive' to `b'.
		do
			if declared_case_insensitive = Void then
				!! declared_case_insensitive.make_undefined
			end
			if b then
				declared_case_insensitive.set_true
			else
				declared_case_insensitive.set_false
			end
		ensure
			case_insensitive_declared: is_case_insensitive_declared
			case_insensitive_set: case_insensitive = b
		end

	set_check_vape (b: BOOLEAN) is
			-- Set `check_vape' to `b'.
		do
			if declared_check_vape = Void then
				!! declared_check_vape.make_undefined
			end
			if b then
				declared_check_vape.set_true
			else
				declared_check_vape.set_false
			end
		ensure
			check_vape_declared: is_check_vape_declared
			check_vape_set: check_vape = b
		end

	set_clean (b: BOOLEAN) is
			-- Set `clean' to `b'.
		do
			if declared_clean = Void then
				!! declared_clean.make_undefined
			end
			if b then
				declared_clean.set_true
			else
				declared_clean.set_false
			end
		ensure
			clean_declared: is_clean_declared
			clean_set: clean = b
		end

	set_component (a_value: STRING) is
			-- Set `component' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		do
			declared_component := a_value
		ensure
			component_declared: is_component_declared
			component_set: component = a_value
		end

	set_console_application (b: BOOLEAN) is
			-- Set `console_application' to `b'.
		do
			if declared_console_application = Void then
				!! declared_console_application.make_undefined
			end
			if b then
				declared_console_application.set_true
			else
				declared_console_application.set_false
			end
		ensure
			console_application_declared: is_console_application_declared
			console_application_set: console_application = b
		end

	set_create_keyword_extension (b: BOOLEAN) is
			-- Set `create_keyword_extension' to `b'.
		do
			if declared_create_keyword_extension = Void then
				!! declared_create_keyword_extension.make_undefined
			end
			if b then
				declared_create_keyword_extension.set_true
			else
				declared_create_keyword_extension.set_false
			end
		ensure
			create_keyword_extension_declared: is_create_keyword_extension_declared
			create_keyword_extension_set: create_keyword_extension = b
		end

	set_dead_code_removal (a_value: STRING) is
			-- Set `dead_code_removal' to `a_value'.
		require
			a_value_not_void: a_value /= Void
			a_value_valid: valid_dead_code_removal.has (a_value)
		do
			if declared_dead_code_removal = Void then
				!! declared_dead_code_removal.make_equal (valid_dead_code_removal.count)
			end
			declared_dead_code_removal.force_last (a_value)
		ensure
			dead_code_removal_declared: is_dead_code_removal_declared
			dead_code_removal_set: dead_code_removal.has (a_value)
		end

	set_debug_option (b: BOOLEAN) is
			-- Set `debug_option' to `b'.
		do
			if declared_debug_option = Void then
				!! declared_debug_option.make_undefined
			end
			if b then
				declared_debug_option.set_true
			else
				declared_debug_option.set_false
			end
		ensure
			debug_option_declared: is_debug_option_declared
			debug_option_set: debug_option = b
		end

	set_debug_tag (a_value: STRING) is
			-- Set `debug_tag' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		do
			if declared_debug_tag = Void then
				!! declared_debug_tag.make_equal (10)
			end
			declared_debug_tag.force_last (a_value)
		ensure
			debug_tag_declared: is_debug_tag_declared
			debug_tag_set: debug_tag.has (a_value)
		end

	set_debugger (b: BOOLEAN) is
			-- Set `debugger' to `b'.
		do
			if declared_debugger = Void then
				!! declared_debugger.make_undefined
			end
			if b then
				declared_debugger.set_true
			else
				declared_debugger.set_false
			end
		ensure
			debugger_declared: is_debugger_declared
			debugger_set: debugger = b
		end

	set_document (a_value: STRING) is
			-- Set `document' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		do
			declared_document := a_value
		ensure
			document_declared: is_document_declared
			document_set: document = a_value
		end

	set_dynamic_runtime (b: BOOLEAN) is
			-- Set `dynamic_runtime' to `b'.
		do
			if declared_dynamic_runtime = Void then
				!! declared_dynamic_runtime.make_undefined
			end
			if b then
				declared_dynamic_runtime.set_true
			else
				declared_dynamic_runtime.set_false
			end
		ensure
			dynamic_runtime_declared: is_dynamic_runtime_declared
			dynamic_runtime_set: dynamic_runtime = b
		end

	set_exception_trace (b: BOOLEAN) is
			-- Set `exception_trace' to `b'.
		do
			if declared_exception_trace = Void then
				!! declared_exception_trace.make_undefined
			end
			if b then
				declared_exception_trace.set_true
			else
				declared_exception_trace.set_false
			end
		ensure
			exception_trace_declared: is_exception_trace_declared
			exception_trace_set: exception_trace = b
		end

	set_exclude (a_value: STRING) is
			-- Set `exclude' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		do
			if declared_exclude = Void then
				!! declared_exclude.make_equal (10)
			end
			declared_exclude.force_last (a_value)
		ensure
			exclude_declared: is_exclude_declared
			exclude_set: exclude.has (a_value)
		end

	set_export_option (a_value: STRING) is
			-- Set `export_option' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		do
			declared_export_option := a_value
		ensure
			export_option_declared: is_export_option_declared
			export_option_set: export_option = a_value
		end

	set_finalize (b: BOOLEAN) is
			-- Set `finalize' to `b'.
		do
			if declared_finalize = Void then
				!! declared_finalize.make_undefined
			end
			if b then
				declared_finalize.set_true
			else
				declared_finalize.set_false
			end
		ensure
			finalize_declared: is_finalize_declared
			finalize_set: finalize = b
		end

	set_flat_fst_optimization (b: BOOLEAN) is
			-- Set `flat_fst_optimization' to `b'.
		do
			if declared_flat_fst_optimization = Void then
				!! declared_flat_fst_optimization.make_undefined
			end
			if b then
				declared_flat_fst_optimization.set_true
			else
				declared_flat_fst_optimization.set_false
			end
		ensure
			flat_fst_optimization_declared: is_flat_fst_optimization_declared
			flat_fst_optimization_set: flat_fst_optimization = b
		end

	set_fst_expansion_factor (v: INTEGER) is
			-- Set `fst_expansion_factor' to `v'.
		require
			v_positive: v >= 0
		do
			declared_fst_expansion_factor := v
		ensure
			fst_expansion_factor_declared: is_fst_expansion_factor_declared
			fst_expansion_factor_set: fst_expansion_factor = v
		end

	set_fst_optimization (b: BOOLEAN) is
			-- Set `fst_optimization' to `b'.
		do
			if declared_fst_optimization = Void then
				!! declared_fst_optimization.make_undefined
			end
			if b then
				declared_fst_optimization.set_true
			else
				declared_fst_optimization.set_false
			end
		ensure
			fst_optimization_declared: is_fst_optimization_declared
			fst_optimization_set: fst_optimization = b
		end

	set_garbage_collector (a_value: STRING) is
			-- Set `garbage_collector' to `a_value'.
		require
			a_value_valid: valid_garbage_collector.has (a_value)
		do
			declared_garbage_collector := a_value
		ensure
			garbage_collector_declared: is_garbage_collector_declared
			garbage_collector_set: garbage_collector = a_value
		end

	set_gc_info (b: BOOLEAN) is
			-- Set `gc_info' to `b'.
		do
			if declared_gc_info = Void then
				!! declared_gc_info.make_undefined
			end
			if b then
				declared_gc_info.set_true
			else
				declared_gc_info.set_false
			end
		ensure
			gc_info_declared: is_gc_info_declared
			gc_info_set: gc_info = b
		end

	set_heap_size (v: INTEGER) is
			-- Set `heap_size' to `v'.
		require
			v_positive: v >= 0
		do
			declared_heap_size := v
		ensure
			heap_size_declared: is_heap_size_declared
			heap_size_set: heap_size = v
		end

	set_header (a_value: STRING) is
			-- Set `header' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		do
			if declared_header = Void then
				!! declared_header.make_equal (10)
			end
			declared_header.force_last (a_value)
		ensure
			header_declared: is_header_declared
			header_set: header.has (a_value)
		end

	set_high_memory_compiler (b: BOOLEAN) is
			-- Set `high_memory_compiler' to `b'.
		do
			if declared_high_memory_compiler = Void then
				!! declared_high_memory_compiler.make_undefined
			end
			if b then
				declared_high_memory_compiler.set_true
			else
				declared_high_memory_compiler.set_false
			end
		ensure
			high_memory_compiler_declared: is_high_memory_compiler_declared
			high_memory_compiler_set: high_memory_compiler = b
		end

	set_include (a_value: STRING) is
			-- Set `include' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		do
			if declared_include = Void then
				!! declared_include.make_equal (10)
			end
			declared_include.force_last (a_value)
		ensure
			include_declared: is_include_declared
			include_set: include.has (a_value)
		end

	set_inlining (a_value: STRING) is
			-- Set `inlining' to `a_value'.
		require
			a_value_valid: valid_inlining.has (a_value)
		do
			if declared_inlining = Void then
				!! declared_inlining.make_equal (valid_inlining.count)
			end
			declared_inlining.force_last (a_value)
		ensure
			inlining_declared: is_inlining_declared
			inlining_set: inlining.has (a_value)
		end

	set_inlining_size (v: INTEGER) is
			-- Set `inlining_size' to `v'.
		require
			v_positive: v >= 0
		do
			declared_inlining_size := v
		ensure
			inlining_size_declared: is_inlining_size_declared
			inlining_size_set: inlining_size = v
		end

	set_jumps_optimization (b: BOOLEAN) is
			-- Set `jumps_optimization' to `b'.
		do
			if declared_jumps_optimization = Void then
				!! declared_jumps_optimization.make_undefined
			end
			if b then
				declared_jumps_optimization.set_true
			else
				declared_jumps_optimization.set_false
			end
		ensure
			jumps_optimization_declared: is_jumps_optimization_declared
			jumps_optimization_set: jumps_optimization = b
		end

	set_layout_optimization (b: BOOLEAN) is
			-- Set `layout_optimization' to `b'.
		do
			if declared_layout_optimization = Void then
				!! declared_layout_optimization.make_undefined
			end
			if b then
				declared_layout_optimization.set_true
			else
				declared_layout_optimization.set_false
			end
		ensure
			layout_optimization_declared: is_layout_optimization_declared
			layout_optimization_set: layout_optimization = b
		end

	set_leaves_optimization (b: BOOLEAN) is
			-- Set `leaves_optimization' to `b'.
		do
			if declared_leaves_optimization = Void then
				!! declared_leaves_optimization.make_undefined
			end
			if b then
				declared_leaves_optimization.set_true
			else
				declared_leaves_optimization.set_false
			end
		ensure
			leaves_optimization_declared: is_leaves_optimization_declared
			leaves_optimization_set: leaves_optimization = b
		end

	set_line_generation (b: BOOLEAN) is
			-- Set `line_generation' to `b'.
		do
			if declared_line_generation = Void then
				!! declared_line_generation.make_undefined
			end
			if b then
				declared_line_generation.set_true
			else
				declared_line_generation.set_false
			end
		ensure
			line_generation_declared: is_line_generation_declared
			line_generation_set: line_generation = b
		end

	set_link (a_value: STRING) is
			-- Set `link' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		do
			if declared_link = Void then
				!! declared_link.make_equal (10)
			end
			declared_link.force_last (a_value)
		ensure
			link_declared: is_link_declared
			link_set: link.has (a_value)
		end

	set_linker (a_value: STRING) is
			-- Set `linker' to `a_value'.
		require
			a_value_valid: valid_linker.has (a_value)
		do
			declared_linker := a_value
		ensure
			linker_declared: is_linker_declared
			linker_set: linker = a_value
		end

	set_linux_fpu_double_precision (b: BOOLEAN) is
			-- Set `linux_fpu_double_precision' to `b'.
		do
			if declared_linux_fpu_double_precision = Void then
				!! declared_linux_fpu_double_precision.make_undefined
			end
			if b then
				declared_linux_fpu_double_precision.set_true
			else
				declared_linux_fpu_double_precision.set_false
			end
		ensure
			linux_fpu_double_precision_declared: is_linux_fpu_double_precision_declared
			linux_fpu_double_precision_set: linux_fpu_double_precision = b
		end

	set_manifest_string_trace (b: BOOLEAN) is
			-- Set `manifest_string_trace' to `b'.
		do
			if declared_manifest_string_trace = Void then
				!! declared_manifest_string_trace.make_undefined
			end
			if b then
				declared_manifest_string_trace.set_true
			else
				declared_manifest_string_trace.set_false
			end
		ensure
			manifest_string_trace_declared: is_manifest_string_trace_declared
			manifest_string_trace_set: manifest_string_trace = b
		end

	set_map (b: BOOLEAN) is
			-- Set `map' to `b'.
		do
			if declared_map = Void then
				!! declared_map.make_undefined
			end
			if b then
				declared_map.set_true
			else
				declared_map.set_false
			end
		ensure
			map_declared: is_map_declared
			map_set: map = b
		end

	set_multithreaded (b: BOOLEAN) is
			-- Set `multithreaded' to `b'.
		do
			if declared_multithreaded = Void then
				!! declared_multithreaded.make_undefined
			end
			if b then
				declared_multithreaded.set_true
			else
				declared_multithreaded.set_false
			end
		ensure
			multithreaded_declared: is_multithreaded_declared
			multithreaded_set: multithreaded = b
		end

	set_no_default_lib (b: BOOLEAN) is
			-- Set `no_default_lib' to `b'.
		do
			if declared_no_default_lib = Void then
				!! declared_no_default_lib.make_undefined
			end
			if b then
				declared_no_default_lib.set_true
			else
				declared_no_default_lib.set_false
			end
		ensure
			no_default_lib_declared: is_no_default_lib_declared
			no_default_lib_set: no_default_lib = b
		end

	set_override_cluster (a_value: STRING) is
			-- Set `override_cluster' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		do
			declared_override_cluster := a_value
		ensure
			override_cluster_declared: is_override_cluster_declared
			override_cluster_set: override_cluster = a_value
		end

	set_portable_code_generation (b: BOOLEAN) is
			-- Set `portable_code_generation' to `b'.
		do
			if declared_portable_code_generation = Void then
				!! declared_portable_code_generation.make_undefined
			end
			if b then
				declared_portable_code_generation.set_true
			else
				declared_portable_code_generation.set_false
			end
		ensure
			portable_code_generation_declared: is_portable_code_generation_declared
			portable_code_generation_set: portable_code_generation = b
		end

	set_precompiled (a_value: STRING) is
			-- Set `precompiled' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		do
			declared_precompiled := a_value
		ensure
			precompiled_declared: is_precompiled_declared
			precompiled_set: precompiled = a_value
		end

	set_profile (b: BOOLEAN) is
			-- Set `profile' to `b'.
		do
			if declared_profile = Void then
				!! declared_profile.make_undefined
			end
			if b then
				declared_profile.set_true
			else
				declared_profile.set_false
			end
		ensure
			profile_declared: is_profile_declared
			profile_set: profile = b
		end

	set_recursive (b: BOOLEAN) is
			-- Set `recursive' to `b'.
		do
			if declared_recursive = Void then
				!! declared_recursive.make_undefined
			end
			if b then
				declared_recursive.set_true
			else
				declared_recursive.set_false
			end
		ensure
			recursive_declared: is_recursive_declared
			recursive_set: recursive = b
		end

	set_reloads_optimization (b: BOOLEAN) is
			-- Set `reloads_optimization' to `b'.
		do
			if declared_reloads_optimization = Void then
				!! declared_reloads_optimization.make_undefined
			end
			if b then
				declared_reloads_optimization.set_true
			else
				declared_reloads_optimization.set_false
			end
		ensure
			reloads_optimization_declared: is_reloads_optimization_declared
			reloads_optimization_set: reloads_optimization = b
		end

	set_shared_library_definition (a_value: STRING) is
			-- Set `shared_library_definition' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		do
			declared_shared_library_definition := a_value
		ensure
			shared_library_definition_declared: is_shared_library_definition_declared
			shared_library_definition_set: shared_library_definition = a_value
		end

	set_split (b: BOOLEAN) is
			-- Set `split' to `b'.
		do
			if declared_split = Void then
				!! declared_split.make_undefined
			end
			if b then
				declared_split.set_true
			else
				declared_split.set_false
			end
		ensure
			split_declared: is_split_declared
			split_set: split = b
		end

	set_stack_size (v: INTEGER) is
			-- Set `stack_size' to `v'.
		require
			v_positive: v >= 0
		do
			declared_stack_size := v
		ensure
			stack_size_declared: is_stack_size_declared
			stack_size_set: stack_size = v
		end

	set_storable (b: BOOLEAN) is
			-- Set `storable' to `b'.
		do
			if declared_storable = Void then
				!! declared_storable.make_undefined
			end
			if b then
				declared_storable.set_true
			else
				declared_storable.set_false
			end
		ensure
			storable_declared: is_storable_declared
			storable_set: storable = b
		end

	set_storable_filename (a_value: STRING) is
			-- Set `storable_filename' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		do
			declared_storable_filename := a_value
		ensure
			storable_filename_declared: is_storable_filename_declared
			storable_filename_set: storable_filename = a_value
		end

	set_strip_option (b: BOOLEAN) is
			-- Set `strip_option' to `b'.
		do
			if declared_strip_option = Void then
				!! declared_strip_option.make_undefined
			end
			if b then
				declared_strip_option.set_true
			else
				declared_strip_option.set_false
			end
		ensure
			strip_option_declared: is_strip_option_declared
			strip_option_set: strip_option = b
		end

	set_target (a_value: STRING) is
			-- Set `target' to `a_value'.
		require
			a_value_valid: valid_target.has (a_value)
		do
			declared_target := a_value
		ensure
			target_declared: is_target_declared
			target_set: target = a_value
		end

	set_trace (b: BOOLEAN) is
			-- Set `trace' to `b'.
		do
			if declared_trace = Void then
				!! declared_trace.make_undefined
			end
			if b then
				declared_trace.set_true
			else
				declared_trace.set_false
			end
		ensure
			trace_declared: is_trace_declared
			trace_set: trace = b
		end

	set_verbose (b: BOOLEAN) is
			-- Set `verbose' to `b'.
		do
			if declared_verbose = Void then
				!! declared_verbose.make_undefined
			end
			if b then
				declared_verbose.set_true
			else
				declared_verbose.set_false
			end
		ensure
			verbose_declared: is_verbose_declared
			verbose_set: verbose = b
		end

	set_visible_filename (a_value: STRING) is
			-- Set `visible_filename' to `a_value'.
		require
			a_value_not_void: a_value /= Void
		do
			declared_visible_filename := a_value
		ensure
			visible_filename_declared: is_visible_filename_declared
			visible_filename_set: visible_filename = a_value
		end

	set_warning (a_value: STRING) is
			-- Set `warning' to `a_value'.
		require
			a_value_valid: valid_warning.has (a_value)
		do
			declared_warning := a_value
		ensure
			warning_declared: is_warning_declared
			warning_set: warning = a_value
		end

	set_wedit (b: BOOLEAN) is
			-- Set `wedit' to `b'.
		do
			if declared_wedit = Void then
				!! declared_wedit.make_undefined
			end
			if b then
				declared_wedit.set_true
			else
				declared_wedit.set_false
			end
		ensure
			wedit_declared: is_wedit_declared
			wedit_set: wedit = b
		end

feature -- Valid values

	valid_assertion: DS_HASH_SET [STRING] is
			-- Valid values for 'assertion' option
		once
			!! Result.make_equal (8)
			Result.put_last (options.none_value)
			Result.put_last (options.require_value)
			Result.put_last (options.ensure_value)
			Result.put_last (options.invariant_value)
			Result.put_last (options.loop_invariant_value)
			Result.put_last (options.loop_variant_value)
			Result.put_last (options.check_value)
			Result.put_last (options.all_value)
		ensure
			valid_assertion_not_void: Result /= Void
			valid_assertion_not_empty: not Result.is_empty
			no_void_value: not Result.has (Void)
			-- all_lower: forall v in Result, v.is_lower
		end

	valid_dead_code_removal: DS_HASH_SET [STRING] is
			-- Valid values for 'dead_code_removal' option
		once
			!! Result.make_equal (5)
			Result.put_last (options.none_value)
			Result.put_last (options.low_level_value)
			Result.put_last (options.feature_value)
			Result.put_last (options.class_value)
			Result.put_last (options.all_value)
		ensure
			valid_dead_code_removal_not_void: Result /= Void
			valid_dead_code_removal_not_empty: not Result.is_empty
			no_void_value: not Result.has (Void)
			-- all_lower: forall v in Result, v.is_lower
		end

	valid_garbage_collector: DS_HASH_SET [STRING] is
			-- Valid values for 'garbage_collector' option
		once
			!! Result.make_equal (3)
			Result.put_last (options.none_value)
			Result.put_last (options.internal_value)
			Result.put_last (options.boehm_value)
		ensure
			valid_garbage_collector_not_void: Result /= Void
			valid_garbage_collector_not_empty: not Result.is_empty
			no_void_value: not Result.has (Void)
			-- all_lower: forall v in Result, v.is_lower
		end

	valid_inlining: DS_HASH_SET [STRING] is
			-- Valid values for 'inlining' option
		once
			!! Result.make_equal (5)
			Result.put_last (options.none_value)
			Result.put_last (options.array_value)
			Result.put_last (options.constant_value)
			Result.put_last (options.once_value)
			Result.put_last (options.all_value)
		ensure
			valid_inlining_not_void: Result /= Void
			valid_inlining_not_empty: not Result.is_empty
			no_void_value: not Result.has (Void)
			-- all_lower: forall v in Result, v.is_lower
		end

	valid_linker: DS_HASH_SET [STRING] is
			-- Valid values for 'linker' option
		once
			!! Result.make_equal (2)
			Result.put_last (options.default_value)
			Result.put_last (options.microsoft_value)
		ensure
			valid_linker_not_void: Result /= Void
			valid_linker_not_empty: not Result.is_empty
			no_void_value: not Result.has (Void)
			-- all_lower: forall v in Result, v.is_lower
		end

	valid_target: DS_HASH_SET [STRING] is
			-- Valid values for 'target' option
		once
			!! Result.make_equal (4)
			Result.put_last (options.exe_value)
			Result.put_last (options.dll_value)
			Result.put_last (options.com_value)
			Result.put_last (options.no_main_value)
		ensure
			valid_target_not_void: Result /= Void
			valid_target_not_empty: not Result.is_empty
			no_void_value: not Result.has (Void)
			-- all_lower: forall v in Result, v.is_lower
		end

	valid_warning: DS_HASH_SET [STRING] is
			-- Valid values for 'warning' option
		once
			!! Result.make_equal (4)
			Result.put_last (options.none_value)
			Result.put_last (options.style_value)
			Result.put_last (options.default_value)
			Result.put_last (options.all_value)
		ensure
			valid_warning_not_void: Result /= Void
			valid_warning_not_empty: not Result.is_empty
			no_void_value: not Result.has (Void)
			-- all_lower: forall v in Result, v.is_lower
		end

feature -- Declared values

	declared_abstract: UT_TRISTATE
			-- Declared value for 'abstract' option

	declared_address_expression: UT_TRISTATE
			-- Declared value for 'address_expression' option

	declared_arguments: DS_HASH_SET [STRING]
			-- Declared values for 'arguments' option

	declared_array_optimization: UT_TRISTATE
			-- Declared value for 'array_optimization' option

	declared_assertion: DS_HASH_SET [STRING]
			-- Declared values for 'assertion' option

	declared_case_insensitive: UT_TRISTATE
			-- Declared value for 'case_insensitive' option

	declared_check_vape: UT_TRISTATE
			-- Declared value for 'check_vape' option

	declared_clean: UT_TRISTATE
			-- Declared value for 'clean' option

	declared_component: STRING
			-- Declared value for 'component' option

	declared_console_application: UT_TRISTATE
			-- Declared value for 'console_application' option

	declared_create_keyword_extension: UT_TRISTATE
			-- Declared value for 'create_keyword_extension' option

	declared_dead_code_removal: DS_HASH_SET [STRING]
			-- Declared values for 'dead_code_removal' option

	declared_debug_option: UT_TRISTATE
			-- Declared value for 'debug' option

	declared_debug_tag: DS_HASH_SET [STRING]
			-- Declared values for 'debug_tag' option

	declared_debugger: UT_TRISTATE
			-- Declared value for 'debugger' option

	declared_document: STRING
			-- Declared value for 'document' option

	declared_dynamic_runtime: UT_TRISTATE
			-- Declared value for 'dynamic_runtime' option

	declared_exception_trace: UT_TRISTATE
			-- Declared value for 'exception_trace' option

	declared_exclude: DS_HASH_SET [STRING]
			-- Declared values for 'exclude' option

	declared_export_option: STRING
			-- Declared value for 'export' option

	declared_finalize: UT_TRISTATE
			-- Declared value for 'finalize' option

	declared_flat_fst_optimization: UT_TRISTATE
			-- Declared value for 'flat_fst_optimization' option

	declared_fst_expansion_factor: INTEGER
			-- Declared value for 'fst_expansion_factor' option

	declared_fst_optimization: UT_TRISTATE
			-- Declared value for 'fst_optimization' option

	declared_garbage_collector: STRING
			-- Declared value for 'garbage_collector' option

	declared_gc_info: UT_TRISTATE
			-- Declared value for 'gc_info' option

	declared_heap_size: INTEGER
			-- Declared value for 'heap_size' option

	declared_header: DS_HASH_SET [STRING]
			-- Declared values for 'header' option

	declared_high_memory_compiler: UT_TRISTATE
			-- Declared value for 'high_memory_compiler' option

	declared_include: DS_HASH_SET [STRING]
			-- Declared values for 'include' option

	declared_inlining: DS_HASH_SET [STRING]
			-- Declared values for 'inlining' option

	declared_inlining_size: INTEGER
			-- Declared value for 'inlining_size' option

	declared_jumps_optimization: UT_TRISTATE
			-- Declared value for 'jumps_optimization' option

	declared_layout_optimization: UT_TRISTATE
			-- Declared value for 'layout_optimization' option

	declared_leaves_optimization: UT_TRISTATE
			-- Declared value for 'leaves_optimization' option

	declared_line_generation: UT_TRISTATE
			-- Declared value for 'line_generation' option

	declared_link: DS_HASH_SET [STRING]
			-- Declared values for 'link' option

	declared_linker: STRING
			-- Declared value for 'linker' option

	declared_linux_fpu_double_precision: UT_TRISTATE
			-- Declared value for 'linux_fpu_double_precision' option

	declared_manifest_string_trace: UT_TRISTATE
			-- Declared value for 'manifest_string_trace' option

	declared_map: UT_TRISTATE
			-- Declared value for 'map' option

	declared_multithreaded: UT_TRISTATE
			-- Declared value for 'multithreaded' option

	declared_no_default_lib: UT_TRISTATE
			-- Declared value for 'no_default_lib' option

	declared_override_cluster: STRING
			-- Declared value for 'override_cluster' option

	declared_portable_code_generation: UT_TRISTATE
			-- Declared value for 'portable_code_generation' option

	declared_precompiled: STRING
			-- Declared value for 'precompiled' option

	declared_profile: UT_TRISTATE
			-- Declared value for 'profile' option

	declared_recursive: UT_TRISTATE
			-- Declared value for 'recursive' option

	declared_reloads_optimization: UT_TRISTATE
			-- Declared value for 'reloads_optimization' option

	declared_shared_library_definition: STRING
			-- Declared value for 'shared_library_definition' option

	declared_split: UT_TRISTATE
			-- Declared value for 'split' option

	declared_stack_size: INTEGER
			-- Declared value for 'stack_size' option

	declared_storable: UT_TRISTATE
			-- Declared value for 'storable' option

	declared_storable_filename: STRING
			-- Declared value for 'storable_filename' option

	declared_strip_option: UT_TRISTATE
			-- Declared value for 'strip' option

	declared_target: STRING
			-- Declared value for 'target' option

	declared_trace: UT_TRISTATE
			-- Declared value for 'trace' option

	declared_verbose: UT_TRISTATE
			-- Declared value for 'verbose' option

	declared_visible_filename: STRING
			-- Declared value for 'visible_filename' option

	declared_warning: STRING
			-- Declared value for 'warning' option

	declared_wedit: UT_TRISTATE
			-- Declared value for 'wedit' option

feature -- Default values

	default_abstract: BOOLEAN is False
			-- Default value for 'abstract' option

	default_address_expression: BOOLEAN is False
			-- Default value for 'address_expression' option

	default_arguments: DS_HASH_SET [STRING] is
			-- Default value for 'arguments' option
		once
			!! Result.make_equal (0)
		ensure
			default_arguments_not_void: Result /= Void
			no_void_argument: not Result.has (Void)
		end

	default_array_optimization: BOOLEAN is False
			-- Default value for 'array_optimization' option

	default_assertion: DS_HASH_SET [STRING] is
			-- Default value for 'assertion' option
		once
			!! Result.make_equal (1)
			Result.put_new (options.require_value)
		ensure
			default_assertion_not_void: Result /= Void
			-- valid_value: forall v in Result, valid_assertion.has (v)
		end

	default_case_insensitive: BOOLEAN is True
			-- Default value for 'case_insensitive' option

	default_check_vape: BOOLEAN is True
			-- Default value for 'check_vape' option

	default_clean: BOOLEAN is False
			-- Default value for 'clean' option

	default_component: STRING is
			-- Default value for 'component' option
		once
			Result := Void
		end

	default_console_application: BOOLEAN is True
			-- Default value for 'console_application' option

	default_create_keyword_extension: BOOLEAN is True
			-- Default value for 'create_keyword_extension' option

	default_dead_code_removal: DS_HASH_SET [STRING] is
			-- Default value for 'dead_code_removal' option
		once
			!! Result.make_equal (1)
			Result.put_new (options.all_value)
		ensure
			default_dead_code_removal_not_void: Result /= Void
			-- valid_value: forall v in Result, valid_dead_code_removal.has (v)
		end

	default_debug_option: BOOLEAN is False
			-- Default value for 'debug' option

	default_debug_tag: DS_HASH_SET [STRING] is
			-- Default value for 'debug_tag' option
		once
			!! Result.make_equal (0)
		ensure
			default_debug_tag_not_void: Result /= Void
			no_void_debug_tag: not Result.has (Void)
		end

	default_debugger: BOOLEAN is False
			-- Default value for 'debugger' option

	default_document: STRING is
			-- Default value for 'document' option
		once
			Result := Void
		end

	default_dynamic_runtime: BOOLEAN is False
			-- Default value for 'dynamic_runtime' option

	default_exception_trace: BOOLEAN is False
			-- Default value for 'exception_trace' option

	default_exclude: DS_HASH_SET [STRING] is
			-- Default value for 'exclude' option
		once
			!! Result.make_equal (0)
		ensure
			default_exclude_not_void: Result /= Void
			no_void_exclude: not Result.has (Void)
		end

	default_export_option: STRING is
			-- Default value for 'export' option
		once
			Result := Void
		end

	default_finalize: BOOLEAN is False
			-- Default value for 'finalize' option

	default_flat_fst_optimization: BOOLEAN is False
			-- Default value for 'flat_fst_optimization' option

	default_fst_expansion_factor: INTEGER is 2
			-- Default value for 'fst_expansion_factor' option

	default_fst_optimization: BOOLEAN is False
			-- Default value for 'fst_optimization' option

	default_garbage_collector: STRING is
			-- Default value for 'garbage_collector' option
		once
			Result := options.internal_value
		ensure
			valid_default_garbage_collector: valid_garbage_collector.has (Result)
		end

	default_gc_info: BOOLEAN is False
			-- Default value for 'gc_info' option

	default_heap_size: INTEGER is -1
			-- Default value for 'heap_size' option

	default_header: DS_HASH_SET [STRING] is
			-- Default value for 'header' option
		once
			!! Result.make_equal (0)
		ensure
			default_header_not_void: Result /= Void
			no_void_header: not Result.has (Void)
		end

	default_high_memory_compiler: BOOLEAN is False
			-- Default value for 'high_memory_compiler' option

	default_include: DS_HASH_SET [STRING] is
			-- Default value for 'include' option
		once
			!! Result.make_equal (0)
		ensure
			default_include_not_void: Result /= Void
			no_void_include: not Result.has (Void)
		end

	default_inlining: DS_HASH_SET [STRING] is
			-- Default value for 'inlining' option
		once
			!! Result.make_equal (1)
			Result.put_new (options.none_value)
		ensure
			default_inlining_not_void: Result /= Void
			-- valid_value: forall v in Result, valid_inlining.has (v)
		end

	default_inlining_size: INTEGER is 4
			-- Default value for 'inlining_size' option

	default_jumps_optimization: BOOLEAN is False
			-- Default value for 'jumps_optimization' option

	default_layout_optimization: BOOLEAN is False
			-- Default value for 'layout_optimization' option

	default_leaves_optimization: BOOLEAN is False
			-- Default value for 'leaves_optimization' option

	default_line_generation: BOOLEAN is False
			-- Default value for 'line_generation' option

	default_link: DS_HASH_SET [STRING] is
			-- Default value for 'link' option
		once
			!! Result.make_equal (0)
		ensure
			default_link_not_void: Result /= Void
			no_void_link: not Result.has (Void)
		end

	default_linker: STRING is
			-- Default value for 'linker' option
		once
			Result := options.default_value
		ensure
			valid_default_linker: valid_linker.has (Result)
		end

	default_linux_fpu_double_precision: BOOLEAN is False
			-- Default value for 'linux_fpu_double_precision' option

	default_manifest_string_trace: BOOLEAN is False
			-- Default value for 'manifest_string_trace' option

	default_map: BOOLEAN is False
			-- Default value for 'map' option

	default_multithreaded: BOOLEAN is False
			-- Default value for 'multithreaded' option

	default_no_default_lib: BOOLEAN is False
			-- Default value for 'no_default_lib' option

	default_override_cluster: STRING is
			-- Default value for 'override_cluster' option
		once
			Result := Void
		end

	default_portable_code_generation: BOOLEAN is False
			-- Default value for 'portable_code_generation' option

	default_precompiled: STRING is
			-- Default value for 'precompiled' option
		once
			Result := Void
		end

	default_profile: BOOLEAN is False
			-- Default value for 'profile' option

	default_recursive: BOOLEAN is False
			-- Default value for 'recursive' option

	default_reloads_optimization: BOOLEAN is False
			-- Default value for 'reloads_optimization' option

	default_shared_library_definition: STRING is
			-- Default value for 'shared_library_definition' option
		once
			Result := Void
		end

	default_split: BOOLEAN is False
			-- Default value for 'split' option

	default_stack_size: INTEGER is -1
			-- Default value for 'stack_size' option

	default_storable: BOOLEAN is False
			-- Default value for 'storable' option

	default_storable_filename: STRING is
			-- Default value for 'storable_filename' option
		once
			Result := Void
		end

	default_strip_option: BOOLEAN is True
			-- Default value for 'strip' option

	default_target: STRING is
			-- Default value for 'target' option
		once
			Result := options.exe_value
		ensure
			valid_default_target: valid_target.has (Result)
		end

	default_trace: BOOLEAN is False
			-- Default value for 'trace' option

	default_verbose: BOOLEAN is False
			-- Default value for 'verbose' option

	default_visible_filename: STRING is
			-- Default value for 'visible_filename' option
		once
			Result := Void
		end

	default_warning: STRING is
			-- Default value for 'warning' option
		once
			Result := options.default_value
		ensure
			valid_default_warning: valid_warning.has (Result)
		end

	default_wedit: BOOLEAN is False
			-- Default value for 'wedit' option

end
