note

	description:

		"Xace file generators from Xace files. Useful to strip if/unless clauses."

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_XACE_GENERATOR

inherit

	ET_XACE_GENERATOR

	XM_MARKUP_CONSTANTS
		export {NONE} all end

create

	make

feature -- Access

	default_system_output_filename: STRING
			-- Name of generated Xace file
		once
			Result := compiler + ".xace"
		end

	default_library_output_filename: STRING
			-- Name of generated library Xace file
		once
			Result := compiler + ".xace"
		end

feature -- Output

	generate_system (a_system: ET_XACE_SYSTEM_CONFIG; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Generate a new Xace file from `a_system'.
		do
			print_xace_system_file (a_system, a_file)
		end

	generate_library (a_library: ET_XACE_LIBRARY_CONFIG; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Generate a new Xace file from `a_library'.
		do
			print_xace_library_file (a_library, a_file)
		end

feature {NONE} -- Output

	print_xace_system_file (a_system: ET_XACE_SYSTEM_CONFIG; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print Xace version of `a_system' to `a_file'.
		require
			a_system_not_void: a_system /= Void
			system_name_not_void: attached a_system.system_name as l_system_name
			system_name_not_empty: l_system_name.count > 0
			root_class_name_not_void: attached a_system.root_class_name as l_root_class_name
			root_class_name_not_empty: l_root_class_name.count > 0
			creation_procedure_name_not_void: attached a_system.creation_procedure_name as l_creation_procedure_name
			creation_procedure_name_not_empty: l_creation_procedure_name.count > 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			a_clusters: detachable ET_XACE_CLUSTERS
			a_mounted_libraries: detachable ET_XACE_MOUNTED_LIBRARIES
			an_option: detachable ET_XACE_OPTIONS
		do
			a_file.put_line ("<?xml version=%"1.0%"?>")
			a_file.put_new_line
			a_file.put_string ("<system name=%"")
			if attached a_system.system_name as l_system_name then
				print_quote_escaped_string (l_system_name, a_file)
			else
					-- Should never happen according to the precondition.
				check False end
			end
			a_file.put_line ("%">")
			print_indentation (1, a_file)
			a_file.put_string ("<root class=%"")
			if attached a_system.root_class_name as l_root_class_name then
				print_quote_escaped_string (l_root_class_name, a_file)
			else
					-- Should never happen according to the precondition.
				check False end
			end
			a_file.put_string ("%" creation=%"")
			if attached a_system.creation_procedure_name as l_creation_procedure_name then
				print_quote_escaped_string (l_creation_procedure_name, a_file)
			else
					-- Should never happen according to the precondition.
				check False end
			end
			a_file.put_line ("%"/>")
			an_option := a_system.options
			if an_option /= Void then
				print_options (an_option, 1, a_file)
				print_console_application_option (an_option, 1, a_file)
			end
			a_clusters := a_system.clusters
			if a_clusters /= Void then
				print_clusters (a_clusters, 1, a_file)
			end
			a_mounted_libraries := a_system.libraries
			if a_mounted_libraries /= Void then
				print_mounted_libraries (a_mounted_libraries, 1, a_file)
			end
			a_file.put_line ("</system>")
		end

	print_xace_library_file (a_library: ET_XACE_LIBRARY_CONFIG; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print Xace version of `a_library' to `a_file'.
		require
			a_library_not_void: a_library /= Void
			a_library_name_not_void: attached a_library.name as l_library_name
			a_library_name_not_empty: l_library_name.count > 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			a_clusters: detachable ET_XACE_CLUSTERS
			a_mounted_libraries: detachable ET_XACE_MOUNTED_LIBRARIES
			an_option: detachable ET_XACE_OPTIONS
			a_prefix: STRING
		do
			a_file.put_line ("<?xml version=%"1.0%"?>")
			a_file.put_new_line
			a_file.put_string ("<library name=%"")
			if attached a_library.name as l_library_name then
				print_quote_escaped_string (l_library_name, a_file)
			else
					-- Should never happen according to the precondition.
				check False end
			end
			if is_shallow then
				a_prefix := a_library.library_prefix
				if a_prefix.count > 0 then
					a_file.put_string ("%" prefix=%"")
					print_quote_escaped_string (a_prefix, a_file)
				end
			end
			a_file.put_line ("%">")
			an_option := a_library.options
			if an_option /= Void then
				print_options (an_option, 1, a_file)
				print_console_application_option (an_option, 1, a_file)
			end
			a_clusters := a_library.clusters
			if a_clusters /= Void then
				print_clusters (a_clusters, 1, a_file)
			end
			a_mounted_libraries := a_library.libraries
			if a_mounted_libraries /= Void then
				print_mounted_libraries (a_mounted_libraries, 1, a_file)
			end
			a_file.put_line ("</library>")
		end

	print_options (an_option: ET_XACE_OPTIONS; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print `an_option' to `a_file'.
		require
			an_option_not_void: an_option /= Void
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			a_cursor: DS_HASH_SET_CURSOR [STRING]
			a_link_cursor: DS_ARRAYED_LIST_CURSOR [STRING]
		do
			if an_option.is_abstract_declared then
				print_indentation (indent, a_file)
				if an_option.abstract then
					a_file.put_line ("<option name=%"abstract%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"abstract%" value=%"false%"/>")
				end
			end
			if an_option.is_address_expression_declared then
				print_indentation (indent, a_file)
				if an_option.address_expression then
					a_file.put_line ("<option name=%"address_expression%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"address_expression%" value=%"false%"/>")
				end
			end
			if an_option.is_arguments_declared then
				a_cursor := an_option.arguments.new_cursor
				from a_cursor.start until a_cursor.after loop
					print_indentation (indent, a_file)
					a_file.put_string ("<option name=%"arguments%" value=%"")
					print_quote_escaped_string (a_cursor.item, a_file)
					a_file.put_line ("%"/>")
					a_cursor.forth
				end
			end
			if an_option.is_array_optimization_declared then
				print_indentation (indent, a_file)
				if an_option.array_optimization then
					a_file.put_line ("<option name=%"array_optimization%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"array_optimization%" value=%"false%"/>")
				end
			end
			if an_option.is_assembly_declared and then attached an_option.assembly as l_assembly then
				print_indentation (indent, a_file)
				a_file.put_string ("<option name=%"assembly%" value=%"")
				print_quote_escaped_string (l_assembly, a_file)
				a_file.put_line ("%"/>")
			end
			if an_option.is_assertion_declared then
				a_cursor := an_option.assertion.new_cursor
				from a_cursor.start until a_cursor.after loop
					print_indentation (indent, a_file)
					a_file.put_string ("<option name=%"assertion%" value=%"")
					print_quote_escaped_string (a_cursor.item, a_file)
					a_file.put_line ("%"/>")
					a_cursor.forth
				end
			end
			if an_option.is_callback_declared and then attached an_option.callback as l_callback then
				print_indentation (indent, a_file)
				a_file.put_string ("<option name=%"callback%" value=%"")
				print_quote_escaped_string (l_callback, a_file)
				a_file.put_line ("%"/>")
			end
			if an_option.is_case_insensitive_declared then
				print_indentation (indent, a_file)
				if an_option.case_insensitive then
					a_file.put_line ("<option name=%"case_insensitive%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"case_insensitive%" value=%"false%"/>")
				end
			end
			if an_option.is_check_vape_declared then
				print_indentation (indent, a_file)
				if an_option.check_vape then
					a_file.put_line ("<option name=%"check_vape%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"check_vape%" value=%"false%"/>")
				end
			end
			if an_option.is_clean_declared then
				print_indentation (indent, a_file)
				if an_option.clean then
					a_file.put_line ("<option name=%"clean%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"clean%" value=%"false%"/>")
				end
			end
			if an_option.is_cls_compliant_declared then
				print_indentation (indent, a_file)
				if an_option.cls_compliant then
					a_file.put_line ("<option name=%"cls_compliant%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"cls_compliant%" value=%"false%"/>")
				end
			end
			if an_option.is_component_declared and then attached an_option.component as l_component then
				print_indentation (indent, a_file)
				a_file.put_string ("<option name=%"component%" value=%"")
				print_quote_escaped_string (l_component, a_file)
				a_file.put_line ("%"/>")
			end
			if an_option.is_console_application_declared then
				print_indentation (indent, a_file)
				if an_option.console_application then
					a_file.put_line ("<option name=%"console_application%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"console_application%" value=%"false%"/>")
				end
			end
			if an_option.is_create_keyword_extension_declared then
				print_indentation (indent, a_file)
				if an_option.create_keyword_extension then
					a_file.put_line ("<option name=%"create_keyword_extension%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"create_keyword_extension%" value=%"false%"/>")
				end
			end
			if an_option.is_culture_declared then
				print_indentation (indent, a_file)
				a_file.put_string ("<option name=%"culture%" value=%"")
				print_quote_escaped_string (an_option.culture, a_file)
				a_file.put_line ("%"/>")
			end
			if an_option.is_c_compiler_options_declared then
				a_cursor := an_option.c_compiler_options.new_cursor
				from a_cursor.start until a_cursor.after loop
					print_indentation (indent, a_file)
					a_file.put_string ("<option name=%"c_compiler_options%" value=%"")
					print_quote_escaped_string (a_cursor.item, a_file)
					a_file.put_line ("%"/>")
					a_cursor.forth
				end
			end
			if an_option.is_dead_code_removal_declared then
				a_cursor := an_option.dead_code_removal.new_cursor
				from a_cursor.start until a_cursor.after loop
					print_indentation (indent, a_file)
					a_file.put_string ("<option name=%"dead_code_removal%" value=%"")
					print_quote_escaped_string (a_cursor.item, a_file)
					a_file.put_line ("%"/>")
					a_cursor.forth
				end
			end
			if an_option.is_debug_option_declared then
				print_indentation (indent, a_file)
				if an_option.debug_option then
					a_file.put_line ("<option name=%"debug%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"debug%" value=%"false%"/>")
				end
			end
			if an_option.is_debug_tag_declared then
				a_cursor := an_option.debug_tag.new_cursor
				from a_cursor.start until a_cursor.after loop
					print_indentation (indent, a_file)
					a_file.put_string ("<option name=%"debug_tag%" value=%"")
					print_quote_escaped_string (a_cursor.item, a_file)
					a_file.put_line ("%"/>")
					a_cursor.forth
				end
			end
			if an_option.is_debugger_declared then
				print_indentation (indent, a_file)
				if an_option.debugger then
					a_file.put_line ("<option name=%"debugger%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"debugger%" value=%"false%"/>")
				end
			end
			if an_option.is_document_declared and then attached an_option.document as l_document then
				print_indentation (indent, a_file)
				a_file.put_string ("<option name=%"document%" value=%"")
				print_quote_escaped_string (l_document, a_file)
				a_file.put_line ("%"/>")
			end
			if an_option.is_dotnet_naming_convention_declared then
				print_indentation (indent, a_file)
				if an_option.dotnet_naming_convention then
					a_file.put_line ("<option name=%"dotnet_naming_convention%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"dotnet_naming_convention%" value=%"false%"/>")
				end
			end
			if an_option.is_dynamic_runtime_declared then
				print_indentation (indent, a_file)
				if an_option.dynamic_runtime then
					a_file.put_line ("<option name=%"dynamic_runtime%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"dynamic_runtime%" value=%"false%"/>")
				end
			end
			if an_option.is_exception_trace_declared then
				print_indentation (indent, a_file)
				if an_option.exception_trace then
					a_file.put_line ("<option name=%"exception_trace%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"exception_trace%" value=%"false%"/>")
				end
			end
			if an_option.is_exclude_declared then
				a_cursor := an_option.exclude.new_cursor
				from a_cursor.start until a_cursor.after loop
					print_indentation (indent, a_file)
					a_file.put_string ("<option name=%"exclude%" value=%"")
					print_quote_escaped_string (a_cursor.item, a_file)
					a_file.put_line ("%"/>")
					a_cursor.forth
				end
			end
			if an_option.is_export_option_declared and then attached an_option.export_option as l_export_option then
				print_indentation (indent, a_file)
				a_file.put_string ("<option name=%"export%" value=%"")
				print_quote_escaped_string (l_export_option, a_file)
				a_file.put_line ("%"/>")
			end
			if an_option.is_finalize_option_declared then
				print_indentation (indent, a_file)
				if an_option.finalize_option then
					a_file.put_line ("<option name=%"finalize%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"finalize%" value=%"false%"/>")
				end
			end
			if an_option.is_flat_fst_optimization_declared then
				print_indentation (indent, a_file)
				if an_option.flat_fst_optimization then
					a_file.put_line ("<option name=%"flat_fst_optimization%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"flat_fst_optimization%" value=%"false%"/>")
				end
			end
			if an_option.is_fst_expansion_factor_declared then
				print_indentation (indent, a_file)
				a_file.put_string ("<option name=%"fst_expansion_factor%" value=%"")
				a_file.put_integer (an_option.fst_expansion_factor)
				a_file.put_line ("%"/>")
			end
			if an_option.is_fst_optimization_declared then
				print_indentation (indent, a_file)
				if an_option.fst_optimization then
					a_file.put_line ("<option name=%"fst_optimization%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"fst_optimization%" value=%"false%"/>")
				end
			end
			if an_option.is_garbage_collector_declared then
				print_indentation (indent, a_file)
				a_file.put_string ("<option name=%"garbage_collector%" value=%"")
				print_quote_escaped_string (an_option.garbage_collector, a_file)
				a_file.put_line ("%"/>")
			end
			if an_option.is_gc_info_declared then
				print_indentation (indent, a_file)
				if an_option.gc_info then
					a_file.put_line ("<option name=%"gc_info%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"gc_info%" value=%"false%"/>")
				end
			end
			if an_option.is_header_declared then
				a_cursor := an_option.header.new_cursor
				from a_cursor.start until a_cursor.after loop
					print_indentation (indent, a_file)
					a_file.put_string ("<option name=%"header%" value=%"")
					print_quote_escaped_string (a_cursor.item, a_file)
					a_file.put_line ("%"/>")
					a_cursor.forth
				end
			end
			if an_option.is_heap_size_declared then
				print_indentation (indent, a_file)
				a_file.put_string ("<option name=%"heap_size%" value=%"")
				a_file.put_integer (an_option.heap_size)
				a_file.put_line ("%"/>")
			end
			if an_option.is_high_memory_compiler_declared then
				print_indentation (indent, a_file)
				if an_option.high_memory_compiler then
					a_file.put_line ("<option name=%"high_memory_compiler%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"high_memory_compiler%" value=%"false%"/>")
				end
			end
			if an_option.is_il_verifiable_declared then
				print_indentation (indent, a_file)
				if an_option.il_verifiable then
					a_file.put_line ("<option name=%"il_verifiable%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"il_verifiable%" value=%"false%"/>")
				end
			end
			if an_option.is_include_declared then
				a_cursor := an_option.include.new_cursor
				from a_cursor.start until a_cursor.after loop
					print_indentation (indent, a_file)
					a_file.put_string ("<option name=%"include%" value=%"")
					print_quote_escaped_string (a_cursor.item, a_file)
					a_file.put_line ("%"/>")
					a_cursor.forth
				end
			end
			if an_option.is_inlining_declared then
				a_cursor := an_option.inlining.new_cursor
				from a_cursor.start until a_cursor.after loop
					print_indentation (indent, a_file)
					a_file.put_string ("<option name=%"inlining%" value=%"")
					print_quote_escaped_string (a_cursor.item, a_file)
					a_file.put_line ("%"/>")
					a_cursor.forth
				end
			end
			if an_option.is_inlining_size_declared then
				print_indentation (indent, a_file)
				a_file.put_string ("<option name=%"inlining_size%" value=%"")
				a_file.put_integer (an_option.inlining_size)
				a_file.put_line ("%"/>")
			end
			if an_option.is_jumps_optimization_declared then
				print_indentation (indent, a_file)
				if an_option.jumps_optimization then
					a_file.put_line ("<option name=%"jumps_optimization%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"jumps_optimization%" value=%"false%"/>")
				end
			end
			if an_option.is_layout_declared then
				print_indentation (indent, a_file)
				a_file.put_string ("<option name=%"layout%" value=%"")
				print_quote_escaped_string (an_option.layout, a_file)
				a_file.put_line ("%"/>")
			end
			if an_option.is_layout_optimization_declared then
				print_indentation (indent, a_file)
				if an_option.layout_optimization then
					a_file.put_line ("<option name=%"layout_optimization%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"layout_optimization%" value=%"false%"/>")
				end
			end
			if an_option.is_leaves_optimization_declared then
				print_indentation (indent, a_file)
				if an_option.leaves_optimization then
					a_file.put_line ("<option name=%"leaves_optimization%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"leaves_optimization%" value=%"false%"/>")
				end
			end
			if an_option.is_line_generation_declared then
				print_indentation (indent, a_file)
				if an_option.line_generation then
					a_file.put_line ("<option name=%"line_generation%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"line_generation%" value=%"false%"/>")
				end
			end
			if an_option.is_link_declared then
				a_link_cursor := an_option.link.new_cursor
				from a_link_cursor.start until a_link_cursor.after loop
					print_indentation (indent, a_file)
					a_file.put_string ("<option name=%"link%" value=%"")
					print_quote_escaped_string (a_link_cursor.item, a_file)
					a_file.put_line ("%"/>")
					a_link_cursor.forth
				end
			end
			if an_option.is_linker_declared then
				print_indentation (indent, a_file)
				a_file.put_string ("<option name=%"linker%" value=%"")
				print_quote_escaped_string (an_option.linker, a_file)
				a_file.put_line ("%"/>")
			end
			if an_option.is_linux_fpu_double_precision_declared then
				print_indentation (indent, a_file)
				if an_option.linux_fpu_double_precision then
					a_file.put_line ("<option name=%"linux_fpu_double_precision%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"linux_fpu_double_precision%" value=%"false%"/>")
				end
			end
			if an_option.is_manifest_string_trace_declared then
				print_indentation (indent, a_file)
				if an_option.manifest_string_trace then
					a_file.put_line ("<option name=%"manifest_string_trace%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"manifest_string_trace%" value=%"false%"/>")
				end
			end
			if an_option.is_map_declared then
				print_indentation (indent, a_file)
				if an_option.map then
					a_file.put_line ("<option name=%"map%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"map%" value=%"false%"/>")
				end
			end
			if an_option.is_metadata_cache_path_declared and then attached an_option.metadata_cache_path as l_metadata_cache_path then
				print_indentation (indent, a_file)
				a_file.put_string ("<option name=%"metadata_cache_path%" value=%"")
				print_quote_escaped_string (l_metadata_cache_path, a_file)
				a_file.put_line ("%"/>")
			end
			if an_option.is_msil_assembly_compatibility_declared and then attached an_option.msil_assembly_compatibility as l_msil_assembly_compatibility then
				print_indentation (indent, a_file)
				a_file.put_string ("<option name=%"msil_assembly_compatibility%" value=%"")
				print_quote_escaped_string (l_msil_assembly_compatibility, a_file)
				a_file.put_line ("%"/>")
			end
			if an_option.is_msil_clr_version_declared and then attached an_option.msil_clr_version as l_msil_clr_version then
				print_indentation (indent, a_file)
				a_file.put_string ("<option name=%"msil_clr_version%" value=%"")
				print_quote_escaped_string (l_msil_clr_version, a_file)
				a_file.put_line ("%"/>")
			end
			if an_option.is_msil_generation_declared then
				print_indentation (indent, a_file)
				if an_option.msil_generation then
					a_file.put_line ("<option name=%"msil_generation%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"msil_generation%" value=%"false%"/>")
				end
			end
			if an_option.is_msil_generation_version_declared and then attached an_option.msil_generation_version as l_msil_generation_version then
				print_indentation (indent, a_file)
				a_file.put_string ("<option name=%"msil_generation_version%" value=%"")
				print_quote_escaped_string (l_msil_generation_version, a_file)
				a_file.put_line ("%"/>")
			end
			if an_option.is_multithreaded_declared then
				print_indentation (indent, a_file)
				if an_option.multithreaded then
					a_file.put_line ("<option name=%"multithreaded%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"multithreaded%" value=%"false%"/>")
				end
			end
			if an_option.is_namespace_declared and then attached an_option.namespace as l_namespace then
				print_indentation (indent, a_file)
				a_file.put_string ("<option name=%"namespace%" value=%"")
				print_quote_escaped_string (l_namespace, a_file)
				a_file.put_line ("%"/>")
			end
			if an_option.is_no_default_lib_declared then
				print_indentation (indent, a_file)
				if an_option.no_default_lib then
					a_file.put_line ("<option name=%"no_default_lib%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"no_default_lib%" value=%"false%"/>")
				end
			end
			if an_option.is_override_cluster_declared then
				a_cursor := an_option.override_cluster.new_cursor
				from a_cursor.start until a_cursor.after loop
					print_indentation (indent, a_file)
					a_file.put_string ("<option name=%"override_cluster%" value=%"")
					print_quote_escaped_string (a_cursor.item, a_file)
					a_file.put_line ("%"/>")
					a_cursor.forth
				end
			end
			if an_option.is_portable_code_generation_declared then
				print_indentation (indent, a_file)
				if an_option.portable_code_generation then
					a_file.put_line ("<option name=%"portable_code_generation%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"portable_code_generation%" value=%"false%"/>")
				end
			end
			if an_option.is_precompiled_declared and then attached an_option.precompiled as l_precompiled then
				print_indentation (indent, a_file)
				a_file.put_string ("<option name=%"precompiled%" value=%"")
				print_quote_escaped_string (l_precompiled, a_file)
				a_file.put_line ("%"/>")
			end
			if an_option.is_prefix_option_declared and then attached an_option.prefix_option as l_prefix_option then
				print_indentation (indent, a_file)
				a_file.put_string ("<option name=%"prefix%" value=%"")
				print_quote_escaped_string (l_prefix_option, a_file)
				a_file.put_line ("%"/>")
			end
			if an_option.is_profile_declared then
				print_indentation (indent, a_file)
				if an_option.profile then
					a_file.put_line ("<option name=%"profile%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"profile%" value=%"false%"/>")
				end
			end
			if an_option.is_public_key_token_declared then
				print_indentation (indent, a_file)
				a_file.put_string ("<option name=%"public_key_token%" value=%"")
				print_quote_escaped_string (an_option.public_key_token, a_file)
				a_file.put_line ("%"/>")
			end
			if an_option.is_read_only_declared then
				print_indentation (indent, a_file)
				if an_option.read_only then
					a_file.put_line ("<option name=%"read_only%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"read_only%" value=%"false%"/>")
				end
			end
			if an_option.is_recursive_declared then
				print_indentation (indent, a_file)
				if an_option.recursive then
					a_file.put_line ("<option name=%"recursive%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"recursive%" value=%"false%"/>")
				end
			end
			if an_option.is_reloads_optimization_declared then
				print_indentation (indent, a_file)
				if an_option.reloads_optimization then
					a_file.put_line ("<option name=%"reloads_optimization%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"reloads_optimization%" value=%"false%"/>")
				end
			end
			if an_option.is_shared_library_definition_declared and then attached an_option.shared_library_definition as l_shared_library_definition then
				print_indentation (indent, a_file)
				a_file.put_string ("<option name=%"shared_library_definition%" value=%"")
				print_quote_escaped_string (l_shared_library_definition, a_file)
				a_file.put_line ("%"/>")
			end
			if an_option.is_split_declared then
				print_indentation (indent, a_file)
				if an_option.split then
					a_file.put_line ("<option name=%"split%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"split%" value=%"false%"/>")
				end
			end
			if an_option.is_stack_size_declared then
				print_indentation (indent, a_file)
				a_file.put_string ("<option name=%"stack_size%" value=%"")
				a_file.put_integer (an_option.stack_size)
				a_file.put_line ("%"/>")
			end
			if an_option.is_storable_declared then
				print_indentation (indent, a_file)
				if an_option.storable then
					a_file.put_line ("<option name=%"storable%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"storable%" value=%"false%"/>")
				end
			end
			if an_option.is_storable_filename_declared and then attached an_option.storable_filename as l_storable_filename then
				print_indentation (indent, a_file)
				a_file.put_string ("<option name=%"storable_filename%" value=%"")
				print_quote_escaped_string (l_storable_filename, a_file)
				a_file.put_line ("%"/>")
			end
			if an_option.is_strip_option_declared then
				print_indentation (indent, a_file)
				if an_option.strip_option then
					a_file.put_line ("<option name=%"strip%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"strip%" value=%"false%"/>")
				end
			end
			if an_option.is_target_declared then
				print_indentation (indent, a_file)
				a_file.put_string ("<option name=%"target%" value=%"")
				print_quote_escaped_string (an_option.target, a_file)
				a_file.put_line ("%"/>")
			end
			if an_option.is_trace_declared then
				print_indentation (indent, a_file)
				if an_option.trace then
					a_file.put_line ("<option name=%"trace%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"trace%" value=%"false%"/>")
				end
			end
			if an_option.is_use_cluster_name_as_namespace_declared then
				if an_option.use_cluster_name_as_namespace then
					a_file.put_line ("<option name=%"use_cluster_name_as_namespace%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"use_cluster_name_as_namespace%" value=%"false%"/>")
				end
			end
			if an_option.is_use_full_cluster_name_as_namespace_declared then
				if an_option.use_full_cluster_name_as_namespace then
					a_file.put_line ("<option name=%"use_all_cluster_name_as_namespace%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"use_all_cluster_name_as_namespace%" value=%"false%"/>")
				end
			end
			if an_option.is_verbose_declared then
				print_indentation (indent, a_file)
				if an_option.verbose then
					a_file.put_line ("<option name=%"verbose%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"verbose%" value=%"false%"/>")
				end
			end
			if an_option.is_version_declared then
				print_indentation (indent, a_file)
				a_file.put_string ("<option name=%"version%" value=%"")
				print_quote_escaped_string (an_option.version, a_file)
				a_file.put_line ("%"/>")
			end
			if an_option.is_visible_filename_declared and then attached an_option.visible_filename as l_visible_filename then
				print_indentation (indent, a_file)
				a_file.put_string ("<option name=%"visible_filename%" value=%"")
				print_quote_escaped_string (l_visible_filename, a_file)
				a_file.put_line ("%"/>")
			end
			if an_option.is_warning_declared then
				print_indentation (indent, a_file)
				a_file.put_string ("<option name=%"warning%" value=%"")
				print_quote_escaped_string (an_option.warning, a_file)
				a_file.put_line ("%"/>")
			end
			if an_option.is_wedit_declared then
				print_indentation (indent, a_file)
				if an_option.wedit then
					a_file.put_line ("<option name=%"wedit%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"wedit%" value=%"false%"/>")
				end
			end
		end

	print_console_application_option (an_option: ET_XACE_OPTIONS; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print option 'console_application' to `a_file' if not already done.
		require
			an_option_not_void: an_option /= Void
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
		end

	print_clusters (a_clusters: ET_XACE_CLUSTERS; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print `a_clusters' to `a_file'.
		require
			a_clusters_not_void: a_clusters /= Void
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			i, nb: INTEGER
			cluster_list: DS_ARRAYED_LIST [ET_XACE_CLUSTER]
			a_cluster: ET_XACE_CLUSTER
		do
			cluster_list := a_clusters.clusters
			nb := cluster_list.count
			from i := 1 until i > nb loop
				a_cluster := cluster_list.item (i)
				if not a_cluster.is_implicit then
						-- This cluster has been explicitly declared.
					print_cluster (a_cluster, indent, a_file)
				end
				i := i + 1
			end
		end

	print_cluster (a_cluster: ET_XACE_CLUSTER; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print `a_cluster' to `a_file'.
		require
			a_cluster_not_void: a_cluster /= Void
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			an_option: detachable ET_XACE_OPTIONS
			subclusters: detachable ET_XACE_CLUSTERS
			a_class_options: detachable DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS]
			a_location: detachable STRING
			a_parent: detachable ET_XACE_CLUSTER
			a_cluster_prefix: STRING
			a_library_prefix: STRING
		do
			if not is_shallow or else not a_cluster.is_mounted then
				print_indentation (indent, a_file)
				a_file.put_string ("<cluster name=%"")
				print_quote_escaped_string (a_cluster.name, a_file)
				a_location := a_cluster.pathname
				if a_location /= Void then
					a_file.put_string ("%" location=%"")
					print_quote_escaped_string (a_location, a_file)
					if a_cluster.is_relative then
						a_file.put_string ("%" relative=%"true")
					end
				elseif not a_cluster.is_relative then
					a_file.put_string ("%" relative=%"false")
				end
				a_cluster_prefix := a_cluster.cluster_prefix
				a_parent := a_cluster.parent
				if a_parent = Void or else not STRING_.same_string (a_parent.cluster_prefix, a_cluster_prefix) then
					a_library_prefix := a_cluster.library_prefix
					if not a_library_prefix.is_empty and (a_cluster.is_mounted or not is_shallow) then
						a_file.put_string ("%" prefix=%"")
						print_quote_escaped_string (a_library_prefix, a_file)
						if not a_cluster_prefix.is_empty then
							print_quote_escaped_string (a_cluster_prefix, a_file)
						end
					elseif not a_cluster_prefix.is_empty then
						a_file.put_string ("%" prefix=%"")
						print_quote_escaped_string (a_cluster_prefix, a_file)
					end
				end
				an_option := a_cluster.options
				a_class_options := a_cluster.class_options
				subclusters := a_cluster.subclusters
				if an_option = Void and a_class_options = Void and subclusters = Void then
					a_file.put_line ("%"/>")
				else
					a_file.put_line ("%">")
					if an_option /= Void then
						print_options (an_option, indent + 1, a_file)
					end
					if a_class_options /= Void then
						print_class_options (a_class_options, indent + 1, a_file)
					end
					if subclusters /= Void then
						print_clusters (subclusters, indent + 1, a_file)
					end
					print_indentation (indent, a_file)
					a_file.put_line ("</cluster>")
				end
			end
		end

	print_class_options (an_option_list: DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS]; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print class options `an_option_list' to `a_file'.
		require
			an_option_list_not_void: an_option_list /= Void
			no_void_option: not an_option_list.has_void
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			a_class_cursor: DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS]
			a_class_options: ET_XACE_CLASS_OPTIONS
			a_feature_options: detachable DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS]
		do
			a_class_cursor := an_option_list.new_cursor
			from a_class_cursor.start until a_class_cursor.after loop
				a_class_options := a_class_cursor.item
				print_indentation (indent, a_file)
				a_file.put_string ("<class name=%"")
				print_quote_escaped_string (a_class_options.class_name, a_file)
				a_file.put_line ("%">")
				print_options (a_class_options.options, indent + 1, a_file)
				a_feature_options := a_class_options.feature_options
				if a_feature_options /= Void then
					print_feature_options (a_feature_options, indent + 1, a_file)
				end
				a_class_cursor.forth
				print_indentation (indent, a_file)
				a_file.put_line ("</class>")
			end
		end

	print_feature_options (an_option_list: DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS]; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print feature options `an_option_list' to `a_file'.
		require
			an_option_list_not_void: an_option_list /= Void
			no_void_option: not an_option_list.has_void
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			a_feature_cursor: DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS]
			a_feature_options: ET_XACE_FEATURE_OPTIONS
		do
			a_feature_cursor := an_option_list.new_cursor
			from a_feature_cursor.start until a_feature_cursor.after loop
				a_feature_options := a_feature_cursor.item
				print_indentation (indent, a_file)
				a_file.put_string ("<feature name=%"")
				print_quote_escaped_string (a_feature_options.feature_name, a_file)
				a_file.put_line ("%">")
				print_options (a_feature_options.options, indent + 1, a_file)
				a_feature_cursor.forth
				print_indentation (indent, a_file)
				a_file.put_line ("</feature>")
			end
		end

	print_mounted_libraries (a_mounted_libraries: ET_XACE_MOUNTED_LIBRARIES; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print `a_mounted_libraries' to `a_file'.
		require
			a_mounted_libraries_not_void: a_mounted_libraries /= Void
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			i, nb: INTEGER
			library_list: DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY]
			a_library: ET_XACE_MOUNTED_LIBRARY
		do
			if is_shallow then
				library_list := a_mounted_libraries.libraries
				nb := library_list.count
				from i := 1 until i > nb loop
					a_library := library_list.item (i)
					if a_library.is_root then
						print_indentation (indent, a_file)
						a_file.put_string ("<mount location=%"")
						print_quote_escaped_string (a_library.pathname, a_file)
						a_file.put_line ("%"/>")
					end
					i := i + 1
				end
			end
		end

	print_escaped_string (a_string: STRING; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print escaped version of `a_string' to `a_file'.
		require
			a_string_not_void: a_string /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			last_escaped: INTEGER
			i: INTEGER
			cnt: INTEGER
			a_char: INTEGER
		do
			from
				last_escaped := 0
				i := 1
				cnt := a_string.count
			invariant
				last_escaped <= i
			until
				i > cnt
			loop
				a_char := a_string.item_code (i)
				if is_escaped (a_char) then
					if last_escaped < i - 1 then
						a_file.put_string (a_string.substring (last_escaped + 1, i - 1))
					end
					print_escaped_character (a_char, a_file)
					last_escaped := i
				end
				i := i + 1
			end
				-- At exit.
			if last_escaped = 0 then
				a_file.put_string (a_string)
			elseif last_escaped < i - 1 then
				a_file.put_string (a_string.substring (last_escaped + 1, i - 1))
			end
		end

	print_quote_escaped_string (a_string: STRING; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print escaped version of `a_string' (with quotes also
			-- escaped for attribute values) to `a_file'.
		require
			a_string_not_void: a_string /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			last_escaped: INTEGER
			i: INTEGER
			cnt: INTEGER
		do
			from
				last_escaped := 0
				i := 1
				cnt := a_string.count
			invariant
				last_escaped <= i
			until
				i > cnt
			loop
				if a_string.item_code (i) = Quot_char.code then
					if last_escaped < i - 1 then
						print_escaped_string (a_string.substring (last_escaped + 1, i - 1), a_file)
					end
					a_file.put_string (Quot_entity)
					last_escaped := i
				end
				i := i + 1
			end
				-- At exit.
			if last_escaped = 0 then
				print_escaped_string (a_string, a_file)
			elseif last_escaped < i - 1 then
				print_escaped_string (a_string.substring (last_escaped + 1, i - 1), a_file)
			end
		end

	print_escaped_character (a_char: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print escaped version of `a_char' to `a_file'.
		require
			is_escaped: is_escaped (a_char)
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			if a_char = Lt_char.code then
				a_file.put_string (Lt_entity)
			elseif a_char = Gt_char.code then
				a_file.put_string (Gt_entity)
			elseif a_char = Amp_char.code then
				a_file.put_string (Amp_entity)
			elseif a_char = Quot_char.code then
				a_file.put_string (Quot_entity)
			else
				a_file.put_string ("&#")
				a_file.put_integer (a_char)
				a_file.put_character (';')
			end
		end

feature {NONE} -- Escaped

	is_escaped (a_char: INTEGER): BOOLEAN
			-- Is this an escapable character?
		do
			Result := a_char = Lt_char.code
				or a_char = Gt_char.code
				or a_char = Amp_char.code
		end

end
