indexing

	description:

		"Objects that implement the XSLT unparsed-entity-uri() function"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_UNPARSED_ENTITY_URI

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			simplify, pre_evaluate, evaluate_item
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "unparsed-entity-uri"; namespace_uri := Xpath_standard_functions_uri
			minimum_argument_count := 1
			maximum_argument_count := 1
			create arguments.make (2)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := type_factory.string_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		do
			create Result.make_single_string
		end

feature -- Optimization

	simplify is
			-- Perform context-independent static optimizations
		local
			a_function: XM_XSLT_UNPARSED_ENTITY_URI
		do
			Precursor
			if was_expression_replaced then
				a_function ?= replacement_expression
				if a_function /= Void then
					a_function.add_context_document_argument (1, "unparsed-entity-uri+")
				end
			else
				add_context_document_argument (1, "unparsed-entity-uri+")
				merge_dependencies (arguments.item (3).dependencies)
			end
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		do
			todo ("evaluate_item", False)
		end


	pre_evaluate (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Pre-evaluate `Current' at compile time.
		do
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end


end
	
