indexing

	description:

		"Objects that implement the XSLT current() function"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_CURRENT

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			pre_evaluate, evaluate_item, compute_intrinsic_dependencies,
			compute_special_properties, is_current_function
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "current"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Current_function_type_code
			minimum_argument_count := 0
			maximum_argument_count := 0
			create arguments.make (0)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := any_item
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		do
			-- will never be called
		end

	is_current_function: BOOLEAN is
			-- Is `Current' the XSLT "current()" function?
		do
			Result := True
		end

feature -- Status setting

	compute_intrinsic_dependencies is
			-- Determine the intrinsic dependencies of an expression.
		do
			set_intrinsically_depends_upon_current_item
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		local
			an_evaluation_context: XM_XSLT_EVALUATION_CONTEXT
			an_error: XM_XPATH_ERROR_VALUE
		do
			an_evaluation_context ?= a_context
			check
				evaluation_context: an_evaluation_context /= Void
				-- as this is an XSLT function
			end
			create an_error.make_from_string ("Current().should not be called at runtime, as it should have been promoted", Gexslt_eiffel_type_uri,  "CURRENT_PROMOTION", Dynamic_error)
			an_evaluation_context.transformer.report_fatal_error (an_error)
		end

	pre_evaluate (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Pre-evaluate `Current' at compile time.
		do
			--	do nothing
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over a node sequence
		do
			todo ("create_node_iterator", False)
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end
	
	compute_special_properties is
			-- Compute special properties.
		do
			initialize_special_properties
			set_ordered_nodeset
			set_context_document_nodeset
			set_single_document_nodeset
			set_non_creating
		end

end
	

