indexing

	description:

		"Ace file generators for Visual Eiffel"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2002, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_VE_GENERATOR

inherit

	ET_XACE_GENERATOR

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
			an_externals: ET_XACE_EXTERNALS
		do
			if output_filename /= Void then
				a_filename := output_filename
			else
				a_filename := esd_filename
			end
			!! a_file.make (a_filename)
			a_file.open_write
			if a_file.is_open_write then
				an_externals := a_system.externals
				if an_externals /= Void then
					an_externals := an_externals.cloned_externals
				end
				a_system.merge_externals
				print_esd_file (a_system, a_file)
				a_file.close
				a_system.set_externals (an_externals)
			else
				error_handler.report_cannot_write_file_error (a_filename)
			end
		end

	generate_cluster (a_cluster: ET_XACE_CLUSTER) is
			-- Generate a new ELD file from `a_cluster'.
		local
			a_filename: STRING
			a_file: KL_TEXT_OUTPUT_FILE
		do
			if output_filename /= Void then
				a_filename := output_filename
			else
				a_filename := eld_filename
			end
			!! a_file.make (a_filename)
			a_file.open_write
			if a_file.is_open_write then
				print_eld_file (a_cluster, a_file)
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
			root_class_name_not_void: a_system.root_class_name /= Void
			creation_procedure_name_not_void: a_system.creation_procedure_name /= Void
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
			a_file.put_line (a_system.system_name)
			a_file.put_new_line
			a_file.put_line ("root")
			a_file.put_new_line
			print_indentation (1, a_file)
			a_file.put_line (a_system.root_class_name)
			a_file.put_new_line
			a_file.put_line ("creation")
			a_file.put_new_line
			print_indentation (1, a_file)
			a_file.put_line (a_system.creation_procedure_name)
			a_file.put_new_line
			a_file.put_line ("cluster")
			a_file.put_new_line
			a_clusters := a_system.clusters
			if a_clusters /= Void then
				print_clusters (a_clusters, a_file)
				a_file.put_new_line
			end
			an_external := a_system.externals
			if an_external /= Void and then an_external.has_link_libraries then
				a_file.put_line ("link")
				a_file.put_new_line
				print_link_libraries (an_external.link_libraries, a_file)
			end
			a_file.put_line ("option")
			a_file.put_new_line
			print_indentation (1, a_file)
			a_file.put_line ("target exe console")
			print_indentation (1, a_file)
			a_file.put_line ("run_time_in_dll off")
			an_option := a_system.options
			if an_option /= Void then
				print_options (an_option, 1, a_file)
			end
			a_file.put_new_line
			a_file.put_line ("end")
		end

	print_eld_file (a_cluster: ET_XACE_CLUSTER; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print ELD `a_cluster' to `a_file'.
		require
			a_cluster_not_void: a_cluster /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			an_option: ET_XACE_OPTIONS
		do
			a_file.put_line ("library")
			a_file.put_new_line
			print_indentation (1, a_file)
			a_file.put_line (a_cluster.name)
			a_file.put_new_line
			a_file.put_line ("cluster")
			a_file.put_new_line
			print_cluster (a_cluster, a_file)
			a_file.put_new_line
			an_option := a_cluster.options
			if an_option /= Void then
				a_file.put_line ("option")
				a_file.put_new_line
				print_indentation (1, a_file)
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
			assertions_off: BOOLEAN
		do
			if an_option.has_optimize.is_true then
				-- Inlining should be disabled otherwise features
				-- `put and `item' from STRING are not dynamically
				-- bound when redefined:
				-- print_indentation (indent, a_file)
				-- a_file.put_line ("finalize on")
				print_indentation (indent, a_file)
				a_file.put_line ("optimize leaves on")
				print_indentation (indent, a_file)
				a_file.put_line ("optimize calls on")
				assertions_off := True
			elseif an_option.has_optimize.is_false then
				assertions_on := True
			end
			if not assertions_off then
				if an_option.has_check.is_true then
					print_indentation (indent, a_file)
					a_file.put_line ("check on")
					assertions_on := True
				elseif an_option.has_check.is_false then
					print_indentation (indent, a_file)
					a_file.put_line ("check off")
					assertions_off := True
				end
				if an_option.has_loop.is_true then
					print_indentation (indent, a_file)
					a_file.put_line ("loop variant on")
					print_indentation (indent, a_file)
					a_file.put_line ("loop invariant on")
					assertions_on := True
				elseif an_option.has_loop.is_false then
					print_indentation (indent, a_file)
					a_file.put_line ("loop variant off")
					print_indentation (indent, a_file)
					a_file.put_line ("loop invariant off")
					assertions_off := True
				end
				if an_option.has_invariant.is_true then
					print_indentation (indent, a_file)
					a_file.put_line ("class invariant on")
					assertions_on := True
				elseif an_option.has_invariant.is_false then
					print_indentation (indent, a_file)
					a_file.put_line ("class invariant off")
					assertions_off := True
				end
				if an_option.has_ensure.is_true then
					print_indentation (indent, a_file)
					a_file.put_line ("ensure on")
					assertions_on := True
				elseif an_option.has_ensure.is_false then
					print_indentation (indent, a_file)
					a_file.put_line ("ensure off")
					assertions_off := True
				end
				if an_option.has_require.is_true then
					print_indentation (indent, a_file)
					a_file.put_line ("require on")
					assertions_on := True
				elseif an_option.has_require.is_false then
					print_indentation (indent, a_file)
					a_file.put_line ("require off")
					assertions_off := True
				end
			end
			if assertions_on then
				print_indentation (indent, a_file)
				a_file.put_line ("assertions on")
			elseif assertions_off then
				print_indentation (indent, a_file)
				a_file.put_line ("assertions off")
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
			a_pathname: STRING
			subclusters: ET_XACE_CLUSTERS
		do
			if not a_cluster.is_abstract then
				print_indentation (1, a_file)
				a_file.put_character ('[')
				a_file.put_string (a_cluster.full_name ('_'))
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

end -- class ET_XACE_VE_GENERATOR
