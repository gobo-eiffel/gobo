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
			simplified_expression, promoted_expression, sub_expressions, iterator, evaluate_item
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
	
	item_type: INTEGER is
			--Determine the data type of the expression, if possible
		do
			Result := Atomic_type
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

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		do
			std.error.put_string (STRING_.appended_string (indentation (a_level), "atomize"))
			std.error.put_new_line
			base_expression.display (a_level + 1, a_pool)
		end

feature -- Optimization	

	simplified_expression: XM_XPATH_EXPRESSION is
			-- Simplified expression as a result of context-independent static optimizations
		local
			a_result_expression: XM_XPATH_ATOMIZER_EXPRESSION
			an_expression: XM_XPATH_EXPRESSION
		do
			a_result_expression := clone (Current)
			an_expression := base_expression.simplified_expression
			if an_expression.is_error then
				Result := an_expression
			else
				a_result_expression.set_base_expression (an_expression)
				Result := a_result_expression
			end
		end

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of an expression and its subexpressions
		do
			if base_expression.may_analyze then	base_expression.analyze (a_context) end
			if base_expression.is_error then
				set_last_error (base_expression.last_error)
			else
				if base_expression.was_expression_replaced then
					base_expression := base_expression.replacement_expression
				end
				if is_sub_type (base_expression.item_type, Atomic_type) then
					was_expression_replaced := True
					replacement_expression := base_expression
				end
			end
			set_analyzed
		end

	promoted_expression (an_offer: XM_XPATH_PROMOTION_OFFER): XM_XPATH_EXPRESSION is
			-- Offer promotion for `Current'
		local
			a_result_expression: XM_XPATH_ATOMIZER_EXPRESSION
		do
			an_offer.accept (Current)
			Result := an_offer.accepted_expression
			if Result = Void then
				a_result_expression := clone (Current)
				a_result_expression.set_base_expression (base_expression.promoted_expression (an_offer))
				Result := a_result_expression
			end
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		local
			a_mapped_item: XM_XPATH_MAPPED_ITEM
		do
				check
					not_a_sequence: cardinality_allows_zero_or_one
				end
			base_expression.evaluate_item (a_context)
			if base_expression.last_evaluated_item = Void then
				last_evaluated_item := Void
			elseif base_expression.last_evaluated_item.is_item_in_error then
				last_evaluated_item := base_expression.last_evaluated_item
			else
				a_mapped_item := map (base_expression.last_evaluated_item, a_context, Void)
				if a_mapped_item = Void then
					last_evaluated_item := Void
				elseif a_mapped_item.is_sequence then
					a_mapped_item.sequence.start
					last_evaluated_item := a_mapped_item.sequence.item
				else
					last_evaluated_item := a_mapped_item.item
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
			an_atomic_value: XM_XPATH_ATOMIC_VALUE
			a_sequence_value: XM_XPATH_SEQUENCE_VALUE
		do
			a_node ?= an_item
			if a_node /= Void then
				an_atomic_value ?= a_node.typed_value
				if an_atomic_value /= Void then
					create Result.make_item (an_atomic_value)
				else
					a_sequence_value ?= a_node.typed_value
					if a_sequence_value /= void then
						create Result.make_sequence (a_sequence_value.iterator (a_context))
					else
						Result := Void -- but I don't think this can happen, so
							check
								result_not_void: Result /= Void
							end
					end
				end
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
		ensure
			base_expression_set: base_expression = a_base_expression
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

	
