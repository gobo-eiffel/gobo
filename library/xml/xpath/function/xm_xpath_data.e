indexing

	description:

		"Objects that implement the XPath data() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_DATA

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
			name := "data"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Data_function_type_code
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
			create Result.make_any_sequence
		end

feature -- Optimization

	simplify is
			-- Perform context-independent static optimizations
		local
			an_atomizer: XM_XPATH_ATOMIZER_EXPRESSION
			a_configuration: XM_XPATH_CONFIGURATION
		do

			-- TODO: the following line is not the right approach,
			--       but it will work fine until a schema-aware version

			create a_configuration.make_configuration
			create an_atomizer.make (arguments.item (1), a_configuration.are_all_nodes_untyped)
			an_atomizer.simplify
			if an_atomizer.was_expression_replaced then
				set_replacement (an_atomizer.replacement_expression)
			else
				set_replacement (an_atomizer)
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_zero_or_more
		end
		
end
	
