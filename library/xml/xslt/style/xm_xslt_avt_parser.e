note

	description:

		"Helper objects for parsing XSLT attribute value templates"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2006, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_AVT_PARSER

inherit

	ANY

	XM_XPATH_SHARED_EXPRESSION_TESTER
		export {NONE} all end

	XM_XPATH_TYPE
		export {NONE} all end

	XM_XPATH_TOKENS
		export {NONE} all end

	XM_XPATH_ERROR_TYPES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_avt: STRING; a_static_context: XM_XSLT_EXPRESSION_CONTEXT; a_all_untyped: BOOLEAN) is
			-- Initialize `Current'
		require
			avt_not_void: a_avt /= Void
			static_context_not_void: a_static_context /= Void
		do
			are_all_nodes_untyped := a_all_untyped
			avt := a_avt
			static_context := a_static_context
			create components.make (5)
			components.set_equality_tester (expression_tester)
		ensure
			are_all_nodes_untyped_set: are_all_nodes_untyped = a_all_untyped
			avt_set: avt = a_avt
			static_context_set: static_context = a_static_context
		end

feature -- Access

	components: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Parsed components

	error_value: XM_XPATH_ERROR_VALUE
			-- Possible error from `parse_components'

feature -- Status report

	are_all_nodes_untyped: BOOLEAN
			-- Are all nodes untyped?

feature -- Basic operations

	parse_components (a_line_number: INTEGER) is
			-- Parse `avt' into `components'.
		local
			l_leading_character, l_avt_length: INTEGER
			l_left_curly_brace, l_right_curly_brace, l_left_double_curly_brace, l_right_double_curly_brace: INTEGER
			l_parser: XM_XPATH_EXPRESSION_PARSER
			l_expression: XM_XPATH_EXPRESSION
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			from
				l_avt_length := avt.count
				l_leading_character := 1
			until
				l_leading_character > l_avt_length
			loop
				l_left_curly_brace := avt.index_of ('{', l_leading_character)
				l_left_double_curly_brace := STRING_.substring_index (avt, "{{", l_leading_character)
				l_right_curly_brace := avt.index_of ('}', l_leading_character)
				l_right_double_curly_brace := STRING_.substring_index (avt, "}}", l_leading_character)

				if l_left_curly_brace = 0 and l_right_curly_brace = 0 then
					append_fixed_component (avt.substring (l_leading_character, l_avt_length))
					l_leading_character := avt.count + 1
				elseif l_right_curly_brace > 0 and (l_left_curly_brace = 0 or  l_right_curly_brace < l_left_curly_brace) then
					if l_right_curly_brace /= l_right_double_curly_brace then
						create error_value.make_from_string ("Literal closing curly brace in attribute value template must be doubled", Xpath_errors_uri, "XTSE0370", Static_error)
						l_leading_character := avt.count + 1
					else
						append_fixed_component (avt.substring (l_leading_character, l_right_double_curly_brace))
						l_leading_character := l_right_double_curly_brace + 2
					end
				elseif l_left_curly_brace > 0 and l_left_curly_brace = l_left_double_curly_brace then
					append_fixed_component (avt.substring (l_leading_character, l_left_double_curly_brace))
					l_leading_character := l_left_double_curly_brace + 2
				elseif l_left_curly_brace > 0 then
					if l_left_curly_brace = l_avt_length then
						create error_value.make_from_string ("Literal opening curly brace at end of attribute value template must be doubled", Xpath_errors_uri, "XTSE0350", Static_error)
						l_leading_character := avt.count + 1
					elseif l_right_curly_brace < l_left_curly_brace then
						create error_value.make_from_string ("Opening curly brace is not matched by a closing curly brace", Xpath_errors_uri, "XTSE0350", Static_error)
						l_leading_character := avt.count + 1
					else
						if l_left_curly_brace > l_leading_character then
							append_fixed_component (avt.substring (l_leading_character, l_left_curly_brace - 1))
						end
						create l_parser.make
						l_parser.parse (avt, static_context, l_left_curly_brace + 1, Right_curly_token, a_line_number)
						if l_parser.is_parse_error then
							create error_value.make_from_string (l_parser.first_parse_error, Xpath_errors_uri, l_parser.first_parse_error_code, Static_error)
							l_leading_character := avt.count + 1
						else
							create l_replacement.make (Void)
							l_parser.last_parsed_expression.simplify (l_replacement)
							l_expression := l_replacement.item
							append_parsed_expression (l_expression)
							l_leading_character := l_parser.tokenizer.next_token_start_index + 1
						end
					end
				else
					create error_value.make_from_string ("Logic error in XM_XSLT_AVT_PARSER", Gexslt_eiffel_type_uri, "AVT_LOGIC", Static_error)
					l_leading_character := avt.count + 1
				end
			variant
				avt.count + 1 - l_leading_character
			end
		end

feature {NONE} -- Implementation

	avt: STRING
			-- Original AVT to be parsed

	static_context: XM_XSLT_EXPRESSION_CONTEXT
			-- Static context

	append_fixed_component (a_string_component: STRING) is
			--	Append `a_string_component' onto `components'.
		require
			string_component_not_void: a_string_component /= Void
		local
			l_string_value: XM_XPATH_STRING_VALUE
		do
			create l_string_value.make (a_string_component)
			if not components.extendible (1) then
				components.resize (2 * components.count)
			end
			components.put_last (l_string_value)
		ensure
			one_more: components.count = old components.count + 1
		end

	append_parsed_expression (a_expression: XM_XPATH_EXPRESSION) is
			-- Append `a_expression' onto `components'.
		require
			expression_not_void: a_expression /= Void
		local
			l_result_expression: XM_XPATH_EXPRESSION
			l_atomizer: XM_XPATH_ATOMIZER_EXPRESSION
			l_first_item_expression: XM_XPATH_FIRST_ITEM_EXPRESSION
			l_atomic_sequence_converter: XM_XPATH_ATOMIC_SEQUENCE_CONVERTER
			l_blank: XM_XPATH_STRING_VALUE
		do
			if static_context.is_backwards_compatible_mode then
				if is_sub_type (a_expression.item_type, type_factory.any_atomic_type) then
					l_result_expression := a_expression
				else
					create l_atomizer.make (a_expression, are_all_nodes_untyped)
					l_result_expression := l_atomizer
				end
				if l_result_expression.cardinality_allows_many then
					create l_first_item_expression.make (l_result_expression)
					l_result_expression := l_first_item_expression
				end
				if not is_sub_type (l_result_expression.item_type, type_factory.string_type) then
					create l_atomic_sequence_converter.make (l_result_expression, type_factory.string_type)
					l_result_expression := l_atomic_sequence_converter
				end
			else
				create l_blank.make (" ")
				create {XM_XSLT_CONTENT_CONSTRUCTOR} l_result_expression.make (a_expression, l_blank)
			end
			if not components.extendible (1) then
				components.resize (2 * components.count)
			end
			components.put_last (l_result_expression)
		ensure
			at_least_one_more: components.count > old components.count
		end

invariant

		avt_not_void: avt /= Void
		static_context_not_void: static_context /= Void
		components_not_void: components /= Void

end
