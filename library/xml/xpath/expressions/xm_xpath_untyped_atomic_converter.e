indexing

	description:

	"Objects that converts any xdt:untypedAtomic items in a sequence%
	%to a specified type, returning all other items unchanged"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_UNTYPED_ATOMIC_CONVERTER

inherit

	XM_XPATH_UNARY_EXPRESSION
		redefine
			item_type, analyze, evaluate_item, iterator
		end

	XM_XPATH_MAPPING_FUNCTION

creation

	make

feature {NONE} -- Initialization

	make (a_sequence: XM_XPATH_EXPRESSION; a_required_type: XM_XPATH_ITEM_TYPE) is
			-- Establish invariant.
		require
			sequence_not_void: a_sequence /= Void
			target_type_not_void: a_required_type /= Void
		do
			make_unary (a_sequence)
			target_type := a_required_type
			compute_static_properties
			initialize
		ensure
			static_properties_computed: are_static_properties_computed
			base_expression_set: base_expression = a_sequence
			target_type_set: target_type = a_required_type
			static_properties_computed: are_static_properties_computed
		end

feature -- Access
	
	item_type: XM_XPATH_ITEM_TYPE is
			-- Determine the data type of the expression, if possible
		do
			Result := target_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Optimization	

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of an expression and its subexpressions
		local
			a_type: XM_XPATH_ITEM_TYPE
			a_value: XM_XPATH_VALUE
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			an_extent: XM_XPATH_SEQUENCE_EXTENT
		do
			mark_unreplaced
			base_expression.analyze (a_context)
			if base_expression.was_expression_replaced then
				set_base_expression (base_expression.replacement_expression)
			end
			if base_expression.is_error then
				set_last_error (base_expression.error_value)
			else
				a_value ?= base_expression
				if a_value /= Void then
					an_iterator := iterator (Void)
					if an_iterator.is_error then
						set_last_error (an_iterator.error_value)
					else
						create an_extent.make (an_iterator)
						set_replacement (an_extent)
					end
				else
					a_type := base_expression.item_type
					if not is_sub_type (a_type, any_node_test) then
						if not (a_type = any_item or else a_type = type_factory.any_atomic_type or else a_type = type_factory.untyped_atomic_type) then
							
							-- The base_expression can't contain any untyped atomic values,
							--  so there's no need for a converter
							
							set_replacement (base_expression)
						end
					end
				end
			end
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		local
			an_untyped_atomic_value: XM_XPATH_UNTYPED_ATOMIC_VALUE
		do
			base_expression.evaluate_item (a_context)
			if base_expression.last_evaluated_item = Void then
				last_evaluated_item := Void
			elseif base_expression.last_evaluated_item.is_error then
				last_evaluated_item := base_expression.last_evaluated_item
			else
				an_untyped_atomic_value ?= base_expression.last_evaluated_item
				if an_untyped_atomic_value /= Void then
					last_evaluated_item := an_untyped_atomic_value.convert_to_type (target_type)
				else
					last_evaluated_item := base_expression.last_evaluated_item
				end
			end
		end

	iterator (a_context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- An iterator over the values of a sequence
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
			an_untyped_atomic_value: XM_XPATH_UNTYPED_ATOMIC_VALUE
		do
			an_untyped_atomic_value ?= an_item
			if an_untyped_atomic_value /= Void then
				create Result.make_item (an_untyped_atomic_value.convert_to_type (target_type))
			else
				create Result.make_item (an_item)
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted
	
	target_type: XM_XPATH_ITEM_TYPE
			-- Target type 

	display_operator: STRING is
			-- Format `operator' for display
		do
			Result := "convert untyped atomic items to " + target_type.conventional_name
		end

invariant

	target_type_not_void: target_type /= Void

end
