indexing

	description:

		"Gobo Eiffel Lint"

	copyright: "Copyright (c) 1999-2005, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
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

create

	execute

feature -- Execution

	execute is
			-- Start 'gelint' execution.
		local
			a_filename: STRING
			a_file: KL_TEXT_INPUT_FILE
			a_lace_parser: ET_LACE_PARSER
			a_lace_error_handler: ET_LACE_ERROR_HANDLER
			an_xace_parser: ET_XACE_UNIVERSE_PARSER
			an_xace_error_handler: ET_XACE_DEFAULT_ERROR_HANDLER
			an_xace_variables: DS_HASH_TABLE [STRING, STRING]
			a_splitter: ST_SPLITTER
			a_cursor: DS_LIST_CURSOR [STRING]
			a_definition: STRING
			an_index: INTEGER
			gobo_eiffel: STRING
			a_universe: ET_UNIVERSE
			i, nb: INTEGER
			arg: STRING
		do
			Arguments.set_program_name ("gelint")
			create error_handler.make_standard
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
				elseif arg.is_equal ("--cat") then
					is_cat := True
				elseif arg.is_equal ("--no_output") then
					no_output := True
				elseif arg.is_equal ("--void") then
					void_feature := True
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
					nb := a_filename.count
					if nb > 5 and then a_filename.substring (nb - 4, nb).is_equal (".xace") then
						create an_xace_error_handler.make_standard
						create an_xace_variables.make_map (100)
						an_xace_variables.set_key_equality_tester (string_equality_tester)
						gobo_eiffel := Execution_environment.variable_value ("GOBO_EIFFEL")
						if gobo_eiffel /= Void then
							an_xace_variables.force_last (gobo_eiffel, "GOBO_EIFFEL")
						end
						if defined_variables /= Void then
							create a_splitter.make
							a_cursor := a_splitter.split (defined_variables).new_cursor
							from a_cursor.start until a_cursor.after loop
								a_definition := a_cursor.item
								if a_definition.count > 0 then
									an_index := a_definition.index_of ('=', 1)
									if an_index = 0 then
										an_xace_variables.force_last ("", a_definition)
									elseif an_index = a_definition.count then
										an_xace_variables.force_last ("", a_definition.substring (1, an_index - 1))
									elseif an_index /= 1 then
										an_xace_variables.force_last (a_definition.substring (an_index + 1 ,a_definition.count), a_definition.substring (1, an_index - 1))
									end
								end
								a_cursor.forth
							end
						end
						create an_xace_parser.make_with_variables (an_xace_variables, an_xace_error_handler)
						an_xace_parser.parse_file (a_file)
						a_file.close
						if not an_xace_error_handler.has_error then
							a_universe := an_xace_parser.last_universe
						end
					else
						create a_lace_error_handler.make_standard
						create a_lace_parser.make (a_lace_error_handler)
						a_lace_parser.parse_file (a_file)
						a_file.close
						if not a_lace_parser.syntax_error then
							a_universe := a_lace_parser.last_universe
						end
					end
					if a_universe /= Void then
						process_universe (a_universe)
						debug ("stop")
							std.output.put_line ("Press Enter...")
							io.read_line
						end
						if a_universe.error_handler.has_eiffel_error then
							Exceptions.die (2)
						elseif a_universe.error_handler.has_internal_error then
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
	is_cat: BOOLEAN
	no_output: BOOLEAN
	void_feature: BOOLEAN
			-- Command-line options

feature -- Access

	error_handler: UT_ERROR_HANDLER
			-- Error handler

feature {NONE} -- Processing

	process_universe (a_universe: ET_UNIVERSE) is
			-- Process `a_universe'.
		require
			a_universe_not_void: a_universe /= Void
		local
			a_null_error_handler: ET_NULL_ERROR_HANDLER
			a_system: ET_SYSTEM
			a_builder: ET_DYNAMIC_TYPE_SET_BUILDER
		do
			if no_output then
				create a_null_error_handler.make_standard
				a_universe.set_error_handler (a_null_error_handler)
			end
--			a_universe.error_handler.set_compilers
			a_universe.error_handler.set_ise
			a_universe.set_ise (True)
			if not is_verbose then
			end
			a_universe.set_use_assign_keyword (True)
			a_universe.set_use_attribute_keyword (False)
			a_universe.set_use_convert_keyword (True)
			a_universe.set_use_create_keyword (True)
			a_universe.set_use_recast_keyword (False)
			a_universe.set_use_reference_keyword (True)
			if void_feature then
				a_universe.set_use_void_keyword (False)
			else
				a_universe.set_use_void_keyword (True)
			end
			if is_cat then
				create a_system.make (a_universe)
				create {ET_DYNAMIC_PULL_TYPE_SET_BUILDER} a_builder.make (a_system)
				a_system.set_dynamic_type_set_builder (a_builder)
				a_system.compile
			else
				a_universe.set_providers_enabled (True)
				a_universe.set_cluster_dependence_enabled (True)
				a_universe.compile (is_flat)
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
			-- Gepp usage message.
		once
			create Result.make ("[--verbose][--define=variables][--void][--flat][--cat] ace_filename")
		ensure
			usage_message_not_void: Result /= Void
		end

invariant

	error_handler_not_void: error_handler /= Void

end
