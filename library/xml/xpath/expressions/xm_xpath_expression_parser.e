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

	KL_SHARED_STANDARD_FILES

	XM_XPATH_SHARED_EXPRESSION_TESTER

	XM_XPATH_TYPE

	XM_XPATH_AXIS

	XM_UNICODE_CHARACTERS_1_1

		-- The commands `parse' and `parse_sequence_type' set `is_parse_error'
		-- to indicate success or failure.
		-- Upon success, their result can be accessed via
		-- `last_parsed_expression' and `last_parsed_sequence' respectively.

creation

	make

feature {NONE} -- Initialization

	make is
		do
			do_nothing
		end

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

	parse (an_expression_string: STRING; a_context: XM_XPATH_STATIC_CONTEXT) is
			--  Parse `an_expression_string'.
		require
			expression_string_not_void: an_expression_string /= Void
			static_context_not_void: a_context /= Void
		local
			s: STRING
		do
			environment := a_context
			create tokenizer.make
			tokenizer.tokenize (an_expression_string)
			is_parse_error := False
			parse_expression
			
			if	tokenizer.is_lexical_error then
				report_parse_error (tokenizer.last_lexical_error)
			elseif tokenizer.last_token /= Eof_token then
				s := STRING_.appended_string ("Unexpected token ", display_current_token)
				s := STRING_.appended_string (s, " beyond end of expression")
				report_parse_error (s)
			end
		ensure
			expression_not_void_unless_error: not is_parse_error implies last_parsed_expression /= Void
			static_context_not_void: environment /= Void
		end

	parse_sequence_type (a_sequence_type_string: STRING; a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Parse `a_sequence_type_string';
			-- SequenceType ::= (ItemType OccurrenceIndicator?) | ("empty" "(" ")")
		require
			sequence_text_not_void: a_sequence_type_string /= Void
			static_context_not_void: a_context /= Void
		local
			s: STRING
		do
			environment := a_context
			create tokenizer.make
			tokenizer.tokenize (a_sequence_type_string)
			is_parse_error := False
			parse_sequence

			if	tokenizer.is_lexical_error then
				report_parse_error (tokenizer.last_lexical_error)
			elseif tokenizer.last_token /= Eof_token then
				s := STRING_.appended_string ("Unexpected token ", display_current_token)
				s := STRING_.appended_string (s, " beyond end of sequence type")
				report_parse_error (s)
			end
		ensure
			sequence_not_void_unless_error: not is_parse_error implies last_parsed_sequence /= Void
			static_context_not_void: environment /= Void
		end

feature -- Creation

	make_name_code (a_qname: STRING; use_default_namespace: BOOLEAN): INTEGER is
			-- Create a name_code, using the static_context for namespace resolution
		require
			valid_qname: a_qname /= Void and then is_qname (a_qname)
		local
			a_string_splitter: ST_SPLITTER
			qname_parts: DS_LIST [STRING]
			an_xml_prefix, a_uri, a_local_name: STRING
			a_uri_code: INTEGER
			a_name_pool: XM_XPATH_NAME_POOL
		do
			create a_string_splitter.make
			a_string_splitter.set_separators (":")
			qname_parts := a_string_splitter.split (a_qname)
			a_name_pool := environment.name_pool
			if qname_parts.count = 1 then
				an_xml_prefix := ""
				a_uri := qname_parts.item (1)
				if use_default_namespace then
					a_uri_code := environment.default_element_namespace
					if a_name_pool.is_name_code_allocated_using_uri_code (an_xml_prefix, a_uri_code, a_qname) then
						Result := a_name_pool.name_code (an_xml_prefix, a_name_pool.uri_from_uri_code (a_uri_code), a_qname)
					else
						a_name_pool.allocate_name_using_uri_code (an_xml_prefix, a_uri_code, a_qname)
						Result := a_name_pool.last_name_code
					end
				end
			else
					check
						two_parts: qname_parts.count = 2
					end
				an_xml_prefix := qname_parts.item (1)
				a_local_name := qname_parts.item (2)
				a_uri := environment.uri_for_prefix (an_xml_prefix)
				if a_name_pool.is_name_code_allocated (an_xml_prefix, a_uri, a_local_name) then
					Result := a_name_pool.name_code (an_xml_prefix, a_uri, a_local_name)
				else
					a_name_pool.allocate_name (an_xml_prefix, a_uri, a_local_name)
					Result := a_name_pool.last_name_code
				end
			end
		end

	make_name_test (a_node_type: INTEGER; a_qname: STRING; use_default_namespace: BOOLEAN): XM_XPATH_NAME_TEST is
			-- Create a name test
		require
			valid_qname: a_qname /= Void and then is_qname (a_qname)
			valid_node_type: is_node_type (a_node_type)
		local
			a_name_code: INTEGER
		do
			a_name_code := make_name_code (a_qname, use_default_namespace)
			create Result.make (a_node_type, a_name_code)
			Result.set_original_text (a_qname)
		end

	make_local_name_test (a_node_type: INTEGER; a_local_name: STRING): XM_XPATH_LOCAL_NAME_TEST is
			-- Create a name test
		require
			valid_name: a_local_name /= Void
			valid_node_type: is_node_type (a_node_type)
		do
			if not is_ncname (a_local_name) then
				report_parse_error (STRING_.appended_string (a_local_name, " is not a valid XML NCName"))
			else
				create Result.make (environment.name_pool, a_node_type, a_local_name)
			end
		ensure
			Name_test_not_void_unless_parse_error: not is_parse_error implies Result /= Void
		end

	make_namespace_test (a_node_type: INTEGER; an_xml_prefix: STRING): XM_XPATH_NAMESPACE_TEST is
			-- Make a NamespaceTest (name:*)
		require
			valid_node_type: is_node_type (a_node_type)
			valid_prefix: an_xml_prefix /= Void and then is_ncname (an_xml_prefix)
		do
			create Result.make (environment.name_pool, a_node_type, environment.uri_for_prefix (an_xml_prefix))
			Result.set_original_text (STRING_.appended_string (an_xml_prefix, ":*"))
		ensure
			namespace_test_not_void: Result /= Void
		end

