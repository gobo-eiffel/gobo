indexing

	description:

		"Objects that implement the XPath subsequence() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_SUBSEQUENCE

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			simplify, create_iterator
		end

	XM_XPATH_SHARED_ANY_ITEM_TYPE
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "subsequence"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Subsequence_function_type_code
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
			Result := any_item
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
				create Result.make_single_double
			when 3 then
				create Result.make_single_double
			end
		end

feature -- Optimization

	simplify is
		do
			clone_special_properties (arguments.item (1))
			Precursor
		end

feature -- Evaluation

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- An iterator over the values of a sequence
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			an_item: XM_XPATH_ITEM
			a_double_value: XM_XPATH_DOUBLE_VALUE
			a_starting_location, a_final_position, a_length: INTEGER
		do
			arguments.item (1).create_iterator (a_context)
			an_iterator := arguments.item (1).last_iterator
			if an_iterator.is_error then
				last_iterator := an_iterator
			elseif an_iterator.is_empty_iterator then
				last_iterator := an_iterator
			else
				arguments.item (2).evaluate_item (a_context)
				an_item := arguments.item (2).last_evaluated_item
				check
					item_not_void: an_item /= Void
					-- static typing
				end
				if an_item.is_error then
					create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (an_item.error_value)
				else
					check
						starting_location_is_double: an_item.is_double_value
						-- Static typing
					end
					a_double_value := an_item.as_double_value.rounded_value
					a_starting_location := a_double_value.as_integer
					if arguments.count = 2 then
						if a_starting_location <= 1 then
							last_iterator := an_iterator
						elseif an_iterator.is_node_iterator then
							create {XM_XPATH_NODE_TAIL_ITERATOR} last_iterator.make (an_iterator.as_node_iterator, a_starting_location)
						else
							create {XM_XPATH_TAIL_ITERATOR} last_iterator.make (an_iterator, a_starting_location)
						end
					else
						arguments.item (3).evaluate_item (a_context)
						an_item := arguments.item (3).last_evaluated_item
						check
							item_not_void: an_item /= Void
							-- static typing
						end
						if an_item.is_error then
							create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (an_item.error_value)
						else
							check
								length_is_double: an_item.is_double_value
								-- Static typing
							end
							a_double_value := an_item.as_double_value.rounded_value
							a_length := a_double_value.as_integer
							a_final_position := a_length + a_starting_location - 1
							if a_starting_location <= 1 then a_starting_location := 1 end
							create {XM_XPATH_POSITION_ITERATOR} last_iterator.make (an_iterator, a_starting_location, a_final_position)
						end
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
	
