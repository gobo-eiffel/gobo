indexing

	description:

		"Ace file generators for Halstenbach"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2002, Andreas Leitner and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
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
		do
			if output_filename /= Void then
				a_filename := output_filename
			else
				a_filename := ace_filename
			end
			create a_file.make (a_filename)
			a_file.open_write
			if a_file.is_open_write then
				print_ace_file (a_system, a_file)
				a_file.close
			else
				error_handler.report_cannot_write_file_error (a_filename)
			end
		end

	generate_library (a_library: ET_XACE_LIBRARY) is
			-- Generate a new Ace file from `a_library'.
		local
			a_filename: STRING
			a_file: KL_TEXT_OUTPUT_FILE
		do
			if output_filename /= Void then
				a_filename := output_filename
			else
				a_filename := ace_filename
			end
			create a_file.make (a_filename)
			a_file.open_write
			if a_file.is_open_write then
				print_precompile_ace_file (a_library, a_file)
				a_file.close
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
				print_components (a_clusters, a_file)
			end
			create an_external.make
			a_system.merge_externals (an_external)
			if an_external.has_include_directories or an_external.has_link_libraries then
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
				print_components (a_clusters, a_file)
			end
			create an_external.make
			a_library.merge_externals (an_external)
			if an_external.has_include_directories or an_external.has_link_libraries then
				a_file.put_line ("external")
				a_file.put_new_line
				print_include_directories (an_external.include_directories, a_file)
				print_link_libraries (an_external.link_libraries, a_file)
			end
			a_file.put_line ("end")
		end

	print_components (a_clusters: ET_XACE_CLUSTERS; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' the component clause for
			-- `a_clusters' and recursively their subclusters.
		require
			a_clusters_not_void: a_clusters /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			a_components: DS_LINKED_LIST [ET_XACE_COMPONENT]
			a_cursor: DS_LINKED_LIST_CURSOR [ET_XACE_COMPONENT]
			a_component: ET_XACE_COMPONENT
		do
			create a_components.make
			a_clusters.merge_components (a_components)
			if not a_components.is_empty then
				a_file.put_line ("component")
				a_file.put_new_line
				a_cursor := a_components.new_cursor
				from a_cursor.start until a_cursor.after loop
					a_component := a_cursor.item
					print_indentation (1, a_file)
					print_escaped_name (a_component.cluster_name, a_file)
					a_file.put_string (": %"")
					a_file.put_string (a_component.pathname)
					a_file.put_line ("%";")
					a_cursor.forth
				end
				a_file.put_new_line
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
				a_file.put_line ("trace (yes);")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("trace (no);")
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
			a_class_options: DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS]
			all_storable: BOOLEAN
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
					if an_option.is_storable_declared then
						all_storable := an_option.storable
					end
					need_end_keyword := print_cluster_options (an_option, indent + 1, a_file) or need_end_keyword
				end
				a_class_options := a_cluster.class_options
				if a_class_options /= Void then
					need_end_keyword := print_class_options (a_class_options, all_storable, indent + 1, a_file) or need_end_keyword
				elseif all_storable then
					a_file.put_new_line
					print_indentation (indent + 1, a_file)
					a_file.put_line ("storable")
					print_indentation (indent + 2, a_file)
					a_file.put_string ("all")
					need_end_keyword := True
				end
				subclusters := a_cluster.subclusters
				if subclusters /= Void then
					a_file.put_new_line
					print_indentation (indent + 1, a_file)
					a_file.put_line ("cluster")
					print_clusters (subclusters, indent + 2, a_file)
					print_indentation (indent + 1, a_file)
					a_file.put_line ("end;")
				elseif need_end_keyword then
					a_file.put_new_line
					print_indentation (indent + 1, a_file)
					a_file.put_line ("end;")
				else
					a_file.put_character (';')
					a_file.put_new_line
				end
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
					a_file.put_new_line
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
				end
			end
			if an_option.is_exclude_declared then
				an_exclude := an_option.exclude
				if not an_exclude.is_empty then
					Result := True
					a_file.put_new_line
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
			end
			if an_option.is_assertion_declared then
				need_default := True
			elseif an_option.is_debug_option_declared then
				need_default := True
			elseif an_option.is_debug_tag_declared then
				need_default := True
			elseif an_option.is_trace_declared then
				need_default := True
			end
			if need_default then
				Result := True
				a_file.put_new_line
				an_indent := indent
				print_indentation (an_indent, a_file)
				a_file.put_string ("default")
				an_indent := an_indent + 1
				if an_option.is_assertion_declared then
					an_assertion := an_option.assertion
					if an_assertion.has (options.all_value) then
						a_file.put_new_line
						print_indentation (an_indent, a_file)
						a_file.put_string ("assertion (all);")
					elseif an_assertion.has (options.check_value) then
						a_file.put_new_line
						print_indentation (an_indent, a_file)
						a_file.put_string ("assertion (check);")
					elseif an_assertion.has (options.loop_variant_value) then
						a_file.put_new_line
						print_indentation (an_indent, a_file)
						a_file.put_string ("assertion (loop);")
					elseif an_assertion.has (options.loop_invariant_value) then
						a_file.put_new_line
						print_indentation (an_indent, a_file)
						a_file.put_string ("assertion (loop);")
					elseif an_assertion.has (options.invariant_value) then
						a_file.put_new_line
						print_indentation (an_indent, a_file)
						a_file.put_string ("assertion (invariant);")
					elseif an_assertion.has (options.ensure_value) then
						a_file.put_new_line
						print_indentation (an_indent, a_file)
						a_file.put_string ("assertion (ensure);")
					elseif an_assertion.has (options.require_value) then
						a_file.put_new_line
						print_indentation (an_indent, a_file)
						a_file.put_string ("assertion (require);")
					elseif an_assertion.has (options.none_value) then
						a_file.put_new_line
						print_indentation (an_indent, a_file)
						a_file.put_string ("assertion (no);")
					end
				end
				if an_option.is_debug_option_declared then
					if an_option.debug_option then
						a_file.put_new_line
						print_indentation (an_indent, a_file)
						a_file.put_string ("debug (yes);")
					else
						a_file.put_new_line
						print_indentation (an_indent, a_file)
						a_file.put_string ("debug (no);")
					end
				end
				a_debug_tag_cursor := an_option.debug_tag.new_cursor
				from a_debug_tag_cursor.start until a_debug_tag_cursor.after loop
					a_file.put_new_line
					print_indentation (an_indent, a_file)
					a_file.put_string ("debug (%"")
					a_file.put_string (a_debug_tag_cursor.item)
					a_file.put_string ("%");")
					a_debug_tag_cursor.forth
				end
				if an_option.is_trace_declared then
					if an_option.trace then
						a_file.put_new_line
						print_indentation (an_indent, a_file)
						a_file.put_string ("trace (yes);")
					else
						a_file.put_new_line
						print_indentation (an_indent, a_file)
						a_file.put_string ("trace (no);")
					end
				end
			end
		end

	print_class_options (an_option_list: DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS];
		all_storable: BOOLEAN; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM): BOOLEAN is
			-- Print class options `an_option_list' to `a_file'. `all_storable'
			-- indicates that the option 'storable all' should be printed.
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
			need_visible, visible_printed: BOOLEAN
			need_storable, storable_printed: BOOLEAN
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
						a_file.put_new_line
						print_indentation (an_indent, a_file)
						a_file.put_string ("option")
						option_printed := True
					end
					an_indent := an_indent + 1
					if an_option.is_assertion_declared then
						an_assertion := an_option.assertion
						if an_assertion.has (options.all_value) then
							a_file.put_new_line
							print_indentation (an_indent, a_file)
							a_file.put_string ("assertion (all): ")
							a_file.put_string (a_class_name)
							a_file.put_character (';')
						elseif an_assertion.has (options.check_value) then
							a_file.put_new_line
							print_indentation (an_indent, a_file)
							a_file.put_string ("assertion (check): ")
							a_file.put_string (a_class_name)
							a_file.put_character (';')
						elseif an_assertion.has (options.loop_variant_value) then
							a_file.put_new_line
							print_indentation (an_indent, a_file)
							a_file.put_string ("assertion (loop): ")
							a_file.put_string (a_class_name)
							a_file.put_character (';')
						elseif an_assertion.has (options.loop_invariant_value) then
							a_file.put_new_line
							print_indentation (an_indent, a_file)
							a_file.put_string ("assertion (loop): ")
							a_file.put_string (a_class_name)
							a_file.put_character (';')
						elseif an_assertion.has (options.invariant_value) then
							a_file.put_new_line
							print_indentation (an_indent, a_file)
							a_file.put_string ("assertion (invariant): ")
							a_file.put_string (a_class_name)
							a_file.put_character (';')
						elseif an_assertion.has (options.ensure_value) then
							a_file.put_new_line
							print_indentation (an_indent, a_file)
							a_file.put_string ("assertion (ensure): ")
							a_file.put_string (a_class_name)
							a_file.put_character (';')
						elseif an_assertion.has (options.require_value) then
							a_file.put_new_line
							print_indentation (an_indent, a_file)
							a_file.put_string ("assertion (require): ")
							a_file.put_string (a_class_name)
							a_file.put_character (';')
						elseif an_assertion.has (options.none_value) then
							a_file.put_new_line
							print_indentation (an_indent, a_file)
							a_file.put_string ("assertion (no): ")
							a_file.put_string (a_class_name)
							a_file.put_character (';')
						end
					end
					if an_option.is_debug_option_declared then
						if an_option.debug_option then
							a_file.put_new_line
							print_indentation (an_indent, a_file)
							a_file.put_string ("debug (yes): ")
							a_file.put_string (a_class_name)
							a_file.put_character (';')
						else
							a_file.put_new_line
							print_indentation (an_indent, a_file)
							a_file.put_string ("debug (no): ")
							a_file.put_string (a_class_name)
							a_file.put_character (';')
						end
					end
					a_debug_tag_cursor := an_option.debug_tag.new_cursor
					from a_debug_tag_cursor.start until a_debug_tag_cursor.after loop
						a_file.put_new_line
						print_indentation (an_indent, a_file)
						a_file.put_string ("debug (%"")
						a_file.put_string (a_debug_tag_cursor.item)
						a_file.put_string ("%"): ")
						a_file.put_string (a_class_name)
						a_file.put_character (';')
						a_debug_tag_cursor.forth
					end
					if an_option.is_trace_declared then
						if an_option.trace then
							a_file.put_new_line
							print_indentation (an_indent, a_file)
							a_file.put_string ("trace (yes): ")
							a_file.put_string (a_class_name)
							a_file.put_character (';')
						else
							a_file.put_new_line
							print_indentation (an_indent, a_file)
							a_file.put_string ("trace (no): ")
							a_file.put_string (a_class_name)
							a_file.put_character (';')
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
						a_file.put_new_line
						print_indentation (an_indent, a_file)
						a_file.put_string ("visible")
						visible_printed := True
					end
					an_indent := an_indent + 1
					a_file.put_new_line
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
					a_file.put_string ("end")
					an_indent := an_indent - 2
				end
				a_class_cursor.forth
			end
			if all_storable then
				a_file.put_new_line
				print_indentation (an_indent, a_file)
				a_file.put_line ("storable")
				print_indentation (an_indent + 1, a_file)
				a_file.put_string ("all")
				storable_printed := True
			else
				from a_class_cursor.start until a_class_cursor.after loop
					a_class_options := a_class_cursor.item
					a_class_name := a_class_options.class_name
					an_option := a_class_options.options
					need_storable := False
					if an_option.is_storable_declared then
						need_storable := an_option.storable
					end
					if need_storable then
						if not storable_printed then
							a_file.put_new_line
							print_indentation (an_indent, a_file)
							a_file.put_line ("storable")
							storable_printed := True
						else
							a_file.put_character (',')
							a_file.put_new_line
						end
						an_indent := an_indent + 1
						print_indentation (an_indent, a_file)
						print_escaped_name (a_class_name, a_file)
						an_indent := an_indent - 1
					end
					a_class_cursor.forth
				end
			end
			Result := option_printed or visible_printed or storable_printed
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
