indexing

	description:

		"Objects that concatenate the results of two iterators."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_APPEND_ITERATOR

inherit

	XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]

creation

	make

feature {NONE} -- Initialization

	make (a_base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]; an_expression: XM_XPATH_EXPRESSION; a_context: XM_XPATH_CONTEXT) is
			-- Establish invariant.
			-- This form of creation procedure is designed to delay getting an iterator for the second
			--  expression until it is actually needed.
			-- This gives savings in cases where the iteration is aborted prematurely.
		require
			base_iterator_not_void: a_base_iterator /= Void
			expresssion_not_void: an_expression /= void
		do
			base_iterator := a_base_iterator
			second_expression := an_expression
			context := a_context
			current_iterator := base_iterator
		ensure
			base_set: base_iterator = a_base_iterator
			second_expression_set: second_expression = an_expression
			context_set: context = a_context
		end

feature -- Access

	item: XM_XPATH_ITEM is
			-- Value or node at the current position
		do
			Result := current_iterator.item
		end

feature -- Status report

	after: BOOLEAN is
			-- Are there any more items in the sequence?
		do
			Result := current_iterator.after
			if Result and then current_iterator = base_iterator then
				current_iterator := second_expression.iterator (context)
				current_iterator.start
				Result := current_iterator.after
			end
		end

feature -- Cursor movement

	forth is
			-- Move to next position
		do
			index := index + 1
			if current_iterator = base_iterator and then not current_iterator.before and then current_iterator.after then
				current_iterator := second_expression.iterator (context)
			end
			current_iterator.forth
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original
		do
			create Result.make (base_iterator.another, second_expression, context)
		end

feature {NONE} -- Implementation

	base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			-- The underlying iterator

	context: XM_XPATH_CONTEXT
			-- Optional dynamic context

	second_expression: XM_XPATH_EXPRESSION
			-- Expression which supplies the second iterator

	current_iterator: like base_iterator
			-- Iterator currently being used

invariant

	base_iterator_not_void: base_iterator /= Void
	second_expression_not_void: second_expression /= Void
	current_iterator_not_void: current_iterator /= Void

end
