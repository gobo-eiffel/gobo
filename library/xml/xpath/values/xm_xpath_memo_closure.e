indexing

	description:

		"Values that have not yet been evaluated"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_MEMO_CLOSURE

inherit
	
	XM_XPATH_CLOSURE
		redefine
			make, create_iterator, same_expression, process
		end

creation {XM_XPATH_EXPRESSION_FACTORY}

	make

		-- An XM_XPATH_MEMO_CLOSURE represents a value that has not yet been evaluated: the value is represented
		--  by an expression, together with saved values of all the context variables that the
		--  expression depends on. It is designed for when the value may be read more than once.

		-- The XM_XPATH_MEMO_CLOSURE maintains a reservoir containing those items in the value that have
		--  already been read. When a new iterator is requested to read the value, this iterator
		--  first examines and returns any items already placed in the reservoir by previous
		--  users of the XM_XPATH_MEMO_CLOSURE. When the reservoir is exhausted, it then uses an underlying
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
		--  are held in the saved XM_XPATH_CONTEXT object that is kept as part of the XM_XPATH_MEMO_CLOSURE, and they
		--  will always be read from that object. The expression may also depend on global variables;
		--  these are unchanging, so they can be read from the XM_XSLT_BINDERY in the normal way. Expressions
		--  that depend on other contextual information, for example the values of position(), last(),
		--  current(), current-group(), should not be evaluated using this mechanism: they should
		--  always be evaluated eagerly. This means that the XM_XPATH_MEMO_CLOSURE does not need to keep a copy
		--  of these context variables.

feature {NONE} -- Initialization

	make (an_expression: XM_XPATH_EXPRESSION; a_context: XM_XPATH_CONTEXT) is
			-- Establish invariant.
			-- Do not call directly. Use {XM_XPATH_EXPRESSION_FACTORY}.make_closure.
		do
			Precursor (an_expression, a_context)
			state := Unread_state
			create reservoir.make_default
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		local
			another_closure: XM_XPATH_MEMO_CLOSURE
		do
			another_closure ?= other
			if another_closure /= Void then
				Result := base_expression.same_expression (another_closure.base_expression)
			else
				Result := base_expression.same_expression (other)
			end
		end

feature -- Evaluation

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- An iterator over the values of a sequence
		do
			if reservoir.count > 0 then
				if input_iterator /= Void and then input_iterator.after then
					state := All_read_state
				end
			end
			inspect
				state
			when Unread_state then
				state := Busy_state
				base_expression.create_iterator (saved_xpath_context)
				input_iterator := base_expression.last_iterator
				state := Maybe_more_state
				create {XM_XPATH_PROGRESSIVE_ITERATOR} last_iterator.make (reservoir, input_iterator) 
			when Maybe_more_state then
				create {XM_XPATH_PROGRESSIVE_ITERATOR} last_iterator.make (reservoir, input_iterator)
			when All_read_state then
				create {XM_XPATH_ARRAY_LIST_ITERATOR [XM_XPATH_ITEM]} last_iterator.make (reservoir)
			when Busy_state then
				create {XM_XPATH_INVALID_ITERATOR} last_iterator.make_from_string ("Attempt to access a lazily-evaluated variable while it is being evaluated",
																								Gexslt_eiffel_type_uri, "BUSY_CLOSURE", Dynamic_error)
			end
		end

	process (a_context: XM_XPATH_CONTEXT) is
			-- Execute `Current' completely, writing results to the current `XM_XPATH_RECEIVER'.
		do
			todo ("process", False)
		end
	
feature {XM_XPATH_MEMO_CLOSURE} -- Local

	state: INTEGER
			-- Information on items read

	Unread_state: INTEGER is 1
	Maybe_more_state: INTEGER is 2
	All_read_state: INTEGER is 3
	Busy_state: INTEGER is 4
	
	reservoir: DS_ARRAYED_LIST [XM_XPATH_ITEM]
			-- List of items already read

invariant

	state: Unread_state <= state and state <= All_read_state
	reservoir_not_void: reservoir /= Void

end
