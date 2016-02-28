note

	description:

		"Objects that implement the XPath last() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_LAST

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			pre_evaluate, evaluate_item, compute_intrinsic_dependencies,
			is_last_function
		end

create

	make

feature {NONE} -- Initialization

	make
			-- Establish invariant
		do
			name := "last"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Last_function_type_code
			minimum_argument_count := 0
			maximum_argument_count := 0
			create arguments.make (0)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	is_last_function: BOOLEAN
			-- Is `Current' a last() function?
		do
			Result := True
		end

	item_type: XM_XPATH_ITEM_TYPE
			-- Determine the data type of the expression, if possible
		do
			Result := type_factory.integer_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE
			-- Type of argument number `argument_number'
		do

			-- This cannot be called for `Current', as it has no arguments.
			-- Therefore the pre-condition cannot be met, so we will not
			--  attempt to meet the post-condition.
			check False then end
		end

feature -- Status setting

	compute_intrinsic_dependencies
			-- Determine the intrinsic dependencies of an expression.
		do
			set_intrinsically_depends_upon_last
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		do
			if a_context.is_context_position_set then
				a_result.put (create {XM_XPATH_INTEGER_VALUE}.make_from_integer (a_context.last))
			else
				a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("The context position is undefined.", Xpath_errors_uri, "XPDY0002", Dynamic_error))
			end
		end

	pre_evaluate (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT)
			-- Pre-evaluate `Current' at compile time.
		do
			a_replacement.put (Current)
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

end

