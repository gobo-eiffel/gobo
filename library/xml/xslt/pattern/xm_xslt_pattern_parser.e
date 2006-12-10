indexing

	description:

		"Objects that parse XSLT patterns and XPath sequence types"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_PATTERN_PARSER

inherit

	XM_XPATH_EXPRESSION_PARSER
		redefine
			check_valid_function
		end

	XM_XSLT_SHARED_ANY_NODE_TEST
		export {NONE} all end

	XM_XSLT_SHARED_NO_NODE_TEST
		export {NONE} all end

	XM_XPATH_SHARED_NO_NODE_TEST
		export {NONE} all end

	XM_XPATH_DEBUGGING_ROUTINES
		export {NONE} all end

	-- TODO: Add XSLT Pattern as host language
create

	make

feature -- Status report

	last_parsed_pattern: XM_XSLT_PATTERN is
			-- Last successfully parsed pattern
		require
			no_parse_error: not is_parse_error
		do
			Result := internal_last_parsed_pattern
		ensure
			pattern_not_void: Result /= Void
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

	parse_pattern (a_pattern_text: STRING; a_context: XM_XPATH_STATIC_CONTEXT; a_line_number: INTEGER) is
			-- Parse `a_pattern_text', which represents an XSLT pattern
		require
			pattern_text_not_void: a_pattern_text /= Void
			static_context_not_void: a_context /= Void
			nearly_positive_line_number: a_line_number >= -1
		local
			s: STRING
		do
			debug ("XSLT pattern parsing")
				std.error.put_string ("Parsing pattern ")
				std.error.put_string (a_pattern_text)
				std.error.put_new_line
			end
			environment := a_context
			function_library := environment.available_functions
			create tokenizer.make
			tokenizer.tokenize (a_pattern_text, 1, -1, a_line_number)
			is_parse_error := False
			parse_union_pattern

			if	tokenizer.is_lexical_error then
				report_parse_error (tokenizer.last_lexical_error, "XTSE0340")
			elseif tokenizer.last_token /= Eof_token then
				s := STRING_.appended_string ("Unexpected token ", display_current_token)
				s := STRING_.appended_string (s, " beyond end of pattern")
				report_parse_error (s, "XTSE0340")
			end
			debug ("XSLT pattern parsing")
				if not is_parse_error then
					std.error.put_string ("Fingerprint of last parsed pattern is ")
					std.error.put_string (internal_last_parsed_pattern.fingerprint.out)
					std.error.put_new_line
				end
			end
		ensure
			pattern_not_void_unless_error: not is_parse_error implies internal_last_parsed_pattern /= Void
			static_context_not_void: environment /= Void
		end

	parse_sequence_type (a_sequence_type_string: STRING; a_context: XM_XPATH_STATIC_CONTEXT; a_line_number: INTEGER) is
			-- Parse `a_sequence_type_string';
			-- SequenceType ::= (ItemType OccurrenceIndicator?) | ("empty-sequence" "(" ")")
		require
			sequence_text_not_void: a_sequence_type_string /= Void
			static_context_not_void: a_context /= Void
			nearly_positive_line_number: a_line_number >= -1
		local
			s: STRING
		do
			internal_last_parse_error := Void
			environment := a_context
			create tokenizer.make
			tokenizer.tokenize (a_sequence_type_string, 1, -1, a_line_number)
			is_parse_error := False
			parse_sequence

			if	tokenizer.is_lexical_error then
				report_parse_error (tokenizer.last_lexical_error, "XTSE0340")
			elseif tokenizer.last_token /= Eof_token then
				s := STRING_.appended_string ("Unexpected token ", display_current_token)
				s := STRING_.appended_string (s, " beyond end of sequence type")
				report_parse_error (s, "XTSE0340")
			end
		ensure
			sequence_not_void_unless_error: not is_parse_error implies last_parsed_sequence /= Void
			static_context_not_void: environment /= Void
		end

