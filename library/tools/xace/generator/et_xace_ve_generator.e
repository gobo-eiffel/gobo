indexing

	description:

		"Ace file generators for Visual Eiffel"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2002, Andreas Leitner and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_VE_GENERATOR

inherit

	ET_XACE_GENERATOR

	KL_IMPORTED_ARRAY_ROUTINES

	UT_STRING_ROUTINES
		export {NONE} all end

creation

	make

feature -- Access

	esd_filename: STRING is "ve.esd"
			-- Name of generated Ace file

	eld_filename: STRING is "ve.eld"
			-- Name of generated library Ace file

feature -- Output

	generate_system (a_system: ET_XACE_SYSTEM) is
			-- Generate a new ESD file from `a_system'.
		local
			a_filename: STRING
			a_file: KL_TEXT_OUTPUT_FILE
		do
			if output_filename /= Void then
				a_filename := output_filename
			else
				a_filename := esd_filename
			end
			create a_file.make (a_filename)
			a_file.open_write
			if a_file.is_open_write then
				print_esd_file (a_system, a_file)
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
				a_filename := eld_filename
			end
			create a_file.make (a_filename)
			a_file.open_write
			if a_file.is_open_write then
				print_eld_file (a_library, a_file)
				a_file.close
			else
				error_handler.report_cannot_write_file_error (a_filename)
			end
		end

feature {NONE} -- Output

	print_esd_file (a_system: ET_XACE_SYSTEM; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print ESD `a_system' to `a_file'.
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
			a_clusters: ET_XACE_CLUSTERS
			an_option: ET_XACE_OPTIONS
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
			a_file.put_new_line
			a_file.put_new_line
			a_file.put_line ("creation")
			a_file.put_new_line
			print_indentation (1, a_file)
			print_escaped_name (a_system.creation_procedure_name, a_file)
			a_file.put_new_line
			a_file.put_new_line
			a_file.put_line ("cluster")
			a_file.put_new_line
			a_clusters := a_system.clusters
			if a_clusters /= Void then
				print_clusters (a_clusters, a_file)
				a_file.put_new_line
			end
			create an_external.make
			a_system.merge_externals (an_external)
			if an_external.has_link_libraries then
				a_file.put_line ("link")
				a_file.put_new_line
				print_link_libraries (an_external.link_libraries, a_file)
			end
			an_option := a_system.options
			if an_option /= Void then
				a_file.put_line ("option")
				a_file.put_new_line
				print_options (an_option, 1, a_file)
				a_file.put_new_line
			end
			a_file.put_line ("end")
		end

	print_eld_file (a_library: ET_XACE_LIBRARY; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print ELD `a_library' to `a_file'.
		require
			a_library_not_void: a_library /= Void
			a_library_name_not_void: a_library.name /= Void
			a_library_name_not_empty: a_library.name.count > 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			a_clusters: ET_XACE_CLUSTERS
			an_option: ET_XACE_OPTIONS
			an_external: ET_XACE_EXTERNALS
		do
			a_file.put_line ("library")
			a_file.put_new_line
			print_indentation (1, a_file)
			print_escaped_name (a_library.name, a_file)
			a_file.put_new_line
			a_file.put_new_line
			a_file.put_line ("cluster")
			a_file.put_new_line
			a_clusters := a_library.clusters
			if a_clusters /= Void then
				print_clusters (a_clusters, a_file)
				a_file.put_new_line
			end
			a_file.put_line ("end")
			a_file.put_new_line
			a_file.put_new_line
			create an_external.make
			a_library.merge_externals (an_external)
			if an_external.has_link_libraries then
				a_file.put_line ("link")
				a_file.put_new_line
				print_link_libraries (an_external.link_libraries, a_file)
			end
			an_option := a_library.options
			if an_option /= Void then
				a_file.put_line ("option")
				a_file.put_new_line
				print_options (an_option, 1, a_file)
				a_file.put_new_line
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
			assertions_on: BOOLEAN
			require_on: BOOLEAN
			ensure_on: BOOLEAN
			class_invariant_on: BOOLEAN
			loop_invariant_on: BOOLEAN
			loop_variant_on: BOOLEAN
			check_on: BOOLEAN
			an_assertion: DS_HASH_SET [STRING]
			optimize_dead_code_on: BOOLEAN
			optimize_calls_on: BOOLEAN
			optimize_dyn_type_on: BOOLEAN
			a_dead_code_removal: DS_HASH_SET [STRING]
			optimize_inline_on: BOOLEAN
			optimize_constants_on: BOOLEAN
			optimize_once_on: BOOLEAN
			an_inlining: DS_HASH_SET [STRING]
			a_target: STRING
		do
			an_assertion := an_option.assertion
			if an_assertion.has (options.none_value) then
				-- Do nothing.
			end
			if an_assertion.has (options.generate_value) then
				assertions_on := True
			end
			if an_assertion.has (options.require_value) then
				assertions_on := True
				require_on := True
			end
			if an_assertion.has (options.ensure_value) then
				assertions_on := True
				ensure_on := True
			end
			if an_assertion.has (options.invariant_value) then
				assertions_on := True
				class_invariant_on := True
			end
			if an_assertion.has (options.loop_invariant_value) then
				assertions_on := True
				loop_invariant_on := True
			end
			if an_assertion.has (options.loop_variant_value) then
				assertions_on := True
				loop_variant_on := True
			end
			if an_assertion.has (options.check_value) then
				assertions_on := True
				check_on := True
			end
			if an_assertion.has (options.all_value) then
				assertions_on := True
				require_on := True
				ensure_on := True
				class_invariant_on := True
				loop_invariant_on := True
				loop_variant_on := True
				check_on := True
			end
			if assertions_on then
				print_indentation (indent, a_file)
				a_file.put_line ("assertions on")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("assertions off")
			end
			if require_on then
				print_indentation (indent, a_file)
				a_file.put_line ("require on")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("require off")
			end
			if ensure_on then
				print_indentation (indent, a_file)
				a_file.put_line ("ensure on")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("ensure off")
			end
			if class_invariant_on then
				print_indentation (indent, a_file)
				a_file.put_line ("class invariant on")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("class invariant off")
			end
			if loop_invariant_on then
				print_indentation (indent, a_file)
				a_file.put_line ("loop invariant on")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("loop invariant off")
			end
			if loop_variant_on then
				print_indentation (indent, a_file)
				a_file.put_line ("loop variant on")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("loop variant off")
			end
			if check_on then
				print_indentation (indent, a_file)
				a_file.put_line ("check on")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("check off")
			end
			a_dead_code_removal := an_option.dead_code_removal
			if a_dead_code_removal.has (options.none_value) then
				-- Do nothing.
			end
			if a_dead_code_removal.has (options.low_level_value) then
				optimize_dead_code_on := True
			end
			if a_dead_code_removal.has (options.feature_value) then
				optimize_calls_on := True
			end
			if a_dead_code_removal.has (options.class_value) then
				optimize_dyn_type_on := True
			end
			if a_dead_code_removal.has (options.all_value) then
				optimize_dead_code_on := True
				optimize_calls_on := True
				optimize_dyn_type_on := True
			end
			if optimize_dead_code_on then
				print_indentation (indent, a_file)
				a_file.put_line ("optimize dead_code on")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("optimize dead_code off")
			end
			if optimize_calls_on then
				print_indentation (indent, a_file)
				a_file.put_line ("optimize calls on")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("optimize calls off")
			end
			if optimize_dyn_type_on then
				print_indentation (indent, a_file)
				a_file.put_line ("optimize dyn_type on")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("optimize dyn_type off")
			end
			if an_option.debug_option or an_option.is_debug_tag_declared then
				print_indentation (indent, a_file)
				a_file.put_line ("debug instructions on")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("debug instructions off")
			end
			if an_option.debugger then
				print_indentation (indent, a_file)
				a_file.put_line ("debug on")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("debug off")
			end
			if an_option.dynamic_runtime then
				print_indentation (indent, a_file)
				a_file.put_line ("run_time_in_dll on")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("run_time_in_dll off")
			end
			if an_option.finalize_option then
				print_indentation (indent, a_file)
				a_file.put_line ("finalize on")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("finalize off")
			end
			if an_option.flat_fst_optimization then
				print_indentation (indent, a_file)
				a_file.put_line ("optimize flat_fst on")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("optimize flat_fst off")
			end
			print_indentation (indent, a_file)
			a_file.put_string ("FST_expansion_factor ")
			a_file.put_integer (an_option.fst_expansion_factor)
			a_file.put_new_line
			if an_option.fst_optimization then
				print_indentation (indent, a_file)
				a_file.put_line ("optimize FST on")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("optimize FST off")
			end
			if an_option.is_heap_size_declared then
				print_indentation (indent, a_file)
				a_file.put_string ("heap_size ")
				a_file.put_integer (an_option.heap_size)
				a_file.put_new_line
			end
			an_inlining := an_option.inlining
			if an_inlining.has (options.none_value) then
				-- Do nothing.
			end
			if an_inlining.has (options.array_value) then
				optimize_inline_on := True
			end
			if an_inlining.has (options.constant_value) then
				optimize_constants_on := True
			end
			if an_inlining.has (options.once_value) then
				optimize_once_on := True
			end
			if an_inlining.has (options.all_value) then
				optimize_inline_on := True
				optimize_constants_on := True
				optimize_once_on := True
			end
			if optimize_inline_on then
				print_indentation (indent, a_file)
				a_file.put_line ("optimize inline on")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("optimize inline off")
			end
			if optimize_constants_on then
				print_indentation (indent, a_file)
				a_file.put_line ("optimize constants on")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("optimize constants off")
			end
			if optimize_once_on then
				print_indentation (indent, a_file)
				a_file.put_line ("optimize once on")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("optimize once off")
			end
			if an_option.jumps_optimization then
				print_indentation (indent, a_file)
				a_file.put_line ("optimize jumps on")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("optimize jumps off")
			end
			if an_option.layout_optimization then
				print_indentation (indent, a_file)
				a_file.put_line ("optimize layout on")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("optimize layout off")
			end
			if an_option.leaves_optimization then
				print_indentation (indent, a_file)
				a_file.put_line ("optimize leaves on")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("optimize leaves off")
			end
			if an_option.linker.is_equal (options.microsoft_value) then
				print_indentation (indent, a_file)
				a_file.put_line ("linker microsoft")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("linker default")
			end
			if an_option.map then
				print_indentation (indent, a_file)
				a_file.put_line ("map on")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("map off")
			end
			if an_option.is_multithreaded_declared then
				if an_option.multithreaded then
					print_indentation (indent, a_file)
					a_file.put_line ("multithreading on")
				else
					print_indentation (indent, a_file)
					a_file.put_line ("multithreading off")
				end
			end
			if an_option.no_default_lib then
				print_indentation (indent, a_file)
				a_file.put_line ("no_default_lib on")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("no_default_lib off")
			end
			if an_option.reloads_optimization then
				print_indentation (indent, a_file)
				a_file.put_line ("optimize reloads on")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("optimize reloads off")
			end
			if an_option.is_stack_size_declared then
				print_indentation (indent, a_file)
				a_file.put_string ("stack_size ")
				a_file.put_integer (an_option.stack_size)
				a_file.put_new_line
			end
			a_target := an_option.target
			if a_target.is_equal (options.exe_value) then
				print_indentation (indent, a_file)
				a_file.put_string ("target exe ")
			elseif a_target.is_equal (options.dll_value) then
				print_indentation (indent, a_file)
				a_file.put_string ("target dll ")
			elseif a_target.is_equal (options.com_value) then
				print_indentation (indent, a_file)
				a_file.put_string ("target com ")
			else
				print_indentation (indent, a_file)
				a_file.put_string ("target dll ")
			end
			if an_option.console_application then
				a_file.put_line ("console")
			else
				a_file.put_line ("windows")
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
			subclusters: ET_XACE_CLUSTERS
		do
			if not a_cluster.is_abstract then
				print_indentation (1, a_file)
				a_file.put_character ('[')
				print_escaped_name (a_cluster.prefixed_name, a_file)
				a_file.put_string (" %"")
				a_pathname := a_cluster.full_pathname
					-- Visual Eiffel does not like the currly
					-- brackets around environment variables.
				a_pathname := remove_all_characters (a_pathname, '{')
				a_pathname := remove_all_characters (a_pathname, '}')
				a_file.put_string (a_pathname)
				a_file.put_line ("%"] end")
			end
			subclusters := a_cluster.subclusters
			if subclusters /= Void then
				print_clusters (subclusters, a_file)
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
				a_cursor := a_libraries.new_cursor
				from a_cursor.start until a_cursor.after loop
					print_indentation (1, a_file)
					a_file.put_character ('%"')
					a_pathname := a_cursor.item
						-- Visual Eiffel does not like the currly
						-- brackets around environment variables.
					a_pathname := remove_all_characters (a_pathname, '{')
					a_pathname := remove_all_characters (a_pathname, '}')
					a_pathname := remove_all_characters (a_pathname, '(')
					a_pathname := remove_all_characters (a_pathname, ')')
					a_file.put_string (a_pathname)
					a_file.put_line ("%"")
					a_cursor.forth
				end
				a_file.put_new_line
			end
		end

feature {NONE} -- Implementation

	is_esd_keyword (a_name: STRING): BOOLEAN is
			-- Is `a_name' an ESD keyword?
		require
			a_name_not_void: a_name /= Void
		local
			i, nb: INTEGER
			a_keywords: like esd_keywords
		do
			a_keywords := esd_keywords
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

	esd_keywords: ARRAY [STRING] is
			-- ESD keywords
		once
			Result := <<
				"as",
				"assertions",
				"call_back",
				"calls",
				"check",
				"class",
				"cluster",
				"code",
				"console",
				"constants",
				"creation",
				"debug",
				"dll",
				"dyn_type",
				"end",
				"ensure",
				"exe",
				"fst",
				"heap_size",
				"inline",
				"interface",
				"invariant",
				"leaves",
				"library",
				"link",
				"linker",
				"loop",
				"makepath",
				"off",
				"on",
				"once",
				"optimize",
				"option",
				"rename",
				"require",
				"root",
				"run_time",
				"select",
				"stack_size",
				"strip",
				"subscript",
				"system",
				"target",
				"threshold",
				"variant"
			>>
		ensure
			esd_keywords_not_void: Result /= Void
			no_void_keyword: not STRING_ARRAY_.has (Result, Void)
		end

end
