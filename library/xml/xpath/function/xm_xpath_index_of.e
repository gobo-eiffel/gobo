note

	description:

		"Objects that implement the XPath index-of() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_INDEX_OF

inherit

	XM_XPATH_SYSTEM_FUNCTION
		undefine
			pre_evaluate, check_static_type
		redefine
			create_iterator
		end

	XM_XPATH_COLLATING_FUNCTION
		undefine
			create_iterator
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "index-of"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Index_of_function_type_code
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
			Result := type_factory.integer_type
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
				create Result.make_single_atomic
			when 3 then
				create Result.make_single_string
			end
		end

feature -- Evaluation

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- An iterator over the values of a sequence
		local
			l_atomic_comparer: XM_XPATH_ATOMIC_COMPARER
			l_sequence: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_result: DS_CELL [XM_XPATH_ITEM]
		do
			l_atomic_comparer := atomic_comparer (3, a_context)
			if l_atomic_comparer = Void then
				create {XM_XPATH_INVALID_ITERATOR} last_iterator.make_from_string ("Unsupported collation", Xpath_errors_uri, "FOCH0002", Dynamic_error)
			else
				arguments.item (1).create_iterator (a_context)
				l_sequence := arguments.item (1).last_iterator
				if l_sequence.is_error then
					last_iterator := l_sequence
				else
					create l_result.make (Void)
					arguments.item (2).evaluate_item (l_result, a_context)
					check
						search_parameter_present: l_result.item.is_error or else l_result.item.is_atomic_value
						-- static typing
					end
					if l_result.item.is_error then
						create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (l_result.item.error_value)
					else
						create {XM_XPATH_INDEX_ITERATOR} last_iterator.make (l_sequence, l_result.item.as_atomic_value, l_atomic_comparer)
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
	
