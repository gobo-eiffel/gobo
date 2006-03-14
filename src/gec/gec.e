indexing

	description:

		"Gobo Eiffel Compiler"

	copyright: "Copyright (c) 2005-2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEC

inherit

	GEC_VERSION

	KL_SHARED_EXCEPTIONS
	KL_SHARED_ARGUMENTS
	KL_SHARED_EXECUTION_ENVIRONMENT
	KL_SHARED_STANDARD_FILES
	KL_SHARED_OPERATING_SYSTEM
	KL_SHARED_FILE_SYSTEM
	KL_IMPORTED_STRING_ROUTINES
	UT_SHARED_TEMPLATE_EXPANDER

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

create

	execute

feature -- Execution

	execute is
			-- Start 'gec' execution.
		local
			a_filename: STRING
			a_file: KL_TEXT_INPUT_FILE
			a_lace_parser: ET_LACE_PARSER
			a_lace_error_handler: ET_LACE_ERROR_HANDLER
--			an_xace_parser: ET_XACE_UNIVERSE_PARSER
--			an_xace_error_handler: ET_XACE_DEFAULT_ERROR_HANDLER
--			an_xace_variables: DS_HASH_TABLE [STRING, STRING]
--			a_splitter: ST_SPLITTER
--			a_cursor: DS_LIST_CURSOR [STRING]
--			a_definition: STRING
--			an_index: INTEGER
--			gobo_eiffel: STRING
			a_universe: ET_UNIVERSE
			i, nb: INTEGER
			arg: STRING
		do
			Arguments.set_program_name ("gec")
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
				elseif arg.is_equal ("--silent") then
					is_silent := True
				elseif arg.is_equal ("--verbose") then
					is_verbose := True
				elseif arg.is_equal ("--no_cc") then
					no_c_compile := True
				elseif arg.is_equal ("--finalize") then
					is_finalize := True
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
--					if nb > 5 and then a_filename.substring (nb - 4, nb).is_equal (".xace") then
--						create an_xace_error_handler.make_standard
--						create an_xace_variables.make_map (100)
--						an_xace_variables.set_key_equality_tester (string_equality_tester)
--						gobo_eiffel := Execution_environment.variable_value ("GOBO_EIFFEL")
--						if gobo_eiffel /= Void then
--							an_xace_variables.force_last (gobo_eiffel, "GOBO_EIFFEL")
--						end
--						if defined_variables /= Void then
--							create a_splitter.make
--							a_cursor := a_splitter.split (defined_variables).new_cursor
--							from a_cursor.start until a_cursor.after loop
--								a_definition := a_cursor.item
--								if a_definition.count > 0 then
--									an_index := a_definition.index_of ('=', 1)
--									if an_index = 0 then
--										an_xace_variables.force_last ("", a_definition)
--									elseif an_index = a_definition.count then
--										an_xace_variables.force_last ("", a_definition.substring (1, an_index - 1))
--									elseif an_index /= 1 then
--										an_xace_variables.force_last (a_definition.substring (an_index + 1 ,a_definition.count), a_definition.substring (1, an_index - 1))
--									end
--								end
--								a_cursor.forth
--							end
--						end
--						create an_xace_parser.make_with_variables (an_xace_variables, an_xace_error_handler)
--						an_xace_parser.parse_file (a_file)
--						a_file.close
--						if not an_xace_error_handler.has_error then
--							a_universe := an_xace_parser.last_universe
--						end
--					else
						create a_lace_error_handler.make_standard
						create a_lace_parser.make (a_lace_error_handler)
						a_lace_parser.parse_file (a_file)
						a_file.close
						if not a_lace_parser.syntax_error then
							a_universe := a_lace_parser.last_universe
						end
--					end
					if a_universe /= Void then
						process_universe (a_universe)
						debug ("stop")
							std.output.put_line ("Press Enter...")
							std.input.read_character
						end
						if a_universe.error_handler.has_error then
							Exceptions.die (2)
						end
					else
						Exceptions.die (3)
					end
				else
					report_cannot_read_error (a_filename)
					Exceptions.die (1)
				end
			end
