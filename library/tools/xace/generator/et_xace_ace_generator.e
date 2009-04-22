indexing

	description:

		"Ace file generators from Xace files"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2008, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_ACE_GENERATOR

inherit

	ET_XACE_GENERATOR
		redefine
			print_escaped_name
		end

	KL_IMPORTED_ARRAY_ROUTINES

	UT_STRING_ROUTINES
		export {NONE} all end

create

	make

feature -- Access

	default_system_output_filename: STRING is
			-- Name of generated Ace file
		once
			Result := compiler + ".ace"
		end

	default_library_output_filename: STRING is
			-- Name of generated library Ace file
		once
			Result := compiler + ".ace"
		end

feature -- Output

	generate_system (a_system: ET_XACE_SYSTEM_CONFIG; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Generate a new Ace file from `a_system'.
		do
			print_ace_file (a_system, a_file)
		end

	generate_library (a_library: ET_XACE_LIBRARY_CONFIG; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Generate a new Ace file from `a_library'.
		do
			print_precompile_ace_file (a_library, a_file)
		end

feature {NONE} -- Output

	print_ace_file (a_system: ET_XACE_SYSTEM_CONFIG; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print Ace `a_system' to `a_file'.
		require
			a_system_not_void: a_system /= Void
			system_name_not_void: a_system.system_name /= Void
			system_name_not_empty: a_system.system_name.count > 0
			root_class_name_not_void: a_system.root_class_name /= Void
			root_class_name_not_empty: a_system.root_class_name.count > 0
			creation_procedure_name_not_void: a_system.creation_procedure_name /= Void
			creation_procedure_name_not_empty: a_system.creation_procedure_name.count > 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			an_option: ET_XACE_OPTIONS
			a_clusters: ET_XACE_CLUSTERS
			an_external: ET_XACE_EXTERNALS
		do
			a_file.put_line ("system")
			a_file.put_new_line
			print_indentation (1, a_file)
			print_escaped_name (a_system.system_name, a_file)
			a_file.put_new_line
			a_file.put_new_line
			a_file.put_line ("root")
			a_file.put_new_line
			print_indentation (1, a_file)
			print_escaped_name (a_system.root_class_name, a_file)
			a_file.put_string (": ")
			print_escaped_name (a_system.creation_procedure_name, a_file)
			a_file.put_new_line
			a_file.put_new_line
			an_option := a_system.options
			if an_option /= Void then
				a_file.put_line ("default")
				a_file.put_new_line
				print_options (an_option, 1, a_file)
				a_file.put_new_line
			end
			a_file.put_line ("cluster")
			a_file.put_new_line
			a_clusters := a_system.clusters
			if a_clusters /= Void then
				print_clusters (a_clusters, a_file)
				a_file.put_new_line
				print_assemblies (a_clusters, a_file)
			end
			create an_external.make
			a_system.merge_externals (an_external)
			if
				an_external.has_c_compiler_options or
				an_external.has_link_libraries or
				an_external.has_include_directories
			then
				a_file.put_line ("external")
				a_file.put_new_line
				print_c_compiler_options_and_include_directories (an_external.c_compiler_options,
					an_external.include_directories, a_file)
				print_link_libraries (an_external.link_libraries, a_file)
			end
			a_file.put_line ("end")
		end

	print_precompile_ace_file (a_library: ET_XACE_LIBRARY_CONFIG; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print precompilation Ace file to `a_file'.
		require
			a_library_not_void: a_library /= Void
			a_library_name_not_void: a_library.name /= Void
			a_library_name_not_empty: a_library.name.count > 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			an_option: ET_XACE_OPTIONS
			an_external: ET_XACE_EXTERNALS
			a_clusters: ET_XACE_CLUSTERS
		do
			a_file.put_line ("system")
			a_file.put_new_line
			print_indentation (1, a_file)
			print_escaped_name (a_library.name, a_file)
			a_file.put_new_line
			a_file.put_new_line
			a_file.put_line ("root")
			a_file.put_new_line
			print_indentation (1, a_file)
			print_escaped_name ("NONE", a_file)
			a_file.put_new_line
			a_file.put_new_line
			an_option := a_library.options
			if an_option /= Void then
				a_file.put_line ("default")
				a_file.put_new_line
				print_options (an_option, 1, a_file)
				a_file.put_new_line
			end
			a_file.put_line ("cluster")
			a_file.put_new_line
			a_clusters := a_library.clusters
			if a_clusters /= Void then
				print_clusters (a_clusters, a_file)
				a_file.put_new_line
				print_assemblies (a_clusters, a_file)
			end
			create an_external.make
			a_library.merge_externals (an_external)
			if
				an_external.has_c_compiler_options or
				an_external.has_link_libraries or
				an_external.has_include_directories
			then
				a_file.put_line ("external")
				a_file.put_new_line
				print_c_compiler_options_and_include_directories (an_external.c_compiler_options,
					an_external.include_directories, a_file)
				print_link_libraries (an_external.link_libraries, a_file)
			end
			a_file.put_line ("end")
		end

	print_assemblies (a_clusters: ET_XACE_CLUSTERS; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' the assembly clause for
			-- `a_clusters' and recursively their subclusters.
		require
			a_clusters_not_void: a_clusters /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			an_assemblies: DS_LINKED_LIST [ET_XACE_ASSEMBLY]
			a_cursor: DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY]
			an_assembly: ET_XACE_ASSEMBLY
			a_pathname: STRING
			a_prefix: STRING
		do
			create an_assemblies.make
			a_clusters.merge_assemblies (an_assemblies)
			if not an_assemblies.is_empty then
				a_file.put_line ("assembly")
				a_file.put_new_line
				a_cursor := an_assemblies.new_cursor
				from a_cursor.start until a_cursor.after loop
					an_assembly := a_cursor.item
					print_indentation (1, a_file)
					print_escaped_name (an_assembly.tag, a_file)
					a_file.put_string (": %"")
					a_pathname := an_assembly.assembly_pathname
					if a_pathname /= Void and then not a_pathname.is_empty then
						a_file.put_string (a_pathname)
					else
						a_file.put_string (an_assembly.assembly_name)
						a_file.put_string ("%", %"")
						a_file.put_string (an_assembly.version)
						a_file.put_string ("%", %"")
						a_file.put_string (an_assembly.culture)
						a_file.put_string ("%", %"")
						a_file.put_string (an_assembly.public_key_token)
					end
					a_file.put_line ("%"")
					a_prefix := an_assembly.class_prefix
					if a_prefix /= Void then
						print_indentation (2, a_file)
						a_file.put_line ("prefix")
						print_indentation (3, a_file)
						a_file.put_character ('%"')
						a_file.put_string (a_prefix)
						a_file.put_line ("%"")
						print_indentation (2, a_file)
						a_file.put_line ("end")
					end
					a_file.put_new_line
					a_cursor.forth
				end
			end
		end

	print_options (an_option: ET_XACE_OPTIONS; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print `an_option' to `a_file'.
		require
			an_option_not_void: an_option /= Void
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			an_arguments_cursor: DS_HASH_SET_CURSOR [STRING]
			an_assertion: DS_HASH_SET [STRING]
			a_dead_code_removal: DS_HASH_SET [STRING]
			a_cursor: DS_HASH_SET_CURSOR [STRING]
			an_inlining: DS_HASH_SET [STRING]
			a_target: STRING
		do
			if an_option.address_expression then
				print_indentation (indent, a_file)
				a_file.put_line ("address_expression (yes)")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("address_expression (no)")
			end
			an_arguments_cursor := an_option.arguments.new_cursor
			from an_arguments_cursor.start until an_arguments_cursor.after loop
				print_indentation (indent, a_file)
				a_file.put_string ("arguments (%"")
				a_file.put_string (an_arguments_cursor.item)
				a_file.put_line ("%")")
				an_arguments_cursor.forth
			end
			if an_option.array_optimization then
				print_indentation (indent, a_file)
				a_file.put_line ("array_optimization (yes)")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("array_optimization (no)")
			end
			an_assertion := an_option.assertion
			if an_assertion.has (options.none_value) then
				print_indentation (indent, a_file)
				a_file.put_line ("assertion (no)")
			end
			if an_assertion.has (options.generate_value) then
				print_indentation (indent, a_file)
				a_file.put_line ("assertion (no)")
			end
			if an_assertion.has (options.require_value) then
				print_indentation (indent, a_file)
				a_file.put_line ("assertion (require)")
			end
			if an_assertion.has (options.ensure_value) then
				print_indentation (indent, a_file)
				a_file.put_line ("assertion (ensure)")
			end
			if an_assertion.has (options.invariant_value) then
				print_indentation (indent, a_file)
				a_file.put_line ("assertion (invariant)")
			end
			if an_assertion.has (options.loop_invariant_value) then
				print_indentation (indent, a_file)
				a_file.put_line ("assertion (loop)")
			end
			if an_assertion.has (options.loop_variant_value) then
				print_indentation (indent, a_file)
				a_file.put_line ("assertion (loop)")
			end
			if an_assertion.has (options.check_value) then
				print_indentation (indent, a_file)
				a_file.put_line ("assertion (check)")
			end
			if an_assertion.has (options.all_value) then
				print_indentation (indent, a_file)
				a_file.put_line ("assertion (all)")
			end
			if an_option.check_vape then
				print_indentation (indent, a_file)
				a_file.put_line ("check_vape (yes)")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("check_vape (no)")
			end
			if an_option.cls_compliant then
				print_indentation (indent, a_file)
				a_file.put_line ("cls_compliant (yes)")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("cls_compliant (no)")
			end
			if an_option.console_application then
				print_indentation (indent, a_file)
				a_file.put_line ("console_application (yes)")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("console_application (no)")
			end
			a_dead_code_removal := an_option.dead_code_removal
			if a_dead_code_removal.has (options.all_value) then
				print_indentation (indent, a_file)
				a_file.put_line ("dead_code_removal (yes)")
			elseif a_dead_code_removal.has (options.feature_value) then
				print_indentation (indent, a_file)
				a_file.put_line ("dead_code_removal (yes)")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("dead_code_removal (no)")
			end
			if an_option.debug_option then
				print_indentation (indent, a_file)
				a_file.put_line ("debug (yes)")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("debug (no)")
			end
			if an_option.is_debug_tag_declared then
				a_cursor := an_option.debug_tag.new_cursor
				from a_cursor.start until a_cursor.after loop
					print_indentation (indent, a_file)
					a_file.put_string ("debug (%"")
					a_file.put_string (a_cursor.item)
					a_file.put_line ("%")")
					a_cursor.forth
				end
			end
			if an_option.is_document_declared then
				print_indentation (indent, a_file)
				a_file.put_string ("document (%"")
				a_file.put_string (an_option.document)
				a_file.put_line ("%")")
			end
			if an_option.dotnet_naming_convention then
				print_indentation (indent, a_file)
				a_file.put_line ("dotnet_naming_convention (yes)")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("dotnet_naming_convention (no)")
			end
			if an_option.dynamic_runtime then
				print_indentation (indent, a_file)
				a_file.put_line ("dynamic_runtime (yes)")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("dynamic_runtime (no)")
			end
			if an_option.exception_trace then
				print_indentation (indent, a_file)
				a_file.put_line ("exception_trace (yes)")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("exception_trace (no)")
			end
			if an_option.il_verifiable then
				print_indentation (indent, a_file)
				a_file.put_line ("il_verifiable (yes)")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("il_verifiable (no)")
			end
			an_inlining := an_option.inlining
			if an_inlining.has (options.all_value) then
				print_indentation (indent, a_file)
				a_file.put_line ("inlining (yes)")
			elseif an_inlining.has (options.array_value) then
				print_indentation (indent, a_file)
				a_file.put_line ("inlining (yes)")
			elseif an_inlining.has (options.constant_value) then
				print_indentation (indent, a_file)
				a_file.put_line ("inlining (yes)")
			elseif an_inlining.has (options.once_value) then
				print_indentation (indent, a_file)
				a_file.put_line ("inlining (yes)")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("inlining (no)")
			end
			print_indentation (indent, a_file)
			a_file.put_string ("inlining_size (%"")
			a_file.put_integer (an_option.inlining_size)
			a_file.put_line ("%")")
			if an_option.line_generation then
				print_indentation (indent, a_file)
				a_file.put_line ("line_generation (yes)")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("line_generation (no)")
			end
			if an_option.is_metadata_cache_path_declared then
				print_indentation (indent, a_file)
				a_file.put_string ("metadata_cache_path (%"")
				a_file.put_string (an_option.metadata_cache_path)
				a_file.put_line ("%")")
			end
			if an_option.is_msil_assembly_compatibility_declared then
				print_indentation (indent, a_file)
				a_file.put_string ("msil_assembly_compatibility (%"")
				a_file.put_string (an_option.msil_assembly_compatibility)
				a_file.put_line ("%")")
			end
			if an_option.is_msil_clr_version_declared then
				print_indentation (indent, a_file)
				a_file.put_string ("msil_clr_version (%"")
				a_file.put_string (an_option.msil_clr_version)
				a_file.put_line ("%")")
			end
			if an_option.msil_generation then
				print_indentation (indent, a_file)
				a_file.put_line ("msil_generation (yes)")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("msil_generation (no)")
			end
			if an_option.is_msil_generation_version_declared then
				print_indentation (indent, a_file)
				a_file.put_string ("version (%"")
				a_file.put_string (an_option.msil_generation_version)
				a_file.put_line ("%")")
			end
			if an_option.multithreaded then
				print_indentation (indent, a_file)
				a_file.put_line ("multithreaded (yes)")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("multithreaded (no)")
			end
			if an_option.is_override_cluster_declared then
				a_cursor := an_option.override_cluster.new_cursor
				from a_cursor.start until a_cursor.after loop
					print_indentation (indent, a_file)
					a_file.put_string ("override_cluster (")
					a_file.put_string (a_cursor.item)
					a_file.put_line (")")
					a_cursor.forth
				end
			end
			if an_option.is_precompiled_declared then
				print_indentation (indent, a_file)
				a_file.put_string ("precompiled (%"")
				a_file.put_string (an_option.precompiled)
				a_file.put_line ("%")")
			end
			if an_option.profile then
				print_indentation (indent, a_file)
				a_file.put_line ("profile (yes)")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("profile (no)")
			end
			if an_option.is_shared_library_definition_declared then
				print_indentation (indent, a_file)
				a_file.put_string ("shared_library_definition (%"")
				a_file.put_string (an_option.shared_library_definition)
				a_file.put_line ("%")")
			end
			a_target := an_option.target
			if STRING_.same_string (a_target, options.dll_value) then
				print_indentation (indent, a_file)
				a_file.put_line ("msil_generation_type (%"dll%")")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("msil_generation_type (%"exe%")")
			end
			if an_option.trace then
				print_indentation (indent, a_file)
				a_file.put_line ("trace (yes)")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("trace (no)")
			end
			if an_option.is_use_cluster_name_as_namespace_declared then
				if an_option.use_cluster_name_as_namespace then
					print_indentation (indent, a_file)
					a_file.put_line ("use_cluster_name_as_namespace (yes)")
				else
					print_indentation (indent, a_file)
					a_file.put_line ("use_cluster_name_as_namespace (no)")
				end
			else
					-- Xace's default is true.
				print_indentation (indent, a_file)
				a_file.put_line ("use_cluster_name_as_namespace (yes)")
			end
			if an_option.is_use_full_cluster_name_as_namespace_declared then
				if an_option.use_full_cluster_name_as_namespace then
					print_indentation (indent, a_file)
					a_file.put_line ("use_all_cluster_name_as_namespace (yes)")
				else
					print_indentation (indent, a_file)
					a_file.put_line ("use_all_cluster_name_as_namespace (no)")
				end
			else
					-- Xace's default is true.
				print_indentation (indent, a_file)
				a_file.put_line ("use_all_cluster_name_as_namespace (yes)")
			end
		end

	print_clusters (a_clusters: ET_XACE_CLUSTERS; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print `a_clusters' to `a_file'.
		require
			a_clusters_not_void: a_clusters /= Void
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
					print_cluster (a_cluster, a_file)
				end
				i := i + 1
			end
		end

	print_cluster (a_cluster: ET_XACE_CLUSTER; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print `a_cluster' to `a_file'.
		require
			a_cluster_not_void: a_cluster /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			a_parent: ET_XACE_CLUSTER
			a_pathname: STRING
			an_option: ET_XACE_OPTIONS
			subclusters: ET_XACE_CLUSTERS
			need_end_keyword: BOOLEAN
			a_class_options: DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS]
		do
			if not a_cluster.is_fully_abstract then
				an_option := a_cluster.options
				print_indentation (1, a_file)
				if a_cluster.is_recursive then
					if a_cluster.is_read_only then
						a_file.put_string ("library ")
					else
						a_file.put_string ("all ")
					end
				end
				print_escaped_name (a_cluster.prefixed_name, a_file)
				a_parent := a_cluster.parent
				if a_parent /= Void then
					a_file.put_string (" (")
					print_escaped_name (a_parent.prefixed_name, a_file)
					a_file.put_string ("): %"")
						-- TODO: Note: there is a bug in ISE 5.1 with the
						-- $ notation in the nested cluster. But using full
						-- pathname instead does not work when it starts with
						-- an environment variable of the form ${...}.
					a_pathname := a_cluster.full_pathname
					if a_pathname.count >= 2 and then a_pathname.item (1) = '$' then
						inspect a_pathname.item (2)
						when 'a'..'z', 'A'..'Z' then
								-- We can use the workaround: parent notion
								-- with full pathname.
							a_file.put_string (a_cluster.full_pathname)
						else
								-- We cannot use the workaround.
							if a_cluster.is_relative then
								a_file.put_string ("$/")
								if a_cluster.pathname /= Void then
									a_file.put_string (a_cluster.pathname)
								else
									a_file.put_string (a_cluster.name)
								end
							else
								a_file.put_string (a_cluster.full_pathname)
							end
						end
					else
							-- We can use the workaround: parent notion
							-- with full pathname.
						a_file.put_string (a_cluster.full_pathname)
					end
				else
					a_file.put_string (": %"")
					a_file.put_string (a_cluster.full_pathname)
				end
				a_file.put_character ('%"')
				a_file.put_new_line
				if an_option /= Void then
					need_end_keyword := print_cluster_options (an_option, 2, a_file) or need_end_keyword
				end
				a_class_options := a_cluster.class_options
				if a_class_options /= Void then
					need_end_keyword := print_class_options (a_class_options, 2, a_file) or need_end_keyword
				end
				if need_end_keyword then
					print_indentation (2, a_file)
					a_file.put_line ("end")
				end
			end
			subclusters := a_cluster.subclusters
			if subclusters /= Void then
				print_clusters (subclusters, a_file)
			end
		end

	print_cluster_options (an_option: ET_XACE_OPTIONS; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM): BOOLEAN is
			-- Print cluster options `an_option' to `a_file'.
			-- Return True if the end keyword needs to be printed.
		require
			an_option_not_void: an_option /= Void
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			an_exclude: DS_HASH_SET [STRING]
			an_exclude_cursor: DS_HASH_SET_CURSOR [STRING]
			an_include: DS_HASH_SET [STRING]
			an_include_cursor: DS_HASH_SET_CURSOR [STRING]
			need_default: BOOLEAN
			an_indent: INTEGER
			an_assertion: DS_HASH_SET [STRING]
			a_debug_tag_cursor: DS_HASH_SET_CURSOR [STRING]
		do
			if an_option.is_include_declared then
				an_include := an_option.include
				if not an_include.is_empty then
					Result := True
					print_indentation (indent, a_file)
					a_file.put_line ("include")
					an_include_cursor := an_include.new_cursor
					from
						an_include_cursor.start
						print_indentation (indent + 1, a_file)
						a_file.put_character ('%"')
						a_file.put_string (an_include_cursor.item)
						a_file.put_character ('%"')
						an_include_cursor.forth
					until
						an_include_cursor.after
					loop
						a_file.put_character (';')
						a_file.put_new_line
						print_indentation (indent + 1, a_file)
						a_file.put_character ('%"')
						a_file.put_string (an_include_cursor.item)
						a_file.put_character ('%"')
						an_include_cursor.forth
					end
					a_file.put_new_line
				end
			end
			if an_option.is_exclude_declared then
				an_exclude := an_option.exclude
				if not an_exclude.is_empty then
					Result := True
					print_indentation (indent, a_file)
					a_file.put_line ("exclude")
					an_exclude_cursor := an_exclude.new_cursor
					from
						an_exclude_cursor.start
						print_indentation (indent + 1, a_file)
						a_file.put_character ('%"')
						a_file.put_string (an_exclude_cursor.item)
						a_file.put_character ('%"')
						an_exclude_cursor.forth
					until
						an_exclude_cursor.after
					loop
						a_file.put_character (';')
						a_file.put_new_line
						print_indentation (indent + 1, a_file)
						a_file.put_character ('%"')
						a_file.put_string (an_exclude_cursor.item)
						a_file.put_character ('%"')
						an_exclude_cursor.forth
					end
				end
				a_file.put_new_line
			end
			if an_option.is_assertion_declared then
				need_default := True
			elseif an_option.is_debug_option_declared then
				need_default := True
			elseif an_option.is_debug_tag_declared then
				need_default := True
			elseif an_option.is_document_declared then
				need_default := True
			elseif an_option.is_namespace_declared then
				need_default := True
			elseif an_option.is_profile_declared then
				need_default := True
			elseif an_option.is_trace_declared then
				need_default := True
			end
			if need_default then
				Result := True
				an_indent := indent
				print_indentation (an_indent, a_file)
				a_file.put_line ("default")
				an_indent := an_indent + 1
				if an_option.is_assertion_declared then
					an_assertion := an_option.assertion
					if an_assertion.has (options.none_value) then
						print_indentation (an_indent, a_file)
						a_file.put_line ("assertion (no)")
					end
					if an_assertion.has (options.generate_value) then
						print_indentation (an_indent, a_file)
						a_file.put_line ("assertion (no)")
					end
					if an_assertion.has (options.require_value) then
						print_indentation (an_indent, a_file)
						a_file.put_line ("assertion (require)")
					end
					if an_assertion.has (options.ensure_value) then
						print_indentation (an_indent, a_file)
						a_file.put_line ("assertion (ensure)")
					end
					if an_assertion.has (options.invariant_value) then
						print_indentation (an_indent, a_file)
						a_file.put_line ("assertion (invariant)")
					end
					if an_assertion.has (options.loop_invariant_value) then
						print_indentation (an_indent, a_file)
						a_file.put_line ("assertion (loop)")
					end
					if an_assertion.has (options.loop_variant_value) then
						print_indentation (an_indent, a_file)
						a_file.put_line ("assertion (loop)")
					end
					if an_assertion.has (options.check_value) then
						print_indentation (an_indent, a_file)
						a_file.put_line ("assertion (check)")
					end
					if an_assertion.has (options.all_value) then
						print_indentation (an_indent, a_file)
						a_file.put_line ("assertion (all)")
					end
				end
				if an_option.is_debug_option_declared then
					if an_option.debug_option then
						print_indentation (an_indent, a_file)
						a_file.put_line ("debug (yes)")
					else
						print_indentation (an_indent, a_file)
						a_file.put_line ("debug (no)")
					end
				end
				a_debug_tag_cursor := an_option.debug_tag.new_cursor
				from a_debug_tag_cursor.start until a_debug_tag_cursor.after loop
					print_indentation (an_indent, a_file)
					a_file.put_string ("debug (%"")
					a_file.put_string (a_debug_tag_cursor.item)
					a_file.put_line ("%")")
					a_debug_tag_cursor.forth
				end
				if an_option.is_document_declared then
					print_indentation (an_indent, a_file)
					a_file.put_string ("document (%"")
					a_file.put_string (an_option.document)
					a_file.put_line ("%")")
				end
				if an_option.is_namespace_declared then
					print_indentation (an_indent, a_file)
					a_file.put_string ("namespace (%"")
					a_file.put_string (an_option.namespace)
					a_file.put_line ("%")")
				end
				if an_option.is_profile_declared then
					if an_option.profile then
						print_indentation (an_indent, a_file)
						a_file.put_line ("profile (yes)")
					else
						print_indentation (an_indent, a_file)
						a_file.put_line ("profile (no)")
					end
				end
				if an_option.is_trace_declared then
					if an_option.trace then
						print_indentation (an_indent, a_file)
						a_file.put_line ("trace (yes)")
					else
						print_indentation (an_indent, a_file)
						a_file.put_line ("trace (no)")
					end
				end
			end
		end

	print_class_options (an_option_list: DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS]; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM): BOOLEAN is
			-- Print class options `an_option_list' to `a_file'.
			-- Return True if the end keyword needs to be printed.
		require
			an_option_list_not_void: an_option_list /= Void
			no_void_option: not an_option_list.has_void
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			a_class_cursor: DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS]
			a_class_options: ET_XACE_CLASS_OPTIONS
			an_indent: INTEGER
			an_assertion: DS_HASH_SET [STRING]
			a_debug_tag_cursor: DS_HASH_SET_CURSOR [STRING]
			need_option, option_printed: BOOLEAN
			need_visible, visible_printed: BOOLEAN
			nb_export: INTEGER
			a_class_name: STRING
			a_feature_list: DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS]
			a_feature_cursor: DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS]
			a_feature_options: ET_XACE_FEATURE_OPTIONS
			an_option: ET_XACE_OPTIONS
		do
			an_indent := indent
			a_class_cursor := an_option_list.new_cursor
			from a_class_cursor.start until a_class_cursor.after loop
				a_class_options := a_class_cursor.item
				a_class_name := a_class_options.class_name
				an_option := a_class_options.options
				need_option := False
				if an_option.is_assertion_declared then
					need_option := True
				elseif an_option.is_debug_option_declared then
					need_option := True
				elseif an_option.is_debug_tag_declared then
					need_option := True
				elseif an_option.is_trace_declared then
					need_option := True
				end
				if need_option then
					if not option_printed then
						print_indentation (an_indent, a_file)
						a_file.put_line ("option")
						option_printed := True
					end
					an_indent := an_indent + 1
					if an_option.is_assertion_declared then
						an_assertion := an_option.assertion
						if an_assertion.has (options.none_value) then
							print_indentation (an_indent, a_file)
							a_file.put_string ("assertion (no): ")
							a_file.put_line (a_class_name)
						end
						if an_assertion.has (options.generate_value) then
							print_indentation (an_indent, a_file)
							a_file.put_string ("assertion (no): ")
							a_file.put_line (a_class_name)
						end
						if an_assertion.has (options.require_value) then
							print_indentation (an_indent, a_file)
							a_file.put_string ("assertion (require): ")
							a_file.put_line (a_class_name)
						end
						if an_assertion.has (options.ensure_value) then
							print_indentation (an_indent, a_file)
							a_file.put_string ("assertion (ensure): ")
							a_file.put_line (a_class_name)
						end
						if an_assertion.has (options.invariant_value) then
							print_indentation (an_indent, a_file)
							a_file.put_string ("assertion (invariant): ")
							a_file.put_line (a_class_name)
						end
						if an_assertion.has (options.loop_invariant_value) then
							print_indentation (an_indent, a_file)
							a_file.put_string ("assertion (loop): ")
							a_file.put_line (a_class_name)
						end
						if an_assertion.has (options.loop_variant_value) then
							print_indentation (an_indent, a_file)
							a_file.put_string ("assertion (loop): ")
							a_file.put_line (a_class_name)
						end
						if an_assertion.has (options.check_value) then
							print_indentation (an_indent, a_file)
							a_file.put_string ("assertion (check): ")
							a_file.put_line (a_class_name)
						end
						if an_assertion.has (options.all_value) then
							print_indentation (an_indent, a_file)
							a_file.put_string ("assertion (all): ")
							a_file.put_line (a_class_name)
						end
					end
					if an_option.is_debug_option_declared then
						if an_option.debug_option then
							print_indentation (an_indent, a_file)
							a_file.put_string ("debug (yes): ")
							a_file.put_line (a_class_name)
						else
							print_indentation (an_indent, a_file)
							a_file.put_string ("debug (no): ")
							a_file.put_line (a_class_name)
						end
					end
					a_debug_tag_cursor := an_option.debug_tag.new_cursor
					from a_debug_tag_cursor.start until a_debug_tag_cursor.after loop
						print_indentation (an_indent, a_file)
						a_file.put_string ("debug (%"")
						a_file.put_string (a_debug_tag_cursor.item)
						a_file.put_string ("%"): ")
						a_file.put_line (a_class_name)
						a_debug_tag_cursor.forth
					end
					if an_option.is_trace_declared then
						if an_option.trace then
							print_indentation (an_indent, a_file)
							a_file.put_string ("trace (yes): ")
							a_file.put_line (a_class_name)
						else
							print_indentation (an_indent, a_file)
							a_file.put_string ("trace (no): ")
							a_file.put_line (a_class_name)
						end
					end
					an_indent := an_indent - 1
				end
				a_class_cursor.forth
			end
			from a_class_cursor.start until a_class_cursor.after loop
				a_class_options := a_class_cursor.item
				a_feature_list := a_class_options.feature_options
				a_class_name := a_class_options.class_name
				an_option := a_class_options.options
				need_visible := False
				nb_export := 0
				if an_option.is_export_option_declared then
					need_visible := True
				elseif a_feature_list /= Void then
					a_feature_cursor := a_feature_list.new_cursor
					from a_feature_cursor.start until a_feature_cursor.after loop
						if a_feature_cursor.item.options.is_export_option_declared then
							nb_export := nb_export + 1
						end
						a_feature_cursor.forth
					end
					need_visible := (nb_export > 0)
				end
				if need_visible then
					if not visible_printed then
						print_indentation (an_indent, a_file)
						a_file.put_line ("visible")
						visible_printed := True
					end
					an_indent := an_indent + 1
					print_indentation (an_indent, a_file)
					print_escaped_name (a_class_name, a_file)
					a_file.put_new_line
					an_indent := an_indent + 1
					if nb_export > 0 then
						print_indentation (an_indent, a_file)
						a_file.put_line ("export")
						an_indent := an_indent + 1
						a_feature_cursor := a_feature_list.new_cursor
						from a_feature_cursor.start until a_feature_cursor.after loop
							a_feature_options := a_feature_cursor.item
							if a_feature_options.options.is_export_option_declared then
								print_indentation (an_indent, a_file)
								print_escaped_name (a_feature_options.feature_name, a_file)
								nb_export := nb_export - 1
								if nb_export > 0 then
									a_file.put_character (',')
								end
								a_file.put_new_line
							end
							a_feature_cursor.forth
						end
						an_indent := an_indent - 1
					end
					print_indentation (an_indent, a_file)
					a_file.put_line ("end")
					an_indent := an_indent - 2
				end
				a_class_cursor.forth
			end
			Result := option_printed or visible_printed
		end

	print_c_compiler_options_and_include_directories (a_c_compiler_options: DS_LINKED_LIST [STRING];
		a_directories: DS_LINKED_LIST [STRING]; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print `a_c_compiler_options' and
			-- `a_directories' to `a_file'.
		require
			a_c_compiler_options_not_void: a_c_compiler_options /= Void
			no_void_c_compiler_option: not a_c_compiler_options.has_void
			a_directories_not_void: a_directories /= Void
			no_void_directory: not a_directories.has_void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			a_cursor: DS_LINKED_LIST_CURSOR [STRING]
			a_pathname: STRING
		do
			if not a_c_compiler_options.is_empty or not a_directories.is_empty then
				print_indentation (1, a_file)
				a_file.put_line ("include_path:")
				a_cursor := a_c_compiler_options.new_cursor
				from a_cursor.start until a_cursor.after loop
					print_indentation (2, a_file)
					a_file.put_character ('%"')
					a_file.put_string ("some123/fake432/path567 ")
					a_file.put_string (a_cursor.item)
					a_file.put_character ('%"')
					if not a_cursor.is_last or not a_directories.is_empty then
						a_file.put_character (',')
						a_file.put_new_line
					end
					a_cursor.forth
				end
				a_cursor := a_directories.new_cursor
				from a_cursor.start until a_cursor.after loop
					print_indentation (2, a_file)
					a_file.put_character ('%"')
					a_pathname := a_cursor.item
					if is_windows then
						a_pathname := replace_all_characters (a_pathname, '{', '(')
						a_pathname := replace_all_characters (a_pathname, '}', ')')
					end
					a_file.put_string (a_pathname)
					a_file.put_character ('%"')
					if not a_cursor.is_last then
						a_file.put_character (',')
						a_file.put_new_line
					end
					a_cursor.forth
				end
				a_file.put_character (';')
				a_file.put_new_line
				a_file.put_new_line
			end
		end

	print_link_libraries (a_libraries: DS_LINKED_LIST [STRING]; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print `a_libraries' to `a_file'.
		require
			a_libraries_not_void: a_libraries /= Void
			no_void_library: not a_libraries.has_void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			a_cursor: DS_LINKED_LIST_CURSOR [STRING]
			a_pathname: STRING
		do
			if not a_libraries.is_empty then
				print_indentation (1, a_file)
				a_file.put_line ("object:")
				a_cursor := a_libraries.new_cursor
				from a_cursor.start until a_cursor.after loop
					print_indentation (2, a_file)
					a_file.put_character ('%"')
					a_pathname := a_cursor.item
					if is_windows then
						a_pathname := replace_all_characters (a_pathname, '{', '(')
						a_pathname := replace_all_characters (a_pathname, '}', ')')
					end
					a_file.put_string (a_pathname)
					if a_cursor.is_last then
						a_file.put_line ("%";")
					else
						a_file.put_line ("%",")
					end
					a_cursor.forth
				end
				a_file.put_new_line
			end
		end

	print_escaped_name (a_name: STRING; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print escaped version of `a_name' to `a_file'.
		do
			if a_name.has ('.') or else is_lace_keyword (a_name) then
				a_file.put_character ('%"')
				a_file.put_string (a_name)
				a_file.put_character ('%"')
			else
				a_file.put_string (a_name)
			end
		end

feature {NONE} -- Implementation

	is_lace_keyword (a_name: STRING): BOOLEAN is
			-- Is `a_name' a LACE keyword?
		require
			a_name_not_void: a_name /= Void
		local
			i, nb: INTEGER
			a_keywords: like lace_keywords
		do
			a_keywords := lace_keywords
			i := a_keywords.lower
			nb := a_keywords.upper
			from until i > nb loop
				if STRING_.same_string (a_keywords.item (i), a_name) then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

	lace_keywords: ARRAY [STRING] is
			-- LACE keywords
		once
			Result := <<
				"adapt",
				"all",
				"assembly",
				"assertion",
				"c",
				"check",
				"cluster",
				"colon",
				"comma",
				"creation",
				"debug",
				"default",
				"end",
				"ensure",
				"exclude",
				"executable",
				"export",
				"external",
				"generate",
				"identifier",
				"ignore",
				"include",
				"include_path",
				"invariant",
				"loop",
				"make",
				"no",
				"object",
				"optimize",
				"option",
				"precompiled",
				"prefix",
				"rename",
				"require",
				"root",
				"system",
				"trace",
				"use",
				"visible",
				"yes"
			>>
		ensure
			lace_keywords_not_void: Result /= Void
			no_void_keyword: not STRING_ARRAY_.has (Result, Void)
		end

end
