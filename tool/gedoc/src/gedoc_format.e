note

	description:

		"Gobo Eiffel Documentation Format"

	copyright: "Copyright (c) 2017-2021, Eric Bezault and others"
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

	make (a_input_filename: STRING; a_system_processor: like system_processor)
			-- Create a new documentation format with `a_input_filename'.
		require
			a_input_filename_not_void: a_input_filename /= Void
			a_system_processor_not_void: a_system_processor /= Void
		do
			input_filename := a_input_filename
			system_processor := a_system_processor
			ise_version := ise_latest
			input_classes := tokens.empty_classes
			create class_name_buffer.make (80)
			create universe_name_buffer.make (80)
			create filename_buffer.make (200)
			create concat_buffer.make (100)
			create interactive_mutex.make
		ensure
			input_filename_set: input_filename = a_input_filename
			system_processor_set: system_processor = a_system_processor
		end

	make_from_format (a_format: like Current; a_system_processor: like system_processor)
			-- Create a new documentation format using the settings of `a_format'.
		require
			a_format_not_void: a_format /= Void
			a_system_processor_not_void: a_system_processor /= Void
		do
			make (a_format.input_filename, a_system_processor)
			set_target_name (a_format.target_name)
			set_override_settings (a_format.override_settings)
			set_override_capabilities (a_format.override_capabilities)
			set_override_variables (a_format.override_variables)
			set_ise_version (a_format.ise_version)
			set_ecf_version (a_format.ecf_version)
			set_class_filters (a_format.class_filters)
			set_output_directory (a_format.output_directory)
			set_library_prefix_flag (a_format.library_prefix_flag)
			set_force_flag (a_format.force_flag)
			set_interactive_flag (a_format.interactive_flag)
			set_verbose_flag (a_format.verbose_flag)
			set_benchmark_flag (a_format.benchmark_flag)
			set_nested_benchmark_flag (a_format.nested_benchmark_flag)
			set_metrics_flag (a_format.metrics_flag)
			set_silent_flag (a_format.silent_flag)
			last_system := a_format.last_system
			input_classes := a_format.input_classes
		ensure
			input_filename_set: input_filename = a_format.input_filename
			system_processor_set: system_processor = a_system_processor
			target_name_set: target_name = a_format.target_name
			override_settings_set: override_settings = a_format.override_settings
			override_capabilities_set: override_capabilities = a_format.override_capabilities
			override_variables_set: override_variables = a_format.override_variables
			ise_version_set: ise_version = a_format.ise_version
			ecf_version_set: ecf_version = a_format.ecf_version
			class_fiters_set: class_filters = a_format.class_filters
			output_directory_set: output_directory = a_format.output_directory
			library_prefix_flag_set: library_prefix_flag = a_format.library_prefix_flag
			force_flag_set: force_flag = a_format.force_flag
			interactive_flag_set: interactive_flag = a_format.interactive_flag
			verbose_flag_set: verbose_flag = a_format.verbose_flag
			benchmark_flag_set: benchmark_flag = a_format.benchmark_flag
			metrics_flag: metrics_flag =  a_format.metrics_flag
			silent_flag_set: silent_flag = a_format.silent_flag
			last_system_set: last_system = a_format.last_system
			input_classes_set: input_classes = a_format.input_classes
		end

feature -- Execution

	execute
			-- Execute documentation format.
		local
			dt1: detachable DT_DATE_TIME
		do
			system_processor.set_benchmark_shown (benchmark_flag and not silent_flag)
			dt1 := system_processor.benchmark_start_time
			parse_input_file (input_filename)
			if not has_error and attached last_system as l_last_system then
				prepare_system (l_last_system)
				if not has_error then
					build_input_classes (l_last_system)
				end
				if not has_error then
					process_system (l_last_system)
				end
				if system_processor.error_handler.has_error then
					has_error := True
				end
			end
			system_processor.record_end_time (dt1, "Total Time")
		end

feature -- Access

	input_filename: STRING
			-- Name of the input file.
			-- It can be an ECF file or an Eiffel class file.

	target_name: detachable STRING
			-- Name of target to be used in ECF file.
			-- Use last target in ECF file if not specified.

	override_settings: detachable ET_ECF_SETTINGS
			-- Settings overriding those specified for the selected ECF target

	override_capabilities: detachable ET_ECF_CAPABILITIES
			-- Capabilities overriding those specified for the selected ECF target

	override_variables: detachable ET_ECF_VARIABLES
			-- Variables overriding those specified for the selected ECF target

	ise_version: UT_VERSION
			-- ISE version, whose semantics should be
			-- used by the Eiffel code analysis process

	ecf_version: detachable UT_VERSION
			-- ECF version to be used when converting ECF files

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

	verbose_flag: BOOLEAN
			-- Should detailed informative messages be displayed?

	benchmark_flag: BOOLEAN
			-- Should benchmark information be displayed?

	nested_benchmark_flag: BOOLEAN
			-- Should nested benchmark information be displayed?

	metrics_flag: BOOLEAN
			-- Should metrics information be displayed?

	silent_flag: BOOLEAN
			-- Should no informative messages be displayed?

	system_processor: ET_SYSTEM_PROCESSOR
			-- System processor currently used