feature {NONE} -- Implementation

	parse_union_pattern is
			-- Parse a Union Pattern;
			--  pathPattern ( | pathPattern )*
		require
			static_context_not_void: environment /= Void
			tokenizer_usable: tokenizer /= Void and then tokenizer.input /= Void and not tokenizer.is_lexical_error
			no_previous_parse_error: not is_parse_error
		local
			a_left_pattern, a_right_pattern: XM_XSLT_PATTERN
			finished: BOOLEAN
		do
			parse_path_pattern
			if not is_parse_error then
				from
					a_left_pattern := internal_last_parsed_pattern
					finished := tokenizer.last_token /= Union_token
				until
					finished or else tokenizer.last_token /= Union_token
				loop
					tokenizer.next
					if tokenizer.is_lexical_error then
						report_parse_error (tokenizer.last_lexical_error, "XTSE0340")
						finished := True
					else
						parse_path_pattern
						if not is_parse_error then
							a_right_pattern := internal_last_parsed_pattern
							create {XM_XSLT_UNION_PATTERN} a_left_pattern.make (environment, a_left_pattern, a_right_pattern)
						end
					end
				end
				internal_last_parsed_pattern := a_left_pattern
			end
		ensure
			pattern_not_void_unless_error: not is_parse_error implies internal_last_parsed_pattern /= Void
		end

	parse_path_pattern is
			-- Parse a Location Path Pattern:
			-- PathPattern ::= RelativePathPattern
			-- | '/' RelativePathPattern?
			-- | '//' RelativePathPattern
			-- | IdKeyPattern (('/' | '//') RelativePathPattern)?
		require
			static_context_not_void: environment /= Void
			tokenizer_usable: tokenizer /= Void and then tokenizer.input /= Void and not tokenizer.is_lexical_error
			no_previous_parse_error: not is_parse_error
		local
			previous_pattern: XM_XSLT_PATTERN
			a_pattern, location_pattern: XM_XSLT_LOCATION_PATH_PATTERN
			key_pattern: XM_XSLT_KEY_PATTERN
			id_pattern: XM_XSLT_ID_PATTERN
			id_value: XM_XPATH_EXPRESSION
			connector: INTEGER
			root_only, finished: BOOLEAN
			message, key_name: STRING
		do
			connector := -1
			-- special handling for stuff before first component

			inspect
				tokenizer.last_token
			when Slash_token then
				connector := Slash_token
				tokenizer.next
				if tokenizer.is_lexical_error then
					report_parse_error (tokenizer.last_lexical_error, "XTSE0340")
				else
					create {XM_XSLT_NODE_KIND_TEST} previous_pattern.make (environment, Document_node)
					root_only := True
				end
			when Slash_slash_token then -- leading // changes the default priority
				connector := Slash_slash_token
				tokenizer.next
				if tokenizer.is_lexical_error then
					report_parse_error (tokenizer.last_lexical_error, "XTSE0340")
				else
					create {XM_XSLT_NODE_KIND_TEST} previous_pattern.make (environment, Document_node)
					root_only := False
				end
			else
				-- do nothing
			end

			if not is_parse_error then
				from
				until
					finished
				loop
					a_pattern := Void; key_pattern := Void; id_pattern := Void
					inspect
						tokenizer.last_token
					when Axis_token then
						if STRING_.same_string (tokenizer.last_token_value, "child") then
							tokenizer.next
							if tokenizer.is_lexical_error then
								report_parse_error (tokenizer.last_lexical_error, "XTSE0340")
								finished := True
							else
								parse_pattern_step (Element_node)
								if is_parse_error then
									finished := True
								else
									a_pattern := last_parsed_pattern_step
								end
							end
						elseif STRING_.same_string (tokenizer.last_token_value, "attribute") then
							tokenizer.next
							if tokenizer.is_lexical_error then
								report_parse_error (tokenizer.last_lexical_error, "XTSE0340")
								finished := True
							else
								parse_pattern_step (Attribute_node)
								if is_parse_error then
									finished := True
								else
									a_pattern := last_parsed_pattern_step
								end
							end
						else
							report_parse_error ("Axis in pattern must be child or attribute", "XTSE0340")
							finished := True
						end
					when Star_token then
						parse_pattern_step (Element_node)
						if is_parse_error then
							finished := True
						else
							a_pattern := last_parsed_pattern_step
						end
					when Name_token then
						parse_pattern_step (Element_node)
						if is_parse_error then
							finished := True
						else
							a_pattern := last_parsed_pattern_step
						end
					when Prefix_token then
						parse_pattern_step (Element_node)
						if is_parse_error then
							finished := True
						else
							a_pattern := last_parsed_pattern_step
						end
					when Suffix_token then
						parse_pattern_step (Element_node)
						if is_parse_error then
							finished := True
						else
							a_pattern := last_parsed_pattern_step
						end
					when Node_kind_token then
						if STRING_.same_string (tokenizer.last_token_value, "attribute") then
							parse_pattern_step (Attribute_node)
						else
							parse_pattern_step (Element_node)
						end
						if is_parse_error then
							finished := True
						else
							a_pattern := last_parsed_pattern_step
						end
					when At_token then
						tokenizer.next
						if tokenizer.is_lexical_error then
							report_parse_error (tokenizer.last_lexical_error, "XTSE0340")
							finished := True
						else						
							parse_pattern_step (Attribute_node)
							if is_parse_error then
								finished := True
							else
								a_pattern := last_parsed_pattern_step
							end
						end
					when Function_token then
						if previous_pattern = Void then
							if STRING_.same_string (tokenizer.last_token_value, "id") then
								tokenizer.next
								if tokenizer.is_lexical_error then
									report_parse_error (tokenizer.last_lexical_error, "XTSE0340")
									finished := True
								else
									id_value :=	Void
									if tokenizer.last_token = String_literal_token then
										create {XM_XPATH_STRING_VALUE} id_value.make (tokenizer.last_token_value)
									elseif tokenizer.last_token = Dollar_token then
										tokenizer.next
										if tokenizer.is_lexical_error then
											report_parse_error (tokenizer.last_lexical_error, "XTSE0340")
											finished := True
										else
											if tokenizer.last_token /= Name_token then
												message := "expected %"<name>%", found "
												message := STRING_.appended_string (message, display_current_token)
												report_parse_error (message, "XTSE0340")
												finished := True
											else
												generate_name_code (tokenizer.last_token_value, False)
												environment.bind_variable (last_generated_name_code  \\ bits_20)
												create {XM_XPATH_VARIABLE_REFERENCE} id_value.make (environment.last_bound_variable)
											end
										end
									else
										report_parse_error ("id value must be either a literal or a variable reference", "XTSE0340")
										finished := True
									end
									create {XM_XSLT_ID_PATTERN} id_pattern.make (environment, id_value)
									tokenizer.next
									if tokenizer.is_lexical_error then
										report_parse_error (tokenizer.last_lexical_error, "XTSE0340")
										finished := True
									else
										if tokenizer.last_token /= Right_parenthesis_token then
											message := "expected %")%", found "
											message := STRING_.appended_string (message, display_current_token)
											report_parse_error (message, "XTSE0340")
											finished := True
										else
											tokenizer.next
											if tokenizer.is_lexical_error then
												report_parse_error (tokenizer.last_lexical_error, "XTSE0340")
												finished := True
											end
										end
									end
								end
							elseif STRING_.same_string (tokenizer.last_token_value, "key") then
								tokenizer.next
								if tokenizer.is_lexical_error then
									report_parse_error (tokenizer.last_lexical_error, "XTSE0340")
									finished := True
								else
									if tokenizer.last_token /= String_literal_token then
										message := "expected %"<string literal>%", found "
										message := STRING_.appended_string (message, display_current_token)
										report_parse_error (message, "XTSE0340")
										finished := True
									else
										key_name := tokenizer.last_token_value
										tokenizer.next
										if tokenizer.is_lexical_error then
											report_parse_error (tokenizer.last_lexical_error, "XTSE0340")
											finished := True
										else
											if tokenizer.last_token /= Comma_token then
												message := "expected %",%", found "
												message := STRING_.appended_string (message, display_current_token)
												report_parse_error (message, "XTSE0340")
												finished := True
											else
												tokenizer.next
												if tokenizer.is_lexical_error then
													report_parse_error (tokenizer.last_lexical_error, "XTSE0340")
													finished := True
												else
													id_value := Void
													if tokenizer.last_token = String_literal_token then
														create {XM_XPATH_STRING_VALUE} id_value.make (tokenizer.last_token_value)
													elseif tokenizer.last_token = Dollar_token then
														tokenizer.next
														if tokenizer.is_lexical_error then
															report_parse_error (tokenizer.last_lexical_error, "XTSE0340")
															finished := True
														else
															if tokenizer.last_token /= Name_token then
																message := "expected %"<name>%", found "
																message := STRING_.appended_string (message, display_current_token)
																report_parse_error (message, "XTSE0340")
																finished := True
															else
																generate_name_code (tokenizer.last_token_value, False)
																environment.bind_variable (last_generated_name_code \\ bits_20)
																create {XM_XPATH_VARIABLE_REFERENCE} id_value.make (environment.last_bound_variable)
															end
														end
													else
														report_parse_error ("id value must be either a literal or a variable reference", "XTSE0340")
														finished := True
													end
													generate_name_code (key_name, False)
													create {XM_XSLT_KEY_PATTERN} key_pattern.make (environment, last_generated_name_code, id_value)
													tokenizer.next
													if tokenizer.is_lexical_error then
														report_parse_error (tokenizer.last_lexical_error, "XTSE0340")
														finished := True
													else
														if tokenizer.last_token /= Right_parenthesis_token then
															message := "expected %")%", found "
															message := STRING_.appended_string (message, display_current_token)
															report_parse_error (message, "XTSE0340")
															finished := True
														else
															tokenizer.next
															if tokenizer.is_lexical_error then
																report_parse_error (tokenizer.last_lexical_error, "XTSE0340")
																finished := True
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
								finished := True
							end
						else
							report_parse_error ("Function call may appear only at the start of a pattern", "XTSE0340")
							finished := True
						end
					else
						finished := True
						if root_only then
							internal_last_parsed_pattern := previous_pattern -- the patter was plain "/"
						else
							report_parse_error (STRING_.appended_string ("Unexpected token in pattern, found ", display_current_token), "XTSE0340")
						end
					end
					if not finished then
						if previous_pattern /= Void then
								check
									a_pattern_not_void: a_pattern /= Void
								end
							location_pattern := a_pattern
									check
										location_pattern_not_void: location_pattern /= Void
									end
							if connector = Slash_token then

								location_pattern.set_parent_pattern (previous_pattern)
							else
									check
										ancestor_connector: connector = Slash_slash_token
									end
								location_pattern.set_ancestor_pattern (previous_pattern)
							end
						end
						connector := tokenizer.last_token
						root_only := false
						if connector = Slash_token or else connector = Slash_slash_token then
							previous_pattern := a_pattern
							tokenizer.next
							if tokenizer.is_lexical_error then
								report_parse_error (tokenizer.last_lexical_error, "XTSE0340")
								finished := True
							end
						else
							finished := True
							if a_pattern /= Void then
								internal_last_parsed_pattern := a_pattern
							elseif key_pattern /= Void then -- pattern consists solely of key(...)
								internal_last_parsed_pattern := key_pattern
							else
									check
										id_pattern_not_void: id_pattern /= Void -- pattern consists solely of id(...)
									end
								internal_last_parsed_pattern := id_pattern
							end
						end
					end
				end
			end
		ensure
			pattern_not_void_unless_error: not is_parse_error implies internal_last_parsed_pattern /= Void
		end


	parse_pattern_step (a_principal_node_type: INTEGER) is
			-- Parse a pattern step (after any axis name or @)
		local
			l_step: XM_XSLT_LOCATION_PATH_PATTERN
			l_node_test: XM_XSLT_NODE_TEST
			l_node_kind: INTEGER
		do
			create l_step.make (environment)
			parse_node_test (a_principal_node_type)
			if not is_parse_error then
				l_node_test := xpath_to_xslt_node_test (internal_last_parsed_node_test)
				if l_node_test = any_xslt_node_test then
					
					-- handle node() and @node() specially
					
					if a_principal_node_type = Element_node then
						
						-- We are on the Child::axis
						
						create {XM_XSLT_ANY_CHILD_NODE_PATTERN} l_node_test.make (environment)
					else
						
						-- We are on the Attribute::axis
						
						create {XM_XSLT_NODE_KIND_TEST} l_node_test.make (environment, a_principal_node_type)
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
		ensure
			pattern_not_void_unless_error: not is_parse_error implies last_parsed_pattern_step /= Void
		end

	parse_filters (a_step: XM_XSLT_LOCATION_PATH_PATTERN) is
			-- Test to see if there are filters for a Pattern, if so, parse them.
		require
			pattern_not_void: a_step /= Void
		local
			a_qualifier: XM_XPATH_EXPRESSION
			a_message: STRING
		do
			from
			until
				tokenizer.last_token /= Left_square_bracket_token
			loop
				next_token ("In parse_filters: current token is ")
				if tokenizer.is_lexical_error then
					report_parse_error (tokenizer.last_lexical_error, "XTSE0340")
				else
					parse_single_expression
					if not is_parse_error then
						a_qualifier := internal_last_parsed_expression
						if tokenizer.last_token /= Right_square_bracket_token then
							a_message := "expected %"]%", found "
							a_message := STRING_.appended_string (a_message, display_current_token)
							report_parse_error (a_message, "XTSE0340")
						else
							next_token ("In parse_filters after RPAR: current token is ")
							if tokenizer.is_lexical_error then
								report_parse_error (tokenizer.last_lexical_error, "XTSE0340")
							else
								a_step.add_filter (a_qualifier)
							end
						end
					end
				end
			end
		end

	xpath_to_xslt_node_test (an_xpath_node_test: XM_XPATH_NODE_TEST): XM_XSLT_NODE_TEST is
			-- XSLT node-test-pattern from an XPath node-test
		require
			node_test_not_void: an_xpath_node_test /= Void
		do
			if an_xpath_node_test = any_node_test then
				Result := any_xslt_node_test
			elseif an_xpath_node_test = empty_item then
				Result := xslt_empty_item
			elseif an_xpath_node_test.is_combined_node_test then
					todo ("xpath_to_xslt_node_test - combined node test", True)
			elseif an_xpath_node_test.is_content_test then
				todo ("xpath_to_xslt_node_test - content type test", True)
			elseif an_xpath_node_test.is_local_name_test then
				todo ("xpath_to_xslt_node_test - local name test", True)
			elseif an_xpath_node_test.is_namespace_test then
				create  {XM_XSLT_NAMESPACE_TEST} Result.make (environment, an_xpath_node_test.as_namespace_test.node_kind, shared_name_pool.uri_from_uri_code(an_xpath_node_test.as_namespace_test.uri_code), an_xpath_node_test.as_namespace_test.original_text)
			elseif an_xpath_node_test.is_name_test then
				create {XM_XSLT_NAME_TEST} Result.make (environment, an_xpath_node_test.as_name_test.node_kind, an_xpath_node_test.as_name_test.fingerprint, an_xpath_node_test.as_name_test.original_text)
			elseif an_xpath_node_test.is_node_kind_test then
				create {XM_XSLT_NODE_KIND_TEST} Result.make (environment, an_xpath_node_test.as_node_kind_test.node_kind)
			else
				todo ("xpath_to_xslt_node_test - unknown test", True)
			end
		ensure
			xslt_node_test_not_void: Result /= Void
		end

	check_valid_function (a_function: XM_XPATH_EXPRESSION) is
			-- Check `a_function' is a valid function call.
		do
			if a_function.is_current_group then
				report_parse_error ("Function fn:current-group() is not permitted in an XSLT pattern", "XTSE1060")
			elseif a_function.is_current_grouping_key then
				report_parse_error ("Function fn:current-grouping-key() is not permitted in an XSLT pattern", "XTSE1070")
			end
		end

	internal_last_parsed_pattern: XM_XSLT_PATTERN
			-- Last sucessfully parsed pattern

	last_parsed_pattern_step: XM_XSLT_LOCATION_PATH_PATTERN
			-- last successfull parsed pattern step

end
