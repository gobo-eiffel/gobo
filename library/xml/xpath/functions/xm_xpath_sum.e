indexing

	description:

		"Objects that implement the XPath sum() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_SUM

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			evaluate_item
		end

	XM_XPATH_TOKENS

creation

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "sum"
			minimum_argument_count := 1
			maximum_argument_count := 2
			create arguments.make (2)
			arguments.set_equality_tester (expression_tester)
			compute_static_properties
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := type_factory.any_atomic_type
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
				create Result.make_atomic_sequence
			when 2 then
				create Result.make_optional_atomic
			end
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			a_sum: XM_XPATH_ATOMIC_VALUE
			an_untyped_atomic: XM_XPATH_UNTYPED_ATOMIC_VALUE
			a_numeric_value, another_numeric_value: XM_XPATH_NUMERIC_VALUE
			finished: BOOLEAN
		do
			last_evaluated_item := Void
			an_iterator := arguments.item (1).iterator (a_context)
			if an_iterator.is_error then
				create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make (an_iterator.error_value)
			else
				an_iterator.start
				if an_iterator.is_error then
					create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make (an_iterator.error_value)
				elseif an_iterator.after then
					if arguments.count = 1 then
						create {XM_XPATH_INTEGER_VALUE} last_evaluated_item.make_from_integer (0)
					else
						arguments.item (2).evaluate_item (a_context)
						last_evaluated_item := arguments.item (2).last_evaluated_item
					end
				else
					a_sum ?= an_iterator.item
					check
						sum_not_void: a_sum /= Void
						-- static typing
					end
					an_untyped_atomic ?= a_sum
					if an_untyped_atomic /= Void then
						a_sum := an_untyped_atomic.convert_to_type (type_factory.double_type)
					end
					a_numeric_value ?= a_sum
					if a_numeric_value /= Void then
						if not a_numeric_value.is_nan then
							from
								an_iterator.forth
							until
								finished or else an_iterator.is_error or else an_iterator.after
							loop
								a_sum ?= an_iterator.item
								an_untyped_atomic ?= a_sum
								if an_untyped_atomic /= Void then
									a_sum := an_untyped_atomic.convert_to_type (type_factory.double_type)
								end
								another_numeric_value ?= a_sum
								if another_numeric_value /= Void then
									a_numeric_value := a_numeric_value.arithmetic (Plus_token, another_numeric_value)
								else
									create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Input to sum() contains a mix of numeric and non-numeric values",
																																"", "FORG0006", Dynamic_error)
								end
								an_iterator.forth
							end
							if an_iterator.is_error then
								create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make (an_iterator.error_value)
							end
						end
						if last_evaluated_item = Void then
							last_evaluated_item := a_numeric_value
						end
					else
						create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Input to sum() contains a value that is not numeric (durations not supported yet)",
																													"", "FORG0006", Dynamic_error)
					end
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

end
	
