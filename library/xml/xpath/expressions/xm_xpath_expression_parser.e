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

	XM_XPATH_SHARED_EXPRESSION_TESTER

	XM_XPATH_TYPE

		-- The commands `parse' and `parse_sequence_type' set `is_parse_error'
		-- to indicate success or failure.
		-- Upon success, theier result can be accessed via
		-- `last_parsed_expression' and `last_parsed_sequence' respectively.

feature -- Access

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
			-- Did last call to last parsing command fail?

	last_parsed_expression: XM_XPATH_EXPRESSION is
			-- Last expression sucessfully parsed by `parse'
		require
			no_parse_error: not is_parse_error
		do
			Result := internal_last_parsed_expression
		ensure
			parsed_expression_not_void: Result /= Void
		end

	last_parsed_sequence: XM_XPATH_SEQUENCE_TYPE is
			-- Last expression sucessfully parsed by `parse_sequence_type'
		require
			no_parse_error: not is_parse_error
		do
			Result := internal_last_parsed_sequence
		ensure
			parsed_expression_not_void: Result /= Void
		end
	
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
			is_parse_error := False
			parse_expression
			
			if	tokenizer.is_lexical_error then
				grumble (tokenizer.last_lexical_error)
			elseif tokenizer.last_token /= Eof_token then
				s := STRING_.appended_string ("Unexpected token ", display_current_token)
				s := STRING_.appended_string (s, " beyond end of expression")
				grumble (s)
			end
		ensure
			expression_not_void_unless_error: not is_parse_error implies last_parsed_expression /= Void
			static_context_not_void: environment /= Void
		end

	parse_sequence_type (input_string: STRING; env: XM_XPATH_STATIC_CONTEXT) is
			-- Parse `input_string', which represents a sequence type;
			-- SequenceType ::= (ItemType OccurrenceIndicator?) | ("empty" "(" ")")
		require
			sequence_text_not_void: input_string /= Void
			static_context_not_void: env /= Void
		local
			s: STRING
		do
			environment := env
			create tokenizer.make
			tokenizer.tokenize (input_string)
			is_parse_error := False
			parse_sequence

			if	tokenizer.is_lexical_error then
				grumble (tokenizer.last_lexical_error)
			elseif tokenizer.last_token /= Eof_token then
				s := STRING_.appended_string ("Unexpected token ", display_current_token)
				s := STRING_.appended_string (s, " beyond end of sequence type")
				grumble (s)
			end
		ensure
			sequence_not_void_unless_error: not is_parse_error implies last_parsed_sequence /= Void
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

	parse_sequence is
			-- Parse the sequence type production
		require
			static_context_not_void: environment /= Void
			tokenizer_usable: tokenizer /= Void and then tokenizer.input /= Void and not tokenizer.is_lexical_error
			no_previous_parse_error: not is_parse_error
		local
			primary_type: INTEGER
			message: STRING
		do
			primary_type := Any_item
			if tokenizer.last_token = Name_token then
				-- TODO
			elseif tokenizer.last_token = Node_kind_token then
				-- TODO
			else
				message := STRING_.appended_string ("Expected type name in SequenceType, found ", display_current_token)
				grumble (message)
			end
		ensure
			expression_not_void_unless_error: not is_parse_error implies internal_last_parsed_sequence /= Void
		end

	parse_expression is
			-- Parse a top-level expression;
			-- Expr ::= ExprSingle ( ',' ExprSingle )*
		require
			static_context_not_void: environment /= Void
			tokenizer_usable: tokenizer /= Void and then tokenizer.input /= Void and not tokenizer.is_lexical_error
			no_previous_parse_error: not is_parse_error
		local
			expr1: XM_XPATH_EXPRESSION
			expr2: XM_XPATH_APPEND_EXPRESSION
		do
			parse_single_expression
			if not is_parse_error then
				from
					expr1 := internal_last_parsed_expression
				until
					is_parse_error or else tokenizer.last_token /= Comma_token
				loop
					tokenizer.next
					if tokenizer.is_lexical_error then
						grumble (tokenizer.last_lexical_error)
					else
						parse_expression
						if not is_parse_error then
							create expr2.make (expr1, Comma_token, internal_last_parsed_expression)
							expr1 := expr2
						end
					end
				end
				if not is_parse_error then internal_last_parsed_expression := expr1 end
			end
		ensure
			expression_not_void_unless_error: not is_parse_error implies internal_last_parsed_expression /= Void
		end

	parse_single_expression is
			-- Parse an ExprSingle;
			-- ExprSingle ::= ForExpr
			-- | QuantifiedExpr
			-- | IfExpr
			-- | OrExpr
		require
			static_context_not_void: environment /= Void
			tokenizer_usable: tokenizer /= Void and then tokenizer.input /= Void and not tokenizer.is_lexical_error
			no_previous_parse_error: not is_parse_error
		do
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
				parse_if_expression
			when Typeswitch_token then -- XQuery only
				parse_typeswitch_expression
			else
				parse_or_expression
			end
		ensure
			expression_not_void_unless_error: not is_parse_error implies internal_last_parsed_expression /= Void
		end

	parse_if_expression is
			-- Parse an IfExpr;
			-- IfExpr ::= "if" "(" Expr ")" "then" ExprSingle "else" ExprSingle
		require
			static_context_not_void: environment /= Void
			tokenizer_usable: tokenizer /= Void and then tokenizer.input /= Void and not tokenizer.is_lexical_error
			no_previous_parse_error: not is_parse_error
		local
			condition, then_expression, else_expression: XM_XPATH_EXPRESSION
			if_expression: XM_XPATH_IF_EXPRESSION
			message: STRING
		do

			-- The Left_parenthesis_token has already been read.
			
			tokenizer.next
			if tokenizer.is_lexical_error then
				grumble (tokenizer.last_lexical_error)
			else
				parse_expression
				if not is_parse_error then
					condition := internal_last_parsed_expression
					if tokenizer.last_token /= Right_parenthesis_token then
						message := "expected %")%", found "
						message := STRING_.appended_string (message, display_current_token)
						grumble (message)
					else
						tokenizer.next
						if tokenizer.is_lexical_error then
							grumble (tokenizer.last_lexical_error)
						elseif tokenizer.last_token /= Then_token then
							message := "expected %"then%", found "
							message := STRING_.appended_string (message, display_current_token)
							grumble (message)
						else
							parse_expression
							if  not is_parse_error then
								then_expression := internal_last_parsed_expression
								if tokenizer.last_token /= Right_parenthesis_token then
									message := "expected %"else%", found "
									message := STRING_.appended_string (message, display_current_token)
									grumble (message)
								else
									tokenizer.next
									if tokenizer.is_lexical_error then
										grumble (tokenizer.last_lexical_error)
									else
										parse_single_expression
										if not is_parse_error then
											else_expression := internal_last_parsed_expression
											create if_expression.make (condition, then_expression, else_expression)
											internal_last_parsed_expression := if_expression
										end
									end
								end
							end
						end
					end
				end
			end
		ensure
			expression_not_void_unless_error: not is_parse_error implies internal_last_parsed_expression /= Void
		end

	parse_typeswitch_expression is
			-- XQuery only - override in sub-class
		require
			static_context_not_void: environment /= Void
			tokenizer_usable: tokenizer /= Void and then tokenizer.input /= Void and not tokenizer.is_lexical_error
			no_previous_parse_error: not is_parse_error
		do
			grumble("typeswitch is not allowed in XPath")
		ensure
			expression_not_void_unless_error: not is_parse_error implies internal_last_parsed_expression /= Void
		end

	parse_or_expression is
			-- Parse an OrExpression;
			-- OrExpr ::= AndExpr ( 'or' AndExpr )
		require
			static_context_not_void: environment /= Void
			tokenizer_usable: tokenizer /= Void and then tokenizer.input /= Void and not tokenizer.is_lexical_error
			no_previous_parse_error: not is_parse_error
		local
			expr1: XM_XPATH_EXPRESSION
			expr2: XM_XPATH_BOOLEAN_EXPRESSION
		do
			parse_and_expression
			if not is_parse_error then
				from
					expr1 := internal_last_parsed_expression
				until
					is_parse_error or else tokenizer.last_token /= Or_token
				loop
					tokenizer.next
					if tokenizer.is_lexical_error then
						grumble (tokenizer.last_lexical_error)
					else
						parse_and_expression
						if not is_parse_error then
							create expr2.make (expr1, Or_token, internal_last_parsed_expression)
							expr1 := expr2
						end
					end
				end
				if not is_parse_error then internal_last_parsed_expression := expr1 end
				
			end
		ensure
			expression_not_void_unless_error: not is_parse_error implies internal_last_parsed_expression /= Void
		end

	parse_and_expression is
			-- Parse an AndExpression.
			-- AndExpr ::= InstanceofExpr ( 'and' InstanceofExpr )*
		require
			static_context_not_void: environment /= Void
			tokenizer_usable: tokenizer /= Void and then tokenizer.input /= Void and not tokenizer.is_lexical_error
			no_previous_parse_error: not is_parse_error
		local
			expr1: XM_XPATH_EXPRESSION
			expr2: XM_XPATH_BOOLEAN_EXPRESSION
		do
			parse_instance_of_expression
			if not is_parse_error then
				from
					expr1 := internal_last_parsed_expression
				until
					is_parse_error or else tokenizer.last_token /= And_token
				loop
					tokenizer.next
					if tokenizer.is_lexical_error then
						grumble (tokenizer.last_lexical_error)
					else
						parse_instance_of_expression
						if not is_parse_error then
							create expr2.make (expr1, And_token, internal_last_parsed_expression)
							expr1 := expr2
						end
					end
				end
				if not is_parse_error then internal_last_parsed_expression := expr1 end
				
			end
		ensure
			expression_not_void_unless_error: not is_parse_error implies internal_last_parsed_expression /= Void
		end

	parse_for_expression is
			-- Parse a ForExpression;
			-- "for" "$" VarName "in" ExprSingle ("," "$" VarName "in" ExprSingle)* "return" ExprSingle;
		require
			static_context_not_void: environment /= Void
			tokenizer_usable: tokenizer /= Void and then tokenizer.input /= Void and not tokenizer.is_lexical_error
			no_previous_parse_error: not is_parse_error
		do
			if tokenizer.last_token = Let_token then
				grumble ("'let' is not supported in XPath")
			else
				parse_mapping_expression
			end
		ensure
			expression_not_void_unless_error: not is_parse_error implies internal_last_parsed_expression /= Void
		end

	parse_quantified_expression is
			-- Parse a QuantifiedExpression;
			-- QuantifiedExpr ::= (("some" "$") | ("every" "$")) VarName "in" ExprSingle ("," "$" VarName "in" ExprSingle)* "satisfies" ExprSingle
		require
			static_context_not_void: environment /= Void
			tokenizer_usable: tokenizer /= Void and then tokenizer.input /= Void and not tokenizer.is_lexical_error
			no_previous_parse_error: not is_parse_error
		do
			parse_mapping_expression
		ensure
			expression_not_void_unless_error: not is_parse_error implies internal_last_parsed_expression /= Void
		end

	parse_mapping_expression is
			-- Parse a mapping expression
		require
			static_context_not_void: environment /= Void
			tokenizer_usable: tokenizer /= Void and then tokenizer.input /= Void and not tokenizer.is_lexical_error
			no_previous_parse_error: not is_parse_error
		local
			clause: XM_XPATH_FOR_CLAUSE
			action: XM_XPATH_EXPRESSION
			clause_list: DS_ARRAYED_LIST [XM_XPATH_FOR_CLAUSE]
			operator, name_code, an_index, a_line_number: INTEGER
			finished: BOOLEAN
			message, token_value: STRING
			rv: XM_XPATH_RANGE_VARIABLE_DECLARATION
			assignment: XM_XPATH_ASSIGNATION
			single_item, a_sequence: XM_XPATH_SEQUENCE_TYPE
		do
			create clause_list.make (5)
			operator := tokenizer.last_token			
			from
				finished := False
			until
				finished
			loop
				a_line_number := tokenizer.line_number
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
									create single_item.make_single_item
									create rv.make (token_value, make_name_code (token_value, False) \\ bits_20, single_item)
									create clause.make (rv, internal_last_parsed_expression, a_line_number)
									declare_range_variable (clause.range_variable)
									clause_list.put_last (clause)
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
					action := internal_last_parsed_expression

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
						clause.range_variable.set_required_type (a_sequence)

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

					internal_last_parsed_expression := action
				end
			end
		ensure
			expression_not_void_unless_error: not is_parse_error implies internal_last_parsed_expression /= Void
		end

	parse_instance_of_expression is
			-- Parse "instance of"  expressions;
			-- InstanceofExpr ::= TreatExpr ( "instance" "of" SequenceType )?
		require
			static_context_not_void: environment /= Void
			tokenizer_usable: tokenizer /= Void and then tokenizer.input /= Void and not tokenizer.is_lexical_error
			no_previous_parse_error: not is_parse_error
		local
			expr1: XM_XPATH_EXPRESSION
			expr2: XM_XPATH_INSTANCE_OF_EXPRESSION
		do
			parse_treat_expression
			if not is_parse_error then
				expr1 := internal_last_parsed_expression
				if tokenizer.last_token = Instance_of_token then
					tokenizer.next
					if tokenizer.is_lexical_error then
						grumble (tokenizer.last_lexical_error)
					else
						parse_sequence
						if not is_parse_error then
							create {XM_XPATH_INSTANCE_OF_EXPRESSION} expr2.make (expr1, internal_last_parsed_sequence)
							expr1 := expr2
						end
					end
				end
				if not is_parse_error then internal_last_parsed_expression := expr1 end
			end
		ensure
			expression_not_void_unless_error: not is_parse_error implies internal_last_parsed_expression /= Void
		end

	parse_treat_expression is
			-- Parse a "treat as" expression;
			-- TreatExpr ::= CastableExpr ( "treat" "as" SequenceType )?
		require
			static_context_not_void: environment /= Void
			tokenizer_usable: tokenizer /= Void and then tokenizer.input /= Void and not tokenizer.is_lexical_error
			no_previous_parse_error: not is_parse_error
		local
			expr1, expr2: XM_XPATH_EXPRESSION
		do
			parse_castable_expression
			if not is_parse_error then
				expr1 := internal_last_parsed_expression
				if tokenizer.last_token = Treat_as_token then
					tokenizer.next
					if tokenizer.is_lexical_error then
						grumble (tokenizer.last_lexical_error)
					else
						parse_sequence
						if not is_parse_error then
							expr2 := expression_factory.make_treat_expression (expr1, internal_last_parsed_sequence)
							expr1 := expr2
						end
					end
				end
			end
			if not is_parse_error then
				internal_last_parsed_expression := expr1
			end
		ensure
			expression_not_void_unless_error: not is_parse_error implies internal_last_parsed_expression /= Void
		end

	parse_castable_expression is
			-- Parse a "castable as" expression;
			-- CastableExpr ::= CastExpr ( "castable" "as" SingleType )?
		require
			static_context_not_void: environment /= Void
			tokenizer_usable: tokenizer /= Void and then tokenizer.input /= Void and not tokenizer.is_lexical_error
			no_previous_parse_error: not is_parse_error
		local
			expr1: XM_XPATH_EXPRESSION
		do
			parse_cast_expression
			if not is_parse_error then
				expr1 := internal_last_parsed_expression
				if tokenizer.last_token = Castable_as_token then
					tokenizer.next
					if tokenizer.is_lexical_error then
						grumble (tokenizer.last_lexical_error)
					else
						parse_sequence
						if not is_parse_error then
							create {XM_XPATH_CASTABLE_EXPRESSION} internal_last_parsed_expression.make (expr1, internal_last_parsed_sequence)
						end
					end
				else
					internal_last_parsed_expression := expr1
				end
			end
		ensure
			expression_not_void_unless_error: not is_parse_error implies internal_last_parsed_expression /= Void
		end

	parse_cast_expression is
			-- Parse a "cast as" expression;
			-- CastExpr ::= ComparisonExpr ( "cast" "as" SingleType )?
		require
			static_context_not_void: environment /= Void
			tokenizer_usable: tokenizer /= Void and then tokenizer.input /= Void and not tokenizer.is_lexical_error
			no_previous_parse_error: not is_parse_error
		local
			expr1: XM_XPATH_EXPRESSION
			expr2: XM_XPATH_CAST_EXPRESSION
		do
			parse_comparison_expression
			if not is_parse_error then
				expr1 := internal_last_parsed_expression
				if tokenizer.last_token = Cast_as_token then
					tokenizer.next
					if tokenizer.is_lexical_error then
						grumble (tokenizer.last_lexical_error)
					else
						parse_sequence
						if not is_parse_error then
							create expr2.make (expr1, internal_last_parsed_sequence)
							expr1 := expr2
						end
					end
				end
				if not is_parse_error then
					internal_last_parsed_expression := expr1
				end
			end
		ensure
			expression_not_void_unless_error: not is_parse_error implies internal_last_parsed_expression /= Void
		end

	parse_comparison_expression is
			-- Parse a ComparisonExpr;
			-- ComparisonExpr ::= RangeExpr ( (ValueComp | GeneralComp | NodeComp) RangeExpr )?
			-- ValueComp::= "eq" | "ne" | "lt" | "le" | "gt" | "ge"
			-- GeneralComp ::= "=" | "!=" | "<" | "<=" | ">" | ">="
			-- NodeComp ::= "is" | "<<" | ">>"
		require
			static_context_not_void: environment /= Void
			tokenizer_usable: tokenizer /= Void and then tokenizer.input /= Void and not tokenizer.is_lexical_error
			no_previous_parse_error: not is_parse_error
		local
			expr1: XM_XPATH_EXPRESSION
			token_class, op: INTEGER
		do
			parse_range_expression
			if not is_parse_error then
				expr1 := internal_last_parsed_expression
				inspect
					tokenizer.last_token
				when Is_token then
					token_class := 1
				when Precedes_token then
					token_class := 1
				when Follows_token then
					token_class := 1
				when Equals_token then
					token_class := 2
				when Not_equal_token then
					token_class := 2
				when Less_than_token then
					token_class := 2
				when Greater_than_token then
					token_class := 2
				when Less_equal_token then
					token_class := 2
				when Greater_equal_token then
					token_class := 2					
				when Fortran_equal_token then
					token_class := 3
				when Fortran_not_equal_token then
					token_class := 3
				when Fortran_less_than_token then
					token_class := 3
				when Fortran_greater_than_token then
					token_class := 3
				when Fortran_less_equal_token then
					token_class := 3
				when Fortran_greater_equal_token then
					token_class := 3					
				else
					token_class := 0
				end
				inspect
					token_class
				when 1 then
					op := tokenizer.last_token
					tokenizer.next
					if tokenizer.is_lexical_error then
						grumble (tokenizer.last_lexical_error)
					else
						parse_range_expression
						if not is_parse_error then
							create {XM_XPATH_IDENTITY_COMPARISON} internal_last_parsed_expression.make (expr1, op, internal_last_parsed_expression)
						end
					end
				when 2 then
					op := tokenizer.last_token
					tokenizer.next
					if tokenizer.is_lexical_error then
						grumble (tokenizer.last_lexical_error)
					else
						parse_range_expression
						if not is_parse_error then
							create {XM_XPATH_GENERAL_COMPARISON} internal_last_parsed_expression.make (expr1, op, internal_last_parsed_expression)
						end
					end
				when 3 then
					op := tokenizer.last_token
					tokenizer.next
					if tokenizer.is_lexical_error then
						grumble (tokenizer.last_lexical_error)
					else
						parse_range_expression
						if not is_parse_error then
							create {XM_XPATH_VALUE_COMPARISON} internal_last_parsed_expression.make (expr1, op, internal_last_parsed_expression)
						end
					end
				else
					internal_last_parsed_expression := expr1
				end
			end
		ensure
			expression_not_void_unless_error: not is_parse_error implies internal_last_parsed_expression /= Void
		end

	parse_range_expression is
			-- Parse a RangeExpr;
			-- RangeExpr ::= AdditiveExpr ( "to" AdditiveExpr )?
		require
			static_context_not_void: environment /= Void
			tokenizer_usable: tokenizer /= Void and then tokenizer.input /= Void and not tokenizer.is_lexical_error
			no_previous_parse_error: not is_parse_error
		local
			expr1: XM_XPATH_EXPRESSION
			expr3: XM_XPATH_RANGE_EXPRESSION
		do
			parse_additive_expression
			if not is_parse_error then
				expr1 := internal_last_parsed_expression
				if tokenizer.last_token = To_token then
					tokenizer.next
					if tokenizer.is_lexical_error then
						grumble (tokenizer.last_lexical_error)
					else
						parse_additive_expression
						if not is_parse_error then
							create expr3.make (expr1, To_token, internal_last_parsed_expression)
							expr1 := expr3
						end
					end
				end
				if not is_parse_error then
					internal_last_parsed_expression := expr1
				end
			end
		ensure
			expression_not_void_unless_error: not is_parse_error implies internal_last_parsed_expression /= Void		
		end

	parse_additive_expression is
			-- Parse an AdditiveExpr;
			-- AdditiveExpr ::= MultiplicativeExpr ( ("+" | "-") MultiplicativeExpr )*
		require
			static_context_not_void: environment /= Void
			tokenizer_usable: tokenizer /= Void and then tokenizer.input /= Void and not tokenizer.is_lexical_error
			no_previous_parse_error: not is_parse_error
		local
			expr1: XM_XPATH_EXPRESSION
			expr3: XM_XPATH_ARITHMETIC_EXPRESSION
			op: INTEGER
		do
			parse_multiplicative_expression
			if not is_parse_error then
				expr1 := internal_last_parsed_expression
				if tokenizer.last_token = Plus_token or else tokenizer.last_token = Minus_token then
					op := tokenizer.last_token
					tokenizer.next
					if tokenizer.is_lexical_error then
						grumble (tokenizer.last_lexical_error)
					else
						parse_multiplicative_expression
						if not is_parse_error then
							create expr3 .make (expr1, op, internal_last_parsed_expression)
							expr1 := expr3
						end
					end
				end
				if not is_parse_error then
					internal_last_parsed_expression := expr1
				end
			end
		ensure
			expression_not_void_unless_error: not is_parse_error implies internal_last_parsed_expression /= Void		
		end

	parse_multiplicative_expression is
			-- Parse a MultiplicativeExpr;
			-- MultiplicativeExpr ::= UnaryExpr ( ("*" | "div" | "idiv" | "mod") UnaryExpr )*
		require
			static_context_not_void: environment /= Void
			tokenizer_usable: tokenizer /= Void and then tokenizer.input /= Void and not tokenizer.is_lexical_error
			no_previous_parse_error: not is_parse_error
		local
			expr1: XM_XPATH_EXPRESSION
			expr3: XM_XPATH_ARITHMETIC_EXPRESSION
			op: INTEGER
			finished: BOOLEAN
		do
			parse_unary_expression
			if not is_parse_error then
				from
					expr1 := internal_last_parsed_expression
					finished := False
				until
					finished or else tokenizer.last_token /= Multiply_token
						and then tokenizer.last_token /= Division_token
						and then tokenizer.last_token /= Modulus_token
						and then tokenizer.last_token /= Integer_division_token
				loop
					op := tokenizer.last_token
					tokenizer.next
					if tokenizer.is_lexical_error then
						finished := True
						grumble (tokenizer.last_lexical_error)
					else
						parse_unary_expression
						if not is_parse_error then
							create expr3.make (expr1, op, internal_last_parsed_expression)
							expr1 := expr3
						else
							finished := True
						end
					end
				end
				if not is_parse_error then
					internal_last_parsed_expression := expr1
				end
			end
		ensure
			expression_not_void_unless_error: not is_parse_error implies internal_last_parsed_expression /= Void		
		end

	parse_unary_expression is
			-- Parse a UnaryExpr;
			-- UnaryExpr ::= ("-" | "+")* UnionExpr
		require
			static_context_not_void: environment /= Void
			tokenizer_usable: tokenizer /= Void and then tokenizer.input /= Void and not tokenizer.is_lexical_error
			no_previous_parse_error: not is_parse_error
		local
			expr1: XM_XPATH_EXPRESSION
			expr3: XM_XPATH_ARITHMETIC_EXPRESSION
		do
			if tokenizer.last_token = Minus_token then
				tokenizer.next
				if tokenizer.is_lexical_error then
					grumble (tokenizer.last_lexical_error)
				else
					create {XM_XPATH_INTEGER_VALUE} expr1.make (0)
					parse_unary_expression
					if not is_parse_error then
						create expr3.make (expr1, Unary_minus_token, internal_last_parsed_expression)
						expr1 := expr3
					end
				end
			elseif tokenizer.last_token = Plus_token then
				tokenizer.next
				if tokenizer.is_lexical_error then
					grumble (tokenizer.last_lexical_error)
				else
					create {XM_XPATH_INTEGER_VALUE} expr1.make (0)
					parse_unary_expression
					if not is_parse_error then

						-- We cannot completely ignore unary plus,
						-- as it might be a type error, or it might
						-- force conversion to a number which would
						-- affect operations such as "=".

						
						create expr3.make (expr1, Plus_token, internal_last_parsed_expression)
						expr1 := expr3
					end
				end				
			else
				parse_union_expression
				expr1 := internal_last_parsed_expression
			end
			if not is_parse_error then internal_last_parsed_expression := expr1 end
		ensure
			expression_not_void_unless_error: not is_parse_error implies internal_last_parsed_expression /= Void		
		end

	parse_union_expression is
			-- Parse a UnionExpr;
			-- UnionExpr ::= IntersectExceptExpr ( ("union" | "|") IntersectExceptExpr )*
		require
			static_context_not_void: environment /= Void
			tokenizer_usable: tokenizer /= Void and then tokenizer.input /= Void and not tokenizer.is_lexical_error
			no_previous_parse_error: not is_parse_error
		local
			expr1, expr2: XM_XPATH_EXPRESSION
			expr3: XM_XPATH_ARITHMETIC_EXPRESSION
		do
			--			 parse_intersect_expression
		end

feature {NONE} -- Implementation

	tokenizer: XM_XPATH_TOKENIZER
			-- Lexical scanner
	
	environment: XM_XPATH_STATIC_CONTEXT
			-- Current static context

	expression_factory: XM_XPATH_EXPRESSION_FACTORY is
			-- Expression factory
		once
			create Result
		end

	internal_last_parse_error: STRING
			-- Text of last parse error encountered

	internal_last_parsed_expression: XM_XPATH_EXPRESSION
			-- Result of last parsing command, if successfull

	internal_last_parsed_sequence: XM_XPATH_SEQUENCE_TYPE
			-- Result of last sequence-type parsing command, if successfull
	
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