--print ("Type Enter...")
--std.input.read_character
		rescue
			Exceptions.die (4)
		end

feature -- Status report

	defined_variables: STRING
	is_verbose: BOOLEAN
	no_c_compile: BOOLEAN
	is_silent: BOOLEAN
	is_finalize: BOOLEAN
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
			l_null_error_handler: ET_NULL_ERROR_HANDLER
			l_system: ET_SYSTEM
			l_builder: ET_DYNAMIC_TYPE_SET_BUILDER
			l_class: ET_CLASS
			l_generator: ET_C_GENERATOR
			l_file: KL_TEXT_OUTPUT_FILE
			l_command: KL_SHELL_COMMAND
			l_base_name: STRING
			l_c_config: DS_HASH_TABLE [STRING, STRING]
			l_variables: DS_HASH_TABLE [STRING, STRING]
			l_command_name: STRING
			l_cc_template: STRING
			l_link_template: STRING
			l_filename: STRING
		do
			if is_silent then
				create l_null_error_handler.make_standard
				a_universe.set_error_handler (l_null_error_handler)
			end
			a_universe.error_handler.set_ise
			if is_verbose then
-- TODO.
			end
			a_universe.set_use_assign_keyword (True)
			a_universe.set_use_attribute_keyword (False)
			a_universe.set_use_convert_keyword (True)
			a_universe.set_use_create_keyword (True)
			a_universe.set_use_recast_keyword (False)
			a_universe.set_use_reference_keyword (True)
			a_universe.set_use_void_keyword (True)
			create l_system.make (a_universe)
			create {ET_DYNAMIC_PUSH_TYPE_SET_BUILDER} l_builder.make (l_system)
			l_system.set_dynamic_type_set_builder (l_builder)
			l_system.compile
			l_class := a_universe.root_class
			if l_class = a_universe.none_class then
				-- Do nothing.
			elseif not l_system.has_fatal_error then
					-- C code generation.
				l_base_name := a_universe.system_name
				if l_base_name = Void then
				else
					l_base_name := l_class.name.lower_name
				end
				l_filename := l_base_name + ".c"
				create l_file.make (l_filename)
				l_file.open_write
				if l_file.is_open_write then
					create l_generator.make (l_system)
					l_generator.generate (l_file)
					l_file.close
						-- C code compilation.
					l_c_config := c_config
					create l_variables.make (10)
					l_variables.put ("", "includes")
					l_variables.put ("", "libs")
					l_variables.put (l_base_name + l_c_config.item ("exe"), "exe")
					l_variables.put (l_base_name + ".c", "c")
					if is_finalize and then l_c_config.has ("cflags_finalize") then
						l_variables.put (l_c_config.item ("cflags_finalize"), "cflags")
					elseif l_c_config.has ("cflags") then
						l_variables.put (l_c_config.item ("cflags"), "cflags")
					else
						l_variables.put ("", "cflags")
					end
					if is_finalize and then l_c_config.has ("lflags_finalize") then
						l_variables.put (l_c_config.item ("lflags_finalize"), "lflags")
					elseif l_c_config.has ("lflags") then
						l_variables.put (l_c_config.item ("lflags"), "lflags")
					else
						l_variables.put ("", "lflags")
					end
					if operating_system.is_windows then
						l_filename := l_base_name + ".bat"
					else
						l_filename := l_base_name + ".sh"
					end
					create l_file.make (l_filename)
					l_file.open_write
					if l_file.is_open_write then
						if operating_system.is_windows then
							l_file.put_line ("@echo off")
						else
							l_file.put_line ("#!/bin/sh")
						end
						l_cc_template := l_c_config.item ("cc")
						l_command_name := template_expander.expand_from_values (l_cc_template, l_variables)
						l_file.put_line (l_command_name)
						l_variables.put (l_base_name + l_c_config.item ("obj"), "objs")
						l_link_template := l_c_config.item ("link")
						l_command_name := template_expander.expand_from_values (l_link_template, l_variables)
						l_file.put_line (l_command_name)
						l_file.close
						if not operating_system.is_windows then
							create l_command.make ("chmod a+x " + l_filename)
							l_command.execute
						end
						if not no_c_compile then
							create l_command.make (file_system.absolute_pathname (l_filename))
							l_command.execute
						end
					else
						report_cannot_write_error (l_filename)
						Exceptions.die (1)
					end
				else
					report_cannot_write_error (l_filename)
					Exceptions.die (1)
				end
			end
		end

	c_config: DS_HASH_TABLE [STRING, STRING] is
			-- C compiler configuration
		local
			l_name: STRING
			l_filename: STRING
			l_file: KL_TEXT_INPUT_FILE
			l_default: BOOLEAN
			l_line: STRING
			i: INTEGER
			l_value, l_variable: STRING
		do
			l_name := Execution_environment.variable_value ("GOBO_CC")
			if l_name = Void then
				l_filename := file_system.nested_pathname ("${GOBO}", <<"misc", "gec", "c_compiler", "c_compiler.cfg">>)
				l_filename := Execution_environment.interpreted_string (l_filename)
				create l_file.make (l_filename)
				l_file.open_read
				if l_file.is_open_read then
					l_file.read_line
					if not l_file.end_of_file then
						l_name := STRING_.cloned_string (l_file.last_string)
						STRING_.left_adjust (l_name)
						STRING_.right_adjust (l_name)
					end
					l_file.close
				end
			end
			if l_name = Void then
				l_default := True
				if operating_system.is_windows then
					l_name := "msc"
				else
					l_name := "gcc"
				end
			end
			create Result.make (10)
				-- Put some platform-dependent default values.
			if operating_system.is_windows then
				Result.put ("cl -nologo $cflags $includes -c $c", "cc")
				Result.put ("cl -nologo $lflags $objs -o $exe -link $libs", "link")
				Result.put (".obj", "obj")
				Result.put (".exe", "exe")
				Result.put ("", "cflags")
				Result.put ("", "lflags")
			else
				Result.put ("gcc $cflags $includes -c $c", "cc")
				Result.put ("gcc $lflags -o $exe $objs $libs", "link")
				Result.put (".o", "obj")
				Result.put ("", "exe")
				Result.put ("", "cflags")
				Result.put ("", "lflags")
			end
			l_filename := file_system.nested_pathname ("${GOBO}", <<"misc", "gec", "c_compiler", l_name>>)
			l_filename := Execution_environment.interpreted_string (l_filename)
			if not file_system.has_extension (l_filename, ".cfg") then
				l_filename := l_filename + ".cfg"
			end
			create l_file.make (l_filename)
			l_file.open_read
			if l_file.is_open_read then
				from
					l_file.read_line
				until
					l_file.end_of_file
				loop
					l_line := STRING_.cloned_string (l_file.last_string)
					STRING_.left_adjust (l_line)
					STRING_.right_adjust (l_line)
					if l_line.count >= 2 then
						if l_line.item (1) = '-' and l_line.item (2) = '-' then
							-- Ignore comments.
						else
							i := l_line.index_of (':', 2)
							if i /= 0 then
								l_variable := l_line.substring (1, i - 1)
								STRING_.right_adjust (l_variable)
								l_value := l_line.substring (i + 1, l_line.count)
								STRING_.left_adjust (l_value)
								Result.force (l_value, l_variable)
							end
						end
					end
					l_file.read_line
				end
				l_file.close
			elseif not l_default then
				report_cannot_read_error (l_filename)
				Exceptions.die (1)
			end
		ensure
			c_config_not_void: Result /= Void
			no_void_variables: not Result.has_item (Void)
			cc_defined: Result.has ("cc")
			link_defined: Result.has ("link")
			exe_defined: Result.has ("exe")
			obj_defined: Result.has ("obj")
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

	report_cannot_write_error (a_filename: STRING) is
			-- Report that `a_filename' cannot be
			-- opened in write mode.
		require
			a_filename_not_void: a_filename /= Void
		local
			an_error: UT_CANNOT_WRITE_TO_FILE_ERROR
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
			create Result.make ("[--silent][--verbose][--finalize][--no_cc] ace_filename")
		ensure
			usage_message_not_void: Result /= Void
		end

invariant

	error_handler_not_void: error_handler /= Void

end
