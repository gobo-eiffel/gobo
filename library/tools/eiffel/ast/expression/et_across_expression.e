note

	description:

		"Eiffel across expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2012-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ACROSS_EXPRESSION

inherit

	ET_EXPRESSION
		redefine
			reset
		end

	ET_ACROSS_COMPONENT

create

	make_some,
	make_all

feature {NONE} -- Initialization

	make_some (a_iterable_expression: like iterable_expression;
		a_cursor_name: like cursor_name;
		an_until_conditional: like until_conditional;
		a_iteration_conditional: like iteration_conditional)
			-- Create a new across some expression.
		require
			a_iterable_expression_not_void: a_iterable_expression /= Void
			a_cursor_name_not_void: a_cursor_name /= Void
			a_iteration_conditional_not_void: a_iteration_conditional /= Void
		do
			across_keyword := tokens.across_keyword
			iterable_expression := a_iterable_expression
			as_keyword := tokens.as_keyword
			cursor_name := a_cursor_name
			until_conditional := an_until_conditional
			iteration_conditional := a_iteration_conditional
			end_keyword := tokens.end_keyword
			is_all := False
			create_unfolded_form
		ensure
			iterable_expression_set: iterable_expression = a_iterable_expression
			cursor_name_set: cursor_name = a_cursor_name
			until_conditional_set: until_conditional = an_until_conditional
			iteration_conditional_set: iteration_conditional = a_iteration_conditional
			is_some: is_some
		end

	make_all (a_iterable_expression: like iterable_expression;
		a_cursor_name: like cursor_name;
		an_until_conditional: like until_conditional;
		a_iteration_conditional: like iteration_conditional)
			-- Create a new across all expression.
		require
			a_iterable_expression_not_void: a_iterable_expression /= Void
			a_cursor_name_not_void: a_cursor_name /= Void
			a_iteration_conditional_not_void: a_iteration_conditional /= Void
		do
			across_keyword := tokens.across_keyword
			iterable_expression := a_iterable_expression
			as_keyword := tokens.as_keyword
			cursor_name := a_cursor_name
			until_conditional := an_until_conditional
			iteration_conditional := a_iteration_conditional
			end_keyword := tokens.end_keyword
			is_all := True
			create_unfolded_form
		ensure
			iterable_expression_set: iterable_expression = a_iterable_expression
			cursor_name_set: cursor_name = a_cursor_name
			until_conditional_set: until_conditional = an_until_conditional
			iteration_conditional_set: iteration_conditional = a_iteration_conditional
			is_all: is_all
		end

feature -- Initialization

	reset
			-- Reset expression as it was just after it was last parsed.
		do
			iterable_expression.reset
			if invariant_part /= Void then
				invariant_part.reset
			end
			if variant_part /= Void then
				variant_part.reset
			end
			if until_conditional /= Void then
				until_conditional.expression.reset
			end
			iteration_conditional.expression.reset
			reset_unfolded_form
		end

feature -- Status report

	is_all: BOOLEAN
			-- Is `iteration_conditional' of the form "all Expression"?

	is_some: BOOLEAN
			-- Is `iteration_conditional' of the form "some Expression"?
		do
			Result := not is_all
		end

feature -- Access

	invariant_part: ET_LOOP_INVARIANTS
			-- Invariant part

	variant_part: ET_VARIANT
			-- Variant part

	until_conditional: ET_CONDITIONAL
			-- Until conditional

	iteration_conditional: ET_CONDITIONAL
			-- Some or all conditional

	end_keyword: ET_KEYWORD
			-- 'end' keyword

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			if not across_keyword.position.is_null then
				Result := across_keyword.position
			else
				Result := iterable_expression.position
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := across_keyword
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := end_keyword
		end

	break: ET_BREAK
			-- Break which appears just after current node
		do
			Result := end_keyword.break
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

	set_until_conditional (a_conditional: like until_conditional)
			-- Set `until_conditional' to `a_conditional'.
		do
			until_conditional := a_conditional
		ensure
			until_conditional_set: until_conditional = a_conditional
		end

	set_iteration_conditional (a_conditional: like iteration_conditional)
			-- Set `iteration_conditional' to `a_conditional'.
		do
			iteration_conditional := a_conditional
		ensure
			iteration_conditional_set: iteration_conditional = a_conditional
		end

	set_invariant_part (an_invariant: like invariant_part)
			-- Set `invariant_part' to `an_invariant'.
		do
			invariant_part := an_invariant
		ensure
			invariant_part_set: invariant_part = an_invariant
		end

	set_variant_part (a_variant: like variant_part)
			-- Set `variant_part' to `a_variant'.
		do
			variant_part := a_variant
		ensure
			variant_part_set: variant_part = a_variant
		end

	set_end_keyword (an_end: like end_keyword)
			-- Set `end_keyword' to `an_end'.
		require
			an_end_not_void: an_end /= Void
		do
			end_keyword := an_end
		ensure
			end_keyword_set: end_keyword = an_end
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
	some_or_all: is_some xor is_all

end
