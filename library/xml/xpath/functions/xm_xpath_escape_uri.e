indexing

	description:

		"Objects that implement the XPath escape-uri() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ESCAPE_URI

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			evaluate_item
		end

	UT_URL_ENCODING
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "escape-uri"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Escape_uri_function_type_code
			minimum_argument_count := 1
			maximum_argument_count := 2
			create arguments.make (2)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := type_factory.string_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		do
			if argument_number = 1 then
				create Result.make_optional_string
			else
				create Result.make_single_boolean
			end
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		local
			an_item: XM_XPATH_ITEM
			a_uri_string: STRING
			escape_reserved: BOOLEAN
		do
			arguments.item (1).evaluate_item (a_context)
			an_item := arguments.item (1).last_evaluated_item
			if an_item = Void then
				create {XM_XPATH_STRING_VALUE} last_evaluated_item.make ("")
			elseif an_item.is_error then
				last_evaluated_item := an_item
			else
				a_uri_string := an_item.string_value
				arguments.item (2).evaluate_item (a_context)
				an_item := arguments.item (2).last_evaluated_item
				check
					escape_reserved_not_void: an_item /= Void
					-- static typing
				end
				if an_item.is_error then
					last_evaluated_item := an_item
				else
					check
						escape_reserved2_not_void: an_item.is_boolean_value
						-- static typing
					end
					escape_reserved := an_item.as_boolean_value.value
					create {XM_XPATH_STRING_VALUE} last_evaluated_item.make (escaped_uri (a_uri_string, escape_reserved))
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

feature {NONE} -- Implementation

	escaped_uri (a_uri_string: STRING; escape_reserved: BOOLEAN): STRING is
			-- Escaped version of `a_uri_string'
		require
			uri_string_not_void: a_uri_string /= Void
		local
			a_character_set: DS_HASH_SET [CHARACTER]
		do
			if escape_reserved then
				a_character_set := unescaped_uri_characters
			else
				a_character_set := unescaped_reserved_uri_characters
			end
			Result := escape_custom (utf8.to_utf8 (a_uri_string), a_character_set, False)
		ensure
			escaped_uri_not_void: Result /= Void
		end

	unescaped_uri_characters: DS_HASH_SET [CHARACTER] is
			-- Default character set not to escape
		local
			a_character_set: STRING
		once
			a_character_set := STRING_.concat (Rfc_lowalpha_characters, Rfc_upalpha_characters)
			a_character_set := STRING_.appended_string (a_character_set, Rfc_digit_characters)
			a_character_set := STRING_.appended_string (a_character_set, Rfc_mark_characters)
			a_character_set := STRING_.appended_string (a_character_set, "#")
			a_character_set := STRING_.appended_string (a_character_set, "%%")
			Result := new_character_set (a_character_set)
		end

	unescaped_reserved_uri_characters: DS_HASH_SET [CHARACTER] is
			-- Character set not to escape including reserved characters
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

end
	
