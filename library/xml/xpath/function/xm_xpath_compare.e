indexing

	description:

		"Objects that implement the XPath compare() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_COMPARE

inherit

	XM_XPATH_SYSTEM_FUNCTION
		undefine
			pre_evaluate, check_static_type
		redefine
			evaluate_item
		end

	XM_XPATH_COLLATING_FUNCTION

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "compare"
			namespace_uri := Xpath_standard_functions_uri
			fingerprint := Compare_function_type_code
			minimum_argument_count := 2
			maximum_argument_count := 3
			create arguments.make (3)
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
			if argument_number < 3 then
				create Result.make_optional_string
			else
				create Result.make_single_string
			end
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		local
			a_collator: ST_COLLATOR
			s1, s2: STRING
			an_item, another_item: XM_XPATH_ITEM
			a_comparison_result: INTEGER
		do
			a_collator := collator (3, a_context, True)
			if a_collator = Void then
				create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Unsupported collation", Xpath_errors_uri, "FOCH0002", Dynamic_error)
			else
				arguments.item (1).evaluate_item (a_context)
				an_item := arguments.item (1).last_evaluated_item
				if an_item = Void or else not an_item.is_atomic_value then
					last_evaluated_item := Void
				else
					arguments.item (2).evaluate_item (a_context)
					another_item := arguments.item (2).last_evaluated_item
					if another_item = Void or else not another_item.is_atomic_value then
						last_evaluated_item := Void
					else
						s1 := an_item.as_atomic_value.string_value
						s2 := another_item.as_atomic_value.string_value
						a_comparison_result := a_collator.three_way_comparison (s1, s2)
						create {XM_XPATH_INTEGER_VALUE} last_evaluated_item.make_from_integer (a_comparison_result)
					end
				end
			end
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over a node sequence
		do
			-- pre-condition is never met
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_optional
		end
	
end
	
