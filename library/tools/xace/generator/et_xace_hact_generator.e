indexing

	description:

		"Ace file generators for Halstenbach"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2002, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_HACT_GENERATOR

inherit

	ET_XACE_GENERATOR
		redefine
			print_escaped_name
		end

	KL_IMPORTED_ARRAY_ROUTINES

	UT_STRING_ROUTINES
		export {NONE} all end

creation

	make

feature -- Access

	ace_filename: STRING is "hact.ace"
			-- Name of generated Ace file

feature -- Output

	generate_system (a_system: ET_XACE_SYSTEM) is
			-- Generate a new Ace file from `a_system'.
		local
			a_filename: STRING
			a_file: KL_TEXT_OUTPUT_FILE
			an_externals: ET_XACE_EXTERNALS
		do
			if output_filename /= Void then
				a_filename := output_filename
			else
				a_filename := ace_filename
			end
			!! a_file.make (a_filename)
			a_file.open_write
			if a_file.is_open_write then
				an_externals := a_system.externals
				if an_externals /= Void then
					an_externals := an_externals.cloned_externals
				end
				a_system.merge_externals
				print_ace_file (a_system, a_file)
				a_file.close
				a_system.set_externals (an_externals)
			else
				error_handler.report_cannot_write_file_error (a_filename)
			end
		end

	generate_library (a_library: ET_XACE_LIBRARY) is
			-- Generate a new Ace file from `a_library'.
		local
			a_filename: STRING
			a_file: KL_TEXT_OUTPUT_FILE
			an_externals: ET_XACE_EXTERNALS
		do
			if output_filename /= Void then
				a_filename := output_filename
			else
				a_filename := ace_filename
			end
			!! a_file.make (a_filename)
			a_file.open_write
			if a_file.is_open_write then
				an_externals := a_library.externals
				if an_externals /= Void then
					an_externals := an_externals.cloned_externals
				end
				a_library.merge_externals
				print_precompile_ace_file (a_library, a_file)
				a_file.close
				a_library.set_externals (an_externals)
			else
				error_handler.report_cannot_write_file_error (a_filename)
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
			a_file.put_string (a_system.root_class_name)
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
				print_clusters (a_clusters, 1, a_file)
				a_file.put_new_line
				if print_components (a_clusters, False, a_file) then
					a_file.put_new_line
				end
			end
			an_external := a_system.externals
			if
				an_external /= Void and then
				(an_external.has_include_directories or an_external.has_link_libraries)
			then
				a_file.put_line ("external")
				a_file.put_new_line
				print_include_directories (an_external.include_directories, a_file)
				print_link_libraries (an_external.link_libraries, a_file)
			end
			a_file.put_line ("end")
		end

	print_precompile_ace_file (a_library: ET_XACE_LIBRARY; a_file: KI_TEXT_OUTPUT_STREAM) is
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
			print_escaped_name ("ANY", a_file)
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
				print_clusters (a_clusters, 1, a_file)
				a_file.put_new_line
				if print_components (a_clusters, False, a_file) then
					a_file.put_new_line
				end
			end
			an_external := a_library.externals
			if
				an_external /= Void and then
				(an_external.has_include_directories or an_external.has_link_libraries)
			then
				a_file.put_line ("external")
				a_file.put_new_line
				print_include_directories (an_external.include_directories, a_file)
				print_link_libraries (an_external.link_libraries, a_file)
			end
			a_file.put_line ("end")
		end

	print_components (a_clusters: ET_XACE_CLUSTERS; keyword_printed: BOOLEAN; a_file: KI_TEXT_OUTPUT_STREAM): BOOLEAN is
			-- Print to `a_file' the component clause for
			-- `a_clusters' and recursively their subclusters.
			-- Return True if the keyword 'component' has been printed.
		require
			a_clusters_not_void: a_clusters /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			i, nb: INTEGER
			cluster_list: DS_ARRAYED_LIST [ET_XACE_CLUSTER]
		do
			Result := keyword_printed
			cluster_list := a_clusters.clusters
			nb := cluster_list.count
			from i := 1 until i > nb loop
				Result := print_component (cluster_list.item (i), Result, a_file)
				i := i + 1
			end
		end

	print_component (a_cluster: ET_XACE_CLUSTER; keyword_printed: BOOLEAN; a_file: KI_TEXT_OUTPUT_STREAM): BOOLEAN is
			-- Print to `a_file' the component clause for
			-- `a_cluster' and recursively its subclusters.
			-- Return True if the keyword 'component' has been printed.
		require
			a_cluster_not_void: a_cluster /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			an_option: ET_XACE_OPTIONS
			subclusters: ET_XACE_CLUSTERS
		do
			Result := keyword_printed
			an_option := a_cluster.options
			if an_option /= Void and then an_option.is_component_declared then
				if not Result then
					a_file.put_line ("component")
					a_file.put_new_line
					Result := True
				end
				print_indentation (1, a_file)
				print_escaped_name (a_cluster.name, a_file)
				a_file.put_string (": %"")
				a_file.put_string (an_option.component)
				a_file.put_line ("%";")
			end
			subclusters := a_cluster.subclusters
			if subclusters /= Void then
				Result := print_components (subclusters, Result, a_file)
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
			an_assertion: DS_HASH_SET [STRING]
			a_dead_code_removal: DS_HASH_SET [STRING]
			a_dead_code_removal_yes: BOOLEAN
			an_optimize_yes: BOOLEAN
			a_debug_tag_cursor: DS_HASH_SET_CURSOR [STRING]
			an_inlining: DS_HASH_SET [STRING]
			a_warning: STRING
			is_version_3: BOOLEAN
		do
				-- Some options have been introduced in HACT 4.0 and
				-- are not supported in HACT 3.
			is_version_3 := variables.is_defined ("GOBO_HACT_3")
			if an_option.address_expression then
				print_indentation (indent, a_file)
				a_file.put_line ("address_expression (yes);")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("address_expression (no);")
			end
			if an_option.array_optimization then
				print_indentation (indent, a_file)
				a_file.put_line ("array_optimization (yes);")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("array_optimization (no);")
			end
			an_assertion := an_option.assertion
			if an_assertion.has (options.all_value) then
				print_indentation (indent, a_file)
				a_file.put_line ("assertion (all);")
			elseif an_assertion.has (options.check_value) then
				print_indentation (indent, a_file)
				a_file.put_line ("assertion (check);")
			elseif an_assertion.has (options.loop_variant_value) then
				print_indentation (indent, a_file)
				a_file.put_line ("assertion (loop);")
			elseif an_assertion.has (options.loop_invariant_value) then
				print_indentation (indent, a_file)
				a_file.put_line ("assertion (loop);")
			elseif an_assertion.has (options.invariant_value) then
				print_indentation (indent, a_file)
				a_file.put_line ("assertion (invariant);")
			elseif an_assertion.has (options.ensure_value) then
				print_indentation (indent, a_file)
				a_file.put_line ("assertion (ensure);")
			elseif an_assertion.has (options.require_value) then
				print_indentation (indent, a_file)
				a_file.put_line ("assertion (require);")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("assertion (no);")
			end
			if an_option.check_vape then
				print_indentation (indent, a_file)
				a_file.put_line ("check_vape (yes);")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("check_vape (no);")
			end
			if an_option.console_application then
				print_indentation (indent, a_file)
				a_file.put_line ("console_application (yes);")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("console_application (no);")
			end
			if not is_version_3 then
					-- This option has been introduced in HACT 4.0 and
					-- are not supported in HACT 3.
				if an_option.create_keyword_extension then
					print_indentation (indent, a_file)
					a_file.put_line ("create_keyword_extension (yes);")
				else
					print_indentation (indent, a_file)
					a_file.put_line ("create_keyword_extension (no);")
				end
			end
			a_dead_code_removal := an_option.dead_code_removal
			if a_dead_code_removal.has (options.all_value) then
				a_dead_code_removal_yes := True
				an_optimize_yes := True
			elseif a_dead_code_removal.has (options.feature_value) then
				a_dead_code_removal_yes := True
			elseif a_dead_code_removal.has (options.class_value) then
				an_optimize_yes := True
			end
			if a_dead_code_removal_yes then
				print_indentation (indent, a_file)
				a_file.put_line ("dead_code_removal (yes);")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("dead_code_removal (no);")
			end
			if an_optimize_yes then
				print_indentation (indent, a_file)
				a_file.put_line ("optimize (yes);")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("optimize (no);")
			end
			if an_option.debug_option then
				print_indentation (indent, a_file)
				a_file.put_line ("debug (yes);")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("debug (no);")
			end
			a_debug_tag_cursor := an_option.debug_tag.new_cursor
			from a_debug_tag_cursor.start until a_debug_tag_cursor.after loop
				print_indentation (indent, a_file)
				a_file.put_string ("debug (%"")
				a_file.put_string (a_debug_tag_cursor.item)
				a_file.put_line ("%");")
				a_debug_tag_cursor.forth
			end
			if not is_version_3 then
					-- This option has been introduced in HACT 4.0 and
					-- are not supported in HACT 3.
				if an_option.dynamic_runtime then
					print_indentation (indent, a_file)
					a_file.put_line ("dynamic_runtime_library (yes);")
				else
					print_indentation (indent, a_file)
					a_file.put_line ("dynamic_runtime_library (no);")
				end
			end
			if an_option.exception_trace then
				print_indentation (indent, a_file)
				a_file.put_line ("exception_trace (yes);")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("exception_trace (no);")
			end
			if not is_version_3 then
					-- This option has been introduced in HACT 4.0 and
					-- are not supported in HACT 3.
				if an_option.garbage_collector.is_equal (options.boehm_value) then
					print_indentation (indent, a_file)
					a_file.put_line ("garbage_collector (%"boehm%");")
				else
					print_indentation (indent, a_file)
					a_file.put_line ("garbage_collector (%"internal%");")
				end
			end
			an_inlining := an_option.inlining
			if an_inlining.has (options.all_value) then
				print_indentation (indent, a_file)
				a_file.put_line ("inlining (yes);")
			elseif an_inlining.has (options.array_value) then
				print_indentation (indent, a_file)
				a_file.put_line ("inlining (yes);")
			elseif an_inlining.has (options.constant_value) then
				print_indentation (indent, a_file)
				a_file.put_line ("inlining (yes);")
			elseif an_inlining.has (options.once_value) then
				print_indentation (indent, a_file)
				a_file.put_line ("inlining (yes);")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("inlining (no);")
			end
			print_indentation (indent, a_file)
			a_file.put_string ("inlining_size (%"")
			a_file.put_integer (an_option.inlining_size)
			a_file.put_line ("%");")
			if not is_version_3 then
					-- This option has been introduced in HACT 4.0 and
					-- are not supported in HACT 3.
				if an_option.linux_fpu_double_precision then
					print_indentation (indent, a_file)
					a_file.put_line ("linux_fpu_double_precision (yes);")
				else
					print_indentation (indent, a_file)
					a_file.put_line ("linux_fpu_double_precision (no);")
				end
			end
			if not is_version_3 then
					-- This option has been introduced in HACT 4.0 and
					-- are not supported in HACT 3.
				if an_option.portable_code_generation then
					print_indentation (indent, a_file)
					a_file.put_line ("portable_code_generation (yes);")
				else
					print_indentation (indent, a_file)
					a_file.put_line ("portable_code_generation (no);")
				end
			end
			if an_option.is_precompiled_declared then
				print_indentation (indent, a_file)
				a_file.put_string ("precompiled (%"")
				a_file.put_string (an_option.precompiled)
				a_file.put_line ("%");")
			end
			if an_option.is_storable_filename_declared then
				print_indentation (indent, a_file)
				a_file.put_string ("storable_file_name (%"")
				a_file.put_string (an_option.precompiled)
				a_file.put_line ("%");")
			end
			if an_option.trace then
				print_indentation (indent, a_file)
				a_file.put_line ("trace (yes)")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("trace (no)")
			end
			if an_option.is_visible_filename_declared then
				print_indentation (indent, a_file)
				a_file.put_string ("visible_file_name (%"")
				a_file.put_string (an_option.precompiled)
				a_file.put_line ("%");")
			end
			if not is_version_3 then
					-- This option has been introduced in HACT 4.0 and
					-- are not supported in HACT 3.
				a_warning := an_option.warning
				if a_warning.is_equal (options.default_value) then
					print_indentation (indent, a_file)
					a_file.put_line ("warning_level (%"default%");")
				elseif a_warning.is_equal (options.all_value) then
					print_indentation (indent, a_file)
					a_file.put_line ("warning_level (all);")
				else
					print_indentation (indent, a_file)
					a_file.put_line ("warning_level (no);")
				end
			end
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
			need_end_keyword: BOOLEAN
			has_default_keyword: BOOLEAN
			an_externals: ET_XACE_EXTERNALS
			a_cursor: DS_LINKED_LIST_CURSOR [ET_XACE_EXPORTED_CLASS]
			an_exclude: DS_HASH_SET [STRING]
			an_exclude_cursor: DS_HASH_SET_CURSOR [STRING]
		do
			if not a_cluster.is_fully_abstract then
				print_indentation (indent, a_file)
				if a_cluster.is_abstract then
					a_file.put_string ("abstract ")
				end
				if a_cluster.is_relative and a_cluster.pathname = Void then
					print_escaped_name (a_cluster.name, a_file)
				else
					print_escaped_name (a_cluster.prefixed_name, a_file)
					a_file.put_string (": %"")
					a_file.put_string (a_cluster.full_pathname)
					a_file.put_character ('%"')
				end
				an_option := a_cluster.options
				if an_option /= Void then
					if an_option.is_exclude_declared then
						an_exclude := an_option.exclude
						if not an_exclude.is_empty then
							if not need_end_keyword then
								a_file.put_new_line
								need_end_keyword := True
							end
							print_indentation (indent + 1, a_file)
							a_file.put_line ("exclude")
							an_exclude_cursor := an_exclude.new_cursor
							from
								an_exclude_cursor.start
								print_indentation (indent + 2, a_file)
								a_file.put_character ('%"')
								a_file.put_string (an_exclude_cursor.item)
								a_file.put_character ('%"')
								an_exclude_cursor.forth
							until
								an_exclude_cursor.after
							loop
								a_file.put_character (';')
								a_file.put_new_line
								print_indentation (indent + 2, a_file)
								a_file.put_character ('%"')
								a_file.put_string (an_exclude_cursor.item)
								a_file.put_character ('%"')
								an_exclude_cursor.forth
							end
							a_file.put_new_line
						end
					end
					has_default_keyword := print_cluster_options (an_option, indent + 1, not need_end_keyword, a_file)
					if not need_end_keyword then
						need_end_keyword := has_default_keyword
					end
				end
				an_externals := a_cluster.externals
				if an_externals /= Void and then not an_externals.exported_classes.is_empty then
					if not need_end_keyword then
						a_file.put_new_line
						need_end_keyword := True
					end
					print_indentation (indent + 1, a_file)
					a_file.put_line ("visible")
					a_cursor := an_externals.exported_classes.new_cursor
					from a_cursor.start until a_cursor.after loop
						print_exported_class (a_cursor.item, indent + 2, a_file)
						a_cursor.forth
					end
				end
				subclusters := a_cluster.subclusters
				if subclusters /= Void then
					if not need_end_keyword then
						a_file.put_new_line
						need_end_keyword := True
					end
					print_indentation (indent + 1, a_file)
					a_file.put_line ("cluster")
					print_clusters (subclusters, indent + 2, a_file)
				end
				if need_end_keyword then
					print_indentation (indent + 1, a_file)
					a_file.put_string ("end;")
					a_file.put_new_line
				else
					a_file.put_character (';')
					a_file.put_new_line
				end
			end
		end

	print_cluster_options (an_option: ET_XACE_OPTIONS; indent: INTEGER;
		need_newline: BOOLEAN; a_file: KI_TEXT_OUTPUT_STREAM): BOOLEAN is
			-- Print cluster options `an_option' to `a_file'.
			-- `need_newline' indicates whether a new-line is need before the `default' keyword.
			-- Return True if the keyword 'default' has been printed.
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
				if need_newline then
					a_file.put_new_line
				end
				an_indent := indent
				print_indentation (an_indent, a_file)
				a_file.put_line ("default")
				an_indent := an_indent + 1
				if an_option.is_assertion_declared then
					an_assertion := an_option.assertion
					if an_assertion.has (options.all_value) then
						print_indentation (an_indent, a_file)
						a_file.put_line ("assertion (all);")
					elseif an_assertion.has (options.check_value) then
						print_indentation (an_indent, a_file)
						a_file.put_line ("assertion (check);")
					elseif an_assertion.has (options.loop_variant_value) then
						print_indentation (an_indent, a_file)
						a_file.put_line ("assertion (loop);")
					elseif an_assertion.has (options.loop_invariant_value) then
						print_indentation (an_indent, a_file)
						a_file.put_line ("assertion (loop);")
					elseif an_assertion.has (options.invariant_value) then
						print_indentation (an_indent, a_file)
						a_file.put_line ("assertion (invariant);")
					elseif an_assertion.has (options.ensure_value) then
						print_indentation (an_indent, a_file)
						a_file.put_line ("assertion (ensure);")
					elseif an_assertion.has (options.require_value) then
						print_indentation (an_indent, a_file)
						a_file.put_line ("assertion (require);")
					elseif an_assertion.has (options.none_value) then
						print_indentation (an_indent, a_file)
						a_file.put_line ("assertion (no);")
					end
				end
				if an_option.is_debug_option_declared then
					if an_option.debug_option then
						print_indentation (an_indent, a_file)
						a_file.put_line ("debug (yes);")
					else
						print_indentation (an_indent, a_file)
						a_file.put_line ("debug (no);")
					end
				end
				a_debug_tag_cursor := an_option.debug_tag.new_cursor
				from a_debug_tag_cursor.start until a_debug_tag_cursor.after loop
					print_indentation (an_indent, a_file)
					a_file.put_string ("debug (%"")
					a_file.put_string (a_debug_tag_cursor.item)
					a_file.put_line ("%");")
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
			print_escaped_name (a_class.class_name, a_file)
			a_file.put_new_line
			if not a_class.features.is_empty then
				print_indentation (indent + 1, a_file)
				a_file.put_string ("export")
				a_file.put_new_line
				a_cursor := a_class.features.new_cursor
				from a_cursor.start until a_cursor.after loop
					print_indentation (indent + 2, a_file)
					print_escaped_name (a_cursor.item.feature_name, a_file)
					if not a_cursor.is_last then
						a_file.put_character (',')
					end
					a_file.put_new_line
					a_cursor.forth
				end
			end
			print_indentation (indent + 1, a_file)
			a_file.put_string ("end")
			a_file.put_new_line
		end

	print_include_directories (a_directories: DS_LINKED_LIST [STRING]; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print `a_directories' to `a_file'.
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
				a_file.put_string ("include_path:")
				a_file.put_new_line
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
					if a_cursor.is_last then
						a_file.put_string ("%";")
					else
						a_file.put_string ("%",")
					end
					a_file.put_new_line
					a_cursor.forth
				end
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
				a_file.put_string ("object:")
				a_file.put_new_line
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
						a_file.put_string ("%";")
					else
						a_file.put_string ("%",")
					end
					a_file.put_new_line
					a_cursor.forth
				end
				a_file.put_new_line
			end
		end

	print_escaped_name (a_name: STRING; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print escaped version of `a_name' to `a_file'.
		do
			if is_lace_keyword (a_name) then
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
				if a_keywords.item (i).is_equal (a_name) then
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
				"abstract",
				"adapt",
				"all",
				"assertion",
				"c",
				"check",
				"cluster",
				"colon",
				"comma",
				"component",
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
