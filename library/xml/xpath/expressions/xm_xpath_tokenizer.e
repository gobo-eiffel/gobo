indexing

	description:

		"Objects that split XPath expressions into tokens"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	derivation: "See notice at bottom of file"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TOKENIZER

inherit

	XM_XPATH_TOKENS
	
	KL_IMPORTED_STRING_ROUTINES

	KL_SHARED_STANDARD_FILES

creation

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			preceding_token := Unknown_token
			current_token := Eof_token
			next_token := Eof_token
			next_token_start_index := 1
			input_index := 1
			line_number := 1
			next_line_number := 1
			input := Void
		end
	
feature -- Tokenizer states
	
	Default_state: INTEGER is 0
			-- Initial state of the tokenizer

	Bare_name_state: INTEGER is 1
			-- State in which a name is NOT to be merged with what comes next, for example "("

	Sequence_type_state: INTEGER is 2
			-- State in which the next thing to be read is a sequence type

	Operator_state: INTEGER is 2
			-- State in which the next thing to be read is an operator
			--  review -  these last two are the same - I think that is because
			-- Saxon supports XQuery as well as XSLT. NO. States don't appear to be used any more

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

	last_lexical_error: STRING is
			-- Error text
		require
			lexical_error: is_lexical_error
		do
			Result := internal_last_lexical_error
		ensure
			text_not_void: Result /= Void
		end

	recent_text: STRING is
			-- Most recently read text;
			-- (for use in an error message)
		local
			normalizer: XM_XPATH_NORMALIZE_SPACE
			an_index: INTEGER
			s: STRING
		do
			if input_index > input.count then
				an_index := input.count
			else
				an_index := input_index
			end

			if an_index < 34 then
				Result := input.substring (1, an_index)
			else
				create normalizer.make
				s := "..."
				s := STRING_.appended_string (s, input.substring (an_index - 30, an_index))
				Result := normalizer.normalize (s)
			end
			
		ensure
			recent_text_not_void: Result /= Void
		end

