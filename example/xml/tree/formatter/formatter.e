indexing

	description:

		"Simpe application that reads an XML file and outputs it again"

	status:  "See notice at end of class."
	author:  "Andreas Leitner"

class FORMATTER

inherit

	KL_IMPORTED_INPUT_STREAM_ROUTINES

	KL_IMPORTED_OUTPUT_STREAM_ROUTINES

	KL_SHARED_ARGUMENTS

	KL_SHARED_EXCEPTIONS

creation

	make

feature {NONE} -- Initialization

	make is
		do
			check_parsers
			process_arguments
			check_in_out_files
			process_data_file
		end

feature {ANY} -- Access

	in_file_name: UC_STRING
			-- name of the input file

	out_file_name: UC_STRING
			-- name of the output file (see use_std_out)

	use_std_out: BOOLEAN
			-- only if this is True, we write to STDOUT
			-- otherwise we write to out_file_name

	fact: expanded XM_PARSER_FACTORY
			-- the parser factory

	tree_parser: XM_TREE_PARSER
			-- this is the actual parser

feature {ANY} -- Basic operations

	process_data_file is
			-- do the real work
			-- (parse and output)
		require
			in_file_name_not_void: in_file_name /= Void
			out_file_name: not use_std_out implies out_file_name /= Void
			tree_parser_not_void: tree_parser /= Void
		local
			formatter: XM_FORMATTER
			os: like output_stream_type
		do
			io.put_string ("1) parsing data...%N")
			tree_parser.parse_from_file_name (in_file_name)

			if not tree_parser.is_correct then
				io.put_string (tree_parser.last_error_extended_description)
				io.put_new_line
			else
				io.put_string ("2) resolving namespaces...%N")
				tree_parser.document.root_element.resolve_namespaces_start
				tree_parser.document.root_element.remove_namespace_declarations_from_attributes
				io.put_string ("3) printing document...%N")
				!! formatter.make
				formatter.process_document (tree_parser.document)
				if use_std_out then
					io.put_string (formatter.last_string.to_utf8)
					io.put_new_line
				else
					os := OUTPUT_STREAM_.make_file_open_write (out_file_name.to_utf8)
					os.put_string (formatter.last_string.to_utf8)
				end
			end

			io.put_string ("exiting...%N")
		end

	process_arguments is
			-- read command line arguments
		local
			parser_switch: STRING
		do
			if Arguments.argument_count < 2 then
				io.put_string (usage_string)
				Exceptions.die (1)
			end

			parser_switch := Arguments.argument (1)
			if parser_switch.is_equal ("--expat") then
				if not fact.is_expat_event_available then
					io.put_string ("expat is not availabe, please choose %
						%other parser backend%N")
					Exceptions.die (1)
				end
				tree_parser := fact.new_toe_expat_tree_parser
			elseif parser_switch.is_equal ("--eiffel") then
				if not fact.is_eiffel_event_available then
					io.put_string ("expat is not availabe, please choose %
						%other parser backend%N")
					Exceptions.die (1)
				end
				tree_parser := fact.new_toe_eiffel_tree_parser
			else
				io.put_string (usage_string)
				Exceptions.die (1)
			end
			create in_file_name.make_from_string (Arguments.argument (2))

			if Arguments.argument_count > 2 then -- we got an output file as well
				create out_file_name.make_from_string (Arguments.argument (3))
			else                  -- we use STDOUT instead
				use_std_out := True
			end
		ensure
			in_file_name_not_void: in_file_name /= Void
			out_file_name: not use_std_out implies out_file_name /= Void
			tree_parser_not_void: tree_parser /= Void
		end

feature {ANY} -- Checks we have to do before we can run

	check_parsers is
			-- check if we have at lease one usable tree parser
		do
				-- toe must be there
				-- and one or both of [expat,eiffel]
			if not fact.is_any_toe_tree_available then
				io.put_string ("No XML parser backends available, please %
					%recompile application%N")
				Exceptions.die (1)
			end
		end

	check_in_out_files is
			-- check if we car read/write to/from the in/out files
		require
			in_file_name_not_void: in_file_name /= Void
			out_file_name: not use_std_out implies out_file_name /= Void
		local
			i: like input_stream_type
			o: like output_stream_type
		do
			i := INPUT_STREAM_.make_file_open_read (in_file_name.to_utf8)
			if not INPUT_STREAM_.is_open_read (i) then
				io.put_string ("Unable to open input file:")
				io.put_string (in_file_name.to_utf8)
				io.put_string ("%N")
				Exceptions.die (1)
			end

			if not use_std_out then
				o := OUTPUT_STREAM_.make_file_open_write (out_file_name.to_utf8)
				if not OUTPUT_STREAM_.is_open_write (o) then
					io.put_string ("Unable to write to output file:")
					io.put_string (out_file_name.to_utf8)
					io.put_string ("%N")
					Exceptions.die (1)
				end
			end
		end

feature

	usage_string: STRING is
			-- brief usage information
		once
			Result := clone ("usage: formatter ")
			if fact.is_expat_event_available then
				Result.append_string ("--expat")
				if fact.is_eiffel_event_available then
					Result.append_string ("|")
				end
			end
			if fact.is_eiffel_event_available then
				Result.append_string ("--eiffel")
			end
			Result.append_string (" <input-file> [<output-file>]%N")
		end

end -- class FORMATTER
--|-------------------------------------------------------------------------
--| eXML, Eiffel XML Parser Toolkit
--| Copyright (C) 1999  Andreas Leitner and others
--| See the file forum.txt included in this package for licensing info.
--|
--| Comments, Questions, Additions to this library? please contact:
--|
--| Andreas Leitner
--| Arndtgasse 1/3/5
--| 8010 Graz
--| Austria
--| email: andreas.leitner@chello.at
--| www: http://exml.sourceforge.net
--|-------------------------------------------------------------------------

