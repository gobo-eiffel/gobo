indexing

	description:

		"Objects that implement the XPath reverse() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_REVERSE

inherit

	XM_XPATH_COMPILE_TIME_FUNCTION
		redefine
			simplify
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "reverse"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := reverse_function_type_code
			minimum_argument_count := 1
			maximum_argument_count := 1
			create arguments.make (1)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := arguments.item (1).item_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		do
			create Result.make_any_sequence
		end

feature -- Optimization

	simplify is
			-- Perform context-independent static optimizations
		local
			a_reverser: XM_XPATH_REVERSER
		do
			Precursor
			create a_reverser.make (arguments.item (1))
			set_replacement (a_reverser)
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_zero_or_more
		end
		
end
	
