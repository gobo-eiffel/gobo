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

creation

	make

feature {NONE} -- Initialization

	make (rv: XM_XPATH_RANGE_VARIABLE_DECLARATION; seq: XM_XPATH_EXPRESSION; act: XM_XPATH_EXPRESSION) is
			-- Establish invariant
		require
			range_variable_not_void: rv /= Void
			sequence_not_void: seq /= Void
			action_not_void: act /= Void
		do
			operator := For_token
			declaration := rv
			sequence := seq
			action := act
		ensure
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
			Result := action.item_type
		end

	required_type: XM_XPATH_SEQUENCE_TYPE is
			-- Static type of variable
		do
			create result.make_single_integer
		end
	
feature -- Analysis

	analyze (env: XM_XPATH_STATIC_CONTEXT): XM_XPATH_EXPRESSION is
			-- Perform static analysis of an expression and its subexpressions;		
			-- This checks statically that the operands of the expression have the correct type;
			-- If necessary it generates code to do run-time type checking or type conversion;
			-- A static type error is reported only if execution cannot possibly succeed, that
			-- is, if a run-time type error is inevitable. The call may return a modified form of the expression;
			-- This routine is called after all references to functions and variables have been resolved
			-- to the declaration of the function or variable. However, the types of such functions and
			-- variables will only be accurately known if they have been explicitly declared
		do
			-- TODO
		end


feature {NONE} -- Implementation

	compute_cardinality is
			-- Compute cardinality.
		do
			-- TODO
		end

invariant

	valid_operator: operator = For_token

end
	
