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

		XM_XPATH_COMPUTED_EXPRESSION
		redefine
			simplify, compute_special_properties, sub_expressions, promote, iterator, effective_boolean_value
		end

creation

	make

feature {NONE} -- Initialization

	make (an_expression: XM_XPATH_EXPRESSION) is
		require
			expression_not_void: an_expression /= Void and then an_expression.are_static_properties_computed
		do
			base_expression := an_expression
			if base_expression.context_document_nodeset then
				-- TODO - comparer
				todo ("make", True)
			else
				-- TODO - comparer
				todo ("make", True)
			end
			compute_static_properties
		end

feature -- Access

	base_expression: XM_XPATH_EXPRESSION
			-- Base expression

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := base_expression.item_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (1)
			Result.set_equality_tester (expression_tester)
			Result.put (base_expression, 1)
		end

feature -- Status report

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "Sort into Document Order")
			std.error.put_string (a_string)
			if is_error then
				std.error.put_string (" in error%N")
			else
				std.error.put_new_line
				base_expression.display (a_level + 1)
			end
		end

feature -- Optimization

	simplify is
			-- Perform context-independent static optimizations.
		do
			base_expression.simplify
			if base_expression.was_expression_replaced then
				set_base_expression (base_expression.replacement_expression)
			end			
		end

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of `Current' and its subexpressions
		local
			an_expression: XM_XPATH_EXPRESSION
		do
			mark_unreplaced
			base_expression.analyze (a_context)
			if base_expression.was_expression_replaced then
				set_base_expression (base_expression.replacement_expression)
			end
			if base_expression.is_error then
				set_last_error (base_expression.error_value)
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
		do
			create {XM_XPATH_INVALID_ITERATOR} Result.make_from_string ("TODO", "XP0001", Static_error) -- TODO
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
	
feature {XM_XPATH_DOCUMENT_SORTER} -- Local

	set_base_expression (an_expression: XM_XPATH_EXPRESSION) is
			-- Set `base_expression'.
		require
			expression_not_void: an_expression /= Void
		do
			base_expression := an_expression
			if base_expression.was_expression_replaced then base_expression.mark_unreplaced end
		ensure
			set: base_expression = an_expression
			base_expression_not_marked_for_replacement: not base_expression.was_expression_replaced
		end

feature {NONE} -- Implementation
	
	compute_cardinality is
			-- Compute cardinality.
		do
			clone_cardinality (base_expression)
		end

invariant

	base_expression_not_void: base_expression /= Void

end
	
