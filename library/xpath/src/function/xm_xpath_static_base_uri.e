note

	description:

		"Objects that implement the XPath static-base-uri() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005-2015, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_STATIC_BASE_URI

inherit

	XM_XPATH_COMPILE_TIME_FUNCTION
		redefine
			pre_evaluate
		end

create

	make

feature {NONE} -- Initialization

	make
			-- Establish invariant
		do
			name := "static-base-uri"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Static_base_uri_function_type_code
			minimum_argument_count := 0
			maximum_argument_count := 0
			create arguments.make (0)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, where known
		do
			Result := type_factory.any_uri_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE
			-- Type of argument number `argument_number'
		do
			-- no arguments
			check False then end
		end

feature -- Evaluation

	pre_evaluate (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT)
			-- Pre-evaluate `Current' at compile time.
		do
			set_replacement (a_replacement, create {XM_XPATH_ANY_URI_VALUE}.make (a_context.base_uri.full_reference))
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		do

			-- Although the standard allows for an empty result, we never give one, so:

			set_cardinality_exactly_one
		end

end

