indexing

	description:

		"Objects that implement the XPath insert-before() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
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
			a_base_iterator, an_insertion_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			an_insert_position: INTEGER
			an_integer_value: XM_XPATH_INTEGER_VALUE
			an_item: XM_XPATH_ITEM
		do
			arguments.item (1).create_iterator (a_context)
			a_base_iterator := arguments.item (1).last_iterator
			if a_base_iterator.is_error then
				last_iterator := a_base_iterator
			else
				arguments.item (3).create_iterator (a_context)
				an_insertion_iterator := arguments.item (3).last_iterator
				if an_insertion_iterator.is_error then
					last_iterator := an_insertion_iterator
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
							insertion_position_is_integer: an_item.is_integer_value
							-- Static typing
						end
						an_integer_value := an_item.as_integer_value
						if an_integer_value.is_platform_integer then
							an_insert_position := an_integer_value.as_integer
							create {XM_XPATH_INSERT_ITERATOR} last_iterator.make (a_base_iterator, an_insertion_iterator, an_insert_position)
						else
							create {XM_XPATH_INVALID_ITERATOR} last_iterator.make_from_string ("Position exceeds maximum platform integer", Gexslt_eiffel_type_uri, "MAX-INTEGER", Dynamic_error)
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
	
