indexing

	description:

		"XPath values"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_VALUE

	-- A value is the result of an expression but it is also an expression in its own right;
	-- Note that every value can be regarded as a sequence - in many cases, a sequence of length one

inherit

	XM_XPATH_EXPRESSION
		redefine
			lazily_evaluate, is_value, as_value
		end

feature {NONE} -- Initialization

	make_value is
			-- Establish static properties
		do
			initialize_special_properties
			initialize_dependencies
			initialize_intrinsic_dependencies 
			set_cardinality_zero_or_more
			set_non_creating
		end
	
feature -- Access
	
	is_value: BOOLEAN is
			-- Is `Current' a value?
		do
			Result := True
		end

	as_value: XM_XPATH_VALUE is
			-- `Current' seen as a value
		do
			Result := Current
		end

	frozen sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do
			create Result.make_default
			Result.set_equality_tester (expression_tester)
		end

	frozen container: XM_XPATH_EXPRESSION_CONTAINER is
			-- Containing parent
		do
			-- `Void'
		end

feature -- Status report

	is_convertible_to_item (a_context: XM_XPATH_CONTEXT): BOOLEAN is
			-- Can `Current' be converted to an `XM_XPATH_ITEM'?
		deferred
		end

feature -- Optimization

	simplify is
			-- Perform context-independent static optimizations.
		do
			-- do_nothing
		end

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of `Current' and its subexpressions
		do
			mark_unreplaced
		end

	
	promote (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this subexpression.
		do
			do_nothing
		end

feature -- Evaluation

	lazily_evaluate (a_context: XM_XPATH_CONTEXT; save_values: BOOLEAN) is
			-- Lazily evaluate `Current'.
		do
				last_evaluation := Current
		end
			
	process (a_context: XM_XPATH_CONTEXT) is
			-- Execute `Current' completely, writing results to the current `XM_XPATH_RECEIVER'.
		local
			a_receiver: XM_XPATH_SEQUENCE_RECEIVER
		do
			create_iterator (a_context)
			a_receiver := a_context.current_receiver
			from
				last_iterator.start
			until
				last_iterator.after
			loop
				a_receiver.append_item (last_iterator.item)
				last_iterator.forth
			end
		end

	processed_eager_evaluation (a_context: XM_XPATH_CONTEXT): XM_XPATH_VALUE is
			-- Eager evaluation via `process'
		do
			Result := Current
		end

feature -- Conversion

	as_item (a_context: XM_XPATH_CONTEXT): XM_XPATH_ITEM is
			-- `Current' seen as an item
		require
			is_convertible_to_item (a_context)
		deferred
		ensure
			may_be_void: True
		end

feature {NONE} -- Implementation

	trimmed_white_space (a_string: STRING): STRING is
			-- Remove all leading and trailing characters below character code 33;
			-- Only usable for values that do not permit internal white space
		require
			string_not_void: a_string /= Void
		local
			counter, start_position, finish_position: INTEGER
			started, finished: BOOLEAN
		do
			from
				counter := 1
			variant
				a_string.count + 1 - counter
			until
				counter > a_string.count 
			loop
				if a_string.item_code (counter) < 33 then
					if started then
						finished := True
						finish_position := counter - 1
					end
				elseif not started then
					started := True
					start_position := counter
				end
				counter := counter + 1
			end
			if not finished then finish_position := counter - 1 end
			if start_position > 0 then
				check
					finish_position: finish_position >= start_position
				end
				Result := a_string.substring (start_position, finish_position)
			else
				Result := ""
			end
		ensure
			trimmed_string_not_void: Result /= Void
		end

end


