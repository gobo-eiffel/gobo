note

	description:

		"Xace file generators from Xace files. Useful to strip if/unless clauses."

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_XACE_GENERATOR

obsolete

	"Use ET_ECF_* classes instead. [2019-03-17]"

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
			root_class_name_not_void: attached a_system.root_class_name as l_root_class_name
			root_class_name_not_empty: l_root_class_name.count > 0
			creation_procedure_name_not_void: attached a_system.creation_procedure_name as l_creation_procedure_name
			creation_procedure_name_not_empty: l_creation_procedure_name.count > 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_target: ET_XACE_TARGET
		do
			a_file.put_line ("<?xml version=%"1.0%"?>")
			a_file.put_new_line
			a_file.put_string ("<system name=%"")
			print_quote_escaped_string (a_system.name, a_file)
			a_file.put_line ("%">")
			print_indentation (1, a_file)
			a_file.put_string ("<root class=%"")
			if attached a_system.root_class_name as l_root_class_name then
				print_quote_escaped_string (l_root_class_name, a_file)
			else
					-- Should never happen according to the precondition.
				check precondition: False end
			end
			a_file.put_string ("%" creation=%"")
			if attached a_system.creation_procedure_name as l_creation_procedure_name then
				print_quote_escaped_string (l_creation_procedure_name, a_file)
			else
					-- Should never happen according to the precondition.
				check precondition: False end
			end
			a_file.put_line ("%"/>")
			if is_shallow then
				l_target := a_system.selected_target
				print_options (l_target.options, 1, a_file)
				print_clusters (l_target.clusters, 1, a_file)
				print_mounted_libraries (l_target.libraries, 1, a_file)
			else
				print_options (a_system.options, 1, a_file)
				print_clusters (a_system.clusters, 1, a_file)
			end
			a_file.put_line ("</system>")
		end

	print_xace_library_file (a_library: ET_XACE_LIBRARY_CONFIG; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print Xace version of `a_library' to `a_file'.
		require
			a_library_not_void: a_library /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_target: ET_XACE_TARGET
			a_prefix: STRING
		do
			a_file.put_line ("<?xml version=%"1.0%"?>")
			a_file.put_new_line
			a_file.put_string ("<library name=%"")
			print_quote_escaped_string (a_library.name, a_file)
			if is_shallow then
				a_prefix := a_library.library_prefix
				if a_prefix.count > 0 then
					a_file.put_string ("%" prefix=%"")
					print_quote_escaped_string (a_prefix, a_file)
				end
				a_file.put_line ("%">")
				l_target := a_library.selected_target
				print_options (l_target.options, 1, a_file)
				print_clusters (l_target.clusters, 1, a_file)
				print_mounted_libraries (l_target.libraries, 1, a_file)
			else
				a_file.put_line ("%">")
				print_options (a_library.options, 1, a_file)
				print_clusters (a_library.clusters, 1, a_file)
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
			l_name: STRING
		do
			across an_option.primary_options as i_option loop
				print_indentation (indent, a_file)
				a_file.put_string ("<option name=%"")
				print_quote_escaped_string (@i_option.key, a_file)
				a_file.put_string ("%" value=%"")
				print_quote_escaped_string (i_option, a_file)
				a_file.put_line ("%"/>")
			end
			across an_option.primary_multivalue_options as i_multivalue_option loop
				l_name := @i_multivalue_option.key
				if attached i_multivalue_option as l_multivalues then
					across l_multivalues as i_value loop
						print_indentation (indent, a_file)
						a_file.put_string ("<option name=%"")
						print_quote_escaped_string (l_name, a_file)
						a_file.put_string ("%" value=%"")
						print_quote_escaped_string (i_value, a_file)
						a_file.put_line ("%"/>")
					end
				end
			end
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
			library_list := a_mounted_libraries.libraries
			nb := a_mounted_libraries.count
			from i := 1 until i > nb loop
				a_library := library_list.item (i)
				print_indentation (indent, a_file)
				a_file.put_string ("<mount location=%"")
				print_quote_escaped_string (a_library.pathname, a_file)
				a_file.put_line ("%"/>")
				i := i + 1
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
