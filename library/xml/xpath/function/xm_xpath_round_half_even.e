indexing

	description:

		"Objects that implement the XPath round-half-to-even() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ROUND_HALF_EVEN

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			evaluate_item
		end

	XM_XPATH_TOKENS
		export {NONE} all end

	KL_SHARED_PLATFORM
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "round-half-to-even"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Round_half_to_even_function_type_code
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
			if argument_number = 1 then
				create Result.make_optional_number
			else
				create Result.make_single_integer
			end
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item to `a_result'.
		local
			l_integer_value: XM_XPATH_MACHINE_INTEGER_VALUE
			l_scale: INTEGER
			l_in_error: BOOLEAN
		do
			if arguments.count = 2 then
				arguments.item (2).evaluate_item (a_result, a_context)
				check
					integer_precision: a_result.item.is_machine_integer_value
					-- static typing
				end
				l_integer_value := a_result.item.as_machine_integer_value
				if l_integer_value.value.abs <= Platform.Maximum_integer then
					l_scale := l_integer_value.value.to_integer
				else
					l_in_error := True
					a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Precision specified in round-to-half-even is outside the supported range.", Gexslt_eiffel_type_uri,
						"PRECISION_OUT_OF_RANGE", Dynamic_error))
				end
			end
			if not l_in_error then
				a_result.put (Void)
				arguments.item (1).evaluate_item (a_result, a_context)
				if a_result.item /= Void and then not a_result.item.is_error then
					check
						is_atomic: a_result.item.is_atomic_value
						is_numeric: a_result.item.as_atomic_value.primitive_value.is_numeric_value
						-- static typing
					end
					a_result.put (a_result.item.as_atomic_value.primitive_value.as_numeric_value.rounded_half_even (l_scale))
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_optional
		end

end

