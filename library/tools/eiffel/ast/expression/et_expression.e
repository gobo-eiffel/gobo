indexing

	description:

		"Eiffel expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_EXPRESSION

inherit

	ET_EXPRESSION_ITEM
		rename
			expression as expression_item
		end

	ET_CONDITIONAL
		rename
			expression as expression_item
		end

	ET_ASSERTION
		rename
			expression as expression_item
		undefine
			reset
		end

	ET_ACTUAL_ARGUMENTS
		rename
			count as actual_argument_count,
			is_empty as is_empty_actual_argument,
			valid_index as valid_index_actual_argument
		end

	ET_ARGUMENT_OPERAND
		redefine
			index
		end

	ET_AGENT_ARGUMENT_OPERAND
		undefine
			reset, set_index
		redefine
			index
		end

	ET_TARGET_OPERAND
		undefine
			reset, set_index
		redefine
			index
		end

	ET_AGENT_TARGET
		undefine
			reset, set_index
		redefine
			index
		end

feature -- Access

	index: INTEGER
			-- Index of expression in enclosing feature;
			-- Used to get dynamic information about this expression.

	actual_argument (i: INTEGER): ET_EXPRESSION is
			-- Actual argument at index `i'
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

	expression_item: ET_EXPRESSION is
			-- Current expression
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

feature -- Status report

	is_never_void: BOOLEAN is
			-- Can current expression never be void?
		do
			-- Result := False
		end

	is_current: BOOLEAN is
			-- Is current expression the 'Current' entity (possibly parenthesized)?
		do
			-- Result := False
		end

feature -- Measurement

	actual_argument_count: INTEGER is 1
			-- Number of actual arguments

feature -- Type conversion

	manifest_constant_convert_feature (a_source_type: ET_TYPE_CONTEXT; a_target_type: ET_TYPE_CONTEXT; a_system: ET_SYSTEM): ET_CONVERT_FEATURE is
			-- Implicit feature to convert `Current' of type `a_source_type' to `a_target_type'.
			-- This is only possible when `Current' is a manifest constant with no explicit
			-- type case and the value of the constant can be represented in `a_target_type.
			-- Void if no such feature or when not possible.	
		require
			a_system_not_void: a_system /= Void
			a_source_type_not_void: a_source_type /= Void
			a_source_context_valid: a_source_type.is_valid_context
			a_target_type_not_void: a_target_type /= Void
			a_target_context_valid: a_target_type.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		do
			-- Result := Void
		end

invariant

	index_not_negative: index >= 0

end
