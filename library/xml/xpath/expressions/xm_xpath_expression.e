indexing

	description:

		"XPath expression"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_EXPRESSION

inherit

	XM_XPATH_TYPE

	XM_XPATH_STATIC_PROPERTY

	XM_XPATH_PROMOTION_ACTIONS
	
	XM_XPATH_SHARED_EXPRESSION_TESTER

	XM_XPATH_SHARED_EXPRESSION_FACTORY

	XM_XPATH_ERROR_TYPES

	KL_SHARED_STANDARD_FILES

	KL_IMPORTED_STRING_ROUTINES

feature -- Access
	
	item_type: INTEGER is
			-- Determine the data type of the expression, if possible;
			-- All expression return sequences, in general;
			-- This routine determines the type of the items within the
			-- sequence, assuming that (a) this is known in advance,
			-- and (b) it is the same for all items in the sequence.
		require
			not_in_error: not is_error
		deferred
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		require
			not_in_error: not is_error
		deferred
		ensure
			expression_tester: Result /= Void  and then Result.equality_tester.is_equal (expression_tester)
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		require
			other_not_void: other /= Void
		deferred
		end

feature -- Status report

	is_error: BOOLEAN is
			-- Is `Current' in error?
		do
			Result := last_error /= Void
		end
	
	last_error: XM_XPATH_ERROR_VALUE
			-- Last error value

	analyzed: BOOLEAN
			-- Has `analyze' been called yet?

	was_expression_replaced: BOOLEAN
			-- Did `analyze' create a replacement expression for current?

	replacement_expression: XM_XPATH_EXPRESSION
			-- Replacement for `Current' when `expression_replaced' is `True'

	last_evaluation: XM_XPATH_VALUE
			-- Value from last call to `eagerly_evaluate' or `lazily_evaluate'

	last_evaluated_item: XM_XPATH_ITEM
			-- Value from last call to `evaluate_item'

	last_evaluated_string: XM_XPATH_STRING_VALUE

	may_analyze: BOOLEAN is
			-- OK to call `analyze'?
		do
			if not analyzed then Result := True end
		ensure
			not_analyzed_if_true: Result implies not analyzed
		end

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		require
			name_pool_not_void: a_pool /= Void
		deferred
		end

feature -- Status setting

	set_analyzed is
			-- Set `Current' has been analyzed.
		require
			not_analyzed: not analyzed
		do
			analyzed := True
		ensure
			set: analyzed = True
		end

	set_last_error (an_error_value: XM_XPATH_ERROR_VALUE) is
			-- Set result of `last_error'.
		require
			not_in_error: not is_error		
			error_value_not_void: an_error_value /= Void
		do
			last_error := an_error_value
		ensure
			set: last_error = an_error_value
			in_error: is_error
		end
	
	set_last_error_from_string (a_message: STRING; a_code, an_error_type: INTEGER) is
			-- Set result of `last_error'.
		require
			valid_error_type: an_error_type = Static_error or an_error_type = Type_error or an_error_type = Dynamic_error
			message_not_void: a_message /= Void and then a_message.count > 0
			valid_code: is_valid_error_code (a_code)
			not_in_error: not is_error			
		do
			create last_error.make_from_string (a_message, a_code, an_error_type)
		ensure
			valid_error: last_error /= Void and then STRING_.same_string (last_error.error_message, a_message)
				and then last_error.code = a_code
			in_error: is_error
		end

feature -- Optimization

	simplify: XM_XPATH_EXPRESSION is
			-- Simplify an expression;
			-- This performs any static optimization 
			--  (by rewriting the expression as a different expression);
			-- The default implementation does nothing.
		require
			no_previous_error: not is_error
		deferred
		ensure
			expression_not_void: Result /= Void
		end

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of `Current' and its subexpressions;		
			-- This checks statically that the operands of the expression have the correct type;
			-- If necessary it generates code to do run-time type checking or type conversion;
			-- A static type error is reported only if execution cannot possibly succeed, that
			-- is, if a run-time type error is inevitable. The call may create a modified form of the expression;
			-- This routine is called after all references to functions and variables have been resolved
			-- to the declaration of the function or variable. However, the types of such functions and
			-- variables will only be accurately known if they have been explicitly declared.
		require
			context_not_void: a_context /= Void
			ok_to_analyze: may_analyze
			no_previous_error: not is_error
		deferred
		ensure
			analyzed: analyzed
		end

	promote (an_offer: XM_XPATH_PROMOTION_OFFER): XM_XPATH_EXPRESSION is
			-- Offer promotion for this subexpression
			-- The offer will be accepted if the subexpression is not dependent on
			-- the factors (e.g. the context item) identified in the PromotionOffer.
			-- By default the offer is not accepted - this is appropriate in the case of simple expressions
			-- such as constant values and variable references where promotion would give no performance
			-- advantage. This routine is always called at compile time.
		require
			offer_not_void: an_offer /= Void
			no_previous_error: not is_error
		deferred
		ensure
			expression_not_void: Result /= Void
		end

