note

	description:

	"[
		Gobo Eiffel Documentation HTML Format with ISE stylesheet
		which mimics the output of ISE EiffelStudio filter:
		
			ec -filter html-stylesheet -all -config project.ecf
	]"

	copyright: "Copyright (c) 2017-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEDOC_HTML_ISE_STYLESHEET_FORMAT

inherit

	GEDOC_FORMAT
		redefine
			make,
			output_directory,
			is_output_directory_required,
			class_output_directory,
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

create {GEDOC_HTML_ISE_STYLESHEET_FORMAT}

	make_from_format

feature {NONE} -- Initialization

	make (a_input_filename: STRING; a_system_processor: like system_processor)
			-- Create a new documentation format with `a_input_filename'.
		do
			precursor (a_input_filename, a_system_processor)
			output_directory := "."
			create html_printer.make_null (a_system_processor)
			create line_splitter.make_with_separators ("%R%N")
		end

feature -- Access

	output_directory: STRING
			-- Directory for the generated files.

feature -- Status report

	is_output_directory_required: BOOLEAN
			-- Is `output_directory' required by the current format?
		do
			Result := True
		end

feature {NONE} -- Processing

	prepare_system (a_system: ET_SYSTEM)
			-- Prepare `a_system' before being processed.
		do
			system_processor.set_suppliers_enabled (True)
			precursor (a_system)
		end

	process_system (a_system: ET_SYSTEM)
			-- Process `input_classes' from `a_system'.
		local
			l_all_classes: DS_ARRAYED_LIST [ET_CLASS]
			l_input_classes: like input_classes
			l_universe_mapping: DS_HASH_TABLE [STRING, ET_UNIVERSE]
			l_class_mapping: DS_HASH_TABLE [STRING, ET_CLASS]
			l_class_chart_mapping: DS_HASH_TABLE [STRING, ET_CLASS]
			l_class_links_mapping: DS_HASH_TABLE [STRING, ET_CLASS]
			l_feature_mapping: DS_HASH_TABLE [STRING, ET_FEATURE]
			l_parent_classes: DS_HASH_TABLE [DS_HASH_SET [ET_CLASS], ET_CLASS]
			l_heir_classes: DS_HASH_TABLE [DS_HASH_SET [ET_CLASS], ET_CLASS]
			l_client_classes: DS_HASH_TABLE [DS_HASH_SET [ET_CLASS], ET_CLASS]
			l_suppliers_classes: DS_HASH_TABLE [DS_HASH_SET [ET_CLASS], ET_CLASS]
			l_formats: DS_ARRAYED_LIST [like Current]
			nb: INTEGER
			l_root_path: STRING
			dt1: detachable DT_DATE_TIME
		do
			create l_all_classes.make (a_system.class_count_recursive)
			a_system.classes_do_recursive (agent l_all_classes.force_last)
			system_processor.compile_classes (l_all_classes)
			l_input_classes := input_classes
			l_input_classes.sort (class_sorter_by_name)
			dt1 := system_processor.benchmark_start_time
			l_root_path := ""
			print_css_file
			l_class_chart_mapping := class_mapping ("_chart", l_input_classes)
			print_goto_file (l_class_chart_mapping)
			l_feature_mapping := feature_mapping (l_input_classes)
			print_class_list_file (a_system, l_class_chart_mapping, l_feature_mapping, l_root_path)
			l_universe_mapping := universe_mapping (a_system)
			print_index_file (a_system, l_universe_mapping, l_class_chart_mapping, l_feature_mapping, l_root_path)
			print_group_list_file (a_system, l_universe_mapping, l_root_path)
			print_group_hierarchy_file (a_system, l_universe_mapping, l_root_path)
			if library_prefix_flag then
				l_root_path := "../"
			end
			l_universe_mapping.keys.do_all (agent print_universe_chart (?, l_class_chart_mapping, l_feature_mapping, l_root_path))
			system_processor.record_end_time (dt1, "Group Charts")
			nb := l_all_classes.count
			create l_parent_classes.make_map (nb)
			create l_heir_classes.make_map (nb)
			create l_client_classes.make_map (nb)
			create l_suppliers_classes.make_map (nb)
			l_all_classes.do_all (agent build_class_relations (?, l_parent_classes, l_heir_classes, l_client_classes, l_suppliers_classes))
			create l_formats.make (system_processor.processor_count)
			system_processor.do_all (agent add_format (?, l_formats))
			print_classes_chart (l_input_classes, l_formats, l_parent_classes, l_universe_mapping, l_class_chart_mapping, l_feature_mapping, l_root_path)
			l_class_links_mapping := class_mapping ("_links", l_input_classes)
			print_classes_links (l_input_classes, l_formats, l_parent_classes, l_heir_classes, l_client_classes, l_suppliers_classes, l_class_links_mapping, l_feature_mapping, l_root_path)
			l_class_mapping := class_mapping ("", l_input_classes)
			print_classes_text (l_input_classes, l_formats, l_class_mapping, l_feature_mapping, l_root_path)
			has_error := l_formats.there_exists (agent {like Current}.has_error)
		end

