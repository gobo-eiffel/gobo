note

	description:

		"Eiffel object-test expressions using the old syntax"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2014, Eric Bezault and others"
	license: "MIT License"

class ET_OLD_OBJECT_TEST

inherit

	ET_NAMED_OBJECT_TEST
		rename
			make as make_named_object_test
		redefine
			position,
			first_leaf,
			last_leaf,
			declared_type,
			type,
			process
		end

create

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_type: like type; a_expression: like expression)
			-- Create a new object-test expression.
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			a_expression_not_void: a_expression /= Void
		do
			attached_keyword := tokens.attached_keyword
			as_keyword := tokens.as_keyword
			left_brace := tokens.left_brace_symbol
			name := a_name
			colon := tokens.colon_symbol
			declared_type := a_type
			right_brace := tokens.right_brace_symbol
			expression := a_expression
		ensure
			name_set: name = a_name
			type_set: type = a_type
			expression_set: expression = a_expression
		end

feature -- Access

	left_brace: ET_SYMBOL
			-- '{' symbol

	colon: ET_SYMBOL
			-- ':' symbol

	right_brace: ET_SYMBOL
			-- '}' symbol

	declared_type: ET_TARGET_TYPE
			-- Type declared in the object test, surrounded by braces

	type: ET_TYPE
			-- Type expected for the expression
		do
			Result := declared_type.type
		ensure then
			type_not_void: Result /= Void
		end

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := left_brace.position
			if Result.is_null then
				Result := name.position
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := left_brace
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := expression.last_leaf
		end

feature -- Setting

	set_left_brace (a_brace: like left_brace)
			-- Set `left_brace' to `a_brace'.
		require
			a_brace_not_void: a_brace /= Void
		do
			left_brace := a_brace
		ensure
			left_brace_set: left_brace = a_brace
		end

	set_right_brace (a_brace: like right_brace)
			-- Set `right_brace' to `a_brace'.
		require
			a_brace_not_void: a_brace /= Void
		do
			right_brace := a_brace
		ensure
			right_brace_set: right_brace = a_brace
		end

	set_colon (a_colon: like colon)
			-- Set `colon' to `a_colon'.
		require
			a_colon_not_void: a_colon /= Void
		do
			colon := a_colon
		ensure
			colon_set: colon = a_colon
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_old_object_test (Current)
		end

invariant

	declared_type_not_void: declared_type /= Void
	left_brace_not_void: left_brace /= Void
	right_brace_not_void: right_brace /= Void
	colon_not_void: colon /= Void

end
