indexing

	description:

		"Objects that parse XPath expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_EXPRESSION_PARSER

inherit

	XM_XPATH_TOKENS

	XM_XPATH_CARDINALITY

	KL_IMPORTED_STRING_ROUTINES

feature -- Access

	last_expression: XM_XPATH_EXPRESSION is
			-- Result of last call to `parse'
		require
			no_parse_error: not is_parse_error
		do
			Result := internal_last_expression
		ensure
			last_expression_not_void: Result /= Void
		end

	last_pattern: XM_XPATH_PATTERN is
			-- Result of last call to `parse_pattern'
		require
			no_parse_error: not is_parse_error
		do
			Result := internal_last_pattern
		ensure
			last_pattern_not_void: Result /= Void
		end

	last_sequence_type: XM_XPATH_SEQUENCE_TYPE is
			-- Result of last call to `parse_sequence_type'
		require
			no_parse_error: not is_parse_error
		do
			Result := internal_last_sequence_type
		ensure
			last_sequence_type_not_void: Result /= Void
		end

	last_parse_error: STRING is
			-- Text of last parse error
		require
			parse_error: is_parse_error
		do
			Result := internal_last_parse_error
		ensure
			error_text_not_void: Result /= Void
		end
		
feature -- Status report

	is_parse_error: BOOLEAN
			-- Did last call to `parse' fail?
	
