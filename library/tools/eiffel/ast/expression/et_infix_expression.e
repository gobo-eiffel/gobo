note

	description:

		"Eiffel infix expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_INFIX_EXPRESSION

inherit

	ET_FEATURE_CALL_EXPRESSION
		rename
			target as left,
			arguments as right
		undefine
			reset
		end

	ET_BINARY_EXPRESSION
		redefine
			reset
		end

create

	make

feature {NONE} -- Initialization

	make (a_left: like left; a_name: like name; a_right: like right) is
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

	reset is
			-- Reset expression as it was just after it was last parsed.
		local
			l_cast: ET_INFIX_CAST_EXPRESSION
			l_convert: ET_CONVERT_EXPRESSION
		do
			name.reset
			is_boolean_operator := False
			l_cast ?= left
			if l_cast /= Void then
				left := l_cast.expression
				l_convert ?= left
				if l_convert /= Void then
					left := l_convert.expression
				end
			end
			left.reset
			l_convert ?= right
			if l_convert /= Void then
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

	set_boolean_operator (b: BOOLEAN) is
			-- Set `is_boolean_operator' to `b'.
		do
			is_boolean_operator := b
		ensure
			boolean_operator_set: is_boolean_operator = b
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_infix_expression (Current)
		end

invariant

	name_not_void: name /= Void

end
