indexing

	description:

		"Eiffel loop variants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_VARIANT

inherit

	ET_AST_NODE

creation

	make

feature {NONE} -- Initialization

	make (a_variant: like variant_keyword) is
			-- Create a new empty loop variant clause.
		require
			a_variant_not_void: a_variant /= Void
		do
			variant_keyword := a_variant
		ensure
			variant_keyword_set: variant_keyword = a_variant
		end

feature -- Access

	variant_keyword: ET_TOKEN
			-- 'variant' keyword

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := variant_keyword.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := variant_keyword.break
		end

invariant

	variant_keyword_not_void: variant_keyword /= Void

end -- class ET_VARIANT
