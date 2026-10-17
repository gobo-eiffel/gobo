note

	description:

		"Eiffel infix expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2026, Eric Bezault and others"
	license: "MIT License"

class ET_INFIX_EXPRESSION

inherit

	ET_QUALIFIED_FEATURE_CALL_EXPRESSION
		rename
			target as left,
			arguments as right
		undefine
			reset,
			is_false_expression,
			is_true_expression,
			is_instance_free,
			has_result,
			has_address_expression,
			has_agent,
			has_typed_object_test,
			add_old_expressions,
			add_formal_arguments
		end

	ET_BINARY_EXPRESSION
		undefine
			add_separate_arguments
		redefine
			reset,
			is_false_expression,
			is_true_expression,
			add_old_expressions
		end

create

	make

feature {NONE} -- Initialization

	make (a_left: like left; a_name: like name; a_right: like right)
			-- Create a new infix feature call.
		require
			a_left_not_void: a_left /= Void
			a_name_not_void: a_name /= Void
			a_right_not_void: a_right /= Void
		do
			left := a_left
			name := a_name
			right := a_right
		ensure
			left_set: left = a_left
			name_set: name = a_name
			right_set: right = a_right
		end

feature -- Initialization

	reset
			-- Reset expression as it was just after it was last parsed.
		do
			precursor {ET_BINARY_EXPRESSION}
			name.reset
			is_boolean_operator := False
			if attached {ET_INFIX_CAST_EXPRESSION} left as l_cast then
				left := l_cast.expression
				if attached {ET_CONVERT_EXPRESSION} left as l_convert then
					left := l_convert.expression
				end
			end
			left.reset
			if attached {ET_CONVERT_EXPRESSION} right as l_convert then
				right := l_convert.expression
			end
			right.reset
		end

feature -- Access

	name: ET_OPERATOR
			-- Feature name

feature -- Status report

	is_boolean_operator: BOOLEAN
			-- Is current infix expression a boolean operator
			-- between two boolean expressions?

	is_false_expression (a_context: ET_TYPE_CONTEXT; a_no_call: BOOLEAN): BOOLEAN
			-- Can current expression be proven to be False statically when viewed from `a_context'?
			-- If `a_no_call` is True, then return False if some calls could be executed
			-- even if current expression can be proven to be False statically.
		do
			if name.is_infix_and_then or name.is_infix_and_then_symbol then
				Result := left.is_false_expression (a_context, a_no_call) or
					(left.is_true_expression (a_context, a_no_call) and right.is_false_expression (a_context, a_no_call))
			elseif name.is_infix_and or name.is_infix_and_symbol then
				if left.is_false_expression (a_context, a_no_call) then
					Result := a_no_call implies (right.is_false_expression (a_context, a_no_call) or right.is_true_expression (a_context, a_no_call))
				elseif left.is_true_expression (a_context, a_no_call) then
					Result := right.is_false_expression (a_context, a_no_call)
				end
			elseif name.is_infix_implies or name.is_infix_implies_symbol then
				Result := left.is_true_expression (a_context, a_no_call) and right.is_false_expression (a_context, a_no_call)
			elseif name.is_infix_or_else or name.is_infix_or_else_symbol then
				Result := left.is_false_expression (a_context, a_no_call) and right.is_false_expression (a_context, a_no_call)
			elseif name.is_infix_or or name.is_infix_or_symbol then
				Result := left.is_false_expression (a_context, a_no_call) and right.is_false_expression (a_context, a_no_call)
			elseif name.is_infix_xor or name.is_infix_xor_symbol then
				if left.is_true_expression (a_context, a_no_call) then
					Result := right.is_true_expression (a_context, a_no_call)
				elseif left.is_false_expression (a_context, a_no_call) then
					Result := right.is_false_expression (a_context, a_no_call)
				end
			end
		end

	is_true_expression (a_context: ET_TYPE_CONTEXT; a_no_call: BOOLEAN): BOOLEAN
			-- Can current expression be proven to be True statically when viewed from `a_context'?
			-- If `a_no_call` is True, then return False if some calls could be executed
			-- even if current expression can be proven to be True statically.
		do
			if name.is_infix_implies or name.is_infix_implies_symbol then
				Result := left.is_false_expression (a_context, a_no_call) or
					(left.is_true_expression (a_context, a_no_call) and right.is_true_expression (a_context, a_no_call))
			elseif name.is_infix_or_else or name.is_infix_or_else_symbol then
				Result := left.is_true_expression (a_context, a_no_call) or
					(left.is_false_expression (a_context, a_no_call) and right.is_true_expression (a_context, a_no_call))
			elseif name.is_infix_and_then or name.is_infix_and_then_symbol then
				Result := left.is_true_expression (a_context, a_no_call) and right.is_true_expression (a_context, a_no_call)
			elseif name.is_infix_and or name.is_infix_and_symbol then
				Result := left.is_true_expression (a_context, a_no_call) and right.is_true_expression (a_context, a_no_call)
			elseif name.is_infix_or or name.is_infix_or_symbol then
				if left.is_true_expression (a_context, a_no_call) then
					Result := a_no_call implies (right.is_false_expression (a_context, a_no_call) or right.is_true_expression (a_context, a_no_call))
				elseif left.is_false_expression (a_context, a_no_call) then
					Result := right.is_true_expression (a_context, a_no_call)
				end
			elseif name.is_infix_xor or name.is_infix_xor_symbol then
				if left.is_true_expression (a_context, a_no_call) then
					Result := right.is_false_expression (a_context, a_no_call)
				elseif left.is_false_expression (a_context, a_no_call) then
					Result := right.is_true_expression (a_context, a_no_call)
				end
			end
		end

feature -- Status setting

	set_boolean_operator (b: BOOLEAN)
			-- Set `is_boolean_operator' to `b'.
		do
			is_boolean_operator := b
		ensure
			boolean_operator_set: is_boolean_operator = b
		end

feature -- Assertions

	add_old_expressions (a_list: DS_ARRAYED_LIST [ET_OLD_EXPRESSION]; a_context: ET_TYPE_CONTEXT)
			-- Add to `a_list' all old expressions appearing in current expression
			-- and (recursively) in its subexpressions when viewed from `a_context'.
		do
			left.add_old_expressions (a_list, a_context)
			if (name.is_infix_implies or name.is_infix_implies_symbol) and left.is_false_expression (a_context, False) then
				-- Ignore right-hand side.
			elseif (name.is_infix_and_then or name.is_infix_and_then_symbol) and left.is_false_expression (a_context, False) then
				-- Ignore right-hand side.
			elseif (name.is_infix_or_else or name.is_infix_or_else_symbol) and left.is_true_expression (a_context, False) then
				-- Ignore right-hand side.
			else
				right.add_old_expressions (a_list, a_context)
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_infix_expression (Current)
		end

invariant

	name_not_void: name /= Void

end
