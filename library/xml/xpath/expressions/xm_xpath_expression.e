indexing

	description:

		"XPath expression"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_EXPRESSION


feature -- Access

	special_properties: INTEGER is
			-- Get the static properties of this expression (other than its type);
			-- The result is bit-signficant. These properties are used for optimizations.
			-- In general, if a property bit is set, it is true, but if it is unset, the value is unknown.
		deferred
		end
	
	cardinality: INTEGER is
			-- Determine the static cardinality of the expression;
			--This establishes how many items there will be in
			-- the result of the expression, at compile time
			-- (i.e., without actually evaluating the result).
			-- This method should always return a result,
			-- though it may be the best approximation that is available at the time.
		deferred
		end

	item_type: INTEGER is
			--Determine the data type of the expression, if possible;
			-- All expression return sequences, in general;
			-- This method determines the type of the items within the
			-- sequence, assuming that (a) this is known in advance,
			-- and (b) it is the same for all items in the sequence.
		deferred
		end

	dependencies: INTEGER is
			-- Determine which aspects of the context the expression depends on;
			-- The result is a bitwise-or'ed value composed from constants
			-- such as XPath context variables.and XPath context current_node.
			-- The default implementation combines the intrinsic
			-- dependencies of this expression with the dependencies of the subexpressions,
			-- computed recursively. This is overridden for expressions such as Filter Expression
			-- where a subexpression's dependencies are not necessarily inherited by the parent expression.
		deferred
		end

	sub_expressions: DS_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		deferred
		end

	iterate (context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR is
			-- Yields an iterator to iterate over the values of a sequence
		require
			context_not_void: context /= Void
		deferred
		end

	effective_boolean_value: BOOLEAN is
			-- Effective boolean value of the expression;
			-- This returns `False' if the value is the empty sequence,
			-- a zero-length string, a number equal to zero, or the boolean
			-- `False'. Otherwise it returns `True'.
		deferred
		end

feature -- Status report

	display (level: INTEGER; pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		require
			name_pool_not_void: pool /= Void
		deferred
		end
	
feature -- Analysis

	simplify: XM_XPATH_EXPRESSION is
			-- Simplify an expression;
			-- This performs any static optimization 
			--  (by rewriting the expression as a different expression);
			-- The default implementation does nothing.
		deferred
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
		deferred
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
			-- TODO - turn the above into pre-conditions.
		require
			context_not_void: context /= Void
		deferred
		end
end
	
