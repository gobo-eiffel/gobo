indexing

	description:

		"Gobo Eiffel Lex: lexical analyzer generator";

	author:     "Eric Bezault <ericb@gobo.demon.co.uk>";
	copyright:  "Copyright (c) 1997, Eric Bezault";
	date:       "$Date$";
	revision:   "$Revision$"

class GELEX

creation

	execute

feature -- Processing

	execute is
			-- Start 'gelex' execution.
		local
			command_line: LX_LEX_COMMAND_LINE
		do
			!! error_handler.make
			!! description.make
			!! command_line.make (error_handler)
			command_line.read_options (description)
			parse_input_file
			if error_handler.syntax_error then
				error_handler.terminate (1)
			else
				build_dfa
				print_scanner
				print_backing_up_report
				error_handler.terminate (0)
			end
		end

	parse_input_file is
			-- Parse input file.
		local
			parser: LX_LEX_PARSER
			filename: STRING
#ifndef ISE || HACT
			file: FILE
#else
			file: PLAIN_TEXT_FILE
#endif
		do
			!! parser.make_from_description (description, error_handler)
			filename := description.input_filename
			if filename /= Void then
-- TO DO : check whether the file is readable or not!
				!! file.make_open_read (filename)
				parser.parse_file (file)
				file.close
			else
				parser.parse_file (io.input)
			end
			description := parser.to_description
		end

	build_dfa is
			-- Build `dfa'.
		do
			if description.full_table then
				!LX_FULL_DFA! dfa.make (description)
			else
				!LX_COMPRESSED_DFA! dfa.make (description)
			end
		ensure
			dfa_not_void: dfa /= Void
		end

	print_scanner is
			-- Print scanner.
		require
			dfa_not_void: dfa /= Void
		local
			filename: STRING
#ifndef ISE || HACT
			file: FILE
#else
			file: PLAIN_TEXT_FILE
#endif
		do
			filename := description.output_filename
			if filename /= Void then
				!! file.make_open_write (filename)
				dfa.print_scanner (file)
				file.close
			else
				dfa.print_scanner (io.output)
			end
		end

	print_backing_up_report is
			-- Print backing up report.
		require
			dfa_not_void: dfa /= Void
		local
			filename: STRING
#ifndef ISE || HACT
			file: FILE
#else
			file: PLAIN_TEXT_FILE
#endif
		do
			if description.backing_up_report then
				filename := description.backing_up_filename
				if filename /= Void then
-- TO DO : check whether the file is writable or not!
					!! file.make_open_write (filename)
					dfa.print_backing_up_report (file)
					file.close
				else
					dfa.print_backing_up_report (io.output)
				end
			end
		end

feature -- Access

	description: LX_DESCRIPTION
			-- Scanner description

	error_handler: GELEX_ERROR_HANDLER
			-- Error handler

	dfa: LX_GENERATABLE_DFA 
			-- Generated DFA

invariant

	description_not_void: description /= Void
	error_handler_not_void: error_handler /= Void

end -- class GELEX
