indexing

	description:

		"Simple application that reads an XML file and outputs it again"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class FORMATTER

inherit

	KL_SHARED_ARGUMENTS

creation

	make

feature {NONE} -- Initialization

	make is
			-- Run.
		do
			process_arguments
			if not has_error then
				check_in_out_files
				if not has_error then
					process_data_file
				end 
			end
		end

feature {ANY} -- Access

	in_file_name: STRING
			-- Name of the input file

	out_file_name: STRING
			-- Name of the output file (see use_std_out)

	use_std_out: BOOLEAN
			-- Only if this is True, we write to STDOUT
			-- otherwise we write to out_file_name
			
	has_error: BOOLEAN
			-- Error during processing?

feature -- Parser

	fact: XM_EXPAT_PARSER_FACTORY is
			-- Shared factory.
		once
			!! Result
		ensure
			factory_not_void: Result /= Void
		end

	event_parser: XM_PARSER
			-- This is the actual parser

	tree_pipe: XM_TREE_CALLBACKS_PIPE
			-- Tree generating callbacks
			
feature {ANY} -- Basic operations

	process_data_file is
			-- do the real work
			-- (parse and output)
		require
			in_file_name_not_void: in_file_name /= Void
			out_file_name: not use_std_out implies out_file_name /= Void
			parser_not_void: event_parser /= Void
			pipe_not_void: tree_pipe /= Void
		local
			formatter: XM_FORMATTER
			in: KL_TEXT_INPUT_FILE
			os: KL_TEXT_OUTPUT_FILE
		do
			io.put_string ("- parsing data...%N")
			
			!! in.make (in_file_name)
			in.open_read
			if in.is_open_read then
				event_parser.parse_from_stream (in)
				in.close
				
				if tree_pipe.error.has_error then
					io.put_string (tree_pipe.last_error)
					io.put_new_line
				else
					-- TODO: this section will go once namespace processing
					-- is removed from tree.
					io.put_string ("- resolving namespaces...%N")
					tree_pipe.document.root_element.resolve_namespaces_start
					tree_pipe.document.root_element.remove_namespace_declarations_from_attributes
					
					io.put_string ("- printing document...%N")
					!! formatter.make
					formatter.process_document (tree_pipe.document)
					if use_std_out then
						io.put_string (formatter.last_string)
						io.put_new_line
					else
						!! os.make (out_file_name)
						os.open_write
						os.put_string (formatter.last_string)
					end
				end
			end
			io.put_string ("exiting...%N")
		end

	process_arguments is
			-- Read command line arguments
		local
			parser_switch: STRING
		do
			if Arguments.argument_count < 2 then
				io.put_string (usage_string)
				has_error := True
			else
				parser_switch := Arguments.argument (1)
				if parser_switch.is_equal ("--expat") then
					if fact.is_expat_available then
						event_parser := fact.new_expat_parser
					else
						io.put_string ("expat is not availabe, please choose %
							%other parser backend%N")
						has_error := True
					end
				elseif parser_switch.is_equal ("--eiffel") then
					!XM_EIFFEL_PARSER! event_parser.make
				else
					io.put_string (usage_string)
					has_error := True
				end
				
				-- create standard pipe holder and bind it to event parser
				if not has_error then
					!! tree_pipe.make
					event_parser.set_callbacks (tree_pipe.start)
				end
				
				in_file_name := Arguments.argument (2)

				if Arguments.argument_count > 2 then -- we got an output file as well
					out_file_name := Arguments.argument (3)
				else                  -- we use STDOUT instead
					use_std_out := True
				end
			end
		ensure
			in_file_name_not_void: not has_error implies in_file_name /= Void
			out_file_name: not has_error implies (not use_std_out implies out_file_name /= Void)
			parser_not_void: not has_error implies event_parser /= Void
			pipe_not_void: not has_error implies tree_pipe /= Void
		end

feature {ANY} -- Checks we have to do before we can run

	check_in_out_files is
			-- Check if we car read/write to/from the in/out files
		require
			in_file_name_not_void: in_file_name /= Void
			out_file_name: not use_std_out implies out_file_name /= Void
		local
			i: KL_TEXT_INPUT_FILE
			o: KL_TEXT_OUTPUT_FILE
		do
			!! i.make (in_file_name)
			i.open_read
			if not i.is_open_read then
				io.put_string ("Unable to open input file:")
				io.put_string (in_file_name)
				io.put_new_line
				has_error := True
			else
				i.close
				if not use_std_out then
					!! o.make (out_file_name)
					o.open_write
					if not o.is_open_write then
						io.put_string ("Unable to write to output file:")
						io.put_string (out_file_name)
						io.put_new_line
						has_error := True
					else
						o.close
					end
				end
			end

		end

feature

	usage_string: STRING is
			-- Brief usage information
		once
			Result := clone ("usage: formatter ")
			if fact.is_expat_available then
				Result.append_string ("--expat|")
			end
			Result.append_string ("--eiffel")
			Result.append_string (" <input-file> [<output-file>]%N")
		end

end
