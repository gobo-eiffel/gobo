indexing

	description:

	"XPath FOR expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_FOR_EXPRESSION

inherit

	XM_XPATH_ASSIGNATION
		redefine
			create_iterator, is_repeated_sub_expression, native_implementations,
			mark_tail_function_calls, is_tail_recursive
		end

	XM_XPATH_ROLE

	XM_XPATH_CARDINALITY

create

	make

feature {NONE} -- Initialization

	make (a_range_variable: XM_XPATH_RANGE_VARIABLE_DECLARATION; a_sequence_expression: XM_XPATH_EXPRESSION; an_action: XM_XPATH_EXPRESSION) is
			-- Establish invariant
		require
			range_variable_not_void: a_range_variable /= Void
			sequence_not_void: a_sequence_expression /= Void
			action_not_void: an_action /= Void
		do
			operator := For_token
			set_declaration (a_range_variable)
			set_sequence (a_sequence_expression)
			set_action (an_action)
			compute_static_properties
			initialized := True
		ensure
			static_properties_computed: are_static_properties_computed
			range_variable_set: declaration = a_range_variable
			sequence_set: sequence = a_sequence_expression
			action_set: action_expression = an_action
		end
	
feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			--Determine the data type of the expression, if possible
		do
			Result := action_expression.item_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	required_type: XM_XPATH_SEQUENCE_TYPE is
			-- Static type of variable
		do
			create result.make_single_integer
		end

	is_repeated_sub_expression (a_child: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Is `a_child' a repeatedly-evaluated sub-expression?
		do
			Result := a_child = action_expression
		end

	is_tail_recursive: BOOLEAN is
			-- Is `Current' a tail recursive function call?
		do
			if not sequence.cardinality_allows_many then
				Result := action_expression.is_tail_recursive
			end
		end
	
feature -- Status report

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "for $")
			a_string := STRING_.appended_string (a_string, variable_name)
			std.error.put_string (a_string)
			std.error.put_string (" in")
			std.error.put_new_line
			sequence.display (a_level + 1)
			std.error.put_string (STRING_.appended_string (indentation (a_level), "return"))
			std.error.put_new_line
			action_expression.display (a_level + 1)
		end

feature -- Status setting
	
	mark_tail_function_calls is
			-- Mark tail-recursive calls on stylesheet functions.
		do
			if not sequence.cardinality_allows_many then
				action_expression.mark_tail_function_calls
			end
		end

feature -- Optimization

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of an expression and its subexpressions
		local
			a_sequence_type: XM_XPATH_SEQUENCE_TYPE
			a_role: XM_XPATH_ROLE_LOCATOR
			a_type_checker: XM_XPATH_TYPE_CHECKER
			a_cardinality_set: ARRAY [BOOLEAN] 
		do
			if declaration /= Void then
				mark_unreplaced
				
				-- The order of events is critical here. First we ensure that the type of the
				--  sequence expression is established. This is used to establish the type of the variable,
				--  which in turn is required when type-checking the action part.
				sequence.analyze (a_context)
				if sequence.was_expression_replaced then
					set_sequence (sequence.replacement_expression)
				end
				if sequence.is_error then
					set_replacement (sequence)
				else
					create a_sequence_type.make (declaration.required_type.primary_type, Required_cardinality_zero_or_more)
					create a_role.make (Variable_role, variable_name, 1, Xpath_errors_uri, "XPTY0004")
					create a_type_checker
					a_type_checker.static_type_check (a_context, sequence, a_sequence_type, False, a_role)
					if a_type_checker.is_static_type_check_error then
						set_last_error (a_type_checker.static_type_check_error)
					else
						create a_cardinality_set.make (1, 3)
						a_cardinality_set.put (True, 2) -- Exactly One
						set_sequence (a_type_checker.checked_expression)
						declaration.refine_type_information (sequence.item_type, a_cardinality_set, Void, sequence.dependencies, sequence.special_properties)
						set_declaration_void
						action_expression.analyze (a_context)
						if action.was_expression_replaced then
							replace_action (action_expression.replacement_expression)
						end
						if action_expression.is_error then
							set_replacement (action_expression)
						end
					end
				end
			end
		end

feature -- Evaluation

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- An iterator over the values of a sequence
		local
			a_base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			a_mapping_function: XM_XPATH_MAPPING_ACTION
		do
			
			-- First create an iteration of the base sequence.

			sequence.create_iterator (a_context)
			a_base_iterator := sequence.last_iterator

			if a_base_iterator.is_error then
				last_iterator := a_base_iterator
			else
				
				-- Then create a mapping iterator which applies a mapping function to each
				--  item in the base sequence. The mapping function is essentially the "return"
				--  expression, wrapped in a mapping action object that is responsible also for
				--  setting the range variable at each step. TODO: mapping_action?

				create a_mapping_function.make (a_context, slot_number, action)
				create {XM_XPATH_MAPPING_ITERATOR} last_iterator.make (a_base_iterator,a_mapping_function , Void)
			end
		end

feature {NONE} -- Implementation

	native_implementations: INTEGER is
			-- Natively-supported evaluation routines
		do
			Result := Supports_iterator
		end

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality (multiply_cardinality (sequence.cardinality, action_expression.cardinality))
		end

invariant

	valid_operator: operator = For_token

end
	
