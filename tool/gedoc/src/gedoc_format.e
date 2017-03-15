note

	description:

		"Gobo Eiffel Documentation Format"

	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class GEDOC_FORMAT

inherit

	ANY

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

	KL_SHARED_STANDARD_FILES
		export {NONE} all end

	KL_SHARED_EXECUTION_ENVIRONMENT
		export {NONE} all end

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

	UT_SHARED_ISE_VERSIONS
		export {NONE} all end

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

feature {NONE} -- Initialization

	make (a_input_filename: STRING; a_error_handler: like error_handler)
			-- Create a new documentation format with `a_input_filename'.
			-- Use error handler `a_error_handler'.
		require
			a_input_filename_not_void: a_input_filename /= Void
			a_error_handler_not_void: a_error_handler /= Void
		do
			input_filename := a_input_filename
			error_handler := a_error_handler
			ise_version := ise_latest
		ensure
			input_filename_set: input_filename = a_input_filename
			error_handler_set: error_handler = a_error_handler
		end

feature -- Execution

	execute
			-- Execute documentation format.
		do
			parse_input_file (input_filename)
			if not has_error and attached last_system as l_last_system then
				prepare_system (l_last_system)
				if not has_error then
					build_input_classes (l_last_system)
				end
				if not has_error then
					process_system (l_last_system)
				end
				if l_last_system.error_handler.has_error then
					has_error := True
				end
			end
		end

feature -- Access

	input_filename: STRING
			-- Name of the input file.
			-- It can be an Xace file, an ECF file or an Eiffel class file.

	defined_variables: detachable DS_HASH_TABLE [STRING, STRING]
			-- Variables defined on the command-line

	ise_version: UT_VERSION
			-- ISE version, whose semantics should be
			-- used by the Eiffel code analysis process

	class_filters: detachable DS_ARRAYED_LIST [LX_DFA_WILDCARD]
			-- Name of classes to be processed

	output_directory: detachable STRING
			-- Directory for the generated files.
			-- Use directory containing the given class if Void.

	library_prefix_flag: BOOLEAN
			-- Should a subfolder with library name of the given class
			-- be added to the output directory?

	force_flag: BOOLEAN
			-- Should existing files be overwritten without asking?

	interactive_flag: BOOLEAN
			-- Should ask before overwriting a file, unless `force_flag' is True?

feature -- Setting

	set_defined_variables (a_variables: like defined_variables)
			-- Set `defined_variables' to `a_variables'.
		do
			defined_variables := a_variables
		ensure
			defined_variables_set: defined_variables = a_variables
		end

	set_ise_version (a_version: like ise_version)
			-- Set `ise_version' to `a_version'.
		require
			a_version_not_void: a_version /= Void
		do
			ise_version := a_version
		ensure
			ise_version_set: ise_version = a_version
		end

	set_class_filters (a_class_filters: like class_filters)
			-- Set `class_filters' to `a_class_filters'.
		require
			a_class_filters_compiled: a_class_filters /= Void implies a_class_filters.for_all (agent {LX_DFA_WILDCARD}.is_compiled)
		do
			class_filters := a_class_filters
		ensure
			class_fiters_set: class_filters = a_class_filters
		end

	set_output_directory (a_directory: like output_directory)
			-- Set `output_directory' to `a_directory'.
		do
			output_directory := a_directory
		ensure
			output_directory_set: output_directory = a_directory
		end

	set_library_prefix_flag (b: BOOLEAN)
			-- Set `library_prefix_flag' to `b'.
		do
			library_prefix_flag := b
		ensure
			library_prefix_flag_set: library_prefix_flag = b
		end

	set_force_flag (b: BOOLEAN)
			-- Set `force_flag' to `b'.
		do
			force_flag := b
		ensure
			force_flag_set: force_flag = b
		end

	set_interactive_flag (b: BOOLEAN)
			-- Set `interactive_flag' to `b'.
		do
			interactive_flag := b
		ensure
			interactive_flag_set: interactive_flag = b
		end

