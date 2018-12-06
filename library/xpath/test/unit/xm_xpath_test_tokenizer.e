note

	description:

		"Test expression tokenizer"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2018, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TEST_TOKENIZER

inherit

	TS_TEST_CASE

	XM_XPATH_TOKENS

	KL_IMPORTED_STRING_ROUTINES

create

	make_default

feature -- Test

	test_simple
		local
			tokenizer: XM_XPATH_TOKENIZER
			a_string: STRING
		do
			a_string := "boolean($fred = 'happy')"
			create tokenizer.make
			tokenizer.tokenize (a_string, 1, -1, 1)
			assert ("No lexical error 1", not tokenizer.is_lexical_error)
			assert ("Function token", tokenizer.last_token = Function_token)
			assert ("Function is boolean()", STRING_.same_string (tokenizer.last_token_value, "boolean"))

			tokenizer.next
			assert ("No lexical error 2", not tokenizer.is_lexical_error)
			assert ("Dollar token", tokenizer.last_token = Dollar_token)

			tokenizer.next
			assert ("No lexical error 3", not tokenizer.is_lexical_error)
			assert ("Name token", tokenizer.last_token = Name_token)
			assert ("Name is fred", STRING_.same_string (tokenizer.last_token_value, "fred"))

			tokenizer.next
			assert ("No lexical error 4", not tokenizer.is_lexical_error)
			assert ("Equals token", tokenizer.last_token = Equals_token)

			tokenizer.next
			assert ("No lexical error 5", not tokenizer.is_lexical_error)
			assert ("String literal token", tokenizer.last_token = String_literal_token)
			assert ("String value", STRING_.same_string (tokenizer.last_token_value, "happy"))

			tokenizer.next
			assert ("No lexical error 6", not tokenizer.is_lexical_error)
			assert ("Right parenthesis token", tokenizer.last_token = Right_parenthesis_token)

			tokenizer.next
			assert ("EOF", tokenizer.last_token = Eof_token)
			assert ("Input stream exhausted", tokenizer.is_input_stream_exhausted)
		end

	test_path_with_predicate
		local
			tokenizer: XM_XPATH_TOKENIZER
			a_string: STRING
		do
			a_string := "//fred[@son='Jim']"

		create tokenizer.make
			tokenizer.tokenize (a_string, 1, -1, 1)
			assert ("No lexical error 1", not tokenizer.is_lexical_error)
			assert ("Ancestor token", tokenizer.last_token = Slash_slash_token)

			tokenizer.next
			assert ("No lexical error 2", not tokenizer.is_lexical_error)
			assert ("Name token", tokenizer.last_token = Name_token)
			assert ("Name is fred", STRING_.same_string (tokenizer.last_token_value, "fred"))

			tokenizer.next
			assert ("No lexical error 3", not tokenizer.is_lexical_error)
			assert ("LSQB token", tokenizer.last_token = Left_square_bracket_token)

			tokenizer.next
			assert ("No lexical error 4", not tokenizer.is_lexical_error)
			assert ("At token", tokenizer.last_token = At_token)

			tokenizer.next
			assert ("No lexical error 5", not tokenizer.is_lexical_error)
			assert ("Name token 2", tokenizer.last_token = Name_token)
			assert ("Name is son", STRING_.same_string (tokenizer.last_token_value, "son"))

			tokenizer.next
			assert ("No lexical error 6", not tokenizer.is_lexical_error)
			assert ("Equals token", tokenizer.last_token = Equals_token)

			tokenizer.next
			assert ("No lexical error 7", not tokenizer.is_lexical_error)
			assert ("String literal token", tokenizer.last_token = String_literal_token)
			assert ("String value", STRING_.same_string (tokenizer.last_token_value, "Jim"))

			tokenizer.next
			assert ("No lexical error 8", not tokenizer.is_lexical_error)
			assert ("RSQB token", tokenizer.last_token = Right_square_bracket_token)

			tokenizer.next
			assert ("EOF", tokenizer.last_token = Eof_token)
			assert ("Input stream exhausted", tokenizer.is_input_stream_exhausted)
		end

	test_path_with_predicate_including_axis
		local
			tokenizer: XM_XPATH_TOKENIZER
			a_string: STRING
		do
			a_string := "//fred[attribute::son='Jim']"

		create tokenizer.make
			tokenizer.tokenize (a_string, 1, -1, 1)
			assert ("No lexical error 1", not tokenizer.is_lexical_error)
			assert ("Ancestor token", tokenizer.last_token = Slash_slash_token)

			tokenizer.next
			assert ("No lexical error 2", not tokenizer.is_lexical_error)
			assert ("Name token", tokenizer.last_token = Name_token)
			assert ("Name is fred", STRING_.same_string (tokenizer.last_token_value, "fred"))

			tokenizer.next
			assert ("No lexical error 3", not tokenizer.is_lexical_error)
			assert ("LSQB token", tokenizer.last_token = Left_square_bracket_token)

			tokenizer.next
			assert ("No lexical error 4", not tokenizer.is_lexical_error)
			assert ("Axis token", tokenizer.last_token = Axis_token)
			assert ("Attribute axis", STRING_.same_string (tokenizer.last_token_value, "attribute"))

			tokenizer.next
			assert ("No lexical error 5", not tokenizer.is_lexical_error)
			assert ("Name token 2", tokenizer.last_token = Name_token)
			assert ("Name is son", STRING_.same_string (tokenizer.last_token_value, "son"))

			tokenizer.next
			assert ("No lexical error 6", not tokenizer.is_lexical_error)
			assert ("Equals token", tokenizer.last_token = Equals_token)

			tokenizer.next
			assert ("No lexical error 7", not tokenizer.is_lexical_error)
			assert ("String literal token", tokenizer.last_token = String_literal_token)
			assert ("String value", STRING_.same_string (tokenizer.last_token_value, "Jim"))

			tokenizer.next
			assert ("No lexical error 8", not tokenizer.is_lexical_error)
			assert ("RSQB token", tokenizer.last_token = Right_square_bracket_token)

			tokenizer.next
			assert ("EOF", tokenizer.last_token = Eof_token)
			assert ("Input stream exhausted", tokenizer.is_input_stream_exhausted)
		end

	test_numeric
		local
			tokenizer: XM_XPATH_TOKENIZER
			a_string: STRING
		do
			a_string := "boolean($fred = .78 + 3.45E6)"
			create tokenizer.make
			tokenizer.tokenize (a_string, 1, -1, 1)
			tokenizer.next
			tokenizer.next
			tokenizer.next
			tokenizer.next
			assert ("Number", tokenizer.last_token = Number_token)
			assert ("Numeric value", STRING_.same_string (tokenizer.last_token_value, ".78"))
			tokenizer.next
			tokenizer.next
			assert ("Number", tokenizer.last_token = Number_token)
			assert ("Numeric value", STRING_.same_string (tokenizer.last_token_value, "3.45E6"))
			tokenizer.next
			tokenizer.next
			assert ("EOF", tokenizer.last_token = Eof_token)
			assert ("Input stream exhausted", tokenizer.is_input_stream_exhausted)
		end

	test_unexpected_colon
		local
			tokenizer: XM_XPATH_TOKENIZER
			a_string: STRING
		do
			a_string := "boolean($fred :@ 'happy')"
			create tokenizer.make
			tokenizer.tokenize (a_string, 1, -1, 1)
			tokenizer.next
			tokenizer.next
			assert ("Lexical error", tokenizer.is_lexical_error)
			assert ("Unexpected token", STRING_.same_string (tokenizer.last_lexical_error, "Unexpected colon at start of token"))
		end

	test_unclosed_xpath_comment
		local
			tokenizer: XM_XPATH_TOKENIZER
			a_string: STRING
		do
			a_string := "boolean($fred (::@ (:'happy':) oops)"
			create tokenizer.make
			tokenizer.tokenize (a_string, 1, -1, 1)
			tokenizer.next
			tokenizer.next
			assert ("Lexical error", tokenizer.is_lexical_error)
			assert ("Unexpected token", STRING_.same_string (tokenizer.last_lexical_error, "Unclosed XPath comment"))
		end

	test_unexpected_exclamation_mark
		local
			tokenizer: XM_XPATH_TOKENIZER
			a_string: STRING
		do
			a_string := "boolean($fred !@ 'happy')"
			create tokenizer.make
			tokenizer.tokenize (a_string, 1, -1, 1)
			tokenizer.next
			tokenizer.next
			assert ("Lexical error", tokenizer.is_lexical_error)
			assert ("Unexpected token", STRING_.same_string (tokenizer.last_lexical_error, "%"!%" without %"=%" in expression"))
		end

	test_illegal_whitespace
		local
			tokenizer: XM_XPATH_TOKENIZER
			a_string: STRING
		do
			a_string := "boolean($fred *: 'happy')"
			create tokenizer.make
			tokenizer.tokenize (a_string, 1, -1, 1)
			tokenizer.next
			tokenizer.next
			assert ("Lexical error", tokenizer.is_lexical_error)
			assert ("Unexpected token", STRING_.same_string (tokenizer.last_lexical_error, "Whitespace is not allowed after '*:'"))
		end

	test_unmatched_quote
		local
			tokenizer: XM_XPATH_TOKENIZER
			a_string: STRING
		do
			a_string := "boolean($fred  'happy%")"
			create tokenizer.make
			tokenizer.tokenize (a_string, 1, -1, 1)
			tokenizer.next
			tokenizer.next
			assert ("Lexical error", tokenizer.is_lexical_error)
			assert ("Unexpected token", STRING_.same_string (tokenizer.last_lexical_error, "Unmatched quote in expression"))
		end

	test_invalid_character
		local
			tokenizer: XM_XPATH_TOKENIZER
			a_string: STRING
		do
			a_string := "boolean($fred #= 'happy')"
			create tokenizer.make
			tokenizer.tokenize (a_string, 1, -1, 1)
			tokenizer.next
			tokenizer.next
			assert ("Lexical error", tokenizer.is_lexical_error)
			assert ("Unexpected token", STRING_.same_string (tokenizer.last_lexical_error, "Invalid character (#) in expression"))
		end

feature -- Debugging

		display_current_token (tokenizer: XM_XPATH_TOKENIZER): STRING
			-- Display the current token for an error message
		require
			tokenizer_has_no_error: tokenizer /= Void and then not tokenizer.is_lexical_error
		local
			s: STRING
		do
			if tokenizer.last_token = Name_token then
				s := STRING_.appended_string ("Name: %"", tokenizer.last_token_value)
				Result := STRING_.appended_string (s, "%"")
			elseif tokenizer.last_token = String_literal_token then
				s := STRING_.appended_string ("Literal: %"", tokenizer.last_token_value)
				Result := STRING_.appended_string (s, "%"")
			elseif tokenizer.last_token = Number_token then
				s := STRING_.appended_string ("Numeric literal: %"", tokenizer.last_token_value)
				Result := STRING_.appended_string (s, "%"")
			elseif tokenizer.last_token = Unknown_token then
				Result := "(unknown token)"
			elseif attached tokenizer.token_name (tokenizer.last_token) as l_token_name then
				s := STRING_.appended_string ("%"", l_token_name)
				Result := STRING_.appended_string (s, "%"")
			else
				Result := "%"%""
			end
		ensure
			result_not_void: Result /= Void
		end

end