feature -- Setting

	set_target_name (a_target_name: like target_name)
			-- Set `target_name' to `a_target_name'.
		do
			target_name := a_target_name
		ensure
			target_name_set: target_name = a_target_name
		end

	set_override_settings (a_settings: like override_settings)
			-- Set `override_settings' to `a_settings'.
		do
			override_settings := a_settings
		ensure
			override_settings_set: override_settings = a_settings
		end

	set_override_capabilities (a_capabilities: like override_capabilities)
			-- Set `override_capabilities' to `a_capabilities'.
		do
			override_capabilities := a_capabilities
		ensure
			override_capabilities_set: override_capabilities = a_capabilities
		end

	set_override_variables (a_variables: like override_variables)
			-- Set `override_variables' to `a_variables'.
		do
			override_variables := a_variables
		ensure
			override_variables_set: override_variables = a_variables
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

	set_ecf_version (a_version: like ecf_version)
			-- Set `ecf_version' to `a_version'.
		require
			a_version_not_void: a_version /= Void
		do
			ecf_version := a_version
		ensure
			ecf_version_set: ecf_version = a_version
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

	set_verbose_flag (b: BOOLEAN)
			-- Set `verbose_flag' to `b'.
		do
			verbose_flag := b
		ensure
			verbose_flag_set: verbose_flag = b
		end

	set_benchmark_flag (b: BOOLEAN)
			-- Set `benchmark_flag' to `b'.
		do
			benchmark_flag := b
		ensure
			benchmark_flag_set: benchmark_flag = b
		end

	set_nested_benchmark_flag (b: BOOLEAN)
			-- Set `nested_benchmark_flag' to `b'.
		do
			nested_benchmark_flag := b
		ensure
			nested_benchmark_flag_set: nested_benchmark_flag = b
		end

	set_metrics_flag (b: BOOLEAN)
			-- Set `metrics_flag' to `b'.
		do
			metrics_flag := b
		ensure
			metrics_flag_set: metrics_flag = b
		end

	set_silent_flag (b: BOOLEAN)
			-- Set `silent_flag' to `b'.
		do
			silent_flag := b
		ensure
			silent_flag_set: silent_flag = b
		end

