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
			evaluate_item, display, item_type, is_convertible_to_item, as_item, process
		end

creation {XM_XPATH_EXPRESSION_FACTORY}

	make

		-- A XM_XPATH_CLOSURE represents a value that has not yet been evaluated: the value is represented
		--  by an expression, together with saved values of all the context variables that the
		--  expression depends on.

		-- This form of closure is designed for when the value is only read once.
		-- If it is designed to be repeatedly read, then XM_XPATH_MEMO_CLOSURE i used instead.

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
			save_local_variables (a_context)
			if saved_xpath_context.current_iterator /= Void and then not saved_xpath_context.current_iterator.off then -- TODO: Is this the right test?
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

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		do
			std.error.put_string (indentation (a_level))
			std.error.put_string ("closure of expression ")
			std.error.put_new_line
			base_expression.display (a_level + 1)
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			an_iterator := iterator (a_context); an_iterator.start
			if not an_iterator.after then
				last_evaluated_item := an_iterator.item
			end
		end

	iterator (a_context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- An iterator over the values of a sequence
		do
			if input_iterator = Void then
				input_iterator := base_expression.iterator (saved_xpath_context)
				Result := input_iterator
			else
				Result := input_iterator.another
			end
		end

	process (a_context: XM_XPATH_CONTEXT) is
			-- Execute `Current' completely, writing results to the current `XM_XPATH_RECEIVER'.
		do
			todo ("process", False)
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

	input_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			-- Underlying iterator 

	depth: INTEGER
			-- Nesting depth

feature {NONE} -- Implementation

	Maximum_closure_nesting_depth: INTEGER is 10
			-- Maximum depth for nesting closures

	native_implementations: INTEGER is
			-- Natively-supported evaluation routines
		do
			Result := INTEGER_.bit_or (Supports_iterator, Supports_process)
		end

	save_local_variables (a_context: XM_XPATH_CONTEXT) is			
			-- Make a copy of all local variables.
		require
			context_not_void: a_context /= Void
		local
			a_local_variable_frame, a_saved_local_variable_frame: XM_XPATH_STACK_FRAME
			an_index, a_depth: INTEGER
			a_value: XM_XPATH_VALUE
			a_closure: XM_XPATH_CLOSURE
		do
			
			--If the value of any local variable is a closure whose depth
			--  exceeds a certain threshold, we evaluate the closure eagerly to avoid
			--  creating deeply nested lists of closures, which consume memory unnecessarily.

			if base_expression.depends_upon_local_variables then
				a_local_variable_frame := a_context.local_variable_frame
				if a_local_variable_frame.variables.count > 0 then
					from
						create a_saved_local_variable_frame.make_fixed_size (a_local_variable_frame.variables.count)
						an_index := 1
					variant
						a_local_variable_frame.variables.count + 1 - an_index
					until
						an_index > a_local_variable_frame.variables.count
					loop
						a_value := a_local_variable_frame.variables.item (an_index)
						a_closure ?= a_value
						if a_closure /= Void then
							a_depth := a_closure.depth
							if a_depth >= Maximum_closure_nesting_depth then
								a_closure.eagerly_evaluate (a_context)
								a_value := a_closure.last_evaluation
								a_saved_local_variable_frame.set_variable (a_value, an_index)
							else
								if a_depth + 1 > depth then
									depth := a_depth + 1
								end
								a_saved_local_variable_frame.set_variable (a_local_variable_frame.variables.item (an_index), an_index)
							end
						else
							a_saved_local_variable_frame.set_variable (a_local_variable_frame.variables.item (an_index), an_index)
						end
						an_index := an_index + 1
					end
					saved_xpath_context.set_stack_frame (a_saved_local_variable_frame)
				end
			end
		end

invariant

	base_expression_not_void: base_expression /= Void
	saved_xpath_context_not_void: saved_xpath_context /= Void

end
