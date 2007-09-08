indexing

	description:

		"A concatenation of two XPath Expressions (comma operator)"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_APPEND_EXPRESSION

inherit

	XM_XPATH_BINARY_EXPRESSION
		redefine
			compute_cardinality, simplify, create_iterator, make,
			is_append_expression, as_append_expression, create_node_iterator
		end

	XM_XPATH_TOKENS
		export {NONE} all end
	
create

	make

feature {NONE} -- Initialization

	make (an_operand_one: XM_XPATH_EXPRESSION; a_token: INTEGER; an_operand_two: XM_XPATH_EXPRESSION) is
			-- Establish invariant
		do
			Precursor (an_operand_one, a_token, an_operand_two)
			initialized := True
		end

feature -- Access

	is_append_expression: BOOLEAN is
			-- Is `Current' a append expression?
		do
			Result := True
		end

	as_append_expression: XM_XPATH_APPEND_EXPRESSION is
			-- `Current' seen as a append expression
		do
			Result := Current
		end

	frozen item_type: XM_XPATH_ITEM_TYPE is
			--Determine the data type of the expression, if possible
		do
			Result := common_super_type (first_operand.item_type, second_operand.item_type)
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Optimization	

	simplify is
			-- Perform context-independent static optimizations.
		local
			l_sequence_extent: XM_XPATH_SEQUENCE_EXTENT
		do
			first_operand.simplify
			if first_operand.is_error then
				set_last_error (first_operand.error_value)
			elseif first_operand.was_expression_replaced then
				set_first_operand (first_operand.replacement_expression)
			end

			if not is_error then
				second_operand.simplify
				if second_operand.is_error then
					set_last_error (second_operand.error_value)
				elseif second_operand.was_expression_replaced then
					set_second_operand (second_operand.replacement_expression)
				end
			end

			if not is_error then
				if first_operand.is_empty_sequence then
					 set_replacement (second_operand)
				elseif second_operand.is_empty_sequence then
					set_replacement (first_operand)
				else
					
					-- For lists consisting entirely of constant atomic values, build a sequence extent at compile time
					
					if is_atomic_sequence then
						create_iterator (Void)
						if last_iterator.is_error then
							set_replacement (create {XM_XPATH_INVALID_VALUE}.make (last_iterator.error_value))
						else
							create l_sequence_extent.make (last_iterator)
							set_replacement (l_sequence_extent)
						end
					else
						simplify_value_sequence
					end
				end
			end
		end

feature -- Evaluation

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Iterator over the values of a sequence
		do
			first_operand.create_iterator (a_context)
			if first_operand.last_iterator.is_error then
				last_iterator := first_operand.last_iterator
			else
				second_operand.create_iterator (a_context)
				if second_operand.last_iterator.is_error then
					last_iterator := second_operand.last_iterator
				else
					if first_operand.last_iterator.is_node_iterator and second_operand.last_iterator.is_node_iterator then
						create {XM_XPATH_NODE_APPEND_ITERATOR} last_iterator.make (first_operand.last_iterator.as_node_iterator, second_operand.last_iterator.as_node_iterator, a_context)
					else
						create {XM_XPATH_APPEND_ITERATOR} last_iterator.make (first_operand.last_iterator, second_operand.last_iterator, a_context)
					end
				end
			end
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over a node sequence.
		do
			first_operand.create_node_iterator (a_context)
			if first_operand.last_node_iterator.is_error then
				last_node_iterator := first_operand.last_node_iterator
			else
				second_operand.create_node_iterator (a_context)
				if second_operand.last_node_iterator.is_error then
					last_iterator := second_operand.last_node_iterator
				else
					create {XM_XPATH_NODE_APPEND_ITERATOR} last_node_iterator.make (first_operand.last_node_iterator, second_operand.last_node_iterator, a_context)
				end
			end
		end

feature {NONE} -- Implementation

	compute_cardinality is
			-- Compute cardinality.
		do
			if first_operand.is_empty_sequence then
				clone_cardinality (second_operand)
			else
				if second_operand.is_empty_sequence then
					clone_cardinality (first_operand)
				else
					if first_operand.cardinality_allows_zero and then second_operand.cardinality_allows_zero then
						set_cardinality_zero_or_more
					else
						set_cardinality_one_or_more 
					end
				end
			end
			are_cardinalities_computed := True
		end

	is_atomic_sequence: BOOLEAN is
			-- Is `Current' an atomic sequence?
		do
			Result := is_atomic (first_operand) and then  is_atomic (second_operand) 
		end

	is_atomic (an_expression: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Is `an_expression' atomic or an atomic extent?
		do
			if an_expression.is_atomic_value then
				Result := True
			elseif an_expression.is_sequence_extent then
					Result := True
			end
		end

	simplify_value_sequence is
			-- An expression such as (1,2,$x) will be parsed as (1, (2, $x)). This can be
			--  simplified to ((1,2), $x), reducing the number of iterators needed to evaluate it
		local
			l_append_expression, l_other_append_expression, l_third_append_expression: XM_XPATH_APPEND_EXPRESSION
			l_expression: XM_XPATH_EXPRESSION
		do
			if first_operand.is_value and then second_operand.is_append_expression then
				l_other_append_expression := second_operand.as_append_expression
				if l_other_append_expression.first_operand.is_value then
					l_expression := l_other_append_expression.first_operand
					l_expression.simplify
					if l_expression.is_error then
						set_replacement (l_expression)
					else
						if l_expression.was_expression_replaced then
							l_expression := l_expression.replacement_expression
						end
						create l_third_append_expression.make (first_operand, operator, l_expression)
						l_expression := l_other_append_expression.second_operand
						l_expression.simplify
						if l_expression.is_error then
							set_replacement (l_expression)
						else
							if l_expression.was_expression_replaced then
								l_expression := l_expression.replacement_expression											
							end
							create {XM_XPATH_APPEND_EXPRESSION} l_append_expression.make (l_third_append_expression, operator, l_expression)
							set_replacement (l_expression)
						end
					end
				end
			end
		end

end
	