feature -- Status report

	is_output_directory_required: BOOLEAN
			-- Is `output_directory' required by the current format?
		do
			Result := False
		end

feature {NONE} -- Eiffel config file parsing

	parse_input_file (a_input_filename: STRING)
			-- Read `a_input_filename'. It can be
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
				if nb > 2 and then STRING_.same_string (a_input_filename.substring (nb - 1, nb), ".e") then
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

	parse_ecf_file (a_file: KI_CHARACTER_INPUT_STREAM)
			-- Read ECF file `a_file'.
			-- Put result in `last_system' if no error occurred.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			l_ecf_parser: ET_ECF_SYSTEM_PARSER
			l_ecf_error_handler: ET_ECF_ERROR_HANDLER
		do
			last_system := Void
			if silent_flag then
				create l_ecf_error_handler.make_null
			else
				create l_ecf_error_handler.make_standard
			end
			create l_ecf_parser.make (l_ecf_error_handler)
			l_ecf_parser.set_ise_version (ise_version)
			l_ecf_parser.set_override_settings (override_settings)
			l_ecf_parser.set_override_capabilities (override_capabilities)
			l_ecf_parser.set_override_variables (override_variables)
			l_ecf_parser.parse_file (a_file, target_name)
			if l_ecf_error_handler.has_error then
				has_error := True
			elseif not attached l_ecf_parser.last_system as l_last_system then
				report_no_system_found_error (a_file.name)
			else
				last_system := l_last_system
			end
		ensure
			has_error_if_void: last_system = Void implies has_error
		end

	parse_eiffel_file (a_file: KI_CHARACTER_INPUT_STREAM)
			-- Read Eiffel file `a_file' and keep track of it in
			-- newly created `last_system' if no error occurred.
			-- If there is no class filters, then add classes found
			-- in this file to `input_classes'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			l_system: ET_SYSTEM
			l_cluster: ET_CLUSTER
			l_eiffel_preparser: ET_EIFFEL_PREPARSER
			l_input_classes: like input_classes
		do
			last_system := Void
			create l_system.make ("gedoc_system")
			create l_cluster.make ("gedoc_cluster", ".", l_system)
			if attached {ET_EIFFEL_PREPARSER} system_processor.eiffel_preparser as l_system_eiffel_preparser then
				l_eiffel_preparser := l_system_eiffel_preparser
			else
				create l_eiffel_preparser.make (system_processor)
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
				else
					input_classes := l_input_classes
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
		do
			system_processor.error_handler.set_ise
			system_processor.error_handler.set_verbose (verbose_flag)
			system_processor.set_benchmark_shown (benchmark_flag and not silent_flag)
			system_processor.set_nested_benchmark_shown (nested_benchmark_flag and benchmark_flag and not silent_flag)
			system_processor.set_metrics_shown (metrics_flag and not silent_flag)
			system_processor.set_ise_version (ise_version)
			system_processor.set_unknown_builtin_reported (False)
			a_system.set_unique_universe_names
			a_system.set_attachment_type_conformance_mode (False)
			a_system.set_target_type_attachment_mode (False)
			set_ast_factory
			if input_classes.is_empty then
					-- If `input_classes' is not empty, it means that we got them
					-- from an Eiffel file as input (`parse_eiffel_file'). In that
					-- case we do not run Degree 6 to get the list of classes.
				system_processor.compile_degree_6 (a_system)
			end
		end

	set_ast_factory
			-- Configure the AST factory as needed.
		local
			l_ast_factory: ET_DECORATED_AST_FACTORY
		do
			create l_ast_factory.make
			l_ast_factory.set_keep_all_comments (True)
			system_processor.set_ast_factory (l_ast_factory)
		end

	build_input_classes (a_system: ET_SYSTEM)
			-- Build `input_classes' using `class_filters' if not done yet.
		local
			l_last_wildcard: detachable READABLE_STRING_GENERAL
			l_input_classes: DS_HASH_SET [ET_CLASS]
		do
			if not input_classes.is_empty then
				-- Nothing to be done.
			elseif attached class_filters as l_class_filters and then not l_class_filters.is_empty then
				create l_input_classes.make (500)
				across l_class_filters as i_class_wildcard loop
					l_last_wildcard := i_class_wildcard.pattern
					a_system.add_classes_by_wildcarded_name_recursive (i_class_wildcard, l_input_classes)
				end
				l_input_classes.remove (a_system.none_type.base_class)
				if l_input_classes.is_empty and l_last_wildcard /= Void then
					report_no_class_matching_wildcard_error (l_last_wildcard)
				else
					create input_classes.make_from_linear (l_input_classes)
				end
			else
				create input_classes.make (a_system.class_count_recursive)
				a_system.classes_do_unless_recursive (agent input_classes.force_last, agent {ET_CLASS}.is_none)
			end
		end

	process_system (a_system: ET_SYSTEM)
			-- Process `input_classes' from `a_system'.
		require
			a_system_not_void: a_system /= Void
		deferred
		end

feature {GEDOC_FORMAT} -- Processing

	last_system: detachable ET_SYSTEM
			-- Last system parsed, if any

	input_classes: DS_ARRAYED_LIST [ET_CLASS]
			-- Classes to be processed

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
					Result := file_system.pathname (Result, universe_lower_name (a_class.universe))
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
					Result := file_system.pathname (Result, universe_lower_name (a_universe))
				end
			end
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
				interactive_mutex.lock
				std.output.put_string ("File '")
				std.output.put_string (a_filename)
				std.output.put_line ("' already exists. Overwrite it (y/n)?")
				std.input.read_line
				Result := std.input.last_string.starts_with ("y")
				interactive_mutex.unlock
			end
		end

	create_class_output_directories (a_classes: DS_ARRAYED_LIST [ET_CLASS])
			-- Create output directories for all classes in `a_classes'.
			-- It's useful to create them beforehand in a multi-threaded
			-- environment, to avoid having two threads trying to create
			-- the same directory at the same time.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		local
			i, nb: INTEGER
		do
			if output_directory /= Void then
				nb := a_classes.count
				from i := 1 until i > nb loop
					if attached class_output_directory (a_classes.item (i)) as l_directory then
						file_system.recursive_create_directory (l_directory)
					end
					i := i + 1
				end
			end
		end

feature {NONE} -- Implementation

	new_output_file (a_filename: STRING): KL_BUFFERED_TEXT_OUTPUT_FILE
			-- File named `a_filename'
			--
			-- Note that this routine always returns the same object.
		require
			a_filename_not_void: a_filename /= Void
		do
			if attached cached_output_file as l_output_file then
				Result := l_output_file
				Result.reset (a_filename)
			else
				create Result.make_with_buffer_size (a_filename, 1_000_000)
				cached_output_file := Result
			end
		ensure
			new_output_file_not_void: Result /= Void
		end

	cached_output_file: detachable KL_BUFFERED_TEXT_OUTPUT_FILE
			-- Cached file object used to write generated HTML text

	class_lower_name (a_class: ET_CLASS): STRING
			-- Name of `a_class' in lower-case
			--
			-- Note that this routine always returns the same object.
		do
			Result := class_name_buffer
			Result.wipe_out
			Result.append_string (a_class.name.name)
			Result.to_lower
		ensure
			class_lower_name_not_void: Result /= Void
			definition: Result ~ a_class.lower_name
		end

	class_name_buffer: STRING
			-- Buffer for class names

	universe_lower_name (a_universe: ET_UNIVERSE): STRING
			-- Name of `a_universe' in lower-case
			--
			-- Note that this routine always returns the same object.
		do
			Result := universe_name_buffer
			Result.wipe_out
			Result.append_string (a_universe.name)
			Result.to_lower
		ensure
			universe_lower_name_not_void: Result /= Void
			definition: Result ~ a_universe.lower_name
		end

	universe_name_buffer: STRING
			-- Buffer for universe names

	filename (a_dirname, a_pathname: STRING): STRING
			-- Pathname made up of relative pathname
			-- `a_pathname' in directory `a_dirname'
			-- (`a_dirname' and `a_pathname' should follow the pathname convention
			-- of `file_system.'. The result also follows this pathname convention.)
			--
			-- Note that this routine always returns the same object.
		require
			a_dirname_not_void: a_dirname /= Void
			a_pathname_not_void: a_pathname /= Void
			a_pathname_relative: file_system.is_relative_pathname (a_pathname)
		do
			Result := filename_buffer
			Result.wipe_out
			file_system.append_pathname_to_string (a_dirname, a_pathname, Result)
		ensure
			pathname_not_void: Result /= Void
			same_relative: file_system.is_relative_pathname (Result) = file_system.is_relative_pathname (a_dirname)
			same_absolute: file_system.is_absolute_pathname (Result) = file_system.is_absolute_pathname (a_dirname)
		end

	filename_buffer: STRING
			-- Buffer for filenames

	concat (a_first_part, a_second_part: STRING): STRING
			-- String made up of `a_first_part' and `a_second_part'
			--
			-- Note that this routine always returns the same object.
		require
			a_first_part_not_void: a_first_part /= Void
			a_second_part_not_void: a_second_part /= Void
		do
			Result := concat_buffer
			Result.wipe_out
			Result.append_string (a_first_part)
			Result.append_string (a_second_part)
		ensure
			concat_not_void: Result /= Void
			definition: Result ~ a_first_part + a_second_part
		end

	concat_buffer: STRING
			-- Buffer for concat

feature -- Error handling

	error_handler: UT_ERROR_HANDLER
			-- Error handler
		do
			Result := system_processor.error_handler
		ensure
			error_handler_not_void: Result /= Void
		end

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
			-- opened in write mode.
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

	report_no_class_matching_wildcard_error (a_wildcard: READABLE_STRING_GENERAL)
			-- Report that no class matches `a_wildcard'.
		require
			a_wildcard_not_void: a_wildcard /= Void
		local
			l_error: UT_MESSAGE
			l_message: STRING
		do
			create l_message.make (50)
			l_message.append_string_general ("No class matches wildcard '")
			l_message.append_string_general (a_wildcard)
			l_message.append_string_general ("'.")
			create l_error.make (l_message)
			report_error (l_error)
		ensure
			has_error: has_error
		end

	report_target_not_found_error (a_target_name: STRING)
			-- Report that no ECF target `a_target_name' was found.
		require
			a_target_name_not_void: a_target_name /= Void
		local
			l_error: UT_MESSAGE
		do
			create l_error.make ("Target '" + a_target_name + "' not found.")
			report_error (l_error)
		ensure
			has_error: has_error
		end

feature {NONE} -- Concurrency

	interactive_mutex: MUTEX
			-- Mutex to be used in interactive mode in a multi-threaded environment

invariant

	system_processor_not_void: system_processor /= Void
	input_filename_not_void: input_filename /= Void
	ise_version_not_void: ise_version /= Void
	class_filters_compiled: attached class_filters as l_class_filters implies l_class_filters.for_all (agent {LX_DFA_WILDCARD}.is_compiled)
	input_classes_not_void: input_classes /= Void
	no_void_imput_class: not input_classes.has_void
	class_name_buffer_not_void: class_name_buffer /= Void
	universe_name_buffer_not_void: universe_name_buffer /= Void
	filename_buffer_not_void: filename_buffer /= Void
	concat_buffer_not_void: concat_buffer /= Void
	interactive_mutex_not_void: interactive_mutex /= Void

end
