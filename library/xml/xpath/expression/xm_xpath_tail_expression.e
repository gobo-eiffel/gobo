indexing

	description:

		"Objects that represent a filter of the form EXPR[position() > n]"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TAIL_EXPRESSION

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			promote, compute_special_properties, sub_expressions, same_expression, create_iterator,
			is_tail_expression, as_tail_expression
		end

	KL_SHARED_PLATFORM

create

	make

feature {NONE} -- Initialization

	make (a_base_expression: XM_XPATH_EXPRESSION; a_start: INTEGER) is
			-- Establish invariant.
		require
			base_expression_not_void: a_base_expression /= Void
			strictly_positive_start: a_start > 0
		do
			base_expression := a_base_expression
			start := a_start
			compute_static_properties
			initialized := True
		ensure
			static_properties_computed: are_static_properties_computed
			base_expression_set: base_expression = a_base_expression
			start_set: start = a_start
		end
		
feature -- Access
	
	is_tail_expression: BOOLEAN is
			-- Is `Current' a tail expression?
		do
			Result := True
		end

	as_tail_expression: XM_XPATH_TAIL_EXPRESSION is
			-- `Current' seen as a tail expression
		do
			Result := Current
		end

	item_type: XM_XPATH_ITEM_TYPE is
			-- Determine the data type of the expression, if possible
		do
			Result := base_expression.item_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	base_expression: XM_XPATH_EXPRESSION
			-- Base expression to be filtered

	start: INTEGER
			--  Offset of first item within `base_expression' to be included

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
		do
			if other.is_tail_expression then
				Result := base_expression.same_expression (other.as_tail_expression.base_expression) and then start = other.as_tail_expression.start
			end
		end

feature -- Status report

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "tail ")
			a_string := STRING_.appended_string (a_string, start.out)
			std.error.put_string (a_string)
			std.error.put_new_line
			base_expression.display (a_level + 1)
		end

feature -- Optimization

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		do
			mark_unreplaced
			base_expression.check_static_type (a_context, a_context_item_type)
			if base_expression.was_expression_replaced then
				set_base_expression (base_expression.replacement_expression)
			end
		end

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

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Iterate over the values of a sequence
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			base_expression.create_iterator (a_context)
			an_iterator := base_expression.last_iterator
			if an_iterator.is_error then
				last_iterator := an_iterator
			elseif an_iterator.is_array_iterator then

				-- Hm. This is theoretically insufficient, but in practice memory will get
				--  exhausted before the problem manifests itself

				last_iterator := an_iterator.as_array_iterator.new_slice_iterator (start, Platform.Maximum_integer)
			else
				create {XM_XPATH_TAIL_ITERATOR} last_iterator.make (an_iterator, start)
			end
		end
	
feature -- Element change

	set_base_expression (a_base_expression: XM_XPATH_EXPRESSION) is
			-- Set `base_expression.
		require
			base_expression_not_void: a_base_expression /= Void
		do
			base_expression := a_base_expression
			if base_expression.was_expression_replaced then base_expression.mark_unreplaced end
		ensure
			base_expression_set: base_expression = a_base_expression
			base_expression_not_marked_for_replacement: not base_expression.was_expression_replaced
		end
	
feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			clone_cardinality (base_expression)
			cardinalities.put (True, 1) -- allow zero
		end

	compute_special_properties is
			-- Compute special properties.
		do
			clone_special_properties (base_expression)
		end

invariant

	strictly_positive_start: start > 0
	base_expression_not_void: base_expression /= Void

end
