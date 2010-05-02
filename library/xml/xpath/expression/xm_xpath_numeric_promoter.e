note

	description:

	"Objects that promote numeric types"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
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

	make (a_sequence: XM_XPATH_EXPRESSION; a_required_type: INTEGER)
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

	is_numeric_promoter: BOOLEAN
			-- Is `Current' a numeric promoter?
		do
			Result := True
		end

	as_numeric_promoter: XM_XPATH_NUMERIC_PROMOTER
			-- `Current' seen as a numeric promoter
		do
			Result := Current
		end

	item_type: XM_XPATH_ITEM_TYPE
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

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN
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

	simplify (a_replacement: DS_CELL [XM_XPATH_EXPRESSION])
			-- Perform context-independent static optimizations.
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			base_expression.simplify (l_replacement)
			if base_expression /= l_replacement.item then
				set_base_expression (l_replacement.item)
			end
			if base_expression.is_error then
				set_replacement (a_replacement, base_expression)
			elseif base_expression.is_value and not base_expression.depends_upon_implicit_timezone then
				-- TODO: need a compile-time context
				create_iterator (Void)
				if last_iterator.is_error then
					set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make (last_iterator.error_value))
				else
					expression_factory.create_sequence_extent (last_iterator)
					set_replacement (a_replacement, expression_factory.last_created_closure)
				end
			else
				a_replacement.put (Current)
			end
		end

	check_static_type (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			base_expression.check_static_type (l_replacement, a_context, a_context_item_type)
			if base_expression /= l_replacement.item then
				set_base_expression (l_replacement.item)
			end
			if base_expression.is_error then
				set_replacement (a_replacement, base_expression)
			else
				a_replacement.put (Current)
			end
		end

	optimize (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE)
			-- Perform optimization of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			base_expression.optimize (l_replacement, a_context, a_context_item_type)
			if base_expression /= l_replacement.item then
				set_base_expression (l_replacement.item)
			end
			if base_expression.is_error then
				set_replacement (a_replacement, base_expression)
			else
				a_replacement.put (Current)
			end
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		do
			base_expression.evaluate_item (a_result, a_context)
			if a_result.item = Void or else a_result.item.is_error then
				-- nothing to do
			elseif a_result.item.is_atomic_value then
				promote_number (a_result)
			else
				a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Cannot numerically promote a node",
					Xpath_errors_uri, "XPTY0004", Type_error))
			end
		end

	create_iterator (a_context: XM_XPATH_CONTEXT)
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

	map (a_item: XM_XPATH_ITEM; a_context: XM_XPATH_CONTEXT)
			-- Map `an_item' to a sequence
		local
			l_result: DS_CELL [XM_XPATH_ITEM]
		do
			if a_item.is_error then
				create last_mapped_item.make_item (a_item)
			elseif a_item.is_atomic_value then
				create l_result.make (a_item.as_atomic_value)
				promote_number (l_result)
				create last_mapped_item.make_item (l_result.item)
			else
				create last_mapped_item.make_item (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Cannot numerically promote a node",
					Xpath_errors_uri, "XPTY0004", Dynamic_error))
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	display_operator: STRING
			-- Format `operator' for display
		do
			Result := "promote items to " + item_type.conventional_name
		end

feature {NONE} -- Implementation

	promote_number (a_result: DS_CELL [XM_XPATH_ITEM])
			-- Promote of `an_atomic_value'.
		require
			a_result_not_void: a_result /= Void
			a_result_contains_atomic_value: a_result.item.is_atomic_value
		local
			l_primitive_value: XM_XPATH_ATOMIC_VALUE
		do
			l_primitive_value := a_result.item.as_atomic_value.primitive_value
			if l_primitive_value.is_convertible (item_type) then
				l_primitive_value.convert_to_type (item_type)
				a_result.put (l_primitive_value.converted_value)
			else
				a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Cannot promote non-numeric value to " + item_type.conventional_name,
					Xpath_errors_uri, "XPTY0004", Dynamic_error))
			end
		ensure
			promotion_not_void: a_result.item /= Void
		end

end
