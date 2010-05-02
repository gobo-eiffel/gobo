note

	description:

		"Objects that parse XPointers at a generic level"

	library: "Gobo Eiffel XPointer Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPOINTER_PARSER

inherit

	XM_XPOINTER_TOKENS

	KL_IMPORTED_STRING_ROUTINES

	XM_UNICODE_CHARACTERS_1_0

	UC_SHARED_STRING_EQUALITY_TESTER

create

	make

feature {NONE} -- Initialization

	make
			-- Establish invariant.
		do
			create scheme_sequence.make_default
			scheme_sequence.set_equality_tester (string_equality_tester)
			create scheme_data.make_default
			scheme_data.set_equality_tester (string_equality_tester)
		end

feature -- Access

	shorthand: STRING
			-- Shorthand pointer

	scheme_sequence: DS_ARRAYED_LIST [STRING]
			-- Sequence of schemes to be processed (all are lexical QNames)

	scheme_data: DS_ARRAYED_LIST [STRING]
			-- Data for each scheme in `scheme_sequence'

feature -- Status report

	is_shorthand: BOOLEAN
			-- Has `parse' found a shorthand pointer?

	is_error: BOOLEAN
			-- Was an error detected?

	error_message, error_code: STRING
			-- Error text and code from `parse'

feature -- Element change

	parse (an_xpointer: STRING)
			-- Parse `an_xpointer' into it's schemes.
		require
			xpointer_not_empty: an_xpointer /= Void and then an_xpointer.count > 0
		local
			a_tokenizer: XM_XPOINTER_TOKENIZER
			a_token: INTEGER
			a_scheme_name: STRING
		do
			create a_tokenizer.make (an_xpointer)
			a_tokenizer.next
			if a_tokenizer.is_lexical_error then
				set_error (a_tokenizer.last_lexical_error, "XPOINTER_LEXICAL")
			else
				a_token := a_tokenizer.last_token
				if a_token = String_token then
					a_scheme_name := a_tokenizer.last_token_value
					if is_qname (a_scheme_name) then
						a_tokenizer.next
						if a_tokenizer.is_lexical_error then
							set_error (a_tokenizer.last_lexical_error, "XPOINTER_LEXICAL")
						else
							a_token := a_tokenizer.last_token
							if a_token = Eof_token then
								if is_ncname (a_scheme_name) then
									shorthand := a_scheme_name
									is_shorthand := True
								else
									set_error ("XPointer shorthand name is not a lexical NCName: " + a_scheme_name, "XPOINTER_LEXICAL")
								end
							elseif a_token /= Left_parenthesis_token then
								set_error ("Unexpected_token when looking for first left parenthesis: " + a_tokenizer.last_token_value, "XPOINTER_SYNTAX")
							else
								from
								until
									is_error or else a_token = Eof_token
								loop
									parse_scheme (a_tokenizer, a_scheme_name)
									a_scheme_name := Void
									a_token := last_token
									if not is_error then
										store_current_scheme
									end
								end
							end
						end
					else
						set_error ("XPointer scheme name is not a lexical QName: " + a_scheme_name, "XPOINTER_LEXICAL")
					end
				else
					set_error ("Unexpected_token at start of xpointer string: " + a_tokenizer.last_token_value, "XPOINTER_SYNTAX")
				end
			end
		ensure
			no_error_implies_scheme_sequence: not is_error implies (is_shorthand or else scheme_sequence /= Void)
		end

