indexing

	description:

		"Objects that perform string conversion in XPath 1.0 compatibility mode"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_STRING_CONVERTER_EXPRESSION

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			simplify, promote, sub_expressions, evaluate_item, same_expression,
			is_string_converter_expression, as_string_converter_expression
		end

create

	make

feature {NONE} -- Initialization

	make (a_base_expression: XM_XPATH_EXPRESSION) is
			-- Establish invariant.
		require
			base_expression_not_void: a_base_expression /= Void
		do
			base_expression := a_base_expression
			compute_static_properties
			initialized := True
		ensure
			base_expression_set: base_expression = a_base_expression
			static_properties_computed: are_static_properties_computed			
		end

feature -- Access

	is_string_converter_expression: BOOLEAN is
			-- Is `Current' a string converter expression?
		do
			Result := True
		end

	as_string_converter_expression: XM_XPATH_STRING_CONVERTER_EXPRESSION is
			-- `Current' seen as a string converter expression
		do
			Result := Current
		end

	item_type: XM_XPATH_ITEM_TYPE is
			-- Determine the data type of the expression, if possible
		do
			Result := type_factory.string_type			
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	base_expression: XM_XPATH_EXPRESSION
			-- Base expression

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
			if other.is_string_converter_expression then
				Result := base_expression.same_expression (other.as_string_converter_expression.base_expression)
			end
		end

feature -- Status report

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "convert to string: ")
			std.error.put_string (a_string)
			std.error.put_new_line
			base_expression.display (a_level + 1)
		end

feature -- Optimization

	simplify is
			-- Perform context-independent static optimizations
		do
			base_expression.simplify
			if base_expression.is_error then
				set_last_error (base_expression.error_value)
			elseif base_expression.was_expression_replaced then
				set_base_expression (base_expression.replacement_expression)
			end
		end

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of an expression and its subexpressions
		do
			mark_unreplaced
			base_expression.analyze (a_context)
			if base_expression.was_expression_replaced then
				set_base_expression (base_expression.replacement_expression)
			end
			if base_expression.is_error then
				set_last_error (base_expression.error_value)
			else
				if base_expression.cardinality_exactly_one and then is_sub_type (base_expression.item_type, type_factory.string_type) then
						set_replacement (base_expression)
				end
			end
		end

	promote (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this subexpression.
		do
			base_expression.promote (an_offer)
			if base_expression.was_expression_replaced then set_base_expression (base_expression.replacement_expression) end
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		local
			a_sequence_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			base_expression.create_iterator (a_context)
			a_sequence_iterator := base_expression.last_iterator
			if a_sequence_iterator.is_error then
				create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make (a_sequence_iterator.error_value)
			else
				a_sequence_iterator.start
				if a_sequence_iterator.is_error then
					create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make (a_sequence_iterator.error_value)
				elseif not a_sequence_iterator.after then
					create {XM_XPATH_STRING_VALUE} last_evaluated_item.make (a_sequence_iterator.item.string_value)
				else
					create {XM_XPATH_STRING_VALUE} last_evaluated_item.make ("")
				end
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
			base_expression_set: base_expression = a_base_expression
		end
			
feature {NONE} -- Implementation
	
	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

invariant

	base_expression_not_void: base_expression /= Void

end

	
