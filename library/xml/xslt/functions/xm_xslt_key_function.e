indexing

	description:

		"Objects that implement the XSLT key() function"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_KEY_FUNCTION

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			simplified_expression, compute_special_properties, iterator, pre_evaluate, check_arguments
		end

	XM_XPATH_MAPPING_FUNCTION

	XM_XPATH_SHARED_ANY_NODE_TEST

creation

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			key_fingerprint := -1
			name := "key"
			minimum_argument_count := 2
			maximum_argument_count := 2
			create arguments.make (3)
			arguments.set_equality_tester (expression_tester)
			compute_static_properties
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := any_node_test
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
				create Result.make_single_string
			when 2 then
				create Result.make_atomic_sequence
			end
		end

feature -- Optimization

	simplified_expression: XM_XPATH_EXPRESSION is
			-- Simplified expression as a result of context-independent static optimizations
		local
			result_expression: XM_XSLT_KEY_FUNCTION
			a_simplifier: XM_XPATH_ARGUMENT_SIMPLIFIER
		do
			result_expression ?= Precursor
			result_expression.add_context_document_argument (2, "key+")
			Result := result_expression
		end

feature -- Evaluation

	iterator (a_context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- Iterator over the values of a sequence
		do
			todo ("iterator", False)
		end

	pre_evaluate (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Pre-evaluate `Current' at compile time.
		do
			set_replacement (Current)
		end

	map (an_item: XM_XPATH_ITEM; a_context: XM_XPATH_CONTEXT; an_information_object: ANY): XM_XPATH_MAPPED_ITEM is
			-- Map `an_item' to a sequence
		do
			todo ("map", False)
		end

feature {XM_XPATH_FUNCTION_CALL} -- Restricted

	check_arguments (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Check arguments during parsing, when all the argument expressions have been read.
		local
			a_string_value: XM_XPATH_STRING_VALUE
			an_xslt_context: XM_XSLT_EXPRESSION_CONTEXT
		do
			Precursor (a_context)
			arguments.item (2).set_unsorted (False)
			a_string_value ?= arguments.item (1)
			if a_string_value /= Void then

				-- Common case, key name is supplied as a constant

				an_xslt_context ?= a_context
				check
					static_context_is_xslt_context: an_xslt_context /= Void
				end
				key_fingerprint := an_xslt_context.fingerprint (a_string_value.string_value, False)
				if key_fingerprint = -1 then
					todo ("check_arguments - issue a dynamic error", True)
				end
			else
				todo ("check_arguments - save namespace context", True)
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_zero_or_more
		end

	compute_special_properties is
			-- Compute special properties.
		do
			create special_properties.make (1, 6)
			are_special_properties_computed := True
			set_context_document_nodeset
			set_ordered_nodeset
		end

feature {NONE} -- Implementation

	key_fingerprint: INTEGER
			-- Fingerprint of key-name

end
	
