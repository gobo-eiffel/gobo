note

	description:

		"Eiffel loop instruction of the form '⟳ ... ⟲'"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_REPEAT_INSTRUCTION

inherit

	ET_ITERATION_INSTRUCTION

create

	make

feature {NONE} -- Initialization

	make (a_cursor_name: like cursor_name;
		a_iterable_expression: like iterable_expression;
		a_loop_compound: like loop_compound)
			-- Create a new loop instruction of the form '⟳ ... ⟲'.
		require
			a_cursor_name_not_void: a_cursor_name /= Void
			a_iterable_expression_not_void: a_iterable_expression /= Void
		do
			open_repeat_symbol := tokens.open_repeat_symbol
			cursor_name := a_cursor_name
			colon_symbol := tokens.colon_symbol
			iterable_expression := a_iterable_expression
			bar_symbol := tokens.bar_symbol
			loop_compound := a_loop_compound
			close_repeat_symbol := tokens.close_repeat_symbol
			create_unfolded_form
		ensure
			cursor_name_set: cursor_name = a_cursor_name
			iterable_expression_set: iterable_expression = a_iterable_expression
			loop_compound_set: loop_compound = a_loop_compound
		end

feature -- Status report

	has_item_cursor: BOOLEAN = True
			-- Should `cursor_name' represent the items being traversed?
			-- Otherwise it represents the cursor used for the traversal.
			-- True in case of 'across ... is ...' (as opposed to
			-- 'across ... as ...'), or for quantifier expressions or
			-- repeat instructions.

feature -- Access

	open_repeat_symbol: ET_SYMBOL
			-- '⟳' symbol

	colon_symbol: ET_SYMBOL
			-- ':' symbol

	bar_symbol: ET_SYMBOL
			-- '¦' symbol

	loop_compound: detachable ET_COMPOUND
			-- Loop compound

	close_repeat_symbol: ET_SYMBOL
			-- '⟲' symbol

	from_compound: detachable ET_COMPOUND
			-- From compound
		do
			-- Result := Void
		end

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
			if not open_repeat_symbol.position.is_null then
				Result := open_repeat_symbol.position
			else
				Result := cursor_name.position
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := open_repeat_symbol
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := close_repeat_symbol
		end

feature -- Setting

	set_open_repeat_symbol (a_symbol: like open_repeat_symbol)
			-- Set `open_repeat_symbol' to `a_symbol'.
		require
			a_symbol_not_void: a_symbol /= Void
		do
			open_repeat_symbol := a_symbol
		ensure
			open_repeat_symbol_set: open_repeat_symbol = a_symbol
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

	set_loop_compound (a_loop_compound: like loop_compound)
			-- Set `loop_compound' to `a_loop_compound'.
		do
			loop_compound := a_loop_compound
		ensure
			loop_compound_set: loop_compound = a_loop_compound
		end

	set_close_repeat_symbol (a_symbol: like close_repeat_symbol)
			-- Set `close_repeat_symbol' to `a_symbol'.
		require
			a_symbol_not_void: a_symbol /= Void
		do
			close_repeat_symbol := a_symbol
		ensure
			close_repeat_symbol_set: close_repeat_symbol = a_symbol
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_repeat_instruction (Current)
		end

invariant

	open_repeat_symbol_not_void: open_repeat_symbol /= Void
	colon_symbol_not_void: colon_symbol /= Void
	bar_symbol_not_void: bar_symbol /= Void
	loop_compound_not_void: loop_compound /= Void
	close_repeat_symbol_not_void: close_repeat_symbol /= Void

end
