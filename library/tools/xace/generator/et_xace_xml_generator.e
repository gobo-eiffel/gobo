indexing

	description:

		"Ace file generators to XML files"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_XML_GENERATOR

inherit

	ET_XACE_GENERATOR

creation

	make

feature -- Access

	xml_filename: STRING is "xace.xml"
			-- Name of generated XML file

feature -- Output

	generate_system (a_system: ET_XACE_SYSTEM) is
			-- Generate a new XML file from `a_system'.
		local
			a_filename: STRING
			a_file: KL_TEXT_OUTPUT_FILE
		do
			if output_filename /= Void then
				a_filename := output_filename
			else
				a_filename := xml_filename
			end
			!! a_file.make (a_filename)
			a_file.open_write
			if a_file.is_open_write then
				print_xml_system_file (a_system, a_file)
				a_file.close
			else
				error_handler.report_cannot_write_file_error (a_filename)
			end
		end

	generate_cluster (a_cluster: ET_XACE_CLUSTER) is
			-- Generate a new XML file from `a_cluster'.
		local
			a_filename: STRING
			a_file: KL_TEXT_OUTPUT_FILE
		do
			if output_filename /= Void then
				a_filename := output_filename
			else
				a_filename := xml_filename
			end
			!! a_file.make (a_filename)
			a_file.open_write
			if a_file.is_open_write then
				print_xml_cluster_file (a_cluster, a_file)
				a_file.close
			else
				error_handler.report_cannot_write_file_error (a_filename)
			end
		end

