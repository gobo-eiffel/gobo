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

	make (op: INTEGER; rv: XM_XPATH_RANGE_VARIABLE_DECLARATION; seq: XM_XPATH_EXPRESSION; act: XM_XPATH_EXPRESSION) is
			-- Establish invariant
		require
			valid_operator: op = Every_token or op = Some_token
			range_variable_not_void: rv /= Void
			sequence_not_void: seq /= Void
			action_not_void: act /= Void
		do
			operator := op
			declaration := rv
			sequence := seq
			action := act
		ensure
			operator_set: operator = op
			range_variable_set: declaration = rv
			sequence_set: sequence = seq
			action_set: action = act
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

	display (level: INTEGER; pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indent (level), token_name (operator))
			a_string := STRING_.appended_string (a_string, " $")
			a_string := STRING_.appended_string (a_string, declaration.name)
			a_string := STRING_.appended_string (a_string, " in")
			std.error.put_string (a_string)
			std.error.put_new_line
			sequence.display (level + 1, pool)
			a_string := STRING_.appended_string (indent (level), "satisfies")
			std.error.put_string (a_string)
			std.error.put_new_line
			action.display (level + 1, pool)
		end

feature -- Optimization

	analyze (env: XM_XPATH_STATIC_CONTEXT): XM_XPATH_EXPRESSION is
			-- Perform static analysis of an expression and its subexpressions;		
			-- This checks statically that the operands of the expression have the correct type;
			-- If necessary it generates code to do run-time type checking or type conversion;
			-- A static type error is reported only if execution cannot possibly succeed, that
			-- is, if a run-time type error is inevitable. The call may return a modified form of the expression;
			-- This routine is called after all references to functions and variables have been resolved
			-- to the declaration of the function or variable. However, the types of such functions and
			-- variables will only be accurately known if they have been explicitly declared
		local
			analyzed_expression: XM_XPATH_QUANTIFIED_EXPRESSION
			declaration_type, sequence_type: XM_XPATH_SEQUENCE_TYPE
		do
			
			-- The order of events is critical here. First we ensure that the type of the
			-- sequence expression is established. This is used to establish the type of the variable,
			-- which in turn is required when type-checking the action part.

			analyzed_expression := clone (Current)
			if sequence.may_analyze then
				analyzed_expression.set_sequence (sequence.analyze (env))
			end

			-- "some" and "every" have no ordering constraints

			analyzed_expression.set_sequence (analyzed_expression.sequence.unsorted (False))
			declaration_type := declaration.required_type
			create sequence_type.make (declaration_type.primary_type, Required_cardinality_zero_or_more)

			-- TODO - more code to write
			
			Result := analyzed_expression
			declaration := Void -- Now the GC can reclaim it, and analysis cannot be performed again
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
	
