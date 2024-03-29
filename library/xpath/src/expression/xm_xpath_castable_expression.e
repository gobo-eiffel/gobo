﻿note

	description:

		"XPath castable as Expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_CASTABLE_EXPRESSION

inherit

	XM_XPATH_UNARY_EXPRESSION
		redefine
			simplify, item_type, check_static_type, optimize, same_expression, evaluate_item,
			calculate_effective_boolean_value, compute_cardinality, compute_special_properties,
			is_castable_expression, as_castable_expression, is_node_sequence
		end

	XM_XPATH_TYPE

	XM_XPATH_ROLE

			-- TODO: per-evaluate atomic values

create

	make

feature {NONE} -- Initialization

	make (a_source: XM_XPATH_EXPRESSION; a_target: XM_XPATH_SEQUENCE_TYPE)
			-- Establish invariant
		do
			target_type := a_target.primary_type
			make_unary (a_source)
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

	is_castable_expression: BOOLEAN
			-- Is `Current' a castable expression?
		do
			Result := True
		end

	as_castable_expression: XM_XPATH_CASTABLE_EXPRESSION
			-- `Current' seen as a castable expression
		do
			Result := Current
		end

	item_type: XM_XPATH_ITEM_TYPE
			--Determine the data type of the expression, if possible
		do
			Result := type_factory.boolean_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN
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

feature -- Status report

	is_node_sequence: BOOLEAN
			-- Is `Current' a sequence of zero or more nodes?
		do
			Result := False
		end

feature -- Optimization

	simplify (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION])
			-- Perform context-independent static optimizations
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			base_expression.simplify (l_replacement)
			check postcondition_of_simplify: attached l_replacement.item as l_replacement_item then
				if l_replacement_item.is_error then
					set_replacement (a_replacement, l_replacement_item)
				else
					set_base_expression (l_replacement_item)
					if base_expression.is_value and then not base_expression.depends_upon_implicit_timezone then
						calculate_effective_boolean_value (new_dummy_context)
						check postcondition_of_calculate_effective_boolean_value: attached last_boolean_value as l_last_boolean_value then
							set_replacement (a_replacement, l_last_boolean_value)
						end
					else
						a_replacement.put (Current)
					end
				end
			end
		end

	check_static_type (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_type_checker: XM_XPATH_TYPE_CHECKER
			l_atomic_sequence: XM_XPATH_SEQUENCE_TYPE
			l_role: XM_XPATH_ROLE_LOCATOR
			l_cardinality: INTEGER
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			base_expression.check_static_type (l_replacement, a_context, a_context_item_type)
			check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item then
				if l_replacement_item.is_error then
					set_replacement (a_replacement, l_replacement_item)
				else
					set_base_expression (l_replacement_item)
					create l_type_checker
					if is_empty_allowed then
						l_cardinality := Required_cardinality_optional
					else
						l_cardinality := Required_cardinality_exactly_one
					end
					create l_atomic_sequence.make (type_factory.any_atomic_type, l_cardinality)
					create l_role.make (Type_operation_role, "castable as", 1, Xpath_errors_uri, "XPTY0004")
					l_type_checker.static_type_check (a_context, base_expression, l_atomic_sequence, False, l_role)
					if l_type_checker.is_static_type_check_error then
						check invariant_of_XM_XPATH_TYPE_CHECKER: attached l_type_checker.static_type_check_error as l_static_type_check_error then
							set_last_error (l_static_type_check_error)
							a_replacement.put (Current)
						end
					else
						check postcondition_of_static_type_check: attached l_type_checker.checked_expression as l_checked_expression then
							set_base_expression (l_checked_expression)
							if base_expression.is_atomic_value then
								calculate_effective_boolean_value (new_dummy_context)
								check postcondition_of_calculate_effective_boolean_value: attached last_boolean_value as l_last_boolean_value then
									set_replacement (a_replacement, l_last_boolean_value)
								end
							else
								a_replacement.put (Current)
							end
						end
					end
				end
			end
		end

	optimize (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform optimization of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			base_expression.optimize (l_replacement, a_context, a_context_item_type)
			check postcondition_of_optimize: attached l_replacement.item as l_replacement_item then
				if l_replacement_item.is_error then
					set_replacement (a_replacement, l_replacement_item)
				else
					set_base_expression (l_replacement_item)
					if base_expression.is_atomic_value then
						calculate_effective_boolean_value (new_dummy_context)
						check postcondition_of_calculate_effective_boolean_value: attached last_boolean_value as l_last_boolean_value then
							set_replacement (a_replacement, l_last_boolean_value)
						end
					else
						a_replacement.put (Current)
					end
				end
			end
		end


feature -- Evaluation

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		do
			calculate_effective_boolean_value (a_context)
			a_result.put (last_boolean_value)
		end


	calculate_effective_boolean_value (a_context: XM_XPATH_CONTEXT)
			-- Effective boolean value
		local
			l_result: DS_CELL [detachable XM_XPATH_ITEM]
		do
			create l_result.make (Void)
			base_expression.evaluate_item (l_result, a_context)
			check attached l_result.item as l_result_item then
				if not l_result_item.is_atomic_value then
					create last_boolean_value.make (is_empty_allowed)
				else
					create last_boolean_value.make (l_result_item.as_atomic_value.is_convertible (target_type))
				end
			end
		end

feature {XM_XPATH_UNARY_EXPRESSION} -- Restricted

	display_operator: STRING
			-- Format `operator' for display
		do
			Result := "castable as " + target_type.conventional_name
		end

feature {NONE} -- Implementation

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

	compute_special_properties
			-- Compute special properties.
		do
			Precursor
			set_non_creating
		end

end
