indexing
	description:"Reports information about Namespace declarations in XML files"
	status:		"See notice at end of class."
	author:		"Andreas Leitner"

class NAMESPACES

inherit

	KL_SHARED_ARGUMENTS

	KL_IMPORTED_INPUT_STREAM_ROUTINES

	KL_SHARED_EXCEPTIONS

creation

	make

feature -- Initialization

	make is
		do
			check_parsers
			process_arguments
			check_file_readable
			process_data_file
		end

	process_data_file is
		local
			formatter: NS_FORMATTER
		do
			io.put_string ("parsing data...%N")
			tree_parser.parse_from_file_name (file_name)

			if
				not tree_parser.is_correct
			then
				io.put_string (tree_parser.last_error_extended_description)
				io.put_new_line
			else
				tree_parser.document.root_element.resolve_namespaces_start
				tree_parser.document.root_element.remove_namespace_declarations_from_attributes
				io.put_string ("printing document...%N")
				!! formatter.make
				formatter.process_document (tree_parser.document)
				io.put_string (formatter.last_string.to_utf8)
				io.put_new_line
			end

			io.put_string ("exiting...%N")
		end

feature

	process_arguments is
		local
			parser_switch: STRING
		do
			if
				Arguments.argument_count /= 2
			then
				io.put_string (usage_string);
				Exceptions.die (1)
			end

			parser_switch := Arguments.argument (1)
			if
				parser_switch.is_equal ("--expat")
			then
				if
					not fact.is_expat_event_available
				then
					io.put_string ("expat is not availabe, please choose %
								   %other parser backend%N")
					Exceptions.die (1)
				end
				tree_parser := fact.new_toe_expat_tree_parser
			elseif
				parser_switch.is_equal ("--eiffel")
			then
				if
					not fact.is_eiffel_event_available
				then
					io.put_string ("eiffel is not availabe, please choose %
								   %other parser backend%N")
					Exceptions.die (1)
				end
				tree_parser := fact.new_toe_eiffel_tree_parser
			else
				io.put_string (usage_string);
				Exceptions.die (1)
			end
			create file_name.make_from_string (Arguments.argument (2))
		ensure
			file_name_not_void: file_name /= Void
			tree_parser_not_void: tree_parser /= Void
		end

feature -- checks we have to do before we can run

	check_parsers is
		do
			-- toe must be there
			-- and one or both of [expat,native]
			if not fact.is_any_toe_tree_available
			then
				io.put_string ("No XML parser backends available, please %
							   %recompile application%N")
				Exceptions.die (1)
			end
		end

	check_file_readable is
			-- check if file_name is readable
		local
			s: like INPUT_STREAM_TYPE
		do
			s := INPUT_STREAM_.make_file_open_read (file_name.to_utf8)
			if
				not INPUT_STREAM_.is_open_read (s)
			then
				io.put_string ("Unable to open input file:")
				io.put_string (file_name.to_utf8)
				io.put_string ("%N")
				Exceptions.die (1)
			end
		end

feature

	tree_parser: XM_TREE_PARSER

	fact: expanded XM_PARSER_FACTORY

feature

	usage_string: STRING is
		once
			Result := clone ("usage: namespaces ")
			if
				fact.is_expat_event_available
			then
				Result.append_string ("--expat")
				if
					fact.is_eiffel_event_available
				then
					Result.append_string ("|")
				end
			end
			if
				fact.is_eiffel_event_available
			then
				Result.append_string ("--eiffel")
			end
			Result.append_string (" <input-file>%N")
		end

feature

	file_name: UC_STRING

end -- class NAMESPACES
--|-------------------------------------------------------------------------
--| eXML, Eiffel XML Parser Toolki
--| Copyright (C) 1999	Andreas Leitner and others
--| See the file forum.txt included in this package for licensing info.
--|
--| Comments, Questions, Additions to this library? please contact:
--|
--| Andreas Leitner
--| Arndtgasse 1/3/5
--| 8010 Graz
--| Austria
--| email: andreas.leitner@chello.a
--| www: http://exml.sourceforge.ne
--|-------------------------------------------------------------------------





