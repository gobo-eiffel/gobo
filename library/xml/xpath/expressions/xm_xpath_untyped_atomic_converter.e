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
			item_type, check_static_type, evaluate_item, create_iterator, compute_special_properties
		end

	XM_XPATH_MAPPING_FUNCTION

create

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
			Result := common_super_type (target_type, base_expression.item_type)
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Optimization	

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			a_type: XM_XPATH_ITEM_TYPE
			a_value: XM_XPATH_VALUE
		do
			mark_unreplaced
			base_expression.check_static_type (a_context, a_context_item_type)
			if base_expression.was_expression_replaced then
				set_base_expression (base_expression.replacement_expression)
			end
			if base_expression.is_error then
				set_last_error (base_expression.error_value)
			elseif base_expression.is_value and then not base_expression.depends_upon_implicit_timezone then
				create_iterator (Void)
				if last_iterator.is_error then
					set_last_error (last_iterator.error_value)
				else
					expression_factory.create_sequence_extent (last_iterator)
					a_value := expression_factory.last_created_closure
					a_value.simplify
					if a_value.was_expression_replaced then
						set_replacement (a_value.replacement_expression)
					else
						set_replacement (a_value)
					end
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

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		local
			a_message: STRING
		do
			base_expression.evaluate_item (a_context)
			if base_expression.last_evaluated_item = Void then
				last_evaluated_item := Void
			elseif base_expression.last_evaluated_item.is_error then
				last_evaluated_item := base_expression.last_evaluated_item
			elseif base_expression.last_evaluated_item.is_untyped_atomic then
				if base_expression.last_evaluated_item.as_untyped_atomic.is_convertible (target_type) then
					last_evaluated_item := base_expression.last_evaluated_item.as_untyped_atomic.convert_to_type (target_type)
				else
					a_message := STRING_.concat ("Unable to convert an xdt:untypedAtomic value to type ", target_type.conventional_name)
					create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string (a_message, Xpath_errors_uri, "FORG0001", Type_error)
				end
			else
				last_evaluated_item := base_expression.last_evaluated_item
			end
		end

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- An iterator over the values of a sequence
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			base_expression.create_iterator (a_context)
			an_iterator := base_expression.last_iterator
			if an_iterator.is_error then
				last_iterator := an_iterator
			else
				create {XM_XPATH_MAPPING_ITERATOR} last_iterator.make (an_iterator, Current, Void)
			end
		end
	
	map (an_item: XM_XPATH_ITEM; a_context: XM_XPATH_CONTEXT) is
			-- Map `an_item' to a sequence
		local
			an_untyped_atomic_value: XM_XPATH_UNTYPED_ATOMIC_VALUE
			an_invalid_item: XM_XPATH_INVALID_ITEM
			a_message: STRING
		do
			if an_item.is_untyped_atomic then
				an_untyped_atomic_value := an_item.as_untyped_atomic
				if an_untyped_atomic_value.is_convertible (target_type) then
					create last_mapped_item.make_item (an_untyped_atomic_value.convert_to_type (target_type))
				else
					a_message := STRING_.concat ("Unable to convert an xdt:untypedAtomic value to type ", target_type.conventional_name)
					create an_invalid_item.make_from_string (a_message, Xpath_errors_uri, "FORG0001", Type_error)
					create last_mapped_item.make_item (an_invalid_item)
				end
			else
				create last_mapped_item.make_item (an_item)
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

	compute_special_properties is
			-- Compute special properties.
		do
			Precursor
			set_non_creating
		end

invariant

	target_type_not_void: initialized implies target_type /= Void

end
