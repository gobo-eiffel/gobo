indexing

	description:

		"Objects that implement the XPath remove() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_REMOVE

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			create_iterator, simplify
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "remove"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Remove_function_type_code
			minimum_argument_count := 2
			maximum_argument_count := 2
			create arguments.make (2)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := arguments.item (1).item_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		do
			inspect
				argument_number
			when 1 then
				create Result.make_any_sequence
			when 2 then
				create Result.make_single_integer
			end
		end

feature -- Optimization

	simplify is
			-- Perform context-independent static optimizations
		local
			a_tail_expression: XM_XPATH_TAIL_EXPRESSION
		do
			Precursor
			if not was_expression_replaced then

				-- Recognize remove(seq, 1) as a tail expression.
				-- This is worth doing because tail expressions
				--  used in a recursive call are handled specially.

				if arguments.item (2).is_integer_value and then arguments.item (2).as_integer_value.is_platform_integer and then arguments.item (2).as_integer_value.as_integer = 1 then
					create a_tail_expression.make (arguments.item (1), 2)
					set_replacement (a_tail_expression)
				end
			end
		end

feature -- Evaluation

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- An iterator over the values of a sequence
		local
			a_sequence: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			an_item: XM_XPATH_ITEM
			a_count: INTEGER
		do
			arguments.item (1).create_iterator (a_context)
			a_sequence := arguments.item (1).last_iterator
			if a_sequence.is_error then
				last_iterator := a_sequence
			else
				arguments.item (2).evaluate_item (a_context)
				an_item := arguments.item (2).last_evaluated_item
				check
					position_not_void: an_item /= Void
					-- Static typing
				end
				if an_item.is_error then
					create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (an_item.error_value)
				else
					check
						integer: an_item.is_integer_value
						-- static typing
					end
					if an_item.as_integer_value.is_platform_integer then
						a_count := an_item.as_integer_value.as_integer
						create {XM_XPATH_REMOVE_ITERATOR} last_iterator.make (a_sequence, a_count)
					else
						create {XM_XPATH_INVALID_ITERATOR} last_iterator.make_from_string ("Position exceeds implementation limit", Gexslt_eiffel_type_uri, "SEQUENCE_TOO_LONG", Dynamic_error)
					end
				end
			end
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over a node sequence
		do
			todo ("create_node_iterator", False)
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_zero_or_more
		end
		
end
	
