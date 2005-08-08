indexing

	description:

		"XPath castable as Expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_CASTABLE_EXPRESSION

inherit

	XM_XPATH_UNARY_EXPRESSION
		redefine
			simplify, item_type, check_static_type, optimize, same_expression, evaluate_item,
			calculate_effective_boolean_value, compute_cardinality, compute_special_properties,
			is_castable_expression, as_castable_expression
		end

	XM_XPATH_TYPE

	XM_XPATH_ROLE

create

	make

feature {NONE} -- Initialization

	make (a_source: XM_XPATH_EXPRESSION; a_target: XM_XPATH_SEQUENCE_TYPE) is
			-- Establish invariant
		do
			make_unary (a_source)
			target_type := a_target.primary_type
			is_empty_allowed := a_target.cardinality = Required_cardinality_optional 
			compute_static_properties
		ensure
			base_expression_set: base_expression = a_source
			static_properties_computed: are_static_properties_computed
		end

feature -- Access
	
	is_empty_allowed: BOOLEAN
			-- Empty sequence allowed?

	target_type: XM_XPATH_ITEM_TYPE
			-- Target type 

	is_castable_expression: BOOLEAN is
			-- Is `Current' a castable expression?
		do
			Result := True
		end

	as_castable_expression: XM_XPATH_CASTABLE_EXPRESSION is
			-- `Current' seen as a castable expression
		do
			Result := Current
		end

	item_type: XM_XPATH_ITEM_TYPE is
			--Determine the data type of the expression, if possible
		do
			Result := type_factory.boolean_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		local
			other_castable: XM_XPATH_CASTABLE_EXPRESSION
		do
			if other.is_castable_expression then
				other_castable := other.as_castable_expression
				Result := base_expression.same_expression (other_castable.base_expression) 
					and then other_castable.is_empty_allowed = is_empty_allowed
					and then other_castable.target_type = target_type
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
			if base_expression.is_value then
				calculate_effective_boolean_value (Void)
				set_replacement (last_boolean_value)
			end
		end
	
	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			a_type_checker: XM_XPATH_TYPE_CHECKER
			an_atomic_sequence: XM_XPATH_SEQUENCE_TYPE
			a_role: XM_XPATH_ROLE_LOCATOR
			a_cardinality: INTEGER
		do
			mark_unreplaced
			base_expression.check_static_type (a_context)
			if base_expression.was_expression_replaced then
				set_base_expression (base_expression.replacement_expression)
			end
			if base_expression.is_error then
				set_last_error (base_expression.error_value)
			else
				create a_type_checker
				if is_empty_allowed then
					a_cardinality := Required_cardinality_optional
				else
					a_cardinality := Required_cardinality_exactly_one
				end
				create an_atomic_sequence.make (type_factory.any_atomic_type, a_cardinality)
				create a_role.make (Type_operation_role, "castable as", 1, Xpath_errors_uri, "XPTY0004")
				a_type_checker.static_type_check (a_context, base_expression, an_atomic_sequence, False, a_role)
				if a_type_checker.is_static_type_check_error then
					set_last_error (a_type_checker.static_type_check_error)
				else
					set_base_expression (a_type_checker.checked_expression)
					if base_expression.is_atomic_value then
						calculate_effective_boolean_value (Void)
						set_replacement (last_boolean_value)
					end
				end
			end
		end

	optimize (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform optimization of `Current' and its subexpressions.
		do
			mark_unreplaced
			base_expression.optimize (a_context)
			if base_expression.was_expression_replaced then
				set_base_expression (base_expression.replacement_expression)
			end
			if base_expression.is_error then
				set_last_error (base_expression.error_value)
			elseif base_expression.is_atomic_value then
				calculate_effective_boolean_value (Void)
				set_replacement (last_boolean_value)
			end
		end


feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		do
			calculate_effective_boolean_value (a_context)
			last_evaluated_item := last_boolean_value
		end

	
	calculate_effective_boolean_value (a_context: XM_XPATH_CONTEXT) is
			-- Effective boolean value
		do
			base_expression.evaluate_item (a_context)
			if not base_expression.last_evaluated_item.is_atomic_value then
				create last_boolean_value.make (is_empty_allowed)
			else
				create last_boolean_value.make (base_expression.last_evaluated_item.as_atomic_value.is_convertible (target_type))
			end
		end

feature {XM_XPATH_UNARY_EXPRESSION} -- Restricted
	
	display_operator: STRING is
			-- Format `operator' for display
		do
			Result := "castable as " + target_type.conventional_name
		end

feature {NONE} -- Implementation
	
	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

	compute_special_properties is
			-- Compute special properties.
		do
			Precursor
			set_non_creating
		end

end
