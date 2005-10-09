indexing

	description:

		"Objects that implement the XPath distinct-values() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_DISTINCT_VALUES

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
			name := "distinct-values"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Distinct_values_function_type_code
			minimum_argument_count := 1
			maximum_argument_count := 2
			create arguments.make (2)
			arguments.set_equality_tester (expression_tester)
			initialized := True
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
				create Result.make_single_string
			end
		end

feature -- Evaluation

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- An iterator over the values of a sequence
		local
			an_atomic_comparer: XM_XPATH_ATOMIC_SORT_COMPARER
			a_sequence: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			an_atomic_comparer := atomic_sort_comparer (2, a_context)
			if an_atomic_comparer = Void then
				create {XM_XPATH_INVALID_ITERATOR} last_iterator.make_from_string ("Unsupported collation", Xpath_errors_uri, "FOCH0002", Dynamic_error)
			else
				arguments.item (1).create_iterator (a_context)
				a_sequence := arguments.item (1).last_iterator
				if a_sequence.is_error then
					last_iterator := a_sequence
				else
					create {XM_XPATH_DISTINCT_ITERATOR} last_iterator.make (a_sequence, an_atomic_comparer)
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
	