feature {NONE} -- Output

	print_css_file
			-- Print file "default.css".
		local
			l_file: like new_output_file
			l_filename: STRING
		do
			l_filename := filename (output_directory, filename_default_css)
			if not is_file_overwritable (l_filename) then
				report_file_already_exists_error (l_filename)
			else
				l_file := new_output_file (l_filename)
				l_file.recursive_open_write
				if l_file.is_open_write then
					l_file.put_string ({ET_ISE_STYLESHEET_CONSTANTS}.css_file_content)
					l_file.close
				end
			end
		end

	print_goto_file (a_class_chart_mapping: DS_HASH_TABLE [STRING, ET_CLASS])
			-- Print file "goto.js".
		require
			a_class_chart_mapping_not_void: a_class_chart_mapping /= Void
		local
			l_file: like new_output_file
			l_filename: STRING
		do
			l_filename := filename (output_directory, filename_goto)
			if not is_file_overwritable (l_filename) then
				report_file_already_exists_error (l_filename)
			else
				l_file := new_output_file (l_filename)
				l_file.recursive_open_write
				if l_file.is_open_write then
					l_file.put_line ("classList = new Array (")
					across a_class_chart_mapping as i_mapping loop
						l_file.put_string ("%T%"")
						l_file.put_string (@i_mapping.key.upper_name)
						l_file.put_character ('%"')
						if not @i_mapping.is_last then
							l_file.put_character (',')
						end
						l_file.put_new_line
					end
					l_file.put_line (");")
					l_file.put_new_line
					l_file.put_line ("locationList = new Array (")
					across a_class_chart_mapping as i_mapping loop
						l_file.put_string ("%T%"")
						l_file.put_string (i_mapping)
						l_file.put_character ('%"')
						if not @i_mapping.is_last then
							l_file.put_character (',')
						end
						l_file.put_new_line
					end
					l_file.put_line (");")
					l_file.put_new_line
					l_file.put_line ("function indexOfClass (name) {")
					l_file.put_line ("%Tfor (i = 0; i < classList.length; i++) {")
					l_file.put_line ("%T%Tif (name == classList[i]) return i;")
					l_file.put_line ("%T}")
					l_file.put_line ("%Treturn -1;")
					l_file.put_line ("};")
					l_file.put_new_line
					l_file.put_line ("function go_to (baseLocation, className) {")
					l_file.put_line ("%Tvar index = indexOfClass (className.toUpperCase ());")
					l_file.put_line ("%Tif (index >= 0) {")
					l_file.put_line ("%T%Twindow.location = baseLocation + locationList[index];")
					l_file.put_line ("%T} else {")
					l_file.put_line ("%T%Talert (%"Class %" + className.toUpperCase () + %" does not exist in system%");")
					l_file.put_line ("%T}")
					l_file.put_line ("}")
					l_file.close
				else
					report_cannot_write_error (l_filename)
				end
			end
		end

	print_index_file (a_system: ET_SYSTEM; a_universe_mapping: DS_HASH_TABLE [STRING, ET_UNIVERSE]; a_class_mapping: DS_HASH_TABLE [STRING, ET_CLASS]; a_feature_mapping: DS_HASH_TABLE [STRING, ET_FEATURE]; a_root_path: STRING)
			-- Print file "index.html".
		require
			a_system_not_void: a_system /= Void
			a_universe_mapping_not_void: a_universe_mapping /= Void
			a_class_mapping_not_void: a_class_mapping /= Void
			a_feature_mapping_not_void: a_feature_mapping /= Void
			a_root_path_not_void: a_root_path /= Void
		local
			l_file: like new_output_file
			l_filename: STRING
			l_title: STRING
			l_printer: ET_AST_HTML_ISE_STYLESHEET_PRINTER
			l_root_type: ET_BASE_TYPE
		do
			l_filename := filename (output_directory, filename_index)
			if not is_file_overwritable (l_filename) then
				report_file_already_exists_error (l_filename)
			else
				l_file := new_output_file (l_filename)
				l_file.recursive_open_write
				if l_file.is_open_write then
					l_printer := html_printer
					l_printer.reset
					l_printer.set_file (l_file)
					l_printer.set_class_mapping (a_class_mapping)
					l_printer.set_feature_mapping (a_feature_mapping)
					l_printer.set_root_path (a_root_path)
					l_printer.set_bom_enabled (False)
					l_printer.print_bom
					l_title := concat (universe_lower_name (a_system), titla_suffix_documentation)
					print_header (l_title, keyword_eiffel_system, a_root_path, l_file)
					l_file.put_string (html_start_pre)
					print_navigation_bar (Void, True, True, True, False, False, False, a_root_path, l_file)
						-- General.
					l_printer.print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_ekeyword)
					l_printer.print_string (title_system)
					l_printer.print_end_span
					l_printer.print_new_line
					l_printer.indent
					l_printer.print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_eitag)
					l_printer.print_string (tag_name)
					l_printer.print_end_span
					tokens.colon_symbol.process (l_printer)
					l_printer.print_character (' ')
					l_printer.print_string (a_system.lower_name)
					l_printer.print_new_line
					l_printer.dedent
					l_printer.print_new_line
						-- Root class.
					l_printer.print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_ekeyword)
					l_printer.print_string (title_root_class)
					l_printer.print_end_span
					l_printer.print_new_line
					l_printer.indent
					l_root_type := a_system.root_type
					if l_root_type = Void then
						l_root_type := a_system.any_type
					end
					l_printer.print_class_header (l_root_type.base_class, False)
					l_printer.print_new_line
					l_printer.dedent
					l_printer.print_new_line
						-- Groups.
					l_printer.print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_ekeyword)
					l_printer.print_string (title_groups)
					l_printer.print_end_span
					l_printer.print_new_line
					l_printer.indent
					across a_universe_mapping as i_mapping loop
						l_printer.print_start_a_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_ecluster, i_mapping)
						l_printer.print_string (universe_lower_name (@i_mapping.key))
						l_printer.print_end_a
						l_printer.print_new_line
					end
					l_printer.dedent
					l_printer.print_new_line
					print_navigation_bar (Void, True, True, True, False, False, False, a_root_path, l_file)
					l_file.put_line (html_end_pre)
					print_footer (l_file)
					l_printer.set_null_file
					l_printer.reset
					l_file.close
				else
					report_cannot_write_error (l_filename)
				end
			end
		end

	print_class_list_file (a_system: ET_SYSTEM; a_class_mapping: DS_HASH_TABLE [STRING, ET_CLASS]; a_feature_mapping: DS_HASH_TABLE [STRING, ET_FEATURE]; a_root_path: STRING)
			-- Print file "class_list.html".
		require
			a_system_not_void: a_system /= Void
			a_class_mapping_not_void: a_class_mapping /= Void
			a_feature_mapping_not_void: a_feature_mapping /= Void
			a_root_path_not_void: a_root_path /= Void
		local
			l_file: like new_output_file
			l_filename: STRING
			l_title: STRING
			l_class: ET_CLASS
			l_line_splitter: ST_SPLITTER
			l_printer: ET_AST_HTML_ISE_STYLESHEET_PRINTER
		do
			l_filename := filename (output_directory, filename_class_list)
			if not is_file_overwritable (l_filename) then
				report_file_already_exists_error (l_filename)
			else
				l_file := new_output_file (l_filename)
				l_file.recursive_open_write
				if l_file.is_open_write then
					l_printer := html_printer
					l_printer.reset
					l_printer.set_file (l_file)
					l_printer.set_class_mapping (a_class_mapping)
					l_printer.set_feature_mapping (a_feature_mapping)
					l_printer.set_root_path (a_root_path)
					l_printer.set_bom_enabled (False)
					l_printer.print_bom
					l_line_splitter := line_splitter
					l_title := concat (universe_lower_name (a_system), title_suffix_class_dictionary)
					print_header (l_title, keyword_eiffel_system, a_root_path, l_file)
					l_file.put_string (html_start_pre)
					print_navigation_bar (Void, False, True, True, False, False, False, a_root_path, l_file)
					l_printer.print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_ekeyword)
					l_printer.print_string (title_classes)
					l_printer.print_end_span
					l_printer.print_new_line
					l_printer.indent
					across a_class_mapping as i_mapping loop
						l_class := @i_mapping.key
						l_printer.set_current_class (l_class)
						l_printer.print_class_header (l_class, True)
						l_printer.print_new_line
						if attached class_description (l_class) as l_description then
							l_printer.indent
							l_printer.indent
							across l_line_splitter.split_greedy (l_description) as i_line loop
								l_printer.print_indentation
								l_printer.print_comment_text ("-- " + i_line)
								l_printer.print_new_line
							end
							l_printer.dedent
							l_printer.dedent
						end
						l_printer.print_new_line
					end
					l_printer.dedent
					print_navigation_bar (Void, False, True, True, False, False, False, a_root_path, l_file)
					l_file.put_line (html_end_pre)
					print_footer (l_file)
					l_printer.set_null_file
					l_printer.reset
					l_file.close
				else
					report_cannot_write_error (l_filename)
				end
			end
		end

	print_group_list_file (a_system: ET_SYSTEM; a_universe_mapping: DS_HASH_TABLE [STRING, ET_UNIVERSE]; a_root_path: STRING)
			-- Print file "group_list.html".
		require
			a_system_not_void: a_system /= Void
			a_universe_mapping_not_void: a_universe_mapping /= Void
			a_root_path_not_void: a_root_path /= Void
		local
			l_file: like new_output_file
			l_filename: STRING
			l_title: STRING
			l_printer: ET_AST_HTML_ISE_STYLESHEET_PRINTER
		do
			l_filename := filename (output_directory, filename_group_list)
			if not is_file_overwritable (l_filename) then
				report_file_already_exists_error (l_filename)
			else
				l_file := new_output_file (l_filename)
				l_file.recursive_open_write
				if l_file.is_open_write then
					l_printer := html_printer
					l_printer.reset
					l_printer.set_file (l_file)
					l_printer.set_root_path (a_root_path)
					l_printer.set_bom_enabled (False)
					l_printer.print_bom
					l_title := concat (universe_lower_name (a_system), title_suffix_alphabetical_group_list)
					print_header (l_title, keyword_eiffel_system, a_root_path, l_file)
					l_file.put_string (html_start_pre)
					print_navigation_bar (Void, True, False, True, False, False, False, a_root_path, l_file)
					l_printer.print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_ekeyword)
					l_printer.print_string (title_groups)
					l_printer.print_end_span
					l_printer.print_new_line
					l_printer.indent
					across a_universe_mapping as i_mapping loop
						l_printer.print_start_a_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_ecluster, i_mapping)
						l_printer.print_string (universe_lower_name (@i_mapping.key))
						l_printer.print_end_a
						l_printer.print_new_line
					end
					l_printer.dedent
					l_printer.print_new_line
					print_navigation_bar (Void, True, False, True, False, False, False, a_root_path, l_file)
					l_file.put_line (html_end_pre)
					print_footer (l_file)
					l_printer.set_null_file
					l_printer.reset
					l_file.close
				else
					report_cannot_write_error (l_filename)
				end
			end
		end

	print_group_hierarchy_file (a_system: ET_SYSTEM; a_universe_mapping: DS_HASH_TABLE [STRING, ET_UNIVERSE]; a_root_path: STRING)
			-- Print file "group_hierarchy.html".
		require
			a_system_not_void: a_system /= Void
			a_universe_mapping_not_void: a_universe_mapping /= Void
			a_root_path_not_void: a_root_path /= Void
		local
			l_file: like new_output_file
			l_filename: STRING
			l_title: STRING
			l_printer: ET_AST_HTML_ISE_STYLESHEET_PRINTER
		do
			l_filename := filename (output_directory, filename_group_hierarchy)
			if not is_file_overwritable (l_filename) then
				report_file_already_exists_error (l_filename)
			else
				l_file := new_output_file (l_filename)
				l_file.recursive_open_write
				if l_file.is_open_write then
					l_printer := html_printer
					l_printer.reset
					l_printer.set_file (l_file)
					l_printer.set_root_path (a_root_path)
					l_printer.set_bom_enabled (False)
					l_printer.print_bom
					l_title := concat (universe_lower_name (a_system), title_suffix_group_hierarchy)
					print_header (l_title, keyword_eiffel_system, a_root_path, l_file)
					l_file.put_string (html_start_pre)
					print_navigation_bar (Void, True, True, False, False, False, False, a_root_path, l_file)
					l_printer.print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_ekeyword)
					l_printer.print_string (title_groups)
					l_printer.print_end_span
					l_printer.print_new_line
					l_printer.indent
					across a_universe_mapping as i_mapping loop
						l_printer.print_start_a_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_ecluster, i_mapping)
						l_printer.print_string (universe_lower_name (@i_mapping.key))
						l_printer.print_end_a
						l_printer.print_new_line
						if attached {ET_INTERNAL_UNIVERSE} @i_mapping.key as l_internal_universe then
							l_printer.indent
							l_printer.print_cluster_names_recursive (l_internal_universe.clusters)
							l_printer.dedent
						end
					end
					l_printer.dedent
					l_printer.print_new_line
					print_navigation_bar (Void, True, True, False, False, False, False, a_root_path, l_file)
					l_file.put_line (html_end_pre)
					print_footer (l_file)
					l_printer.set_null_file
					l_printer.reset
					l_file.close
				else
					report_cannot_write_error (l_filename)
				end
			end
		end

	print_universe_chart (a_universe: ET_UNIVERSE; a_class_mapping: DS_HASH_TABLE [STRING, ET_CLASS]; a_feature_mapping: DS_HASH_TABLE [STRING, ET_FEATURE]; a_root_path: STRING)
			-- Print file "<universe_name>/index.html".
		require
			a_universe_not_void: a_universe /= Void
			a_class_mapping_not_void: a_class_mapping /= Void
			a_feature_mapping_not_void: a_feature_mapping /= Void
			a_root_path_not_void: a_root_path /= Void
		local
			l_file: like new_output_file
			l_filename: STRING
			l_printer: ET_AST_HTML_ISE_STYLESHEET_PRINTER
			l_universe_name: STRING
			l_base_name: STRING
			l_class: ET_CLASS
		do
			l_universe_name := universe_lower_name (a_universe)
			if library_prefix_flag then
				l_base_name := filename_index
				l_filename := file_system.pathname (output_directory, l_universe_name)
				l_filename := file_system.pathname (l_filename, l_base_name)
			else
				l_base_name := l_universe_name + filename_suffix_index
				l_filename := file_system.pathname (output_directory, l_base_name)
			end
			if not is_file_overwritable (l_filename) then
				report_file_already_exists_error (l_filename)
			else
				l_file := new_output_file (l_filename)
				l_file.recursive_open_write
				if l_file.is_open_write then
					l_printer := html_printer
					l_printer.reset
					l_printer.set_file (l_file)
					l_printer.set_class_mapping (a_class_mapping)
					l_printer.set_feature_mapping (a_feature_mapping)
					l_printer.set_root_path (a_root_path)
					l_printer.set_bom_enabled (False)
					l_printer.print_bom
						-- Header.
					print_header (a_universe.kind_capitalized_name + " " + l_universe_name, keyword_eiffel_group, a_root_path, l_file)
					l_file.put_string (html_start_pre)
					print_navigation_bar (Void, True, True, False, False, False, False, a_root_path, l_file)
						-- Universe name.
					l_printer.print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_ekeyword)
					l_printer.print_string (a_universe.kind_capitalized_name)
					l_printer.print_end_span
					l_printer.print_new_line
					l_printer.indent
					l_printer.set_root_path (Void)
					l_printer.print_start_a_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_ecluster, l_base_name)
					l_printer.set_root_path (a_root_path)
					l_printer.print_string (l_universe_name)
					l_printer.print_end_a
					l_printer.print_new_line
					l_printer.dedent
					l_printer.print_new_line
						-- Clusters.
					if attached {ET_INTERNAL_UNIVERSE} a_universe as l_internal_universe and then l_internal_universe.clusters.count > 0 then
						l_printer.print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_ekeyword)
						l_printer.print_string (title_clusters)
						l_printer.print_end_span
						l_printer.print_new_line
						l_printer.indent
						l_printer.print_cluster_names_recursive (l_internal_universe.clusters)
						l_printer.dedent
						l_printer.print_new_line
					end
						-- Classes.
					l_printer.print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_ekeyword)
					l_printer.print_string (title_classes)
					l_printer.print_end_span
					l_printer.print_new_line
					l_printer.indent
					across a_class_mapping as i_mapping loop
						l_class := @i_mapping.key
						if l_class.universe = a_universe then
							l_printer.print_class_header (l_class, True)
							l_printer.print_new_line
						end
					end
					l_printer.dedent
					l_printer.print_new_line
						-- Footer.
					print_navigation_bar (Void, True, True, False, False, False, False, a_root_path, l_file)
					l_file.put_line (html_end_pre)
					print_footer (l_file)
					l_printer.set_null_file
					l_printer.reset
					l_file.close
				else
					report_cannot_write_error (l_filename)
				end
			end
		end

	print_classes_chart (a_classes: DS_ARRAYED_LIST [ET_CLASS]; a_formats: DS_ARRAYED_LIST [like Current]; a_parent_classes: DS_HASH_TABLE [DS_HASH_SET [ET_CLASS], ET_CLASS]; a_universe_mapping: DS_HASH_TABLE [STRING, ET_UNIVERSE]; a_class_mapping: DS_HASH_TABLE [STRING, ET_CLASS]; a_feature_mapping: DS_HASH_TABLE [STRING, ET_FEATURE]; a_root_path: STRING)
			-- Print files "<class_name>_chart.html" for each class in `a_classes' using `a_formats'.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
			a_formats_not_void: a_formats /= Void
			no_void_format: not a_formats.has_void
			a_parent_classes_not_void: a_parent_classes /= Void
			a_universe_mapping_not_void: a_universe_mapping /= Void
			a_class_mapping_not_void: a_class_mapping /= Void
			a_feature_mapping_not_void: a_feature_mapping /= Void
			a_root_path_not_void: a_root_path /= Void
		local
			i, nb: INTEGER
			l_format: like Current
			dt1: detachable DT_DATE_TIME
		do
			if not system_processor.stop_requested then
				dt1 := system_processor.benchmark_start_time
				nb := a_formats.count
				from i := 1 until i > nb loop
					l_format := a_formats.item (i)
					l_format.system_processor.set_custom_processor (agent l_format.print_class_chart (?, a_parent_classes, a_universe_mapping, a_class_mapping, a_feature_mapping, a_root_path))
					i := i + 1
				end
				a_classes.do_all (agent {ET_CLASS}.set_marked (False))
				system_processor.process_custom (a_classes)
				system_processor.record_end_time (dt1, "Class Charts")
				system_processor.report_custom_metrics (a_classes, "Generated chart files for")
			end
		end

	print_classes_links (a_classes: DS_ARRAYED_LIST [ET_CLASS]; a_formats: DS_ARRAYED_LIST [like Current]; a_parent_classes, a_heir_classes, a_client_classes, a_suppliers_classes: DS_HASH_TABLE [DS_HASH_SET [ET_CLASS], ET_CLASS]; a_class_mapping: DS_HASH_TABLE [STRING, ET_CLASS]; a_feature_mapping: DS_HASH_TABLE [STRING, ET_FEATURE]; a_root_path: STRING)
			-- Print files "<class_name>links.html" for each class in `a_classes' using `a_formats'.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
			a_formats_not_void: a_formats /= Void
			no_void_format: not a_formats.has_void
			a_parent_classes_not_void: a_parent_classes /= Void
			a_heir_classes_not_void: a_heir_classes /= Void
			a_client_classes_not_void: a_client_classes /= Void
			a_suppliers_classes_not_void: a_suppliers_classes /= Void
			a_class_mapping_not_void: a_class_mapping /= Void
			a_feature_mapping_not_void: a_feature_mapping /= Void
			a_root_path_not_void: a_root_path /= Void
		local
			i, nb: INTEGER
			l_format: like Current
			dt1: detachable DT_DATE_TIME
		do
			if not system_processor.stop_requested then
				dt1 := system_processor.benchmark_start_time
				nb := a_formats.count
				from i := 1 until i > nb loop
					l_format := a_formats.item (i)
					l_format.system_processor.set_custom_processor (agent l_format.print_class_links (?, a_parent_classes, a_heir_classes, a_client_classes, a_suppliers_classes, a_class_mapping, a_feature_mapping, a_root_path))
					i := i + 1
				end
				a_classes.do_all (agent {ET_CLASS}.set_marked (False))
				system_processor.process_custom (a_classes)
				system_processor.record_end_time (dt1, "Class Relations")
				system_processor.report_custom_metrics (a_classes, "Generated relation files for")
			end
		end

	print_classes_text (a_classes: DS_ARRAYED_LIST [ET_CLASS]; a_formats: DS_ARRAYED_LIST [like Current]; a_class_mapping: DS_HASH_TABLE [STRING, ET_CLASS]; a_feature_mapping: DS_HASH_TABLE [STRING, ET_FEATURE]; a_root_path: STRING)
			-- Print files "<class_name>.html" for each class in `a_classes' using `a_formats'.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
			a_formats_not_void: a_formats /= Void
			no_void_format: not a_formats.has_void
			a_class_mapping_not_void: a_class_mapping /= Void
			a_feature_mapping_not_void: a_feature_mapping /= Void
			a_root_path_not_void: a_root_path /= Void
		local
			i, nb: INTEGER
			l_format: like Current
			dt1: detachable DT_DATE_TIME
		do
			if not system_processor.stop_requested then
				dt1 := system_processor.benchmark_start_time
				nb := a_formats.count
				from i := 1 until i > nb loop
					l_format := a_formats.item (i)
					l_format.system_processor.set_custom_processor (agent l_format.print_class_text (?, a_class_mapping, a_feature_mapping, a_root_path))
					i := i + 1
				end
				a_classes.do_all (agent {ET_CLASS}.set_marked (False))
				system_processor.process_custom (a_classes)
				system_processor.record_end_time (dt1, "Class Texts")
				system_processor.report_custom_metrics (a_classes, "Generated text files for")
			end
		end

	print_class_header (a_class: ET_CLASS; a_printer: ET_AST_HTML_ISE_STYLESHEET_PRINTER)
			-- Printer header of `a_class' with `a_printer'.
		require
			a_class_not_void: a_class /= Void
			a_printer_not_void: a_printer /= Void
		do
			if attached a_class.class_mark as l_class_mark then
				a_printer.print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_ekeyword)
				a_printer.print_string (l_class_mark.text)
				a_printer.print_end_span
				a_printer.print_character (' ')
			end
			tokens.class_keyword.process (a_printer)
			a_printer.print_new_line
			a_printer.indent
			a_printer.print_class_header (a_class, False)
			a_printer.dedent
			a_printer.print_new_line
			a_printer.print_new_line
		end

	print_class_general (a_class: ET_CLASS; a_universe_mapping: DS_HASH_TABLE [STRING, ET_UNIVERSE]; a_printer: ET_AST_HTML_ISE_STYLESHEET_PRINTER)
			-- Print general section of `a_class' with `a_printer'.
		require
			a_class_not_void: a_class /= Void
			a_universe_mapping_not_void: a_universe_mapping /= Void
			a_printer_not_void: a_printer /= Void
		local
			l_feature_name_set: DS_HASH_SET [ET_FEATURE_NAME]
			l_feature_name_list: DS_ARRAYED_LIST [ET_FEATURE_NAME]
			l_universe: ET_UNIVERSE
			i, nb: INTEGER
			l_any: ET_CLASS
			l_line_splitter: ST_SPLITTER
		do
			a_printer.print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_ekeyword)
			a_printer.print_string (title_general)
			a_printer.print_end_span
			a_printer.print_new_line
			a_printer.indent
			a_printer.print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_eitag)
			a_printer.print_string (tag_group)
			a_printer.print_end_span
			tokens.colon_symbol.process (a_printer)
			a_printer.print_character (' ')
			l_universe := a_class.universe
			if attached a_universe_mapping.value (l_universe) as l_universe_href then
				a_printer.print_start_a_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_ecluster, l_universe_href)
				a_printer.print_string (universe_lower_name (l_universe))
				a_printer.print_end_a
			else
				a_printer.print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_necluster)
				a_printer.print_string (universe_lower_name (l_universe))
				a_printer.print_end_span
			end
			if not ANY_.same_objects (a_class.universe, a_class.group) then
				a_printer.print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_necluster)
				a_printer.print_character ('/')
				a_printer.print_string (a_class.group.relative_lower_name (l_universe, '/'))
				a_printer.print_end_span
			end
			a_printer.print_new_line
			if attached class_description (a_class) as l_description then
				a_printer.print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_eitag)
				a_printer.print_string (tag_description)
				a_printer.print_end_span
				tokens.colon_symbol.process (a_printer)
				if l_description.has ('%N') then
					a_printer.print_new_line
					a_printer.indent
					l_line_splitter := line_splitter
					across l_line_splitter.split_greedy (l_description) as i_line loop
						a_printer.print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_estring)
						if @i_line.is_first then
							a_printer.print_character ('%"')
						end
						a_printer.print_string (i_line)
						if @i_line.is_last then
							a_printer.print_character ('%"')
						end
						a_printer.print_end_span
						a_printer.print_new_line
					end
					a_printer.dedent
				else
					a_printer.print_character (' ')
					a_printer.print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_estring)
					a_printer.print_character ('%"')
					a_printer.print_string (l_description)
					a_printer.print_character ('%"')
					a_printer.print_end_span
					a_printer.print_new_line
				end
			end
			l_feature_name_set := new_feature_name_set (20)
			l_any := a_class.current_system.any_type.base_class
			a_class.add_creations_exported_to (l_any, l_feature_name_set, system_processor)
			nb := l_feature_name_set.count
			if nb > 0 then
				a_printer.print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_eitag)
				a_printer.print_string (tag_create)
				a_printer.print_end_span
				tokens.colon_symbol.process (a_printer)
				a_printer.print_character (' ')
				l_feature_name_list := new_feature_name_list (nb)
				l_feature_name_list.extend_last (l_feature_name_set)
				l_feature_name_list.sort (feature_name_sorter)
				from i := 1 until i > nb loop
					if i /= 1 then
						tokens.comma_symbol.process (a_printer)
						a_printer.print_character (' ')
					end
					a_printer.print_feature_name_in_class (l_feature_name_list.item (i), a_class)
					i := i + 1
				end
				a_printer.print_new_line
			end
			a_printer.dedent
			a_printer.print_new_line
		end

	print_class_relation (a_class: ET_CLASS; a_title: STRING; a_relation: DS_HASH_TABLE [DS_HASH_SET [ET_CLASS], ET_CLASS]; a_printer: ET_AST_HTML_ISE_STYLESHEET_PRINTER)
			-- Print relation section `a_title' of `a_class' with `a_printer'.
		require
			a_class_not_void: a_class /= Void
			a_title_not_void: a_title /= Void
			a_relation_not_void: a_relation /= Void
			a_printer_not_void: a_printer /= Void
		local
			l_class_list: DS_ARRAYED_LIST [ET_CLASS]
			i, nb: INTEGER
		do
			if attached a_relation.value (a_class) as l_class_set then
				nb := l_class_set.count
				if nb > 0 then
					a_printer.print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_ekeyword)
					a_printer.print_string (a_title)
					a_printer.print_end_span
					a_printer.print_new_line
					l_class_list := new_class_list (nb)
					l_class_list.extend_last (l_class_set)
					l_class_list.sort (class_sorter_by_name)
					a_printer.indent
					from i := 1 until i > nb loop
						a_printer.print_class_header (l_class_list.item (i), True)
						a_printer.print_new_line
						i := i + 1
					end
					a_printer.dedent
					a_printer.print_new_line
				end
			end
		end

	print_feature_signatures (a_features: ET_FEATURE_LIST; a_title: STRING; a_printer: ET_AST_HTML_ISE_STYLESHEET_PRINTER)
			-- Print signatures of `a_features' in section `a_title' with `a_printer'.
		require
			a_features_not_void: a_features /= Void
			a_title_not_void: a_title /= Void
			a_printer_not_void: a_printer /= Void
		local
			l_feature_list: DS_ARRAYED_LIST [ET_FEATURE]
			i, nb: INTEGER
			l_any: ET_CLASS
		do
			nb := a_features.count
			if nb > 0 then
				l_any := a_features.first.implementation_class.current_system.any_type.base_class
				l_feature_list := new_feature_list (nb)
				a_features.add_user_defined_features_exported_to (l_any, l_feature_list, system_processor)
				nb := l_feature_list.count
				if nb > 0 then
					a_printer.print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_ekeyword)
					a_printer.print_string (a_title)
					a_printer.print_end_span
					a_printer.print_new_line
					l_feature_list.sort (feature_sorter_by_name)
					a_printer.indent
					from i := 1 until i > nb loop
						a_printer.print_feature_signature (l_feature_list.item (i))
						a_printer.print_new_line
						i := i + 1
					end
					a_printer.dedent
					a_printer.print_new_line
				end
			end
		end

	print_header (a_title: STRING; a_keywords: STRING; a_root_path: STRING; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print HTML header to `a_file'.
		require
			a_title_not_void: a_title /= Void
			a_keywords_not_void: a_keywords /= Void
			a_root_path_not_void: a_root_path /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_line (header_line_1)
			a_file.put_line (header_line_2)
			a_file.put_line (header_line_3)
			a_file.put_string (header_line_4a)
			a_file.put_string (a_keywords)
			a_file.put_line (header_line_4b)
			a_file.put_string (header_line_5a)
			a_file.put_string (a_title)
			a_file.put_line (header_line_5b)
			a_file.put_string (header_line_6a)
			a_file.put_string (a_root_path)
			a_file.put_line (header_line_6b)
			a_file.put_string (header_line_7a)
			a_file.put_string (a_root_path)
			a_file.put_line (header_line_7b)
			a_file.put_line (header_line_8)
			a_file.put_line (header_line_9)
			a_file.put_line (header_line_10)
		end

	print_footer (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print HTML footer to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_line (footer_line_1)
			a_file.put_line (footer_line_2)
			a_file.put_line (footer_line_3)
			a_file.put_line (footer_line_4)
		end

	print_navigation_bar (a_class_name: detachable STRING; a_class_list, a_group_list, a_group_hierarchy, a_class_chart, a_class_links, a_class_text: BOOLEAN; a_root_path: STRING; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print navigation bar to `a_file'.
		require
			a_root_path_not_void: a_root_path /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_string (navigation_line_1a)
			a_file.put_string (a_root_path)
			a_file.put_line (navigation_line_1b)
			a_file.put_line (navigation_line_2)
			if a_class_list then
				a_file.put_string (navigation_line_3a)
				a_file.put_string (a_root_path)
				a_file.put_line (navigation_line_3b)
			else
				a_file.put_line (navigation_line_4)
			end
			if a_group_list then
				a_file.put_string (navigation_line_5a)
				a_file.put_string (a_root_path)
				a_file.put_line (navigation_line_5b)
			else
				a_file.put_line (navigation_line_6)
			end
			if a_group_hierarchy then
				a_file.put_string (navigation_line_7a)
				a_file.put_string (a_root_path)
				a_file.put_line (navigation_line_7b)
			else
				a_file.put_line (navigation_line_8)
			end
			if a_class_name /= Void then
				if a_class_chart then
					a_file.put_string (navigation_line_9a)
					a_file.put_string (a_class_name)
					a_file.put_line (navigation_line_9b)
				else
					a_file.put_line (navigation_line_10)
				end
				if a_class_links then
					a_file.put_string (navigation_line_11a)
					a_file.put_string (a_class_name)
					a_file.put_line (navigation_line_11b)
				else
					a_file.put_line (navigation_line_12)
				end
				if a_class_text then
					a_file.put_string (navigation_line_13a)
					a_file.put_string (a_class_name)
					a_file.put_line (navigation_line_13b)
				else
					a_file.put_line (navigation_line_14)
				end
				a_file.put_string (navigation_line_15a)
				a_file.put_string (a_class_name)
				a_file.put_line (navigation_line_15b)
			else
				a_file.put_line (navigation_line_16)
			end
			a_file.put_string (navigation_line_17)
		end

	class_output_directory (a_class: ET_CLASS): STRING
			-- Where to generate files for `a_class';
			-- Void if this directory could not be determined
			-- (e.g. `output_directory' was not specified and
			-- `a_class' is in a .NET assembly).
		do
			Result := output_directory
			if library_prefix_flag then
				Result := file_system.pathname (Result, universe_lower_name (a_class.universe))
			end
		end

feature {GEDOC_HTML_ISE_STYLESHEET_FORMAT} -- Output

	print_class_chart (a_class: ET_CLASS; a_parent_classes: DS_HASH_TABLE [DS_HASH_SET [ET_CLASS], ET_CLASS]; a_universe_mapping: DS_HASH_TABLE [STRING, ET_UNIVERSE]; a_class_mapping: DS_HASH_TABLE [STRING, ET_CLASS]; a_feature_mapping: DS_HASH_TABLE [STRING, ET_FEATURE]; a_root_path: STRING)
			-- Print file "<class_name>_chart.html".
		require
			a_class_not_void: a_class /= Void
			a_parent_classes_not_void: a_parent_classes /= Void
			a_universe_mapping_not_void: a_universe_mapping /= Void
			a_class_mapping_not_void: a_class_mapping /= Void
			a_feature_mapping_not_void: a_feature_mapping /= Void
			a_root_path_not_void: a_root_path /= Void
		local
			l_file: like new_output_file
			l_filename: STRING
			l_class_name: STRING
			l_title: STRING
			l_printer: ET_AST_HTML_ISE_STYLESHEET_PRINTER
		do
			if not {PLATFORM}.is_thread_capable or else a_class.processing_mutex.try_lock then
				if not a_class.is_marked then
					l_class_name := class_lower_name (a_class)
					l_filename := filename (class_output_directory (a_class), concat (l_class_name, filename_suffix_chart))
					if not is_file_overwritable (l_filename) then
						report_file_already_exists_error (l_filename)
					else
						l_file := new_output_file (l_filename)
						l_file.recursive_open_write
						if l_file.is_open_write then
							l_printer := html_printer
							l_printer.reset
							l_printer.set_file (l_file)
							l_printer.set_class_mapping (a_class_mapping)
							l_printer.set_feature_mapping (a_feature_mapping)
							l_printer.set_root_path (a_root_path)
							l_printer.set_current_class (a_class)
							l_printer.set_bom_enabled (False)
							l_printer.print_bom
								-- Header.
							l_title := concat (l_class_name, title_suffix_chart)
							print_header (l_title, keyword_eiffel_class, a_root_path, l_file)
							l_file.put_string (html_start_pre)
							print_navigation_bar (l_class_name, True, True, True, False, True, True, a_root_path, l_file)
								-- Content.
							print_class_header (a_class, l_printer)
							print_class_general (a_class, a_universe_mapping, l_printer)
							print_class_relation (a_class, title_parents, a_parent_classes, l_printer)
							print_feature_signatures (a_class.queries, title_queries, l_printer)
							print_feature_signatures (a_class.procedures, title_commands, l_printer)
								-- Footer.
							print_navigation_bar (l_class_name, True, True, True, False, True, True, a_root_path, l_file)
							l_file.put_line (html_end_pre)
							print_footer (l_file)
							l_printer.set_null_file
							l_printer.reset
							l_file.close
						else
							report_cannot_write_error (l_filename)
						end
					end
					system_processor.report_class_processed (a_class)
					a_class.set_marked (True)
				end
				a_class.processing_mutex.unlock
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
			l_file: like new_output_file
			l_filename: STRING
			l_class_name: STRING
			l_title: STRING
			l_printer: ET_AST_HTML_ISE_STYLESHEET_PRINTER
		do
			if not {PLATFORM}.is_thread_capable or else a_class.processing_mutex.try_lock then
				if not a_class.is_marked then
					l_class_name := class_lower_name (a_class)
					l_filename := filename (class_output_directory (a_class), concat (l_class_name, filename_suffix_links))
					if not is_file_overwritable (l_filename) then
						report_file_already_exists_error (l_filename)
					else
						l_file := new_output_file (l_filename)
						l_file.recursive_open_write
						if l_file.is_open_write then
							l_printer := html_printer
							l_printer.reset
							l_printer.set_file (l_file)
							l_printer.set_class_mapping (a_class_mapping)
							l_printer.set_feature_mapping (a_feature_mapping)
							l_printer.set_root_path (a_root_path)
							l_printer.set_current_class (a_class)
							l_printer.set_bom_enabled (False)
							l_printer.print_bom
								-- Header.
							l_title := concat (l_class_name, title_suffix_relations)
							print_header (l_title, keyword_eiffel_class, a_root_path, l_file)
							l_file.put_string (html_start_pre)
							print_navigation_bar (l_class_name, True, True, True, True, False, True, a_root_path, l_file)
								-- Content.
							print_class_header (a_class, l_printer)
							print_class_relation (a_class, title_parents, a_parent_classes, l_printer)
							print_class_relation (a_class, title_heirs, a_heir_classes, l_printer)
							print_class_relation (a_class, title_clients, a_client_classes, l_printer)
							print_class_relation (a_class, title_suppliers, a_suppliers_classes, l_printer)
								-- Footer.
							print_navigation_bar (l_class_name, True, True, True, True, False, True, a_root_path, l_file)
							l_file.put_line (html_end_pre)
							print_footer (l_file)
							l_printer.set_null_file
							l_printer.reset
							l_file.close
						else
							report_cannot_write_error (l_filename)
						end
					end
					system_processor.report_class_processed (a_class)
					a_class.set_marked (True)
				end
				a_class.processing_mutex.unlock
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
			l_class_name: STRING
			l_title: STRING
			l_printer: ET_AST_HTML_ISE_STYLESHEET_PRINTER
		do
			if not {PLATFORM}.is_thread_capable or else a_class.processing_mutex.try_lock then
				if not a_class.is_marked then
					l_class_name := class_lower_name (a_class)
					l_filename := filename (class_output_directory (a_class), concat (l_class_name, filename_suffix_text))
					if not is_file_overwritable (l_filename) then
						report_file_already_exists_error (l_filename)
					else
						l_file := new_output_file (l_filename)
						l_file.recursive_open_write
						if l_file.is_open_write then
							l_printer := html_printer
							l_printer.reset
							l_printer.set_file (l_file)
							l_printer.set_class_mapping (a_class_mapping)
							l_printer.set_feature_mapping (a_feature_mapping)
							l_printer.set_root_path (a_root_path)
							l_printer.set_current_class (a_class)
							l_printer.set_bom_enabled (False)
							l_printer.print_bom
							l_title := concat (l_class_name, title_suffix_text)
							print_header (l_title, keyword_eiffel_class, a_root_path, l_file)
							l_file.put_string (html_start_pre)
							print_navigation_bar (l_class_name, True, True, True, True, True, False, a_root_path, l_file)
							a_class.process (l_printer)
							print_navigation_bar (l_class_name, True, True, True, True, True, False, a_root_path, l_file)
							l_file.put_line (html_end_pre)
							print_footer (l_file)
							l_printer.set_null_file
							l_printer.reset
							l_file.close
						else
							report_cannot_write_error (l_filename)
						end
					end
					system_processor.report_class_processed (a_class)
					a_class.set_marked (True)
				end
				a_class.processing_mutex.unlock
			end
		end

feature {NONE} -- Mapping

	universe_mapping (a_system: ET_SYSTEM): DS_HASH_TABLE [STRING, ET_UNIVERSE]
			-- Universes in `a_system', sorted by name
			-- Mapping between universe in `a_system' and the
			-- name of file for these universes (relative to
			-- `output_directory'), ordered by universe names.
		require
			a_system_not_void: a_system /= Void
		local
			l_list: DS_ARRAYED_LIST [ET_UNIVERSE]
			l_universes_by_name: DS_HASH_TABLE [ET_UNIVERSE, STRING]
			l_names: DS_ARRAYED_LIST [STRING]
			l_universe: ET_UNIVERSE
			l_name: STRING
			i, nb: INTEGER
			l_name_sorter: DS_QUICK_SORTER [STRING]
			l_name_comparator: KL_AGENT_COMPARATOR [STRING]
			l_filename: STRING
		do
			create l_list.make_default
			a_system.universes_do_recursive (agent l_list.force_last)
			nb := l_list.count
			create l_universes_by_name.make (nb)
			create l_names.make (nb)
			from i := 1 until i > nb loop
				l_universe := l_list.item (i)
				create l_name.make_from_string (universe_lower_name (l_universe))
				l_names.put_last (l_name)
				l_universes_by_name.put_last (l_universe, l_name)
				i := i + 1
			end
			create l_name_comparator.make (agent STRING_.is_less)
			create l_name_sorter.make (l_name_comparator)
			l_names.sort (l_name_sorter)
			create Result.make_map (nb)
			from i := 1 until i > nb loop
				l_name := l_names.item (i)
				if library_prefix_flag then
					l_filename := l_name + "/index.html"
				else
					l_filename := l_name + "_index.html"
				end
				Result.put_last (l_filename, l_universes_by_name.item (l_name))
				i := i + 1
			end
		ensure
			universe_mapping_not_void: Result /= Void
		end

	class_mapping (a_suffix: STRING; a_input_classes: like input_classes): DS_HASH_TABLE [STRING, ET_CLASS]
			-- Mapping between classes in `a_input_classes' and
			-- the name of file for these classes (relative to
			-- `output_directory').
			-- `a_suffix' is a suffix to be added to the filename (e.g. "_chart").
			-- Keep the same ordering as in `a_input_classes'.
		require
			a_suffix_not_void: a_suffix /= Void
			a_input_classes_not_void: a_input_classes /= Void
			no_void_input_class: not a_input_classes.has_void
		local
			i, nb: INTEGER
			l_class: ET_CLASS
			l_filename: STRING
		do
			nb := a_input_classes.count
			create Result.make_map (nb)
			from i := 1 until i > nb loop
				l_class := a_input_classes.item (i)
				create l_filename.make (50)
				if library_prefix_flag then
					l_filename.append_string (universe_lower_name (l_class.universe))
					l_filename.append_character ('/')
				end
				l_filename.append_string (l_class.lower_name)
				l_filename.append_string (a_suffix)
				l_filename.append_string (".html")
				Result.put_last (l_filename, l_class)
				i := i + 1
			end
		ensure
			class_mapping_not_void: Result /= Void
		end

	feature_mapping (a_input_classes: like input_classes): DS_HASH_TABLE [STRING, ET_FEATURE]
			-- Mapping between features of classes in `a_input_classes' and
			-- the name of file and location for these features (relative
			-- to `output_directory').
		require
			a_input_classes_not_void: a_input_classes /= Void
			no_void_input_class: not a_input_classes.has_void
		local
			i, nb: INTEGER
			l_class: ET_CLASS
			l_filename: STRING
			l_features: ET_FEATURE_LIST
			l_feature: ET_FEATURE
			j, nb2: INTEGER
		do
			nb := a_input_classes.count
			create Result.make_map (nb * 50)
			from i := 1 until i > nb loop
				l_class := a_input_classes.item (i)
				create l_filename.make (50)
				if library_prefix_flag then
					l_filename.append_string (universe_lower_name (l_class.universe))
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
			l_default_field_value_capacity: INTEGER
		do
			l_terms_count := a_indexing_terms.count
			l_default_field_value_capacity := 15
			create Result.make (l_terms_count * l_default_field_value_capacity)
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
					{UC_UTF8_ROUTINES}.append_natural_32_code_to_utf8 (Result, l_character_1.literal.natural_32_code)
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

	html_printer: ET_AST_HTML_ISE_STYLESHEET_PRINTER
			-- HTML printer

	line_splitter: ST_SPLITTER
			-- Line splitter

	add_format (a_system_processor: ET_SYSTEM_PROCESSOR; a_formats: DS_ARRAYED_LIST [like Current])
			-- Add format associated with `a_system_processor' to `a_formats'.
		require
			a_system_processor_not_void: a_system_processor /= Void
			a_formats_not_void: a_formats /= Void
			no_void_format: not a_formats.has_void
		local
			l_format: like Current
		do
			if a_system_processor = system_processor then
				l_format := Current
			else
				create l_format.make_from_format (Current, a_system_processor)
			end
			a_formats.force_last (l_format)
		ensure
			no_void_format: not a_formats.has_void
			one_more: a_formats.count = old a_formats.count + 1
			system_processor_set: a_formats.last.system_processor = a_system_processor
		end

	new_class_list (nb: INTEGER): DS_ARRAYED_LIST [ET_CLASS]
			-- Empty list of classes which can contain at least `nb' classes
			--
			-- Note that this routine always returns the same object.
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
			--
			-- Note that this routine always returns the same object.
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
			--
			-- Note that this routine always returns the same object.
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
			--
			-- Note that this routine always returns the same object.
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
			--
			-- Note that this routine always returns the same object.
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

	keyword_eiffel_class: STRING = "Eiffel class"
			-- Keyword "Eiffel class"

	keyword_eiffel_group: STRING = "Eiffel group"
			-- Keyword "Eiffel group"

	keyword_eiffel_system: STRING = "Eiffel system"
			-- Keyword "Eiffel system"

	tag_create: STRING = "create"
			-- Tag "create"

	tag_description: STRING = "description"
			-- Tag "description"

	tag_group: STRING = "group"
			-- Tag "group"

	tag_name: STRING = "name"
			-- Tag "name"

	title_classes: STRING = "Classes"
			-- Title "Classes"

	title_clients: STRING = "Clients"
			-- Title "Clients"

	title_clusters: STRING = "Clusters"
			-- Title "Clusters"

	title_commands: STRING = "Commands"
			-- Title "Commands"

	title_general: STRING = "General"
			-- Title "General"

	title_groups: STRING = "Groups"
			-- Title "Groups"

	title_heirs: STRING = "Heirs"
			-- Title "Heirs"

	title_parents: STRING = "Parents"
			-- Title "Parents"

	title_queries: STRING = "Queries"
			-- Title "Queries"

	title_root_class: STRING = "Root class"
			-- Title "Root class"

	title_suppliers: STRING = "Suppliers"
			-- Title "Suppliers"

	title_system: STRING = "System"
			-- Title "System"

	title_suffix_alphabetical_group_list: STRING = " alphabetical group list"
			-- Title suffix " alphabetical group list"

	title_suffix_chart: STRING = " Chart"
			-- Title suffix " Chart"

	title_suffix_class_dictionary: STRING = " class dictionary"
			-- Title suffix " class dictionary"

	titla_suffix_documentation: STRING = " documentation"
			-- Title suffix " documentation"

	title_suffix_group_hierarchy: STRING = " group hierarchy"
			-- Title suffix " group hierarchy"

	title_suffix_relations: STRING = " Relations"
			-- Title suffix " Relations"

	title_suffix_text: STRING = " Text"
			-- Title suffix " Text"

	html_start_pre: STRING = "<pre>"
			-- <pre>

	html_end_pre: STRING = "</pre>"
			-- </pre>

	header_line_1: STRING = "<HTML>"
			-- 1rst line in HTML header

	header_line_2: STRING = "<HEAD>"
			-- 2nd line in HTML header

	header_line_3: STRING = "<META NAME=%"generator%" CONTENT=%"Gobo Eiffel Doc%">"
			-- 3rd line in HTML header

	header_line_4a: STRING = "<META NAME=%"keywords%" content=%""
			-- 4th line in HTML header, first part

	header_line_4b: STRING =  "%"/>"
			-- 4th line in HTML header, second part

	header_line_5a: STRING = "<TITLE>"
			-- 5th line in HTML header, first part

	header_line_5b: STRING = "</TITLE>"
			-- 5th line in HTML header, second part

	header_line_6a: STRING = "<LINK REL=%"stylesheet%" HREF=%""
			-- 6th line in HTML header, first part

	header_line_6b: STRING = "default.css%" TYPE=%"text/css%">"
			-- 6th line in HTML header, second part

	header_line_7a: STRING = "<SCRIPT TYPE=%"text/javascript%" SRC=%""
			-- 7th line in HTML header, first part

	header_line_7b: STRING = "goto.js%"></SCRIPT>"
			-- 7th line in HTML header, second part

	header_line_8: STRING = "</HEAD>"
			-- 8th line in HTML header

	header_line_9: STRING = "<BODY>"
			-- 9th line in HTML header

	header_line_10: STRING = "<P ALIGN=%"CENTER%">Automatic generation produced by Gobo Eiffel Doc</P>"
			-- 10th line in HTML header

	footer_line_1: STRING = "<P ALIGN=%"CENTER%"> &#045;&#045; Generated by Gobo Eiffel Doc&#045;&#045; "
			-- 1rst line in HTML footer

	footer_line_2: STRING = "<BR>For more details: <A HREF=%"http://www.gobosoft.com%">www.gobosoft.com</A></P>"
			-- 2nd line in HTML footer

	footer_line_3: STRING = "</BODY>"
			-- 3rd line in HTML footer

	footer_line_4: STRING = "</HTML>"
			-- 4th line in HTML footer

	navigation_line_1a: STRING = "<FORM ONSUBMIT=%"go_to('"
			-- 1rst line in HTML navigation bar, first part

	navigation_line_1b: STRING = "',this.c.value);return false;%">"
			-- 1rst line in HTML navigation bar, second part

	navigation_line_2: STRING = "<TABLE CELLSPACING=%"5%" CELLPADDING=%"4%"><TR>"
			-- 2nd line in HTML navigation bar

	navigation_line_3a: STRING = "<TD CLASS=%"link1%"><A CLASS=%"link1%" HREF=%""
			-- 3rd line in HTML navigation bar, first part

	navigation_line_3b: STRING = "class_list.html%">Classes</A></TD>"
			-- 3rd line in HTML navigation bar, second part

	navigation_line_4: STRING = "<TD CLASS=%"nolink1%">Classes</TD>"
			-- 4th line in HTML navigation bar

	navigation_line_5a: STRING = "<TD CLASS=%"link1%"><A CLASS=%"link1%" HREF=%""
			-- 5th line in HTML navigation bar, first part

	navigation_line_5b: STRING = "group_list.html%">Groups</A></TD>"
			-- 5th line in HTML navigation bar, second part

	navigation_line_6: STRING = "<TD CLASS=%"nolink1%">Groups</TD>"
			-- 6th line in HTML navigation bar

	navigation_line_7a: STRING = "<TD CLASS=%"link1%"><A CLASS=%"link1%" HREF=%""
			-- 7th line in HTML navigation bar, first part

	navigation_line_7b: STRING = "group_hierarchy.html%">Group hierarchy</A></TD>"
			-- 7th line in HTML navigation bar, second part

	navigation_line_8: STRING = "<TD CLASS=%"nolink1%">Group hierarchy</TD>"
			-- 8th line in HTML navigation bar

	navigation_line_9a: STRING = "<TD CLASS=%"link2%"><A CLASS=%"link2%" HREF=%""
			-- 9th line in HTML navigation bar, first part

	navigation_line_9b: STRING = "_chart.html%">Chart</A></TD>"
			-- 9th line in HTML navigation bar, second part

	navigation_line_10: STRING = "<TD CLASS=%"nolink2%">Chart</TD>"
			-- 10th line in HTML navigation bar

	navigation_line_11a: STRING = "<TD CLASS=%"link2%"><A CLASS=%"link2%" HREF=%""
			-- 11th line in HTML navigation bar, first part

	navigation_line_11b: STRING = "_links.html%">Relations</A></TD>"
			-- 11th line in HTML navigation bar, second part

	navigation_line_12: STRING = "<TD CLASS=%"nolink2%">Relations</TD>"
			-- 12th line in HTML navigation bar

	navigation_line_13a: STRING = "<TD CLASS=%"link2%"><A CLASS=%"link2%" HREF=%""
			-- 13th line in HTML navigation bar, first part

	navigation_line_13b: STRING = ".html%">Text</A></TD>"
			-- 13th line in HTML navigation bar, second part

	navigation_line_14: STRING = "<TD CLASS=%"nolink2%">Text</TD>"
			-- 14th line in HTML navigation bar

	navigation_line_15a: STRING = "<TD CLASS=%"link2%">Go to: <INPUT NAME=%"c%" VALUE=%""
			-- 15th line in HTML navigation bar, first part

	navigation_line_15b: STRING = "%"></TD>"
			-- 15th line in HTML navigation bar, second part

	navigation_line_16: STRING = "<TD CLASS=%"link2%">Go to: <INPUT NAME=%"c%" VALUE=%"%"></TD>"
			-- 16th line in HTML navigation bar

	navigation_line_17: STRING = "</TR></TABLE></FORM>"
			-- 17th line in HTML navigation bar

	filename_class_list: STRING = "class_list.html"
			-- Filename "class_list.html"

	filename_default_css: STRING = "default.css"
			-- Filename "default.css"

	filename_goto: STRING = "goto.js"
			-- Filename "goto.js"

	filename_group_hierarchy: STRING = "group_hierarchy.html"
			-- Filename "group_hierarchy.html"

	filename_group_list: STRING = "group_list.html"
			-- Filename "group_list.html"

	filename_index: STRING = "index.html"
			-- Filename "index.html"

	filename_suffix_chart: STRING = "_chart.html"
			-- Filename suffix "_chart.html"

	filename_suffix_index: STRING = "_index.html"
			-- Filename suffix "_index.html"

	filename_suffix_links: STRING = "_links.html"
			-- Filename suffix "_links.html"

	filename_suffix_text: STRING = ".html"
			-- Filename suffix ".html"

invariant

	output_directory_not_void: output_directory /= Void
	html_printer_not_void: html_printer /= Void
	line_splitter_not_void: line_splitter /= Void

end
