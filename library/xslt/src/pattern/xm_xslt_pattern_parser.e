note

	description:

		"Objects that parse XSLT patterns and XPath sequence types"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_PATTERN_PARSER

inherit

	XM_XPATH_EXPRESSION_PARSER
		redefine
			check_valid_function
		end

	XM_XSLT_PATTERN_ROUTINES

create

	make_pattern

feature {NONE} -- Initialization

	make_pattern
			-- Initialize `Current' as an XSLT pattern parser.
		do
			is_pattern_parser := True
		ensure
			xslt_pattern_parser: is_pattern_parser
		end

feature -- Status report

	last_parsed_pattern: XM_XSLT_PATTERN
			-- Last successfully parsed pattern
		require
			no_parse_error: not is_parse_error
		do
			check attached internal_last_parsed_pattern as l_internal_last_parsed_pattern then
				Result := l_internal_last_parsed_pattern
			end
		ensure
			pattern_not_void: Result /= Void
		end

	last_parsed_sequence: XM_XPATH_SEQUENCE_TYPE
			-- Last expression sucessfully parsed by `parse_sequence_type'
		require
			no_parse_error: not is_parse_error
		do
			check attached internal_last_parsed_sequence as l_internal_last_parsed_sequence then
				Result := l_internal_last_parsed_sequence
			end
		ensure
			parsed_expression_not_void: Result /= Void
		end

feature -- Parsers

	parse_pattern (a_pattern_text: STRING; a_context: XM_XPATH_STATIC_CONTEXT; a_line_number: INTEGER)
			-- Parse `a_pattern_text', which represents an XSLT pattern
		require
			pattern_text_not_void: a_pattern_text /= Void
			static_context_not_void: a_context /= Void
			nearly_positive_line_number: a_line_number >= -1
		local
			s: STRING
			l_environment: like environment
			l_tokenizer: like tokenizer
		do
			debug ("XSLT pattern parsing")
				std.error.put_string ("Parsing pattern ")
				std.error.put_string (a_pattern_text)
				std.error.put_new_line
			end
			l_environment := a_context
			environment := l_environment
			function_library := l_environment.available_functions
			create l_tokenizer.make
			tokenizer := l_tokenizer
			l_tokenizer.tokenize (a_pattern_text, 1, -1, a_line_number)
			is_parse_error := False
			parse_union_pattern

			if l_tokenizer.is_lexical_error then
				report_parse_error (l_tokenizer.last_lexical_error, "XTSE0340")
			elseif l_tokenizer.last_token /= Eof_token then
				s := STRING_.appended_string ("Unexpected token ", display_current_token)
				s := STRING_.appended_string (s, " beyond end of pattern")
				report_parse_error (s, "XTSE0340")
			end
			debug ("XSLT pattern parsing")
				if not is_parse_error then
					check postcondition_of_parse_union_pattern: attached internal_last_parsed_pattern as l_internal_last_parsed_pattern then
						std.error.put_string ("Fingerprint of last parsed pattern is ")
						std.error.put_string (l_internal_last_parsed_pattern.fingerprint.out)
						std.error.put_new_line
					end
				end
			end
		ensure
			pattern_not_void_unless_error: not is_parse_error implies internal_last_parsed_pattern /= Void
			static_context_not_void: environment /= Void
		end

	parse_sequence_type (a_sequence_type_string: STRING; a_context: XM_XPATH_STATIC_CONTEXT; a_line_number: INTEGER)
			-- Parse `a_sequence_type_string';
			-- SequenceType ::= (ItemType OccurrenceIndicator?) | ("empty-sequence" "(" ")")
		require
			sequence_text_not_void: a_sequence_type_string /= Void
			static_context_not_void: a_context /= Void
			nearly_positive_line_number: a_line_number >= -1
		local
			s: STRING
			l_tokenizer: like tokenizer
		do
			internal_last_parse_error := Void
			environment := a_context
			create l_tokenizer.make
			tokenizer := l_tokenizer
			l_tokenizer.tokenize (a_sequence_type_string, 1, -1, a_line_number)
			is_parse_error := False
			parse_sequence

			if l_tokenizer.is_lexical_error then
				report_parse_error (l_tokenizer.last_lexical_error, "XTSE0340")
			elseif l_tokenizer.last_token /= Eof_token then
				s := STRING_.appended_string ("Unexpected token ", display_current_token)
				s := STRING_.appended_string (s, " beyond end of sequence type")
				report_parse_error (s, "XTSE0340")
			end
		ensure
			sequence_not_void_unless_error: not is_parse_error implies last_parsed_sequence /= Void
			static_context_not_void: environment /= Void
		end