feature -- Parsers

	parse (expression_text: STRING; env: XM_XPATH_STATIC_CONTEXT) is
			--  Parse `expression_text', which represents an expression.
		require
			expression_text_not_void: expression_text /= Void
			static_context_not_void: env /= Void
		local
			s: STRING
		do
			environment := env
			create tokenizer.make
			tokenizer.tokenize (expression_text)
			parse_expression
			
			if	tokenizer.is_lexical_error then
				grumble (tokenizer.last_lexical_error)
			elseif tokenizer.last_token /= Eof_token then
				s := STRING_.appended_string ("Unexpected token ", display_current_token)
				s := STRING_.appended_string (s, " beyond end of expression")
				grumble (s)
			end
		ensure
			expression_not_void_unless_error: not is_parse_error implies last_expression /= Void
			static_context_not_void: environment /= Void
		end

	parse_pattern (pattern_text: STRING; env: XM_XPATH_STATIC_CONTEXT) is
			-- Parse `pattern_text', which represents an XSLT pattern.
		require
			pattern_text_not_void: pattern_text /= Void
			static_context_not_void: env /= Void
		local
			s: STRING
		do
			environment := env
			create tokenizer.make
			tokenizer.tokenize (pattern_text)
			parse_union_pattern

			if	tokenizer.is_lexical_error then
				grumble (tokenizer.last_lexical_error)
			elseif tokenizer.last_token /= Eof_token then
				s := STRING_.appended_string ("Unexpected token ", display_current_token)
				s := STRING_.appended_string (s, " beyond end of pattern")
				grumble (s)
			end
		ensure
			pattern_not_void_unless_error: not is_parse_error implies last_pattern /= Void
			static_context_not_void: environment /= Void
		end

	parse_sequence_type (input_string: STRING; env: XM_XPATH_STATIC_CONTEXT) is
			-- Parse `input_string', which represents a sequence type.
		require
			sequence_text_not_void: input_string /= Void
			static_context_not_void: env /= Void
		local
			s: STRING
		do
			environment := env
			create tokenizer.make
			tokenizer.tokenize (input_string)
			-- TODO parse_sequence

			if	tokenizer.is_lexical_error then
				grumble (tokenizer.last_lexical_error)
			elseif tokenizer.last_token /= Eof_token then
				s := STRING_.appended_string ("Unexpected token ", display_current_token)
				s := STRING_.appended_string (s, " beyond end of sequence type")
				grumble (s)
			end
		ensure
			sequence_not_void_unless_error: not is_parse_error implies last_sequence_type /= Void
			static_context_not_void: environment /= Void
		end

feature -- Helper routines

	make_name_code (qname: STRING; use_default_namespace: BOOLEAN): INTEGER is
			-- Create a name_code, using the static_context for namespace resolution
		require
			name_not_void: qname /= Void and then qname.count > 0
		do
			-- TODO
		end

feature {NONE} -- Expression parsers

	parse_expression is
			-- Parse a top-level expression.
			-- ExprSingle ( ',' ExprSingle )*
		require
			static_context_not_void: environment /= Void
			tokenizer_usable: tokenizer /= Void and then tokenizer.input /= Void and not tokenizer.is_lexical_error
			no_previous_parse_error: not is_parse_error
		local
			expr1: XM_XPATH_EXPRESSION
			expr2: XM_XPATH_APPEND_EXPRESSION
		do
			internal_last_expression := Void
			parse_single_expression
			if not is_parse_error then
				from
					expr1 := internal_last_expression
				until
					is_parse_error or else tokenizer.last_token /= Comma_token
				loop
					tokenizer.next
					if tokenizer.is_lexical_error then
						grumble (tokenizer.last_lexical_error)
					else
						parse_expression
						create expr2.make (expr1, Comma_token, internal_last_expression)
						expr1 := expr2
					end
				end
				if not is_parse_error then internal_last_expression := expr1 end
			end
		ensure
			expression_not_void_unless_error: not is_parse_error implies internal_last_expression /= Void
		end

	parse_single_expression is
			-- Parse an ExprSingle.
			-- ForExpr
			-- | QuantifiedExpr
			-- | IfExpr
			-- | OrExpr
		require
			static_context_not_void: environment /= Void
			tokenizer_usable: tokenizer /= Void and then tokenizer.input /= Void and not tokenizer.is_lexical_error
			no_previous_parse_error: not is_parse_error
		do
			internal_last_expression := Void
			inspect
				tokenizer.last_token
			when For_token then
				parse_for_expression
			when Let_token then -- XQuery only
				parse_for_expression
			when Some_token then
				parse_quantified_expression
			when Every_token then
				parse_quantified_expression
			when If_token then
-- TODO				parse_if_expression
			when Typeswitch_token then -- XQuery only
				parse_typeswitch_expression
			else
			end
		ensure
			expression_not_void_unless_error: not is_parse_error implies internal_last_expression /= Void
		end

	parse_typeswitch_expression is
			-- XQuery only - override in sub-class
		require
			static_context_not_void: environment /= Void
			tokenizer_usable: tokenizer /= Void and then tokenizer.input /= Void and not tokenizer.is_lexical_error
			no_previous_parse_error: not is_parse_error
		do
			grumble("typeswitch is not allowed in XPath");
		end

	parse_or_expression is
			-- Parse an OrExpression.
			-- AndExpr ( 'or' AndExpr )
		require
			static_context_not_void: environment /= Void
			tokenizer_usable: tokenizer /= Void and then tokenizer.input /= Void and not tokenizer.is_lexical_error
			no_previous_parse_error: not is_parse_error
		local
			expr1: XM_XPATH_EXPRESSION
			expr2: XM_XPATH_BOOLEAN_EXPRESSION
		do
			internal_last_expression := Void
			parse_and_expression
			if not is_parse_error then
				from
					expr1 := internal_last_expression
				until
					is_parse_error or else tokenizer.last_token /= Or_token
				loop
					tokenizer.next
					if tokenizer.is_lexical_error then
						grumble (tokenizer.last_lexical_error)
					else
						parse_and_expression
						create expr2.make (expr1, Or_token, internal_last_expression)
						expr1 := expr2
					end
				end
				if not is_parse_error then internal_last_expression := expr1 end
				
			end
		ensure
			expression_not_void_unless_error: not is_parse_error implies internal_last_expression /= Void
		end

	parse_and_expression is
			-- Parse an AndExpression.
			-- InstanceofExpr ( 'and' InstanceofExpr )*
		require
			static_context_not_void: environment /= Void
			tokenizer_usable: tokenizer /= Void and then tokenizer.input /= Void and not tokenizer.is_lexical_error
			no_previous_parse_error: not is_parse_error
		local
			expr1: XM_XPATH_EXPRESSION
			expr2: XM_XPATH_BOOLEAN_EXPRESSION
		do
			internal_last_expression := Void
			-- TODO parse_instance_of_expression
			if not is_parse_error then
				from
					expr1 := internal_last_expression
				until
					is_parse_error or else tokenizer.last_token /= And_token
				loop
					tokenizer.next
					if tokenizer.is_lexical_error then
						grumble (tokenizer.last_lexical_error)
					else
						-- TODO parse_instance_of_expression
						create expr2.make (expr1, And_token, internal_last_expression)
						expr1 := expr2
					end
				end
				if not is_parse_error then internal_last_expression := expr1 end
				
			end
		ensure
			expression_not_void_unless_error: not is_parse_error implies internal_last_expression /= Void
		end

	parse_for_expression is
			-- Parse a ForExpression.
			-- "for" "$" VarName "in" ExprSingle ("," "$" VarName "in" ExprSingle)* "return" ExprSingle;
		
		require
			static_context_not_void: environment /= Void
			tokenizer_usable: tokenizer /= Void and then tokenizer.input /= Void and not tokenizer.is_lexical_error
			no_previous_parse_error: not is_parse_error
		do
			internal_last_expression := Void
			if tokenizer.last_token = Let_token then
				grumble ("'let' is not supported in XPath")
			else
				parse_mapping_expression
			end
		ensure
			expression_not_void_unless_error: not is_parse_error implies internal_last_expression /= Void
		end

	parse_quantified_expression is
			-- Parse a QuantifiedExpression.
			-- (("some" "$") | ("every" "$")) VarName "in" ExprSingle ("," "$" VarName "in" ExprSingle)* "satisfies" ExprSingle
		require
			static_context_not_void: environment /= Void
			tokenizer_usable: tokenizer /= Void and then tokenizer.input /= Void and not tokenizer.is_lexical_error
			no_previous_parse_error: not is_parse_error
		do
			internal_last_expression := Void
			parse_mapping_expression
		ensure
			expression_not_void_unless_error: not is_parse_error implies internal_last_expression /= Void
		end

	parse_mapping_expression is
			-- Parse a mapping expression.
		require
			static_context_not_void: environment /= Void
			tokenizer_usable: tokenizer /= Void and then tokenizer.input /= Void and not tokenizer.is_lexical_error
			no_previous_parse_error: not is_parse_error
		local
			clause: XM_XPATH_FOR_CLAUSE
			action: XM_XPATH_EXPRESSION
			clause_list: DS_ARRAYED_LIST [XM_XPATH_FOR_CLAUSE]
			operator, name_code, an_index: INTEGER
			finished: BOOLEAN
			message, token_value: STRING
			rv: XM_XPATH_RANGE_VARIABLE_DECLARATION
			assignment: XM_XPATH_ASSIGNATION
			single_item, a_sequence: XM_XPATH_SEQUENCE_TYPE
		do
			internal_last_expression := Void
			create clause_list.make_equal (5)
			operator := tokenizer.last_token			
			from
				finished := False
			until
				finished
			loop
				create clause
				-- TODO - reinstate clause.set_line_number (tokenizer.line_number)
				clause_list.put_last (clause)
				tokenizer.next
				if tokenizer.is_lexical_error then
					grumble (tokenizer.last_lexical_error)
				elseif tokenizer.last_token /= Dollar_token then
					message := "expected %"$%", found "
					message := STRING_.appended_string (message, display_current_token)
					grumble (message)
				else
					tokenizer.next
					if tokenizer.is_lexical_error then
						grumble (tokenizer.last_lexical_error)
					elseif tokenizer.last_token /= Name_token then
						message := "expected %"<name>%", found "
						message := STRING_.appended_string (message, display_current_token)
						grumble (message)
					else
						token_value := tokenizer.last_token_value

						-- Declare the range variable

						create single_item.make_single_item
						create rv.make (token_value, make_name_code (token_value, False) // bits_20, single_item)
						-- TODO - reinstate or erwork clause.set_range_variable (rv)

						tokenizer.next
						if tokenizer.is_lexical_error then
							grumble (tokenizer.last_lexical_error)
						elseif tokenizer.last_token /= In_token then
							message := "expected %"in%", found "
							message := STRING_.appended_string (message, display_current_token)
							grumble (message)
						else

							-- process the "in" clause

							if tokenizer.is_lexical_error then
								grumble (tokenizer.last_lexical_error)
							else
								parse_single_expression
								if not is_parse_error then
									-- TODO clause.set_sequence (internal_last_expression)
									declare_range_variable (clause.range_variable)
								end
							end
						end
					end
				end

				if tokenizer.last_token /= Comma_token then finished := True end
			end

			-- process the action ("return"/"satisfies" expression)

			if operator = For_Token then
				if tokenizer.last_token /= Return_token then
					message := "expected %"return%", found "
					message := STRING_.appended_string (message, display_current_token)
					grumble (message)
				end
			else
				if tokenizer.last_token /= Satisfies_token then
					message := "expected %"satisfies%", found "
					message := STRING_.appended_string (message, display_current_token)
					grumble (message)
				end
			end
			tokenizer.next
			if tokenizer.is_lexical_error then
				grumble (tokenizer.last_lexical_error)
			else
				parse_single_expression
				if not is_parse_error then
					action := internal_last_expression

					-- work backwards through the list of range variables,
					-- fixing up all references to the variables in the inner expression

					from
						an_index := clause_list.count
					until
						an_index = 0
					loop
						clause := clause_list.item (an_index)

						-- Attempt to give the range variable a more precise type, base on analysis of the
						-- `action' expression. This will often be approximate, because variables and function
						-- calls in the action expression have not yet been resolved. We rely on the ability
						-- of all expressions to return some kind of type information even if this is imprecise.

						create a_sequence.make (clause.sequence.item_type, Required_cardinality_exactly_one)
						-- TODO clause.range_variable.set_required_type (a_sequence)

						if operator = For_token then
							create {XM_XPATH_FOR_EXPRESSION} assignment.make (clause.range_variable, clause.sequence, action)
						else
							create {XM_XPATH_QUANTIFIED_EXPRESSION} assignment.make (operator, clause.range_variable, clause.sequence, action)
						end

						-- for the next outermost "for" clause, the "action" is this ForExpression
						action := assignment

						an_index := an_index - 1
					end

					-- undeclare all the range variables


					from
						an_index := clause_list.count
					until
						an_index = 0
					loop
						range_variable_stack.remove

						an_index := an_index - 1
					end

					internal_last_expression := action
				end
			end
		ensure
			expression_not_void_unless_error: not is_parse_error implies internal_last_expression /= Void
		end

