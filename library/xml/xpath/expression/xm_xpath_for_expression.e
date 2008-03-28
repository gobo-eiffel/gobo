indexing

	description:

	"XPath FOR expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_FOR_EXPRESSION

inherit

	XM_XPATH_ASSIGNATION
		redefine
			create_iterator, is_repeated_sub_expression, native_implementations,
			contains_recursive_tail_function_calls,
			create_node_iterator, mark_tail_function_calls
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

	contains_recursive_tail_function_calls (a_name_code, a_arity: INTEGER): UT_TRISTATE is
			-- Does `Current' contains recursive tail calls of stylesheet functions?
			-- `Undecided' means it contains a tail call to another function.
		do
			if sequence.cardinality_allows_many then
				create Result.make_false
			else
				Result := action_expression.contains_recursive_tail_function_calls (a_name_code, a_arity)
			end
		end

feature -- Status setting
	
	mark_tail_function_calls is
  			-- Mark tail calls on stylesheet functions.
  		do
  			if not sequence.cardinality_allows_many then
				action_expression.mark_tail_function_calls
			end
  		end

feature -- Optimization

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			a_sequence_type: XM_XPATH_SEQUENCE_TYPE
			a_role: XM_XPATH_ROLE_LOCATOR
			a_type_checker: XM_XPATH_TYPE_CHECKER
			a_cardinality_set: ARRAY [BOOLEAN]
		do
			mark_unreplaced
			sequence.check_static_type (a_context, a_context_item_type)
			if sequence.was_expression_replaced then
				set_sequence (sequence.replacement_expression)
			end
			if sequence.is_error then
				set_replacement (sequence)
			else
				
			end
			if declaration /= Void and then not is_error then
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
					declaration.refine_type_information (sequence.item_type, Void, sequence)
					set_declaration_void
					action_expression.check_static_type (a_context, a_context_item_type)
					if action.was_expression_replaced then
						replace_action (action_expression.replacement_expression)
					end
					if action_expression.is_error then
						set_replacement (action_expression)
					elseif action_expression.is_empty_sequence then
						set_replacement (action_expression)
					end
				end
			end
		end

	optimize (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform optimization of `Current' and its subexpressions.
		do
			mark_unreplaced
			-- TODO - plenty of optimization chanes here - see e.g. quantified expression
		end

feature -- Evaluation

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over the values of a sequence
		local
			a_base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			a_mapping_function: XM_XPATH_MAPPING_ACTION
			a_node_mapping_function: XM_XPATH_NODE_MAPPING_ACTION
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

				if a_base_iterator.is_node_iterator and action.is_node_sequence then
					create a_node_mapping_function.make (a_context, slot_number, action)
					create {XM_XPATH_NODE_MAPPING_ITERATOR} last_iterator.make (a_base_iterator.as_node_iterator, a_node_mapping_function, Void)
				else
					create a_mapping_function.make (a_context, slot_number, action)
					create {XM_XPATH_MAPPING_ITERATOR} last_iterator.make (a_base_iterator, a_mapping_function, Void)
				end
			end
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over a node sequence
		local
			a_base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			a_mapping_function: XM_XPATH_NODE_MAPPING_ACTION
		do
			
			-- First create an iteration of the base sequence.

			sequence.create_iterator (a_context)
			a_base_iterator := sequence.last_iterator

			if a_base_iterator.is_error then
				create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make (a_base_iterator.error_value)
			else
				
				-- Then create a mapping iterator which applies a mapping function to each
				--  item in the base sequence. The mapping function is essentially the "return"
				--  expression, wrapped in a mapping action object that is responsible also for
				--  setting the range variable at each step. TODO: mapping_action?

				create a_mapping_function.make (a_context, slot_number, action)
				create {XM_XPATH_NODE_MAPPING_ITERATOR} last_node_iterator.make (a_base_iterator, a_mapping_function, Void)
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
	
