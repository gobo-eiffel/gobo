indexing

	description:

		"Implement the XPath normalize-space() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_NORMALIZE_SPACE

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			simplify, evaluate_item
		end

creation

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "normalize-space"
			minimum_argument_count := 0
			maximum_argument_count := 1
			create arguments.make (1)
			arguments.set_equality_tester (expression_tester)
			compute_static_properties
		end

feature -- Access

	normalize (a_string: STRING): STRING is
			-- Normalized version of `a_string';
		
			-- Strip leading and trailing whitespace;
			-- replace sequences of one or more
			-- whitespace character with a single space, #x20
		require
			string_not_void: a_string /= Void
		local
			tokenizer: ST_SPLITTER
			tokens: DS_LIST [STRING]
			zero: INTEGER
		do
			create tokenizer.make
			tokens := tokenizer.split (a_string)
			Result := tokenizer.join_unescaped (tokens)
		ensure
			result_not_void: Result /= Void
		end
feature -- Access

	item_type: INTEGER is
			-- Determine the data type of the expression, if possible
		do
			Result := String_type
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		do
			create Result.make (String_type, Required_cardinality_optional)
		end

feature -- Optimization

	simplify: XM_XPATH_EXPRESSION is
			-- Simplify `Current'
		local
			result_expression: XM_XPATH_NORMALIZE_SPACE
		do
			result_expression := clone (Current)
			result_expression.use_context_item_as_default
			result_expression.set_arguments (simplify_arguments)
			Result := result_expression
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		local
			a_string_value: XM_XPATH_STRING_VALUE
		do
			arguments.item (1).evaluate_item (a_context)
			a_string_value ?= arguments.item (1).last_evaluated_item
			if a_string_value /= Void then
				create {XM_XPATH_STRING_VALUE} last_evaluated_item.make (normalize (a_string_value.string_value))
			else
				last_evaluated_item := Void
			end
		end
	
feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one --?? check with Mike
		end

end
