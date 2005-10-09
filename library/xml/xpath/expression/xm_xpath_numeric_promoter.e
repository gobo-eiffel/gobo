indexing

	description:

	"Objects that promote numeric types"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_NUMERIC_PROMOTER

inherit

	XM_XPATH_UNARY_EXPRESSION
		redefine
			item_type, same_expression, simplify, check_static_type, optimize, evaluate_item,
			create_iterator, is_numeric_promoter, as_numeric_promoter
		end

	XM_XPATH_MAPPING_FUNCTION

create

	make

feature {NONE} -- Initialization

	make (a_sequence: XM_XPATH_EXPRESSION; a_required_type: INTEGER) is
			-- Establish invariant.
		require
			sequence_not_void: a_sequence /= Void
		do
			make_unary (a_sequence)
			required_type := a_required_type
			compute_static_properties
		ensure
			static_properties_computed: are_static_properties_computed
			base_expression_set: base_expression = a_sequence
			required_type_set: required_type = a_required_type
			static_properties_computed: are_static_properties_computed
		end

feature -- Access

	required_type: INTEGER
			-- Required type

	is_numeric_promoter: BOOLEAN is
			-- Is `Current' a numeric promoter?
		do
			Result := True
		end

	as_numeric_promoter: XM_XPATH_NUMERIC_PROMOTER is
			-- `Current' seen as a numeric promoter
		do
			Result := Current
		end
	
	item_type: XM_XPATH_ITEM_TYPE is
			-- Determine the data type of the expression, if possible
		do
			if required_type = Double_type_code then
				Result := type_factory.double_type
			else
				Result := type_factory.float_type
			end
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		local
			other_promoter: XM_XPATH_NUMERIC_PROMOTER
		do
			if other.is_numeric_promoter then
				other_promoter := other.as_numeric_promoter
				Result := base_expression.same_expression (other_promoter.base_expression) 
					and then other_promoter.required_type = required_type
			end
		end
	
feature -- Optimization	
	
	simplify is
			-- Perform context-independent static optimizations.
		do
			base_expression.simplify
			if base_expression.was_expression_replaced then
				set_base_expression (base_expression.replacement_expression)
			else
				if base_expression.is_value and then not base_expression.depends_upon_implicit_timezone then
					create_iterator (Void)
					if last_iterator.is_error then
						set_last_error (last_iterator.error_value)
					else
						expression_factory.create_sequence_extent (last_iterator)
						set_replacement (expression_factory.last_created_closure)
					end
				end
			end
		end

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		do
			mark_unreplaced
			base_expression.check_static_type (a_context, a_context_item_type)
			if base_expression.was_expression_replaced then
				set_base_expression (base_expression.replacement_expression)
			end
			if base_expression.is_error then
				set_last_error (base_expression.error_value)
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

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		do
			base_expression.evaluate_item (a_context)
			if base_expression.last_evaluated_item = Void then
				last_evaluated_item := Void
			elseif base_expression.last_evaluated_item.is_error then
				last_evaluated_item := base_expression.last_evaluated_item
			else
				if base_expression.last_evaluated_item.is_error then
					last_evaluated_item := base_expression.last_evaluated_item
				elseif base_expression.last_evaluated_item.is_atomic_value then
					promote_number (base_expression.last_evaluated_item.as_atomic_value)
				else
					create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Cannot numerically promote a node",
																				Xpath_errors_uri, "XPTY0004", Type_error)
				end
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
		do
			if an_item.is_error then
				last_evaluated_item := an_item
			elseif an_item.is_atomic_value then
				promote_number (an_item.as_atomic_value)
			else
				create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Cannot numerically promote a node",
																	  Xpath_errors_uri, "XPTY0004", Dynamic_error)
			end
			create last_mapped_item.make_item (last_evaluated_item)
		end

feature {XM_XPATH_EXPRESSION} -- Restricted
	
	display_operator: STRING is
			-- Format `operator' for display
		do
			Result := "promote items to " + item_type.conventional_name
		end

feature {NONE} -- Implementation

	promote_number (an_atomic_value: XM_XPATH_ATOMIC_VALUE) is
			-- Promote of `an_atomic_value'.
		require
			atomic_value_not_void: an_atomic_value /= Void
			no_previous_error: not is_error
		local
			a_primitive_value: XM_XPATH_ATOMIC_VALUE
		do
			a_primitive_value := an_atomic_value.primitive_value
			if a_primitive_value.is_convertible (item_type) then
				last_evaluated_item := a_primitive_value.convert_to_type (item_type)
			else
				create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Cannot promote non-numeric value to " + item_type.conventional_name,
													 Xpath_errors_uri, "XPTY0004", Dynamic_error)
			end
		ensure
			promotion_not_void: last_evaluated_item /= Void
		end

end
