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
			iterator
		end

	XM_XPATH_ROLE

	XM_XPATH_CARDINALITY

creation

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
			initialize
		ensure
			static_properties_computed: are_static_properties_computed
			range_variable_set: declaration = a_range_variable
			sequence_set: sequence = a_sequence_expression
			action_set: action = an_action
		end
	
feature -- Access
	
	item_type: INTEGER is
			--Determine the data type of the expression, if possible;
			-- All expression return sequences, in general;
			-- This routine determines the type of the items within the
			-- sequence, assuming that (a) this is known in advance,
			-- and (b) it is the same for all items in the sequence.
		do
			Result := action.item_type
		end

	required_type: XM_XPATH_SEQUENCE_TYPE is
			-- Static type of variable
		do
			create result.make_single_integer
		end
	
feature -- Status report

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "for $")
			a_string := STRING_.appended_string (a_string, name)
			if is_error then
				std.error.put_string (" in error%N")
			else
				std.error.put_string (" in")
				std.error.put_new_line
				sequence.display (a_level + 1, a_pool)
				std.error.put_string (STRING_.appended_string (indentation (a_level), "return"))
				std.error.put_new_line
				action.display (a_level + 1, a_pool)
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

			-- The order of events is critical here. First we ensure that the type of the
			--  sequence expression is established. This is used to establish the type of the variable,
			--  which in turn is required when type-checking the action part.

			if sequence.may_analyze then sequence.analyze (a_context) end
			if sequence.was_expression_replaced then
				set_sequence (sequence.replacement_expression)
			end
			if sequence.is_error then
				was_expression_replaced := True
				replacement_expression := sequence
			else
				create a_sequence_type.make (declaration.required_type.primary_type, Required_cardinality_zero_or_more)
				create a_role.make (Variable_role, name, 1)
				create a_type_checker
				a_type_checker.static_type_check (sequence, a_sequence_type, False, a_role)
				if a_type_checker.is_static_type_check_error then
					set_last_error_from_string (a_type_checker.static_type_check_error_message, 4, Type_error)
				else
					create a_cardinality_set.make (1, 3)
					a_cardinality_set.put (True, 2) -- Exactly One
					set_sequence (a_type_checker.checked_expression)
					declaration.refine_type_information (sequence.item_type, a_cardinality_set, Void, sequence.dependencies, sequence.special_properties)
					set_declaration_void -- Also marks as analyzed

						check
							action.may_analyze
							-- This BETTER be right!
						end
					action.analyze (a_context)
					if action.was_expression_replaced then
						action := action.replacement_expression
					end
					if action.is_error then
						was_expression_replaced := True
						replacement_expression := action
					end
				end
			end
		end

feature -- Evaluation

	iterator (a_context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- An iterator over the values of a sequence
		local
			a_base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			a_mapping_function: XM_XPATH_MAPPING_ACTION
		do
			
			-- First create an iteration of the base sequence.

			a_base_iterator := sequence.iterator (a_context)

			if a_base_iterator.is_error then
				Result := a_base_iterator
			else
				
				-- Then create a mapping iterator which applies a mapping function to each
				--  item in the base sequence. The mapping function is essentially the "return"
				--  expression, wrapped in a mapping action object that is responsible also for
				--  setting the range variable at each step.

				create a_mapping_function.make (a_context, slot_number, action)
				create {XM_XPATH_MAPPING_ITERATOR} Result.make (a_base_iterator,a_mapping_function , Void, Void)
			end
		end

feature {NONE} -- Implementation

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality (multiply_cardinality (sequence.cardinality, action.cardinality))
		end

invariant

	valid_operator: operator = For_token

end
	
