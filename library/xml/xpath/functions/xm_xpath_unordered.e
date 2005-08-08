indexing

	description:

		"Objects that implement the XPath unordered() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_UNORDERED

inherit

	XM_XPATH_COMPILE_TIME_FUNCTION
		redefine
			check_static_type, optimize, pre_evaluate, is_unordered_function, as_unordered_function
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "unordered"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := unordered_function_type_code
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

	is_unordered_function: BOOLEAN is
			-- Is `Current' XPath unordered() function?
		do
			Result := True
		end

	as_unordered_function: XM_XPATH_UNORDERED is
			-- `Current' seen as XPath unordered() function
		do
			Result := Current
		end

feature -- Optimization

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static type-checking of `Current' and its subexpressions.
		do
			mark_unreplaced
			Precursor (a_context)
			if not was_expression_replaced then
				arguments.item (1).set_unsorted (True)
				if arguments.item (1).was_expression_replaced then
					arguments.replace (arguments.item (1).replacement_expression, 1)
				end
			elseif replacement_expression.is_unordered_function then
				replacement_expression.as_unordered_function.arguments.item (1).set_unsorted (True)
			end
		end

	optimize (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform optimization of `Current' and its subexpressions.
		do
			mark_unreplaced
			Precursor (a_context)
			if not is_error and then not was_expression_replaced then
				arguments.item (1).set_unsorted (True)
				if arguments.item (1).was_expression_replaced then
					arguments.replace (arguments.item (1).replacement_expression, 1)
				end
			elseif replacement_expression.is_unordered_function then
				replacement_expression.as_unordered_function.arguments.item (1).set_unsorted (True)
			end
		end

feature -- Evaluation

	pre_evaluate (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Pre-evaluate `Current' at compile time.
		do
			set_replacement (arguments.item (1))
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		do
			create Result.make_any_sequence
		end

feature -- Optimization

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_zero_or_more
		end
		
end
	
