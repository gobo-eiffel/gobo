indexing

	description:

		"Objects that parse XSLT patterns"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_PATTERN_PARSER

inherit

	XM_XPATH_EXPRESSION_PARSER

		-- The command `parse_pattern' sets `is_parse_error'
		-- to indicate success or failure.
		-- Upon success, it's result is available in `last_parsed_pattern'.

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

feature -- Parsers

	parse_pattern (a_pattern_text: STRING; a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Parse `a_pattern_text', which represents an XSLT pattern
		require
			pattern_text_not_void: a_pattern_text /= Void
			static_context_not_void: a_context /= Void
		local
			s: STRING
		do
			environment := a_context
			create tokenizer.make
			tokenizer.tokenize (a_pattern_text)
			is_parse_error := False
			parse_union_pattern

			if	tokenizer.is_lexical_error then
				report_parse_error (tokenizer.last_lexical_error, 3)
			elseif tokenizer.last_token /= Eof_token then
				s := STRING_.appended_string ("Unexpected token ", display_current_token)
				s := STRING_.appended_string (s, " beyond end of pattern")
				report_parse_error (s, 3)
			end
		ensure
			pattern_not_void_unless_error: not is_parse_error implies internal_last_parsed_pattern /= Void
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
			pat: XM_XSLT_PATTERN
			finished: BOOLEAN
		do
			parse_path_pattern
			if not is_parse_error then
				from
					pat := internal_last_parsed_pattern
					finished := tokenizer.last_token /= Union_token
				until
					finished or tokenizer.last_token /= Union_token
				loop
					tokenizer.next
					if tokenizer.is_lexical_error then
						report_parse_error (tokenizer.last_lexical_error, 3)
						finished := True
					else
						parse_path_pattern
						if not is_parse_error then
							create {XM_XSLT_UNION_PATTERN} internal_last_parsed_pattern.make (pat, internal_last_parsed_pattern)
						end
					end
				end
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
			connector, var_name_code: INTEGER
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
					report_parse_error (tokenizer.last_lexical_error, 3)
				else
					create {XM_XSLT_NODE_KIND_TEST} previous_pattern.make (Document_node)
					root_only := True
				end
			when Slash_slash_token then -- leading // changes the default priority
				connector := Slash_slash_token
				tokenizer.next
				if tokenizer.is_lexical_error then
					report_parse_error (tokenizer.last_lexical_error, 3)
				else
					create {XM_XSLT_NODE_KIND_TEST} previous_pattern.make (Document_node)
					root_only := False
				end
			else
				do_nothing
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
								report_parse_error (tokenizer.last_lexical_error, 3)
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
								report_parse_error (tokenizer.last_lexical_error, 3)
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
							report_parse_error ("Axis in pattern must be child or attribute", 3)
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
						parse_pattern_step (Element_node)
						if is_parse_error then
							finished := True
						else
							a_pattern := last_parsed_pattern_step
						end
					when At_token then
						tokenizer.next
						if tokenizer.is_lexical_error then
							report_parse_error (tokenizer.last_lexical_error, 3)
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
									report_parse_error (tokenizer.last_lexical_error, 3)
									finished := True
								else
									id_value :=	Void
									if tokenizer.last_token = String_literal_token then
										create {XM_XPATH_STRING_VALUE} id_value.make (tokenizer.last_token_value)
									elseif tokenizer.last_token = Dollar_token then
										tokenizer.next
										if tokenizer.is_lexical_error then
											report_parse_error (tokenizer.last_lexical_error, 3)
											finished := True
										else
											if tokenizer.last_token /= Name_token then
												message := "expected %"<name>%", found "
												message := STRING_.appended_string (message, display_current_token)
												report_parse_error (message, 3)
												finished := True
											else
												var_name_code := make_name_code (tokenizer.last_token_value, False) \\ bits_20
												environment.bind_variable (var_name_code)
												create {XM_XPATH_VARIABLE_REFERENCE} id_value.make (environment.last_bound_variable)
											end
										end
									else
										report_parse_error ("id value must be either a literal or a variable reference", 3)
										finished := True
									end
									create {XM_XSLT_ID_PATTERN} id_pattern.make (id_value)
									tokenizer.next
									if tokenizer.is_lexical_error then
										report_parse_error (tokenizer.last_lexical_error, 3)
										finished := True
									else
										if tokenizer.last_token /= Right_parenthesis_token then
											message := "expected %"%)%", found "
											message := STRING_.appended_string (message, display_current_token)
											report_parse_error (message, 3)
											finished := True
										else
											tokenizer.next
											if tokenizer.is_lexical_error then
												report_parse_error (tokenizer.last_lexical_error, 3)
												finished := True
											end
										end
									end
								end
							elseif STRING_.same_string (tokenizer.last_token_value, "key") then
								tokenizer.next
								if tokenizer.is_lexical_error then
									report_parse_error (tokenizer.last_lexical_error, 3)
									finished := True
								else
									if tokenizer.last_token /= String_literal_token then
										message := "expected %"<string literal>%", found "
										message := STRING_.appended_string (message, display_current_token)
										report_parse_error (message, 3)
										finished := True
									else
										key_name := tokenizer.last_token_value
										tokenizer.next
										if tokenizer.is_lexical_error then
											report_parse_error (tokenizer.last_lexical_error, 3)
											finished := True
										else
											if tokenizer.last_token /= Comma_token then
												message := "expected %",%", found "
												message := STRING_.appended_string (message, display_current_token)
												report_parse_error (message, 3)
												finished := True
											else
												tokenizer.next
												if tokenizer.is_lexical_error then
													report_parse_error (tokenizer.last_lexical_error, 3)
													finished := True
												else
													id_value := Void
													if tokenizer.last_token = String_literal_token then
														create {XM_XPATH_STRING_VALUE} id_value.make (tokenizer.last_token_value)
													elseif tokenizer.last_token = Dollar_token then
														tokenizer.next
														if tokenizer.is_lexical_error then
															report_parse_error (tokenizer.last_lexical_error, 3)
															finished := True
														else
															if tokenizer.last_token /= Name_token then
																message := "expected %"<name>%", found "
																message := STRING_.appended_string (message, display_current_token)
																report_parse_error (message, 3)
																finished := True
															else
																var_name_code := make_name_code (tokenizer.last_token_value, False) \\ bits_20
																environment.bind_variable (var_name_code)
																create {XM_XPATH_VARIABLE_REFERENCE} id_value.make (environment.last_bound_variable)
															end
														end
													else
														report_parse_error ("id value must be either a literal or a variable reference", 3)
														finished := True
													end
													create {XM_XSLT_KEY_PATTERN} key_pattern.make (make_name_code (key_name, False), id_value)
													tokenizer.next
													if tokenizer.is_lexical_error then
														report_parse_error (tokenizer.last_lexical_error, 3)
														finished := True
													else
														if tokenizer.last_token /= Right_parenthesis_token then
															message := "expected %"%)%", found "
															message := STRING_.appended_string (message, display_current_token)
															report_parse_error (message, 3)
															finished := True
														else
															tokenizer.next
															if tokenizer.is_lexical_error then
																report_parse_error (tokenizer.last_lexical_error, 3)
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
								report_parse_error ("The only functions allowed in a pattern are id() and key()", 3)
								finished := True
							end
						else
							report_parse_error ("Function call may appear only at the start of a pattern", 3)
							finished := True
						end
					else
						finished := True
						if root_only then
							internal_last_parsed_pattern := previous_pattern -- the patter was plain "/"
						else
							report_parse_error (STRING_.appended_string ("Unexpected token in pattern, found ", display_current_token), 3)
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
								report_parse_error (tokenizer.last_lexical_error, 3)
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
			step: XM_XSLT_LOCATION_PATH_PATTERN
			node_test: XM_XSLT_NODE_TEST
		do
			create step
			-- node_test := parse_node_test (a_principal_node_type)
			-- TODO
		ensure
			pattern_not_void_unless_error: not is_parse_error implies last_parsed_pattern_step /= Void
		end

	internal_last_parsed_pattern: XM_XSLT_PATTERN
			-- Last sucessfully parsed pattern

	last_parsed_pattern_step: XM_XSLT_LOCATION_PATH_PATTERN
			-- last successfull parsed pattern step

end
