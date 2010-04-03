indexing

	description:

		"Gobo Eiffel Lint"

	copyright: "Copyright (c) 1999-2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GELINT

inherit

	GELINT_VERSION

	KL_SHARED_EXCEPTIONS
	KL_SHARED_ARGUMENTS
	KL_SHARED_EXECUTION_ENVIRONMENT
	KL_SHARED_STANDARD_FILES

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

	UT_SHARED_ISE_VERSIONS
		export {NONE} all end

	ET_SHARED_ISE_VARIABLES
		export {NONE} all end

	UT_SHARED_ECMA_VERSIONS
		export {NONE} all end

create

	execute

feature -- Execution

	execute is
			-- Start 'gelint' execution.
		local
			a_filename: STRING
			a_file: KL_TEXT_INPUT_FILE
			i, nb: INTEGER
			arg: STRING
			a_ise_version: STRING
			a_ise_regexp: RX_PCRE_REGULAR_EXPRESSION
		do
			Arguments.set_program_name ("gelint")
				-- For compatibility with ISE's tools, define the environment
				-- variable "$ISE_LIBRARY" to $ISE_EIFFEL" if not set yet.
			ise_variables.set_ise_library_variable
			create error_handler.make_standard
			is_flat_dbc := True
			nb := Arguments.argument_count
			from i := 1 until i > nb loop
				arg := Arguments.argument (i)
				if arg.is_equal ("-V") or arg.is_equal ("--version") then
					report_version_number
					Exceptions.die (0)
				elseif arg.is_equal ("-h") or arg.is_equal ("-?") or arg.is_equal ("--help") then
					report_usage_message
					Exceptions.die (0)
				elseif arg.count > 9 and then arg.substring (1, 9).is_equal ("--define=") then
					defined_variables := arg.substring (10, arg.count)
				elseif arg.is_equal ("--verbose") then
					is_verbose := True
				elseif arg.is_equal ("--flat") then
					is_flat := True
				elseif arg.is_equal ("--noflatdbc") then
					is_flat_dbc := False
				elseif arg.is_equal ("--catcall") then
					is_catcall := True
				elseif arg.is_equal ("--qat") then
					qualified_anchored_types_enabled := True
				elseif arg.is_equal ("--silent") then
					is_silent := True
				elseif arg.is_equal ("--ecma") then
					ecma_version := ecma_367_latest
				elseif arg.is_equal ("--ise") then
					ise_version := ise_latest
				elseif arg.count > 6 and then arg.substring (1, 6).is_equal ("--ise=") then
					a_ise_version := arg.substring (7, arg.count)
					create a_ise_regexp.make
					a_ise_regexp.compile ("([0-9]+)(\.([0-9]+))?(\.([0-9]+))?(\.([0-9]+))?")
					if a_ise_regexp.recognizes (a_ise_version) then
						inspect a_ise_regexp.match_count
						when 2 then
							create ise_version.make_major (a_ise_regexp.captured_substring (1).to_integer)
						when 4 then
							create ise_version.make_major_minor (a_ise_regexp.captured_substring (1).to_integer, a_ise_regexp.captured_substring (3).to_integer)
						when 6 then
							create ise_version.make (a_ise_regexp.captured_substring (1).to_integer, a_ise_regexp.captured_substring (3).to_integer, a_ise_regexp.captured_substring (5).to_integer, 0)
						when 8 then
							create ise_version.make (a_ise_regexp.captured_substring (1).to_integer, a_ise_regexp.captured_substring (3).to_integer, a_ise_regexp.captured_substring (5).to_integer, a_ise_regexp.captured_substring (7).to_integer)
						else
							report_usage_message
							Exceptions.die (1)
						end
					else
						report_usage_message
						Exceptions.die (1)
					end
				elseif i = nb then
					a_filename := arg
				else
					report_usage_message
					Exceptions.die (1)
				end
				i := i + 1
			end
			if a_filename = Void then
				report_usage_message
				Exceptions.die (1)
			else
				create a_file.make (a_filename)
				a_file.open_read
				if a_file.is_open_read then
					last_system := Void
					nb := a_filename.count
					if nb > 5 and then a_filename.substring (nb - 4, nb).is_equal (".xace") then
						parse_xace_file (a_file)
					elseif nb > 4 and then a_filename.substring (nb - 3, nb).is_equal (".ecf") then
						parse_ecf_file (a_file)
					else
						parse_ace_file (a_file)
					end
					a_file.close
					if last_system /= Void then
						process_system (last_system)
						debug ("stop")
							std.output.put_line ("Press Enter...")
							io.read_line
						end
						if last_system.error_handler.has_eiffel_error then
							Exceptions.die (2)
						elseif last_system.error_handler.has_internal_error then
							Exceptions.die (5)
						end
					else
						Exceptions.die (3)
					end
				else
					report_cannot_read_error (a_filename)
					Exceptions.die (1)
				end
			end
		rescue
			Exceptions.die (4)
		end

feature -- Status report

	defined_variables: STRING
	is_verbose: BOOLEAN
	is_flat: BOOLEAN
	is_flat_dbc: BOOLEAN
	is_catcall: BOOLEAN
	ecma_version: UT_VERSION
	ise_version: UT_VERSION
	is_silent: BOOLEAN
			-- Command-line options

	qualified_anchored_types_enabled: BOOLEAN
			-- Are Qualified Anchored Types allowed?

feature -- Access

	error_handler: UT_ERROR_HANDLER
			-- Error handler

	last_system: ET_SYSTEM
			-- Last system parsed, if any

