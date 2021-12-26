note

	description:

		"Eiffel quantifier expressions of the form '∀' or '∃'"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2019-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_QUANTIFIER_EXPRESSION

inherit

	ET_ITERATION_EXPRESSION

create

	make_there_exists,
	make_for_all

feature {NONE} -- Initialization

	make_there_exists (a_cursor_name: like cursor_name;
		a_iterable_expression: like iterable_expression;
		a_iteration_expression: like iteration_expression)
			-- Create a new quantifier expression of the form '∃'.
		require
			a_cursor_name_not_void: a_cursor_name /= Void
			a_iterable_expression_not_void: a_iterable_expression /= Void
			a_iteration_expression_not_void: a_iteration_expression /= Void
		do
			quantifier_symbol := tokens.there_exists_symbol
			cursor_name := a_cursor_name
			colon_symbol := tokens.colon_symbol
			iterable_expression := a_iterable_expression
			bar_symbol := tokens.bar_symbol
			iteration_expression := a_iteration_expression
			is_all := False
			create_unfolded_form
		ensure
			cursor_name_set: cursor_name = a_cursor_name
			iterable_expression_set: iterable_expression = a_iterable_expression
			iteration_expression_set: iteration_expression = a_iteration_expression
			is_some: is_some
		end

	make_for_all (a_cursor_name: like cursor_name;
		a_iterable_expression: like iterable_expression;
		a_iteration_expression: like iteration_expression)
			-- Create a new quantifier expression of the form '∀'.
		require
			a_cursor_name_not_void: a_cursor_name /= Void
			a_iterable_expression_not_void: a_iterable_expression /= Void
			a_iteration_conditional_not_void: a_iteration_expression /= Void
		do
			quantifier_symbol := tokens.there_exists_symbol
			cursor_name := a_cursor_name
			colon_symbol := tokens.colon_symbol
			iterable_expression := a_iterable_expression
			bar_symbol := tokens.bar_symbol
			iteration_expression := a_iteration_expression
			is_all := True
			create_unfolded_form
		ensure
			cursor_name_set: cursor_name = a_cursor_name
			iterable_expression_set: iterable_expression = a_iterable_expression
			iteration_expression_set: iteration_expression = a_iteration_expression
			is_all: is_all
		end

feature -- Status report

	is_all: BOOLEAN
			-- Is the iteration of form '∀'?

	has_item_cursor: BOOLEAN = True
			-- Should `cursor_name' represent the items being traversed?
			-- Otherwise it represents the cursor used for the traversal.
			-- True in case of 'across ... as ...' when 'obsolete_iteration_mode'
			-- is set to False in the surrounding universe (and in case
			-- of the obsolete syntax 'across ... is ...'), or for quantifier
			-- expressions or repeat instructions.

feature -- Access

	quantifier_symbol: ET_SYMBOL
			-- '∃' or '∀' symbol

	colon_symbol: ET_SYMBOL
			-- ':' symbol

	bar_symbol: ET_SYMBOL
			-- '¦' symbol

	iteration_expression: ET_EXPRESSION
			-- For all or there exists expression

	invariant_part: detachable ET_LOOP_INVARIANTS
			-- Invariant part
		do
			-- Result := Void
		end

	variant_part: detachable ET_VARIANT
			-- Variant part
		do
			-- Result := Void
		end

	until_conditional: detachable ET_CONDITIONAL
			-- Until conditional
		do
			-- Result := Void
		end

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			if not quantifier_symbol.position.is_null then
				Result := quantifier_symbol.position
			else
				Result := cursor_name.position
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := quantifier_symbol
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := iteration_expression.last_leaf
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

	set_quantifier_symbol (a_symbol: like quantifier_symbol)
			-- Set `quantifier_symbol' to `a_symbol'.
		require
			a_symbol_not_void: a_symbol /= Void
		do
			quantifier_symbol := a_symbol
		ensure
			quantifier_symbol_set: quantifier_symbol = a_symbol
		end

	set_colon_symbol (a_symbol: like colon_symbol)
			-- Set `colon_symbol' to `a_symbol'.
		require
			a_symbol_not_void: a_symbol /= Void
		do
			colon_symbol := a_symbol
		ensure
			colon_symbol_set: colon_symbol = a_symbol
		end

	set_bar_symbol (a_symbol: like bar_symbol)
			-- Set `bar_symbol' to `a_symbol'.
		require
			a_symbol_not_void: a_symbol /= Void
		do
			bar_symbol := a_symbol
		ensure
			bar_symbol_set: bar_symbol = a_symbol
		end

	set_iteration_expression (a_iteration_expression: like iteration_expression)
			-- Set `iteration_expression' to `a_iteration_expression'.
		require
			a_iteration_expression_not_void: a_iteration_expression /= Void
		do
			iteration_expression := a_iteration_expression
		ensure
			iteration_expression_set: iteration_expression = a_iteration_expression
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_quantifier_expression (Current)
		end

invariant

	quantifier_symbol_not_void: quantifier_symbol /= Void
	colon_symbol_not_void: colon_symbol /= Void
	bar_symbol_not_void: bar_symbol /= Void

end
