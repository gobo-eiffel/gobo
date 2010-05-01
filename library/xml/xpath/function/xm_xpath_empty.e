note

	description:

		"Objects that implement the XPath empty() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_EMPTY

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			evaluate_item, calculate_effective_boolean_value, check_arguments,
			is_empty_function, as_empty_function
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "empty"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Empty_function_type_code
			minimum_argument_count := 1
			maximum_argument_count := 1
			create arguments.make (1)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	is_empty_function: BOOLEAN is
			-- Is `Current' XPath empty() function?
		do
			Result := True
		end

	as_empty_function: XM_XPATH_EMPTY is
			-- `Current' seen as XPath empty() function
		do
			Result := Current
		end

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := type_factory.boolean_type
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

feature -- Evaluation

	calculate_effective_boolean_value (a_context: XM_XPATH_CONTEXT) is
			-- Effective boolean value
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			arguments.item (1).create_iterator (a_context)
			an_iterator := arguments.item (1).last_iterator
			if an_iterator.is_error then
				create last_boolean_value.make (False)
				last_boolean_value.set_last_error (an_iterator.error_value)
			else
				an_iterator.start
				if an_iterator.is_error then
					create last_boolean_value.make (False)
					last_boolean_value.set_last_error (an_iterator.error_value)
				else
					create last_boolean_value.make (an_iterator.after)
				end
			end
		end

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item to `a_result'.
		do
			calculate_effective_boolean_value (a_context)
			a_result.put (last_boolean_value)
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

feature {XM_XPATH_FUNCTION_CALL} -- Local

	check_arguments (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Check arguments during parsing, when all the argument expressions have been read.
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			Precursor (a_replacement, a_context)
			if a_replacement.item = Void then
				create l_replacement.make (Void)
				arguments.item (1).set_unsorted (l_replacement, False)
				if arguments.item (1) /= l_replacement.item then
					arguments.replace (l_replacement.item, 1)
				end
			end
		end

end
	
