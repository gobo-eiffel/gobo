indexing

	description:

		"Ace file generators for ISE Eiffel"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2002, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_ISE_GENERATOR

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

	ace_filename: STRING is "ise.ace"
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
			a_file.put_line (a_library.name)
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
				print_clusters (a_clusters, a_file)
				a_file.put_new_line
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
			a_debug_tag_cursor: DS_HASH_SET_CURSOR [STRING]
			an_inlining: DS_HASH_SET [STRING]
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
			a_debug_tag_cursor := an_option.debug_tag.new_cursor
			from a_debug_tag_cursor.start until a_debug_tag_cursor.after loop
				print_indentation (indent, a_file)
				a_file.put_string ("debug (%"")
				a_file.put_string (a_debug_tag_cursor.item)
				a_file.put_line ("%")")
				a_debug_tag_cursor.forth
			end
			if an_option.is_document_declared then
				print_indentation (indent, a_file)
				a_file.put_string ("document (%"")
				a_file.put_string (an_option.document)
				a_file.put_line ("%")")
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
			if an_option.multithreaded then
				print_indentation (indent, a_file)
				a_file.put_line ("multithreaded (yes)")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("multithreaded (no)")
			end
			if an_option.is_override_cluster_declared then
				print_indentation (indent, a_file)
				a_file.put_string ("override_cluster (")
				a_file.put_string (an_option.override_cluster)
				a_file.put_line (")")
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
			if an_option.trace then
				print_indentation (indent, a_file)
				a_file.put_line ("trace (yes)")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("trace (no)")
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
		do
			cluster_list := a_clusters.clusters
			nb := cluster_list.count
			from i := 1 until i > nb loop
				print_cluster (cluster_list.item (i), a_file)
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
			an_externals: ET_XACE_EXTERNALS
			a_cursor: DS_LINKED_LIST_CURSOR [ET_XACE_EXPORTED_CLASS]
		do
			if not a_cluster.is_fully_abstract then
				print_indentation (1, a_file)
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
				an_option := a_cluster.options
				if an_option /= Void then
					print_indentation (2, a_file)
					a_file.put_line ("default")
					print_options (an_option, 3, a_file)
					need_end_keyword := True
				end
				an_externals := a_cluster.externals
				if an_externals /= Void and then not an_externals.exported_classes.is_empty then
					print_indentation (2, a_file)
					a_file.put_line ("visible")
					a_cursor := an_externals.exported_classes.new_cursor
					from a_cursor.start until a_cursor.after loop
						print_exported_class (a_cursor.item, 3, a_file)
						a_cursor.forth
					end
					need_end_keyword := True
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
				a_file.put_line ("export")
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
			a_file.put_line ("end")
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
				a_file.put_line ("include_path:")
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
						a_file.put_line ("%";")
					else
						a_file.put_line ("%",")
					end
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
				"adapt",
				"all",
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
