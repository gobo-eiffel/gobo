indexing

	description:

		"Ace file generators for SmartEiffel"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2005, Andreas Leitner and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_SE_GENERATOR

inherit

	ET_XACE_GENERATOR
		redefine
			print_escaped_name
		end

create

	make

feature -- Access

	default_system_output_filename: STRING is
			-- Name of generated Ace file
		once
			Result := "se.ace"
		end

	default_library_output_filename: STRING is "loadpath.se"
			-- Name of generated loadpath file

	cecil_filename: STRING is "cecil.se"
			-- Name of generated cecil file

feature -- Output

	generate_system (a_system: ET_XACE_SYSTEM; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Generate a new Ace file from `a_system'.
		do
			print_ace_file (a_system, a_file)
		end

	generate_library (a_library: ET_XACE_LIBRARY; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Generate a new Ace file from `a_library'.
		local
			a_clusters: ET_XACE_CLUSTERS
		do
			a_clusters := a_library.clusters
			if a_clusters /= Void then
				print_loadpath_clusters (a_clusters, a_file)
			end
		end

feature {NONE} -- Output

	print_ace_file (a_system: ET_XACE_SYSTEM; a_file: KI_TEXT_OUTPUT_STREAM) is
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
			an_exported_features: DS_LINKED_LIST [ET_XACE_EXPORTED_FEATURE]
		do
			a_file.put_string ("system")
			a_file.put_new_line
			a_file.put_new_line
			print_indentation (1, a_file)
			a_file.put_character ('%"')
			a_file.put_string (a_system.system_name)
			a_file.put_character ('%"')
			a_file.put_new_line
			a_file.put_new_line
			a_file.put_string ("root")
			a_file.put_new_line
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
			end
			create an_external.make
			a_system.merge_externals (an_external)
			create an_exported_features.make
			a_system.merge_exported_features (an_exported_features)
			if not an_external.is_empty or not an_exported_features.is_empty then
				a_file.put_line ("external")
				a_file.put_new_line
				if not an_exported_features.is_empty then
					generate_cecil_file (an_exported_features)
					print_indentation (1, a_file)
					a_file.put_string ("cecil (%"")
					a_file.put_string (cecil_filename)
					a_file.put_string ("%")")
					a_file.put_new_line
				end
				print_include_directories (an_external.include_directories, a_file)
				print_link_libraries (an_external.link_libraries, a_file)
				a_file.put_new_line
			end
			if an_option /= Void or not an_external.c_compiler_options.is_empty then
				a_file.put_line ("generate")
				a_file.put_new_line
				if an_option /= Void then
					print_generate (an_option, 1, a_file)
				end
				print_c_compiler_options (an_external.c_compiler_options, a_file)
				a_file.put_new_line
			end
			a_file.put_line ("end")
		end

	print_options (an_option: ET_XACE_OPTIONS; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' the part of `an_option' which goes to the 'default' section.
		require
			an_option_not_void: an_option /= Void
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			an_assertion: DS_HASH_SET [STRING]
			a_debug_tag_cursor: DS_HASH_SET_CURSOR [STRING]
			a_warning: STRING
		do
			an_assertion := an_option.assertion
			if an_option.finalize_option then
				print_indentation (indent, a_file)
				a_file.put_line ("assertion (boost)")
			elseif an_assertion.has (options.all_value) then
				print_indentation (indent, a_file)
				a_file.put_line ("assertion (all)")
			elseif an_assertion.has (options.check_value) then
				print_indentation (indent, a_file)
				a_file.put_line ("assertion (check)")
			elseif an_assertion.has (options.loop_variant_value) then
				print_indentation (indent, a_file)
				a_file.put_line ("assertion (loop)")
			elseif an_assertion.has (options.loop_invariant_value) then
				print_indentation (indent, a_file)
				a_file.put_line ("assertion (loop)")
			elseif an_assertion.has (options.invariant_value) then
				print_indentation (indent, a_file)
				a_file.put_line ("assertion (invariant)")
			elseif an_assertion.has (options.ensure_value) then
				print_indentation (indent, a_file)
				a_file.put_line ("assertion (ensure)")
			elseif an_assertion.has (options.require_value) then
				print_indentation (indent, a_file)
				a_file.put_line ("assertion (require)")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("assertion (no)")
			end
			if an_option.case_insensitive then
				print_indentation (indent, a_file)
				a_file.put_line ("case_insensitive (yes)")
			else
				-- This is the default.
			end
			if an_option.debug_option then
				print_indentation (indent, a_file)
				a_file.put_line ("debug (yes)")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("debug (no)")
			end
			a_debug_tag_cursor := an_option.debug_tag.new_cursor
			from a_debug_tag_cursor.start until a_debug_tag_cursor.after loop
				print_indentation (indent, a_file)
				a_file.put_string ("debug (%"")
				a_file.put_string (a_debug_tag_cursor.item)
				a_file.put_line ("%")")
				a_debug_tag_cursor.forth
			end
			if STRING_.same_string (an_option.garbage_collector, options.internal_value) then
				print_indentation (indent, a_file)
				a_file.put_line ("collect (yes)")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("collect (no)")
			end
			if an_option.high_memory_compiler then
				print_indentation (indent, a_file)
				a_file.put_line ("high_memory_compiler (yes)")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("high_memory_compiler (no)")
			end
			if an_option.manifest_string_trace then
				print_indentation (indent, a_file)
				a_file.put_line ("manifest_string_trace (yes)")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("manifest_string_trace (no)")
			end
			if an_option.trace then
				print_indentation (indent, a_file)
				a_file.put_line ("trace (yes)")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("trace (no)")
			end
			if an_option.verbose then
				print_indentation (indent, a_file)
				a_file.put_line ("verbose (yes)")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("verbose (no)")
			end
			a_warning := an_option.warning
			if STRING_.same_string (a_warning, options.style_value) then
				print_indentation (indent, a_file)
				a_file.put_line ("no_style_warning (no)")
				print_indentation (indent, a_file)
				a_file.put_line ("no_warning (yes)")
			elseif STRING_.same_string (a_warning, options.default_value) then
				print_indentation (indent, a_file)
				a_file.put_line ("no_style_warning (yes)")
				print_indentation (indent, a_file)
				a_file.put_line ("no_warning (no)")
			elseif STRING_.same_string (a_warning, options.all_value) then
				print_indentation (indent, a_file)
				a_file.put_line ("no_style_warning (no)")
				print_indentation (indent, a_file)
				a_file.put_line ("no_warning (no)")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("no_style_warning (yes)")
				print_indentation (indent, a_file)
				a_file.put_line ("no_warning (yes)")
			end
		end

	print_generate (an_option: ET_XACE_OPTIONS; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' the part of `an_option' which goes to the 'generate' section.
		require
			an_option_not_void: an_option /= Void
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			if an_option.clean then
				print_indentation (indent, a_file)
				a_file.put_line ("clean (yes)")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("clean (no)")
			end
			if an_option.gc_info then
				print_indentation (indent, a_file)
				a_file.put_line ("gc_info (yes)")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("gc_info (no)")
			end
			if an_option.split then
				print_indentation (indent, a_file)
				a_file.put_line ("no_split (no)")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("no_split (yes)")
			end
			if an_option.strip_option then
				print_indentation (indent, a_file)
				a_file.put_line ("no_strip (no)")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("no_strip (yes)")
			end
			if STRING_.same_string (an_option.target, options.exe_value) then
				print_indentation (indent, a_file)
				a_file.put_line ("no_main (no)")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("no_main (yes)")
			end
			if an_option.wedit then
				print_indentation (indent, a_file)
				a_file.put_line ("wedit (yes)")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("wedit (no)")
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
			a_pathname: STRING
			an_option: ET_XACE_OPTIONS
			subclusters: ET_XACE_CLUSTERS
			need_end_keyword: BOOLEAN
			a_class_options: DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS]
		do
			if not a_cluster.is_abstract then
				print_indentation (1, a_file)
				print_escaped_name (a_cluster.prefixed_name, a_file)
				a_file.put_string (": %"")
				a_pathname := a_cluster.full_pathname
				a_file.put_string (a_pathname)
				a_file.put_character ('%"')
				a_file.put_new_line
				an_option := a_cluster.options
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

	print_loadpath_clusters (a_clusters: ET_XACE_CLUSTERS; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print `a_clusters' to loadpath `a_file'.
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
					print_loadpath_cluster (a_cluster, a_file)
				end
				i := i + 1
			end
		end

	print_loadpath_cluster (a_cluster: ET_XACE_CLUSTER; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print `a_cluster' to loadpath `a_file'.
		require
			a_cluster_not_void: a_cluster /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			subclusters: ET_XACE_CLUSTERS
		do
			if not a_cluster.is_abstract then
				a_file.put_line (a_cluster.full_pathname)
			end
			subclusters := a_cluster.subclusters
			if subclusters /= Void then
				print_loadpath_clusters (subclusters, a_file)
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
			an_indent: INTEGER
			an_assertion: DS_HASH_SET [STRING]
			a_debug_tag_cursor: DS_HASH_SET_CURSOR [STRING]
		do
			if an_option.is_assertion_declared then
				Result := True
			elseif an_option.is_debug_option_declared then
				Result := True
			elseif an_option.is_debug_tag_declared then
				Result := True
			elseif an_option.is_trace_declared then
				Result := True
			end
			if Result then
				an_indent := indent
				print_indentation (an_indent, a_file)
				a_file.put_line ("default")
				an_indent := an_indent + 1
				if an_option.is_assertion_declared then
					an_assertion := an_option.assertion
					if an_assertion.has (options.all_value) then
						print_indentation (an_indent, a_file)
						a_file.put_line ("assertion (all)")
					elseif an_assertion.has (options.check_value) then
						print_indentation (an_indent, a_file)
						a_file.put_line ("assertion (check)")
					elseif an_assertion.has (options.loop_variant_value) then
						print_indentation (an_indent, a_file)
						a_file.put_line ("assertion (loop)")
					elseif an_assertion.has (options.loop_invariant_value) then
						print_indentation (an_indent, a_file)
						a_file.put_line ("assertion (loop)")
					elseif an_assertion.has (options.invariant_value) then
						print_indentation (an_indent, a_file)
						a_file.put_line ("assertion (invariant)")
					elseif an_assertion.has (options.ensure_value) then
						print_indentation (an_indent, a_file)
						a_file.put_line ("assertion (ensure)")
					elseif an_assertion.has (options.require_value) then
						print_indentation (an_indent, a_file)
						a_file.put_line ("assertion (require)")
					elseif an_assertion.has (options.generate_value) then
						print_indentation (an_indent, a_file)
						a_file.put_line ("assertion (no)")
					elseif an_assertion.has (options.none_value) then
						print_indentation (an_indent, a_file)
						a_file.put_line ("assertion (no)")
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
			no_void_option: not an_option_list.has (Void)
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
			a_class_name: STRING
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
						if an_assertion.has (options.all_value) then
							print_indentation (an_indent, a_file)
							a_file.put_string ("assertion (all): ")
							a_file.put_line (a_class_name)
						elseif an_assertion.has (options.check_value) then
							print_indentation (an_indent, a_file)
							a_file.put_string ("assertion (check): ")
							a_file.put_line (a_class_name)
						elseif an_assertion.has (options.loop_variant_value) then
							print_indentation (an_indent, a_file)
							a_file.put_string ("assertion (loop): ")
							a_file.put_line (a_class_name)
						elseif an_assertion.has (options.loop_invariant_value) then
							print_indentation (an_indent, a_file)
							a_file.put_string ("assertion (loop): ")
							a_file.put_line (a_class_name)
						elseif an_assertion.has (options.invariant_value) then
							print_indentation (an_indent, a_file)
							a_file.put_string ("assertion (invariant): ")
							a_file.put_line (a_class_name)
						elseif an_assertion.has (options.ensure_value) then
							print_indentation (an_indent, a_file)
							a_file.put_string ("assertion (ensure): ")
							a_file.put_line (a_class_name)
						elseif an_assertion.has (options.require_value) then
							print_indentation (an_indent, a_file)
							a_file.put_string ("assertion (require): ")
							a_file.put_line (a_class_name)
						elseif an_assertion.has (options.generate_value) then
							print_indentation (an_indent, a_file)
							a_file.put_string ("assertion (no): ")
							a_file.put_line (a_class_name)
						elseif an_assertion.has (options.none_value) then
							print_indentation (an_indent, a_file)
							a_file.put_string ("assertion (no): ")
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
							a_file.put_string ("trace: ")
							a_file.put_line (a_class_name)
						end
					end
					an_indent := an_indent - 1
				end
				a_class_cursor.forth
			end
			Result := option_printed
		end

	print_c_compiler_options (a_c_compiler_options: DS_LINKED_LIST [STRING]; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Makes sure the C compiler has the specified options set.
		require
			a_c_compiler_optionsnot_void: a_c_compiler_options /= Void
			no_void_c_compiler_option: not a_c_compiler_options.has (Void)
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			a_cursor: DS_LINKED_LIST_CURSOR [STRING]
			a_pathname: STRING
		do
			if not a_c_compiler_options.is_empty then
				print_indentation (1, a_file)
				a_file.put_string ("c_compiler_options:")
				a_file.put_new_line
				print_indentation (2, a_file)
				a_file.put_character ('%"')
				a_cursor := a_c_compiler_options.new_cursor
				from a_cursor.start until a_cursor.after loop
					a_pathname := a_cursor.item
					a_file.put_string (a_pathname)
					if not a_cursor.is_last then
						a_file.put_character (' ')
					end
					a_cursor.forth
				end
				a_file.put_character ('%"')
				a_file.put_new_line
			end
		end

	print_include_directories (a_directories: DS_LINKED_LIST [STRING]; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Makes sure the C compiler can find the header files.
		require
			a_directories_not_void: a_directories /= Void
			no_void_directory: not a_directories.has (Void)
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			a_cursor: DS_LINKED_LIST_CURSOR [STRING]
			a_pathname: STRING
		do
			if not a_directories.is_empty then
				print_indentation (1, a_file)
				a_file.put_string ("external_header_path:")
				a_file.put_new_line
				print_indentation (2, a_file)
				a_file.put_character ('%"')
				a_cursor := a_directories.new_cursor
				from a_cursor.start until a_cursor.after loop
					a_pathname := a_cursor.item
					a_file.put_string (a_pathname)
					if not a_cursor.is_last then
						a_file.put_character (' ')
					end
					a_cursor.forth
				end
				a_file.put_character ('%"')
				a_file.put_new_line
			end
		end

	print_link_libraries (a_libraries: DS_LINKED_LIST [STRING]; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print `a_libraries' to `a_file'.
		require
			a_libraries_not_void: a_libraries /= Void
			no_void_library: not a_libraries.has (Void)
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			a_cursor: DS_LINKED_LIST_CURSOR [STRING]
			a_pathname: STRING
		do
			if not a_libraries.is_empty then
				print_indentation (1, a_file)
				a_file.put_string ("external_lib:")
				a_file.put_new_line
				print_indentation (2, a_file)
				a_file.put_character ('%"')
				a_cursor := a_libraries.new_cursor
				from a_cursor.start until a_cursor.after loop
					a_pathname := a_cursor.item
					a_file.put_string (a_pathname)
					if not a_cursor.is_last then
						a_file.put_character (' ')
					end
					a_cursor.forth
				end
				a_file.put_character ('%"')
				a_file.put_new_line
			end
		end

	print_escaped_name (a_name: STRING; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print escaped version of `a_name' to `a_file'.
		do
			-- When `a_name' has to be quoted, we quote it.
			-- Currently we only do that on a '.', but that might not be complete.
			if a_name.has ('.') then
				a_file.put_character ('%"')
				a_file.put_string (a_name)
				a_file.put_character ('%"')
			else
				a_file.put_string (a_name)
			end
		end

	generate_cecil_file (an_exported_features: DS_LIST [ET_XACE_EXPORTED_FEATURE]) is
			-- Generate a new cecil file from `an_exported_features'.
		require
			an_exported_features_not_void: an_exported_features /= Void
			no_void_exported_feature: not an_exported_features.has (Void)
			an_exported_features_not_empty: not an_exported_features.is_empty
		local
			a_file: KL_TEXT_OUTPUT_FILE
			a_cursor: DS_LIST_CURSOR [ET_XACE_EXPORTED_FEATURE]
			a_feature: ET_XACE_EXPORTED_FEATURE
		do
			create a_file.make (cecil_filename)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_string ("-- The name of our include C file:")
				a_file.put_new_line
				a_file.put_string ("cecil.h")
				a_file.put_new_line
				a_file.put_string ("-- The features called from C:")
				a_file.put_new_line
				a_cursor := an_exported_features.new_cursor
				from a_cursor.start until a_cursor.after loop
					a_feature := a_cursor.item
					a_file.put_string (a_feature.external_name)
					a_file.put_character (' ')
					a_file.put_string (a_feature.class_name)
					a_file.put_character (' ')
					a_file.put_string (a_feature.feature_name)
					a_file.put_new_line
					a_cursor.forth
				end
				a_file.close
			else
				error_handler.report_cannot_write_file_error (cecil_filename)
			end
		end

end