feature {NONE} -- Implementation

	parse_union_pattern
			-- Parse a Union Pattern;
			--  pathPattern ( | pathPattern )*
		require
			static_context_not_void: environment /= Void
			tokenizer_usable: attached tokenizer as l_tokenizer and then l_tokenizer.input /= Void and then not l_tokenizer.is_lexical_error
			no_previous_parse_error: not is_parse_error
		local
			l_left_pattern, l_right_pattern: XM_XSLT_PATTERN
			l_finished: BOOLEAN
		do
			check precondition_tokenizer_not_void: attached tokenizer as l_tokenizer then
				parse_path_pattern
				if not is_parse_error then
					check postcondition_of_parse_path_pattern: attached internal_last_parsed_pattern as l_internal_last_parsed_pattern then
						from
							l_left_pattern := l_internal_last_parsed_pattern
							l_finished := l_tokenizer.last_token /= Union_token
						until
							l_finished or else l_tokenizer.last_token /= Union_token
						loop
							if STRING_.same_string ("union", l_tokenizer.last_token_value) then
								report_parse_error ("'union' is not permitted in patterns - use '|' instead", "XTSE0340")
								l_finished := True
							else
								l_tokenizer.next
								if l_tokenizer.is_lexical_error then
									report_parse_error (l_tokenizer.last_lexical_error, "XTSE0340")
									l_finished := True
								else
									parse_path_pattern
									if not is_parse_error then
										check postcondition_of_parse_path_pattern: attached internal_last_parsed_pattern as l_internal_last_parsed_pattern_2 then
											l_right_pattern := l_internal_last_parsed_pattern_2
											check attached environment as l_environment then
												create {XM_XSLT_UNION_PATTERN} l_left_pattern.make (l_environment, l_left_pattern, l_right_pattern)
											end
										end
									end
								end
							end
						end
						internal_last_parsed_pattern := l_left_pattern
					end
				end
			end
		ensure
			pattern_not_void_unless_error: not is_parse_error implies internal_last_parsed_pattern /= Void
		end

	parse_path_pattern
			-- Parse a Location Path Pattern:
			-- PathPattern ::= RelativePathPattern
			-- | '/' RelativePathPattern?
			-- | '//' RelativePathPattern
			-- | IdKeyPattern (('/' | '//') RelativePathPattern)?
		require
			static_context_not_void: environment /= Void
			tokenizer_usable: attached tokenizer as l_tokenizer and then l_tokenizer.input /= Void and then not l_tokenizer.is_lexical_error
			no_previous_parse_error: not is_parse_error
		local
			l_previous, l_pattern: detachable XM_XSLT_PATTERN
			l_location: XM_XSLT_LOCATION_PATH_PATTERN
			l_key: detachable XM_XSLT_KEY_PATTERN
			l_id: detachable XM_XSLT_ID_PATTERN
			l_id_value: detachable XM_XPATH_EXPRESSION
			l_connector: INTEGER
			l_root_only, l_finished: BOOLEAN
			l_message, l_key_name: STRING
		do
			check
				precondition_static_context_not_void: attached environment as l_environment
				precondition_tokenizer_usable: attached tokenizer as l_tokenizer
			then
				l_connector := -1
				-- special handling for stuff before first component

				inspect
					l_tokenizer.last_token
				when Slash_token then
					l_connector := Slash_token
					l_tokenizer.next
					if l_tokenizer.is_lexical_error then
						report_parse_error (l_tokenizer.last_lexical_error, "XTSE0340")
					else
						create {XM_XSLT_NODE_KIND_TEST} l_previous.make (l_environment, Document_node)
						l_root_only := True
					end
				when Slash_slash_token then -- leading // changes the default priority
					l_connector := Slash_slash_token
					l_tokenizer.next
					if l_tokenizer.is_lexical_error then
						report_parse_error (l_tokenizer.last_lexical_error, "XTSE0340")
					else
						create {XM_XSLT_NODE_KIND_TEST} l_previous.make (l_environment, Document_node)
						l_root_only := False
					end
				else
					-- do nothing
				end

				if not is_parse_error then
					from
					until
						l_finished
					loop
						l_pattern := Void; l_key := Void; l_id := Void
						inspect
							l_tokenizer.last_token
						when Axis_token then
							if STRING_.same_string (l_tokenizer.last_token_value, "child") then
								l_tokenizer.next
								if l_tokenizer.is_lexical_error then
									report_parse_error (l_tokenizer.last_lexical_error, "XTSE0340")
									l_finished := True
								else
									parse_pattern_step (Element_node)
									if is_parse_error then
										l_finished := True
									else
										l_pattern := last_parsed_pattern_step
									end
								end
							elseif STRING_.same_string (l_tokenizer.last_token_value, "attribute") then
								l_tokenizer.next
								if l_tokenizer.is_lexical_error then
									report_parse_error (l_tokenizer.last_lexical_error, "XTSE0340")
									l_finished := True
								else
									parse_pattern_step (Attribute_node)
									if is_parse_error then
										l_finished := True
									else
										l_pattern := last_parsed_pattern_step
									end
								end
							else
								report_parse_error ("Axis in pattern must be child or attribute", "XTSE0340")
								l_finished := True
							end
						when Star_token then
							parse_pattern_step (Element_node)
							if is_parse_error then
								l_finished := True
							else
								l_pattern := last_parsed_pattern_step
							end
						when Name_token then
							parse_pattern_step (Element_node)
							if is_parse_error then
								l_finished := True
							else
								l_pattern := last_parsed_pattern_step
							end
						when Prefix_token then
							parse_pattern_step (Element_node)
							if is_parse_error then
								l_finished := True
							else
								l_pattern := last_parsed_pattern_step
							end
						when Suffix_token then
							parse_pattern_step (Element_node)
							if is_parse_error then
								l_finished := True
							else
								l_pattern := last_parsed_pattern_step
							end
						when Node_kind_token then
							if STRING_.same_string (l_tokenizer.last_token_value, "attribute") then
								parse_pattern_step (Attribute_node)
							else
								parse_pattern_step (Element_node)
							end
							if is_parse_error then
								l_finished := True
							else
								l_pattern := last_parsed_pattern_step
							end
						when At_token then
							l_tokenizer.next
							if l_tokenizer.is_lexical_error then
								report_parse_error (l_tokenizer.last_lexical_error, "XTSE0340")
								l_finished := True
							else
								parse_pattern_step (Attribute_node)
								if is_parse_error then
									l_finished := True
								else
									l_pattern := last_parsed_pattern_step
								end
							end
						when Function_token then
							if l_previous = Void then
								if STRING_.same_string (l_tokenizer.last_token_value, "id") then
									l_tokenizer.next
									if l_tokenizer.is_lexical_error then
										report_parse_error (l_tokenizer.last_lexical_error, "XTSE0340")
										l_finished := True
									else
										l_id_value :=	Void
										if l_tokenizer.last_token = String_literal_token then
											create {XM_XPATH_STRING_VALUE} l_id_value.make (l_tokenizer.last_token_value)
										elseif l_tokenizer.last_token = Dollar_token then
											l_tokenizer.next
											if l_tokenizer.is_lexical_error then
												report_parse_error (l_tokenizer.last_lexical_error, "XTSE0340")
												l_finished := True
											else
												if l_tokenizer.last_token /= Name_token then
													l_message := "expected %"<name>%", found "
													l_message := STRING_.appended_string (l_message, display_current_token)
													report_parse_error (l_message, "XTSE0340")
													l_finished := True
												else
													generate_name_code (l_tokenizer.last_token_value, False)
													l_environment.bind_variable (last_generated_name_code  \\ bits_20)
													create {XM_XPATH_VARIABLE_REFERENCE} l_id_value.make (l_environment.last_bound_variable)
												end
											end
										else
											report_parse_error ("id value must be either a literal or a variable reference", "XTSE0340")
											l_finished := True
										end
										check l_id_value /= Void then
											create {XM_XSLT_ID_PATTERN} l_id.make (l_environment, l_id_value)
											l_pattern := l_id
											l_tokenizer.next
											if l_tokenizer.is_lexical_error then
												report_parse_error (l_tokenizer.last_lexical_error, "XTSE0340")
												l_finished := True
											else
												if l_tokenizer.last_token /= Right_parenthesis_token then
													l_message := "expected %")%", found "
													l_message := STRING_.appended_string (l_message, display_current_token)
													report_parse_error (l_message, "XTSE0340")
													l_finished := True
												else
													l_tokenizer.next
													if l_tokenizer.is_lexical_error then
														report_parse_error (l_tokenizer.last_lexical_error, "XTSE0340")
														l_finished := True
													end
												end
											end
										end
									end
								elseif STRING_.same_string (l_tokenizer.last_token_value, "key") then
									l_tokenizer.next
									if l_tokenizer.is_lexical_error then
										report_parse_error (l_tokenizer.last_lexical_error, "XTSE0340")
										l_finished := True
									else
										if l_tokenizer.last_token /= String_literal_token then
											l_message := "expected %"<string literal>%", found "
											l_message := STRING_.appended_string (l_message, display_current_token)
											report_parse_error (l_message, "XTSE0340")
											l_finished := True
										else
											l_key_name := l_tokenizer.last_token_value
											l_tokenizer.next
											if l_tokenizer.is_lexical_error then
												report_parse_error (l_tokenizer.last_lexical_error, "XTSE0340")
												l_finished := True
											else
												if l_tokenizer.last_token /= Comma_token then
													l_message := "expected %",%", found "
													l_message := STRING_.appended_string (l_message, display_current_token)
													report_parse_error (l_message, "XTSE0340")
													l_finished := True
												else
													l_tokenizer.next
													if l_tokenizer.is_lexical_error then
														report_parse_error (l_tokenizer.last_lexical_error, "XTSE0340")
														l_finished := True
													else
														l_id_value := Void
														if l_tokenizer.last_token = String_literal_token then
															create {XM_XPATH_STRING_VALUE} l_id_value.make (l_tokenizer.last_token_value)
														elseif l_tokenizer.last_token = Dollar_token then
															l_tokenizer.next
															if l_tokenizer.is_lexical_error then
																report_parse_error (l_tokenizer.last_lexical_error, "XTSE0340")
																l_finished := True
															else
																if l_tokenizer.last_token /= Name_token then
																	l_message := "expected %"<name>%", found "
																	l_message := STRING_.appended_string (l_message, display_current_token)
																	report_parse_error (l_message, "XTSE0340")
																	l_finished := True
																else
																	generate_name_code (l_tokenizer.last_token_value, False)
																	l_environment.bind_variable (last_generated_name_code \\ bits_20)
																	create {XM_XPATH_VARIABLE_REFERENCE} l_id_value.make (l_environment.last_bound_variable)
																end
															end
														else
															report_parse_error ("id value must be either a literal or a variable reference", "XTSE0340")
															l_finished := True
														end
														if not is_parse_error then
															check l_id_value /= Void then
																generate_name_code (l_key_name, False)
																create l_key.make (l_environment, last_generated_name_code, l_id_value)
																l_pattern := l_key
																l_tokenizer.next
																if l_tokenizer.is_lexical_error then
																	report_parse_error (l_tokenizer.last_lexical_error, "XTSE0340")
																	l_finished := True
																else
																	if l_tokenizer.last_token /= Right_parenthesis_token then
																		l_message := "expected %")%", found "
																		l_message := STRING_.appended_string (l_message, display_current_token)
																		report_parse_error (l_message, "XTSE0340")
																		l_finished := True
																	else
																		l_tokenizer.next
																		if l_tokenizer.is_lexical_error then
																			report_parse_error (l_tokenizer.last_lexical_error, "XTSE0340")
																			l_finished := True
																		end
																	end
																end
															end
														end
													end
												end
											end
										end
									end
								else
									report_parse_error ("The only functions allowed in a pattern are id() and key()", "XTSE0340")
									l_finished := True
								end
							else
								report_parse_error ("Function call may appear only at the start of a pattern", "XTSE0340")
								l_finished := True
							end
						else
							l_finished := True
							if l_root_only then
								internal_last_parsed_pattern := l_previous -- the pattern was plain "/"
							else
								report_parse_error (STRING_.appended_string ("Unexpected token in pattern, found ", display_current_token), "XTSE0340")
							end
						end
						if not l_finished then
							if l_previous /= Void then
								check
									l_pattern_not_void: l_pattern /= Void
									location_pattern: l_pattern.is_location_pattern
								then
									l_location := l_pattern.as_location_pattern
									check
										l_location_not_void: l_location /= Void
									then
										if l_connector = Slash_token then

											l_location.set_parent_pattern (l_previous)
										else
												check
													ancestor_connector: l_connector = Slash_slash_token
												end
											l_location.set_ancestor_pattern (l_previous)
										end
									end
								end
							end
							l_connector := l_tokenizer.last_token
							l_root_only := False
							if l_connector = Slash_token or else l_connector = Slash_slash_token then
								l_previous := l_pattern
								l_tokenizer.next
								if l_tokenizer.is_lexical_error then
									report_parse_error (l_tokenizer.last_lexical_error, "XTSE0340")
									l_finished := True
								end
							else
								l_finished := True
								if l_pattern /= Void then
									internal_last_parsed_pattern := l_pattern
								elseif l_key /= Void then -- pattern consists solely of key(...)
									internal_last_parsed_pattern := l_key
								else
										check
											l_id_not_void: l_id /= Void -- pattern consists solely of id(...)
										end
									internal_last_parsed_pattern := l_id
								end
							end
						end
					end
				end
			end
		ensure
			pattern_not_void_unless_error: not is_parse_error implies internal_last_parsed_pattern /= Void
		end


	parse_pattern_step (a_principal_node_type: INTEGER)
			-- Parse a pattern step (after any axis name or @)
		local
			l_step: XM_XSLT_LOCATION_PATH_PATTERN
			l_node_test: XM_XSLT_NODE_TEST
			l_node_kind: INTEGER
		do
			check attached environment as l_environment then
				create l_step.make (l_environment)
				parse_node_test (a_principal_node_type)
				if not is_parse_error then
					check postcondition_of_parse_node_test: attached internal_last_parsed_node_test as l_internal_last_parsed_node_test then
						l_node_test := xpath_to_xslt_node_test (l_internal_last_parsed_node_test, l_environment)
						if l_node_test = any_xslt_node_test then

							-- handle node() and @node() specially

							if a_principal_node_type = Element_node then

								-- We are on the Child::axis

								create {XM_XSLT_ANY_CHILD_NODE_PATTERN} l_node_test.make (l_environment)
							else

								-- We are on the Attribute::axis

								create {XM_XSLT_NODE_KIND_TEST} l_node_test.make (l_environment, a_principal_node_type)
							end
						end

						-- Deal with nonsense patterns such as @comment() or child::attribute().
						-- These are legal, but will never match anything.

						l_node_kind := l_node_test.node_kind
						if a_principal_node_type = Element_node and then
							(l_node_kind = Attribute_node) then
							l_node_test := xslt_empty_item
						elseif a_principal_node_type = Attribute_node and then
							(l_node_kind = Comment_node or else l_node_kind = Text_node
								or else l_node_kind = Processing_instruction_node
								or else l_node_kind = Element_node
								or else l_node_kind = Document_node) then
							l_node_test := xslt_empty_item
						end
						l_step.set_node_test (l_node_test)
						parse_filters (l_step)
						last_parsed_pattern_step := l_step
					end
				end
			end
		ensure
			pattern_not_void_unless_error: not is_parse_error implies last_parsed_pattern_step /= Void
		end

	parse_filters (a_step: XM_XSLT_LOCATION_PATH_PATTERN)
			-- Test to see if there are filters for a Pattern, if so, parse them.
		require
			pattern_not_void: a_step /= Void
		local
			a_qualifier: XM_XPATH_EXPRESSION
			a_message: STRING
		do
			check attached tokenizer as l_tokenizer then
				from
				until
					l_tokenizer.last_token /= Left_square_bracket_token
				loop
					next_token ("In parse_filters: current token is ")
					if l_tokenizer.is_lexical_error then
						report_parse_error (l_tokenizer.last_lexical_error, "XTSE0340")
					else
						parse_single_expression
						if not is_parse_error then
							check postcondition_of_parse_single_expression: attached internal_last_parsed_expression as l_internal_last_parsed_expression then
								a_qualifier := l_internal_last_parsed_expression
								if l_tokenizer.last_token /= Right_square_bracket_token then
									a_message := "expected %"]%", found "
									a_message := STRING_.appended_string (a_message, display_current_token)
									report_parse_error (a_message, "XTSE0340")
								else
									next_token ("In parse_filters after RPAR: current token is ")
									if l_tokenizer.is_lexical_error then
										report_parse_error (l_tokenizer.last_lexical_error, "XTSE0340")
									else
										a_step.add_filter (a_qualifier)
									end
								end
							end
						end
					end
				end
			end
		end

	check_valid_function (a_function: XM_XPATH_EXPRESSION)
			-- Check `a_function' is a valid function call.
		do
			if a_function.is_current_group then
				report_parse_error ("Function fn:current-group() is not permitted in an XSLT pattern", "XTSE1060")
			elseif a_function.is_current_grouping_key then
				report_parse_error ("Function fn:current-grouping-key() is not permitted in an XSLT pattern", "XTSE1070")
			end
		end

	internal_last_parsed_pattern: detachable XM_XSLT_PATTERN
			-- Last sucessfully parsed pattern

	last_parsed_pattern_step: detachable XM_XSLT_LOCATION_PATH_PATTERN
			-- last successfull parsed pattern step

end
