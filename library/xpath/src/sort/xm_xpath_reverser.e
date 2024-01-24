note

	description:

		"Expressions that reverse a sequence of nodes"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_REVERSER

inherit

	XM_XPATH_UNARY_EXPRESSION
		redefine
			compute_special_properties, promote, create_iterator, calculate_effective_boolean_value,
			is_reverser, as_reverser, create_node_iterator
		end

create

	make

feature {NONE} -- Initialization

	make (a_expression: XM_XPATH_EXPRESSION)
			-- Establish invariant.
		require
			a_expression_not_void: a_expression /= Void
			a_expression_initialized: a_expression.are_static_properties_computed
		do
			make_unary (a_expression)
			compute_static_properties
		ensure
			base_expression_set: base_expression = a_expression
		end

feature -- Access

	is_reverser: BOOLEAN
			-- Is `Current' a reverser?
		do
			Result := True
		end

	as_reverser: XM_XPATH_REVERSER
			-- `Current' seen as a reverser
		do
			Result := Current
		end

feature -- Optimization

	promote (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_offer: XM_XPATH_PROMOTION_OFFER)
			-- Promote this subexpression.
		local
			l_promotion: detachable XM_XPATH_EXPRESSION
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			a_offer.accept (Current)
			l_promotion := a_offer.accepted_expression
			if l_promotion /= Void then
				set_replacement (a_replacement, l_promotion)
			else
				a_replacement.put (Current)
				create l_replacement.make (Void)
				base_expression.promote (l_replacement, a_offer)
				check postcondition_of_promote: attached l_replacement.item as l_replacement_item then
					if base_expression /= l_replacement_item then
						set_base_expression (l_replacement_item)
						reset_static_properties
					end
				end
			end
		end

feature -- Evaluation

	create_iterator (a_context: XM_XPATH_CONTEXT)
			-- Iterator over the values of a sequence
		local
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_sequence_extent: XM_XPATH_SEQUENCE_EXTENT
		do
			base_expression.create_iterator (a_context)
			check postcondition_of_create_iterator: attached base_expression.last_iterator as l_last_iterator then
				l_iterator := l_last_iterator
				if l_iterator.is_error then
					last_iterator := l_iterator
				elseif l_iterator.is_reversible_iterator then
					last_iterator := l_iterator.reverse_iterator
				else
					create l_sequence_extent.make (l_iterator)
					last_iterator := l_sequence_extent.reverse_iterator
				end
			end
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT)
			-- Iterator over a sequence of nodes
		local
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			l_sequence_extent: XM_XPATH_SEQUENCE_EXTENT
		do
			base_expression.create_node_iterator (a_context)
			check postcondition_create_node_iterator: attached base_expression.last_node_iterator as l_last_node_iterator then
				l_iterator := l_last_node_iterator
				if l_iterator.is_error then
					last_node_iterator := l_iterator
				elseif l_iterator.is_reversible_iterator then
					last_node_iterator := l_iterator.reverse_iterator
				else
					create l_sequence_extent.make (l_iterator)
					last_node_iterator := l_sequence_extent.reverse_iterator.as_node_iterator
				end
			end
		end


	calculate_effective_boolean_value (a_context: XM_XPATH_CONTEXT)
			-- Effective boolean value
		do
			base_expression.calculate_effective_boolean_value (a_context)
			last_boolean_value := base_expression.last_boolean_value
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_special_properties
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

	display_operator: STRING
			-- Format `operator' for display
		do
			Result := "reverse order"
		end

end

