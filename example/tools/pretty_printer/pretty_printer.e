indexing

	description:

		"Eiffel pretty-printer"

	copyright: "Copyright (c) 2008-2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class PRETTY_PRINTER

inherit

	KL_SHARED_STANDARD_FILES
	KL_SHARED_EXCEPTIONS
	KL_SHARED_ARGUMENTS

	UT_SHARED_ISE_VERSIONS
		export {NONE} all end

create

	execute

feature {NONE} -- Execution

	execute is
			-- Execute tool.
		local
			a_system: ET_SYSTEM
			an_ast_factory: ET_DECORATED_AST_FACTORY
			in_file: KL_TEXT_INPUT_FILE
			out_file: KL_TEXT_OUTPUT_FILE
			a_cluster: ET_XACE_CLUSTER
			a_printer: ET_AST_PRETTY_PRINTER
			a_time_stamp: INTEGER
			a_parser: ET_EIFFEL_PARSER
			a_eiffel_error_handler: ET_ERROR_HANDLER
		do
			Arguments.set_program_name ("pretty_printer")
			create error_handler.make_standard
			read_arguments
			create a_system.make ("system_name")
			a_system.set_ise_version (ise_latest)
			create an_ast_factory.make
			an_ast_factory.set_keep_all_breaks (True)
			a_system.set_ast_factory (an_ast_factory)
				-- Make sure that syntax errors are reported to standard error.
			create a_eiffel_error_handler.make_standard
			a_eiffel_error_handler.set_info_file (std.error)
			a_system.set_error_handler (a_eiffel_error_handler)
				-- Make sure that kernel classes are set correctly.
			a_system.preparse
			create a_cluster.make ("cluster_name", ".", a_system)
			create a_parser.make
			create in_file.make (in_filename)
			a_time_stamp := in_file.time_stamp
			in_file.open_read
			if in_file.is_open_read then
				a_parser.parse_file (in_file, in_filename, a_time_stamp, a_cluster)
				in_file.close
			else
				report_cannot_read_error (in_filename)
				Exceptions.die (1)
			end
			if a_parser.syntax_error then
					-- In case of syntax error, copy the input file
					-- unmodified to the output file.
				create in_file.make (in_filename)
				in_file.open_read
				if in_file.is_open_read then
					if out_filename.is_equal ("-") then
						std.output.append (in_file)
						in_file.close
					else
						create out_file.make (out_filename)
						out_file.recursive_open_write
						if out_file.is_open_write then
							out_file.append (in_file)
							out_file.close
							in_file.close
						else
							in_file.close
							report_cannot_write_error (out_filename)
							Exceptions.die (1)
						end
					end
				else
					report_cannot_read_error (in_filename)
					Exceptions.die (1)
				end
				Exceptions.die (1)
			else
				if out_filename.is_equal ("-") then
					create a_printer.make (std.output)
				else
					create out_file.make (out_filename)
					out_file.recursive_open_write
					if out_file.is_open_write then
						create a_printer.make (out_file)
					else
						create a_printer.make_null
						report_cannot_write_error (out_filename)
						Exceptions.die (1)
					end
				end
				a_system.classes_do_if_recursive (agent {ET_CLASS}.process (a_printer), agent {ET_CLASS}.is_parsed)
				if out_file /= Void and then not out_file.is_closed then
					out_file.close
				end
			end
		end

	read_arguments is
			-- Read command-line arguments.
		do
				-- Read filenames.
			inspect Arguments.argument_count
			when 1 then
				in_filename := Arguments.argument (1)
				out_filename := "-"
			when 2 then
				in_filename := Arguments.argument (1)
				out_filename := Arguments.argument (2)
			else
				in_filename := "-"
				out_filename := "-"
				report_usage_error
				Exceptions.die (1)
			end
		ensure
			in_filename_not_void: in_filename /= Void
			out_filename_not_void: out_filename /= Void
		end

feature -- Access

	in_filename, out_filename: STRING
			-- Input and output filenames

	error_handler: UT_ERROR_HANDLER
			-- Error handler

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

	report_usage_error is
			-- Report usage error.
		do
			error_handler.report_error (Usage_message)
		end

	Usage_message: UT_USAGE_MESSAGE is
			-- Usage message
		once
			create Result.make ("input_filename [output_filename]")
		ensure
			usage_message_not_void: Result /= Void
		end

invariant

	error_handler_not_void: error_handler /= Void
	in_filename_not_void: in_filename /= Void
	out_filename_not_void: out_filename /= Void

end
