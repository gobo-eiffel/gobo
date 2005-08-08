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

	count: INTEGER is
			-- Number of items in `Current';
			-- Not 100% pure - may put `Current' into error.
		local
			a_saved_iterator, an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			a_saved_iterator := last_iterator -- to avoid state change
			create_iterator (Void); an_iterator := last_iterator
			if an_iterator.is_error then
				Result := 0
				set_last_error (an_iterator.error_value)
			elseif an_iterator.is_last_position_finder then
				Result := an_iterator.as_last_position_finder.last_position
			else
				from
					an_iterator.start
				until
					an_iterator.is_error or else an_iterator.after
				loop
					Result := Result + 1
					an_iterator.forth
				end
			end
			if an_iterator.is_error then
				Result := 0
				set_last_error (an_iterator.error_value)
			end
			last_iterator := a_saved_iterator
		ensure
			positive_result: Result >= 0
		end

	item_at (an_index: INTEGER) :XM_XPATH_ITEM is
			-- Item at `an_index'
		require
			index_in_range: an_index > 0 and then an_index <= count
		local
			an_integer: INTEGER
			a_saved_item: XM_XPATH_ITEM
			a_saved_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			if is_evaluate_item_supported and then an_index = 1 then
				a_saved_item := last_evaluated_item -- to avoid state change
				evaluate_item (Void)
				Result := last_evaluated_item
				last_evaluated_item := a_saved_item
			else
				a_saved_iterator := last_iterator -- to avoid state change
				create_iterator (Void)
				from
					an_integer := 1
				until
					an_integer > an_index or else last_iterator.is_error or else last_iterator.after
				loop
					if an_integer = 1 then last_iterator.start else last_iterator.forth end
					an_integer := an_integer + 1
				end
				if last_iterator.is_error then
					create {XM_XPATH_INVALID_ITEM} Result.make (last_iterator.error_value)
				elseif not last_iterator.after then
					Result := last_iterator.item
				else
					check
						out_of_range: False
						-- pre-condition on `an_index'
					end
				end
				last_iterator := a_saved_iterator
			end
		ensure
			item_may_be_void: True
		end

feature -- Status report

	last_reduced_value: XM_XPATH_VALUE
			-- Result of last call to `reduce'

	is_convertible_to_item (a_context: XM_XPATH_CONTEXT): BOOLEAN is
			-- Can `Current' be converted to an `XM_XPATH_ITEM'?
		deferred
		end

feature -- Optimization

	simplify is
			-- Perform context-independent static optimizations.
		do
			-- do nothing
		end

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static type-checking of `Current' and its subexpressions.
		do
			mark_unreplaced
		end

	optimize (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform optimization of `Current' and its subexpressions.
		do
			mark_unreplaced
		end

	promote (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this subexpression.
		do
			-- do nothing
		end

	reduce is
			-- Reduce a value to its simplest form.
		do
			last_reduced_value := Current
		ensure
			last_reduced_value_not_void: last_reduced_value /= Void
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
			an_item: XM_XPATH_INVALID_ITEM
		do
			create_iterator (a_context)
			a_receiver := a_context.current_receiver
			from
				last_iterator.start
			until
				last_iterator.is_error or else last_iterator.after
			loop
				a_receiver.append_item (last_iterator.item)
				last_iterator.forth
			end
			if last_iterator.is_error then
				create an_item.make (last_iterator.error_value)
				a_receiver.append_item (an_item)
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


