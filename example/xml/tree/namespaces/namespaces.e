indexing

	description:

		"Reports information about Namespace declarations in XML files"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class NAMESPACES

inherit

	KL_SHARED_ARGUMENTS

creation

	make

feature {NONE} -- Initialization

	make is
		do
			process_arguments
			if not has_error then
				check_file_readable
				if not has_error then
					process_data_file
				end 
			end
		end

feature -- Access

	process_data_file is
		local
			formatter: NS_FORMATTER
			in: KL_TEXT_INPUT_FILE
		do
			io.put_string ("parsing data...%N")
			
			!! in.make (file_name)
			in.open_read
			if in.is_open_read then
				event_parser.parse_from_stream (in)
				in.close

				if tree_pipe.error.has_error then
					io.put_string (tree_pipe.last_error)
					io.put_new_line
				else
					tree_pipe.document.root_element.resolve_namespaces_start
					tree_pipe.document.root_element.remove_namespace_declarations_from_attributes
					io.put_string ("printing document...%N")
					!! formatter.make
					formatter.process_document (tree_pipe.document)
					io.put_string (formatter.last_string)
					io.put_new_line
				end
			end
			io.put_string ("exiting...%N")
		end

feature

	process_arguments is
		local
			parser_switch: STRING
		do
			if Arguments.argument_count /= 2 then
				io.put_string (usage_string)
				has_error := True
			else
				parser_switch := Arguments.argument (1)
				if parser_switch.is_equal ("--expat") then
					if not fact.is_expat_available then
						io.put_string ("expat is not availabe, please choose %
							%other parser backend%N")
						has_error := True
					else
						event_parser := fact.new_expat_parser
					end
				else
					!XM_EIFFEL_PARSER! event_parser.make
				end
				
				-- create and bind tree pipe
				!! tree_pipe.make
				event_parser.set_callbacks (tree_pipe.start)
				
				file_name := Arguments.argument (2)
			end

		ensure
			file_name_not_void: not has_error implies file_name /= Void
			parser_not_void: not has_error implies event_parser /= Void
		end

feature -- Checks we have to do before we can run

	check_file_readable is
			-- check if file_name is readable
		local
			s: KL_TEXT_INPUT_FILE
		do
			!! s.make (file_name)
			s.open_read
			if not s.is_open_read then
				io.put_string ("Unable to open input file: " + file_name)
				io.put_new_line
				has_error := True
			else
				s.close
			end
		end

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
			
feature

	usage_string: STRING is
		once
			Result := clone ("usage: namespaces ")
			if fact.is_expat_available then
				Result.append_string ("--expat|")
			end
			Result.append_string ("--eiffel")
			Result.append_string (" <input-file>%N")
		end

feature

	file_name: STRING
			-- File name.

	has_error: BOOLEAN
			-- Error status.

end