feature {NONE} -- Eiffel config file parsing

	parse_ace_file (a_file: KI_CHARACTER_INPUT_STREAM) is
			-- Read Ace file `a_file'.
			-- Put result in `last_system' if no error occurred.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			l_lace_parser: ET_LACE_PARSER
			l_lace_error_handler: ET_LACE_ERROR_HANDLER
		do
			last_system := Void
			create l_lace_error_handler.make_standard
			create l_lace_parser.make (l_lace_error_handler)
			l_lace_parser.parse_file (a_file)
			if not l_lace_parser.syntax_error then
				last_system := l_lace_parser.last_system
			end
		end

	parse_xace_file (a_file: KI_CHARACTER_INPUT_STREAM) is
			-- Read Xace file `a_file'.
			-- Put result in `last_system' if no error occurred.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			l_xace_parser: ET_XACE_SYSTEM_PARSER
			l_xace_error_handler: ET_XACE_DEFAULT_ERROR_HANDLER
			l_xace_variables: DS_HASH_TABLE [STRING, STRING]
			l_splitter: ST_SPLITTER
			l_cursor: DS_LIST_CURSOR [STRING]
			l_definition: STRING
			l_index: INTEGER
			gobo_eiffel: STRING
		do
			last_system := Void
			create l_xace_error_handler.make_standard
			create l_xace_variables.make_map (100)
			l_xace_variables.set_key_equality_tester (string_equality_tester)
			gobo_eiffel := Execution_environment.variable_value ("GOBO_EIFFEL")
			if gobo_eiffel /= Void then
				l_xace_variables.force_last (gobo_eiffel, "GOBO_EIFFEL")
			else
				l_xace_variables.force_last ("ge", "GOBO_EIFFEL")
			end
			if defined_variables /= Void then
				create l_splitter.make
				l_cursor := l_splitter.split (defined_variables).new_cursor
				from l_cursor.start until l_cursor.after loop
					l_definition := l_cursor.item
					if l_definition.count > 0 then
						l_index := l_definition.index_of ('=', 1)
						if l_index = 0 then
							l_xace_variables.force_last ("", l_definition)
						elseif l_index = l_definition.count then
							l_xace_variables.force_last ("", l_definition.substring (1, l_index - 1))
						elseif l_index /= 1 then
							l_xace_variables.force_last (l_definition.substring (l_index + 1, l_definition.count), l_definition.substring (1, l_index - 1))
						end
					end
					l_cursor.forth
				end
			end
			create l_xace_parser.make_with_variables (l_xace_variables, l_xace_error_handler)
			l_xace_parser.parse_file (a_file)
			if not l_xace_error_handler.has_error then
				last_system := l_xace_parser.last_system
			end
		end

	parse_ecf_file (a_file: KI_CHARACTER_INPUT_STREAM) is
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
			create l_ecf_error_handler.make_standard
			create l_ecf_parser.make (l_ecf_error_handler)
			if ise_version /= Void then
				l_ecf_parser.set_ise_version (ise_version)
			end
			l_ecf_parser.parse_file (a_file)
			if not l_ecf_error_handler.has_error then
				last_system := l_ecf_parser.last_system
			end
		end

feature {NONE} -- Processing

	process_system (a_system: ET_SYSTEM) is
			-- Process `a_system'.
		require
			a_system_not_void: a_system /= Void
		local
			a_dynamic_system: ET_DYNAMIC_SYSTEM
			a_builder: ET_DYNAMIC_TYPE_SET_BUILDER
		do
--			a_system.error_handler.set_compilers
			a_system.error_handler.set_ise
			a_system.error_handler.set_verbose (is_verbose)
			a_system.error_handler.set_benchmark_shown (not is_silent or is_verbose)
			if ise_version = Void then
				ise_version := ise_latest
			end
			a_system.set_ise_version (ise_version)
			a_system.set_ecma_version (ecma_version)
			a_system.set_flat_mode (is_flat)
			a_system.set_flat_dbc_mode (is_flat_dbc)
			a_system.set_unknown_builtin_reported (False)
			a_system.set_qualified_anchored_types_enabled (qualified_anchored_types_enabled)
			if is_catcall then
				create a_dynamic_system.make (a_system)
				a_dynamic_system.set_catcall_error_mode (True)
				create {ET_DYNAMIC_PULL_TYPE_SET_BUILDER} a_builder.make (a_dynamic_system)
				a_dynamic_system.set_dynamic_type_set_builder (a_builder)
				a_dynamic_system.compile
			else
				a_system.set_providers_enabled (True)
				a_system.set_cluster_dependence_enabled (True)
				a_system.set_use_cluster_dependence_pathnames (True)
				a_system.compile
			end
		end

feature -- Error handling

	report_cannot_read_error (a_filename: STRING) is
			-- Report that `a_filename' cannot be
			-- opened in read mode.
		require
			a_filename_not_void: a_filename /= Void
		local
			an_error: UT_CANNOT_READ_FILE_ERROR
		do
			create an_error.make (a_filename)
			error_handler.report_error (an_error)
		end

	report_usage_message is
			-- Report usage message.
		do
			error_handler.report_info (Usage_message)
		end

	report_version_number is
			-- Report version number.
		local
			a_message: UT_VERSION_NUMBER
		do
			create a_message.make (Version_number)
			error_handler.report_info (a_message)
		end

	Usage_message: UT_USAGE_MESSAGE is
			-- Gelint usage message.
		once
			create Result.make ("[--ecma][--ise[=major[.minor[.revision[.build]]]]][--define=variables]%N%
				%%T[--flat][--noflatdbc][--catcall][--qat][--silent][--verbose] ace_filename")
		ensure
			usage_message_not_void: Result /= Void
		end

invariant

	error_handler_not_void: error_handler /= Void

end
