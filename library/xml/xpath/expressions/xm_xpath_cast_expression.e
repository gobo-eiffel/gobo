indexing

	description:

		"XPath cast as Expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_CAST_EXPRESSION

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			simplified_expression, sub_expressions, promote, evaluate_item
		end

	XM_XPATH_ROLE

creation

	make, make_from_sequence_type

feature {NONE} -- Initialization

	make (a_source: XM_XPATH_EXPRESSION; a_target_type: XM_XPATH_ITEM_TYPE; empty_ok: BOOLEAN) is
			-- TODO
		do
			todo ("make", False)
			compute_static_properties
			initialize
		ensure
			static_properties_computed: are_static_properties_computed
		end

	make_from_sequence_type (a_source: XM_XPATH_EXPRESSION; a_target: XM_XPATH_SEQUENCE_TYPE) is
			-- Establish invariant.
		require
			source_not_void: a_source /= Void
			valid_target_type: a_target /= Void and then not a_target.cardinality_allows_many and then not is_sub_type (a_target.primary_type, any_node_test)
		do
			source := a_source
			target_type := a_target.primary_type
			compute_static_properties
		ensure
			static_properties_computed: are_static_properties_computed
			source_set: source = a_source
			target_type_set: target_type = a_target.primary_type
		end

feature -- Access
	
	item_type: XM_XPATH_ITEM_TYPE is
			--Determine the data type of the expression, if possible
		do
			Result := target_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (1)
			Result.put (source, 1)
			Result.set_equality_tester (expression_tester)
		end

feature -- Status report

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "cast as ")
				a_string := STRING_.appended_string (a_string, target_type.conventional_name)
				std.error.put_string (a_string)
			if is_error then
				std.error.put_string (" in error%N")
			else
				std.error.put_new_line
				source.display (a_level + 1, a_pool)
			end
		end

feature -- Optimization	

	simplified_expression: XM_XPATH_EXPRESSION is
			-- Simplified expression as a result of context-independent static optimizations
		local
			a_result_expression: XM_XPATH_CAST_EXPRESSION
			a_source: XM_XPATH_EXPRESSION
			an_atomic_value: XM_XPATH_ATOMIC_VALUE
		do
			a_source := source.simplified_expression
			if a_source.is_error then
				Result := a_source
			else
				an_atomic_value ?= a_source
				if	an_atomic_value /= Void then
					Result := an_atomic_value.convert_to_type (target_type)
				else
					a_result_expression := clone (Current)
					a_result_expression.set_source (a_source)
					Result := a_result_expression
				end
			end
		end

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of an expression and its subexpressions
		local
			a_role: XM_XPATH_ROLE_LOCATOR
			a_sequence_type: XM_XPATH_SEQUENCE_TYPE
			a_type_checker: XM_XPATH_TYPE_CHECKER
			an_expression: XM_XPATH_EXPRESSION
			a_qname_cast: XM_XPATH_CAST_AS_QNAME_EXPRESSION
			an_atomic_value: XM_XPATH_ATOMIC_VALUE
		do
			mark_unreplaced
			source.analyze (a_context)
			if source.was_expression_replaced then
				set_source (source.replacement_expression)
			end
			if source.is_error then
				set_last_error (source.error_value)
			else
				create a_sequence_type.make (type_factory.any_atomic_type, cardinality)
				create a_role.make (Type_operation_role, "cast as", 1)
				create a_type_checker
				a_type_checker.static_type_check (a_context, source, a_sequence_type, False, a_role)
				if a_type_checker.is_static_type_check_error then
					set_last_error_from_string (a_type_checker.static_type_check_error_message, 4, Type_error)
				else
					an_expression := a_type_checker.checked_expression
					if is_sub_type (an_expression.item_type, target_type) then
						set_replacement (an_expression) -- TODO: wrong, should change the type label?
					elseif is_sub_type (target_type, type_factory.qname_type) then
						create a_qname_cast.make (an_expression)
						a_qname_cast.analyze (a_context)
						if a_qname_cast.is_error then
							set_last_error (a_qname_cast.error_value)
						else
							set_replacement (a_qname_cast)
						end
					else
						an_atomic_value ?= an_expression
						if an_atomic_value /= Void then
							an_atomic_value.evaluate_item (Void)
							an_atomic_value ?= an_atomic_value.last_evaluated_item
							set_replacement (an_atomic_value)
						else
							set_source (an_expression)
						end
					end
				end
			end
		end

	promote (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this subexpression.
		do
			source.promote (an_offer)
			if source.was_expression_replaced then set_source (source.replacement_expression) end
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		local
			an_atomic_value: XM_XPATH_ATOMIC_VALUE
		do
			source.evaluate_item (a_context)
			if source.last_evaluated_item.is_error then
				last_evaluated_item := source.last_evaluated_item
			else
				an_atomic_value ?= source.last_evaluated_item
				if an_atomic_value = Void then
					last_evaluated_item := Void
				elseif an_atomic_value.is_convertible (target_type) then
					last_evaluated_item := an_atomic_value.convert_to_type (target_type)
				else
					create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string (STRING_.appended_string ("Could not cast expression to type ", target_type.conventional_name), Dynamic_error, 21)
				end
			end
		end

feature {XM_XPATH_CAST_EXPRESSION} -- Local

		set_source (a_source: XM_XPATH_EXPRESSION) is
			-- Set `source'.
		require
			source_not_void: a_source /= Void
		do
			source := a_source
			if source.was_expression_replaced then source.mark_unreplaced end
		ensure
			source_set:	source = a_source
			source_not_marked_for_replacement: not source.was_expression_replaced
		end

feature {NONE} -- Implementation
	
	compute_cardinality is
			-- Compute cardinality.
		do
			if allows_empty then
				set_cardinality_optional
			else
				set_cardinality_exactly_one
			end
		end

	source: XM_XPATH_EXPRESSION
			-- Castable expression 
	
	target_type: XM_XPATH_ITEM_TYPE
			-- Target type 

	allows_empty: BOOLEAN
			-- Is empty sequence allowed?

invariant

	source_expression_not_void: source /= Void
	target_type_not_void: target_type /= Void

end
