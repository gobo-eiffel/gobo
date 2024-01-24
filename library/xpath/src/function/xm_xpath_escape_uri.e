note

	description:

		"Objects that implement the XPath functions encode-for-uri(), iri-to-uri() and escape-html-uri()"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005-2015, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_ESCAPE_URI

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			evaluate_item
		end

	UT_URL_ENCODING
		export {NONE} all end

create

	make_encode_for_uri, make_iri_to_uri, make_escape_html_uri

feature {NONE} -- Initialization

	make_encode_for_uri
			-- Create encode-for-uri funtion.
		do
			name := "encode-for-uri"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Encode_for_uri_function_type_code
			minimum_argument_count := 1
			maximum_argument_count := 1
			create arguments.make (1)
			arguments.set_equality_tester (expression_tester)
			reserved_character_set := unescaped_uri_characters
			initialized := True
		end

	make_iri_to_uri
			-- Create iri-to-uri funtion.
		do
			name := "iri-to-uri"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Iri_to_uri_function_type_code
			minimum_argument_count := 1
			maximum_argument_count := 1
			create arguments.make (1)
			arguments.set_equality_tester (expression_tester)
			reserved_character_set := unescaped_iri_characters
			initialized := True
		end

	make_escape_html_uri
			-- Create escape-html-uri funtion.
		do
			name := "escape-html-uri"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Escape_html_uri_function_type_code
			minimum_argument_count := 1
			maximum_argument_count := 1
			create arguments.make (1)
			arguments.set_equality_tester (expression_tester)
			reserved_character_set := unescaped_html_characters
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, where known
		do
			Result := type_factory.string_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE
			-- Type of argument number `argument_number'
		do
			create Result.make_optional_string
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		local
			l_uri_string: STRING
		do
			arguments.item (1).evaluate_item (a_result, a_context)
			if not attached a_result.item as a_result_item then
				a_result.put (create {XM_XPATH_STRING_VALUE}.make (""))
			elseif a_result_item.is_error then
				-- nothing to do
			else
				l_uri_string := a_result_item.string_value
				a_result.put (create {XM_XPATH_STRING_VALUE}.make (escaped_uri (l_uri_string)))
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

feature {NONE} -- Implementation

	escaped_uri (a_uri_string: STRING): STRING
			-- Escaped version of `a_uri_string'
		require
			uri_string_not_void: a_uri_string /= Void
		do
			Result := escape_custom (utf8.to_utf8 (a_uri_string), reserved_character_set, False)
		ensure
			escaped_uri_not_void: Result /= Void
		end

	reserved_character_set: DS_HASH_SET [CHARACTER]
			-- Characters not to be escaped

	unescaped_uri_characters: DS_HASH_SET [CHARACTER]
			-- Characters not to be escaped for fn:encode-for-uri()
		local
			a_character_set: STRING
		once
			a_character_set := STRING_.concat (Rfc_lowalpha_characters, Rfc_upalpha_characters)
			a_character_set := STRING_.appended_string (a_character_set, Rfc_digit_characters)
			a_character_set := STRING_.appended_string (a_character_set, Rfc_mark_characters)
			a_character_set := STRING_.appended_string (a_character_set, "#")
			Result := new_character_set (a_character_set)
		end

	unescaped_iri_characters: DS_HASH_SET [CHARACTER]
			-- Characters not to escaped for fn:iri-to-uri()
		local
			a_character_set: STRING
		once
			a_character_set := STRING_.concat (Rfc_lowalpha_characters, Rfc_upalpha_characters)
			a_character_set := STRING_.appended_string (a_character_set, Rfc_digit_characters)
			a_character_set := STRING_.appended_string (a_character_set, Rfc_mark_characters)
			a_character_set := STRING_.appended_string (a_character_set, Rfc_reserved_characters)
			a_character_set := STRING_.appended_string (a_character_set, Rfc_extra_reserved_characters)
			a_character_set := STRING_.appended_string (a_character_set, "#")
			a_character_set := STRING_.appended_string (a_character_set, "%%")
			Result := new_character_set (a_character_set)
		end

	unescaped_html_characters: DS_HASH_SET [CHARACTER]
			-- Characters to escape for fn:iri-to-uri()
		local
			an_index: INTEGER
		once
			create Result.make (95)
			from an_index := 32 until an_index > 126 loop
				Result.force (INTEGER_.to_character (an_index))
				an_index := an_index + 1
			end
		end

end

