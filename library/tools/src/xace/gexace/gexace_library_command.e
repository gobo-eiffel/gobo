note

	description:

		"'library' commands for 'gexace'"

	system: "Gobo Eiffel Xace"
	copyright: "Copyright (c) 2002-2019, Eric Bezault and others"
	license: "MIT License"

class GEXACE_LIBRARY_COMMAND

obsolete

	"Use ET_ECF_* classes instead. [2019-03-17]"

inherit

	GEXACE_BUILD_COMMAND

create

	make

feature {NONE} -- Initialization

	make (a_variables: like variables; an_error_handler: like error_handler)
			-- Create a new 'library' command.
		require
			a_variables_not_void: a_variables /= Void
			an_error_handler_not_void: an_error_handler /= Void
		do
			variables := a_variables
			error_handler := an_error_handler
			xace_filename := default_library_filename
			create generators.make
		ensure
			variables_set: variables = a_variables
			error_handler_set: error_handler = an_error_handler
			xace_filename_set: xace_filename = default_library_filename
		end

feature -- Execution

	execute
			-- Execute 'library' command.
		local
			a_parser: ET_XACE_LIBRARY_CONFIG_PARSER
			a_library: ET_XACE_LIBRARY_CONFIG
			a_file: KL_TEXT_INPUT_FILE
		do
			create a_parser.make_with_variables (variables, error_handler)
			a_parser.set_shallow (is_shallow)
			create a_file.make (xace_filename)
			a_file.open_read
			if a_file.is_open_read then
				a_parser.parse_file (a_file)
				a_file.close
				a_library := a_parser.last_library
				if a_library /= Void then
					execute_generators (a_library)
				end
			else
				error_handler.report_cannot_read_file_error (xace_filename)
			end
		end

	execute_generators (a_library: ET_XACE_LIBRARY_CONFIG)
			-- Execute Ace file generators.
		require
			a_library_not_void: a_library /= Void
		local
			a_cursor: DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR]
			a_generator: ET_XACE_GENERATOR
			a_filename: STRING
			a_file: KL_TEXT_OUTPUT_FILE
		do
			a_cursor := generators.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_generator := a_cursor.item
				if attached output_filename as l_output_filename then
					a_filename := l_output_filename
				else
					a_filename := a_generator.default_library_output_filename
				end
				create a_file.make (a_filename)
				a_file.open_write
				if a_file.is_open_write then
					a_generator.generate_library (a_library, a_file)
					a_file.close
				else
					error_handler.report_cannot_write_file_error (a_filename)
				end
				a_cursor.forth
			end
		end

end