feature -- Evaluation

	effective_boolean_value (a_context: XM_XPATH_CONTEXT): XM_XPATH_BOOLEAN_VALUE is
			-- Effective boolean value;
			-- The result has value `False' if the value is the empty sequence,
			-- a zero-length string, a number equal to zero, or the boolean
			-- `False'. Otherwise it has value  `True'.
		require
			not_in_error: not is_error
			analyzed: analyzed
		deferred
		ensure
			value_not_void_but_may_be_in_error: Result /= Void
		end

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item;
			-- This always sets `last_evaluated_item' to either a single Item or Void
			-- (denoting the empty sequence). No conversion is done. This routine should not be
			-- used unless the static type of the expression is a subtype of "item" or "item?": that is,
			-- it should not be called if the expression may return a sequence. There is no guarantee that
			-- this condition will be detected.
		require
			context_may_be_void: True
			expression_not_in_error: not is_error
			-- can't be enforced, because of ITEM_CHECKER analyzed_without_errors: analyzed and then not is_error
		deferred
		ensure
			item_evaluated_but_may_be_void: True
		end

	evaluate_as_string (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a String
			-- This procedure must only be called in contexts where it is known
			-- that the expression will evaluate to a single string (or where an empty sequence
			-- is to be treated as a zero-length string). Implementations should not attempt to convert
			-- the result to a string, other than converting () to "". This routine is used mainly to
			-- evaluate expressions produced by compiling an attribute value template.
		require
			-- TODO - check the above and turn it into pre-conditions.if possible
			context_not_void: a_context /= Void
			expression_not_in_error: not is_error
			-- analyzed_without_errors: analyzed and then not is_error
		deferred
		ensure
			string_not_void_but_may_be_in_error: last_evaluated_string /= Void
		end

	iterator (a_context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- An iterator over the values of a sequence
		require
			not_in_error: not is_error
		deferred
		ensure
			iterator_not_void_but_may_be_error: Result /= Void -- and then (Result.is_error or else not Result.is_error)
			iterator_before: Result /= Void and then not Result.is_error implies Result.before
		end

	eagerly_evaluate (a_context: XM_XPATH_CONTEXT) is
			-- Eager evaluation of `Current'		
		require
			expression_not_in_error: not is_error
			--analyzed_without_errors: analyzed and then not is_error
		local
			a_length: INTEGER
			an_item: XM_XPATH_ITEM
			a_result_value: XM_XPATH_VALUE
			a_closure: XM_XPATH_CLOSURE
			an_extent: XM_XPATH_SEQUENCE_EXTENT
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			an_empty_iterator: XM_XPATH_EMPTY_ITERATOR [XM_XPATH_ITEM]
			a_singleton_iterator: XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ITEM]
		do
			a_result_value ?= Current
			a_closure ?= Current
			if a_result_value /= Void and then a_closure = Void then
				last_evaluation := a_result_value
			else
				an_iterator := iterator (a_context)
				an_empty_iterator ?= an_iterator
				if an_empty_iterator /= Void then
					create {XM_XPATH_EMPTY_SEQUENCE} last_evaluation.make
				else
					a_singleton_iterator ?= an_iterator
					if a_singleton_iterator /= Void then
						a_singleton_iterator.forth
						an_item := a_singleton_iterator.item
						if an_item = Void then
							create {XM_XPATH_EMPTY_SEQUENCE} last_evaluation.make
						else
							last_evaluation := an_item.as_value -- May still be `Void'
						end
					else
						create an_extent.make (an_iterator)
						a_length := an_extent.count
						if a_length = 0 then
							create {XM_XPATH_EMPTY_SEQUENCE} last_evaluation.make
						elseif a_length = 1 then
							last_evaluation := an_extent.item_at (1).as_value
						else
							last_evaluation := an_extent
						end
					end
				end
			end
			if last_evaluation = Void then
				create {XM_XPATH_EMPTY_SEQUENCE} last_evaluation.make
			end
			last_evaluation.set_analyzed
		ensure
			evaluated: last_evaluation /= Void and then last_evaluation.analyzed
		end

	lazily_evaluate (a_context: XM_XPATH_CONTEXT) is
			-- Lazy evaluation of `Current'		;
			-- This will set a value, which may optionally be an XM_XPATH_CLOSURE,
			--  which is a wrapper around an iterator over the value of the expression.
		require
			expression_not_in_error: not is_error
			--			analyzed_without_errors: analyzed and then not is_error
		local
			a_variable_reference: XM_XPATH_VARIABLE_REFERENCE
		do
			a_variable_reference ?= Current
			if a_variable_reference /= Void then

				-- We always deference the variable reference;
				--   this will often perform lazy evaluation
				--   of the expression to which the variable is bound

				a_variable_reference.eagerly_evaluate (a_context)
			else
				if a_context = Void then

					-- We are evaluating a value

					eagerly_evaluate (Void)
				elseif not cardinality_allows_many then

					-- Singletons are always evaluated eagerly

					eagerly_evaluate (a_context)
				elseif depends_upon_position or else depends_upon_last
					or else depends_upon_current_item or else depends_upon_current_group then

					-- We can't save these values in the closure, so we evaluate
					-- the expression now if they are needed

					eagerly_evaluate (Void)
				else

					-- Create a Closure, a wrapper for the expression and its context

					last_evaluation := Expression_factory.make_closure (Current, a_context)
				end
			end
			last_evaluation.set_analyzed
		ensure
			evaluated: last_evaluation /= Void and then last_evaluation.analyzed
		end