feature {NONE} -- Pattern parsers

	parse_union_pattern is
			-- Parse a Union Pattern;
			--  pathPattern ( | pathPattern )*
		do
			-- TODO
		ensure
			pattern_not_void_unless_error: not is_parse_error implies last_pattern /= Void
		end


feature {NONE} -- Implementation

	tokenizer: XM_XPATH_TOKENIZER
			-- Lexical scanner
	
	environment: XM_XPATH_STATIC_CONTEXT
			-- Current static context

	internal_last_expression: XM_XPATH_EXPRESSION
			-- Result of calling `parse'

	internal_last_parse_error: STRING
			-- Text of last parse error encountered
	
	internal_last_pattern: XM_XPATH_PATTERN 
			-- Result of last call to `parse_pattern'
	
	internal_last_sequence_type: XM_XPATH_SEQUENCE_TYPE
			-- Result of last call to `parse_sequence_type'

	range_variable_stack: DS_ARRAYED_STACK [XM_XPATH_RANGE_VARIABLE_DECLARATION]
			-- Range variables

	language: STRING is "XPath"
			-- An XQuery parser will override this

	bits_20: INTEGER is 1048576 
			-- 0x0fffff

	grumble (message: STRING) is
			-- Report a parsing error
		require
			message_not_void: message /= Void
		local
			s, line_info: STRING
			l: INTEGER
		do
			is_parse_error := True
			l := tokenizer.line_number
			if l = 1 then
				line_info := ""
			else
				s := STRING_.appended_string ("on line ", l.out)
				line_info := STRING_.appended_string (line_info, " ")
			end
			s := STRING_.appended_string (language, " syntax error ")
			s := STRING_.appended_string (s, line_info)
			if message.count > 2 and then STRING_.same_string (message.substring (1,3), "...") then
				s := STRING_.appended_string (s, "near")
			else
				s := STRING_.appended_string (s, "in")
			end
			s := STRING_.appended_string (s, " «")
			s := STRING_.appended_string (s, tokenizer.recent_text)
			s := STRING_.appended_string (s, "»:%N    ")
			internal_last_parse_error := STRING_.appended_string (s, message)
		ensure
			last_parse_error_not_void: last_parse_error /= Void
			parse_error: is_parse_error
		end

	display_current_token: STRING is
			-- Display the current token for an error message
		require
			tokenizer_has_no_error: tokenizer /= Void and then not tokenizer.is_lexical_error
		local
			s: STRING
		do
			if tokenizer.last_token = Name_token then
				s := STRING_.appended_string ("name %"", tokenizer.last_token_value)
				Result := STRING_.appended_string (s, "%"")
			elseif tokenizer.last_token = Unknown_token then
				Result := "(unknown token)"
			else
				s := STRING_.appended_string ("%"", tokenizer.token_name (tokenizer.last_token))
				Result := STRING_.appended_string (s, "%"")
			end
		ensure
			result_not_void: Result /= Void
		end

	declare_range_variable (declaration: XM_XPATH_RANGE_VARIABLE_DECLARATION) is
			-- Declare `declaration' to be a range variable
		require
			variable_not_void: declaration /= Void
		do
			if range_variable_stack = Void then
				create range_variable_stack.make_equal (5)
			end
			if not range_variable_stack.extendible (1) then
				range_variable_stack.resize (2 * range_variable_stack.count)
			end
			range_variable_stack.put (declaration)
		end
end
