indexing

	description:

		"'validate' commands for 'gexace'"

	system:     "Gobo Eiffel Xace"
	author:     "Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:  "Copyright (c) 2001, Andreas Leitner and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class GEXACE_VALIDATE_COMMAND

inherit

	GEXACE_COMMAND

	KL_IMPORTED_INPUT_STREAM_ROUTINES

creation

	make

feature -- Execution

	execute is
			-- Execute 'validate' command.
		local
			a_parser: ET_XACE_PARSER
			a_file: like INPUT_STREAM_TYPE
		do
			!! a_parser.make_with_variables (variables, error_handler)
			a_file := INPUT_STREAM_.make_file_open_read (system_filename)
			if INPUT_STREAM_.is_open_read (a_file) then
				a_parser.parse_file (a_file)
				INPUT_STREAM_.close (a_file)
			else
				error_handler.report_cannot_read_file_error (system_filename)
			end
		end

end -- class GEXACE_VALIDATE_COMMAND
