indexing

	description:

		"Expressions that reverse a sequence of nodes"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_REVERSER

inherit

	XM_XPATH_UNARY_EXPRESSION
		redefine
			compute_special_properties, promote, create_iterator, calculate_effective_boolean_value,
			is_reverser, as_reverser
		end

create

	make

feature {NONE} -- Initialization

	make (an_expression: XM_XPATH_EXPRESSION) is
			-- Establish invariant.
		require
			base_expression_not_replaced: an_expression /= Void	and then not an_expression.was_expression_replaced
		do
			make_unary (an_expression)
			compute_static_properties
		ensure
			base_expression_set: base_expression = an_expression
		end

feature -- Access

	is_reverser: BOOLEAN is
			-- Is `Current' a reverser?
		do
			Result := True
		end

	as_reverser: XM_XPATH_REVERSER is
			-- `Current' seen as a reverser
		do
			Result := Current
		end

feature -- Optimization

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

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Iterator over the values of a sequence
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			a_sequence_extent: XM_XPATH_SEQUENCE_EXTENT
		do
			base_expression.create_iterator (a_context)
			an_iterator := base_expression.last_iterator
			if an_iterator.is_error then
				last_iterator := an_iterator
			elseif an_iterator.is_reversible_iterator then
				last_iterator := an_iterator.as_reversible_iterator.reverse_iterator
			else
				create a_sequence_extent.make (an_iterator)
				last_iterator := a_sequence_extent.reverse_iterator
			end
		end

	calculate_effective_boolean_value (a_context: XM_XPATH_CONTEXT) is
			-- Effective boolean value
		do
			base_expression.calculate_effective_boolean_value (a_context)
			last_boolean_value := base_expression.last_boolean_value
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_special_properties is
			-- Compute special properties.
		do
			clone_special_properties (base_expression)
			if base_expression.reverse_document_order then
				reset_reverse_document_order
			elseif base_expression.ordered_nodeset then
				reset_ordered_nodeset
				set_reverse_document_order
			end
		end


feature {XM_XPATH_UNARY_EXPRESSION} -- Restricted
	
	display_operator: STRING is
			-- Format `operator' for display
		do
			Result := "reverse order"
		end

end
	
