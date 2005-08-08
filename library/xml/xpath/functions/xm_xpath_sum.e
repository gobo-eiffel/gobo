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
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "sum"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := sum_function_type_code
			minimum_argument_count := 1
			maximum_argument_count := 2
			create arguments.make (2)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		local
			a_base_type: XM_XPATH_ITEM_TYPE
		do
			a_base_type := arguments.item (1).atomized_item_type (False)
			if a_base_type = type_factory.untyped_atomic_type then
				a_base_type := type_factory.double_type
			end
			if arguments.item (1).cardinality_allows_zero then
				if arguments.count = 1 then
					Result := common_super_type (a_base_type, type_factory.integer_type)
				else
					Result := common_super_type (a_base_type, arguments.item (2).item_type)
				end
			else
				Result := a_base_type
			end
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
			an_item: XM_XPATH_ITEM
			a_numeric_value: XM_XPATH_NUMERIC_VALUE
			finished: BOOLEAN
		do
			last_evaluated_item := Void
			arguments.item (1).create_iterator (a_context)
			an_iterator := arguments.item (1).last_iterator
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
					check
						sum_is_atomic: an_iterator.item.is_atomic_value
						-- static typing
					end
					a_sum := an_iterator.item.as_atomic_value
					-- TODO: for schema-aware processor
					if a_sum.is_untyped_atomic then
						a_sum := a_sum.convert_to_type (type_factory.double_type)
					end
					if a_sum.is_numeric_value then
						a_numeric_value := a_sum.as_numeric_value
						if not a_numeric_value.is_nan then
							from
								an_iterator.forth
							until
								finished or else an_iterator.is_error or else an_iterator.after
							loop
								an_item := an_iterator.item
								if an_item.is_untyped_atomic then
									a_sum := an_item.as_untyped_atomic.convert_to_type (type_factory.double_type)
								else
									a_sum := an_item.as_atomic_value.convert_to_type (type_factory.double_type)
								end
								if a_sum.is_numeric_value then
									a_numeric_value := a_numeric_value.arithmetic (Plus_token, a_sum.as_numeric_value)
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
							if not a_numeric_value.item_type.is_same_type (item_type) then
								last_evaluated_item := a_numeric_value.convert_to_type (item_type)
							else
								last_evaluated_item := a_numeric_value
							end
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
	
