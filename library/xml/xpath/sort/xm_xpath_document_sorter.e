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
			simplify, analyze, compute_special_properties, promote, create_iterator,
			calculate_effective_boolean_value, is_document_sorter, as_document_sorter,
			item_type
		end

create

	make

feature {NONE} -- Initialization

	make (an_expression: XM_XPATH_EXPRESSION) is
		require
			expression_not_replaced: an_expression /= Void and then an_expression.are_static_properties_computed
				and then not an_expression.was_expression_replaced
		do
			make_unary (an_expression)
			if base_expression.context_document_nodeset or else base_expression.single_document_nodeset then
				create {XM_XPATH_LOCAL_ORDER_COMPARER} comparer
			else
				create {XM_XPATH_GLOBAL_ORDER_COMPARER} comparer
			end
			compute_static_properties
		end

feature -- Access

	comparer: XM_XPATH_NODE_ORDER_COMPARER
			-- Comparer

	is_document_sorter: BOOLEAN is
			-- Is `Current' a document sorter?
		do
			Result := True
		end

	as_document_sorter: XM_XPATH_DOCUMENT_SORTER is
			-- `Current' seen as a document sorter
		do
			Result := Current
		end

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, when known
		do
			if base_expression.was_expression_replaced and then base_expression.replacement_expression = Current then
				base_expression.mark_unreplaced
			end
			Result := base_expression.item_type
		end
feature -- Optimization

	simplify is
			-- Perform context-independent static optimizations.
		do
			base_expression.mark_unreplaced -- in case it's a path expression replaced by `Current'
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
			base_expression.mark_unreplaced -- in case it's a path expression replaced by `Current'
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
				base_expression.mark_unreplaced -- in case it's a path expression replaced by `Current'
				base_expression.promote (an_offer)
				if base_expression.was_expression_replaced then set_base_expression (base_expression.replacement_expression ) end
			end
		end

feature -- Evaluation

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Iterator over the values of a sequence
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			base_expression.create_iterator (a_context)
			an_iterator := base_expression.last_iterator
			if an_iterator.is_error then
				last_iterator := an_iterator
			else
				if an_iterator.is_node_iterator then
					create {XM_XPATH_DOCUMENT_ORDER_ITERATOR} last_iterator.make (an_iterator.as_node_iterator, comparer)
				else
					if an_iterator.is_empty_iterator then
						last_iterator := an_iterator
					else
						create {XM_XPATH_INVALID_ITERATOR} last_iterator.make_from_string ("Unexpected sequence", Gexslt_eiffel_type_uri, "NON_NODE_SEQUENCE", Dynamic_error)
					end
				end
			end
		end

	calculate_effective_boolean_value (a_context: XM_XPATH_CONTEXT) is
			-- Effective boolean value
		do
			base_expression.mark_unreplaced -- in case it's a path expression replaced by `Current'
			base_expression.calculate_effective_boolean_value (a_context)
			last_boolean_value := base_expression.last_boolean_value
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
	
