indexing

	description:

		"Gobo Eiffel generator for Unicode Classes"

	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEUC

inherit

	KL_SHARED_ARGUMENTS
		export {NONE} all end

	KL_SHARED_EXCEPTIONS
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	GEUC_CONSTANTS
	
create

	execute
	
feature -- Execution

	execute is
			-- Start 'geuc' execution.
		do
			Arguments.set_program_name ("geuc")
			create error_handler.make_standard
			process_command_line
			create code_points.make (0, Maximum_unicode_code_point)
			parse_character_classes
		end

feature -- processing

	process_command_line is
			-- Process command line arguments.
		do
			-- TODO
		end

	parse_character_classes is
			-- Parse "UnicodeData.txt" for character classes, etc.
		local
			a_file: KL_TEXT_INPUT_FILE
			a_splitter: ST_SPLITTER
			some_fields: DS_LIST [STRING]
			a_hex_code_point, a_name: STRING
			a_code_point, an_index: INTEGER
		do
			create a_file.make ("UnicodeData.txt")
			create a_splitter.make_with_separators (";")
			from a_file.open_read until a_file.end_of_file loop
				a_file.read_line
				if not a_file.end_of_file then
					some_fields := a_splitter.split_greedy (a_file.last_string)
					if some_fields.count /= Field_count then
						report_general_message ("Bad data line in UnicodeData.txt - not enpoug fields - data line is: " + a_file.last_string)
						Exceptions.die (1)
					else
						a_hex_code_point := some_fields.item (1)
						a_name := some_fields.item (2)
						if STRING_.is_hexadecimal (a_hex_code_point) then
							a_code_point := STRING_.hexadecimal_to_integer (a_hex_code_point)
							if is_range_start (a_name) then
								initial_code_point := a_code_point
							elseif is_range_finish (a_name) then
								if initial_code_point <= 0 or else initial_code_point > a_code_point then
									report_general_message ("Invalid start range - data line for end of range is: " + a_file.last_string)
									Exceptions.die (1)
								else
									from an_index := initial_code_point until an_index > a_code_point loop
										process_code_point_class (an_index, a_name.substring (2, a_name.count - 7), some_fields)
										an_index := an_index + 1
									end
								end
							else
								process_code_point_class (a_code_point, a_name, some_fields)
							end
						else
							report_general_message ("Invalid code point - data line is: " + a_file.last_string)
							Exceptions.die (1)
						end
					end
				end
			end
		end

	process_code_point_class (a_code_point: INTEGER; a_name: STRING; some_fields: DS_LIST [STRING]) is
			-- Process character class et. el. for `a_code_point'.
		require
			name_exists: a_name /= Void
			fifteen_fields: some_fields /= Void and then some_fields.count = Field_count
		local
			a_data_point: GEUC_UNICODE_DATA
		do
			create a_data_point.make (a_code_point, a_name, some_fields)
			if a_data_point.is_valid then
				code_points.put (a_data_point, a_code_point)
			else
				report_general_message ("Invalid code point: " + a_code_point.out)
				Exceptions.die (1)
			end
		end

feature -- Access

	code_points: ARRAY [GEUC_UNICODE_DATA]
			-- Parsed data from "UnicodeData.txt" for each code point;
			-- Not that Unicode does not allocate most of the code points,
			--  so many will be `Void'.

	is_range_start (a_name: STRING): BOOLEAN is
			-- Is `a_name' indicating start of range rather than character name?
		require
			name_exists: a_name /= Void
		do
			if a_name.count > 7 and then a_name.substring (a_name.count - 5, a_name.count).is_equal ("First>") then
				Result := True
			end
		end

	is_range_finish (a_name: STRING): BOOLEAN is
			-- Is `a_name' indicating end of range rather than character name?
		require
			name_exists: a_name /= Void
		do
			if a_name.count > 7 and then a_name.substring (a_name.count - 4, a_name.count).is_equal ("Last>") then
				Result := True
			end
		ensure
			at_least_eight_characters_for_range_finish: Result implies a_name.count > 7
		end

feature {NONE} -- Implementation

	error_handler: UT_ERROR_HANDLER
			-- Error handler

	report_general_message (a_message_string: STRING) is
			-- Report a miscellaneous message.
		require
			message_exists: a_message_string /= Void
		local
			an_error: UT_MESSAGE
		do
			create an_error.make (a_message_string)
			error_handler.report_error (an_error)
		end

	initial_code_point: INTEGER
			-- Initial code point for range of characters

invariant

	error_handler_exists: error_handler /= Void

end
	