feature {NONE} -- Implementation

	parse_sequence is
			-- Parse the sequence type production
		require
			static_context_not_void: environment /= Void
			tokenizer_usable: tokenizer /= Void and then tokenizer.input /= Void and not tokenizer.is_lexical_error
			no_previous_parse_error: not is_parse_error
		local
			a_primary_type: INTEGER
			a_message: STRING
		do
			a_primary_type := Any_item
			if tokenizer.last_token = Name_token then
				-- TODO
			elseif tokenizer.last_token = Node_kind_token then
				-- TODO
			else
				a_message := STRING_.appended_string ("Expected type name in SequenceType, found ", display_current_token)
				report_parse_error (a_message)
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
			an_expression: XM_XPATH_EXPRESSION
			another_expression: XM_XPATH_APPEND_EXPRESSION
		do
			debug ("XPath Expression Parser")
				std.error.put_string ("Entered parse_expression%N")
			end
			parse_single_expression
			if not is_parse_error then
				from
					an_expression := internal_last_parsed_expression
				until
					is_parse_error or else tokenizer.last_token /= Comma_token
				loop
					tokenizer.next
					if tokenizer.is_lexical_error then
						report_parse_error (tokenizer.last_lexical_error)
					else
						parse_expression
						if not is_parse_error then
							create another_expression.make (an_expression, Comma_token, internal_last_parsed_expression)
							an_expression := another_expression
						end
					end
				end
				if not is_parse_error then internal_last_parsed_expression := an_expression end
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
			debug ("XPath Expression Parser")
				std.error.put_string ("Entered parse_single_expression%N")
			end			
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
			a_condition, a_then_expression, an_else_expression: XM_XPATH_EXPRESSION
			an_if_expression: XM_XPATH_IF_EXPRESSION
			a_message: STRING
		do
			debug ("XPath Expression Parser")
				std.error.put_string ("Entered parse_if_expression%N")
			end
			
			-- The Left_parenthesis_token has already been read.
			
			tokenizer.next
			if tokenizer.is_lexical_error then
				report_parse_error (tokenizer.last_lexical_error)
			else
				parse_expression
				if not is_parse_error then
					a_condition := internal_last_parsed_expression
					if tokenizer.last_token /= Right_parenthesis_token then
						a_message := "expected %")%", found "
						a_message := STRING_.appended_string (a_message, display_current_token)
						report_parse_error (a_message)
					else
						tokenizer.next
						if tokenizer.is_lexical_error then
							report_parse_error (tokenizer.last_lexical_error)
						elseif tokenizer.last_token /= Then_token then
							a_message := "expected %"then%", found "
							a_message := STRING_.appended_string (a_message, display_current_token)
							report_parse_error (a_message)
						else
							parse_expression
							if  not is_parse_error then
								a_then_expression := internal_last_parsed_expression
								if tokenizer.last_token /= Right_parenthesis_token then
									a_message := "expected %"else%", found "
									a_message := STRING_.appended_string (a_message, display_current_token)
									report_parse_error (a_message)
								else
									tokenizer.next
									if tokenizer.is_lexical_error then
										report_parse_error (tokenizer.last_lexical_error)
									else
										parse_single_expression
										if not is_parse_error then
											an_else_expression := internal_last_parsed_expression
											create an_if_expression.make (a_condition, a_then_expression, an_else_expression)
											internal_last_parsed_expression := an_if_expression
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
			debug ("XPath Expression Parser")
				std.error.put_string ("Entered parse_typeswitch_expression%N")
			end
			report_parse_error("typeswitch is not allowed in XPath")
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
			an_expression: XM_XPATH_EXPRESSION
			another_expression: XM_XPATH_BOOLEAN_EXPRESSION
		do
			debug ("XPath Expression Parser")
				std.error.put_string ("Entered parse_or_expression%N")
			end
			parse_and_expression
			if not is_parse_error then
				from
					an_expression := internal_last_parsed_expression
				until
					is_parse_error or else tokenizer.last_token /= Or_token
				loop
					tokenizer.next
					if tokenizer.is_lexical_error then
						report_parse_error (tokenizer.last_lexical_error)
					else
						parse_and_expression
						if not is_parse_error then
							create another_expression.make (an_expression, Or_token, internal_last_parsed_expression)
							an_expression := another_expression
						end
					end
				end
				if not is_parse_error then internal_last_parsed_expression := an_expression end
				
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
			an_expression: XM_XPATH_EXPRESSION
			another_expression: XM_XPATH_BOOLEAN_EXPRESSION
		do
			debug ("XPath Expression Parser")
				std.error.put_string ("Entered parse_and_expression%N")
			end
			parse_instance_of_expression
			if not is_parse_error then
				from
					an_expression := internal_last_parsed_expression
				until
					is_parse_error or else tokenizer.last_token /= And_token
				loop
					tokenizer.next
					if tokenizer.is_lexical_error then
						report_parse_error (tokenizer.last_lexical_error)
					else
						parse_instance_of_expression
						if not is_parse_error then
							create another_expression.make (an_expression, And_token, internal_last_parsed_expression)
							an_expression := another_expression
						end
					end
				end
				if not is_parse_error then internal_last_parsed_expression := an_expression end
				
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
			debug ("XPath Expression Parser")
				std.error.put_string ("Entered parse_for_expression%N")
			end
			if tokenizer.last_token = Let_token then
				report_parse_error ("'let' is not supported in XPath")
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
			debug ("XPath Expression Parser")
				std.error.put_string ("Entered parse_quantified_expression%N")
			end
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
			a_clause: XM_XPATH_FOR_CLAUSE
			an_action: XM_XPATH_EXPRESSION
			a_clause_list: DS_ARRAYED_LIST [XM_XPATH_FOR_CLAUSE]
			an_operator, an_index, a_line_number: INTEGER
			finished: BOOLEAN
			a_message, a_token_value: STRING
			a_range_variable: XM_XPATH_RANGE_VARIABLE_DECLARATION
			an_assignment: XM_XPATH_ASSIGNATION
			a_single_item, a_sequence: XM_XPATH_SEQUENCE_TYPE
		do
			debug ("XPath Expression Parser")
				std.error.put_string ("Entered parse_mapping_expression%N")
			end
			create a_clause_list.make (5)
			an_operator := tokenizer.last_token			
			from
				finished := False
			until
				finished
			loop
				a_line_number := tokenizer.line_number
				tokenizer.next
				if tokenizer.is_lexical_error then
					report_parse_error (tokenizer.last_lexical_error)
				elseif tokenizer.last_token /= Dollar_token then
					a_message := "expected %"$%", found "
					a_message := STRING_.appended_string (a_message, display_current_token)
					report_parse_error (a_message)
				else
					tokenizer.next
					if tokenizer.is_lexical_error then
						report_parse_error (tokenizer.last_lexical_error)
					elseif tokenizer.last_token /= Name_token then
						a_message := "expected %"<name>%", found "
						a_message := STRING_.appended_string (a_message, display_current_token)
						report_parse_error (a_message)
					else
						a_token_value := tokenizer.last_token_value

						tokenizer.next
						if tokenizer.is_lexical_error then
							report_parse_error (tokenizer.last_lexical_error)
						elseif tokenizer.last_token /= In_token then
							a_message := "expected %"in%", found "
							a_message := STRING_.appended_string (a_message, display_current_token)
							report_parse_error (a_message)
						else

							-- process the "in" clause

							if tokenizer.is_lexical_error then
								report_parse_error (tokenizer.last_lexical_error)
							else
								parse_single_expression
								if not is_parse_error then
									create a_single_item.make_single_item
									create a_range_variable.make (a_token_value, make_name_code (a_token_value, False) \\ bits_20, a_single_item)
									create a_clause.make (a_range_variable, internal_last_parsed_expression, a_line_number)
									declare_range_variable (a_clause.range_variable)
									a_clause_list.put_last (a_clause)
								end
							end
						end
					end
				end

				if tokenizer.last_token /= Comma_token then finished := True end
			end

			-- process the action ("return"/"satisfies" expression)

			if an_operator = For_Token then
				if tokenizer.last_token /= Return_token then
					a_message := "expected %"return%", found "
					a_message := STRING_.appended_string (a_message, display_current_token)
					report_parse_error (a_message)
				end
			else
				if tokenizer.last_token /= Satisfies_token then
					a_message := "expected %"satisfies%", found "
					a_message := STRING_.appended_string (a_message, display_current_token)
					report_parse_error (a_message)
				end
			end
			tokenizer.next
			if tokenizer.is_lexical_error then
				report_parse_error (tokenizer.last_lexical_error)
			else
				parse_single_expression
				if not is_parse_error then
					an_action := internal_last_parsed_expression

					-- work backwards through the list of range variables,
					-- fixing up all references to the variables in the inner expression

					from
						an_index := a_clause_list.count
					until
						an_index = 0
					loop
						a_clause := a_clause_list.item (an_index)

						-- Attempt to give the range variable a more precise type, based on analysis of
						-- `an_action'. This will often be approximate, because variables and function
						-- calls in the action expression have not yet been resolved. We rely on the ability
						-- of all expressions to return some kind of type information even if this is imprecise.

						create a_sequence.make (a_clause.sequence.item_type, Required_cardinality_exactly_one)
						a_clause.range_variable.set_required_type (a_sequence)

						if an_operator = For_token then
							create {XM_XPATH_FOR_EXPRESSION} an_assignment.make (a_clause.range_variable, a_clause.sequence, an_action)
						else
							create {XM_XPATH_QUANTIFIED_EXPRESSION} an_assignment.make (an_operator, a_clause.range_variable, a_clause.sequence, an_action)
						end

						-- for the next outermost "for" clause, the "action" is this ForExpression
						an_action := an_assignment

						an_index := an_index - 1
					end

					-- undeclare all the range variables

						range_variable_stack.wipe_out

					internal_last_parsed_expression := an_action
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
			an_expression: XM_XPATH_EXPRESSION
			another_expression: XM_XPATH_INSTANCE_OF_EXPRESSION
		do
			debug ("XPath Expression Parser")
				std.error.put_string ("Entered parse_instance_of_expression%N")
			end			
			parse_treat_expression
			if not is_parse_error then
				an_expression := internal_last_parsed_expression
				if tokenizer.last_token = Instance_of_token then
					tokenizer.next
					if tokenizer.is_lexical_error then
						report_parse_error (tokenizer.last_lexical_error)
					else
						parse_sequence
						if not is_parse_error then
							create {XM_XPATH_INSTANCE_OF_EXPRESSION} another_expression.make (an_expression, internal_last_parsed_sequence)
							an_expression := another_expression
						end
					end
				end
				if not is_parse_error then internal_last_parsed_expression := an_expression end
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
			an_expression, another_expression: XM_XPATH_EXPRESSION
		do
			debug ("XPath Expression Parser")
				std.error.put_string ("Entered parse_treat_expression%N")
			end			
			parse_castable_expression
			if not is_parse_error then
				an_expression := internal_last_parsed_expression
				if tokenizer.last_token = Treat_as_token then
					tokenizer.next
					if tokenizer.is_lexical_error then
						report_parse_error (tokenizer.last_lexical_error)
					else
						parse_sequence
						if not is_parse_error then
							another_expression := expression_factory.make_treat_expression (an_expression, internal_last_parsed_sequence)
							an_expression := another_expression
						end
					end
				end
			end
			if not is_parse_error then
				internal_last_parsed_expression := an_expression
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
			an_expression: XM_XPATH_EXPRESSION
		do
			debug ("XPath Expression Parser")
				std.error.put_string ("Entered parse_castable_expression%N")
			end
			parse_cast_expression
			if not is_parse_error then
				an_expression := internal_last_parsed_expression
				if tokenizer.last_token = Castable_as_token then
					tokenizer.next
					if tokenizer.is_lexical_error then
						report_parse_error (tokenizer.last_lexical_error)
					else
						parse_sequence
						if not is_parse_error then
							create {XM_XPATH_CASTABLE_EXPRESSION} internal_last_parsed_expression.make (an_expression, internal_last_parsed_sequence)
						end
					end
				else
					internal_last_parsed_expression := an_expression
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
			an_expression: XM_XPATH_EXPRESSION
			another_expression: XM_XPATH_CAST_EXPRESSION
		do
			debug ("XPath Expression Parser")
				std.error.put_string ("Entered parse_cast_expression%N")
			end			
			parse_comparison_expression
			if not is_parse_error then
				an_expression := internal_last_parsed_expression
				if tokenizer.last_token = Cast_as_token then
					tokenizer.next
					if tokenizer.is_lexical_error then
						report_parse_error (tokenizer.last_lexical_error)
					else
						parse_sequence
						if not is_parse_error then
							create another_expression.make_from_sequence_type (an_expression, internal_last_parsed_sequence)
							an_expression := another_expression
						end
					end
				end
				if not is_parse_error then
					internal_last_parsed_expression := an_expression
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
			an_expression: XM_XPATH_EXPRESSION
			an_operator: INTEGER
		do
			debug ("XPath Expression Parser")
				std.error.put_string ("Entered parse_comparison_expression%N")
			end			
			parse_range_expression
			if not is_parse_error then
				an_expression := internal_last_parsed_expression

				inspect
					tokenizer.last_token

				when Is_token, Precedes_token, Follows_token  then
					an_operator := tokenizer.last_token
					tokenizer.next
					if tokenizer.is_lexical_error then
						report_parse_error (tokenizer.last_lexical_error)
					else
						parse_range_expression
						if not is_parse_error then
							create {XM_XPATH_IDENTITY_COMPARISON} internal_last_parsed_expression.make (an_expression, an_operator, internal_last_parsed_expression)
						end
					end

				when Equals_token, Not_equal_token, Less_than_token, Greater_than_token, Less_equal_token, Greater_equal_token then
					an_operator := tokenizer.last_token
					tokenizer.next
					if tokenizer.is_lexical_error then
						report_parse_error (tokenizer.last_lexical_error)
					else
						parse_range_expression
						if not is_parse_error then
							create {XM_XPATH_GENERAL_COMPARISON} internal_last_parsed_expression.make (an_expression, an_operator, internal_last_parsed_expression)
						end
					end

				when Fortran_equal_token, Fortran_not_equal_token, Fortran_less_than_token, Fortran_greater_than_token, Fortran_less_equal_token, Fortran_greater_equal_token then
					an_operator := tokenizer.last_token
					tokenizer.next
					if tokenizer.is_lexical_error then
						report_parse_error (tokenizer.last_lexical_error)
					else
						parse_range_expression
						if not is_parse_error then
							create {XM_XPATH_VALUE_COMPARISON} internal_last_parsed_expression.make (an_expression, an_operator, internal_last_parsed_expression)
						end
					end

				else
					internal_last_parsed_expression := an_expression
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
			an_expression: XM_XPATH_EXPRESSION
			another_expression: XM_XPATH_RANGE_EXPRESSION
		do
			debug ("XPath Expression Parser")
				std.error.put_string ("Entered parse_range_expression%N")
			end			
			parse_additive_expression
			if not is_parse_error then
				an_expression := internal_last_parsed_expression
				if tokenizer.last_token = To_token then
					tokenizer.next
					if tokenizer.is_lexical_error then
						report_parse_error (tokenizer.last_lexical_error)
					else
						parse_additive_expression
						if not is_parse_error then
							create another_expression.make (an_expression, To_token, internal_last_parsed_expression)
							an_expression := another_expression
						end
					end
				end
				if not is_parse_error then
					internal_last_parsed_expression := an_expression
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
			an_expression: XM_XPATH_EXPRESSION
			another_expression: XM_XPATH_ARITHMETIC_EXPRESSION
			an_operator: INTEGER
		do
			debug ("XPath Expression Parser")
				std.error.put_string ("Entered parse_additive_expression%N")
			end			
			parse_multiplicative_expression
			if not is_parse_error then
				an_expression := internal_last_parsed_expression
				if tokenizer.last_token = Plus_token or else tokenizer.last_token = Minus_token then
					an_operator := tokenizer.last_token
					tokenizer.next
					if tokenizer.is_lexical_error then
						report_parse_error (tokenizer.last_lexical_error)
					else
						parse_multiplicative_expression
						if not is_parse_error then
							create another_expression .make (an_expression, an_operator, internal_last_parsed_expression)
							an_expression := another_expression
						end
					end
				end
				if not is_parse_error then
					internal_last_parsed_expression := an_expression
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
			an_expression: XM_XPATH_EXPRESSION
			another_expression: XM_XPATH_ARITHMETIC_EXPRESSION
			an_operator: INTEGER
			finished: BOOLEAN
		do
			debug ("XPath Expression Parser")
				std.error.put_string ("Entered parse_multiplicative_expression%N")
			end
			parse_unary_expression
			if not is_parse_error then
				from
					an_expression := internal_last_parsed_expression
					finished := False
				until
					finished or else tokenizer.last_token /= Multiply_token
						and then tokenizer.last_token /= Division_token
						and then tokenizer.last_token /= Modulus_token
						and then tokenizer.last_token /= Integer_division_token
				loop
					an_operator := tokenizer.last_token
					tokenizer.next
					if tokenizer.is_lexical_error then
						finished := True
						report_parse_error (tokenizer.last_lexical_error)
					else
						parse_unary_expression
						if not is_parse_error then
							create another_expression.make (an_expression, an_operator, internal_last_parsed_expression)
							an_expression := another_expression
						else
							finished := True
						end
					end
				end
				if not is_parse_error then
					internal_last_parsed_expression := an_expression
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
			an_expression: XM_XPATH_EXPRESSION
			another_expression: XM_XPATH_ARITHMETIC_EXPRESSION
		do
			debug ("XPath Expression Parser")
				std.error.put_string ("Entered parse_unary_expression%N")
			end			
			if tokenizer.last_token = Minus_token then
				tokenizer.next
				if tokenizer.is_lexical_error then
					report_parse_error (tokenizer.last_lexical_error)
				else
					create {XM_XPATH_INTEGER_VALUE} an_expression.make (0)
					parse_unary_expression
					if not is_parse_error then
						create another_expression.make (an_expression, Unary_minus_token, internal_last_parsed_expression)
						an_expression := another_expression
					end
				end
			elseif tokenizer.last_token = Plus_token then
				tokenizer.next
				if tokenizer.is_lexical_error then
					report_parse_error (tokenizer.last_lexical_error)
				else
					create {XM_XPATH_INTEGER_VALUE} an_expression.make (0)
					parse_unary_expression
					if not is_parse_error then

						-- We cannot completely ignore unary plus,
						-- as it might be a type error, or it might
						-- force conversion to a number which would
						-- affect operations such as "=".

						
						create another_expression.make (an_expression, Plus_token, internal_last_parsed_expression)
						an_expression := another_expression
					end
				end				
			else
				parse_union_expression
				an_expression := internal_last_parsed_expression
			end
			if not is_parse_error then internal_last_parsed_expression := an_expression end
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
			an_expression: XM_XPATH_EXPRESSION
			another_expression: XM_XPATH_VENN_EXPRESSION
		do
			debug ("XPath Expression Parser")
				std.error.put_string ("Entered parse_union_expression%N")
			end			
			parse_intersect_expression
			if not is_parse_error then
				from
					an_expression := internal_last_parsed_expression
				until
					is_parse_error or else tokenizer.last_token /= Union_token
				loop
					tokenizer.next
					if tokenizer.is_lexical_error then
						report_parse_error (tokenizer.last_lexical_error)
					else
						parse_intersect_expression
						if not is_parse_error then
							create another_expression.make (an_expression, Union_token, internal_last_parsed_expression)
							an_expression := another_expression
						end
					end
				end
				if not is_parse_error then
					internal_last_parsed_expression := an_expression
				end
			end
		ensure
			expression_not_void_unless_error: not is_parse_error implies internal_last_parsed_expression /= Void			
		end

	parse_intersect_expression is
			-- Parse an IntersectExceptExpr;
			-- IntersectExceptExpr ::= ValueExpr ( ("intersect" | "except") ValueExpr )*
			-- ValueExpr ::= PathExpr
		require
			static_context_not_void: environment /= Void
			tokenizer_usable: tokenizer /= Void and then tokenizer.input /= Void and not tokenizer.is_lexical_error
			no_previous_parse_error: not is_parse_error
		local
			an_expression: XM_XPATH_EXPRESSION
			another_expression: XM_XPATH_VENN_EXPRESSION
			an_operator: INTEGER
		do
			debug ("XPath Expression Parser")
				std.error.put_string ("Entered parse_intersect_expression%N")
			end
			parse_path_expression
			if not is_parse_error then
				from
					an_expression := internal_last_parsed_expression
				until
					is_parse_error or else (tokenizer.last_token /= Intersect_token and tokenizer.last_token /= Except_token)
				loop
					an_operator := tokenizer.last_token
					tokenizer.next
					if tokenizer.is_lexical_error then
						report_parse_error (tokenizer.last_lexical_error)
					else
						parse_path_expression
						if not is_parse_error then
							create another_expression.make (an_expression, an_operator, internal_last_parsed_expression)
							an_expression := another_expression
						end
					end
				end
				if not is_parse_error then
					internal_last_parsed_expression := an_expression
				end
			end
		ensure
			expression_not_void_unless_error: not is_parse_error implies internal_last_parsed_expression /= Void			
		end

	parse_path_expression is
			-- Parse a PathExpresssion;
			-- PathExpr ::= ("/" RelativePathExpr?)
			-- | ("//" RelativePathExpr)
			-- | RelativePathExpr
		require
			static_context_not_void: environment /= Void
			tokenizer_usable: tokenizer /= Void and then tokenizer.input /= Void and not tokenizer.is_lexical_error
			no_previous_parse_error: not is_parse_error
		local
			a_path: XM_XPATH_EXPRESSION
			another_path, a_third_path: XM_XPATH_PATH_EXPRESSION
			root: XM_XPATH_ROOT_EXPRESSION
			axis: XM_XPATH_AXIS_EXPRESSION
		do
			debug ("XPath Expression Parser")
				std.error.put_string ("Entered parse_path_expression%N")
			end			
			inspect
				tokenizer.last_token

			when Slash_token then
				tokenizer.next
				if tokenizer.is_lexical_error then
					report_parse_error (tokenizer.last_lexical_error)
				else
					create root.make
					if is_at_start_of_relative_path then
						parse_relative_path
						if not is_parse_error then
							create another_path.make (root, internal_last_parsed_expression)
							a_path := another_path
						end
					else
						a_path := root
					end
					if not is_parse_error then
						internal_last_parsed_expression := a_path
					end
				end

			when Slash_slash_token then
				tokenizer.next
				if tokenizer.is_lexical_error then
					report_parse_error (tokenizer.last_lexical_error)
				else
					parse_relative_path
					if not is_parse_error then
						create root.make
						create axis.make (Descendant_or_self_axis, Void)
						create a_third_path.make (axis, internal_last_parsed_expression)
						create another_path.make (root, a_third_path)
						internal_last_parsed_expression := another_path
					end
				end

			else
				parse_relative_path
			end
		ensure
			expression_not_void_unless_error: not is_parse_error implies internal_last_parsed_expression /= Void			
		end

	parse_relative_path is
			-- Parse a relative path (a sequence of steps).
			-- RelativePathExpr ::= StepExpr (("/" | "//") StepExpr)*
		require
			static_context_not_void: environment /= Void
			tokenizer_usable: tokenizer /= Void and then tokenizer.input /= Void and not tokenizer.is_lexical_error
			no_previous_parse_error: not is_parse_error
		local
			an_expression: XM_XPATH_EXPRESSION
			a_path, another_path: XM_XPATH_PATH_EXPRESSION
			axis: XM_XPATH_AXIS_EXPRESSION
			an_operator: INTEGER
		do
			debug ("XPath Expression Parser")
				std.error.put_string ("Entered parse_relative_path_expression%N")
			end			parse_step_expression
			if not is_parse_error then
				from
					an_expression := internal_last_parsed_expression
				until
					is_parse_error or else (tokenizer.last_token /= Slash_token and then tokenizer.last_token /= Slash_slash_token)
				loop
					an_operator := tokenizer.last_token
					tokenizer.next
					if tokenizer.is_lexical_error then
						report_parse_error (tokenizer.last_lexical_error)
					else
						parse_relative_path
						if not is_parse_error then
							if an_operator = Slash_token then
								create {XM_XPATH_PATH_EXPRESSION} an_expression.make (an_expression, internal_last_parsed_expression)
							else
								create axis.make (Descendant_or_self_axis, Void)
								create another_path.make (axis, internal_last_parsed_expression)
								create a_path.make (an_expression, another_path)
								an_expression := a_path
							end
						end
					end
				end
			end
			if not is_parse_error then
				internal_last_parsed_expression := an_expression
			end
		ensure
			expression_not_void_unless_error: not is_parse_error implies internal_last_parsed_expression /= Void
		end

	parse_step_expression is
			-- Parse a step (including an optional sequence of predicates).
			--	StepExpr ::= AxisStep | FilterStep
			-- AxisStep ::= (ForwardStep | ReverseStep) Predicates
			-- FilterStep ::=	PrimaryExpr Predicates
			-- ForwardStep ::= (ForwardAxis NodeTest) | AbbrevForwardStep
			-- ReverseStep ::= (ReverseAxis NodeTest) | AbbrevReverseStep
		require
			static_context_not_void: environment /= Void
			tokenizer_usable: tokenizer /= Void and then tokenizer.input /= Void and not tokenizer.is_lexical_error
			no_previous_parse_error: not is_parse_error
		local
			a_step, a_predicate: XM_XPATH_EXPRESSION
			an_axis: XM_XPATH_AXIS_EXPRESSION
			reverse: BOOLEAN
			a_message: STRING
		do
			debug ("XPath Expression Parser")
				std.error.put_string ("Entered parse_step_expression%N")
			end
			parse_basic_step

			if not is_parse_error then
				
				-- When the filter is applied to an Axis step, the nodes are considered in
				-- axis order. In all other cases they are considered in document order.

				a_step := internal_last_parsed_expression
				an_axis ?= a_step
				reverse := (an_axis /= Void and then is_reverse_axis (an_axis.axis))

				from
				until
					is_parse_error or else tokenizer.last_token /= Left_square_bracket_token
				loop
					tokenizer.next
					if tokenizer.is_lexical_error then
						report_parse_error (tokenizer.last_lexical_error)
					else
						parse_single_expression
						if not is_parse_error then
							a_predicate := internal_last_parsed_expression
							if tokenizer.last_token /= Right_square_bracket_token then
								a_message := "expected %"]%", found "
								a_message := STRING_.appended_string (a_message, display_current_token)
								report_parse_error (a_message)
							else
								tokenizer.next
								if tokenizer.is_lexical_error then
									report_parse_error (tokenizer.last_lexical_error)
								else
									create {XM_XPATH_FILTER_EXPRESSION} a_step.make (a_step, a_predicate)
								end
							end
						end
					end
				end
				if not is_parse_error then
					if reverse then
						create {XM_XPATH_REVERSER} internal_last_parsed_expression.make (a_step)
					else
						internal_last_parsed_expression := a_step
					end
				end
			end
		ensure
			expression_not_void_unless_error: not is_parse_error implies internal_last_parsed_expression /= Void
		end

	parse_basic_step is
			-- Parse a basic step expression (without the predicates).
		require
			static_context_not_void: environment /= Void
			tokenizer_usable: tokenizer /= Void and then tokenizer.input /= Void and not tokenizer.is_lexical_error
			no_previous_parse_error: not is_parse_error
		local
			a_message, a_token_value: STRING
			a_token_value_fingerprint, a_default_axis, an_axis_number, a_principal_node_type: INTEGER
			a_variable: XM_XPATH_VARIABLE_DECLARATION
			a_reference: XM_XPATH_VARIABLE_REFERENCE
			a_sequence: XM_XPATH_EXPRESSION
			a_string_literal: XM_XPATH_STRING_VALUE
			a_value: XM_XPATH_VALUE
		do
			debug ("XPath Expression Parser")
				std.error.put_string ("Entered parse_basic_step%N")
			end
			debug ("XPath Expression Parser - tokens")
				std.error.put_string ("Current token is ")
				std.error.put_string (display_current_token)
			end			
			inspect
				tokenizer.last_token

			when Dollar_token then
				tokenizer.next
				if tokenizer.is_lexical_error then
					report_parse_error (tokenizer.last_lexical_error)
				else
					if tokenizer.last_token /= Name_token then
						a_message := "expected %"<name>%", found "
						a_message := STRING_.appended_string (a_message, display_current_token)
						report_parse_error (a_message)
					else
						a_token_value := tokenizer.last_token_value
						a_token_value_fingerprint := make_name_code (a_token_value, False) \\ bits_20
						
						-- See if it's a range variable, or a variable in the context
						
						a_variable := find_range_variable (a_token_value_fingerprint)
						if a_variable /= Void then
							create a_reference.make (a_variable)
						else
							environment.bind_variable (a_token_value_fingerprint)
							if environment.was_last_variable_bound then
								create a_reference .make(environment.last_bound_variable)
							else
								a_message := STRING_.appended_string ("Variable $", a_token_value)
								a_message := STRING_.appended_string (a_message, " has not been declared")
								-- TODO need to add location information
								report_parse_error (a_message)
							end
						end
					end
				end
				if not is_parse_error then
					internal_last_parsed_expression := a_reference
				end
				
			when Left_parenthesis_token then
				tokenizer.next
				if tokenizer.is_lexical_error then
					report_parse_error (tokenizer.last_lexical_error)
				else
					if tokenizer.last_token = Right_parenthesis_token then
						tokenizer.next
						if tokenizer.is_lexical_error then
							report_parse_error (tokenizer.last_lexical_error)
						else
							create {XM_XPATH_EMPTY_SEQUENCE} internal_last_parsed_expression.make
						end
					else
						parse_expression
						if not is_parse_error then
							a_sequence := internal_last_parsed_expression
							if tokenizer.last_token /= Right_parenthesis_token then
								a_message := "expected %"%)%", found "
								a_message := STRING_.appended_string (a_message, display_current_token)
								report_parse_error (a_message)
							else
								tokenizer.next
								if tokenizer.is_lexical_error then
									report_parse_error (tokenizer.last_lexical_error)
								else
									internal_last_parsed_expression := a_sequence
								end
							end
						end
					end
				end

			when String_literal_token then
				create a_string_literal.make (tokenizer.last_token_value)
				tokenizer.next
				if tokenizer.is_lexical_error then
					report_parse_error (tokenizer.last_lexical_error)
				else
					internal_last_parsed_expression := a_string_literal
				end

			when Number_token then
				if tokenizer.last_token_value.index_of ('E', 1) > 0 or else tokenizer.last_token_value.index_of ('e', 1) > 0 then
					if tokenizer.last_token_value.is_double then
						create {XM_XPATH_DOUBLE_VALUE} a_value.make_from_string (tokenizer.last_token_value)
					else
						a_message := STRING_.appended_string ("Invalid numeric literal [", tokenizer.last_token_value)
						a_message := STRING_.appended_string (a_message,  "]")
						report_parse_error (a_message)
					end
				elseif tokenizer.last_token_value.index_of ('.', 1) > 0  then
					if tokenizer.last_token_value.is_double then -- TODO
						create {XM_XPATH_DECIMAL_VALUE} a_value.make_from_string (tokenizer.last_token_value)
					else
						a_message := STRING_.appended_string ("Invalid numeric literal [", tokenizer.last_token_value)
						a_message := STRING_.appended_string (a_message,  "]")
						report_parse_error (a_message)
					end
				else
					if tokenizer.last_token_value.is_integer then -- TODO
						create {XM_XPATH_INTEGER_VALUE} a_value.make_from_string (tokenizer.last_token_value)
					else
						a_message := STRING_.appended_string ("Invalid numeric literal [", tokenizer.last_token_value)
						a_message := STRING_.appended_string (a_message,  "]")
						report_parse_error (a_message)
					end
				end
				tokenizer.next
				if tokenizer.is_lexical_error then
					report_parse_error (tokenizer.last_lexical_error)
				end
				if not is_parse_error then
					internal_last_parsed_expression := a_value
				end

			when Function_token then
				parse_function_call

			when Dot_token then
				tokenizer.next
				if tokenizer.is_lexical_error then
					report_parse_error (tokenizer.last_lexical_error)
				else
					create {XM_XPATH_CONTEXT_ITEM_EXPRESSION} internal_last_parsed_expression.make
				end

			when Dot_dot_token then
				tokenizer.next
				if tokenizer.is_lexical_error then
					report_parse_error (tokenizer.last_lexical_error)
				else
					create {XM_XPATH_PARENT_NODE_EXPRESSION} internal_last_parsed_expression.make
				end

			when Node_kind_token then
				a_default_axis := Child_axis
				if STRING_.same_string (tokenizer.last_token_value, "attribute") then
					a_default_axis := Attribute_axis
				end
				parse_node_test (Element_node)
				if not is_parse_error then
					create {XM_XPATH_AXIS_EXPRESSION} internal_last_parsed_expression.make (a_default_axis, internal_last_parsed_node_test)
				end

			when Prefix_token, Suffix_token, Name_token, Star_token then
				parse_node_test (Element_node)
				if not is_parse_error then
					create {XM_XPATH_AXIS_EXPRESSION} internal_last_parsed_expression.make (Child_axis, internal_last_parsed_node_test)
				end

			when At_token then
				tokenizer.next
				if tokenizer.is_lexical_error then
					report_parse_error (tokenizer.last_lexical_error)
				else
					if tokenizer.last_token = Name_token 
						or else tokenizer.last_token = Prefix_token
						or else tokenizer.last_token = Suffix_token
						or else tokenizer.last_token = Star_token
						or else tokenizer.last_token = Node_kind_token then
						parse_node_test (Attribute_node)
						if not is_parse_error then
							create {XM_XPATH_AXIS_EXPRESSION} internal_last_parsed_expression.make (Attribute_axis, internal_last_parsed_node_test)
						end	
					else
						report_parse_error ("@ must be followed by a NodeTest")
					end
				end

			when Axis_token then
				if not is_axis_name_valid (tokenizer.last_token_value) then
					a_message := STRING_.appended_string ("Unexpected axis name, found ", display_current_token)
					report_parse_error (a_message)
				else
					an_axis_number := axis_number (tokenizer.last_token_value)
					a_principal_node_type := axis_principal_node_type (an_axis_number)
					tokenizer.next
					if tokenizer.is_lexical_error then
						report_parse_error (tokenizer.last_lexical_error)
					else
						if tokenizer.last_token = Name_token 
							or else tokenizer.last_token = Prefix_token
							or else tokenizer.last_token = Suffix_token
							or else tokenizer.last_token = Star_token
							or else tokenizer.last_token = Node_kind_token then
							parse_node_test (a_principal_node_type)
							if not is_parse_error then
								create {XM_XPATH_AXIS_EXPRESSION} internal_last_parsed_expression.make (an_axis_number, internal_last_parsed_node_test)
							end
						else
							a_message := STRING_.appended_string ("Unexpected token ", display_current_token)
							a_message := STRING_.appended_string (a_message, " after axis name")
							report_parse_error (a_message)
						end
					end
				end

			when Keyword_curly_token, Element_qname_token, Attribute_qname_token, Pi_qname_token, Tag_token then
				parse_constructor

			else
				a_message := STRING_.appended_string ("Unexpected token ", display_current_token)
				a_message := STRING_.appended_string (a_message, " in path expression")
				report_parse_error (a_message)
			end
		ensure
			expression_not_void_unless_error: not is_parse_error implies internal_last_parsed_expression /= Void
		end

	parse_function_call is
			-- Parse a function call.
			-- FunctionCall ::= QName "(" (ExprSingle ("," ExprSingle)*)? ")"
		require
			static_context_not_void: environment /= Void
			tokenizer_usable: tokenizer /= Void and then tokenizer.input /= Void and not tokenizer.is_lexical_error
			no_previous_parse_error: not is_parse_error
		local
			a_function_name, a_message: STRING
			arguments: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			an_argument: XM_XPATH_EXPRESSION
		do
			debug ("XPath Expression Parser")
				std.error.put_string ("Entered parse_function_call%N")
			end
			a_function_name := tokenizer.last_token_value
			if is_qname (a_function_name) then
				
				-- The "(" has already been read by the Tokenizer: now parse the arguments.
				
				create arguments.make (10)
				tokenizer.next
				if tokenizer.is_lexical_error then
					report_parse_error (tokenizer.last_lexical_error)
				else
					if tokenizer.last_token /= Right_parenthesis_token then
						parse_single_expression
						if not is_parse_error then
							an_argument := internal_last_parsed_expression
							if not arguments.extendible (1) then
								arguments.resize (2 * arguments.count)
							end
							arguments.put_last (an_argument)
							from
							until
								tokenizer.last_token /= Comma_token or else is_parse_error
							loop
								tokenizer.next
								if tokenizer.is_lexical_error then
									report_parse_error (tokenizer.last_lexical_error)
								else
									parse_single_expression
									if not is_parse_error then
										an_argument := internal_last_parsed_expression
										if not arguments.extendible (1) then
											arguments.resize (2 * arguments.count)
										end
										arguments.put_last (an_argument)
									end
								end
							end
							if tokenizer.last_token /= Right_parenthesis_token then
								a_message := "expected %"%)%", found "
								a_message := STRING_.appended_string (a_message, display_current_token)
								report_parse_error (a_message)
							end
						end
					end
					tokenizer.next
					if tokenizer.is_lexical_error then
						report_parse_error (tokenizer.last_lexical_error)
					else
						environment.bind_function (a_function_name, arguments)
						if environment.was_last_function_bound then
							internal_last_parsed_expression := environment.last_bound_function
						end
					end
				end
			else
				report_parse_error (STRING_.appended_string ("Function name is not a QName. Found ", tokenizer.last_token_value))
			end
		ensure
			expression_not_void_unless_error: not is_parse_error implies internal_last_parsed_expression /= Void
		end

	parse_node_test (a_node_type: INTEGER) is
			-- Parse a NodeTest.
			-- NodeTest ::= KindTest | NameTest
			--	NameTest::=	QName | Wildcard
			-- Wildcard ::= "*"
			-- | (NCName ":" "*")
			-- | ("*" ":" NCName) 	/* ws: explicit */
		require
			static_context_not_void: environment /= Void
			tokenizer_usable: tokenizer /= Void and then tokenizer.input /= Void and not tokenizer.is_lexical_error
			no_previous_parse_error: not is_parse_error
			valid_node_type: is_node_type (a_node_type)
		local
			a_token: INTEGER
			a_token_value: STRING
			a_message: STRING
			types: ARRAY [INTEGER]
		do
			debug ("XPath Expression Parser")
				std.error.put_string ("Entered parse_node_test%N")
			end
			a_token := tokenizer.last_token
			a_token_value := tokenizer.last_token_value
			inspect
				a_token
			when Name_token then
				tokenizer.next
				if tokenizer.is_lexical_error then
					report_parse_error (tokenizer.last_lexical_error)
				else
					internal_last_parsed_node_test := make_name_test (a_node_type, a_token_value, a_node_type = Element_node)
				end
				
			when Prefix_token then
				tokenizer.next
				if tokenizer.is_lexical_error then
					report_parse_error (tokenizer.last_lexical_error)
				else
					internal_last_parsed_node_test := make_namespace_test (a_node_type, a_token_value)
				end
					
			when Suffix_token then
				tokenizer.next
				if tokenizer.is_lexical_error then
					report_parse_error (tokenizer.last_lexical_error)
				else
					if tokenizer.last_token /= Name_token then
						a_message := "expected %"<name>%", found "
						a_message := STRING_.appended_string (a_message, display_current_token)
						report_parse_error (a_message)
					else
						tokenizer.next
						if tokenizer.is_lexical_error then
							report_parse_error (tokenizer.last_lexical_error)
						else
							internal_last_parsed_node_test := make_local_name_test (a_node_type, a_token_value)
						end
					end					
				end

			when Star_token then
				if tokenizer.is_lexical_error then
					report_parse_error (tokenizer.last_lexical_error)
				else
					create {XM_XPATH_NODE_KIND_TEST} internal_last_parsed_node_test.make (a_node_type)
				end

			when Node_kind_token then
				parse_node_kind
				if not is_parse_error then
					types := internal_last_parsed_node_kind
						check
							three_integers: types.count = 3
						end
					inspect
						types.item (1)
					when Any_node then
						create {XM_XPATH_ANY_NODE_TEST} internal_last_parsed_node_test.make
					when Attribute_node, Element_node then
						if types.item (3) = Any_item then
							create {XM_XPATH_NODE_KIND_TEST} internal_last_parsed_node_test.make (types.item (1))
						else
							create {XM_XPATH_CONTENT_TYPE_TEST} internal_last_parsed_node_test.make (types.item (1), types.item (3))
						end
					when Document_node, Text_node, Comment_node then
						create {XM_XPATH_NODE_KIND_TEST} internal_last_parsed_node_test.make (types.item (1))
					when Processing_instruction_node then
						if types.item (2) = -1 then
							create {XM_XPATH_NODE_KIND_TEST} internal_last_parsed_node_test.make (Processing_instruction_node)
						else
							create {XM_XPATH_NAME_TEST} internal_last_parsed_node_test.make (Processing_instruction_node, types.item (2))
						end
					else
						report_parse_error ("Unknown node kind in node test")
					end
				else
				end
			end
		ensure
			node_test_not_void_unless_error: not is_parse_error implies internal_last_parsed_node_test /= Void
		end

	parse_constructor is
			-- Parse a node constructor.
			-- This is allowed only in XQuery, so the feature reports an error for XPath.
		do
			debug ("XPath Expression Parser")
				std.error.put_string ("Entered parse_constructor%N")
			end
			report_parse_error ("Node constructor expressions are allowed only in XQuery, not in XPath")
		end

	parse_node_kind is
			-- Parse a NodeKind.
		local
			a_primary_type, a_content_type, a_name_code: INTEGER
			a_type_name, a_message: STRING
		do
			debug ("XPath Expression Parser")
				std.error.put_string ("Entered parse_node_kind%N")
			end			
			a_type_name := tokenizer.last_token_value
			a_primary_type := system_type (a_type_name)
			a_name_code := -1
			a_content_type := Any_item

			tokenizer.next
			if tokenizer.is_lexical_error then
				report_parse_error (tokenizer.last_lexical_error)
			elseif tokenizer.last_token = Right_parenthesis_token then
				tokenizer.next
				if tokenizer.is_lexical_error then
					report_parse_error (tokenizer.last_lexical_error)
				end
			end
			if not is_parse_error then
				inspect
					a_primary_type
					
				when Any_item, Any_node, Text_node, Comment_node, Document_node then
					a_message := STRING_.appended_string ("Parentheses after %'", a_type_name)
					a_message := STRING_.appended_string (a_message, "%' must be empty")
					report_parse_error (a_message)
					
				when processing_instruction_node then
					if tokenizer.last_token = String_literal_token or else tokenizer.last_token = Name_token then
						if not is_ncname (tokenizer.last_token_value) then
							report_parse_error ("Processing instruction name must not contain a colon")
						else
							a_name_code := make_name_code (tokenizer.last_token_value, False)
						end
					end
					if not is_parse_error then
						tokenizer.next
						if tokenizer.is_lexical_error then
							report_parse_error (tokenizer.last_lexical_error)
						elseif tokenizer.last_token = Right_parenthesis_token then
							tokenizer.next
							if tokenizer.is_lexical_error then
								report_parse_error (tokenizer.last_lexical_error)
							end
						end
					end

				when Element_node, Attribute_node then
					if tokenizer.last_token = Star_token or else tokenizer.last_token = Multiply_token then
						do_nothing -- allows both tokenizations to be safe
					elseif tokenizer.last_token = Name_token then
						report_parse_error ("Named element and attribute declarations are not yet supported")
					else
						a_message := STRING_.appended_string ("Unexpected ", display_current_token)
						a_message := STRING_.appended_string (a_message, " after '%(' in SequenceType")
						report_parse_error (a_message)
					end
					
				end
			end

			if not is_parse_error then
				create internal_last_parsed_node_kind.make (1, 3)
				internal_last_parsed_node_kind.put (a_primary_type ,1)
				internal_last_parsed_node_kind.put (a_name_code ,2)
				internal_last_parsed_node_kind.put (a_content_type ,3)
			end
		ensure
			node_kind_not_void_unless_error: not is_parse_error implies internal_last_parsed_node_kind /= Void and then internal_last_parsed_node_kind.count = 3
		end

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

	internal_last_parsed_node_test: XM_XPATH_NODE_TEST
			-- Result of last sucessfull call to `parse_node_test'

	internal_last_parsed_node_kind: ARRAY [INTEGER]
			-- Result of last sucessfull call to `parse_node_kind'

	
	range_variable_stack: DS_ARRAYED_LIST [XM_XPATH_RANGE_VARIABLE_DECLARATION]
			-- Range variables

	language: STRING is "XPath"
			-- An XQuery parser will override this

	bits_20: INTEGER is 1048576 
			-- 0x0fffff

	report_parse_error (a_message: STRING) is
			-- Report a parsing error
		require
			a_message_not_void: a_message /= Void
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
			if a_message.count > 2 and then STRING_.same_string (a_message.substring (1,3), "...") then
				s := STRING_.appended_string (s, "near")
			else
				s := STRING_.appended_string (s, "in")
			end
			s := STRING_.appended_string (s, " «")
			s := STRING_.appended_string (s, tokenizer.recent_text)
			s := STRING_.appended_string (s, "»:%N    ")
			internal_last_parse_error := STRING_.appended_string (s, a_message)
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

	declare_range_variable (a_declaration: XM_XPATH_RANGE_VARIABLE_DECLARATION) is
			-- Declare `a_declaration' to be a range variable
		require
			variable_not_void: a_declaration /= Void
		do
			if range_variable_stack = Void then
				create range_variable_stack.make (5)
			end
			if not range_variable_stack.extendible (1) then
				range_variable_stack.resize (2 * range_variable_stack.count)
			end
			range_variable_stack.put_last (a_declaration)
		end

	find_range_variable (a_fingerprint: INTEGER): XM_XPATH_RANGE_VARIABLE_DECLARATION is
			-- Locate a range variable with a given name;
			-- (By "range variable", we mean a variable declared within the expression where it is used.)
		require
			positive_fingerprint: a_fingerprint >= 0
		local
			a_range_variable: XM_XPATH_RANGE_VARIABLE_DECLARATION
		do
			if range_variable_stack /= Void then
				from
					range_variable_stack.finish
				variant
					range_variable_stack.index
				until
					Result /= Void or else range_variable_stack.before
				loop
					a_range_variable := range_variable_stack.item_for_iteration
					if a_range_variable.fingerprint = a_fingerprint then
						Result := a_range_variable
					end
					range_variable_stack.forth
				end
			end
		ensure
			Void_if_not_found: True -- and therefore probably a context variable
		end

	is_at_start_of_relative_path: BOOLEAN is
			-- Is the current token one that can start a RelativePathExpression?
		require
			tokenizer_in_valid_state: tokenizer /= Void and then not tokenizer.is_lexical_error
		do
			inspect
				tokenizer.last_token
			when Axis_token then
				Result := True
			when At_token then
				Result := True
			when Name_token then
				Result := True
			when Prefix_token then
				Result := True
			when Suffix_token then
				Result := True
			when Star_token then
				Result := True
			when Node_kind_token then
				Result := True
			when Dot_token then
				Result := True
			when Dot_dot_token then
				Result := True
			when Function_token then
				Result := True
			when String_literal_token then
				Result := True
			when Number_token then
				Result := True
			when Left_parenthesis_token then
				Result := True								
			else
				Result := False
			end
		end

end
