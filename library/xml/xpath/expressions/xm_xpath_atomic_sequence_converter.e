indexing

	description:

	"Objects that perform a cast on each item in a sequence"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ATOMIC_SEQUENCE_CONVERTER

inherit

	XM_XPATH_UNARY_EXPRESSION
		redefine
			simplify, analyze, item_type, evaluate_item, iterator
		end

	XM_XPATH_MAPPING_FUNCTION

creation

	make

feature {NONE} -- Initialization

	make (a_sequence: XM_XPATH_EXPRESSION; a_required_type: XM_XPATH_ATOMIC_TYPE) is
			-- Establish invariant.
		require
			sequence_not_void: a_sequence /= Void
			required_type_not_void: a_required_type /= Void
		do
			make_unary (a_sequence)
			required_type := a_required_type
			compute_static_properties
			initialize
		ensure
			static_properties_computed: are_static_properties_computed
			base_expression_set: base_expression = a_sequence
			required_type_set: required_type = a_required_type
			static_properties_computed: are_static_properties_computed
		end

feature -- Access
	
	item_type: XM_XPATH_ITEM_TYPE is
			-- Determine the data type of the expression, if possible
		do
			Result := required_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Optimization	

	simplify is
			-- Perform context-independent static optimizations.
		local
			a_value: XM_XPATH_VALUE
			a_sequence_extent: XM_XPATH_SEQUENCE_EXTENT
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			base_expression.simplify
			if base_expression.is_error then
				set_last_error (base_expression.error_value)
			elseif base_expression.was_expression_replaced then
				set_base_expression (base_expression.replacement_expression)
			end
			a_value ?= base_expression
			if a_value /= Void then
				an_iterator := iterator (Void)
				if an_iterator.is_error then
					set_last_error (an_iterator.error_value)
				else
					create a_sequence_extent.make (an_iterator)
					set_replacement (a_sequence_extent)
				end
			end
		end

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of an expression and its subexpressions
		local
			a_cast_expression: XM_XPATH_CAST_EXPRESSION
		do
			mark_unreplaced
			base_expression.analyze (a_context)
			if base_expression.was_expression_replaced then
				set_base_expression (base_expression.replacement_expression)
			end
			if base_expression.is_error then
				set_last_error (base_expression.error_value)
			else
				if is_sub_type (base_expression.item_type, required_type) then
					set_replacement (base_expression)
				elseif not base_expression.cardinality_allows_many then
					create a_cast_expression.make (base_expression, required_type, base_expression.cardinality_allows_zero)
					-- TODO copy location
					a_cast_expression.set_parent (container)
					set_replacement (a_cast_expression)
				end
			end
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		local
			an_atomic_value: XM_XPATH_ATOMIC_VALUE
		do
			base_expression.evaluate_item (a_context)
			if base_expression.last_evaluated_item = Void then
				last_evaluated_item := Void
			elseif base_expression.last_evaluated_item.is_error then
				last_evaluated_item := base_expression.last_evaluated_item
			else
				an_atomic_value ?= base_expression.last_evaluated_item
				check
					atomic_value: an_atomic_value /= Void
				end
				last_evaluated_item := an_atomic_value.convert_to_type (required_type)
			end
		end

	iterator (a_context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- An iterator over the values of a base_expression
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
			-- Map `an_item' to a base_expression
		local
			an_atomic_value: XM_XPATH_ATOMIC_VALUE
		do
			an_atomic_value ?= an_item
			check
				atomic_value: an_atomic_value /= Void
			end
			create Result.make_item (an_atomic_value.convert_to_type (required_type))
		end

feature {XM_XPATH_EXPRESSION} -- Restricted
	
	required_type: XM_XPATH_ATOMIC_TYPE
			-- Target type 

	display_operator: STRING is
			-- Format `operator' for display
		do
			Result := "convert items to " + required_type.conventional_name
		end

invariant

	required_type_not_void: required_type /= Void

end
