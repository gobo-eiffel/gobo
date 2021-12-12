note

	description:

		"Test features of class ET_AST_TOKENIZER"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2018-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_TEST_AST_TOKENIZER

inherit

	TS_TEST_CASE
		redefine
			make_default
		end

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

	KL_SHARED_EXECUTION_ENVIRONMENT
		export {NONE} all end

	KL_SHARED_EIFFEL_COMPILER
		export {NONE} all end

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

	UT_SHARED_ISE_VERSIONS
		export {NONE} all end

	ET_SHARED_ISE_VARIABLES
		export {NONE} all end

create

	make_default

feature {NONE} -- Initialization

	make_default
			-- <Precursor>
		do
			precursor
			ecf_filename := default_ecf_filename
		end

feature -- Access

	ecf_filename: STRING
			-- Name of ECF file used for the test

feature -- Setting

	set_ecf_filename (a_filename: STRING)
			-- Set `ecf_filename' to `a_filename'.
		require
			a_filename_not_void: a_filename /= Void
			a_filename_not_empty: not a_filename.is_empty
		do
			ecf_filename := a_filename
		ensure
			ecf_filename_set: ecf_filename = a_filename
		end

feature -- Test

	test_printer
			-- Test tokenizer with the Eiffel classes of `ecf_filename'.
		local
			l_ecf_filename: STRING
			l_ecf_file: KL_TEXT_INPUT_FILE
			l_eiffel_ast_factory: ET_DECORATED_AST_FACTORY
			l_ecf_parser: ET_ECF_SYSTEM_PARSER
			l_ecf_error_handler: ET_ECF_ERROR_HANDLER
			l_system: ET_SYSTEM
			ise_version: UT_VERSION
			l_system_processor: ET_SYSTEM_PROCESSOR
		do
				-- For compatibility with ISE's tools, define the environment
				-- variables "$ISE_LIBRARY", "$EIFFEL_LIBRARY", "$ISE_PLATFORM"
				-- and "$ISE_C_COMPILER" if not set yet.
			ise_variables.set_ise_variables
			if eiffel_compiler.is_ise then
				ise_version := ise_latest
			elseif eiffel_compiler.is_ge then
				ise_version := ise_latest
			end
			if variables.has ("ecf_filename") then
				l_ecf_filename := variables.value ("ecf_filename")
			else
				l_ecf_filename := ecf_filename
			end
			create l_ecf_file.make (l_ecf_filename)
			l_ecf_file.open_read
			assert ("ecf_file_opened", l_ecf_file.is_open_read)
			create l_ecf_error_handler.make_standard
			create l_ecf_parser.make (l_ecf_error_handler)
			if ise_version /= Void then
				l_ecf_parser.set_ise_version (ise_version)
			end
			l_ecf_parser.parse_file (l_ecf_file, Void)
			assert ("ecf_parsed", not l_ecf_error_handler.has_error)
			l_system := l_ecf_parser.last_system
			l_ecf_file.close
			assert ("system_not_void", l_system /= Void)
			check asserted_above: l_system /= Void then end
			create l_system_processor.make
			l_system_processor.set_ise_version (ise_version)
				-- We restrict this test to files that contain only one class.
			l_system_processor.set_preparse_single_mode
			create l_eiffel_ast_factory.make
			l_eiffel_ast_factory.set_keep_all_breaks (True)
			l_system_processor.set_ast_factory (l_eiffel_ast_factory)
			l_system.preparse_recursive (l_system_processor)
			l_system.classes_do_recursive (agent check_class (?, l_system_processor))
		end

feature {NONE} -- Test

	check_class (a_class: ET_CLASS; a_system_processor: ET_SYSTEM_PROCESSOR)
			-- Check that after parsing `a_class' and printing its AST tokens,
			-- we get the same tokens.
		require
			a_class_not_void: a_class /= Void
			a_system_processor_not_void: a_system_processor /= Void
		local
			l_tokenizer: ET_AST_TOKENIZER
			l_output: KL_STRING_OUTPUT_STREAM
			l_filename: detachable STRING
		do
			if a_class.is_in_cluster then
				l_filename := a_class.filename
				assert (a_class.lower_name + "_is_in_cluster", l_filename /= Void)
				check asserted_above: l_filename /= Void then end
				a_class.process (a_system_processor.eiffel_parser)
				assert (a_class.lower_name + "_parsed", a_class.is_parsed)
				assert (a_class.lower_name + "_no_syntax_error", not a_class.has_syntax_error)
				create l_output.make_empty
				create l_tokenizer.make_null
				l_tokenizer.set_separator ("")
				l_tokenizer.set_file (l_output)
				a_class.process (l_tokenizer)
				l_tokenizer.set_null_file
				assert_strings_equal (a_class.lower_name + "_diff", stripped_file (l_filename), l_output.string)
			end
		end

