indexing

	description:

		""

	status:  "See notice at end of class."
	author:  "Andreas Leitner"

class PRINT

inherit

	KL_IMPORTED_INPUT_STREAM_ROUTINES

	KL_SHARED_ARGUMENTS

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

feature

	process_data_file is
		require
			file_name_not_void: file_name /= Void
			event_parser_not_void: event_parser /= Void
		do
			io.put_string ("1) parsing data...%N")

			event_parser.parse_from_file_name (file_name)

			if not event_parser.is_correct then
				io.put_string (event_parser.last_error_extended_description)
				io.put_new_line
			else
				io.put_string ("parsing ok.%N")
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
				Exceptions.die (1)
			end

			parser_switch := Arguments.argument (1)
			if parser_switch.is_equal ("--expat") then
				if not fact.is_expat_event_available then
					io.put_string ("expat is not availabe, please choose %
						%other parser backend%N")
					Exceptions.die (1)
				end
				!! event_parser.make_from_implementation (fact.new_expat_event_parser_imp)
			elseif parser_switch.is_equal ("--eiffel") then
				if not fact.is_eiffel_event_available then
					io.put_string ("expat is not availabe, please choose %
						%other parser backend%N")
					Exceptions.die (1)
				end
				!! event_parser.make_from_implementation (fact.new_eiffel_event_parser_imp)
			else
				io.put_string (usage_string)
				Exceptions.die (1)
			end
			!! file_name.make_from_string (Arguments.argument (2))
		ensure
			file_name_not_void: file_name /= Void
			event_parser_not_void: event_parser /= Void
		end

feature -- Checks we have to do before we can run

	check_parsers is
		do
				-- toe must be one or both of [expat,eiffel]
			if not fact.is_expat_event_available and not fact.is_eiffel_event_available then
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
			if not INPUT_STREAM_.is_open_read (s) then
				io.put_string ("Unable to open input file:")
				io.put_string (file_name.to_utf8)
				io.put_string ("%N")
				Exceptions.die (1)
			end
		end

feature

	fact: expanded XM_PARSER_FACTORY

	event_parser: PRINT_EVENT_PARSER

feature

	usage_string: STRING is
		once
			Result := clone ("usage: event ")
			if fact.is_expat_event_available then
				Result.append_string ("--expat")
				if fact.is_eiffel_event_available then
					Result.append_string ("|")
				end
			end
			if fact.is_eiffel_event_available then
				Result.append_string ("--eiffel")
			end
			Result.append_string (" <input-file>%N")
		end

feature

	file_name: UC_STRING

end -- class PRINT

