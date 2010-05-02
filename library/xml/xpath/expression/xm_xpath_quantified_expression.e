note

	description:

	"XPath SOME/EVERY expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
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

	make (an_operator: INTEGER; a_range_variable: XM_XPATH_RANGE_VARIABLE_DECLARATION; a_sequence_expression: XM_XPATH_EXPRESSION; an_action: XM_XPATH_EXPRESSION)
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
			action_set: action = an_action
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE
			--Determine the data type of the expression, if possible
		do
			Result := type_factory.boolean_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	required_type: XM_XPATH_SEQUENCE_TYPE
			-- Static type of variable
		do
			create result.make (sequence.item_type, Required_cardinality_exactly_one)
		end

	is_repeated_sub_expression (a_child: XM_XPATH_EXPRESSION): BOOLEAN
			-- Is `a_child' a repeatedly-evaluated sub-expression?
		do
			Result := a_child = action
		end

feature -- Status report

	display (a_level: INTEGER)
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
			action.display (a_level + 1)
		end

feature -- Optimization

	check_static_type (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_boolean_value: XM_XPATH_BOOLEAN_VALUE
			l_declaration_type, l_sequence_type: XM_XPATH_SEQUENCE_TYPE
			l_role: XM_XPATH_ROLE_LOCATOR
			l_type_checker: XM_XPATH_TYPE_CHECKER
			l_actual_item_type: XM_XPATH_ITEM_TYPE
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			if	declaration /= Void then
				-- The order of events is critical here. First we ensure that the type of the
				-- sequence expression is established. This is used to establish the type of the variable,
				-- which in turn is required when type-checking the action part.
				create l_replacement.make (Void)
				sequence.check_static_type (l_replacement, a_context, a_context_item_type)
				set_sequence (l_replacement.item)
				if sequence.is_error then
					set_replacement (a_replacement, sequence)
				else
					if sequence.is_empty_sequence then
						create l_boolean_value.make (operator /= Some_token)
						set_replacement (a_replacement, l_boolean_value)
					else
						-- "some" and "every" have no ordering constraints
						l_replacement.put (Void)
						sequence.set_unsorted (l_replacement, False)
						set_sequence (l_replacement.item)
						l_declaration_type := declaration.required_type
						create l_sequence_type.make (l_declaration_type.primary_type, Required_cardinality_zero_or_more)
						create l_role.make (Variable_role, declaration.variable_name, 1, Xpath_errors_uri, "XPTY0004")
						create l_type_checker
						l_type_checker.static_type_check (a_context, sequence, l_sequence_type, False, l_role)
						if l_type_checker.is_static_type_check_error then
							set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make (l_type_checker.static_type_check_error))
						else
							set_sequence (l_type_checker.checked_expression)
							l_actual_item_type := sequence.item_type
							declaration.refine_type_information (l_actual_item_type, Void, sequence)
							set_declaration_void -- Now the GC can reclaim it, and analysis cannot be performed again.
							l_replacement.put (Void)
							action.check_static_type (l_replacement, a_context, a_context_item_type)
							if action /= l_replacement.item then
								replace_action (l_replacement.item)
							end
							if action.is_error then
								set_replacement (a_replacement, action)
							end
						end
					end
				end
			end
			if a_replacement.item = Void then
				a_replacement.put (Current)
			end
		end

	optimize (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE)
			-- Perform optimization of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			sequence.optimize (l_replacement, a_context, a_context_item_type)
			set_sequence (l_replacement.item)
			if sequence.is_error then
				set_replacement (a_replacement, sequence)
			else
				l_replacement.put (Void)
				action.optimize (l_replacement, a_context, a_context_item_type)
				if action /= l_replacement.item then
					replace_action (l_replacement.item)
				end
				if action.is_error then
					set_replacement (a_replacement, action)
				else
					promote_subexpressions (a_replacement, a_context, a_context_item_type)
				end
			end
		end

feature -- Evaluation

	calculate_effective_boolean_value (a_context: XM_XPATH_CONTEXT)
			-- Effective boolean value
		local
			a_base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			a_value: XM_XPATH_VALUE
			l_boolean_value: XM_XPATH_BOOLEAN_VALUE
			l_some: BOOLEAN
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

				l_some := operator = Some_token

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
						l_boolean_value := action.last_boolean_value
						if l_boolean_value.is_error then
							last_boolean_value := l_boolean_value
							finished := True
						else
							if l_some = l_boolean_value.value then
								create last_boolean_value.make (l_some); found_a_match := True
							end
						end

						a_base_iterator.forth
					end
				end
				if a_base_iterator.is_error then
					create last_boolean_value.make (False)
					last_boolean_value.set_last_error (a_base_iterator.error_value)
				elseif not (finished or else found_a_match) then
					create last_boolean_value.make (not l_some)
				end
			end
		end

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		do
			calculate_effective_boolean_value (a_context)
			a_result.put (last_boolean_value)
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

	promote_subexpressions (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE)
			-- Extract subexpressions that don't depend on the range variable.
		local
			l_offer: XM_XPATH_PROMOTION_OFFER
			l_binding_list: DS_LIST [XM_XPATH_BINDING]
			l_let_expression: XM_XPATH_LET_EXPRESSION
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			create {DS_ARRAYED_LIST [XM_XPATH_BINDING]} l_binding_list.make (1)
			l_binding_list.put_last (Current)
			create l_offer.make (Range_independent, l_binding_list, Current, False, False)
			create l_replacement.make (Void)
			action.promote (l_replacement, l_offer)
			if action /= l_replacement.item then
				replace_action (l_replacement.item)
				reset_static_properties
			end
			if l_offer.containing_expression.is_let_expression then
				l_replacement.put (Void)
				l_let_expression := l_offer.containing_expression.as_let_expression
				l_let_expression.check_static_type (l_replacement, a_context, a_context_item_type)
				if l_replacement.item.is_error then
					set_replacement (a_replacement, l_replacement.item)
				elseif l_let_expression /= l_replacement.item then
					l_offer.set_containing_expression (l_replacement.item)
				else
					l_let_expression.optimize (a_replacement, a_context, a_context_item_type)
				end
			end
			if a_replacement.item = Void then
				if l_offer.containing_expression = Current then
					a_replacement.put (Current)
				else
					set_replacement (a_replacement, l_offer.containing_expression)
				end
			end
		ensure
			replaced: a_replacement.item /= Void
		end

invariant

	valid_operator:  operator = Every_token or operator = Some_token

end

