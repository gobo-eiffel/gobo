indexing

	description:

		"Objects that sort a sequence of nodes into document order"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_DOCUMENT_SORTER

inherit

	XM_XPATH_UNARY_EXPRESSION
		redefine
			simplify, analyze, compute_special_properties, promote, iterator, effective_boolean_value
		end

creation

	make

feature {NONE} -- Initialization

	make (an_expression: XM_XPATH_EXPRESSION) is
		require
			expression_not_void: an_expression /= Void and then an_expression.are_static_properties_computed
		do
			make_unary (an_expression)
			if base_expression.context_document_nodeset or else base_expression.single_document_nodeset then
				create {XM_XPATH_LOCAL_ORDER_COMPARER} comparer
			else
				create {XM_XPATH_GLOBAL_ORDER_COMPARER} comparer
			end
			compute_static_properties
			initialize
		end

feature -- Access

	comparer: XM_XPATH_NODE_ORDER_COMPARER
			-- Comparer
	
feature -- Optimization

	simplify is
			-- Perform context-independent static optimizations.
		do
			base_expression.simplify
			if base_expression.was_expression_replaced then
				set_base_expression (base_expression.replacement_expression)
			end
			if base_expression.is_error then
				set_last_error (base_expression.error_value)
			elseif base_expression.ordered_nodeset then
				set_replacement (base_expression)
			end
		end

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of `Current' and its subexpressions
		do
			mark_unreplaced
			base_expression.analyze (a_context)
			if base_expression.was_expression_replaced then
				set_base_expression (base_expression.replacement_expression)
			end
			if base_expression.is_error then
				set_last_error (base_expression.error_value)
			elseif base_expression.ordered_nodeset then
				set_replacement (base_expression)
			end
		end

	promote (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this subexpression.
		local
			a_promotion: XM_XPATH_EXPRESSION
		do
			an_offer.accept (Current)
			a_promotion := an_offer.accepted_expression
			if a_promotion /= Void then
				set_replacement (a_promotion)
			else
				base_expression.promote (an_offer)
				if base_expression.was_expression_replaced then set_base_expression (base_expression.replacement_expression ) end
			end
		end

feature -- Evaluation

	iterator (a_context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- Iterator over the values of a sequence
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			a_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			an_empty_iterator: XM_XPATH_EMPTY_ITERATOR [XM_XPATH_ITEM]
		do
			an_iterator := base_expression.iterator (a_context)
			a_node_iterator ?= an_iterator
			if a_node_iterator /= Void then
				create {XM_XPATH_DOCUMENT_ORDER_ITERATOR} Result.make (a_node_iterator, comparer)
			else
				an_empty_iterator ?= an_iterator
				if an_empty_iterator /= Void then
					Result := an_empty_iterator
				else
					create {XM_XPATH_INVALID_ITERATOR} Result.make_from_string ("Unexpected sequence", Gexslt_eiffel_type_uri, "NNON_NODE_SEQUENCE", Dynamic_error)
				end
			end
		end

	effective_boolean_value (a_context: XM_XPATH_CONTEXT): XM_XPATH_BOOLEAN_VALUE is
			-- Effective boolean value
		do
			Result := base_expression.effective_boolean_value (a_context)
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_special_properties is
			-- Compute special properties.
		do
			clone_special_properties (base_expression)
			set_ordered_nodeset
		end
	
	display_operator: STRING is
			-- Format `operator' for display
		do
			Result := "sort unique"
		end

end
	
