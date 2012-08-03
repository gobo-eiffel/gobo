note

	description:

		"Eiffel across components (either across expressions or across instructions)"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2012, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ACROSS_COMPONENT

inherit

	ET_AST_NODE

	HASHABLE

feature -- Access

	across_keyword: ET_KEYWORD
			-- 'across' keyword

	iterable_expression: ET_EXPRESSION
			-- Iterable expression

	as_keyword: ET_KEYWORD
			-- 'as' keyword

	cursor_name: ET_IDENTIFIER
			-- Iteration cursor name

	hash_code: INTEGER
			-- Hash value
		do
			Result := cursor_name.hash_code
		end

feature -- Setting

	set_across_keyword (a_across_keyword: like across_keyword)
			-- Set `a_across_keyword' to `across_keyword'.
		require
			a_across_keyword_not_void: a_across_keyword /= Void
		do
			across_keyword := a_across_keyword
		ensure
			across_keyword_set: across_keyword = a_across_keyword
		end

	set_as_keyword (a_as_keyword: like as_keyword)
			-- Set `a_as_keyword' to `as_keyword'.
		require
			a_as_keyword_not_void: a_as_keyword /= Void
		do
			as_keyword := a_as_keyword
		ensure
			as_keyword_set: as_keyword = a_as_keyword
		end

feature -- Unfolded form

	new_cursor_expression: ET_CALL_EXPRESSION
			-- Expression corresponding to `iterable_expression'.new_cursor

	cursor_after_expression: ET_CALL_EXPRESSION
			-- Expression corresponding to `cursor_name'.after

	cursor_forth_instruction: ET_CALL_INSTRUCTION
			-- Instruction corresponding to `cursor_name'.forth

	create_unfolded_form
			-- Create the components of the unfolded form.
		local
			l_name: ET_IDENTIFIER
		do
			create l_name.make (tokens.new_cursor_name)
			l_name.set_position (cursor_name.line, cursor_name.column)
			create new_cursor_expression.make (iterable_expression, l_name, Void)
			create l_name.make (tokens.after_name)
			l_name.set_position (cursor_name.line, cursor_name.column)
			create cursor_after_expression.make (cursor_name, l_name, Void)
			create l_name.make (tokens.forth_name)
			l_name.set_position (cursor_name.line, cursor_name.column)
			create cursor_forth_instruction.make (cursor_name, l_name, Void)
		end

	reset_unfolded_form
			-- Reset the components of the unfolded form as
			-- they were just after it was last parsed.
		do
			new_cursor_expression.name.reset
			cursor_after_expression.name.reset
			cursor_forth_instruction.name.reset
		end

invariant

	across_keyword_not_void: across_keyword /= Void
	iterable_expression_not_void: iterable_expression /= Void
	as_keyword_not_void: as_keyword /= Void
	cursor_name_not_void: cursor_name /= Void
	new_cursor_expression_not_void: new_cursor_expression /= Void
	cursor_after_expression_not_void: cursor_after_expression /= Void
	cursor_forth_instruction_not_void: cursor_forth_instruction /= Void

end
