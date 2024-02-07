note

	description:

		"Eiffel infix expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2024, Eric Bezault and others"
	license: "MIT License"

class ET_INFIX_EXPRESSION

inherit

	ET_QUALIFIED_FEATURE_CALL_EXPRESSION
		rename
			target as left,
			arguments as right
		undefine
			reset,
			is_instance_free,
			has_result,
			has_address_expression,
			has_agent,
			has_typed_object_test
		end

	ET_BINARY_EXPRESSION
		undefine
			add_separate_arguments
		redefine
			reset
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

feature -- Status setting

	set_boolean_operator (b: BOOLEAN)
			-- Set `is_boolean_operator' to `b'.
		do
			is_boolean_operator := b
		ensure
			boolean_operator_set: is_boolean_operator = b
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
