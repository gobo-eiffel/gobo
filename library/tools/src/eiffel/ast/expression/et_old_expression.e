note

	description:

		"Eiffel old expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "MIT License"

class ET_OLD_EXPRESSION

inherit

	ET_UNARY_EXPRESSION
		redefine
			reset
		end

create

	make

feature {NONE} -- Initialization

	make (e: like expression)
			-- Create a new old expression.
		require
			e_not_void: e /= Void
		do
			old_keyword := tokens.old_keyword
			expression := e
		ensure
			expression_set: expression = e
		end

feature -- Initialization

	reset
			-- Reset expression as it was just after it was last parsed.
		do
			expression.reset
		end

feature -- Access

	old_keyword: ET_KEYWORD
			-- 'old' keyword

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := old_keyword.position
			if Result.is_null then
				Result := expression.position
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := old_keyword
		end

feature -- Setting

	set_old_keyword (an_old: like old_keyword)
			-- Set `old_keyword' to `an_old'.
		require
			an_old_not_void: an_old /= Void
		do
			old_keyword := an_old
		ensure
			old_keyword_set: old_keyword = an_old
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_old_expression (Current)
		end

invariant

	old_keyword_not_void: old_keyword /= Void

end
