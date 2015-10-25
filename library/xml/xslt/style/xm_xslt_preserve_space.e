note

	description:

		"xsl:strip/preserve-space element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_PRESERVE_SPACE

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			validate
		end

	MA_SHARED_DECIMAL_CONSTANTS

	XM_XSLT_SHARED_ANY_NODE_TEST

create {XM_XSLT_NODE_FACTORY}

	make_style_element

feature -- Element change

	prepare_attributes
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name: STRING
			l_elements: like elements
		do
			if attached attribute_collection as l_attribute_collection then
				from
					a_cursor := l_attribute_collection.name_code_cursor
					a_cursor.start
				until
					a_cursor.after or any_compile_errors
				loop
					a_name_code := a_cursor.item
					an_expanded_name := shared_name_pool.expanded_name_from_name_code (a_name_code)
					if STRING_.same_string (an_expanded_name, Elements_attribute) then
						l_elements := attribute_value_by_index (a_cursor.index)
						elements := l_elements
						STRING_.left_adjust (l_elements)
						STRING_.right_adjust (l_elements)
					else
						check_unknown_attribute (a_name_code)
					end
					a_cursor.forth
				variant
					l_attribute_collection.number_of_attributes + 1 - a_cursor.index
				end
			end
			if elements = Void then
				report_absence ("elements")
			end
			attributes_prepared := True
		end

	validate
			-- Check that the stylesheet element is valid.
		do
			check_empty
			check_top_level (Void)
			validated := True
		end

	compile (a_executable: XM_XSLT_EXECUTABLE)
			-- Compile `Current' to a excutable instruction.
		local
			is_preserving: BOOLEAN
			stripper_rules: detachable XM_XSLT_MODE
			a_splitter: ST_SPLITTER
			an_element_list: DS_LIST [STRING]
			a_cursor: DS_LIST_CURSOR [STRING]
			a_token: STRING
		do
			is_preserving := fingerprint = Xslt_preserve_space_type_code
			check attached principal_stylesheet as l_principal_stylesheet then
				l_principal_stylesheet.ensure_stripper_rules
				stripper_rules := l_principal_stylesheet.stripper_rules
			end

			-- elements is a space-separated list of element names

			create a_splitter.make
			check attached elements as l_elements then
				an_element_list := a_splitter.split (l_elements)
			end
			from
				a_cursor := an_element_list.new_cursor; a_cursor.start
			until
				a_cursor.after
			loop
				a_token := a_cursor.item
				check stripper_rules /= Void then
					compile_stripper_rules (a_executable, a_token, is_preserving, stripper_rules)
				end
				a_cursor.forth
			variant
				an_element_list.count + 1 - a_cursor.index
			end
			last_generated_expression := Void
		end

feature {NONE} -- Implementation

	elements: detachable STRING
			-- Names tests of elements to be stripped/preserved

	minus_one_half: MA_DECIMAL
			-- -0.5
		once
			create Result.make_from_string ("-0.5")
		end

	minus_one_quarter: MA_DECIMAL
			-- -0.25
		once
			create Result.make_from_string ("-0.25")
		end

	compile_stripper_rules (a_executable: XM_XSLT_EXECUTABLE; a_token: STRING; is_preserving: BOOLEAN; stripper_rules: XM_XSLT_MODE)
			-- Compile a stripper rule for `a_token'.
		require
		a_executable_not_void: a_executable /= Void
			token_has_characters: a_token /= Void and then a_token.count > 0
			stripper_rules_not_void: stripper_rules /= Void
		local
			a_pattern: XM_XSLT_PATTERN
			a_boolean_rule: XM_XSLT_RULE_VALUE
			a_uri: detachable STRING
			a_message: STRING
			a_parser: XM_XPATH_QNAME_PARSER
			a_name_code: INTEGER
			an_error: XM_XPATH_ERROR_VALUE
			l_static_context: like static_context
		do
			create a_boolean_rule.make_boolean (is_preserving)
			if STRING_.same_string (a_token, "*") then
				a_pattern := any_xslt_node_test
				stripper_rules.add_rule (a_pattern, a_boolean_rule, precedence, minus_one_half)
				a_executable.rule_manager.rank_priority (minus_one_half)
			elseif a_token.count > 1 and then a_token.substring_index (":*", a_token.count - 1) = a_token.count - 1 then
				if a_token.count = 2 then
					create an_error.make_from_string ("No prefix before ':*'", Gexslt_eiffel_type_uri, "STRIPPER", Static_error)
					report_compile_error (an_error)
				else
					check attached uri_for_prefix (a_token.substring (1, a_token.count - 2), False) as l_uri_for_prefix then
						a_uri := l_uri_for_prefix
					end
					l_static_context := static_context
					if l_static_context = Void then
						create l_static_context.make (Current, configuration)
						static_context := l_static_context
					end
					create {XM_XSLT_NAMESPACE_TEST} a_pattern.make (l_static_context, Element_node, a_uri, a_token)
					stripper_rules.add_rule (a_pattern, a_boolean_rule, precedence, minus_one_quarter)
					a_executable.rule_manager.rank_priority (minus_one_quarter)
				end
			elseif a_token.count > 1 and then a_token.substring_index ("*:", 1) = 1 then
				if a_token.count = 2 then
					create an_error.make_from_string ("No local name after '*:'", Gexslt_eiffel_type_uri, "STRIPPER", Static_error)
					report_compile_error (an_error)
				else
					l_static_context := static_context
					if l_static_context = Void then
						create l_static_context.make (Current, configuration)
						static_context := l_static_context
					end
					create {XM_XSLT_LOCAL_NAME_TEST} a_pattern.make (l_static_context, Element_node, a_token.substring (3, a_token.count), a_token)
					stripper_rules.add_rule (a_pattern, a_boolean_rule, precedence, minus_one_quarter)
					a_executable.rule_manager.rank_priority (minus_one_quarter)
				end
			else
				create a_parser.make (a_token)
				if a_parser.is_valid then
					check
						a_parser_is_valid: attached a_parser.optional_prefix as l_optional_prefix
						a_parser_is_valid_2: attached a_parser.local_name as l_local_name
					then
						if l_optional_prefix.is_empty then
							a_uri := default_xpath_namespace
						else
							a_uri := uri_for_prefix (l_optional_prefix, False)
						end
						if a_uri = Void then
							a_message := STRING_.concat ("Element name ", a_token)
							a_message := STRING_.appended_string (a_message, " is not a valid QName")
							create an_error.make_from_string (a_message, Xpath_errors_uri, "XTSE0280", Static_error)
							report_compile_error (an_error)
						else
							if not shared_name_pool.is_name_code_allocated ("", a_uri, l_local_name) then
								shared_name_pool.allocate_name ("", a_uri, l_local_name)
							end
							a_name_code := shared_name_pool.name_code ("", a_uri, l_local_name)
							l_static_context := static_context
							if l_static_context = Void then
								create l_static_context.make (Current, configuration)
								static_context := l_static_context
							end
							create {XM_XSLT_NAME_TEST} a_pattern.make (l_static_context, Element_node, a_name_code, a_token)
							stripper_rules.add_rule (a_pattern, a_boolean_rule, precedence, decimal.zero)
							a_executable.rule_manager.rank_priority (decimal.zero)
						end
					end
				else
					a_message := STRING_.concat ("Element name ", a_token)
					a_message := STRING_.appended_string (a_message, " is not a valid QName")
					create an_error.make_from_string (a_message, Xpath_errors_uri, "XTSE0280", Static_error)
					report_compile_error (an_error)
				end
			end
		end

invariant

	fingerprint: fingerprint = Xslt_preserve_space_type_code or else fingerprint = Xslt_strip_space_type_code

end


