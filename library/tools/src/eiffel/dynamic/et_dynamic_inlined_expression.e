note

	description:

		"Eiffel inlined operands at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2024, Eric Bezault and others"
	license: "MIT License"

class ET_DYNAMIC_INLINED_EXPRESSION

inherit

	ET_INLINED_EXPRESSION
		rename
			make as make_inlined_expression
		end

create

	make

feature {NONE} -- Initialization

	make (a_expression: like expression; a_dynamic_type_set: like dynamic_type_set; a_context: like context)
			-- Create a new inlined expression.
		require
			a_expression_not_void: a_expression /= Void
			a_dynamic_type_set_not_void: a_dynamic_type_set /= Void
			a_context_not_void: a_context /= Void
		do
			make_inlined_expression (a_expression)
			dynamic_type_set := a_dynamic_type_set
			context := a_context
		ensure
			expression_set: expression = a_expression
			dynamic_type_set_set: dynamic_type_set = a_dynamic_type_set
			context_set: context = a_context
		end

feature -- Access

	dynamic_type_set: ET_DYNAMIC_TYPE_SET
			-- Dynamic type set of `expression'

	context: ET_DYNAMIC_CALL_CONTEXT
			-- Context of the inlined call

feature -- Setting

	set_dynamic_type_set (a_dynamic_type_set: like dynamic_type_set)
			-- Set `dynamic_type_set' to `a_dynamic_type_set'.
		require
			a_dynamic_type_set_not_void: a_dynamic_type_set /= Void
		do
			dynamic_type_set := a_dynamic_type_set
		ensure
			dynamic_type_set_set: dynamic_type_set = a_dynamic_type_set
		end

	set_context (a_context: like context)
			-- Set `context' to `a_context'.
		require
			a_context_not_void: a_context /= Void
		do
			context := a_context
		ensure
			context_set: context = a_context
		end

invariant

	dynamic_type_set_not_void: dynamic_type_set /= Void
	context_not_void: context /= Void

end
