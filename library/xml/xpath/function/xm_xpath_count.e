indexing

	description:

		"Objects that implement the XPath count() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_COUNT

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			evaluate_item, check_arguments, is_count_function, as_count_function
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "count"
			namespace_uri := Xpath_standard_functions_uri
			fingerprint := Count_function_type_code
			minimum_argument_count := 1
			maximum_argument_count := 1
			create arguments.make (1)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	is_count_function: BOOLEAN is
			-- Is `Current' XPath count() function?
		do
			Result := True
		end

	as_count_function: XM_XPATH_COUNT is
			-- `Current' seen as XPath count() function
		do
			Result := Current
		end

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
			create Result.make_any_sequence
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			an_integer_value: XM_XPATH_INTEGER_VALUE
			an_integer: INTEGER
		do
			arguments.item (1).create_iterator (a_context)
			an_iterator := arguments.item (1).last_iterator
			if an_iterator.is_error then
				create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make (an_iterator.error_value)
			elseif an_iterator.is_last_position_finder then
				create an_integer_value.make_from_integer (an_iterator.as_last_position_finder.last_position)
				last_evaluated_item := an_integer_value
			else
				from
					an_integer := 0
					an_iterator.start
				until
					an_iterator.is_error or else an_iterator.after
				loop
					an_integer := an_integer + 1
					an_iterator.forth
				end
				if not an_iterator.is_error then
					create an_integer_value.make_from_integer (an_integer)
					last_evaluated_item := an_integer_value
				else
					create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make (an_iterator.error_value)
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
			set_cardinality_exactly_one
		end

feature {XM_XPATH_FUNCTION_CALL} -- Local

	check_arguments (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Check arguments during parsing, when all the argument expressions have been read.
		do
			Precursor (a_context)
			arguments.item (1).set_unsorted (True)
			if arguments.item (1).was_expression_replaced then
				arguments.replace (arguments.item (1).replacement_expression, 1)
			end
		end

end
	