feature -- Status report

	state: INTEGER
			-- State

	is_input_stream_exhausted: BOOLEAN is
			-- Are there more characters to read?
		do
			Result := input_index > input.count + 2 -- + 2 for the mythical EOF character
		end
	
	line_number: INTEGER
			-- The line number (within the expression) of the current token

	is_lexical_error: BOOLEAN
			-- Did `look_ahead' find an error?
	
feature -- Status setting

	set_state (new_state: INTEGER) is
			-- Set `state' to `new_state'.
		require
			valid_state: new_state >= Default_state and new_state <= Operator_state
		do
			state := new_state
			if state = Default_state then
				-- Force the is_operator test to return `True'.
				preceding_token := Unknown_token
				current_token := Unknown_token
			elseif state = Operator_state then
				preceding_token := Right_parenthesis_token
				current_token := Right_parenthesis_token
			end
		ensure
			set: state = new_state
		end

	tokenize (an_input: STRING) is
			-- Prepare a string for tokenization.
		require
			input_string_not_void: an_input /= Void
		do
			next_token := Eof_token
			next_token_value := Void
			next_token_start_index := 1
			input_index := 1
			input := an_input
				check
					no_error_yet: not is_lexical_error
				end
			look_ahead
			next
		end


	treat_current_as_operator is
			-- Force the current token to be treated as an operator if possible
		local
			operator_type: INTEGER
		do
			inspect
				current_token
			when Name_token then
				operator_type := binary_operator (current_token_value)
				if operator_type /= Unknown_token then
					current_token := operator_type
				end
			when Star_token then
				current_token := Multiply_token
			else
				do_nothing
			end
		end
	
feature --Element change

	next is
			-- Set `last_token' and `last_token_value' from `input'
		require
			no_previous_error: not is_lexical_error
		local
			operator_type, candidate, saved_position: INTEGER
			qname, saved_token_value, composite: STRING
			finished, retried: BOOLEAN
		do
			is_lexical_error := False
			internal_last_lexical_error := Void
			preceding_token := current_token
			current_token := next_token
			current_token_value := next_token_value
			line_number := next_line_number

			debug ("XPath tokens")
				std.error.put_string ("Current token is now ")
				if is_valid_token (current_token) then
					std.error.put_string (token_name (current_token))
				else
					std.error.put_string (current_token.out)
				end
				std.error.put_new_line
			end

			-- disambiguate the current token based on the tokenizer state
				
			inspect
				current_token
			when Name_token then
				operator_type := binary_operator (current_token_value)
				debug ("XPath tokens")
					std.error.put_string ("Operator type is ")
					if is_valid_token (operator_type) then
						std.error.put_string (token_name (operator_type))
					else
						std.error.put_string (operator_type.out)
					end
				std.error.put_new_line
			end
				if operator_type /= Unknown_token and then not is_operator then
					current_token := operator_type
				end
			when Less_than_token then
				if is_operator then current_token := Tag_token end
			when Star_token then
				if not is_operator then current_token := Multiply_token end
			else
				do_nothing
			end
				
			if current_token = Tag_token or else current_token = Right_curly_token then
				do_nothing -- finished
					
				-- No lookahead after encountering "<" at the start of an XML-like tag.
				-- After an `Right_curly_token', the parser must do an explicit `look_ahead' to continue
				-- tokenizing; otherwise it can continue with direct character reading
			elseif not is_lexical_error then
				look_ahead
					
				if current_token = Name_token then
					if state = Bare_name_state then
						do_nothing -- finished
					else
						inspect
							next_token
								
						when Left_parenthesis_token then
							operator_type := binary_operator (current_token_value)
							if operator_type /= Unknown_token then
								current_token := operator_type
							else
								current_token := function_type (current_token_value)
								if not is_lexical_error then look_ahead  end -- swallow the (
							end
								
						when Left_curly_token then
							if state /= Sequence_type_state then
								current_token := Keyword_curly_token
								if not is_lexical_error then look_ahead  end -- swallow the (
							end
							
						when Colon_colon_token then
							if not is_lexical_error then 
								look_ahead
								current_token := Axis_token
								debug ("XPath tokens")
									std.error.put_string ("Current token is Axis_token")
									std.error.put_new_line
								end
							end
							
						when Colon_star_token then
							if not is_lexical_error then
								look_ahead
								current_token := Prefix_token
							end
							
						when Dollar_token then
							debug ("XPath tokens")
								std.error.put_string ("Next token is dollar_token, current_token value is ")
								std.error.put_string (current_token_value)
								std.error.put_new_line
							end
							if STRING_.same_string (current_token_value, "for") then
								current_token := For_token
							elseif STRING_.same_string (current_token_value, "some") then
								current_token := Some_token
							elseif STRING_.same_string (current_token_value, "every") then
								current_token := Every_token
							elseif STRING_.same_string (current_token_value, "let") then
								current_token := Let_token
							end

						when Name_token then
							candidate := -1
							if STRING_.same_string (current_token_value, "element") then
								candidate := Element_qname_token
							elseif STRING_.same_string (current_token_value, "attribute") then
								candidate := Attribute_qname_token
							elseif STRING_.same_string (current_token_value, "pi") then
								candidate := Pi_qname_token
							end

							if candidate /= -1 then

								-- <'element' QName '{'> constructor
								-- <'attribute' QName '{'> constructor
								-- <'pi' QName '{'> constructor

								qname := next_token_value
								saved_token_value := current_token_value
								saved_position := input_index
									check
										no_error_yet: not is_lexical_error
									end
								look_ahead

								if not is_lexical_error then
									if next_token = Left_curly_token then
										current_token := candidate
										current_token_value := qname
										look_ahead
										finished := True
									else
										
										-- backtrack (we don't have 2-token lookahead; this is the
										-- only case where it's needed. So we backtrack instead.)
										
										current_token := Name_token
										current_token_value := saved_token_value
										input_index := saved_position
										next_token := Name_token
										next_token_value := qname
									end
								end

								if not finished then
									composite := clone (current_token_value)
									composite := STRING_.appended_string (composite, " ")
									composite := STRING_.appended_string (composite, next_token_value)

									if double_keywords.has (composite) then
										current_token := double_keywords.item (composite)
										current_token_value := composite
										look_ahead
									end
								end
							end
							
						else
							do_nothing
						end
					end
				end
			end
			debug ("XPath tokens")
				std.error.put_string ("Current token on exit from next is set to ")
				if is_valid_token (current_token) then
					std.error.put_string (token_name (current_token))
				else
					std.error.put_string (current_token.out)
				end
				std.error.put_string (", value is ")
				std.error.put_string (current_token_value)
				std.error.put_new_line
			end
		ensure
			tokens_set_if_no_error: not is_lexical_error implies last_token_value /= Void
		end
	
feature {NONE} -- Status setting

	-- The export status of this next routine may well change
	-- to enable it to be called by an XQuery parser class
	
	look_ahead is
			-- Look ahead by one token;
			-- This method does the real tokenization work;
			-- The method is normally called internally, but an XQuery parser
			-- may also call it to resume normal tokenization after
			-- dealing with pseudo-XML syntax.
		require
			no_previous_lexical_error: is_lexical_error = False
			more_characters_in_input_stream: not is_input_stream_exhausted
		local
			finished, finished_inner, finished_other, allow_e, allow_sign, allow_dot, end_of_number, only_state_change: BOOLEAN
			c, nc, ahead: CHARACTER
			nesting_depth, i: INTEGER
		do
			from
				preceding_token := next_token
				next_token_value := ""
				next_token_start_index := input_index
				internal_last_lexical_error := ""
			variant
				input.count + 3 - input_index  -- + 3 to allow for setting the EOF token
			until
				finished
			loop
				if input_index > input.count then
					next_token := Eof_token
					finished := True; input_index := input_index + 1
				else
					c := input.item (input_index); input_index := input_index + 1
					inspect
						c
						
					when ':' then
						if input_index < input.count then
							if input.item (input_index) = ':' then
								input_index := input_index + 1
								next_token := Colon_colon_token
								finished := True
							elseif input.item (input_index) = '=' then
								input_index := input_index + 1
								next_token := Assign_token
								finished := True
							else
								is_lexical_error := True
								internal_last_lexical_error := "Unexpected colon at start of token"
								finished := True
							end
						end
						
					when '@' then
						next_token := At_token
						finished := True
						
					when '?' then
						next_token := Question_mark_token
						finished := True

					when '[' then
						next_token := Left_square_bracket_token
						finished := True
							
					when ']' then
						next_token := Right_square_bracket_token
						finished := True
						
					when '{' then
						next_token := Left_curly_token
						finished := True
						
					when '}' then
						next_token := Right_curly_token
						finished := True
						
					when ';' then
						next_token := Semicolon_token
						state := Default_state
						finished := True
						
					when '(' then
						if input_index < input.count and then input.item (input_index) = ':' then

							-- XPath comment syntax is (: .... :)
							-- Comments may be nested

							input_index := input_index + 1
							from
								nesting_depth := 1
							variant
								input.count - input_index
							until
								nesting_depth = 0 or else input_index > input.count - 1
							loop
								if input.item (input_index) = '%N' then
									next_line_number := next_line_number + 1
								elseif input.item (input_index) = ':'  and then input.item (input_index + 1) = '%)'  then
									nesting_depth := nesting_depth - 1
									input_index := input_index + 1
								elseif input.item (input_index) = '('  and then input.item (input_index + 1) = ':'  then
									nesting_depth := nesting_depth + 1
									input_index := input_index + 1
								end
								input_index := input_index + 1
							end
							if nesting_depth > 0 then
								is_lexical_error := True
								internal_last_lexical_error := "Unclosed XPath comment"
							else
								look_ahead
							end
						else
							next_token := Left_parenthesis_token
						end
						finished := True
						
					when ')' then
									next_token := Right_parenthesis_token
									finished := True

					when '+' then
						next_token := Plus_token
						finished := True

					when '-' then
						next_token := Minus_token -- Not detected if part of a name
						finished := True

					when '=' then
						next_token := Equals_token
						finished := True
						
					when '!' then
						if input_index < input.count and then input.item (input_index) = '=' then
							input_index := input_index + 1
							next_token := Not_equal_token
						else
							is_lexical_error := True
							internal_last_lexical_error := "%"!%" without %"=%" in expression"
						end
						finished := True
						
					when '*' then
						if input_index < input.count and then input.item (input_index) = ':' then
							input_index := input_index + 1
							next_token := Suffix_token

							-- we leave the parser to get the following name as a separate
							-- token, but first check there's no intervening white space

							if input_index < input.count then
								ahead := input.item (input_index)
								if whitespace.has(ahead) then
									is_lexical_error := True
									internal_last_lexical_error :=  "Whitespace is not allowed after '*:'"
								end
							end
						else
							next_token := Star_token
						end
						finished := True

					when ',' then
						next_token := Comma_token
						finished := True
						
					when '$' then
						next_token := Dollar_token
						finished := True
						
					when '|' then
						next_token := Union_token
						finished := True
						
					when '<' then
						if input_index < input.count and then input.item (input_index) = '=' then
							input_index := input_index + 1
							next_token := Less_equal_token
						elseif input_index < input.count and then input.item (input_index) = '<' then
							input_index := input_index + 1
							next_token := Precedes_token
						else
							next_token := Less_than_token
						end
						finished := True

					when '>' then
						if input_index < input.count and then input.item (input_index) = '=' then
							input_index := input_index + 1
							next_token := Greater_equal_token
						elseif input_index < input.count and then input.item (input_index) = '>' then
							input_index := input_index + 1
							next_token := Follows_token
						else
							next_token := Greater_than_token
						end
						finished := True

					when '/' then
						if input_index < input.count and then input.item (input_index) = '/' then
							input_index := input_index + 1
							next_token := Slash_slash_token
							finished := True
						else
							next_token := Slash_token
							finished := True
						end
							
					when '.', '0'..'9' then
						
						-- The logic here can return some tokens that are not legitimate numbers,
						-- for example "23e" or "1.0e+". However, this will only happen if the XPath
						-- expression as a whole is syntactically incorrect.
						-- These errors will be caught by the numeric creation procedure.

						if c = '.' then
							if input_index < input.count and then input.item (input_index) = '.' then
								input_index := input_index + 1
								next_token := Dot_dot_token
								finished := True
							elseif input_index = input.count
								or else input.item (input_index) < '0'
								or else input.item (input_index) > '9' then
								next_token := Dot_token
								finished := True
							end
						end
						if not finished then
							from
								allow_e := True
								allow_sign := False
								allow_dot := True
								end_of_number := False
							until
								end_of_number
							loop
								only_state_change := False
								inspect
									c
								when '0'..'9' then
									allow_sign := False
								when '.' then
									if allow_dot then
										allow_dot := False
										allow_sign := False
									else
										input_index := input_index - 1
										only_state_change := True
									end
								when 'E' then
									if allow_e then
										allow_sign := True
										allow_e := False
									else
										input_index := input_index - 1
										only_state_change := True
									end
								when 'e' then
									if allow_e then
										allow_sign := True
										allow_e := False
									else
										input_index := input_index - 1
										only_state_change := True
									end
								when '+' then
									if allow_sign then
										allow_sign := False
									else
										input_index := input_index - 1
										only_state_change := True
									end
								when '-' then
									if allow_sign then
										allow_sign := False
									else
										input_index := input_index - 1
										only_state_change := True
									end
								else
									input_index := input_index - 1
									only_state_change := True
									end_of_number := True
								end
								if not only_state_change then
									if input_index > input.count then
										end_of_number := True
									else
										c := input.item (input_index); input_index := input_index + 1
									end
								end
							end
							next_token_value := input.substring (next_token_start_index, input_index - 1)
						end
						next_token := Number_token
						finished := True
						
					when '"', '%'' then
						next_token_value := ""
						from
							finished_inner := False
						until
							finished or else finished_inner
						loop
							input_index := input.index_of (c, input_index + 1)
							if input_index = 0 then
								input_index := next_token_start_index + 1
								is_lexical_error := True
								internal_last_lexical_error :=  "Unmatched quote in expression"
								finished := True
								finished_inner := True
							else
								next_token_value := STRING_.appended_string (next_token_value, input.substring (next_token_start_index + 1, input_index - 1))
								input_index := input_index + 1

								-- look for doubled delimiters

								if input_index < input.count and then input.item (input_index) = c then
									next_token_value := STRING_.appended_string (next_token_value, c.out)
									next_token_start_index := input_index
									input_index := input_index + 1
								else
									finished_inner := True
								end
							end
						end

						-- maintain line number if there are newlines in the string

						if next_token_value.index_of ('%N', 1) > 0 then
							from
								i := 1
							variant
								next_token_value.count + 1 - 1
							until
								i > next_token_value.count
							loop
								if next_token_value.item (i) = '%N' then
									line_number := line_number + 1
								end
								i := i + 1
							end
						end
						next_token_value := clone (next_token_value)
						next_token  := String_literal_token
						finished := True
						
					when '%N' then
						line_number := line_number + 1
						next_token_start_index := input_index

					when ' ', '%R', '%T' then
						next_token_start_index := input_index

					else
						if c /= '_' then
							if c < 'A' or else c > 'Z' and c < 'a' or else c > 'z' then
								is_lexical_error := True
								internal_last_lexical_error :=  "Invalid character ("
								internal_last_lexical_error :=  STRING_.appended_string (internal_last_lexical_error, c.out)
								internal_last_lexical_error :=  STRING_.appended_string (internal_last_lexical_error, ") in expression")
								finished := True	
							end
						end
						from
							finished_other := False
						until
							finished or else finished_other or else input_index > input.count
						loop
							c := input.item (input_index)
							inspect
								c
							when ':'  then
								if input_index + 1 <= input.count then
									nc := input.item (input_index + 1)
									if nc = ':' then
										next_token_value := input.substring (next_token_start_index, input_index - 1)
										next_token := Axis_token
										--input_index := input_index + 2
										finished := True
										finished_other := True
									elseif nc = '*' then
										next_token_value := input.substring (next_token_start_index, input_index - 1)
										next_token := Prefix_token
										--input_index := input_index + 2
										finished := True
									elseif nc = '=' then

										-- as in "let $x:=2"
										
										next_token_value := input.substring (next_token_start_index, input_index - 1)
										next_token := Name_token
										finished := True										
									end
								end
							when '-', '_','.'  then
								do_nothing
							else
								if c.code < 128 then
									if c < '0' or else ( c > '9' and then c < 'A') or else (c > 'Z' and c < 'a') or else c > 'z' then
										finished_other := True
									end
								end
							end
							if not finished_other then input_index := input_index + 1 end
						end
						next_token_value := input.substring (next_token_start_index, input_index - 1)
						next_token := Name_token
						finished := True
					end
				end
			end
			debug ("XPath tokens")
				std.error.put_string ("Next token on exit from look-ahead is set to ")
				if is_valid_token (next_token) then
					std.error.put_string (token_name (next_token))
				else
					std.error.put_string (next_token.out)
				end
				std.error.put_string (", value is ")
				std.error.put_string (next_token_value)
				std.error.put_new_line
			end
		end

feature {NONE} -- Implementation

	next_token: INTEGER
			-- The number of the next token to be returned

	next_token_value: STRING
		-- The string value of the next token to be read
		
	next_token_start_index: INTEGER
			-- The position in the expression of the start of the next token

	input_index: INTEGER
			-- The current position within the input string

	next_line_number: INTEGER
			-- The line number (within the expression) of the next token

	internal_last_lexical_error: STRING
			-- Error text of last lexical error

	current_token: INTEGER
			-- The number identifying the most recently read token

	current_token_value: STRING
			-- The string value of the most recently read token

	preceding_token: INTEGER
			-- The token number of the token that preceded the current token

	whitespace: STRING is " %R%T%N"
			-- White space charaters
	
	binary_operator (a_string: STRING): INTEGER is
			-- Identify a binary operator
		require
			string_not_void: a_string /= Void
		do
			Result := Unknown_token
			inspect
				a_string.count
			when 2 then
				if STRING_.same_string (a_string, "or") then
					Result := Or_token
				elseif STRING_.same_string (a_string, "is") then
					Result := Is_token
				elseif STRING_.same_string (a_string, "to") then
					Result := To_token
				elseif STRING_.same_string (a_string, "in") then
					Result := In_token
				elseif STRING_.same_string (a_string, "eq") then
					Result := Fortran_equal_token
				elseif STRING_.same_string (a_string, "ne") then
					Result := Fortran_not_equal_token
				elseif STRING_.same_string (a_string, "gt") then
					Result := Fortran_greater_than_token
				elseif STRING_.same_string (a_string, "ge") then
					Result := Fortran_greater_equal_token
				elseif STRING_.same_string (a_string, "lt") then
					Result := Fortran_less_than_token
				elseif STRING_.same_string (a_string, "le") then
					Result := Fortran_less_equal_token
				end
			when 3 then
				if STRING_.same_string (a_string, "and") then
					Result := And_token
				elseif STRING_.same_string (a_string, "div") then
					Result := Division_token
				elseif STRING_.same_string (a_string, "mod") then
					Result := Modulus_token
				end
			when 4 then
				if STRING_.same_string (a_string, "idiv") then
					Result := Integer_division_token
				elseif STRING_.same_string (a_string, "then") then
					Result := Then_token
				elseif STRING_.same_string (a_string, "else") then
					Result := Else_token
				elseif STRING_.same_string (a_string, "case") then
					Result := Case_token
				end
			when 5 then
				if STRING_.same_string (a_string, "union") then
					Result := Union_token
				end
			when 6 then
				if STRING_.same_string (a_string, "except") then
					Result := Except_token
				elseif STRING_.same_string (a_string, "return") then
					Result := Return_token
				end
			when 7 then
				if STRING_.same_string (a_string, "default") then
					Result := Default_token
				end
			when 9 then
				if STRING_.same_string (a_string, "intersect") then
					Result := Intersect_token
				elseif STRING_.same_string (a_string, "satisfies") then
					Result := Satisfies_token
				end				
			else
				do_nothing
			end
		end
	
		function_type (a_string: STRING): INTEGER is
			-- Distinguish nodekind names, "if", and function names, which are all followed by a "("
		require
			string_not_void: a_string /= Void
		do
			Result := Function_token
			inspect
				a_string.count
			when 2 then
				if STRING_.same_string (a_string, "if") then
					Result := If_token
				end
			when 4 then
				if STRING_.same_string (a_string, "node") then
					Result := Node_kind_token
				elseif STRING_.same_string (a_string, "item") then
					Result := Node_kind_token
				elseif STRING_.same_string (a_string, "text") then
					Result := Node_kind_token
				end
			when 7 then
				if STRING_.same_string (a_string, "element") then
					Result := Node_kind_token
				elseif STRING_.same_string (a_string, "comment") then
					Result := Node_kind_token
				end
			when 9 then
				if STRING_.same_string (a_string, "attribute") then
					Result := Node_kind_token
				elseif STRING_.same_string (a_string, "namespace") then
					Result := Node_kind_token
				end
			when 10 then
				if STRING_.same_string (a_string, "typeswitch") then
					Result := Typeswitch_token
				end
			else
				if STRING_.same_string (a_string, "document-node") then
					Result := Node_kind_token
				elseif STRING_.same_string (a_string, "processing-instruction") then
					Result := Node_kind_token
				end
			end
		end

	is_operator: BOOLEAN is
			-- Test whether the previous token is an operator
		do
			Result := preceding_token <= Last_operator
		end
		
	double_keywords: DS_HASH_TABLE [INTEGER, STRING] is
			-- Lookup table for composite (two-keyword) tokens
		once
			create Result.make (30)
			double_keywords.put (Instance_of_token, "instance of")
			double_keywords.put (Cast_as_token, "cast as")
			double_keywords.put (Treat_as_token, "treat as")
			double_keywords.put (Castable_as_token, "castable as")
			double_keywords.put (Xquery_version_token, "xquery version")
			double_keywords.put (Declare_namespace_token, "declare namespace")
			double_keywords.put (Declare_default_token, "declare default")
			double_keywords.put (Declare_base_uri_token, "declare base-uri")
			double_keywords.put (Declare_xml_space_token, "declare xmlspace")
			double_keywords.put (Import_schema_token, "import schema")			
			double_keywords.put (Import_module_token, "import module")
			double_keywords.put (Declare_variable_token, "declare variable")
			double_keywords.put (Declare_function_token, "declare function")
			double_keywords.put (Module_namespace_token, "module namespace")			
						
		end
	
	
invariant

	tokens_not_void: tokens /= Void
	double_keywords_not_void: double_keywords /= Void
	
end

-- The logic in this class ultimately (via Michael Kay's Saxon product)
-- derives from James Clark's xt product:

-- The following copyright notice is copied from the licence for xt,
-- from which the this module was derived:
--------------------------------------------------------------------------------
-- Copyright (c) 1998, 1999 James Clark

-- Permission is hereby granted, free of charge, to any person obtaining
-- a copy of this software and associated documentation files (the
-- "Software"), to deal in the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish,
-- distribute, sublicense, and/or sell copies of the Software, and to
-- permit persons to whom the Software is furnished to do so, subject to
-- the following conditions:

-- The above copyright notice and this permission notice shall be included
-- in all copies or substantial portions of the Software.

-- THE SOFTWARE IS PROVIDED ``AS IS'', WITHOUT WARRANTY OF ANY KIND, EXPRESS
-- OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-- MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
-- IN NO EVENT SHALL JAMES CLARK BE LIABLE FOR ANY CLAIM, DAMAGES OR
-- OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
-- ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
-- OTHER DEALINGS IN THE SOFTWARE.

-- Except as contained in this notice, the name of James Clark shall
-- not be used in advertising or otherwise to promote the sale, use or
-- other dealings in this Software without prior written authorization
-- from James Clark.
---------------------------------------------------------------------------
