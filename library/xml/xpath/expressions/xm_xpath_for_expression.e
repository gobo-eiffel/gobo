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

	make (a_range_variable: XM_XPATH_RANGE_VARIABLE_DECLARATION; a_sequence_expression: XM_XPATH_EXPRESSION; an_action: XM_XPATH_EXPRESSION) is
			-- Establish invariant
		require
			range_variable_not_void: a_range_variable /= Void
			sequence_not_void: a_sequence_expression /= Void
			action_not_void: an_action /= Void
		do
			operator := For_token
			declaration := a_range_variable
			sequence := a_sequence_expression
			action := an_action
		ensure
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

	variable_name: STRING
			-- TODO

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
			a_string := STRING_.appended_string (indent (a_level), "for $")
			a_string := STRING_.appended_string (a_string, variable_name)
			-- TODO
			std.error.put_string (a_string)
			std.error.put_new_line
		end

feature -- Optimization

	analyze (a_context: XM_XPATH_STATIC_CONTEXT): XM_XPATH_EXPRESSION is
			-- Perform static analysis of an expression and its subexpressions
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
	