feature {NONE} -- Eiffel config file parsing

	parse_input_file (a_input_filename: STRING)
			-- Read `a_input_filename'. It can be a Xace file,
			-- an ECF file or an Eiffel class file.
			-- Put result in `last_system' if no error occurred.
		require
			a_input_filename_not_void: a_input_filename /= Void
		local
			l_file: KL_TEXT_INPUT_FILE
			nb: INTEGER
		do
			last_system := Void
			create l_file.make (a_input_filename)
			l_file.open_read
			if l_file.is_open_read then
				nb := a_input_filename.count
				if nb > 5 and then STRING_.same_string (a_input_filename.substring (nb - 4, nb), ".xace") then
					parse_xace_file (l_file)
				elseif nb > 2 and then STRING_.same_string (a_input_filename.substring (nb - 1, nb), ".e") then
					parse_eiffel_file (l_file)
				else
					parse_ecf_file (l_file)
				end
				l_file.close
			else
				report_cannot_read_error (a_input_filename)
			end
		ensure
			has_error_if_void: last_system = Void implies has_error
		end

	parse_xace_file (a_file: KI_CHARACTER_INPUT_STREAM)
			-- Read Xace file `a_file'.
			-- Put result in `last_system' if no error occurred.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			l_xace_parser: ET_XACE_SYSTEM_PARSER
			l_xace_error_handler: ET_XACE_DEFAULT_ERROR_HANDLER
			l_xace_variables: DS_HASH_TABLE [STRING, STRING]
			l_cursor: DS_HASH_TABLE_CURSOR [STRING, STRING]
		do
			last_system := Void
			create l_xace_error_handler.make_standard
			create l_xace_variables.make_map (100)
			l_xace_variables.set_key_equality_tester (string_equality_tester)
			if attached defined_variables as l_defined_variables then
				l_cursor := l_defined_variables.new_cursor
				from l_cursor.start until l_cursor.after loop
					l_xace_variables.force_last (l_cursor.item, l_cursor.key)
					l_cursor.forth
				end
			end
			create l_xace_parser.make_with_variables (l_xace_variables, l_xace_error_handler)
			l_xace_parser.parse_file (a_file)
			if l_xace_error_handler.has_error then
				has_error := True
			elseif not attached l_xace_parser.last_system as l_last_system then
				report_no_system_found_error (a_file.name)
			else
				l_last_system.activate_processors
				last_system := l_last_system
			end
		ensure
			has_error_if_void: last_system = Void implies has_error
		end

	parse_ecf_file (a_file: KI_CHARACTER_INPUT_STREAM)
			-- Read ECF file `a_file'.
			-- Put result in `last_system' if no error occurred.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			l_ecf_parser: ET_ECF_SYSTEM_PARSER
			l_ecf_error_handler: ET_ECF_ERROR_HANDLER
			l_cursor: DS_HASH_TABLE_CURSOR [STRING, STRING]
		do
			last_system := Void
			if attached defined_variables as l_defined_variables then
				l_cursor := l_defined_variables.new_cursor
				from l_cursor.start until l_cursor.after loop
					Execution_environment.set_variable_value (l_cursor.key, l_cursor.item)
					l_cursor.forth
				end
			end
			create l_ecf_error_handler.make_standard
			create l_ecf_parser.make (l_ecf_error_handler)
			l_ecf_parser.set_ise_version (ise_version)
			l_ecf_parser.parse_file (a_file)
			if l_ecf_error_handler.has_error then
				has_error := True
			elseif not attached l_ecf_parser.last_system as l_last_system then
				report_no_system_found_error (a_file.name)
			else
				l_last_system.activate_processors
				last_system := l_last_system
			end
		ensure
			has_error_if_void: last_system = Void implies has_error
		end

	parse_eiffel_file (a_file: KI_CHARACTER_INPUT_STREAM)
			-- Read Eiffel file `a_file' and keep track of it in
			-- newly created `last_system' if no error occurred.
			-- If there is not class filters, then add classes found
			-- in this file to `input_classes'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			l_system: ET_SYSTEM
			l_cluster: ET_XACE_CLUSTER
			l_eiffel_preparser: ET_EIFFEL_PREPARSER
			l_input_classes: like input_classes
		do
			last_system := Void
			create l_system.make ("gedoc_system")
			l_system.set_ise_version (ise_version)
			l_system.activate_processors
			create l_cluster.make ("gedoc_cluster", ".", l_system)
			if attached {ET_EIFFEL_PREPARSER} l_system.eiffel_preparser as l_system_eiffel_preparser then
				l_eiffel_preparser := l_system_eiffel_preparser
			else
				create l_eiffel_preparser.make
			end
			l_eiffel_preparser.preparse_file (a_file.name, l_cluster)
			if l_eiffel_preparser.error_handler.has_error then
				has_error := True
				l_system := Void
			elseif not attached class_filters as l_class_filters or else l_class_filters.is_empty then
				create l_input_classes.make (1)
				input_classes := l_input_classes
				l_system.classes_do_if (agent l_input_classes.force_last, agent {ET_CLASS}.is_in_group (l_cluster))
				if l_input_classes.is_empty then
					report_no_class_found_in_file_error (a_file.name)
					l_system := Void
				end
			end
			last_system := l_system
		ensure
			has_error_if_void: last_system = Void implies has_error
		end

feature {NONE} -- Processing

	prepare_system (a_system: ET_SYSTEM)
			-- Prepare `a_system' before being processed.
		require
			a_system_not_void: a_system /= Void
		local
			l_ast_factory: ET_DECORATED_AST_FACTORY
		do
			a_system.error_handler.set_ise
			a_system.set_ise_version (ise_version)
			a_system.set_unknown_builtin_reported (False)
			a_system.universes_do_all (agent {ET_UNIVERSE}.set_attachment_type_conformance_mode (False))
			a_system.universes_do_all (agent {ET_UNIVERSE}.set_target_type_attachment_mode (False))
			a_system.universes_do_all (agent {ET_UNIVERSE}.set_implicit_attachment_type_mark (tokens.implicit_detachable_type_mark))
			create l_ast_factory.make
			l_ast_factory.set_keep_all_breaks (True)
			a_system.set_ast_factory (l_ast_factory)
		end

	build_input_classes (a_system: ET_SYSTEM)
			-- Build `input_classes' using `class_filters' if not done yet.
			-- Leave `input_classes' Void if all classes in `a_system' shoud be processed.
		local
			l_last_wildcard: detachable STRING
			l_input_classes: like input_classes
		do
			if input_classes /= Void then
				-- Nothing to be done.
			elseif attached class_filters as l_class_filters and then not l_class_filters.is_empty then
				a_system.preparse_recursive
				create l_input_classes.make (500)
				input_classes := l_input_classes
				across l_class_filters as l_class_wildcards loop
					l_last_wildcard := l_class_wildcards.item.pattern
					a_system.add_classes_by_wildcarded_name_recursive (l_class_wildcards.item, l_input_classes)
				end
				l_input_classes.remove (a_system.none_type.base_class)
				if l_input_classes.is_empty and l_last_wildcard /= Void then
					report_no_class_matching_wildcard_error (l_last_wildcard)
				end
			end
		end

	process_system (a_system: ET_SYSTEM)
			-- Process `a_system'.
			-- Use `input_classes' as input classes if not Void.
			-- Otherwise use all classes in `a_system'.
		require
			a_system_not_void: a_system /= Void
		deferred
		end

	last_system: detachable ET_SYSTEM
			-- Last system parsed, if any

	input_classes: detachable DS_HASH_SET [ET_CLASS]
			-- Classes to be processed.
			-- Process all classes if Void

feature {NONE} -- Output

	class_output_directory (a_class: ET_CLASS): detachable STRING
			-- Where to generate files for `a_class';
			-- Void if this directory could not be determined
			-- (e.g. `output_directory' was not specified and
			-- `a_class' is in a .NET assembly).
		require
			a_class_not_void: a_class /= Void
		do
			if attached output_directory as l_output_directory then
				Result := l_output_directory
				if library_prefix_flag then
					Result := file_system.pathname (Result, universe_name (a_class.universe))
				end
			elseif a_class.is_in_cluster then
				Result := a_class.group.full_pathname
			end
		end

	universe_output_directory (a_universe: ET_UNIVERSE): detachable STRING
			-- Where to generate files for `a_universe'.
			-- Void if this directory could not be determined.
		require
			a_universe_not_void: a_universe /= Void
		do
			if attached output_directory as l_output_directory then
				Result := l_output_directory
				if library_prefix_flag then
					Result := file_system.pathname (Result, universe_name (a_universe))
				end
			end
		end

	universe_name (a_universe: ET_UNIVERSE): STRING
			-- Name of `a_universe'.
			-- Can be different of `a_universe.name' if two universes have the same name.
		require
			a_universe_not_void: a_universe /= Void
		local
			l_universe_names: like universe_names
			l_lower_name: STRING
			i: INTEGER
			l_names: DS_HASH_SET [STRING]
		do
			l_universe_names := universe_names
			if l_universe_names = Void then
				create l_universe_names.make_map (50)
				universe_names := l_universe_names
			end
			l_universe_names.search (a_universe)
			if l_universe_names.found then
				Result := l_universe_names.found_item
			else
				create l_names.make_equal (l_universe_names.count)
				l_names.extend_last (l_universe_names)
				l_lower_name := a_universe.lower_name
				from
					i := 1
					Result := l_lower_name
				until
					not l_names.has (Result)
				loop
					i := i + 1
					Result := l_lower_name + "_" + i.out
				end
				l_universe_names.force_last (Result, a_universe)
			end
		ensure
			universe_name_not_void: Result /= Void
			universe_name_not_empty: not Result.is_empty
		end

	is_file_overwritable (a_filename: STRING): BOOLEAN
			-- Is it allowed to write to file `a_filename'?
		require
			a_filename_not_void: a_filename /= Void
		do
			if force_flag then
				Result := True
			elseif not file_system.file_exists (a_filename) then
				Result := True
			elseif interactive_flag then
				std.output.put_string ("File '")
				std.output.put_string (a_filename)
				std.output.put_line ("' already exists. Overwrite it (y/n)?")
				std.input.read_line
				Result := std.input.last_string.starts_with ("y")
			end
		end

feature {NONE} -- Implementation

	universe_names: detachable DS_HASH_TABLE [STRING, ET_UNIVERSE]
			-- Unique name of universes, indexed by universe

feature -- Error handling

	error_handler: UT_ERROR_HANDLER
			-- Error handler

	has_error: BOOLEAN
			-- Have some errors been reported?

	report_error (a_error: UT_ERROR)
			-- Report `a_error'.
		require
			a_error_not_void: a_error /= Void
		do
			error_handler.report_error (a_error)
			has_error := True
		ensure
			has_error: has_error
		end

	report_cannot_read_error (a_filename: STRING)
			-- Report that `a_filename' cannot be
			-- opened in read mode.
		require
			a_filename_not_void: a_filename /= Void
		local
			l_error: UT_CANNOT_READ_FILE_ERROR
		do
			create l_error.make (a_filename)
			report_error (l_error)
		ensure
			has_error: has_error
		end

	report_cannot_write_error (a_filename: STRING)
			-- Report that `a_filename' cannot be
			-- opened in wrtie mode.
		require
			a_filename_not_void: a_filename /= Void
		local
			l_error: UT_CANNOT_WRITE_TO_FILE_ERROR
		do
			create l_error.make (a_filename)
			report_error (l_error)
		ensure
			has_error: has_error
		end

	report_no_system_found_error (a_filename: STRING)
			-- Report that no Eiffel system was found in file `a_filename'.
		require
			a_filename_not_void: a_filename /= Void
		local
			l_error: UT_MESSAGE
		do
			create l_error.make ("No Eiffel system found in file '" + a_filename + "'.")
			report_error (l_error)
		ensure
			has_error: has_error
		end

	report_file_already_exists_error (a_filename: STRING)
			-- Report that `a_filename' already exists an dwill not be overwritten.
		require
			a_filename_not_void: a_filename /= Void
		local
			l_error: UT_MESSAGE
		do
			create l_error.make ("File '" + a_filename + "' already exists. Not overwritten.")
			report_error (l_error)
		ensure
			has_error: has_error
		end

	report_no_output_directory_for_class_error (a_class: ET_CLASS)
			-- Report that it was not possible to find an output directory
			-- for `a_class'.
		require
			a_class_not_void: a_class /= Void
		local
			l_error: UT_MESSAGE
		do
			create l_error.make ("Cannot find an output directory for class '" + a_class.upper_name + "'. Option --output must be specified.")
			report_error (l_error)
		ensure
			has_error: has_error
		end

	report_no_class_found_in_file_error (a_filename: STRING)
			-- Report that no class could be found in file `a_filename'.
		require
			a_filename_not_void: a_filename /= Void
		local
			l_error: UT_MESSAGE
		do
			create l_error.make ("No class was found in file '" + a_filename + "'.")
			report_error (l_error)
		ensure
			has_error: has_error
		end

	report_no_class_matching_wildcard_error (a_wildcard: STRING)
			-- Report that no class matches `a_wildcard'.
		require
			a_wildcard_not_void: a_wildcard /= Void
		local
			l_error: UT_MESSAGE
		do
			create l_error.make ("No class matches wildcard '" + a_wildcard + "'.")
			report_error (l_error)
		ensure
			has_error: has_error
		end

invariant

	error_handler_not_void: error_handler /= Void
	input_filename_not_void: input_filename /= Void
	ise_version_not_void: ise_version /= Void
	class_filters_compiled: attached class_filters as l_class_filters implies l_class_filters.for_all (agent {LX_DFA_WILDCARD}.is_compiled)

end
