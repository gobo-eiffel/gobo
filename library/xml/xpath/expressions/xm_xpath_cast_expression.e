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
			simplify, sub_expressions, promote, evaluate_item
		end

	XM_XPATH_ROLE

creation

	make, make_from_sequence_type

feature {NONE} -- Initialization

	make (a_source: XM_XPATH_EXPRESSION; a_target_type: INTEGER; empty_ok: BOOLEAN) is
			-- TODO
		do
			todo ("make", False)
		end

	make_from_sequence_type (a_source: XM_XPATH_EXPRESSION; a_target: XM_XPATH_SEQUENCE_TYPE) is
			-- Establish invariant.
		require
			source_not_void: a_source /= Void
			valid_target_type: a_target /= Void and then not a_target.cardinality_allows_many and then not is_sub_type (a_target.primary_type, Any_node)
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
	
	item_type: INTEGER is
			--Determine the data type of the expression, if possible
		do
			Result := target_type
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
			a_string := STRING_.appended_string (indent (a_level), "cast as ")
			if is_error then
				std.error.put_string (a_string)
				std.error.put_string ("In error%N")
			else
				a_string := STRING_.appended_string (a_string, type_name (target_type))
				std.error.put_string (a_string)
				std.error.put_new_line
				source.display (a_level + 1, a_pool)
			end
		end

feature -- Optimization	

	simplify: XM_XPATH_EXPRESSION is
			-- Simplify an expression
		local
			a_result_expression: XM_XPATH_CAST_EXPRESSION
			a_source: XM_XPATH_EXPRESSION
			an_atomic_value: XM_XPATH_ATOMIC_VALUE
		do
			a_source := source.simplify
			if a_source.is_error then
				a_result_expression := clone (Current)
				a_result_expression.set_last_error (a_source.last_error)
				Result := a_result_expression
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
			if source.may_analyze then source.analyze (a_context) end
			if source.was_expression_replaced then
				set_source (source.replacement_expression)
			end
			if source.is_error then
				set_last_error (source.last_error)
			else
				create a_sequence_type.make (Atomic_type, cardinality)
				create a_role.make (Type_operation_role, "cast as", 1)
				create a_type_checker
				an_expression := a_type_checker.static_type_check (source, a_sequence_type, False, a_role)
				if an_expression = Void then
						check
							static_type_error: a_type_checker.is_static_type_check_error
						end
					set_last_error_from_string (a_type_checker.static_type_check_error_message, 4, Type_error)
				else
					if not an_expression.analyzed then an_expression.set_analyzed end
					if is_sub_type (an_expression.item_type, target_type) then
						was_expression_replaced := True
						replacement_expression := an_expression
						-- TODO: wrong, should change the type label?
					elseif is_sub_type (target_type, Qname_type) then
						create a_qname_cast.make (an_expression)
						a_qname_cast.analyze (a_context)
						if a_qname_cast.is_error then
							set_last_error (a_qname_cast.last_error)
						else
							was_expression_replaced := True
							replacement_expression := a_qname_cast
							if not replacement_expression.analyzed then replacement_expression.set_analyzed end
						end
					else
						an_atomic_value ?= an_expression
						if an_atomic_value /= Void then
							an_atomic_value.evaluate_item (Void)
							was_expression_replaced := True
							an_atomic_value ?= an_atomic_value.last_evaluated_item
							replacement_expression := an_atomic_value
							if not replacement_expression.analyzed then replacement_expression.set_analyzed end
						else
							set_source (an_expression)
						end
					end
				end
			end
			if not analyzed then set_analyzed end
		end

	promote (an_offer: XM_XPATH_PROMOTION_OFFER): XM_XPATH_EXPRESSION is
			-- Offer promotion for this subexpression
		local
			a_result_expression: XM_XPATH_CAST_EXPRESSION
		do
			a_result_expression := clone (Current)
			a_result_expression.set_source (source.promote (an_offer))
			Result := a_result_expression
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		local
			an_atomic_value: XM_XPATH_ATOMIC_VALUE
		do
			source.evaluate_item (a_context)
			an_atomic_value ?= source.last_evaluated_item
			if an_atomic_value = Void then
				last_evaluated_item := Void
			elseif an_atomic_value.is_convertible (target_type) then
				last_evaluated_item := an_atomic_value.convert_to_type (target_type)
			else
				set_last_error_from_string (STRING_.appended_string ("Could not cast expression to type ", type_name (target_type)), Dynamic_error, 21)
			end
		end

feature {XM_XPATH_CAST_EXPRESSION} -- Local

		set_source (a_source: XM_XPATH_EXPRESSION) is
			-- Set `source'.
		require
			source_not_void: a_source /= Void
		do
			source := a_source
		ensure
			source_set:	source = a_source
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
	
	target_type: INTEGER
			-- Target type 

	allows_empty: BOOLEAN
			-- Is empty sequence allowed?

invariant

	source_expression_not_void: source /= Void
	valid_target_type: is_valid_type (target_type)

end
