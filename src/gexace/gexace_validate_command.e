note

	description:

		"'validate' commands for 'gexace'"

	system: "Gobo Eiffel Xace"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEXACE_VALIDATE_COMMAND

inherit

	GEXACE_COMMAND

create

	make

feature {NONE} -- Initialization

	make (a_variables: like variables; an_error_handler: like error_handler) is
			-- Create a new 'validate' command.
		require
			a_variables_not_void: a_variables /= Void
			an_error_handler_not_void: an_error_handler /= Void
		do
			variables := a_variables
			error_handler := an_error_handler
			xace_filename := default_system_filename
		ensure
			variables_set: variables = a_variables
			error_handler_set: error_handler = an_error_handler
			xace_filename_set: xace_filename = default_system_filename
		end

feature -- Execution

	execute is
			-- Execute 'validate' command.
		local
			a_parser: ET_XACE_PARSER
			a_file: KL_TEXT_INPUT_FILE
		do
			create a_parser.make_with_variables (variables, error_handler)
			create a_file.make (xace_filename)
			a_file.open_read
			if a_file.is_open_read then
				a_parser.parse_file (a_file)
				a_file.close
			else
				error_handler.report_cannot_read_file_error (xace_filename)
			end
		end

end