feature {NONE} -- Implementation

	stripped_file (a_filename: STRING): STRING
			-- Content of `a_filename' where spaces, tabs,
			-- new-lines and comments have been removed.
		require
			a_filename_not_void: a_filename /= Void
		local
			l_file: KL_TEXT_INPUT_FILE
			l_line: STRING
			i, nb: INTEGER
			c: CHARACTER
			l_in_character: BOOLEAN
			l_in_string: BOOLEAN
			l_in_verbatim_string: BOOLEAN
			l_verbatim_marker: CHARACTER
			l_string_new_line: BOOLEAN
			l_first_line: BOOLEAN
		do
			create l_file.make (a_filename)
			l_file.open_read
			assert ("class_file_opened", l_file.is_open_read)
			create Result.make (1000)
			from
				l_file.read_line
				l_first_line := True
			until
				l_file.end_of_file
			loop
				l_line := l_file.last_string
				from
					if l_first_line and then l_line.starts_with (bom) then
						i := bom.count + 1
					else
						i := 1
					end
					nb := l_line.count
				until
					i > nb
				loop
					c := l_line.item (i)
					inspect c
					when '%"' then
						if not l_in_string then
							if not l_in_character then
								l_in_string := True
								if i = nb - 1 and then l_line.item (i + 1) = '[' then
									l_in_verbatim_string := True
									l_verbatim_marker := ']'
								elseif i = nb - 1 and then l_line.item (i + 1) = '{' then
									l_in_verbatim_string := True
									l_verbatim_marker := '}'
								end
							end
						else
							if l_in_verbatim_string then
								if i > 1 and then l_line.item (i - 1) = l_verbatim_marker and then l_line.area.for_all_in_bounds (agent is_space_character, 0, i - 3) then
									l_in_verbatim_string := False
									l_in_string := False
								end
							else
								l_in_string := False
							end
						end
						Result.append_character (c)
					when '%%' then
						if l_in_string and not l_in_verbatim_string and l_string_new_line then
							l_string_new_line := False
						elseif (l_in_character or l_in_string and not l_in_verbatim_string) and i < nb then
							Result.append_character (c)
							i := i + 1
							c := l_line.item (i)
						elseif l_in_string and not l_in_verbatim_string and i = nb then
							l_string_new_line := True
						end
						Result.append_character (c)
					when '%'' then
						if not l_in_character then
							if not l_in_string then
								l_in_character := True
							end
						else
							l_in_character := False
						end
						Result.append_character (c)
					when '-' then
						if (not l_in_string and not l_in_character) and then i < nb and then l_line.item (i + 1) = '-' then
								-- Skip comments.
								-- Jump out of the loop.
							i := nb + 1
						else
							Result.append_character (c)
						end
					when ' ', '%T' then
						if l_in_string or l_in_character then
							Result.append_character (c)
						end
					else
						Result.append_character (c)
					end
					i := i + 1
				end
				l_file.read_line
				l_first_line := False
				if l_in_string and then not l_file.end_of_file then
					Result.append_character ('%N')
				end
			end
			l_file.close
		ensure
			stripped_file_not_void: Result /= Void
		end

	is_space_character (c: CHARACTER): BOOLEAN
			-- is `c' a space character?
		do
			Result := c.is_space
		ensure
			definition: Result = c.is_space
		end

	default_ecf_filename: STRING
			-- Default name of ECF file used for the test
		once
			Result := file_system.nested_pathname ("${GOBO}", <<"library", "tools", "test", "unit", "data", "ast_printer.ecf">>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			default_ecf_filename_not_void: Result /= Void
			default_ecf_filename_not_empty: not Result.is_empty
		end

invariant

	ecf_filename_not_void: ecf_filename /= Void
	ecf_filename_not_empty: not ecf_filename.is_empty

end
