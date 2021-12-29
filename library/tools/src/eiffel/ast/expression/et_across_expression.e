note

	description:

		"Eiffel across expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2012-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ACROSS_EXPRESSION

inherit

	ET_ITERATION_EXPRESSION

	ET_ACROSS_COMPONENT
		undefine
			reset
		end

create

	make_some,
	make_all

feature {NONE} -- Initialization

	make_some (a_iterable_expression: like iterable_expression;
		a_item_name: like item_name;
		an_until_conditional: like until_conditional;
		a_iteration_conditional: like iteration_conditional)
			-- Create a new across some expression.
		require
			a_iterable_expression_not_void: a_iterable_expression /= Void
			a_item_name_not_void: a_item_name /= Void
			a_iteration_conditional_not_void: a_iteration_conditional /= Void
		do
			across_keyword := tokens.across_keyword
			iterable_expression := a_iterable_expression
			as_keyword := tokens.as_keyword
			item_name := a_item_name
			until_conditional := an_until_conditional
			iteration_conditional := a_iteration_conditional
			end_keyword := tokens.end_keyword
			is_all := False
			has_cursor_name := False
			create_unfolded_form
		ensure
			iterable_expression_set: iterable_expression = a_iterable_expression
			item_name_set: item_name = a_item_name
			until_conditional_set: until_conditional = an_until_conditional
			iteration_conditional_set: iteration_conditional = a_iteration_conditional
			not_has_cursor_name: not has_cursor_name
			is_some: is_some
		end

	make_all (a_iterable_expression: like iterable_expression;
		a_item_name: like item_name;
		an_until_conditional: like until_conditional;
		a_iteration_conditional: like iteration_conditional)
			-- Create a new across all expression.
		require
			a_iterable_expression_not_void: a_iterable_expression /= Void
			a_item_name_not_void: a_item_name /= Void
			a_iteration_conditional_not_void: a_iteration_conditional /= Void
		do
			across_keyword := tokens.across_keyword
			iterable_expression := a_iterable_expression
			as_keyword := tokens.as_keyword
			item_name := a_item_name
			until_conditional := an_until_conditional
			iteration_conditional := a_iteration_conditional
			end_keyword := tokens.end_keyword
			is_all := True
			has_cursor_name := False
			create_unfolded_form
		ensure
			iterable_expression_set: iterable_expression = a_iterable_expression
			item_name_set: item_name = a_item_name
			until_conditional_set: until_conditional = an_until_conditional
			iteration_conditional_set: iteration_conditional = a_iteration_conditional
			not_has_cursor_name: not has_cursor_name
			is_all: is_all
		end

feature -- Status report

	is_all: BOOLEAN
			-- Is `iteration_conditional' of the form "all Expression"?

feature -- Access

	iteration_conditional: ET_CONDITIONAL
			-- Some or all conditional

	iteration_expression: ET_EXPRESSION
			-- Some or all expression
		do
			Result := iteration_conditional.expression
		end

feature -- Setting

	set_all (b: BOOLEAN)
			-- Set `is_all' to `b'.
		do
			is_all := b
		ensure
			all_set: is_all = b
		end

	set_some (b: BOOLEAN)
			-- Set `is_some' to `b'.
		do
			is_all := not b
		ensure
			some_set: is_some = b
		end

	set_iteration_conditional (a_conditional: like iteration_conditional)
			-- Set `iteration_conditional' to `a_conditional'.
		do
			iteration_conditional := a_conditional
		ensure
			iteration_conditional_set: iteration_conditional = a_conditional
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_across_expression (Current)
		end

invariant

	iteration_conditional_not_void: iteration_conditional /= Void
	end_keyword_not_void: end_keyword /= Void

end
