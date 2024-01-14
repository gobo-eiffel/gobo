note

	description:

		"Xace Eiffel system parsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2019, Andreas Leitner and others"
	license: "MIT License"

class ET_XACE_SYSTEM_PARSER

obsolete

	"Use ET_ECF_* classes instead. [2019-03-17]"

inherit

	ET_XACE_SYSTEM_CONFIG_PARSER
		redefine
			parse_file,
			last_system, new_system
		end

	UT_STRING_ROUTINES
		export {NONE} all end

create

	make, make_with_factory, make_with_variables,
	make_with_variables_and_factory, make_standard

feature -- Parsing

	parse_file (a_file: KI_CHARACTER_INPUT_STREAM)
			-- Parse Xace file `a_file'.
		local
			a_document: XM_DOCUMENT
			a_root_element: XM_ELEMENT
			a_position_table: detachable XM_POSITION_TABLE
			l_last_system: like last_system
		do
			last_system := Void
			xml_parser.parse_from_stream (a_file)
			if xml_parser.is_correct then
				if not tree_pipe.error.has_error then
					a_document := tree_pipe.document
					a_root_element := a_document.root_element
					a_position_table := tree_pipe.tree.last_position_table
					if STRING_.same_string (a_root_element.name, uc_library) then
						xml_validator.validate_library_doc (a_document, a_position_table)
						if not xml_validator.has_error then
							xml_preprocessor.preprocess_element (a_root_element, a_position_table)
							a_root_element.set_name (uc_system)
							l_last_system := new_system (a_root_element, a_position_table)
							l_last_system.set_root_class_name ("NONE")
							last_system := l_last_system
							a_root_element.set_name (uc_library)
							parsed_libraries.wipe_out
						end
					else
						xml_validator.validate_system_doc (a_document, a_position_table)
						if not xml_validator.has_error then
							xml_preprocessor.preprocess_element (a_root_element, a_position_table)
							last_system := new_system (a_root_element, a_position_table)
							parsed_libraries.wipe_out
						end
					end
				else
					error_handler.report_parser_error (tree_pipe.last_error)
				end
			else
				error_handler.report_parser_error (xml_parser.last_error_extended_description)
			end
		end

feature -- Access

	last_system: detachable ET_XACE_SYSTEM
			-- Eiffel system being parsed

feature {NONE} -- Xace AST factory

	new_system (an_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE): ET_XACE_SYSTEM
			-- New Eiffel system build from `an_element'
		local
			l_externals: ET_XACE_EXTERNALS
			l_external_cflags: DS_ARRAYED_LIST [STRING]
			l_external_include_pathnames: DS_ARRAYED_LIST [STRING]
			l_external_library_pathnames: DS_ARRAYED_LIST [STRING]
			l_pathname: STRING
			l_cursor: DS_LINKED_LIST_CURSOR [STRING]
			l_options: ET_XACE_OPTIONS
			l_target: ET_XACE_TARGET
		do
			l_target := new_named_target (an_element, a_position_table)
			create Result.make (l_target)
			fill_system (Result, an_element, a_position_table, Result)
			Result.select_target (l_target, error_handler)
			Result.mount_libraries
			create l_externals.make
			Result.merge_externals (l_externals)
			l_external_cflags := Result.external_cflags
			l_cursor := l_externals.c_compiler_options.new_cursor
			from l_cursor.start until l_cursor.after loop
				l_external_cflags.force_last (l_cursor.item)
				l_cursor.forth
			end
			l_external_include_pathnames := Result.external_include_pathnames
			l_cursor := l_externals.include_directories.new_cursor
			from l_cursor.start until l_cursor.after loop
				l_pathname := l_cursor.item
				l_pathname := replace_all_characters (l_pathname, '{', '(')
				l_pathname := replace_all_characters (l_pathname, '}', ')')
				l_external_include_pathnames.force_last (l_pathname)
				l_cursor.forth
			end
			l_external_library_pathnames := Result.external_library_pathnames
			l_cursor := l_externals.link_libraries.new_cursor
			from l_cursor.start until l_cursor.after loop
				l_pathname := l_cursor.item
				l_pathname := replace_all_characters (l_pathname, '{', '(')
				l_pathname := replace_all_characters (l_pathname, '}', ')')
				l_external_library_pathnames.force_last (l_pathname)
				l_cursor.forth
			end
			l_options := Result.options
			Result.set_console_application_mode (not attached l_options.value ({ET_XACE_OPTION_NAMES}.console_application_option_name) as l_value or else STRING_.same_case_insensitive (l_value, {ET_XACE_OPTION_NAMES}.true_option_value))
			Result.set_exception_trace_mode (attached l_options.value ({ET_XACE_OPTION_NAMES}.exception_trace_option_name) as l_value and then STRING_.same_case_insensitive (l_value, {ET_XACE_OPTION_NAMES}.true_option_value))
			Result.set_trace_mode (attached l_options.value ({ET_XACE_OPTION_NAMES}.trace_option_name) as l_value and then STRING_.same_case_insensitive (l_value, {ET_XACE_OPTION_NAMES}.true_option_value))
			Result.set_use_boehm_gc (attached l_options.value ({ET_XACE_OPTION_NAMES}.garbage_collector_option_name) as l_value and then STRING_.same_case_insensitive (l_value, {ET_XACE_OPTION_NAMES}.boehm_option_value))
			Result.set_multithreaded_mode (attached l_options.value ({ET_XACE_OPTION_NAMES}.multithreaded_option_name) as l_value and then STRING_.same_case_insensitive (l_value, {ET_XACE_OPTION_NAMES}.true_option_value))
		end

end
