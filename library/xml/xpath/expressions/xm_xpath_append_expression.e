indexing

	description:

		"A concatenation of two XPath Expressions (comma operator)"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_APPEND_EXPRESSION

inherit

	XM_XPATH_BINARY_EXPRESSION
		redefine
			compute_cardinality, simplify, iterator
		end

	XM_XPATH_TOKENS
	
creation

	make

feature -- Access

	frozen item_type: INTEGER is
			--Determine the data type of the expression, if possible
		do
			Result := common_super_type (first_operand.item_type, second_operand.item_type)
		end

feature -- Optimization	

	simplify: XM_XPATH_EXPRESSION is
			-- Simplify an expression
		local
			an_append_expression, another_append_expression, a_third_append_expression: XM_XPATH_APPEND_EXPRESSION
			an_empty_sequence: XM_XPATH_EMPTY_SEQUENCE
			a_value, another_value: XM_XPATH_VALUE
		do
			an_append_expression := clone (Current)
			an_append_expression.set_first_operand (first_operand.simplify)
			if an_append_expression.first_operand.is_error then
				an_append_expression.set_last_error (an_append_expression.first_operand.last_error)
			end

			if not an_append_expression.is_error then
				an_append_expression.set_second_operand (second_operand.simplify)
				if an_append_expression.second_operand.is_error then
					an_append_expression.set_last_error (an_append_expression.second_operand.last_error)
				end
			end

			if not is_error then
				an_empty_sequence ?= first_operand
				if an_empty_sequence /= Void then
					Result := second_operand
				else
					an_empty_sequence ?= second_operand
					if an_empty_sequence /= Void then
						Result := first_operand
					else

						-- For lists consisting entirely of constant atomic values, build a SequenceExtent at compile time

						if is_atomic_sequence then
							create {XM_XPATH_SEQUENCE_EXTENT} Result.make (iterator (Void))
						else

							-- An expression such as (1,2,$x) will be parsed as (1, (2, $x)). This can be
							--  simplified to ((1,2), $x), reducing the number of iterators needed to evaluate it

							a_value ?= first_operand
							another_append_expression ?= second_operand
							if a_value /= Void and then another_append_expression /= Void then
								another_value ?= another_append_expression.first_operand
								if another_value /= Void then
									create a_third_append_expression.make (first_operand, operator, another_append_expression.first_operand.simplify)
									create {XM_XPATH_APPEND_EXPRESSION} Result.make (a_third_append_expression, operator, another_append_expression.second_operand.simplify)
								end
							end
						end
					end
				end
			end
			if Result = Void then Result := an_append_expression end
		end

feature -- Evaluation

		iterator (a_context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- Iterator over the values of a sequence
		do
			create {XM_XPATH_APPEND_ITERATOR} Result.make (first_operand.iterator (a_context), second_operand, a_context)
		end

feature {NONE} -- Implementation

	compute_cardinality is
			-- Compute cardinality.
		local
			an_empty_sequence: XM_XPATH_EMPTY_SEQUENCE
		do
			an_empty_sequence ?= first_operand
			if an_empty_sequence /= Void then
				clone_cardinality (second_operand)
			else
				an_empty_sequence ?= second_operand
				if an_empty_sequence /= Void then
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
		local
			an_atomic_value: XM_XPATH_ATOMIC_VALUE
			a_sequence_extent: XM_XPATH_SEQUENCE_EXTENT
		do
			an_atomic_value ?= an_expression
			if an_atomic_value /= Void then
				Result := True
			else
				a_sequence_extent ?= an_expression
				if a_sequence_extent /= Void then
					Result := True
				end
			end
		end

end
	
