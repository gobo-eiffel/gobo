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

feature -- Access
	
	item_type: INTEGER is
			--Determine the data type of the expression, if possible;
			-- All expression return sequences, in general;
			-- This routine determines the type of the items within the
			-- sequence, assuming that (a) this is known in advance,
			-- and (b) it is the same for all items in the sequence.
		deferred
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		deferred
		end

	-- TODO - check the return generic-type-parameter on the next line
	iterator (context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- Yields an iterator to iterate over the values of a sequence
		require
			context_not_void: context /= Void
		deferred
		ensure
			iterator_not_void: Result /= Void
		end

	effective_boolean_value (context: XM_XPATH_CONTEXT): BOOLEAN is
			-- Effective boolean value of the expression;
			-- This returns `False' if the value is the empty sequence,
			-- a zero-length string, a number equal to zero, or the boolean
			-- `False'. Otherwise it returns `True'.
		deferred
		end

feature -- Status report

	is_static_type_error: BOOLEAN
			-- Did a static type error occur?

	last_static_type_error: STRING is
			-- Last static type error message
		require
			static_type_error: is_static_type_error
		deferred
		ensure
			message_not_void: Result /= Void
		end

	may_analyze: BOOLEAN is
			-- OK to call analyze?
		do
			Result := True
		end

feature -- Status setting

	set_last_static_type_error (msg: STRING) is
			-- Set result of `last_static_type_error'.
		require
			type_error: is_static_type_error
			message_not_void: msg /= Void
		deferred
		ensure
			set: STRING_.same_string (last_static_type_error, msg)
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		require
			other_not_void: other /= Void
		deferred
		end

--	display (level: INTEGER; pool: XM_XPATH_NAME_POOL) is
--			-- Diagnostic print of expression structure to `std.error'
--		require
--			name_pool_not_void: pool /= Void
--		deferred
--		end
	
feature -- Analysis

	simplify: XM_XPATH_EXPRESSION is
			-- Simplify an expression;
			-- This performs any static optimization 
			--  (by rewriting the expression as a different expression);
			-- The default implementation does nothing.
		require
			no_previous_type_error: not is_static_type_error
		deferred
		ensure
			expression_not_void: Result /= Void
		end

	analyze (env: XM_XPATH_STATIC_CONTEXT): XM_XPATH_EXPRESSION is
			-- Perform static analysis of an expression and its subexpressions;		
			-- This checks statically that the operands of the expression have the correct type;
			-- If necessary it generates code to do run-time type checking or type conversion;
			-- A static type error is reported only if execution cannot possibly succeed, that
			-- is, if a run-time type error is inevitable. The call may return a modified form of the expression;
			-- This routine is called after all references to functions and variables have been resolved
			-- to the declaration of the function or variable. However, the types of such functions and
			-- variables will only be accurately known if they have been explicitly declared
		require
			context_not_void: env /= Void
			ok_to_analyze: may_analyze
			no_previous_type_error: not is_static_type_error
		deferred
		ensure
			expression_not_void: not is_static_type_error implies Result /= Void
		end

	promote (offer: XM_XPATH_PROMOTION_OFFER): XM_XPATH_EXPRESSION is
			-- Offer promotion for this subexpression
			-- The offer will be accepted if the subexpression is not dependent on
			-- the factors (e.g. the context item) identified in the PromotionOffer.
			-- By default the offer is not accepted - this is appropriate in the case of simple expressions
			-- such as constant values and variable references where promotion would give no performance
			-- advantage. This method is always called at compile time.
		require
			offer_not_void: offer /= Void
		deferred
		ensure
			expression_not_void: Result /= Void
		end

feature -- Evaluation

	evaluate_item (context: XM_XPATH_CONTEXT): XM_XPATH_ITEM is
			-- Evaluate an expression as a single item;
			-- This always returns either a single Item or Void
			-- (denoting the empty sequence). No conversion is done. This method should not be
			-- used unless the static type of the expression is a subtype of "item" or "item?": that is,
			-- it should not be called if the expression may return a sequence. There is no guarantee that
			-- this condition will be detected.
		require
			context_not_void: context /= Void
		deferred
		end

	evaluate_as_string (context: XM_XPATH_CONTEXT): STRING is
			-- Evaluate an expression as a String
			-- This function must only be called in contexts where it is known
			-- that the expression will return a single string (or where an empty sequence
			-- is to be treated as a zero-length string). Implementations should not attempt to convert
			-- the result to a string, other than converting () to "". This routine is used mainly to
			-- evaluate expressions produced by compiling an attribute value template.
		require
			-- TODO - turn the above into pre-conditions.
			context_not_void: context /= Void
		deferred
		ensure
			string_not_void: Result /= Void
		end

feature {XM_XPATH_EXPRESSION} -- Helper routines

	unsorted (eliminate_duplicates: BOOLEAN): XM_XPATH_EXPRESSION is
			-- Remove unwanted sorting from an expression, at compile time
		local
			offer: XM_XPATH_PROMOTION_OFFER
		do
			create offer.make (Unordered, Void, Void, eliminate_duplicates, False)
			Result := Current.promote (offer)
		ensure
			result_not_void: Result /= Void
		end

end
	
