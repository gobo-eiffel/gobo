indexing

	description:

		"Objects that implement the XPath round-half-to-even() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ROUND_HALF_EVEN

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			evaluate_item
		end

	MA_DECIMAL_MATH

	XM_XPATH_TOKENS

creation

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "round-half-to-even"
			minimum_argument_count := 1
			maximum_argument_count := 2
			create arguments.make (2)
			arguments.set_equality_tester (expression_tester)
			compute_static_properties
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
			an_atomic_value: XM_XPATH_ATOMIC_VALUE
			an_integer_value: XM_XPATH_INTEGER_VALUE
			a_numeric_value: XM_XPATH_NUMERIC_VALUE
			a_scale: INTEGER
			in_error: BOOLEAN
		do
			if arguments.count = 2 then
				arguments.item (2).evaluate_item (a_context)
				an_integer_value ?= arguments.item (2).last_evaluated_item
				check
					integer_precision: an_integer_value /= Void
					-- static typing
				end
				if an_integer_value.value.is_integer then
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
				if last_evaluated_item /= Void then
					an_atomic_value ?= last_evaluated_item
					check
						is_atomic: an_atomic_value /= Void
						-- static typing
					end
					a_numeric_value ?= an_atomic_value.primitive_value
					check
						is_numeric: a_numeric_value /= Void
						-- static typing
					end
					last_evaluated_item := a_numeric_value.rounded_half_even (a_scale)
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
	
