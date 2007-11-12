indexing

	description:

		"Objects that implement the XPath insert-before() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_INSERT_BEFORE

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			create_iterator
		end
	
	XM_XPATH_SHARED_ANY_ITEM_TYPE
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "insert-before"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Insert_before_function_type_code
			minimum_argument_count := 3
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
				create Result.make_single_integer
			when 3 then
				create Result.make_any_sequence
			end
		end

feature -- Evaluation

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- An iterator over the values of a sequence
		local
			l_base_iterator, l_insertion_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_insert_position: INTEGER
			l_integer_value: XM_XPATH_MACHINE_INTEGER_VALUE
			l_result: DS_CELL [XM_XPATH_ITEM]
		do
			arguments.item (1).create_iterator (a_context)
			l_base_iterator := arguments.item (1).last_iterator
			if l_base_iterator.is_error then
				last_iterator := l_base_iterator
			else
				arguments.item (3).create_iterator (a_context)
				l_insertion_iterator := arguments.item (3).last_iterator
				if l_insertion_iterator.is_error then
					last_iterator := l_insertion_iterator
				else
					create l_result.make (Void)
					arguments.item (2).evaluate_item (l_result, a_context)
					check
						item_not_void: l_result.item /= Void
						-- static typing
					end
					if l_result.item.is_error then
						create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (l_result.item.error_value)
					else
						check
							insertion_position_is_integer: l_result.item.is_machine_integer_value
							-- Static typing
						end
						l_integer_value := l_result.item.as_machine_integer_value
						if l_integer_value.is_platform_integer then
							l_insert_position := l_integer_value.value.to_integer
							if l_insert_position < 1 then
								l_insert_position := 1
							end
							create {XM_XPATH_INSERT_ITERATOR} last_iterator.make (l_base_iterator, l_insertion_iterator, l_insert_position)
						else
							create {XM_XPATH_INVALID_ITERATOR} last_iterator.make_from_string ("Position exceeds maximum platform integer", Gexslt_eiffel_type_uri, "MAX-INTEGER", Dynamic_error)
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
	
