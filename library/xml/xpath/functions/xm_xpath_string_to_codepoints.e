indexing

	description:

		"Objects that implement the XPath string-to-codepoints() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_STRING_TO_CODEPOINTS

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			evaluate_item, create_iterator
		end

	UC_IMPORTED_UNICODE_ROUTINES

	XM_UNICODE_CHARACTERS_1_1
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "string-to-codepoints"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := String_to_codepoints_function_type_code
			minimum_argument_count := 1
			maximum_argument_count := 1
			create arguments.make (1)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := type_factory.integer_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		do
			create Result.make_optional_string
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		do
			check
				sequence_result: False
				-- Cannot call `evaluate_item' on a sequence
			end
		end

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- An iterator over the values of a sequence
		local
			an_item: XM_XPATH_ITEM
			a_string: STRING
			an_array: ARRAY [XM_XPATH_INTEGER_VALUE]
			an_index, a_count: INTEGER
			an_integer: XM_XPATH_INTEGER_VALUE
		do
			arguments.item (1).evaluate_item (a_context)
			an_item := arguments.item (1).last_evaluated_item
			if an_item = Void then
				create {XM_XPATH_EMPTY_ITERATOR} last_iterator.make
			elseif an_item.is_error then
				create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (an_item.error_value)
			else
				a_string := an_item.string_value
				if a_string.is_empty then
					create {XM_XPATH_EMPTY_ITERATOR} last_iterator.make
				else
					from
						create an_array.make (1, a_string.count); an_index := 1; a_count := a_string.count
					until
						an_index > a_count
					loop
						create an_integer.make_from_integer (a_string.item_code (an_index))
						an_array.put (an_integer, an_index)
						an_index := an_index + 1
					end
					create {XM_XPATH_ARRAY_ITERATOR [XM_XPATH_INTEGER_VALUE]} last_iterator.make (an_array, 1, a_count)
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_zero_or_more
		end

end
	
