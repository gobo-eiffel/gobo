indexing

	description:

		"Objects that map a sequence by replacing nodes with their typed values. Corresponds to fn:data()"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ATOMIZER_EXPRESSION

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			simplify, promote, sub_expressions, iterator, evaluate_item
		end

	XM_XPATH_MAPPING_FUNCTION

creation

	make

feature {NONE} -- Initialization

	make (a_sequence: XM_XPATH_EXPRESSION) is
			-- Establish invariant
		require
			sequence_not_void: a_sequence /= Void
		do
			base_expression := a_sequence
			compute_static_properties
			initialize
		ensure
			base_expression_set: base_expression = a_sequence
			static_properties_computed: are_static_properties_computed
		end

feature -- Access
	
	item_type: XM_XPATH_ITEM_TYPE is
			--Determine the data type of the expression, if possible
		do
			Result := type_factory.any_atomic_type
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
			Result.put_last (base_expression)
		end

feature -- Status report

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		do
			std.error.put_string (STRING_.appended_string (indentation (a_level), "atomize"))
			if is_error then
				std.error.put_string (" in error%N")
			else
				std.error.put_new_line
				base_expression.display (a_level + 1)
			end
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
			if base_expression.is_error then
				set_last_error (base_expression.error_value)
			else
				if base_expression.was_expression_replaced then
					set_base_expression (base_expression.replacement_expression)
				end
				if is_sub_type (base_expression.item_type, type_factory.any_atomic_type) then
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
				base_expression.promote (an_offer)
				if base_expression.was_expression_replaced then set_base_expression (base_expression.replacement_expression)
				end
			end
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		local
			a_node: XM_XPATH_NODE
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ATOMIC_VALUE]
		do
			base_expression.evaluate_item (a_context)
			if base_expression.last_evaluated_item = Void then
				last_evaluated_item := Void
			elseif base_expression.last_evaluated_item.is_error then
				last_evaluated_item := base_expression.last_evaluated_item
			else
				a_node ?= base_expression.last_evaluated_item
				if a_node = Void then
					last_evaluated_item := base_expression.last_evaluated_item
				else
					an_iterator := a_node.typed_value
					an_iterator.start
					last_evaluated_item :=  an_iterator.item
				end
			end
		end

	iterator (a_context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- Iterator over the values of a sequence
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			an_iterator := base_expression.iterator (a_context)
			if an_iterator.is_error then
				Result := an_iterator
			else
				create {XM_XPATH_MAPPING_ITERATOR} Result.make (an_iterator, Current, Void, Void)
			end
		end

	map (an_item: XM_XPATH_ITEM; a_context: XM_XPATH_CONTEXT; an_information_object: ANY): XM_XPATH_MAPPED_ITEM is
			-- Map `an_item' to a sequence
		local
			a_node: XM_XPATH_NODE
		do
			a_node ?= an_item
			if a_node /= Void then
				create Result.make_sequence (a_node.typed_value)
			else
				create Result.make_item (an_item)
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
			-- TODO - this changes when we allow nodes to contain sequences
			clone_cardinality (base_expression)
		end

invariant

	base_expression_not_void: base_expression /= Void

end

	
