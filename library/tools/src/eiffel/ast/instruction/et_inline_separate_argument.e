note

	description:

		"Eiffel arguments in inline separate instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2022-2024, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_INLINE_SEPARATE_ARGUMENT

inherit

	ET_INLINE_SEPARATE_ARGUMENT_ITEM

	HASHABLE

create

	make

feature {NONE} -- Initialization

	make (a_expression: like expression; a_name: like name)
			-- Create a new inline separate argument.
		require
			a_expression_not_void: a_expression /= Void
			a_name_not_void: a_name /= Void
		do
			expression := a_expression
			as_keyword := tokens.as_keyword
			name := a_name
		ensure
			expression_set: expression = a_expression
			name_set: name = a_name
		end

feature -- Initialization

	reset
			-- Reset inline separate argument as it was when it was last parsed.
		do
			expression.reset
			name.reset
		end

feature -- Access

	expression: ET_EXPRESSION
			-- Actual value of argument

	as_keyword: ET_KEYWORD
			-- 'as' keyword

	name: ET_IDENTIFIER
			-- Name of argument

	argument: ET_INLINE_SEPARATE_ARGUMENT
			-- Inline separate argument in comma-separated list
		do
			Result := Current
		end

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := expression.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := expression.first_leaf
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := name
		end

	hash_code: INTEGER
			-- Hash value
		do
			Result := name.hash_code
		end

feature -- Setting

	set_expression (a_expression: like expression)
			-- Set `expression' to `a_expression'.
		require
			a_expression_not_void: a_expression /= Void
		do
			expression := a_expression
		ensure
			expression_set: expression = a_expression
		end

	set_as_keyword (a_as: like as_keyword)
			-- Set `as_keyword' to `a_as'.
		require
			a_as_not_void: a_as /= Void
		do
			as_keyword := a_as
		ensure
			as_keyword_set: as_keyword = a_as
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_inline_separate_argument (Current)
		end

invariant

	expression_not_void: expression /= Void
	as_keyword_not_void: as_keyword /= Void
	name_not_void: name /= Void

end
