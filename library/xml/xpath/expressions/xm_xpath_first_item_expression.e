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

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			simplify, promote, sub_expressions,
			same_expression, compute_special_properties, evaluate_item
		end

creation

	make

feature {NONE} -- Initialization

	make (a_base_expression: XM_XPATH_EXPRESSION) is
			-- Establish invaraint.
		require
			base_expression_not_void: a_base_expression /= Void
		do
			base_expression := a_base_expression
			compute_static_properties
			initialize
		ensure
			static_properties_computed: are_static_properties_computed
			base_expression_set: base_expression = a_base_expression
		end

feature -- Access
	
	item_type: XM_XPATH_ITEM_TYPE is
			--Determine the data type of the expression, if possible
		do
			Result := base_expression.item_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	base_expression: XM_XPATH_EXPRESSION
			-- Base expression to be filtered

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (1)
			Result.set_equality_tester (expression_tester)
			Result.put (base_expression, 1)
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		local
			a_first_item_expression: XM_XPATH_FIRST_ITEM_EXPRESSION
		do
			a_first_item_expression ?= other
			if a_first_item_expression /= Void then
				Result := base_expression.same_expression (a_first_item_expression.base_expression)
			end
		end

feature -- Status report

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "first item of ")
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
			if base_expression.is_error then
				set_last_error (base_expression.error_value)
			else
				if base_expression.was_expression_replaced then
					base_expression := base_expression.replacement_expression
				end
				if not base_expression.cardinality_allows_many then
					set_replacement (base_expression)
				end
			end
		end

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of an expression and its subexpressions
		do
			mark_unreplaced
			base_expression.analyze (a_context)
			if base_expression.was_expression_replaced then
				base_expression := base_expression.replacement_expression
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
			an_iterator := base_expression.iterator (a_context)
			an_iterator.start
			if not an_iterator.after then
				last_evaluated_item := an_iterator.item
			else
				last_evaluated_item := Void
			end
		end

feature -- Element change

	set_base_expression (a_base_expression: XM_XPATH_EXPRESSION) is
			-- Set `base_expression'.
		require
			base_expression_not_void: a_base_expression /= Void
		do
			base_expression := a_base_expression
		ensure
			base_expression_cset: base_expression = a_base_expression
		end

feature {NONE} -- Implementation
	
	compute_cardinality is
			-- Compute cardinality.
		do
			clone_cardinality (base_expression)
			set_cardinality_disallows_many
		end

		
	compute_special_properties is
			-- Compute special properties.
		do
			set_special_properties (base_expression.special_properties)
		end


invariant

	base_expression_not_void: base_expression /= Void

end
