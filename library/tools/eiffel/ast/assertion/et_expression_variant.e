indexing

	description:

		"Eiffel loop expression variants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_EXPRESSION_VARIANT

inherit

	ET_VARIANT
		rename
			make as make_variant
		redefine
			break
		end

creation

	make

feature {NONE} -- Initialization

	make (a_variant: like variant_keyword; an_expression: like expression) is
			-- Create a new loop expression variant clause.
		require
			a_variant_not_void: a_variant /= Void
			an_expression_not_void: an_expression /= Void
		do
			variant_keyword := a_variant
			expression := an_expression
		ensure
			variant_keyword_set: variant_keyword = a_variant
			expression_set: expression = an_expression
		end

feature -- Access

	expression: ET_EXPRESSION
			-- Integer expression

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := expression.break
		end

invariant

	expression_not_void: expression /= Void

end
