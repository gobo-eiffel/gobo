note

	description:

		"Gobo Eiffel Documentation HTML Format with ISE stylesheet"

	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEDOC_HTML_WITH_ISE_STYLESHEET_FORMAT

inherit

	GEDOC_FORMAT
		redefine
			prepare_system
		end

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

	ET_SHARED_FEATURE_NAME_TESTER
		export {NONE} all end

	ET_SHARED_FEATURE_SORTER_BY_NAME
		export {NONE} all end

	ET_SHARED_CLASS_SORTER_BY_NAME
		export {NONE} all end

	ET_SHARED_FEATURE_NAME_SORTER
		export {NONE} all end

	KL_IMPORTED_ANY_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Processing

	prepare_system (a_system: ET_SYSTEM)
			-- Prepare `a_system' before being processed.
		do
			precursor (a_system)
			a_system.set_suppliers_enabled (True)
		end

	process_system (a_system: ET_SYSTEM)
			-- Process `a_system'.
			-- Use `input_classes' as input classes if not Void.
			-- Otherwise use all classes in `a_system'.
		local
			l_class_mapping: DS_HASH_TABLE [STRING, ET_CLASS]
			l_class_chart_mapping: DS_HASH_TABLE [STRING, ET_CLASS]
			l_class_links_mapping: DS_HASH_TABLE [STRING, ET_CLASS]
			l_feature_mapping: DS_HASH_TABLE [STRING, ET_FEATURE]
			l_parent_classes: DS_HASH_TABLE [DS_HASH_SET [ET_CLASS], ET_CLASS]
			l_heir_classes: DS_HASH_TABLE [DS_HASH_SET [ET_CLASS], ET_CLASS]
			l_client_classes: DS_HASH_TABLE [DS_HASH_SET [ET_CLASS], ET_CLASS]
			l_suppliers_classes: DS_HASH_TABLE [DS_HASH_SET [ET_CLASS], ET_CLASS]
			nb: INTEGER
			l_root_path: STRING
			l_clock: DT_SHARED_SYSTEM_CLOCK
			dt1: detachable DT_DATE_TIME
		do
			if not a_system.stop_requested and then a_system.error_handler.benchmark_shown then
				create l_clock
				dt1 := l_clock.system_clock.date_time_now
			end
			a_system.parse_all_recursive
			if not a_system.stop_requested and then dt1 /= Void and l_clock /= Void then
				a_system.print_time (dt1, "Degree 5")
				dt1 := l_clock.system_clock.date_time_now
			end
			a_system.compile_degree_4
			if not a_system.stop_requested and then dt1 /= Void and l_clock /= Void then
				a_system.print_time (dt1, "Degree 4")
				dt1 := l_clock.system_clock.date_time_now
			end
			a_system.compile_degree_3
			if not a_system.stop_requested and then dt1 /= Void and l_clock /= Void then
				a_system.print_time (dt1, "Degree 3")
				dt1 := l_clock.system_clock.date_time_now
			end
			l_class_mapping := class_mapping ("", a_system, input_classes)
			l_class_chart_mapping := class_mapping ("_chart", a_system, input_classes)
			l_class_links_mapping := class_mapping ("_links", a_system, input_classes)
			l_feature_mapping := feature_mapping (a_system, input_classes)
			l_root_path := ""
			print_css_file
			print_goto_file (l_class_chart_mapping)
			print_class_list_file (a_system, l_class_chart_mapping, l_feature_mapping)
			if library_prefix_flag then
				l_root_path := "../"
				across l_class_mapping as l_mapping loop
					l_mapping.replace (l_root_path + l_mapping.item)
				end
				across l_class_chart_mapping as l_mapping loop
					l_mapping.replace (l_root_path + l_mapping.item)
				end
				across l_class_links_mapping as l_mapping loop
					l_mapping.replace (l_root_path + l_mapping.item)
				end
				across l_feature_mapping as l_mapping loop
					l_mapping.replace (l_root_path + l_mapping.item)
				end
			end
			if not a_system.stop_requested and then dt1 /= Void and l_clock /= Void then
				a_system.print_time (dt1, "Cluster Charts")
				dt1 := l_clock.system_clock.date_time_now
			end
			nb := a_system.class_count_recursive
			create l_parent_classes.make_map (nb)
			create l_heir_classes.make_map (nb)
			create l_client_classes.make_map (nb)
			create l_suppliers_classes.make_map (nb)
			a_system.classes_do_recursive (agent build_class_relations (?, l_parent_classes, l_heir_classes, l_client_classes, l_suppliers_classes))
			l_class_mapping.keys.do_all (agent print_class_links (?, l_parent_classes, l_heir_classes, l_client_classes, l_suppliers_classes, l_class_links_mapping, l_feature_mapping, l_root_path))
			if not a_system.stop_requested and then dt1 /= Void and l_clock /= Void then
				a_system.print_time (dt1, "Class Relations")
				dt1 := l_clock.system_clock.date_time_now
			end
			l_class_mapping.keys.do_all (agent print_class_chart (?, l_parent_classes, l_class_chart_mapping, l_feature_mapping, l_root_path))
			if not a_system.stop_requested and then dt1 /= Void and l_clock /= Void then
				a_system.print_time (dt1, "Class Charts")
				dt1 := l_clock.system_clock.date_time_now
			end
			l_class_mapping.keys.do_all (agent print_class_text (?, l_class_mapping, l_feature_mapping, l_root_path))
			if not a_system.stop_requested and then dt1 /= Void then
				a_system.print_time (dt1, "Class Texts")
			end
		end

