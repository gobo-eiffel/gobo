indexing

	description:

		"Objects that split XPointer pointers into tokens"

	library: "Gobo Eiffel XPointer Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPOINTER_TOKENIZER

inherit

	XM_XPOINTER_TOKENS

	KL_IMPORTED_STRING_ROUTINES

create

	make

feature {NONE} -- Initialization

	make (an_input: STRING) is
			-- Prepare a string for tokenization.
		require
			input_string_not_void: an_input /= Void
		do
			set_whitespace_reporting (True) -- to detect initial whitespace, which is an error
			input_index := 1
			input := an_input
			input_length := input.count
		end

feature -- Access

	last_token: INTEGER is
			-- The number identifying the most recently read token
		require
			no_lexical_error: is_lexical_error = False
		do
			Result := current_token
		end

	last_token_value: STRING is
			-- The string value of the most recently read token
		require
			no_lexical_error: is_lexical_error = False
		do
			Result := current_token_value
		ensure
			last_token_value_not_void: Result /= Void
		end


	input: STRING
			-- The string being parsed

	input_length: INTEGER
			-- Length of the input string

	last_lexical_error: STRING is
			-- Error text
		require
			lexical_error: is_lexical_error
		do
			Result := internal_last_lexical_error
		ensure
			text_not_void: Result /= Void
		end

feature -- Status report

	is_lexical_error: BOOLEAN
			-- Was an error reported?

	is_whitespace_reporting: BOOLEAN
			-- Are whitespace characters to be reported as a token?
	
	is_input_stream_exhausted: BOOLEAN is
			-- Are there more characters to read?
		do
			Result := input_index > input_length
		end

feature -- Status setting

	set_whitespace_reporting (a_boolean: BOOLEAN) is
			-- Set `is_whitespace_reporting'.
		do
			is_whitespace_reporting := a_boolean
		ensure
			whitespace_reporting_set: is_whitespace_reporting = a_boolean
		end
		
feature --Element change

	next is
			-- Set `last_token' and `last_token_value' from `input'
		require
			no_previous_error: not is_lexical_error
		do
			is_lexical_error := False
			internal_last_lexical_error := Void
			current_token := Unknown_token
			current_token_value := Void
			was_whitespace_found := False
			if is_input_stream_exhausted then
				current_token := Eof_token
				current_token_value := "EOF"
			else
				current_token_value := Void
				if is_whitespace_reporting then
					eat_whitespace
				end
				if not was_whitespace_found then
					inspect
						input.item (input_index)
					when '^' then
						input_index := input_index + 1
						if is_input_stream_exhausted then
							report_lexical_error ("'^' found at end of input")
						else
							inspect
								input.item (input_index)
							when '(' then
								current_token := Left_escaped_parenthesis_token
								current_token_value := "("
								input_index := input_index + 1
							when ')' then
								current_token := Right_escaped_parenthesis_token
								current_token_value := ")"
								input_index := input_index + 1
							when '^' then
								current_token := Escaped_carat_token
								current_token_value := "^"
								input_index := input_index + 1
							else
								report_lexical_error ("Invalid character found after '^'")
							end
						end
					when '(' then
						current_token := Left_parenthesis_token
						current_token_value := "("
						input_index := input_index + 1
					when ')' then
						current_token := Right_parenthesis_token
						current_token_value := ")"
						input_index := input_index + 1
					else
						accumulate_string_token
					end
				end
			end
		ensure
			token_value_set_if_no_error: not is_lexical_error implies last_token_value /= Void
		end

feature {NONE} -- Implementation
	
	report_lexical_error (a_message: STRING) is
			-- Report a lexical error.
		require
			no_previous_error: not is_lexical_error
			error_message_not_empty: a_message /= Void and then a_message.count > 0
		do
			is_lexical_error := True
			internal_last_lexical_error := a_message
		ensure
			in_error: is_lexical_error
			correct_error_value: STRING_.same_string (internal_last_lexical_error, a_message)
		end

	input_index: INTEGER
			-- The current position within `input'

	internal_last_lexical_error: STRING
			-- Error text of last lexical error

	current_token: INTEGER
			-- The number identifying the most recently read token

	current_token_value: STRING
			-- The string value of the most recently read token

	was_whitespace_found: BOOLEAN
			-- Set when `eat_whitespace' finds whitespace characters
	
	whitespace: STRING is " %R%T%N"
		-- White space charaters as per XML 1.0

	eat_whitespace is
			-- Consume all whitespace characters.
		require
			whitespace_reporting: is_whitespace_reporting
			whitespace_not_found: not was_whitespace_found
			input_stream_not_exhausted: not is_input_stream_exhausted
		do
			current_token_value := Void
			if whitespace.has (input.item (input_index)) then
				current_token_value := whitespace
				current_token := Whitespace_token
				was_whitespace_found := True
				from
				until
					is_input_stream_exhausted or else not whitespace.has (input.item (input_index))
				loop
					input_index := input_index + 1
				end
			end
		ensure
			whitespace_found_sets_token: was_whitespace_found implies current_token = Whitespace_token
				and then STRING_.same_string (current_token_value, whitespace)
			whitespace_not_found_unsets_token: not was_whitespace_found implies current_token_value = Void
			next_character_not_whitespace: is_input_stream_exhausted or else not whitespace.has (input.item (input_index))
		end
	
	accumulate_string_token is
			-- Accumulate characters and return a string.
		require
			input_stream_not_exhausted: not is_input_stream_exhausted
		local
			a_start_index: INTEGER
			finished: BOOLEAN
		do
			set_whitespace_reporting (False)
			current_token := String_token
			from
				a_start_index := input_index
			until
				finished
			loop
				if is_input_stream_exhausted then
					finished := True
				else
					inspect
						input.item (input_index)						
					when '(', ')', '^' then
						finished := True
					else
						-- Nothing to do
					end
				end
				if not finished then input_index := input_index + 1 end
			end
			if not is_lexical_error then
				current_token_value := input.substring (a_start_index, input_index - 1)
			end
		ensure
			token_is_string: current_token = String_token
			token_value_set_if_no_error: not is_lexical_error implies last_token_value /= Void
		end

end
	
