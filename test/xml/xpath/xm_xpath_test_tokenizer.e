indexing
	
	description:
	
		"Test expression tokenizer"
		
	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
	
deferred class XM_XPATH_TEST_TOKENIZER

inherit

	TS_TEST_CASE
	
	XM_XPATH_TOKENS

	KL_IMPORTED_STRING_ROUTINES
	
feature -- Test

	test_simple is
		local
			tokenizer: XM_XPATH_TOKENIZER
			a_string: STRING
		do
			a_string := "boolean($fred = 'happy')"
			create tokenizer.make
			tokenizer.tokenize (a_string)
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

	test_numeric is
		local
			tokenizer: XM_XPATH_TOKENIZER
			a_string: STRING
		do
			a_string := "boolean($fred = .78 + 3.45E6)"
			create tokenizer.make
			tokenizer.tokenize (a_string)
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
	
	test_unexpected_colon is
		local
			tokenizer: XM_XPATH_TOKENIZER
			a_string: STRING
		do
			a_string := "boolean($fred :@ 'happy')"
			create tokenizer.make
			tokenizer.tokenize (a_string)
			tokenizer.next
			tokenizer.next
			assert ("Lexical error", tokenizer.is_lexical_error)
			assert ("Unexpected token", STRING_.same_string (tokenizer.last_lexical_error, "Unexpected colon at start of token"))
		end

	test_unclosed_xpath_comment is
		local
			tokenizer: XM_XPATH_TOKENIZER
			a_string: STRING
		do
			a_string := "boolean($fred (::@ (:'happy':) oops)"
			create tokenizer.make
			tokenizer.tokenize (a_string)
			tokenizer.next
			tokenizer.next
			assert ("Lexical error", tokenizer.is_lexical_error)
			assert ("Unexpected token", STRING_.same_string (tokenizer.last_lexical_error, "Unclosed XPath comment"))
		end

	test_unexpected_exclamation_mark is
		local
			tokenizer: XM_XPATH_TOKENIZER
			a_string: STRING
		do
			a_string := "boolean($fred !@ 'happy')"
			create tokenizer.make
			tokenizer.tokenize (a_string)
			tokenizer.next
			tokenizer.next
			assert ("Lexical error", tokenizer.is_lexical_error)
			assert ("Unexpected token", STRING_.same_string (tokenizer.last_lexical_error, "%"!%" without %"=%" in expression"))
		end

	test_illegal_whitespace is
		local
			tokenizer: XM_XPATH_TOKENIZER
			a_string: STRING
		do
			a_string := "boolean($fred *: 'happy')"
			create tokenizer.make
			tokenizer.tokenize (a_string)
			tokenizer.next
			tokenizer.next
			assert ("Lexical error", tokenizer.is_lexical_error)
			assert ("Unexpected token", STRING_.same_string (tokenizer.last_lexical_error, "Whitespace is not allowed after '*:'"))
		end
	
	test_unmatched_quote is
		local
			tokenizer: XM_XPATH_TOKENIZER
			a_string: STRING
		do
			a_string := "boolean($fred  'happy%")"
			create tokenizer.make
			tokenizer.tokenize (a_string)
			tokenizer.next
			tokenizer.next
			assert ("Lexical error", tokenizer.is_lexical_error)
			assert ("Unexpected token", STRING_.same_string (tokenizer.last_lexical_error, "Unmatched quote in expression"))
		end
	
	test_invalid_character is
		local
			tokenizer: XM_XPATH_TOKENIZER
			a_string: STRING
		do
			a_string := "boolean($fred #= 'happy')"
			create tokenizer.make
			tokenizer.tokenize (a_string)
			tokenizer.next
			tokenizer.next
			assert ("Lexical error", tokenizer.is_lexical_error)
			assert ("Unexpected token", STRING_.same_string (tokenizer.last_lexical_error, "Invalid character (#) in expression"))
		end	
end
