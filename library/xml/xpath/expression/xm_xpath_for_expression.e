note

	description:

	"XPath FOR expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
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

	make (a_range_variable: XM_XPATH_RANGE_VARIABLE_DECLARATION; a_sequence_expression: XM_XPATH_EXPRESSION; a_action: XM_XPATH_EXPRESSION)
			-- Establish invariant
		require
			range_variable_not_void: a_range_variable /= Void
			sequence_not_void: a_sequence_expression /= Void
			a_action_not_void: a_action /= Void
		do
			operator := For_token
			set_declaration (a_range_variable)
				-- For void-safety, set `action' before calling
				-- `set_sequence' and call `set_action' afterwards.
			action := a_action
			set_sequence (a_sequence_expression)
			set_action (a_action)
			compute_static_properties
			initialized := True
		ensure
			static_properties_computed: are_static_properties_computed
			range_variable_set: declaration = a_range_variable
			sequence_set: sequence = a_sequence_expression
			action_set: action = a_action
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE
			--Determine the data type of the expression, if possible
		do
			Result := action.item_type
		end

	required_type: XM_XPATH_SEQUENCE_TYPE
			-- Static type of variable
		do
			create result.make_single_integer
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
			a_string := STRING_.appended_string (indentation (a_level), "for $")
			a_string := STRING_.appended_string (a_string, variable_name)
			std.error.put_string (a_string)
			std.error.put_string (" in")
			std.error.put_new_line
			sequence.display (a_level + 1)
			std.error.put_string (STRING_.appended_string (indentation (a_level), "return"))
			std.error.put_new_line
			action.display (a_level + 1)
		end

	contains_recursive_tail_function_calls (a_name_code, a_arity: INTEGER): UT_TRISTATE
			-- Does `Current' contains recursive tail calls of stylesheet functions?
			-- `Undecided' means it contains a tail call to another function.
		do
			if sequence.cardinality_allows_many then
				create Result.make_false
			else
				Result := action.contains_recursive_tail_function_calls (a_name_code, a_arity)
			end
		end

feature -- Status setting

	mark_tail_function_calls
  			-- Mark tail calls on stylesheet functions.
  		do
  			if not sequence.cardinality_allows_many then
				action.mark_tail_function_calls
			end
  		end

feature -- Optimization

	check_static_type (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_sequence_type: XM_XPATH_SEQUENCE_TYPE
			l_role: XM_XPATH_ROLE_LOCATOR
			l_type_checker: XM_XPATH_TYPE_CHECKER
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
			l_properties: XM_XPATH_STATIC_PROPERTY
		do
			create l_replacement.make (Void)
			sequence.check_static_type (l_replacement, a_context, a_context_item_type)
			check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item then
				if sequence /= l_replacement_item then
					set_sequence (l_replacement_item)
				end
			end
			if sequence.is_error then
				set_replacement (a_replacement, sequence)
			else
				if attached declaration as l_declaration then
					create l_sequence_type.make (l_declaration.required_type.primary_type, Required_cardinality_zero_or_more)
					create l_role.make (Variable_role, variable_name, 1, Xpath_errors_uri, "XPTY0004")
					create l_type_checker
					l_type_checker.static_type_check (a_context, sequence, l_sequence_type, False, l_role)
					if l_type_checker.is_static_type_check_error then
						check attached l_type_checker.static_type_check_error as l_static_type_check_error then
							set_last_error (l_static_type_check_error)
							a_replacement.put (Current)
						end
					else
						check postcondition_of_static_type_check: attached l_type_checker.checked_expression as l_checked_expression then
							l_properties := sequence.twin
							l_properties.set_cardinality_exactly_one
							set_sequence (l_checked_expression)
							l_declaration.refine_type_information (sequence.item_type, Void, l_properties)
							set_declaration_void
							l_replacement.put (Void)
							action.check_static_type (l_replacement, a_context, a_context_item_type)
							check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item then
								if action /= l_replacement_item then
									replace_action (l_replacement_item)
								end
							end
							if action.is_error then
								set_replacement (a_replacement, action)
							elseif action.is_empty_sequence then
								set_replacement (a_replacement, action)
							else
								a_replacement.put (Current)
							end
						end
					end
				else
					a_replacement.put (Current)
				end
			end
		end

	optimize (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform optimization of `Current' and its subexpressions.
		do
			a_replacement.put (Current)
			-- TODO - plenty of optimization chances here - see e.g. quantified expression
		end

feature -- Evaluation

	create_iterator (a_context: XM_XPATH_CONTEXT)
			-- Create an iterator over the values of a sequence
		local
			a_base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			a_mapping_function: XM_XPATH_MAPPING_ACTION
			a_node_mapping_function: XM_XPATH_NODE_MAPPING_ACTION
		do

			-- First create an iteration of the base sequence.

			sequence.create_iterator (a_context)
			check postcondition_of_create_iterator: attached sequence.last_iterator as l_last_iterator then
				a_base_iterator := l_last_iterator

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
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT)
			-- Create an iterator over a node sequence
		local
			a_base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			a_mapping_function: XM_XPATH_NODE_MAPPING_ACTION
		do

			-- First create an iteration of the base sequence.

			sequence.create_iterator (a_context)
			check postcondition_of_create_iterator: attached sequence.last_iterator as l_last_iterator then
				a_base_iterator := l_last_iterator

				if attached a_base_iterator.error_value as l_error_value then
					check is_error: a_base_iterator.is_error end
					create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make (l_error_value)
				else

					-- Then create a mapping iterator which applies a mapping function to each
					--  item in the base sequence. The mapping function is essentially the "return"
					--  expression, wrapped in a mapping action object that is responsible also for
					--  setting the range variable at each step. TODO: mapping_action?

					create a_mapping_function.make (a_context, slot_number, action)
					create {XM_XPATH_NODE_MAPPING_ITERATOR} last_node_iterator.make (a_base_iterator, a_mapping_function, Void)
				end
			end
		end

feature {NONE} -- Implementation

	native_implementations: INTEGER
			-- Natively-supported evaluation routines
		do
			Result := Supports_iterator
		end

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality (multiply_cardinality (sequence.cardinality, action.cardinality))
		end

invariant

	valid_operator: operator = For_token

end