feature {NONE} -- Implementation

	last_token: INTEGER
			-- Last token set by `parse_scheme'

	current_scheme_name: STRING
			-- Name of scheme currently being parsed

	current_scheme_data: STRING
			-- Data for scheme currently being parsed

	set_error (a_message, a_code: STRING)
			-- Set `error_message' and `error_code'.
		require
			message_not_void: a_message /= Void and then a_message.count > 0
			code_not_void: a_code /= Void and then a_code.count > 0
			not_in_error: not is_error
		do
			error_message := a_message; error_code := a_code
			is_error := True
		ensure
			valid_error_message: error_message /= Void
				and then STRING_.same_string (error_message, a_message)
			valid_error_code: error_code /= Void
				and then STRING_.same_string (error_code, a_code)
			in_error: is_error
		end


	parse_scheme (a_tokenizer: XM_XPOINTER_TOKENIZER; a_name: STRING)
			-- Parse a single XPointer scheme name and data and set `last_token'.
		require
			no_previous_error: not is_error
			tokenizer_not_finished: a_tokenizer /= Void and then not a_tokenizer.is_lexical_error and then a_tokenizer.last_token /= Eof_token
			possible_scheme_name: a_name = Void and then a_tokenizer.last_token /= Eof_token or else is_qname (a_name)
				and then a_tokenizer.last_token = Left_parenthesis_token
		local
			a_left_parenthesis_count, a_right_parenthesis_count: INTEGER
		do
			current_scheme_name := Void
			current_scheme_data := ""
			parse_scheme_name (a_tokenizer, a_name)
			if not is_error then
				if a_tokenizer.last_token = Left_parenthesis_token then
					from
						a_left_parenthesis_count := 1; a_right_parenthesis_count := 0
					invariant
						a_right_parenthesis_count <= a_left_parenthesis_count
					until
						is_error or else a_right_parenthesis_count = a_left_parenthesis_count
					loop
						a_tokenizer.next
						if a_tokenizer.is_lexical_error then
							set_error (a_tokenizer.last_lexical_error, "XPOINTER_LEXICAL")
						else
							inspect
								a_tokenizer.last_token
							when Unknown_token then
								set_error ("Unknown tokan in xpointer", "XPOINTER_LEXICAL")
							when Eof_token then
								set_error ("Unexpected end-of-xpointer-string", "XPOINTER_SYNTAX")
							when Left_parenthesis_token then
								a_left_parenthesis_count := a_left_parenthesis_count + 1
								current_scheme_data := STRING_.appended_string (current_scheme_data, a_tokenizer.last_token_value)
							when Right_parenthesis_token then
								a_right_parenthesis_count := a_right_parenthesis_count + 1
								if a_right_parenthesis_count /= a_left_parenthesis_count then
									current_scheme_data := STRING_.appended_string (current_scheme_data, a_tokenizer.last_token_value)
								else
									a_tokenizer.set_whitespace_reporting (True)
								end
							else
								current_scheme_data := STRING_.appended_string (current_scheme_data, a_tokenizer.last_token_value)
							end
						end
					end
					a_tokenizer.next
				else
					set_error ("Unexpected_token within xpointer string when looking for initial '(' : " + a_tokenizer.last_token_value, "XPOINTER_SYNTAX")
				end
				last_token := a_tokenizer.last_token
			end
		ensure
			error_or_scheme_parsed: not is_error implies current_scheme_name /= Void and then is_qname (current_scheme_name)
				and then current_scheme_data /= Void
		end

	parse_scheme_name (a_tokenizer: XM_XPOINTER_TOKENIZER; a_name: STRING)
			-- Parse scheme name
		require
			no_previous_error: not is_error
			tokenizer_not_finished: a_tokenizer /= Void and then not a_tokenizer.is_lexical_error and then a_tokenizer.last_token /= Eof_token
			possible_scheme_name: a_name = Void and then a_tokenizer.last_token /= Eof_token or else is_qname (a_name)
				and then a_tokenizer.last_token = Left_parenthesis_token
		do
			if a_name = Void then
				if a_tokenizer.is_lexical_error then
					set_error (a_tokenizer.last_lexical_error, "XPOINTER_LEXICAL")
				else
					if a_tokenizer.last_token = Whitespace_token then
						a_tokenizer.next
						if a_tokenizer.is_lexical_error then
							set_error (a_tokenizer.last_lexical_error, "XPOINTER_LEXICAL")
						end
					end
					if not a_tokenizer.is_lexical_error then
						if a_tokenizer.last_token /= String_token then
							set_error ("Unexpected token within xpointer string when looking for scheme name: " + a_tokenizer.last_token_value, "XPOINTER_SYNTAX")
						else
							current_scheme_name := a_tokenizer.last_token_value
							if not is_qname (current_scheme_name) then
								set_error ("XPointer scheme name is not a lexical QName: " + current_scheme_name, "XPOINTER_LEXICAL")
							else
								a_tokenizer.next
							end
						end
					end
				end
			else
				current_scheme_name := a_name
			end
		ensure
			error_or_lexical_qname: not is_error implies current_scheme_name /= Void and then is_qname (current_scheme_name)
		end

	store_current_scheme
			-- Store current parsed scheme.
		require
			no_previous_error: not is_error
			lexical_qname: current_scheme_name /= Void and then is_qname (current_scheme_name)
			good_data: current_scheme_data /= Void
		do
			scheme_sequence.force_last (current_scheme_name)
			scheme_data.force_last (current_scheme_data)
		end

invariant

	possible_error: is_error implies error_message /= Void and then error_code /= Void
	shorthand_not_void: is_shorthand implies shorthand /= Void and then is_ncname (shorthand)
	scheme_data_correct_length: scheme_sequence /= Void and then scheme_data /= Void
		and then scheme_sequence.count = scheme_data.count

end

