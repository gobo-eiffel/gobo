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
			a_cursor: DS_HASH_TABLE_CURSOR [BOOLEAN, STRING]
		do
			print_indentation (indent, a_file)
			a_file.put_line ("<option>")
			if an_option.has_require.is_true then
				print_indentation (indent + 1, a_file)
				a_file.put_line ("<require enable=%"True%"/>")
			elseif an_option.has_require.is_false then
				print_indentation (indent + 1, a_file)
				a_file.put_line ("<require enable=%"False%"/>")
			end
			if an_option.has_ensure.is_true then
				print_indentation (indent + 1, a_file)
				a_file.put_line ("<ensure enable=%"True%"/>")
			elseif an_option.has_ensure.is_false then
				print_indentation (indent + 1, a_file)
				a_file.put_line ("<ensure enable=%"False%"/>")
			end
			if an_option.has_invariant.is_true then
				print_indentation (indent + 1, a_file)
				a_file.put_line ("<invariant enable=%"True%"/>")
			elseif an_option.has_invariant.is_false then
				print_indentation (indent + 1, a_file)
				a_file.put_line ("<invariant enable=%"False%"/>")
			end
			if an_option.has_loop.is_true then
				print_indentation (indent + 1, a_file)
				a_file.put_line ("<loop enable=%"True%"/>")
			elseif an_option.has_loop.is_false then
				print_indentation (indent + 1, a_file)
				a_file.put_line ("<loop enable=%"False%"/>")
			end
			if an_option.has_check.is_true then
				print_indentation (indent + 1, a_file)
				a_file.put_line ("<check enable=%"True%"/>")
			elseif an_option.has_check.is_false then
				print_indentation (indent + 1, a_file)
				a_file.put_line ("<check enable=%"False%"/>")
			end
			if an_option.has_optimize.is_true then
				print_indentation (indent + 1, a_file)
				a_file.put_line ("<optimize enable=%"True%"/>")
			elseif an_option.has_optimize.is_false then
				print_indentation (indent + 1, a_file)
				a_file.put_line ("<optimize enable=%"False%"/>")
			end
			if an_option.has_debug.is_true then
				print_indentation (indent + 1, a_file)
				a_file.put_line ("<debug enable=%"True%"/>")
			elseif an_option.has_debug.is_false then
				print_indentation (indent + 1, a_file)
				a_file.put_line ("<debug enable=%"False%"/>")
			end
			a_cursor := an_option.debug_keys.new_cursor
			from a_cursor.start until a_cursor.after loop
				print_indentation (indent + 1, a_file)
				a_file.put_string ("<debug name=%"")
				a_file.put_string (a_cursor.key)
				if a_cursor.item then
					a_file.put_line ("%" enable=%"True%"/>")
				else
					a_file.put_line ("%" enable=%"False%"/>")
				end
				a_cursor.forth
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

end -- class ET_XACE_XML_GENERATOR