feature {NONE} -- Output

	print_css_file
			-- Print file "default.css".
		local
			l_file: KL_TEXT_OUTPUT_FILE
			l_filename: STRING
		do
			if attached output_directory as l_output_directory then
				l_filename := file_system.pathname (l_output_directory, "default.css")
				if not is_file_overwritable (l_filename) then
					report_file_already_exists_error (l_filename)
				else
					create l_file.make (l_filename)
					l_file.recursive_open_write
					if l_file.is_open_write then
						l_file.put_string (css_file_content)
						l_file.close
					end
				end
			end
		end

	print_goto_file (a_class_chart_mapping: DS_HASH_TABLE [STRING, ET_CLASS])
			-- Print file "goto.html".
		require
			a_class_chart_mapping_not_void: a_class_chart_mapping /= Void
		local
			l_file: KL_TEXT_OUTPUT_FILE
			l_filename: STRING
		do
			if attached output_directory as l_output_directory then
				l_filename := file_system.pathname (l_output_directory, "goto.html")
				if not is_file_overwritable (l_filename) then
					report_file_already_exists_error (l_filename)
				else
					create l_file.make (l_filename)
					l_file.recursive_open_write
					if l_file.is_open_write then
						l_file.put_line ("<!--")
						l_file.put_line ("%TclassList = new Array (")
						across a_class_chart_mapping as l_mapping loop
							l_file.put_string ("%T%T%"")
							l_file.put_string (l_mapping.key.upper_name)
							l_file.put_character ('%"')
							if not l_mapping.is_last then
								l_file.put_character (',')
							end
							l_file.put_new_line
						end
						l_file.put_line ("%T);")
						l_file.put_new_line
						l_file.put_line ("%TlocationList = new Array (")
						across a_class_chart_mapping as l_mapping loop
							l_file.put_string ("%T%T%"")
							l_file.put_string (l_mapping.item)
							l_file.put_character ('%"')
							if not l_mapping.is_last then
								l_file.put_character (',')
							end
							l_file.put_new_line
						end
						l_file.put_line ("%T);")
						l_file.put_new_line
						l_file.put_line ("%Tfunction indexOfClass (name) {")
						l_file.put_line ("%T%Tfor (i = 0; i < classList.length; i++) {")
						l_file.put_line ("%T%T%Tif (name == classList[i]) return i;")
						l_file.put_line ("%T%T}")
						l_file.put_line ("%T%Treturn -1;")
						l_file.put_line ("%T};")
						l_file.put_new_line
						l_file.put_line ("%Tfunction go_to (baseLocation, className) {")
						l_file.put_line ("%T%Tvar index = indexOfClass (className.toUpperCase ());")
						l_file.put_line ("%T%Tif (index >= 0) {")
						l_file.put_line ("%T%T%Twindow.location = baseLocation + locationList[index];")
						l_file.put_line ("%T%T} else {")
						l_file.put_line ("%T%T%Talert (%"Class %" + className.toUpperCase () + %" does not exist in system%");")
						l_file.put_line ("%T%T}")
						l_file.put_line ("%T}")
						l_file.put_line ("// -->")
						l_file.close
					else
						report_cannot_write_error (l_filename)
					end
				end
			end
		end

	print_class_list_file (a_system: ET_SYSTEM; a_class_chart_mapping: DS_HASH_TABLE [STRING, ET_CLASS]; a_feature_mapping: DS_HASH_TABLE [STRING, ET_FEATURE])
			-- Print file "class_list.html".
		require
			a_system_not_void: a_system /= Void
			a_class_chart_mapping_not_void: a_class_chart_mapping /= Void
			a_feature_mapping_not_void: a_feature_mapping /= Void
		local
			l_file: KL_TEXT_OUTPUT_FILE
			l_filename: STRING
			l_root_path: STRING
			l_class: ET_CLASS
			l_line_splitter: ST_SPLITTER
			l_printer: ET_AST_HTML_WITH_ISE_STYLESHEET_PRETTY_PRINTER
		do
			if attached output_directory as l_output_directory then
				l_filename := file_system.pathname (l_output_directory, "class_list.html")
				if not is_file_overwritable (l_filename) then
					report_file_already_exists_error (l_filename)
				else
					create l_file.make (l_filename)
					l_file.recursive_open_write
					if l_file.is_open_write then
						create l_printer.make (l_file)
						l_printer.set_class_mapping (a_class_chart_mapping)
						l_printer.set_feature_mapping (a_feature_mapping)
						create l_line_splitter.make_with_separators ("%R%N")
						l_root_path := ""
						print_header (universe_name (a_system) + " class dictionary", Void, Void, "Eiffel system", l_root_path, l_file)
						l_file.put_string ("<pre>")
						print_navigation_bar (Void, False, True, True, False, False, False, l_root_path, l_file)
						l_file.put_line ("<SPAN CLASS=%"ekeyword%">Classes</SPAN>")
						across a_class_chart_mapping as l_mapping loop
							l_class := l_mapping.key
							l_printer.set_current_class (l_class)
							l_file.put_character ('%T')
							l_printer.print_class_header (l_class, True)
							l_file.put_new_line
							if attached class_description (l_class) as l_description then
								across l_line_splitter.split_greedy (l_description) as l_lines loop
									l_file.put_string ("%T%T%T")
									l_printer.print_comment_text ("-- " + l_lines.item)
								end
							end
							l_file.put_new_line
						end
						print_navigation_bar (Void, False, True, True, False, False, False, l_root_path, l_file)
						l_file.put_line ("</pre>")
						print_footer (l_file)
						l_printer.set_null_file
						l_file.close
					else
						report_cannot_write_error (l_filename)
					end
				end
			end
		end

	print_class_chart (a_class: ET_CLASS; a_parent_classes: DS_HASH_TABLE [DS_HASH_SET [ET_CLASS], ET_CLASS]; a_class_mapping: DS_HASH_TABLE [STRING, ET_CLASS]; a_feature_mapping: DS_HASH_TABLE [STRING, ET_FEATURE]; a_root_path: STRING)
			-- Print file "<class_name>_chart.html".
		require
			a_class_not_void: a_class /= Void
			a_parent_classes_not_void: a_parent_classes /= Void
			a_class_mapping_not_void: a_class_mapping /= Void
			a_feature_mapping_not_void: a_feature_mapping /= Void
			a_root_path_not_void: a_root_path /= Void
		local
			l_file: KL_TEXT_OUTPUT_FILE
			l_filename: STRING
			l_printer: ET_AST_HTML_WITH_ISE_STYLESHEET_PRETTY_PRINTER
			l_class_set: DS_HASH_SET [ET_CLASS]
			l_class_list: DS_ARRAYED_LIST [ET_CLASS]
			l_feature_list: DS_ARRAYED_LIST [ET_FEATURE]
			l_feature_name_set: DS_HASH_SET [ET_FEATURE_NAME]
			l_feature_name_list: DS_ARRAYED_LIST [ET_FEATURE_NAME]
			i, nb: INTEGER
			l_any: ET_CLASS
			l_line_splitter: ST_SPLITTER
		do
			l_filename := file_system.pathname (class_output_directory (a_class), a_class.lower_name + "_chart.html")
			create l_file.make (l_filename)
			l_file.recursive_open_write
			if l_file.is_open_write then
				create l_printer.make (l_file)
				l_printer.reset
				l_printer.set_class_mapping (a_class_mapping)
				l_printer.set_feature_mapping (a_feature_mapping)
				l_printer.set_current_class (a_class)
					-- Header.
				print_header (a_class.lower_name + " Chart", a_class.first_indexing, a_class.second_indexing, "Eiffel class", a_root_path, l_file)
				l_file.put_string ("<pre>")
				print_navigation_bar (a_class.lower_name, True, True, True, False, True, True, a_root_path, l_file)
					-- Class name.
				if attached a_class.class_mark as l_class_mark then
					l_class_mark.process (l_printer)
					l_printer.print_character (' ')
				end
				tokens.class_keyword.process (l_printer)
				l_printer.print_new_line
				l_printer.indent
				l_printer.print_class_header (a_class, False)
				l_printer.dedent
				l_printer.print_new_line
				l_printer.print_new_line
					-- General.
				l_printer.print_start_span_class ({ET_AST_HTML_WITH_ISE_STYLESHEET_PRETTY_PRINTER}.css_ekeyword)
				l_printer.print_string (title_general)
				l_printer.print_end_span
				l_printer.print_new_line
				l_printer.indent
				l_printer.print_start_span_class ({ET_AST_HTML_WITH_ISE_STYLESHEET_PRETTY_PRINTER}.css_eitag)
				l_printer.print_string (tag_group)
				l_printer.print_end_span
				tokens.colon_symbol.process (l_printer)
				l_printer.print_character (' ')
				l_printer.print_start_span_class ({ET_AST_HTML_WITH_ISE_STYLESHEET_PRETTY_PRINTER}.css_nescluster)
				l_printer.print_string (universe_name (a_class.universe))
				l_printer.print_end_span
				if not ANY_.same_objects (a_class.universe, a_class.group) then
					l_printer.print_start_span_class ({ET_AST_HTML_WITH_ISE_STYLESHEET_PRETTY_PRINTER}.css_nescluster)
					l_printer.print_character ('/')
					l_printer.print_string (a_class.group.relative_lower_name (a_class.universe, '/'))
					l_printer.print_end_span
				end
				l_printer.print_new_line
				if attached class_description (a_class) as l_description then
					l_printer.print_start_span_class ({ET_AST_HTML_WITH_ISE_STYLESHEET_PRETTY_PRINTER}.css_eitag)
					l_printer.print_string (tag_description)
					l_printer.print_end_span
					tokens.colon_symbol.process (l_printer)
					if l_description.has ('%N') then
						l_printer.print_new_line
						l_printer.indent
						create l_line_splitter.make_with_separators ("%R%N")
						across l_line_splitter.split_greedy (l_description) as l_lines loop
							l_printer.print_start_span_class ({ET_AST_HTML_WITH_ISE_STYLESHEET_PRETTY_PRINTER}.css_estring)
							if l_lines.is_first then
								l_printer.print_character ('%"')
							end
							l_printer.print_string (l_lines.item)
							if l_lines.is_last then
								l_printer.print_character ('%"')
							end
							l_printer.print_end_span
							l_printer.print_new_line
						end
						l_printer.dedent
					else
						l_printer.print_character (' ')
						l_printer.print_start_span_class ({ET_AST_HTML_WITH_ISE_STYLESHEET_PRETTY_PRINTER}.css_estring)
						l_printer.print_character ('%"')
						l_printer.print_string (l_description)
						l_printer.print_character ('%"')
						l_printer.print_end_span
						l_printer.print_new_line
					end
				end
				l_feature_name_set := new_feature_name_set (20)
				l_any := a_class.current_system.any_type.base_class
				a_class.add_creations_exported_to (l_any, l_feature_name_set)
				nb := l_feature_name_set.count
				if nb > 0 then
					l_printer.print_start_span_class ({ET_AST_HTML_WITH_ISE_STYLESHEET_PRETTY_PRINTER}.css_eitag)
					l_printer.print_string (tag_create)
					l_printer.print_end_span
					tokens.colon_symbol.process (l_printer)
					l_printer.print_character (' ')
					l_feature_name_list := new_feature_name_list (nb)
					l_feature_name_list.extend_last (l_feature_name_set)
					l_feature_name_list.sort (feature_name_sorter)
					from i := 1 until i > nb loop
						if i /= 1 then
							tokens.comma_symbol.process (l_printer)
							l_printer.print_character (' ')
						end
						l_printer.print_feature_name_in_class (l_feature_name_list.item (i), a_class)
						i := i + 1
					end
					l_printer.print_new_line
				end
				l_printer.dedent
				l_printer.print_new_line
					-- Parents.
				a_parent_classes.search (a_class)
				if a_parent_classes.found then
					l_class_set := a_parent_classes.found_item
					nb := l_class_set.count
					if nb > 0 then
						l_printer.print_start_span_class ({ET_AST_HTML_WITH_ISE_STYLESHEET_PRETTY_PRINTER}.css_ekeyword)
						l_printer.print_string (title_parents)
						l_printer.print_end_span
						l_printer.print_new_line
						l_class_list := new_class_list (nb)
						l_class_list.extend_last (l_class_set)
						l_class_list.sort (class_sorter_by_name)
						l_printer.indent
						from i := 1 until i > nb loop
							l_printer.print_class_header (l_class_list.item (i), True)
							l_printer.print_new_line
							i := i + 1
						end
						l_printer.dedent
						l_printer.print_new_line
					end
				end
					-- Queries.
				l_feature_list := new_feature_list (a_class.queries.declared_count)
				a_class.queries.add_user_defined_features_exported_to (l_any, l_feature_list)
				nb := l_feature_list.count
				if nb > 0 then
					l_printer.print_start_span_class ({ET_AST_HTML_WITH_ISE_STYLESHEET_PRETTY_PRINTER}.css_ekeyword)
					l_printer.print_string (title_queries)
					l_printer.print_end_span
					l_printer.print_new_line
					l_feature_list.sort (feature_sorter_by_name)
					l_printer.indent
					from i := 1 until i > nb loop
						l_printer.print_feature_signature (l_feature_list.item (i))
						l_printer.print_new_line
						i := i + 1
					end
					l_printer.dedent
					l_printer.print_new_line
				end
					-- Commands.
				l_feature_list := new_feature_list (a_class.procedures.declared_count)
				a_class.procedures.add_user_defined_features_exported_to (l_any, l_feature_list)
				nb := l_feature_list.count
				if nb > 0 then
					l_printer.print_start_span_class ({ET_AST_HTML_WITH_ISE_STYLESHEET_PRETTY_PRINTER}.css_ekeyword)
					l_printer.print_string (title_commands)
					l_printer.print_end_span
					l_printer.print_new_line
					l_feature_list.sort (feature_sorter_by_name)
					l_printer.indent
					from i := 1 until i > nb loop
						l_printer.print_feature_signature (l_feature_list.item (i))
						l_printer.print_new_line
						i := i + 1
					end
					l_printer.dedent
					l_printer.print_new_line
				end
					-- Footer.
				print_navigation_bar (a_class.lower_name, True, True, True, False, True, True, a_root_path, l_file)
				l_file.put_line ("</pre>")
				print_footer (l_file)
				l_printer.set_null_file
				l_file.close
			else
				report_cannot_write_error (l_filename)
			end
		end

	print_class_links (a_class: ET_CLASS; a_parent_classes, a_heir_classes, a_client_classes, a_suppliers_classes: DS_HASH_TABLE [DS_HASH_SET [ET_CLASS], ET_CLASS]; a_class_mapping: DS_HASH_TABLE [STRING, ET_CLASS]; a_feature_mapping: DS_HASH_TABLE [STRING, ET_FEATURE]; a_root_path: STRING)
			-- Print file "<class_name>links.html".
		require
			a_class_not_void: a_class /= Void
			a_parent_classes_not_void: a_parent_classes /= Void
			a_heir_classes_not_void: a_heir_classes /= Void
			a_client_classes_not_void: a_client_classes /= Void
			a_suppliers_classes_not_void: a_suppliers_classes /= Void
			a_class_mapping_not_void: a_class_mapping /= Void
			a_feature_mapping_not_void: a_feature_mapping /= Void
			a_root_path_not_void: a_root_path /= Void
		local
			l_file: KL_TEXT_OUTPUT_FILE
			l_filename: STRING
			l_class_set: DS_HASH_SET [ET_CLASS]
			l_class_list: DS_ARRAYED_LIST [ET_CLASS]
			l_printer: ET_AST_HTML_WITH_ISE_STYLESHEET_PRETTY_PRINTER
			i, nb: INTEGER
		do
			l_filename := file_system.pathname (class_output_directory (a_class), a_class.lower_name + "_links.html")
			create l_file.make (l_filename)
			l_file.recursive_open_write
			if l_file.is_open_write then
				create l_printer.make (l_file)
				l_printer.reset
				l_printer.set_class_mapping (a_class_mapping)
				l_printer.set_feature_mapping (a_feature_mapping)
				l_printer.set_current_class (a_class)
					-- Header.
				print_header (a_class.lower_name + " Relations", a_class.first_indexing, a_class.second_indexing, "Eiffel class", a_root_path, l_file)
				l_file.put_string ("<pre>")
				print_navigation_bar (a_class.lower_name, True, True, True, True, False, True, a_root_path, l_file)
					-- Class name.
				if attached a_class.class_mark as l_class_mark then
					l_class_mark.process (l_printer)
					l_printer.print_character (' ')
				end
				tokens.class_keyword.process (l_printer)
				l_printer.print_new_line
				l_printer.indent
				l_printer.print_class_header (a_class, False)
				l_printer.dedent
				l_printer.print_new_line
				l_printer.print_new_line
					-- Parents.
				a_parent_classes.search (a_class)
				if a_parent_classes.found then
					l_class_set := a_parent_classes.found_item
					nb := l_class_set.count
					if nb > 0 then
						l_printer.print_start_span_class ({ET_AST_HTML_WITH_ISE_STYLESHEET_PRETTY_PRINTER}.css_ekeyword)
						l_printer.print_string (title_parents)
						l_printer.print_end_span
						l_printer.print_new_line
						l_class_list := new_class_list (nb)
						l_class_list.extend_last (l_class_set)
						l_class_list.sort (class_sorter_by_name)
						l_printer.indent
						from i := 1 until i > nb loop
							l_printer.print_class_header (l_class_list.item (i), True)
							l_printer.print_new_line
							i := i + 1
						end
						l_printer.dedent
						l_printer.print_new_line
					end
				end
					-- Heirs.
				a_heir_classes.search (a_class)
				if a_heir_classes.found then
					l_class_set := a_heir_classes.found_item
					nb := l_class_set.count
					if nb > 0 then
						l_printer.print_start_span_class ({ET_AST_HTML_WITH_ISE_STYLESHEET_PRETTY_PRINTER}.css_ekeyword)
						l_printer.print_string (title_heirs)
						l_printer.print_end_span
						l_printer.print_new_line
						l_class_list := new_class_list (nb)
						l_class_list.extend_last (l_class_set)
						l_class_list.sort (class_sorter_by_name)
						l_printer.indent
						from i := 1 until i > nb loop
							l_printer.print_class_header (l_class_list.item (i), True)
							l_printer.print_new_line
							i := i + 1
						end
						l_printer.dedent
						l_printer.print_new_line
					end
				end
					-- Clients.
				a_client_classes.search (a_class)
				if a_client_classes.found then
					l_class_set := a_client_classes.found_item
					nb := l_class_set.count
					if nb > 0 then
						l_printer.print_start_span_class ({ET_AST_HTML_WITH_ISE_STYLESHEET_PRETTY_PRINTER}.css_ekeyword)
						l_printer.print_string (title_clients)
						l_printer.print_end_span
						l_printer.print_new_line
						l_class_list := new_class_list (nb)
						l_class_list.extend_last (l_class_set)
						l_class_list.sort (class_sorter_by_name)
						l_printer.indent
						from i := 1 until i > nb loop
							l_printer.print_class_header (l_class_list.item (i), True)
							l_printer.print_new_line
							i := i + 1
						end
						l_printer.dedent
						l_printer.print_new_line
					end
				end
					-- Suppliers.
				a_suppliers_classes.search (a_class)
				if a_suppliers_classes.found then
					l_class_set := a_suppliers_classes.found_item
					nb := l_class_set.count
					if nb > 0 then
						l_printer.print_start_span_class ({ET_AST_HTML_WITH_ISE_STYLESHEET_PRETTY_PRINTER}.css_ekeyword)
						l_printer.print_string (title_suppliers)
						l_printer.print_end_span
						l_printer.print_new_line
						l_class_list := new_class_list (nb)
						l_class_list.extend_last (l_class_set)
						l_class_list.sort (class_sorter_by_name)
						l_printer.indent
						from i := 1 until i > nb loop
							l_printer.print_class_header (l_class_list.item (i), True)
							l_printer.print_new_line
							i := i + 1
						end
						l_printer.dedent
						l_printer.print_new_line
					end
				end
					-- Footer.
				print_navigation_bar (a_class.lower_name, True, True, True, True, False, True, a_root_path, l_file)
				l_file.put_line ("</pre>")
				print_footer (l_file)
				l_printer.set_null_file
				l_file.close
			else
				report_cannot_write_error (l_filename)
			end
		end

	print_class_text (a_class: ET_CLASS; a_class_mapping: DS_HASH_TABLE [STRING, ET_CLASS]; a_feature_mapping: DS_HASH_TABLE [STRING, ET_FEATURE]; a_root_path: STRING)
			-- Print file "<class_name>.html".
		require
			a_class_not_void: a_class /= Void
			a_class_mapping_not_void: a_class_mapping /= Void
			a_feature_mapping_not_void: a_feature_mapping /= Void
			a_root_path_not_void: a_root_path /= Void
		local
			l_file: KL_TEXT_OUTPUT_FILE
			l_filename: STRING
			l_printer: ET_AST_HTML_WITH_ISE_STYLESHEET_PRETTY_PRINTER
		do
			l_filename := file_system.pathname (class_output_directory (a_class), a_class.lower_name + ".html")
			create l_file.make (l_filename)
			l_file.recursive_open_write
			if l_file.is_open_write then
				create l_printer.make (l_file)
				l_printer.reset
				l_printer.set_class_mapping (a_class_mapping)
				l_printer.set_feature_mapping (a_feature_mapping)
				l_printer.set_current_class (a_class)
				print_header (a_class.lower_name + " Text", a_class.first_indexing, a_class.second_indexing, "Eiffel class", a_root_path, l_file)
				l_file.put_string ("<pre>")
				print_navigation_bar (a_class.lower_name, True, True, True, True, True, False, a_root_path, l_file)
				a_class.process (l_printer)
				print_navigation_bar (a_class.lower_name, True, True, True, True, True, False, a_root_path, l_file)
				l_file.put_line ("</pre>")
				print_footer (l_file)
				l_printer.set_null_file
				l_file.close
			else
				report_cannot_write_error (l_filename)
			end
		end

	print_header (a_title: STRING; a_first_indexing_clause, a_second_indexing_clause: detachable ET_INDEXING_LIST; a_keywords: STRING; a_root_path: STRING; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print HTML header to `a_file'.
		require
			a_title_not_void: a_title /= Void
			a_keywords_not_void: a_keywords /= Void
			a_root_path_not_void: a_root_path /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_line ("<HTML>")
			a_file.put_line ("<HEAD>")
			a_file.put_line ("<META NAME=%"generator%" CONTENT=%"Gobo Eiffel Doc%">")
			a_file.put_line ("<meta name=%"keywords%" content=%"" + a_keywords + "%"/>")
			a_file.put_line ("<TITLE>" + a_title + "</TITLE>")
			a_file.put_line ("<LINK REL=%"stylesheet%" HREF=%"" + a_root_path + "default.css%" TYPE=%"text/css%">")
			a_file.put_line ("<SCRIPT TYPE=%"text/javascript%" SRC=%"" + a_root_path + "goto.html%"></SCRIPT>")
			a_file.put_line ("</HEAD>")
			a_file.put_line ("<BODY>")
			a_file.put_line ("<P ALIGN=%"CENTER%">Automatic generation produced by Gobo Eiffel Doc</P>")
		end

	print_footer (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print HTML footer to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_line ("<P ALIGN=%"CENTER%"> &#045;&#045; Generated by Gobo Eiffel Doc&#045;&#045; ")
			a_file.put_line ("<BR>For more details: <A HREF=%"http://www.gobosoft.com%">www.gobosoft.com</A></P>")
			a_file.put_line ("</BODY>")
			a_file.put_line ("</HTML>")
		end

	print_navigation_bar (a_class_name: detachable STRING; a_class_list, a_cluster_list, a_cluster_hierarchy, a_class_chart, a_class_links, a_class_text: BOOLEAN; a_root_path: STRING; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print navigation bar to `a_file'.
		require
			a_root_path_not_void: a_root_path /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_line ("<FORM ONSUBMIT=%"go_to('" + a_root_path + "',this.c.value);return false;%">")
			a_file.put_line ("<TABLE CELLSPACING=%"5%" CELLPADDING=%"4%"><TR>")
			if a_class_list then
				a_file.put_line ("<TD CLASS=%"link1%"><A CLASS=%"link1%" HREF=%"" + a_root_path + "class_list.html%">Classes</A></TD>")
			else
				a_file.put_line ("<TD CLASS=%"nolink1%">Classes</TD>")
			end
			if a_cluster_list then
				a_file.put_line ("<TD CLASS=%"link1%"><A CLASS=%"link1%" HREF=%"" + a_root_path + "groups_list.html%">Groups</A></TD>")
			else
				a_file.put_line ("<TD CLASS=%"nolink1%">Groups</TD>")
			end
			if a_cluster_hierarchy then
				a_file.put_line ("<TD CLASS=%"link1%"><A CLASS=%"link1%" HREF=%"" + a_root_path + "group_hierarchy.html%">Group hierarchy</A></TD>")
			else
				a_file.put_line ("<TD CLASS=%"nolink1%">Group hierarchy</TD>")
			end
			if a_class_name /= Void then
				if a_class_chart then
					a_file.put_line ("<TD CLASS=%"link2%"><A CLASS=%"link2%" HREF=%"" + a_class_name + "_chart.html%">Chart</A></TD>")
				else
					a_file.put_line ("<TD CLASS=%"nolink2%">Chart</TD>")
				end
				if a_class_links then
					a_file.put_line ("<TD CLASS=%"link2%"><A CLASS=%"link2%" HREF=%"" + a_class_name + "_links.html%">Relations</A></TD>")
				else
					a_file.put_line ("<TD CLASS=%"nolink2%">Relations</TD>")
				end
				if a_class_text then
					a_file.put_line ("<TD CLASS=%"link2%"><A CLASS=%"link2%" HREF=%"" + a_class_name + ".html%">Text</A></TD>")
				else
					a_file.put_line ("<TD CLASS=%"nolink2%">Text</TD>")
				end
				a_file.put_line ("<TD CLASS=%"link2%">Go to: <INPUT NAME=%"c%" VALUE=%"" + a_class_name + "%"></TD>")
			else
				a_file.put_line ("<TD CLASS=%"link2%">Go to: <INPUT NAME=%"c%" VALUE=%"%"></TD>")
			end
			a_file.put_string ("</TR></TABLE></FORM>")
		end

feature {NONE} -- Mapping

	class_mapping (a_suffix: STRING; a_system: ET_SYSTEM; a_input_classes: like input_classes): DS_HASH_TABLE [STRING, ET_CLASS]
			-- Mapping between classes to be processed and the
			-- name of file for these classes (relative to
			-- `output_directory'), ordered by class names.
			-- `a_suffix' is a suffix to be added to the filename (e.g. "_chart").
			-- Use `a_input_classes' as input classes if not Void.
			-- Otherwise use all classes in `a_system'.
		require
			a_suffix_not_void: a_suffix /= Void
			a_system_not_void: a_system /= Void
		local
			l_input_classes: DS_ARRAYED_LIST [ET_CLASS]
			i, nb: INTEGER
			l_class: ET_CLASS
			l_filename: STRING
		do
			if a_input_classes /= Void then
				nb := a_input_classes.count
			else
				nb := a_system.class_count_recursive
			end
			l_input_classes := new_class_list (nb)
			if a_input_classes /= Void then
				l_input_classes.append_last (a_input_classes)
			else
				a_system.classes_do_unless_recursive (agent l_input_classes.force_last, agent {ET_CLASS}.is_none)
			end
			l_input_classes.sort (class_sorter_by_name)
			nb := l_input_classes.count
			create Result.make_map (nb)
			from i := 1 until i > nb loop
				l_class := l_input_classes.item (i)
				create l_filename.make (50)
				if library_prefix_flag then
					l_filename.append_string (universe_name (l_class.universe))
					l_filename.append_character ('/')
				end
				l_filename.append_string (l_class.lower_name)
				l_filename.append_string (a_suffix)
				l_filename.append_string (".html")
				Result.put_last (l_filename, l_class)
				i := i + 1
			end
		ensure
			class_chart_mapping_not_void: Result /= Void
		end

	feature_mapping (a_system: ET_SYSTEM; a_input_classes: like input_classes): DS_HASH_TABLE [STRING, ET_FEATURE]
			-- Mapping between features of classes to be processed and
			-- the name of file and location for these features (relative
			-- to `output_directory').
			-- Use `a_input_classes' as input classes if not Void.
			-- Otherwise use all classes in `a_system'.
		require
			a_system_not_void: a_system /= Void
		local
			l_input_classes: DS_ARRAYED_LIST [ET_CLASS]
			i, nb: INTEGER
			l_class: ET_CLASS
			l_filename: STRING
			l_features: ET_FEATURE_LIST
			l_feature: ET_FEATURE
			j, nb2: INTEGER
		do
			if a_input_classes /= Void then
				create l_input_classes.make_from_linear (a_input_classes)
			else
				create l_input_classes.make (a_system.class_count_recursive)
				a_system.classes_do_unless_recursive (agent l_input_classes.force_last, agent {ET_CLASS}.is_none)
			end
			nb := l_input_classes.count
			create Result.make_map (nb * 50)
			from i := 1 until i > nb loop
				l_class := l_input_classes.item (i)
				create l_filename.make (50)
				if library_prefix_flag then
					l_filename.append_string (universe_name (l_class.universe))
					l_filename.append_character ('/')
				end
				l_filename.append_string (l_class.lower_name)
				l_filename.append_string (".html#f_")
				l_features := l_class.queries
				nb2 := l_features.declared_count
				from j := 1 until j > nb2 loop
					l_feature := l_features.item (j)
					Result.force_last (l_filename + l_feature.lower_name, l_feature)
					j := j + 1
				end
				l_features := l_class.procedures
				nb2 := l_features.declared_count
				from j := 1 until j > nb2 loop
					l_feature := l_features.item (j)
					Result.force_last (l_filename + l_feature.lower_name, l_feature)
					j := j + 1
				end
				i := i + 1
			end
		ensure
			feature_mapping_not_void: Result /= Void
		end

feature {NONE} -- Relations

	build_class_relations (a_class: ET_CLASS; a_parent_classes, a_heir_classes, a_client_classes, a_suppliers_classes: DS_HASH_TABLE [DS_HASH_SET [ET_CLASS], ET_CLASS])
			-- Build relations of `a_class' and make the result available in
			-- `a_parent_classes', `a_heir_classes', `a_client_classes' and
			-- `a_suppliers_classes'.
		require
			a_class_not_void: a_class /= Void
			a_parent_classes_not_void: a_parent_classes /= Void
			a_heir_classes_not_void: a_heir_classes /= Void
			a_client_classes_not_void: a_client_classes /= Void
			a_suppliers_classes_not_void: a_suppliers_classes /= Void
		local
			l_class_set: DS_HASH_SET [ET_CLASS]
			l_any: ET_CLASS
		do
			l_any := a_class.current_system.any_type.base_class
			create l_class_set.make (20)
			a_class.add_base_class_of_parents_exported_to (l_any, l_class_set)
			a_parent_classes.force_last (l_class_set, a_class)
			l_class_set.do_all (agent add_class_relation (?, a_class, a_heir_classes))
			if attached a_class.supplier_classes as l_supplier_classes and then not l_supplier_classes.is_empty then
				a_suppliers_classes.force_last (l_supplier_classes, a_class)
				l_supplier_classes.do_all (agent add_class_relation (?, a_class, a_client_classes))
			end
		end

	add_class_relation (a_class, a_other_class: ET_CLASS; a_class_relations: DS_HASH_TABLE [DS_HASH_SET [ET_CLASS], ET_CLASS])
			-- Add `a_other_class' to the set of classes associated with `a_class' in `a_class_relations'.
		require
			a_class_not_void: a_class /= Void
			a_other_class_not_void: a_other_class /= Void
			a_class_relations_not_void: a_class_relations /= Void
		local
			l_class_set: DS_HASH_SET [ET_CLASS]
		do
			a_class_relations.search (a_class)
			if a_class_relations.found then
				l_class_set := a_class_relations.found_item
			else
				create l_class_set.make (20)
				a_class_relations.force_last (l_class_set, a_class)
			end
			l_class_set.force_last (a_other_class)
		end

feature {NONE} -- Indexing clause

	class_description (a_class: ET_CLASS): detachable STRING
			-- Description of `a_class'
		require
			a_class_not_void: a_class /= Void
		local
			i, nb: INTEGER
			l_indexing_item: ET_INDEXING
			l_indexing_item_terms: ET_INDEXING_TERM_LIST
		do
			if attached a_class.first_indexing as l_indexing then
				nb := l_indexing.count
				from i := 1 until i > nb loop
					l_indexing_item := l_indexing.item (i).indexing_clause
					if attached l_indexing_item.tag as l_tag and then STRING_.same_string (l_tag.identifier.lower_name, tag_description) then
						l_indexing_item_terms := l_indexing_item.terms
						Result := indexing_field_value_from_terms (l_indexing_item_terms)
							-- Jump out of the loop.
						i := nb + 1
					end
					i := i + 1
				end
			end
		end

	indexing_field_value_from_terms (a_indexing_terms: ET_INDEXING_TERM_LIST): STRING
			-- Indexing field value corresponding to `a_indexing_terms'
		require
			a_indexing_terms_not_void: a_indexing_terms /= Void
		local
			l_indexing_term: ET_INDEXING_TERM_ITEM
			i, l_terms_count: INTEGER
			l_sign: ET_SYMBOL_OPERATOR
			l_value: STRING
		do
			l_terms_count := a_indexing_terms.count
			create Result.make (l_terms_count * default_field_value_capacity)
			from i := 1 until i > l_terms_count loop
				if i /= 1 then
					Result.append_string (", ")
				end
				l_indexing_term := a_indexing_terms.item (i).indexing_term
				if attached {ET_MANIFEST_STRING} l_indexing_term as l_manifest_string then
					l_value := left_aligned_string (l_manifest_string.value)
					Result.append_string (l_value)
				elseif attached {ET_IDENTIFIER} l_indexing_term as l_identifier then
					Result.append_string (l_identifier.name)
				elseif attached {ET_C1_CHARACTER_CONSTANT} l_indexing_term as l_character_1 then
					Result.append_character ('%'')
					Result.append_character (l_character_1.literal)
					Result.append_character ('%'')
				elseif attached {ET_C2_CHARACTER_CONSTANT} l_indexing_term as l_character_2 then
					Result.append_character ('%'')
					Result.append_character ('%%')
					Result.append_character (l_character_2.literal)
					Result.append_character ('%'')
				elseif attached {ET_C3_CHARACTER_CONSTANT} l_indexing_term as l_character_3 then
					Result.append_character ('%'')
					Result.append_character ('%%')
					Result.append_character ('/')
					Result.append_string (l_character_3.literal)
					Result.append_character ('/')
					Result.append_character ('%'')
				elseif attached {ET_INTEGER_CONSTANT} l_indexing_term as l_integer then
					l_sign := l_integer.sign
					if l_sign /= Void then
						if l_sign.is_minus then
							Result.append_character ('-')
						elseif l_sign.is_plus then
							Result.append_character ('+')
						end
					end
					Result.append_string (l_integer.literal)
				elseif attached {ET_REAL_CONSTANT} l_indexing_term as l_real then
					l_sign := l_real.sign
					if l_sign /= Void then
						if l_sign.is_minus then
							Result.append_character ('-')
						elseif l_sign.is_plus then
							Result.append_character ('+')
						end
					end
					Result.append_string (l_real.literal)
				elseif attached {ET_BOOLEAN_CONSTANT} l_indexing_term as l_boolean then
					Result.append_string (l_boolean.text)
				end
				i := i + 1
			end
		ensure
			indexing_field_value_not_void: Result /= Void
		end

	default_field_value_capacity: INTEGER = 15
			-- Default field value capacity

	left_aligned_string (a_string: STRING): STRING
			-- If all non-empty lines of `a_string' start with the same sequence
			-- of white characters, then remove them.
			-- Otherwise return `a_string'.
		require
			a_string_not_void: a_string /= Void
		local
			l_longest_break_prefix: INTEGER
			l_nb_lines: INTEGER
			c: CHARACTER
			i, j, nb: INTEGER
			l_stop: BOOLEAN
		do
			if a_string.is_empty then
				Result := a_string
			else
				nb := a_string.count
				l_longest_break_prefix := -1
				from i := 1 until i > nb loop
					c := a_string.item (i)
					if c = '%N' and j = 1 then
						-- Skip empty lines.
					elseif c = ' ' or c = '%T' then
						if l_longest_break_prefix /= -1 then
								-- Break prefix of second and subsequent lines.
							if j <= l_longest_break_prefix and then c = a_string.item (j) then
									-- Same character as in longest break prefix.
								j := j + 1
							else
									-- Reduce size of longest break prefix.
								l_longest_break_prefix := j - 1
									-- Skip the rest of the line.
								from
								until
									i > nb or else a_string.item (i) = '%N'
								loop
									i := i + 1
								end
								l_nb_lines := l_nb_lines + 1
								j := 1
							end
						end
					else
						if l_longest_break_prefix = -1 then
								-- Break prefix of first line.
							l_longest_break_prefix := i - 1
						else
								-- Reduce size of longest break prefix.
							l_longest_break_prefix := j - 1
						end
							-- Skip the rest of the line.
						from
						until
							i > nb or else a_string.item (i) = '%N'
						loop
							i := i + 1
						end
						l_nb_lines := l_nb_lines + 1
						j := 1
					end
					i := i + 1
				end
				if l_longest_break_prefix > 0 then
					create Result.make (nb - l_nb_lines * l_longest_break_prefix)
					from i := 1 until i > nb loop
						from
								-- Skip the longest break prefix.
							if i > nb or else a_string.item (i) /= '%N' then
								i := i + l_longest_break_prefix
							end
							l_stop := False
						until
							l_stop or i > nb
						loop
							c := a_string.item (i)
							Result.append_character (c)
							if c = '%N' then
								l_stop := True
							end
							i := i + 1
						end
					end
				else
					Result := a_string
				end
			end
		ensure
			left_aligned_string_not_void: Result /= Void
		end

feature {NONE} -- Implementation

	tag_create: STRING = "create"
			-- Tag "create"

	tag_description: STRING = "description"
			-- Tag "description"

	tag_group: STRING = "group"
			-- Tag "group"

	title_clients: STRING = "Clients"
			-- Title "Clients"

	title_commands: STRING = "Commands"
			-- Title "Commands"

	title_general: STRING = "General"
			-- Title "General"

	title_heirs: STRING = "Heirs"
			-- Title "Heirs"

	title_parents: STRING = "Parents"
			-- Title "Parents"

	title_queries: STRING = "Queries"
			-- Title "Queries"

	title_suppliers: STRING = "Suppliers"
			-- Title "Suppliers"

	new_class_list (nb: INTEGER): DS_ARRAYED_LIST [ET_CLASS]
			-- Empty list of classes which can contain at least `nb' classes
		require
			nb_not_negative: nb >= 0
		do
			if attached cached_class_list as l_class_list then
				Result := l_class_list
				Result.wipe_out
				if Result.capacity < nb then
					Result.resize (nb)
				end
			else
				create Result.make (nb)
				cached_class_list := Result
			end
		ensure
			new_class_list_not_void: Result /= Void
			empty: Result.is_empty
			capacity: Result.capacity >= nb
		end

	new_class_set (nb: INTEGER): DS_HASH_SET [ET_CLASS]
			-- Empty set of classes which can contain at least `nb' classes
		require
			nb_not_negative: nb >= 0
		do
			if attached cached_class_set as l_class_set then
				Result := l_class_set
				Result.wipe_out
				if Result.capacity < nb then
					Result.resize (nb)
				end
			else
				create Result.make (nb)
				cached_class_set := Result
			end
		ensure
			new_class_set_not_void: Result /= Void
			empty: Result.is_empty
			capacity: Result.capacity >= nb
		end

	new_feature_list (nb: INTEGER): DS_ARRAYED_LIST [ET_FEATURE]
			-- Empty list of features which can contain at least `nb' features
		require
			nb_not_negative: nb >= 0
		do
			if attached cached_feature_list as l_feature_list then
				Result := l_feature_list
				Result.wipe_out
				if Result.capacity < nb then
					Result.resize (nb)
				end
			else
				create Result.make (nb)
				cached_feature_list := Result
			end
		ensure
			new_feature_list_not_void: Result /= Void
			empty: Result.is_empty
			capacity: Result.capacity >= nb
		end

	new_feature_name_list (nb: INTEGER): DS_ARRAYED_LIST [ET_FEATURE_NAME]
			-- Empty list of feature names which can contain at least `nb' names
		require
			nb_not_negative: nb >= 0
		do
			if attached cached_feature_name_list as l_feature_name_list then
				Result := l_feature_name_list
				Result.wipe_out
				if Result.capacity < nb then
					Result.resize (nb)
				end
			else
				create Result.make (nb)
				cached_feature_name_list := Result
			end
		ensure
			new_feature_name_list_not_void: Result /= Void
			empty: Result.is_empty
			capacity: Result.capacity >= nb
		end

	new_feature_name_set (nb: INTEGER): DS_HASH_SET [ET_FEATURE_NAME]
			-- Empty set of feature names which can contain at least `nb' names
		require
			nb_not_negative: nb >= 0
		do
			if attached cached_feature_name_set as l_feature_name_set then
				Result := l_feature_name_set
				Result.wipe_out
				if Result.capacity < nb then
					Result.resize (nb)
				end
			else
				create Result.make (nb)
				Result.set_equality_tester (feature_name_tester)
				cached_feature_name_set := Result
			end
		ensure
			new_feature_name_set_not_void: Result /= Void
			empty: Result.is_empty
			capacity: Result.capacity >= nb
		end

	cached_class_list: detachable DS_ARRAYED_LIST [ET_CLASS]
			-- Cached list of classes

	cached_class_set: detachable DS_HASH_SET [ET_CLASS]
			-- Cached set of classes

	cached_feature_list: detachable DS_ARRAYED_LIST [ET_FEATURE]
			-- Cached list of features

	cached_feature_name_list: detachable DS_ARRAYED_LIST [ET_FEATURE_NAME]
			-- Cached list of feature names

	cached_feature_name_set: detachable DS_HASH_SET [ET_FEATURE_NAME]
			-- Cached set of feature names

feature {NONE} -- Constants

	css_file_content: STRING = "[
BODY {
	BACKGROUND-COLOR: white;
}

A {
    TEXT-DECORATION: none;
}

A:hover {
    TEXT-DECORATION: underline;
}

.eclass {
    COLOR: blue;
    FONT-STYLE: italic;
}

.neclass {
    COLOR: black;
    FONT-STYLE: italic;
}

.ekeyword {
    COLOR: navy;
    FONT-WEIGHT: bold;
}

.esymbol {
    COLOR: navy;
}

.eitag {
    COLOR: sienna;
    FONT: 91% "Courier New", serif;
}

.estring {
    COLOR: indigo;
    FONT: 91% "Courier New", serif;
}

.echar {
    COLOR: indigo;
    FONT-WEIGHT: bold;
}

.enumber {
    COLOR: indigo;
    FONT-WEIGHT: bold;
}

.etag {
    COLOR: sienna;
}

.efeature {
    COLOR: darkgreen;
    FONT-STYLE: italic;
}

.nefeature {
    COLOR: black;
    FONT-STYLE: italic;
}

.ecomment {
    COLOR: red;
    FONT: 80% "Courier New", serif;
}

.elocal, .equoted {
    COLOR: darkred;
    FONT-STYLE: italic;
}

.ereserved {
    COLOR: darkgreen;
    FONT-STYLE: italic;
    FONT-WEIGHT: bold;
}

.egeneric {
    FONT-STYLE: italic;
	COLOR: dodgerblue;
}

.ecluster {
    COLOR: maroon;
    FONT-VARIANT: small-caps;
    FONT-WEIGHT: bold;
}

.necluster {
    COLOR: black;
    FONT-VARIANT: small-caps;
    FONT-WEIGHT: bold;
}

.link1 {
	BACKGROUND-COLOR: #006633;
	COLOR: white;
}

.link2 {
	BACKGROUND-COLOR: #330066;
	COLOR: white;
}

.nolink1, .nolink2 {
	BACKGROUND-COLOR: #FFCC00;
	COLOR: #330066;
}
]"
			-- Content of css file

end
