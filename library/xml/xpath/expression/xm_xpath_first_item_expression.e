indexing

	description:

		"Objects that return the first item in a sequence"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_FIRST_ITEM_EXPRESSION

inherit

	XM_XPATH_UNARY_EXPRESSION
		redefine
			optimize, promote, compute_cardinality, evaluate_item
		end

create

	make

feature {NONE} -- Initialization

	make (a_base_expression: XM_XPATH_EXPRESSION) is
			-- Establish invaraint.
		require
			base_expression_not_void: a_base_expression /= Void
		do
			make_unary (a_base_expression)
			compute_static_properties
		ensure
			static_properties_computed: are_static_properties_computed
			base_expression_set: base_expression = a_base_expression
		end

feature -- Optimization

	optimize (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform optimization of `Current' and its subexpressions.
		do
			mark_unreplaced
			base_expression.optimize (a_context, a_context_item_type)
			if base_expression.was_expression_replaced then
				set_base_expression (base_expression.replacement_expression)
			end
			if base_expression.is_error then
				set_last_error (base_expression.error_value)
			else
				if not base_expression.cardinality_allows_many then
					set_replacement (base_expression)
				end
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
				if not (an_offer.action = Unordered) then
					base_expression.promote (an_offer)
					if base_expression.was_expression_replaced then set_base_expression (base_expression.replacement_expression) end
				end
			end
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			base_expression.create_iterator (a_context)
			an_iterator := base_expression.last_iterator
			if an_iterator.is_error then
				create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make (an_iterator.error_value)
			else
				an_iterator.start
				if an_iterator.is_error then
					create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make (an_iterator.error_value)
				elseif not an_iterator.after then
					last_evaluated_item := an_iterator.item
				else
					last_evaluated_item := Void
				end
			end
		end

feature {XM_XPATH_UNARY_EXPRESSION} -- Restricted
	
	display_operator: STRING is
			-- Format `operator' for display
		do
			Result := "first item of"
		end

feature {NONE} -- Implementation
	
	compute_cardinality is
			-- Compute cardinality.
		do
			clone_cardinality (base_expression)
			set_cardinality_disallows_many
		end

end