feature {XM_XPATH_EXPRESSION} -- Local

	unsorted (eliminate_duplicates: BOOLEAN): XM_XPATH_EXPRESSION is
			-- Remove unwanted sorting from an expression, at compile time
		local
			an_offer: XM_XPATH_PROMOTION_OFFER
		do
			create an_offer.make (Unordered, Void, Void, eliminate_duplicates, False)
			Result := Current.promote (an_offer)
		ensure
			result_not_void: Result /= Void
		end

	indent (a_level: INTEGER): STRING is
			-- Construct indent string, for diagnostic output
		require
			strictly_positive_level: a_level > 0
		local
			counter: INTEGER
		do
			Result := ""
			from
				counter := 1
			variant
				a_level + 1 - counter
			until
				counter > a_level
			loop
				Result := STRING_.appended_string (Result, " ")
				counter := counter + 1
			end
		end

feature {NONE} -- Implementation

	todo (a_routine_name: STRING; is_partially_done: BOOLEAN) is
			-- Write a TODO message.
		require
			routine_name_not_void: a_routine_name /= Void and then a_routine_name.count > 2
		do
			std.error.put_string ("TODO: {")
			std.error.put_string (generating_type)
			std.error.put_string ("}.")
			std.error.put_string (a_routine_name)
			if is_partially_done then
				std.error.put_string (" is only partly written")
			else
				std.error.put_string (" needs to be written")
			end
			std.error.put_new_line
		end

invariant

	expression_may_be_replaced: was_expression_replaced implies replacement_expression /= Void

end
	
