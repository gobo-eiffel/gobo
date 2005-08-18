indexing

	description:

		"xsl:strip/preserve-space element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_PRESERVE_SPACE

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			validate
		end

	MA_DECIMAL_MATH
	
	XM_XSLT_SHARED_ANY_NODE_TEST

create {XM_XSLT_NODE_FACTORY}

	make_style_element

feature -- Element change

	prepare_attributes is
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name: STRING
		do
			from
				a_cursor := attribute_collection.name_code_cursor
				a_cursor.start
			variant
				attribute_collection.number_of_attributes + 1 - a_cursor.index				
			until
				a_cursor.after
			loop
				a_name_code := a_cursor.item
				an_expanded_name := shared_name_pool.expanded_name_from_name_code (a_name_code)
				if STRING_.same_string (an_expanded_name, Elements_attribute) then
					elements := attribute_value_by_index (a_cursor.index)
					STRING_.left_adjust (elements)
					STRING_.right_adjust (elements)
				else
					check_unknown_attribute (a_name_code)
				end
				a_cursor.forth
			end
			if elements = Void then
				report_absence ("elements")
			end
			attributes_prepared := True
		end

	validate is
			-- Check that the stylesheet element is valid.
		do
			check_top_level (Void)
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction.
		local
			is_preserving: BOOLEAN
			stripper_rules: XM_XSLT_MODE
			a_splitter: ST_SPLITTER
			an_element_list: DS_LIST [STRING]
			a_cursor: DS_LIST_CURSOR [STRING]
			a_token: STRING
		do
			is_preserving := fingerprint = Xslt_preserve_space_type_code
			principal_stylesheet.ensure_stripper_rules
			stripper_rules := principal_stylesheet.stripper_rules

			-- elements is a space-separated list of element names

			create a_splitter.make
			an_element_list := a_splitter.split (elements)
			from
				a_cursor := an_element_list.new_cursor; a_cursor.start
			variant
				an_element_list.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				a_token := a_cursor.item
				compile_stripper_rules (a_token, is_preserving, stripper_rules)
				a_cursor.forth
			end
			last_generated_expression := Void
		end

feature {NONE} -- Implementation

	elements: STRING
			-- Names tests of elements to be stripped/preserved

	minus_one_half: MA_DECIMAL is
			-- -0.5
		once
			create Result.make_from_string ("-0.5")
		end

	minus_one_quarter: MA_DECIMAL is
			-- -0.25
		once
			create Result.make_from_string ("-0.25")
		end

	compile_stripper_rules (a_token: STRING; is_preserving: BOOLEAN; stripper_rules: XM_XSLT_MODE) is
			-- Compile a stripper rule for `a_token'.
		require
			token_has_characters: a_token /= Void and then a_token.count > 0
			stripper_rules_not_void: stripper_rules /= Void
		local
			a_pattern: XM_XSLT_PATTERN
			a_boolean_rule: XM_XSLT_RULE_VALUE
			a_uri, a_message: STRING
			a_parser: XM_XPATH_QNAME_PARSER
			a_name_code: INTEGER
			an_error: XM_XPATH_ERROR_VALUE
		do
			create a_boolean_rule.make_boolean (is_preserving)
			if STRING_.same_string (a_token, "*") then
				a_pattern := any_xslt_node_test
				stripper_rules.add_rule (a_pattern, a_boolean_rule, precedence, minus_one_half)
			elseif a_token.count > 1 and then a_token.substring_index (":*", a_token.count - 1) = a_token.count - 1 then
				if a_token.count = 2 then
					create an_error.make_from_string ("No prefix before ':*'", Gexslt_eiffel_type_uri, "STRIPPER", Static_error)
					report_compile_error (an_error)
				else
					a_uri := uri_for_prefix (a_token.substring (1, a_token.count - 2), False)
					if static_context = Void then
						create static_context.make (Current, configuration)
					end
					create {XM_XSLT_NAMESPACE_TEST} a_pattern.make (static_context, Element_node, a_uri, a_token)
					stripper_rules.add_rule (a_pattern, a_boolean_rule, precedence, minus_one_quarter)
				end
			elseif a_token.count > 1 and then a_token.substring_index ("*:", 1) = 1 then
				if a_token.count = 2 then
					create an_error.make_from_string ("No local name after '*:'", Gexslt_eiffel_type_uri, "STRIPPER", Static_error)
					report_compile_error (an_error)
				else
					if static_context = Void then
						create static_context.make (Current, configuration)
					end
					create {XM_XSLT_LOCAL_NAME_TEST} a_pattern.make (static_context, Element_node, a_token.substring (3, a_token.count), a_token)
					stripper_rules.add_rule (a_pattern, a_boolean_rule, precedence, minus_one_quarter)
				end
			else
				create a_parser.make (a_token)
				if a_parser.is_valid then
					a_uri := uri_for_prefix (a_parser.optional_prefix, False)
					if a_uri = Void then
						a_message := STRING_.concat ("Element name ", a_token)
						a_message := STRING_.appended_string (a_message, " is not a valid QName")
						create an_error.make_from_string (a_message, Gexslt_eiffel_type_uri, "STRIPPER", Static_error)
						report_compile_error (an_error)
					else
						if not shared_name_pool.is_name_code_allocated ("", a_uri, a_parser.local_name) then
							shared_name_pool.allocate_name ("", a_uri, a_parser.local_name)
						end
						a_name_code := shared_name_pool.name_code ("", a_uri, a_parser.local_name)
						if static_context = Void then
							create static_context.make (Current, configuration)
						end
						create {XM_XSLT_NAME_TEST} a_pattern.make (static_context, Element_node, a_name_code, a_token)
						stripper_rules.add_rule (a_pattern, a_boolean_rule, precedence, zero)
					end
				else
					a_message := STRING_.concat ("Element name ", a_token)
					a_message := STRING_.appended_string (a_message, " is not a valid QName")
					create an_error.make_from_string (a_message, Gexslt_eiffel_type_uri, "STRIPPER", Static_error)
					report_compile_error (an_error)
				end
			end
		end

invariant

	fingerprint: fingerprint = Xslt_preserve_space_type_code or else fingerprint = Xslt_strip_space_type_code

end
	
	
