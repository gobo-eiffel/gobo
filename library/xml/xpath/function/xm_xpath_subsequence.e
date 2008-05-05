indexing

	description:

		"Objects that implement the XPath subsequence() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_SUBSEQUENCE

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			simplify, create_iterator, create_node_iterator
		end

	XM_XPATH_SHARED_ANY_ITEM_TYPE
		export {NONE} all end

	KL_SHARED_PLATFORM
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

	simplify (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]) is
		do
			clone_special_properties (arguments.item (1))
			Precursor (a_replacement)
		end

feature -- Evaluation

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create iterator over the values of a sequence.
		local
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_item: XM_XPATH_ITEM
			l_double_value: XM_XPATH_DOUBLE_VALUE
			l_starting_location, l_final_position, l_length: INTEGER
			l_result: DS_CELL [XM_XPATH_ITEM]
		do
			last_iterator := Void
			arguments.item (1).create_iterator (a_context)
			l_iterator := arguments.item (1).last_iterator
			if l_iterator.is_error then
				last_iterator := l_iterator
			elseif l_iterator.is_empty_iterator then
				last_iterator := l_iterator
			else
				create l_result.make (Void)
				arguments.item (2).evaluate_item (l_result, a_context)
				l_item := l_result.item
				if l_item = Void then
					create {XM_XPATH_INVALID_ITERATOR} last_iterator.make_from_string ("() is not allowed as the second argument for subsequence()",	Xpath_errors_uri, "XPTY0004", Type_error)
				elseif l_item.is_error then
					create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (l_item.error_value)
				else
					check
						starting_location_is_double: l_item.is_double_value
						-- Static typing
					end
					l_double_value := l_item.as_double_value.rounded_value
					if l_double_value.is_platform_integer then
						l_starting_location := l_double_value.as_integer
					else
						if l_double_value.value > Platform.Maximum_integer then
							create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_iterator.make
						elseif l_double_value.value <= 0 then
							l_starting_location := 1
						end
					end
					if last_iterator = Void then
						if arguments.count = 2 then
							if l_starting_location <= 1 then
								last_iterator := l_iterator
							elseif l_iterator.is_node_iterator then
								create {XM_XPATH_NODE_TAIL_ITERATOR} last_iterator.make (l_iterator.as_node_iterator, l_starting_location)
							else
								create {XM_XPATH_TAIL_ITERATOR} last_iterator.make (l_iterator, l_starting_location)
							end
						else
							create l_result.make (Void)
							arguments.item (3).evaluate_item (l_result, a_context)
							l_item := l_result.item
							if l_item = Void then
								create {XM_XPATH_INVALID_ITERATOR} last_iterator.make_from_string ("() is not allowed as the third argument for subsequence()", Xpath_errors_uri, "XPTY0004", Type_error)
							elseif l_item.is_error then
								create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (l_item.error_value)
							else
								check
									length_is_double: l_item.is_double_value
									-- Static typing
								end
								l_double_value := l_item.as_double_value.rounded_value
								if l_double_value.is_platform_integer then
									l_length := l_double_value.as_integer
									l_final_position := l_length + l_starting_location - 1
								else
									if l_double_value.value > Platform.Maximum_integer then
										l_final_position := Platform.Maximum_integer
									else
										create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_iterator.make
									end
								end
								if last_iterator = Void then
									if l_starting_location <= 1 then
										l_starting_location := 1
									end
									if l_final_position < l_starting_location then
										create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_iterator.make
									else
										last_iterator := expression_factory.created_position_iterator (l_iterator, l_starting_location, l_final_position)
									end
								end
							end
						end
					end
				end
			end
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over a node sequence
		local
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			l_item: XM_XPATH_ITEM
			l_double_value: XM_XPATH_DOUBLE_VALUE
			l_starting_location, l_final_position, l_length: INTEGER
			l_result: DS_CELL [XM_XPATH_ITEM]
		do
			last_node_iterator := Void
			arguments.item (1).create_node_iterator (a_context)
			l_iterator := arguments.item (1).last_node_iterator
			if l_iterator.is_error then
				last_node_iterator := l_iterator
			elseif l_iterator.is_empty_iterator then
				last_node_iterator := l_iterator
			else
				create l_result.make (Void)
				arguments.item (2).evaluate_item (l_result, a_context)
				l_item := l_result.item
				if l_item = Void then
					create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make_from_string ("() is not allowed as the second argument for subsequence()",	Xpath_errors_uri, "XPTY0004", Type_error)
				elseif l_item.is_error then
					create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make (l_item.error_value)
				else
					check
						starting_location_is_double: l_item.is_double_value
						-- Static typing
					end
					l_double_value := l_item.as_double_value.rounded_value
					if l_double_value.is_platform_integer then
						l_starting_location := l_double_value.as_integer
					else
						if l_double_value.value > Platform.Maximum_integer then
							create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_node_iterator.make
						elseif l_double_value.value <= 0 then
							l_starting_location := 1
						end
					end
					if last_node_iterator = Void then
						if arguments.count = 2 then
							if l_starting_location <= 1 then
								last_node_iterator := l_iterator
							else
								create {XM_XPATH_NODE_TAIL_ITERATOR} last_node_iterator.make (l_iterator, l_starting_location)
							end
						else
							create l_result.make (Void)
							arguments.item (3).evaluate_item (l_result, a_context)
							l_item := l_result.item
							if l_item = Void then
								create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make_from_string ("() is not allowed as the third argument for subsequence()", Xpath_errors_uri, "XPTY0004", Type_error)
							elseif l_item.is_error then
								create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make (l_item.error_value)
							else
								check
									length_is_double: l_item.is_double_value
									-- Static typing
								end
								l_double_value := l_item.as_double_value.rounded_value
								if l_double_value.is_platform_integer then
									l_length := l_double_value.as_integer
									l_final_position := l_length + l_starting_location - 1
								else
									if l_double_value.value > Platform.Maximum_integer then
										l_final_position := Platform.Maximum_integer
									else
										create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_node_iterator.make
									end
								end
								if last_node_iterator = Void then
									if l_starting_location <= 1 then
										l_starting_location := 1
									end
									if l_final_position < l_starting_location then
										create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_node_iterator.make
									else
										last_node_iterator := expression_factory.created_position_iterator (l_iterator, l_starting_location, l_final_position).as_node_iterator
									end
								end
							end
						end
					end
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_zero_or_more
		end

end

