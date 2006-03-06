indexing

	description:

		"Objects that implement the XPath substring() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_SUBSTRING

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			evaluate_item
		end

	KL_IMPORTED_DOUBLE_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "substring"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Substring_function_type_code
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
			if argument_number = 1 then
				create Result.make_optional_string
			else
				create Result.make_single_number
			end
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		local
			a_string: STRING
			an_item: XM_XPATH_ITEM
			a_double_value: XM_XPATH_DOUBLE_VALUE
			a_starting_position, an_ending_position, a_count: INTEGER
		do
			last_evaluated_item := Void
			arguments.item (1).evaluate_item (a_context)
			if arguments.item (1).last_evaluated_item = Void then
				create {XM_XPATH_STRING_VALUE} last_evaluated_item.make ("")
			else
				a_string := arguments.item (1).last_evaluated_item.string_value
				arguments.item (2).evaluate_item (a_context)
				if arguments.item (2).last_evaluated_item /= Void and then arguments.item (2).last_evaluated_item.is_error then
					last_evaluated_item := arguments.item (2).last_evaluated_item
				else
					an_item := arguments.item (2).last_evaluated_item
					check
						second_argument_convertible_to_double: an_item.is_atomic_value and then	an_item.as_atomic_value.is_convertible (type_factory.double_type)
						-- static typing
					end
					a_double_value := an_item.as_atomic_value.convert_to_type (type_factory.double_type).as_double_value
					a_starting_position := DOUBLE_.truncated_to_integer (a_double_value.rounded_value.value)
					if arguments.count = 3 then
						arguments.item (3).evaluate_item (a_context)
						if arguments.item (3).last_evaluated_item.is_error then
							last_evaluated_item := arguments.item (3).last_evaluated_item
						else
							an_item := arguments.item (3).last_evaluated_item
							check
								third_argument_convertible_to_double: an_item.is_atomic_value and then an_item.as_atomic_value.is_convertible (type_factory.double_type)
								-- static typing
							end
							a_double_value := an_item.as_atomic_value.convert_to_type (type_factory.double_type).as_double_value
							a_count := DOUBLE_.truncated_to_integer (a_double_value.rounded_value.value)
							if a_count < 1 then
								a_count := 0
							end
							an_ending_position := a_count + a_starting_position - 1
							if an_ending_position > a_string.count then
								an_ending_position := a_string.count
							end
						end
					else
						an_ending_position := a_string.count
					end
				end
			end
			if last_evaluated_item = Void then
				if a_starting_position < 1 then a_starting_position := 1 end
				if an_ending_position < a_starting_position then
					create {XM_XPATH_STRING_VALUE} last_evaluated_item.make ("")
				else
					create {XM_XPATH_STRING_VALUE} last_evaluated_item.make (a_string.substring (a_starting_position, an_ending_position))
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

end
	
