note

	description:

		"Eiffel across components (either across expressions or across instructions)"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2012-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ACROSS_COMPONENT

inherit

	ET_ITERATION_COMPONENT

feature -- Status report

	has_cursor_name: BOOLEAN
			-- Should `item_name' represent the cursor used for the traversal?
			-- Otherwise it represents the items being traversed.
			-- True in case of 'across ... as ...' when 'obsolete_iteration_mode'
			-- is set to True in the surrounding universe, False otherwise.

feature -- Access

	across_keyword: ET_KEYWORD
			-- 'across' keyword

	as_keyword: ET_KEYWORD
			-- 'as' or 'is' keyword

	invariant_part: detachable ET_LOOP_INVARIANTS
			-- Invariant part

	variant_part: detachable ET_VARIANT
			-- Variant part

	until_conditional: detachable ET_CONDITIONAL
			-- Until conditional

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

feature -- Status setting

	set_has_cursor_name (b: BOOLEAN)
			-- Set `has_cursor_name' to `b'.
		do
			has_cursor_name := b
		ensure
			has_cursor_name_set: has_cursor_name = b
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

	set_until_conditional (a_conditional: like until_conditional)
			-- Set `until_conditional' to `a_conditional'.
		do
			until_conditional := a_conditional
		ensure
			until_conditional_set: until_conditional = a_conditional
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

invariant

	across_keyword_not_void: across_keyword /= Void
	as_keyword_not_void: as_keyword /= Void
	end_keyword_not_void: end_keyword /= Void

end
