note

	description:

		"Eiffel address expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "MIT License"

deferred class ET_ADDRESS_EXPRESSION

inherit

	ET_EXPRESSION
		redefine
			is_never_void,
			has_address_expression
		end

feature -- Access

	dollar: ET_SYMBOL
			-- '$' symbol

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := dollar.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := dollar
		end

feature -- Status report

	is_never_void: BOOLEAN = True
			-- Can current expression never be void?

	has_address_expression: BOOLEAN = True
			-- Does an address expression appear in current expression
			-- or (recursively) in one of its subexpressions?

feature -- Setting

	set_dollar (a_dollar: like dollar)
			-- Set `dollar' to `a_dollar'.
		require
			a_dollar_not_void: a_dollar /= Void
		do
			dollar := a_dollar
		ensure
			dollar_set: dollar = a_dollar
		end

invariant

	dollar_not_void: dollar /= Void

end