feature {NONE} -- Output

	print_xml_system_file (a_system: ET_XACE_SYSTEM; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print XML version of `a_system' to `a_file'.
		require
			a_system_not_void: a_system /= Void
			system_name_not_void: a_system.system_name /= Void
			root_class_name_not_void: a_system.root_class_name /= Void
			creation_procedure_name_not_void: a_system.creation_procedure_name /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			a_clusters: ET_XACE_CLUSTERS
			an_option: ET_XACE_OPTIONS
			an_external: ET_XACE_EXTERNALS
		do
			a_file.put_line ("<?xml version=%"1.0%"?>")
			a_file.put_new_line
			a_file.put_string ("<system name=%"")
			a_file.put_string (a_system.system_name)
			a_file.put_line ("%">")
			print_indentation (1, a_file)
			a_file.put_string ("<root class=%"")
			a_file.put_string (a_system.root_class_name)
			a_file.put_string ("%" creation=%"")
			a_file.put_string (a_system.creation_procedure_name)
			a_file.put_line ("%"/>")
			print_indentation (1, a_file)
			a_file.put_line ("<cluster>")
			an_option := a_system.options
			if an_option /= Void then
				print_options (an_option, 2, a_file)
			end
			a_clusters := a_system.clusters
			if a_clusters /= Void then
				print_clusters (a_clusters, 2, a_file)
			end
			an_external := a_system.externals
			if an_external /= Void then
				print_externals (an_external, 2, a_file)
			end
			print_indentation (1, a_file)
			a_file.put_line ("</cluster>")
			a_file.put_line ("</system>")
		end

	print_xml_cluster_file (a_cluster: ET_XACE_CLUSTER; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print XML version of `a_cluster' to `a_file'.
		require
			a_cluster_not_void: a_cluster /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_line ("<?xml version=%"1.0%"?>")
			a_file.put_new_line
			print_cluster (a_cluster, 0, a_file)
		end

	print_options (an_option: ET_XACE_OPTIONS; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print `an_option' to `a_file'.
		require
			an_option_not_void: an_option /= Void
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			a_cursor: DS_HASH_SET_CURSOR [STRING]
		do
			print_indentation (indent, a_file)
			a_file.put_line ("<option>")
			if an_option.is_address_expression_declared then
				print_indentation (indent + 1, a_file)
				if an_option.address_expression then
					a_file.put_line ("<option name=%"address_expression%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"address_expression%" value=%"false%"/>")
				end
			end
			if an_option.is_arguments_declared then
				a_cursor := an_option.arguments.new_cursor
				from a_cursor.start until a_cursor.after loop
					print_indentation (indent + 1, a_file)
					a_file.put_string ("<option name=%"arguments%" value=%"")
					a_file.put_string (a_cursor.item)
					a_file.put_line ("%"/>")
					a_cursor.forth
				end
			end
			if an_option.is_array_optimization_declared then
				print_indentation (indent + 1, a_file)
				if an_option.array_optimization then
					a_file.put_line ("<option name=%"array_optimization%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"array_optimization%" value=%"false%"/>")
				end
			end
			if an_option.is_assertion_declared then
				a_cursor := an_option.assertion.new_cursor
				from a_cursor.start until a_cursor.after loop
					print_indentation (indent + 1, a_file)
					a_file.put_string ("<option name=%"assertion%" value=%"")
					a_file.put_string (a_cursor.item)
					a_file.put_line ("%"/>")
					a_cursor.forth
				end
			end
			if an_option.is_case_insensitive_declared then
				print_indentation (indent + 1, a_file)
				if an_option.case_insensitive then
					a_file.put_line ("<option name=%"case_insensitive%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"case_insensitive%" value=%"false%"/>")
				end
			end
			if an_option.is_check_vape_declared then
				print_indentation (indent + 1, a_file)
				if an_option.check_vape then
					a_file.put_line ("<option name=%"check_vape%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"check_vape%" value=%"false%"/>")
				end
			end
			if an_option.is_clean_declared then
				print_indentation (indent + 1, a_file)
				if an_option.clean then
					a_file.put_line ("<option name=%"clean%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"clean%" value=%"false%"/>")
				end
			end
			if an_option.is_component_declared then
				print_indentation (indent + 1, a_file)
				a_file.put_string ("<option name=%"component%" value=%"")
				a_file.put_string (an_option.component)
				a_file.put_line ("%"/>")
			end
			if an_option.is_console_application_declared then
				print_indentation (indent + 1, a_file)
				if an_option.console_application then
					a_file.put_line ("<option name=%"console_application%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"console_application%" value=%"false%"/>")
				end
			end
			if an_option.is_create_keyword_extension_declared then
				print_indentation (indent + 1, a_file)
				if an_option.create_keyword_extension then
					a_file.put_line ("<option name=%"create_keyword_extension%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"create_keyword_extension%" value=%"false%"/>")
				end
			end
			if an_option.is_dead_code_removal_declared then
				a_cursor := an_option.dead_code_removal.new_cursor
				from a_cursor.start until a_cursor.after loop
					print_indentation (indent + 1, a_file)
					a_file.put_string ("<option name=%"dead_code_removal%" value=%"")
					a_file.put_string (a_cursor.item)
					a_file.put_line ("%"/>")
					a_cursor.forth
				end
			end
			if an_option.is_debug_option_declared then
				print_indentation (indent + 1, a_file)
				if an_option.debug_option then
					a_file.put_line ("<option name=%"debug%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"debug%" value=%"false%"/>")
				end
			end
			if an_option.is_debug_tag_declared then
				a_cursor := an_option.debug_tag.new_cursor
				from a_cursor.start until a_cursor.after loop
					print_indentation (indent + 1, a_file)
					a_file.put_string ("<option name=%"debug_tag%" value=%"")
					a_file.put_string (a_cursor.item)
					a_file.put_line ("%"/>")
					a_cursor.forth
				end
			end
			if an_option.is_debugger_declared then
				print_indentation (indent + 1, a_file)
				if an_option.debugger then
					a_file.put_line ("<option name=%"debugger%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"debugger%" value=%"false%"/>")
				end
			end
			if an_option.is_document_declared then
				print_indentation (indent + 1, a_file)
				a_file.put_string ("<option name=%"document%" value=%"")
				a_file.put_string (an_option.document)
				a_file.put_line ("%"/>")
			end
			if an_option.is_dynamic_runtime_declared then
				print_indentation (indent + 1, a_file)
				if an_option.dynamic_runtime then
					a_file.put_line ("<option name=%"dynamic_runtime%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"dynamic_runtime%" value=%"false%"/>")
				end
			end
			if an_option.is_exception_trace_declared then
				print_indentation (indent + 1, a_file)
				if an_option.exception_trace then
					a_file.put_line ("<option name=%"exception_trace%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"exception_trace%" value=%"false%"/>")
				end
			end
			if an_option.is_finalize_declared then
				print_indentation (indent + 1, a_file)
				if an_option.finalize then
					a_file.put_line ("<option name=%"finalize%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"finalize%" value=%"false%"/>")
				end
			end
			if an_option.is_flat_fst_optimization_declared then
				print_indentation (indent + 1, a_file)
				if an_option.flat_fst_optimization then
					a_file.put_line ("<option name=%"flat_fst_optimization%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"flat_fst_optimization%" value=%"false%"/>")
				end
			end
			if an_option.is_fst_expansion_factor_declared then
				print_indentation (indent + 1, a_file)
				a_file.put_string ("<option name=%"fst_expansion_factor%" value=%"")
				a_file.put_integer (an_option.fst_expansion_factor)
				a_file.put_line ("%"/>")
			end
			if an_option.is_fst_optimization_declared then
				print_indentation (indent + 1, a_file)
				if an_option.fst_optimization then
					a_file.put_line ("<option name=%"fst_optimization%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"fst_optimization%" value=%"false%"/>")
				end
			end
			if an_option.is_garbage_collector_declared then
				print_indentation (indent + 1, a_file)
				a_file.put_string ("<option name=%"garbage_collector%" value=%"")
				a_file.put_string (an_option.garbage_collector)
				a_file.put_line ("%"/>")
			end
			if an_option.is_gc_info_declared then
				print_indentation (indent + 1, a_file)
				if an_option.gc_info then
					a_file.put_line ("<option name=%"gc_info%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"gc_info%" value=%"false%"/>")
				end
			end
			if an_option.is_heap_size_declared then
				print_indentation (indent + 1, a_file)
				a_file.put_string ("<option name=%"heap_size%" value=%"")
				a_file.put_integer (an_option.heap_size)
				a_file.put_line ("%"/>")
			end
			if an_option.is_inlining_declared then
				a_cursor := an_option.inlining.new_cursor
				from a_cursor.start until a_cursor.after loop
					print_indentation (indent + 1, a_file)
					a_file.put_string ("<option name=%"inlining%" value=%"")
					a_file.put_string (a_cursor.item)
					a_file.put_line ("%"/>")
					a_cursor.forth
				end
			end
			if an_option.is_inlining_size_declared then
				print_indentation (indent + 1, a_file)
				a_file.put_string ("<option name=%"inlining_size%" value=%"")
				a_file.put_integer (an_option.inlining_size)
				a_file.put_line ("%"/>")
			end
			if an_option.is_jumps_optimization_declared then
				print_indentation (indent + 1, a_file)
				if an_option.jumps_optimization then
					a_file.put_line ("<option name=%"jumps_optimization%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"jumps_optimization%" value=%"false%"/>")
				end
			end
			if an_option.is_layout_optimization_declared then
				print_indentation (indent + 1, a_file)
				if an_option.layout_optimization then
					a_file.put_line ("<option name=%"layout_optimization%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"layout_optimization%" value=%"false%"/>")
				end
			end
			if an_option.is_leaves_optimization_declared then
				print_indentation (indent + 1, a_file)
				if an_option.leaves_optimization then
					a_file.put_line ("<option name=%"leaves_optimization%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"leaves_optimization%" value=%"false%"/>")
				end
			end
			if an_option.is_line_generation_declared then
				print_indentation (indent + 1, a_file)
				if an_option.line_generation then
					a_file.put_line ("<option name=%"line_generation%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"line_generation%" value=%"false%"/>")
				end
			end
			if an_option.is_linker_declared then
				print_indentation (indent + 1, a_file)
				a_file.put_string ("<option name=%"linker%" value=%"")
				a_file.put_string (an_option.linker)
				a_file.put_line ("%"/>")
			end
			if an_option.is_linux_fpu_double_precision_declared then
				print_indentation (indent + 1, a_file)
				if an_option.linux_fpu_double_precision then
					a_file.put_line ("<option name=%"linux_fpu_double_precision%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"linux_fpu_double_precision%" value=%"false%"/>")
				end
			end
			if an_option.is_manifest_string_trace_declared then
				print_indentation (indent + 1, a_file)
				if an_option.manifest_string_trace then
					a_file.put_line ("<option name=%"manifest_string_trace%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"manifest_string_trace%" value=%"false%"/>")
				end
			end
			if an_option.is_map_declared then
				print_indentation (indent + 1, a_file)
				if an_option.map then
					a_file.put_line ("<option name=%"map%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"map%" value=%"false%"/>")
				end
			end
			if an_option.is_multithreaded_declared then
				print_indentation (indent + 1, a_file)
				if an_option.multithreaded then
					a_file.put_line ("<option name=%"multithreaded%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"multithreaded%" value=%"false%"/>")
				end
			end
			if an_option.is_no_default_lib_declared then
				print_indentation (indent + 1, a_file)
				if an_option.no_default_lib then
					a_file.put_line ("<option name=%"no_default_lib%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"no_default_lib%" value=%"false%"/>")
				end
			end
			if an_option.is_override_cluster_declared then
				print_indentation (indent + 1, a_file)
				a_file.put_string ("<option name=%"override_cluster%" value=%"")
				a_file.put_string (an_option.override_cluster)
				a_file.put_line ("%"/>")
			end
			if an_option.is_portable_code_generation_declared then
				print_indentation (indent + 1, a_file)
				if an_option.portable_code_generation then
					a_file.put_line ("<option name=%"portable_code_generation%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"portable_code_generation%" value=%"false%"/>")
				end
			end
			if an_option.is_precompiled_declared then
				print_indentation (indent + 1, a_file)
				a_file.put_string ("<option name=%"precompiled%" value=%"")
				a_file.put_string (an_option.precompiled)
				a_file.put_line ("%"/>")
			end
			if an_option.is_profile_declared then
				print_indentation (indent + 1, a_file)
				if an_option.profile then
					a_file.put_line ("<option name=%"profile%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"profile%" value=%"false%"/>")
				end
			end
			if an_option.is_reloads_optimization_declared then
				print_indentation (indent + 1, a_file)
				if an_option.reloads_optimization then
					a_file.put_line ("<option name=%"reloads_optimization%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"reloads_optimization%" value=%"false%"/>")
				end
			end
			if an_option.is_shared_library_definition_declared then
				print_indentation (indent + 1, a_file)
				a_file.put_string ("<option name=%"shared_library_definition%" value=%"")
				a_file.put_string (an_option.shared_library_definition)
				a_file.put_line ("%"/>")
			end
			if an_option.is_split_declared then
				print_indentation (indent + 1, a_file)
				if an_option.split then
					a_file.put_line ("<option name=%"split%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"split%" value=%"false%"/>")
				end
			end
			if an_option.is_stack_size_declared then
				print_indentation (indent + 1, a_file)
				a_file.put_string ("<option name=%"stack_size%" value=%"")
				a_file.put_integer (an_option.stack_size)
				a_file.put_line ("%"/>")
			end
			if an_option.is_storable_filename_declared then
				print_indentation (indent + 1, a_file)
				a_file.put_string ("<option name=%"storable_filename%" value=%"")
				a_file.put_string (an_option.storable_filename)
				a_file.put_line ("%"/>")
			end
			if an_option.is_strip_option_declared then
				print_indentation (indent + 1, a_file)
				if an_option.strip_option then
					a_file.put_line ("<option name=%"strip%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"strip%" value=%"false%"/>")
				end
			end
			if an_option.is_target_declared then
				print_indentation (indent + 1, a_file)
				a_file.put_string ("<option name=%"target%" value=%"")
				a_file.put_string (an_option.target)
				a_file.put_line ("%"/>")
			end
			if an_option.is_trace_declared then
				print_indentation (indent + 1, a_file)
				if an_option.trace then
					a_file.put_line ("<option name=%"trace%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"trace%" value=%"false%"/>")
				end
			end
			if an_option.is_verbose_declared then
				print_indentation (indent + 1, a_file)
				if an_option.verbose then
					a_file.put_line ("<option name=%"verbose%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"verbose%" value=%"false%"/>")
				end
			end
			if an_option.is_visible_filename_declared then
				print_indentation (indent + 1, a_file)
				a_file.put_string ("<option name=%"visible_filename%" value=%"")
				a_file.put_string (an_option.visible_filename)
				a_file.put_line ("%"/>")
			end
			if an_option.is_warning_declared then
				print_indentation (indent + 1, a_file)
				a_file.put_string ("<option name=%"warning%" value=%"")
				a_file.put_string (an_option.warning)
				a_file.put_line ("%"/>")
			end
			if an_option.is_wedit_declared then
				print_indentation (indent + 1, a_file)
				if an_option.wedit then
					a_file.put_line ("<option name=%"wedit%" value=%"true%"/>")
				else
					a_file.put_line ("<option name=%"wedit%" value=%"false%"/>")
				end
			end
			print_indentation (indent, a_file)
			a_file.put_line ("</option>")
		end

	print_clusters (a_clusters: ET_XACE_CLUSTERS; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print `a_clusters' to `a_file'.
		require
			a_clusters_not_void: a_clusters /= Void
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			i, nb: INTEGER
			cluster_list: DS_ARRAYED_LIST [ET_XACE_CLUSTER]
		do
			cluster_list := a_clusters.clusters
			nb := cluster_list.count
			from i := 1 until i > nb loop
				print_cluster (cluster_list.item (i), indent, a_file)
				i := i + 1
			end
		end

	print_cluster (a_cluster: ET_XACE_CLUSTER; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print `a_cluster' to `a_file'.
		require
			a_cluster_not_void: a_cluster /= Void
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			an_option: ET_XACE_OPTIONS
			subclusters: ET_XACE_CLUSTERS
			an_externals: ET_XACE_EXTERNALS
			a_location: STRING
		do
			print_indentation (indent, a_file)
			if a_cluster.is_mounted then
				a_file.put_string ("<cluster name=%"")
				a_file.put_string (a_cluster.full_name ('_'))
				a_file.put_string ("%" location=%"")
				a_file.put_string (a_cluster.full_pathname)
			else
				a_file.put_string ("<cluster name=%"")
				a_file.put_string (a_cluster.name)
				a_location := a_cluster.pathname
				if a_location /= Void then
					a_file.put_string ("%" location=%"")
					a_file.put_string (a_location)
				end
			end
			if a_cluster.is_abstract then
				a_file.put_string ("%" abstract=%"True")
			end
			an_option := a_cluster.options
			subclusters := a_cluster.subclusters
			an_externals := a_cluster.externals
			if an_option = Void and subclusters = Void and an_externals = Void then
				a_file.put_line ("%"/>")
			else
				a_file.put_line ("%">")
				if an_option /= Void then
					print_options (an_option, indent + 1, a_file)
				end
				if subclusters /= Void then
					print_clusters (subclusters, indent + 1, a_file)
				end
				if an_externals /= Void then
					print_externals (an_externals, indent + 1, a_file)
				end
				print_indentation (indent, a_file)
				a_file.put_line ("</cluster>")
			end
		end

	print_externals (an_external: ET_XACE_EXTERNALS; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print `an_external' to `a_file'.
		require
			an_xternal_not_void: an_external /= Void
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			a_cursor: DS_LINKED_LIST_CURSOR [ET_XACE_EXPORTED_CLASS]
		do
			print_indentation (indent, a_file)
			a_file.put_line ("<external>")
			a_cursor := an_external.exported_classes.new_cursor
			from a_cursor.start until a_cursor.after loop
				print_exported_class (a_cursor.item, indent + 1, a_file)
				a_cursor.forth
			end
			print_include_directories (an_external.include_directories, indent + 1, a_file)
			print_link_libraries (an_external.link_libraries, indent + 1, a_file)
			print_indentation (indent, a_file)
			a_file.put_line ("</external>")
		end

	print_exported_class (a_class: ET_XACE_EXPORTED_CLASS; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print `a_class' to `a_file'.
		require
			a_class_not_void: a_class /= Void
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			a_cursor: DS_LINKED_LIST_CURSOR [ET_XACE_EXPORTED_FEATURE]
		do
			print_indentation (indent, a_file)
			a_file.put_string ("<export class=%"")
			a_file.put_string (a_class.class_name)
			if a_class.features.is_empty then
				a_file.put_line ("%"/>")
			else
				a_file.put_line ("%">")
				a_cursor := a_class.features.new_cursor
				from a_cursor.start until a_cursor.after loop
					print_indentation (indent + 1, a_file)
					a_file.put_string ("<feature name=%"")
					a_file.put_string (a_cursor.item.feature_name)
					a_file.put_string ("%" alias=%"")
					a_file.put_string (a_cursor.item.external_name)
					a_file.put_string ("%"/>")
					a_cursor.forth
				end
			end
		end

	print_include_directories (a_directories: DS_LINKED_LIST [STRING]; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print `a_directories' to `a_file'.
		require
			a_directories_not_void: a_directories /= Void
			no_void_directory: not a_directories.has (Void)
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			a_cursor: DS_LINKED_LIST_CURSOR [STRING]
		do
			a_cursor := a_directories.new_cursor
			from a_cursor.start until a_cursor.after loop
				print_indentation (indent, a_file)
				a_file.put_string ("<include_dir location=%"")
				a_file.put_string (a_cursor.item)
				a_file.put_line ("%"/>")
				a_cursor.forth
			end
		end

	print_link_libraries (a_libraries: DS_LINKED_LIST [STRING]; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print `a_libraries' to `a_file'.
		require
			a_libraries_not_void: a_libraries /= Void
			no_void_library: not a_libraries.has (Void)
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			a_cursor: DS_LINKED_LIST_CURSOR [STRING]
		do
			a_cursor := a_libraries.new_cursor
			from a_cursor.start until a_cursor.after loop
				print_indentation (indent, a_file)
				a_file.put_string ("<link_library location=%"")
				a_file.put_string (a_cursor.item)
				a_file.put_line ("%"/>")
				a_cursor.forth
			end
		end

end
