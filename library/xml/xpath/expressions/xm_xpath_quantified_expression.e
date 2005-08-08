indexing

	description:

	"XPath SOME/EVERY expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_QUANTIFIED_EXPRESSION

inherit

	XM_XPATH_ASSIGNATION
		redefine
			evaluate_item, calculate_effective_boolean_value, is_repeated_sub_expression, compute_special_properties
		end

	XM_XPATH_PROMOTION_ACTIONS

	XM_XPATH_ROLE

create

	make

feature {NONE} -- Initialization

	make (an_operator: INTEGER; a_range_variable: XM_XPATH_RANGE_VARIABLE_DECLARATION; a_sequence_expression: XM_XPATH_EXPRESSION; an_action: XM_XPATH_EXPRESSION) is
			-- Establish invariant
		require
			valid_operator: an_operator = Every_token or an_operator = Some_token
			range_variable_not_void: a_range_variable /= Void
			sequence_not_void: a_sequence_expression /= Void
			action_not_void: an_action /= Void
		do
			operator := an_operator
			set_declaration (a_range_variable)
			check
				declaration_not_void: declaration /= Void
			end
			sequence := a_sequence_expression
			set_action (an_action)
			compute_static_properties
			initialized := True
		ensure
			static_properties_computed: are_static_properties_computed
			operator_set: operator = an_operator
			range_variable_set: declaration = a_range_variable
			sequence_set: sequence = a_sequence_expression
			action_set: action_expression = an_action
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			--Determine the data type of the expression, if possible
		do
			Result := type_factory.boolean_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	required_type: XM_XPATH_SEQUENCE_TYPE is
			-- Static type of variable
		do
			create result.make (sequence.item_type, Required_cardinality_exactly_one)
		end

	is_repeated_sub_expression (a_child: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Is `a_child' a repeatedly-evaluated sub-expression?
		do
			Result := a_child = action_expression
		end

feature -- Status report

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), token_name (operator))
			a_string := STRING_.appended_string (a_string, " $")
			a_string := STRING_.appended_string (a_string, variable_name)
			a_string := STRING_.appended_string (a_string, " in")
			std.error.put_string (a_string)
			std.error.put_new_line
			sequence.display (a_level + 1)
			a_string := STRING_.appended_string (indentation (a_level), "satisfies")
			std.error.put_string (a_string)
			std.error.put_new_line
			action_expression.display (a_level + 1)
		end

feature -- Optimization

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
			a_declaration_type, a_sequence_type: XM_XPATH_SEQUENCE_TYPE
			a_role: XM_XPATH_ROLE_LOCATOR
			a_type_checker: XM_XPATH_TYPE_CHECKER
			actual_item_type: XM_XPATH_ITEM_TYPE
		do
			mark_unreplaced
			if	declaration = Void then
				-- do nothing
			else

				-- The order of events is critical here. First we ensure that the type of the
				-- sequence expression is established. This is used to establish the type of the variable,
				-- which in turn is required when type-checking the action part.
				
				sequence.check_static_type (a_context)
				if sequence.was_expression_replaced then
					set_sequence (sequence.replacement_expression)
				end
				if sequence.is_error then
					set_last_error (sequence.error_value)
				end
				if not is_error then
					if sequence.is_empty_sequence then
						create a_boolean_value.make (operator /= Some_token)
						set_replacement (a_boolean_value)
					else
					
						-- "some" and "every" have no ordering constraints
						
						sequence.set_unsorted (False)
						if sequence.was_expression_replaced then
							set_sequence (sequence.replacement_expression)
						end
						a_declaration_type := declaration.required_type
						create a_sequence_type.make (a_declaration_type.primary_type, Required_cardinality_zero_or_more)
						create a_role.make (Variable_role, declaration.variable_name, 1, Xpath_errors_uri, "XPTY0004")
						create a_type_checker
						a_type_checker.static_type_check (a_context, sequence, a_sequence_type, False, a_role)
						if a_type_checker.is_static_type_check_error then
							set_last_error (a_type_checker.static_type_check_error)
						else
							set_sequence (a_type_checker.checked_expression)
							actual_item_type := sequence.item_type
							declaration.refine_type_information (actual_item_type, sequence.cardinalities, Void, sequence.dependencies, sequence.special_properties)
							set_declaration_void -- Now the GC can reclaim it, and analysis cannot be performed again.
							action_expression.check_static_type (a_context)
							if action_expression.was_expression_replaced then
								replace_action (action_expression.replacement_expression)
							end
							if action_expression.is_error then
								set_last_error (action_expression.error_value)
							end
						end
					end
				end
			end
		end

	optimize (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform optimization of `Current' and its subexpressions.
		do
			mark_unreplaced
			sequence.optimize (a_context)
			if sequence.was_expression_replaced then
				set_sequence (sequence.replacement_expression)
			end
			if sequence.is_error then
				set_last_error (sequence.error_value)
			else
				action_expression.optimize (a_context)
				if action_expression.was_expression_replaced then
					replace_action (action_expression.replacement_expression)
				end
				if action_expression.is_error then
					set_last_error (action_expression.error_value)
				else
					promote_subexpressions (a_context)
				end
			end
		end

feature -- Evaluation

	calculate_effective_boolean_value (a_context: XM_XPATH_CONTEXT) is
			-- Effective boolean value
		local
			a_base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			a_value: XM_XPATH_VALUE
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
			some: BOOLEAN
			found_a_match, finished: BOOLEAN
			an_item: XM_XPATH_ITEM
		do

			-- First create an iteration of the base sequence.

			sequence.create_iterator (a_context)
			a_base_iterator := sequence.last_iterator
			if a_base_iterator.is_error then
				create last_boolean_value.make (False)
				last_boolean_value.set_last_error (a_base_iterator.error_value)
			else
			
				-- Now test to see if some or all of the tests are true. The same
				-- logic is used for the SOME and EVERY operators
				
				some := operator = Some_token
				
				from
					a_base_iterator.start
				until
					finished or else a_base_iterator.is_error or else a_base_iterator.after
				loop
					an_item := a_base_iterator.item
					if an_item = Void then
						finished := True
					elseif an_item.is_error then
						create last_boolean_value.make (False)
						last_boolean_value.set_last_error (an_item.error_value)
						finished := True
					else
						a_value := an_item.as_item_value
						a_context.set_local_variable (a_value, slot_number)
						action.calculate_effective_boolean_value (a_context)
						a_boolean_value := action.last_boolean_value
						if a_boolean_value.is_error then
							last_boolean_value := a_boolean_value
							finished := True
						else
							if some = a_boolean_value.value then
								create last_boolean_value.make (some); found_a_match := True
							end
						end
						
						a_base_iterator.forth
					end
				end
				if a_base_iterator.is_error then
					create last_boolean_value.make (False)
					last_boolean_value.set_last_error (a_base_iterator.error_value)
				elseif not (finished or else found_a_match) then
					create last_boolean_value.make (not some)
				end
			end
		end

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		do
			calculate_effective_boolean_value (a_context)
			last_evaluated_item := last_boolean_value
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

	promote_subexpressions (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Extract subexpressions that don't depend on the range variable.
		local
			an_offer: XM_XPATH_PROMOTION_OFFER
			a_let_expression: XM_XPATH_LET_EXPRESSION
		do
			create an_offer.make (Range_independent, Current, Current, False, False)
			action_expression.mark_unreplaced
			action_expression.promote (an_offer)
			if action_expression.was_expression_replaced then replace_action (action_expression.replacement_expression) end
			if an_offer.containing_expression.is_let_expression then
				a_let_expression := an_offer.containing_expression.as_let_expression
				a_let_expression.optimize (a_context)
				if a_let_expression.is_error then
					set_last_error (a_let_expression.error_value)
				elseif a_let_expression.was_expression_replaced then
					an_offer.set_containing_expression (a_let_expression.replacement_expression)
				end
			end
			if an_offer.containing_expression /= Current then
				set_replacement (an_offer.containing_expression)
			end
		end

invariant

	valid_operator:  operator = Every_token or operator = Some_token

end

