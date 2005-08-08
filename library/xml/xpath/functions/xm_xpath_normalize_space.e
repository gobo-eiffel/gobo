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

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "normalize-space"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := normalize_space_function_type_code
			minimum_argument_count := 0
			maximum_argument_count := 1
			create arguments.make (1)
			arguments.set_equality_tester (expression_tester)
			initialized := True
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
		do
			create tokenizer.make
			tokens := tokenizer.split (a_string)
			Result := tokenizer.join_unescaped (tokens)
		ensure
			result_not_void: Result /= Void
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
			create Result.make (type_factory.string_type, Required_cardinality_optional)
		end

feature -- Optimization

	simplify is
			-- Perform context-independent static optimizations
		do
			use_context_item_as_default
			Precursor
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		do
			arguments.item (1).evaluate_item (a_context)
			if arguments.item (1).last_evaluated_item.is_string_value then
				create {XM_XPATH_STRING_VALUE} last_evaluated_item.make (normalize (arguments.item (1).last_evaluated_item.as_string_value.string_value))
			else
				last_evaluated_item := Void
			end
		end
	
feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

end
