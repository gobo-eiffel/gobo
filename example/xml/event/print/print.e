indexing

	description:

		"Print sample"

	status:	 "See notice at end of class."
	author:	 "Andreas Leitner"

class PRINT

inherit

	KL_SHARED_ARGUMENTS

	XM_CALLBACKS_FILTER_FACTORY
	
creation

	make

feature {NONE} -- Initialization

	make is
		do
			check_parsers
			if not has_error then
				process_arguments
				if not has_error then
					check_file_readable
					if not has_error then
						process_data_file
					end
				end
			end
		end

feature

	process_data_file is
		require
			file_name_not_void: file_name /= Void
			event_parser_not_void: event_parser /= Void
		local
			a_file: KL_TEXT_INPUT_FILE
			a_parser: XM_PARSER
		do
			io.put_string ("1) parsing data...%N")

			!! a_file.make (file_name)
			a_file.open_read
			
			a_parser := event_parser

			a_parser.set_callbacks (
					standard_callbacks_pipe (<<new_pretty_print>>))
			a_parser.parse_from_stream (a_file)
			
			if not a_parser.is_correct then
				io.put_string (a_parser.last_error_extended_description)
				io.put_new_line
			else
				io.put_string ("parsing ok.%N")
			end

			a_file.close
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
				file_name := Arguments.argument (2)
				if parser_switch.is_equal ("--expat") then
					if not fact.is_expat_available then
						io.put_string ("expat is not availabe, please choose %
							%other parser backend%N")
						has_error := True
					else
						io.put_string ("Using expat parser%N")
						event_parser := fact.new_expat_parser
					end
				elseif parser_switch.is_equal ("--eiffel") then
					io.put_string ("Using eiffel parser%N")
					!XM_EIFFEL_PARSER! event_parser.make
				else
					io.put_string (usage_string)
					has_error := True
				end
			end
		ensure
			file_name_not_void: (not has_error) implies file_name /= Void
			--event_parser_not_void: event_parser /= Void
		end

feature -- Checks we have to do before we can run

	check_parsers is
		do
		end

	check_file_readable is
			-- check if file_name is readable
		local
			s: KL_TEXT_INPUT_FILE
		do
			!! s.make (file_name)
			s.open_read
			if not s.is_open_read then
				io.put_string ("Unable to open input file:")
				io.put_string (file_name)
				io.put_string ("%N")
				has_error := True
			else
				s.close
			end
		end

feature

	fact: XM_EXPAT_PARSER_FACTORY is
		once
			!! Result
		ensure
			factory_not_void: Result /= Void
		end

	event_parser: XM_PARSER

feature

	has_error: BOOLEAN
	
	usage_string: STRING is
		once
			Result := clone ("usage: print ")
			if fact.is_expat_available then
				Result.append_string ("--expat|")
			end
			Result.append_string ("--eiffel")
			Result.append_string (" <input-file>%N")
		end

feature

	file_name: STRING

end

