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

	KL_SHARED_STANDARD_FILES

	KL_IMPORTED_STRING_ROUTINES

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

	iterator (a_context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- An iterator over the values of a sequence
		require
			context_not_void: a_context /= Void
		deferred
		ensure
			iterator_not_void: Result /= Void
		end

	effective_boolean_value (a_context: XM_XPATH_CONTEXT): BOOLEAN is
			-- Effective boolean value;
			-- This returns `False' if the value is the empty sequence,
			-- a zero-length string, a number equal to zero, or the boolean
			-- `False'. Otherwise it returns `True'.
		deferred
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		require
			other_not_void: other /= Void
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
			-- OK to call `analyze'?
		do
			Result := True
		end

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		require
			name_pool_not_void: a_pool /= Void
		deferred
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

feature -- Optimization

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

	analyze (a_context: XM_XPATH_STATIC_CONTEXT): XM_XPATH_EXPRESSION is
			-- Perform static analysis of `Current' and its subexpressions;		
			-- This checks statically that the operands of the expression have the correct type;
			-- If necessary it generates code to do run-time type checking or type conversion;
			-- A static type error is reported only if execution cannot possibly succeed, that
			-- is, if a run-time type error is inevitable. The call may return a modified form of the expression;
			-- This routine is called after all references to functions and variables have been resolved
			-- to the declaration of the function or variable. However, the types of such functions and
			-- variables will only be accurately known if they have been explicitly declared
		require
			context_not_void: a_context /= Void
			ok_to_analyze: may_analyze
			no_previous_type_error: not is_static_type_error
		deferred
		ensure
			expression_not_void: not is_static_type_error implies Result /= Void
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
		deferred
		ensure
			expression_not_void: Result /= Void
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT): XM_XPATH_ITEM is
			-- Evaluate as a single item;
			-- This always returns either a single Item or Void
			-- (denoting the empty sequence). No conversion is done. This routine should not be
			-- used unless the static type of the expression is a subtype of "item" or "item?": that is,
			-- it should not be called if the expression may return a sequence. There is no guarantee that
			-- this condition will be detected.
		require
			context_not_void: a_context /= Void
		deferred
		end

	evaluate_as_string (a_context: XM_XPATH_CONTEXT): STRING is
			-- Evaluate an expression as a String
			-- This function must only be called in contexts where it is known
			-- that the expression will return a single string (or where an empty sequence
			-- is to be treated as a zero-length string). Implementations should not attempt to convert
			-- the result to a string, other than converting () to "". This routine is used mainly to
			-- evaluate expressions produced by compiling an attribute value template.
		require
			-- TODO - turn the above into pre-conditions.
			context_not_void: a_context /= Void
		deferred
		ensure
			string_not_void: Result /= Void
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

end
	
