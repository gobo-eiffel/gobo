indexing

	description:

		"Values that have not yet been evaluated"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_CLOSURE

inherit
	
	XM_XPATH_SEQUENCE_VALUE
		redefine
			evaluate_item, display, item_type
		end

		-- A XM_XPATH_CLOSURE represents a value that has not yet been evaluated: the value is represented
		--  by an expression, together with saved values of all the context variables that the
		--  expression depends on.

		-- The XM_XPATH_CLOSURE maintains a reservoir containing those items in the value that have
		--  already been read. When a new iterator is requested to read the value, this iterator
		--  first examines and returns any items already placed in the reservoir by previous
		--  users of the XM_XPATH_CLOSURE. When the reservoir is exhausted, it then uses an underlying
		--  input iterator to read further values of the underlying expression. If the value is
		--  not read to completion (for example, if the first user did exists($expr), then the
		--  input iterator is left positioned where this user abandoned it. The next user will read
		--  any values left in the reservoir by the first user, and then pick up iterating the
		--  base expression where the first user left off. Eventually, all the values of the
		--  expression will find their way into the reservoir, and future users simply iterate
		--  over the reservoir contents. Alternatively, of course, the values may be left unread.

		-- Delayed evaluation is used only for expressions with a static type that allows
		--  more than one item, so the evaluate_item routine will not normally be used, but it is
		--  supported for completeness.

		-- The expression may depend on local variables and on the context item; these values
		--  are held in the saved XM_XPATH_CONTEXT object that is kept as part of the XM_XPATH_CLOSURE, and they
		--  will always be read from that object. The expression may also depend on global variables;
		--  these are unchanging, so they can be read from the XM_XSLT_BINDERY in the normal way. Expressions
		--  that depend on other contextual information, for example the values of position(), last(),
		--  current(), current-group(), should not be evaluated using this mechanism: they should
		--  always be evaluated eagerly. This means that the XM_XPATH_CLOSURE does not need to keep a copy
		--  of these context variables.

feature -- Access
	
	item_type: INTEGER is
			-- Determine the data type of the expression, if possible
		do
			Result := base_expression.item_type
		end

	iterator (a_context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- An iterator over the values of a sequence
		do
			-- TODO
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		local
			another_closure: XM_XPATH_CLOSURE
		do
			another_closure ?= other
			if another_closure /= Void then
				Result := base_expression.same_expression (another_closure.base_expression)
			else
				Result := base_expression.same_expression (other)
			end
		end

feature -- Status report

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		do
			std.error.put_string (indent (a_level))
			std.error.put_string ("closure of expression ")
			std.error.put_new_line
			base_expression.display (a_level + 1, a_pool)
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT): XM_XPATH_ITEM is
			-- Evaluate as a single item
		do
			-- TODO
		end

feature {XM_XPATH_CLOSURE} -- Local

	base_expression: XM_XPATH_EXPRESSION
			-- Underlying expression

end
