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

	XM_XPATH_UNARY_EXPRESSION
		redefine
			item_type, simplify, analyze, iterator, evaluate_item, compute_cardinality, compute_special_properties
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
			make_unary (a_sequence)
			compute_static_properties
			initialize
		ensure
			base_expression_set: base_expression = a_sequence
			static_properties_computed: are_static_properties_computed
		end

feature -- Access
	
	item_type: XM_XPATH_ITEM_TYPE is
			--Determine the data type of the expression, if possible
		local
			an_atomic_type: XM_XPATH_ATOMIC_TYPE 
		do
			Result := base_expression.item_type
			an_atomic_type ?= Result
			if an_atomic_type = Void then
				Result := type_factory.any_atomic_type -- best guess
			end			
		end

feature -- Optimization	

	simplify is
			-- Perform context-independent static optimizations
		local
			an_atomic_value: XM_XPATH_ATOMIC_VALUE
			a_value: XM_XPATH_VALUE
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			finished: BOOLEAN
			a_node: XM_XPATH_NODE
		do
			base_expression.simplify
			if base_expression.is_error then
				set_last_error (base_expression.error_value)
			elseif base_expression.was_expression_replaced then
				set_base_expression (base_expression.replacement_expression)
			end
			an_atomic_value ?= base_expression
			if an_atomic_value /= Void then
				set_replacement (an_atomic_value)
			else
				a_value ?= base_expression
				if a_value /= Void then
					from
						an_iterator := base_expression.iterator (Void)
						if an_iterator.is_error then
							finished := True
							set_last_error (an_iterator.error_value)
						else
							an_iterator.start
						end
					until
						finished or else an_iterator.after
					loop

						-- If all items in the sequence are atomic (they generally will be, since this is
						--  done at compile time), then return the sequence.
						a_node ?= an_iterator.item
						if a_node /= Void then
							finished := True
						else
							an_iterator.forth
						end
					end
					if not finished then
						set_replacement (base_expression)
					end
				end
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
				reset_static_properties
				if is_sub_type (base_expression.item_type, type_factory.any_atomic_type) then
					set_replacement (base_expression)
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

feature {XM_XPATH_UNARY_EXPRESSION} -- Restricted
	
	display_operator: STRING is
			-- Format `operator' for display
		do
			Result := "atomize"
		end

	
feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_zero_or_more -- TODO: we can do better than this
		end

	compute_special_properties is
			-- Compute special properties.
		do
			Precursor
			set_non_creating
		end

end

	
