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
			evaluate_item, display, item_type, is_convertible_to_item, as_item
		end

creation {XM_XPATH_EXPRESSION_FACTORY}

	make

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

feature {NONE} -- Initialization

	make (an_expression: XM_XPATH_EXPRESSION; a_context: XM_XPATH_CONTEXT) is
			-- Establish invariant.
			-- Do not call directly. Use {XM_XPATH_EXPRESSION_FACTORY}.make_closure.
		require
			valid_expression: an_expression /= Void and then not (an_expression.depends_upon_position or else an_expression.depends_upon_last)
			context_not_void: a_context /= Void
		local
			new_singleton_iterator: XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ITEM]
		do
			make_value
			base_expression := an_expression
			clone_cardinality (base_expression)
			clone_special_properties (base_expression)
			saved_xpath_context := a_context.new_context
			state := Unread_state
			if saved_xpath_context.current_iterator /= Void then
				create new_singleton_iterator.make (saved_xpath_context.current_iterator.item)
				saved_xpath_context.set_current_iterator (new_singleton_iterator)
			end
		ensure
			base_expression_set: base_expression = an_expression
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := base_expression.item_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
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

	is_convertible_to_item (a_context: XM_XPATH_CONTEXT): BOOLEAN is
			-- Can `Current' be converted to an `XM_XPATH_ITEM'?
		do
			Result := True
		end

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		do
			std.error.put_string (indentation (a_level))
			std.error.put_string ("closure of expression ")
			if is_error then
				std.error.put_string (" in error%N")
			else
				std.error.put_new_line
				base_expression.display (a_level + 1, a_pool)
			end
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		do
			-- TODO
			todo ("evaluate-item", False)
		end

	iterator (a_context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- An iterator over the values of a sequence
		do
			-- TODO
			todo ("iterator" ,False)
		end

feature  -- Conversion

	as_item (a_context: XM_XPATH_CONTEXT): XM_XPATH_ITEM is
			-- Convert to an item
		do
			evaluate_item (a_context)
			Result := last_evaluated_item 
		end
	
feature {XM_XPATH_CLOSURE} -- Local

	base_expression: XM_XPATH_EXPRESSION
			-- Underlying expression

	saved_xpath_context: XM_XPATH_CONTEXT
			-- Context created when the closure was created

	state: INTEGER
			-- Information on items read

	Unread_state, Maybe_more_state, More_to_come_state, All_read_state: INTEGER is unique
	
invariant

	base_expression_not_void: base_expression /= Void
	saved_xpath_context_not_void: saved_xpath_context /= Void
	state: Unread_state <= state and state <= All_read_state

end
