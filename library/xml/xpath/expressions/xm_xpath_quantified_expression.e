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

creation

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
			declaration := a_range_variable
			sequence := a_sequence_expression
			action := an_action
			compute_static_properties
		ensure
			operator_set: operator = an_operator
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
			Result := Boolean_type
		end

	required_type: XM_XPATH_SEQUENCE_TYPE is
			-- Static type of variable
		do
			create result.make (sequence.item_type, Required_cardinality_exactly_one)
		end

feature -- Status report

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indent (a_level), token_name (operator))
			a_string := STRING_.appended_string (a_string, " $")
			a_string := STRING_.appended_string (a_string, declaration.name)
			a_string := STRING_.appended_string (a_string, " in")
			std.error.put_string (a_string)
			std.error.put_new_line
			sequence.display (a_level + 1, a_pool)
			a_string := STRING_.appended_string (indent (a_level), "satisfies")
			std.error.put_string (a_string)
			std.error.put_new_line
			action.display (a_level + 1, a_pool)
		end

feature -- Optimization

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of `Current' and its subexpressions		
		local
			a_declaration_type, a_sequence_type: XM_XPATH_SEQUENCE_TYPE
			an_expression: XM_XPATH_EXPRESSION
		do
			
			-- The order of events is critical here. First we ensure that the type of the
			-- sequence expression is established. This is used to establish the type of the variable,
			-- which in turn is required when type-checking the action part.
			
				check
					sequence.may_analyze
				end
			sequence.analyze (a_context)
			if sequence.was_expression_replaced then set_sequence (sequence.replacement_expression) end
			if sequence.is_error then
				set_last_error (sequence.last_error)
			end

			if not is_error then
				
				-- "some" and "every" have no ordering constraints

				set_sequence (sequence.unsorted (False))
				a_declaration_type := declaration.required_type
				create a_sequence_type.make (a_declaration_type.primary_type, Required_cardinality_zero_or_more)

				-- TODO - more code to write
				todo ("quantified-expression", True)
			
			end
			
			set_declaration_void -- Now the GC can reclaim it, and analysis cannot be performed again. Also sets analyzed to `True'
		end

feature {NONE} -- Implementation

	compute_cardinality is
			-- Compute cardinality.
		do
			create cardinalities.make (1, 3)
			cardinalities.put (True, 2) -- Allow exactly one
		end

invariant

	valid_operator:  operator = Every_token or operator = Some_token

end
	
