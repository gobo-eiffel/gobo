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

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		local
			an_item: XM_XPATH_ITEM
			an_integer_value: XM_XPATH_MACHINE_INTEGER_VALUE
			a_scale: INTEGER
			in_error: BOOLEAN
		do
			if arguments.count = 2 then
				arguments.item (2).evaluate_item (a_context)
				an_item := arguments.item (2).last_evaluated_item
				check
					integer_precision: an_item.is_machine_integer_value
					-- static typing
				end
				an_integer_value := an_item.as_machine_integer_value
				if an_integer_value.value.abs <= Platform.Maximum_integer then
					a_scale := an_integer_value.value.to_integer
				else
					in_error := True
					create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Precision specified in round-to-half-even is outside the supported range.", Gexslt_eiffel_type_uri,
																												"PRECISION_OUT_OF_RANGE", Dynamic_error)
				end
			end
			if not in_error then
				arguments.item (1).evaluate_item (a_context)
				last_evaluated_item := arguments.item (1).last_evaluated_item
				if last_evaluated_item /= Void and then not last_evaluated_item.is_error then
					check
						is_atomic: last_evaluated_item.is_atomic_value
						is_numeric: last_evaluated_item.as_atomic_value.primitive_value.is_numeric_value
						-- static typing
					end
					last_evaluated_item := last_evaluated_item.as_atomic_value.primitive_value.as_numeric_value.rounded_half_even (a_scale)
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
			set_cardinality_optional
		end

end

