note

	description:

		"XPath values"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_VALUE

	-- A value is the result of an expression but it is also an expression in its own right;
	-- Note that every value can be regarded as a sequence - in many cases, a sequence of length one

inherit

	XM_XPATH_EXPRESSION
		redefine
			is_value, as_value, eager_evaluation_mode, lazy_evaluation_mode
		end

feature {NONE} -- Initialization

	make_value
			-- Establish static properties
		do
			initialize_special_properties
			initialize_dependencies
			initialize_intrinsic_dependencies
			set_cardinality_zero_or_more
			set_non_creating
		end

feature -- Access

	is_value: BOOLEAN
			-- Is `Current' a value?
		do
			Result := True
		end

	as_value: XM_XPATH_VALUE
			-- `Current' seen as a value
		do
			Result := Current
		end

	frozen sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Immediate sub-expressions of `Current'
		do
			create Result.make_default
			Result.set_equality_tester (expression_tester)
		end

	frozen container: detachable XM_XPATH_EXPRESSION_CONTAINER
			-- Containing parent
		do
			-- `Void'
		end

	count: INTEGER
			-- Number of items in `Current';
			-- Not 100% pure - may put `Current' into error.
			-- N.B. Limited to INTEGER_32 (and hence XPath sequences) by `{DS_ARRAYED_LIST}.count'
		local
			l_saved_iterator: detachable XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			l_saved_iterator := last_iterator -- to avoid state change
			create_iterator (new_dummy_context)
			check postcondition_of_create_iterator: attached last_iterator as l_last_iterator then
				l_iterator := l_last_iterator
				if attached l_iterator.error_value as l_error_value then
					check is_error: l_iterator.is_error end
					Result := 0
					set_last_error (l_error_value)
				elseif l_iterator.is_last_position_finder then
					Result := l_iterator.last_position
					if attached l_iterator.error_value as l_error_value then
						check is_error: l_iterator.is_error end
						set_last_error (l_error_value)
					end
				else
					from
						l_iterator.start
					until
						l_iterator.is_error or else l_iterator.after
					loop
						Result := Result + 1
						l_iterator.forth
					end
				end
				if attached l_iterator.error_value as l_error_value then
					check is_error: l_iterator.is_error end
					Result := 0
					set_last_error (l_error_value)
				end
			end
			last_iterator := l_saved_iterator
		ensure
			positive_result: Result >= 0
		end

	item_at (a_index: INTEGER): detachable XM_XPATH_ITEM
			-- Item at `a_index'
		require
			index_in_range: a_index > 0 and then a_index <= count
		local
			l_integer: INTEGER
			l_result: DS_CELL [detachable XM_XPATH_ITEM]
			l_saved_iterator: detachable XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_context: XM_XPATH_CONTEXT
		do
			l_context := new_dummy_context
			if is_evaluate_supported and then a_index = 1 then
				create l_result.make (Void)
				evaluate_item (l_result, l_context)
				Result := l_result.item
			else
				l_saved_iterator := last_iterator -- to avoid state change
				create_iterator (l_context)
				check postcondition_of_create_iterator: attached last_iterator as l_last_iterator then
					from
						l_integer := 1
					until
						l_integer > a_index or else l_last_iterator.is_error or else (not l_last_iterator.before and then l_last_iterator.after)
					loop
						if l_integer = 1 then l_last_iterator.start else l_last_iterator.forth end
						l_integer := l_integer + 1
					end
					if attached l_last_iterator.error_value as l_error_value then
						check is_error: l_last_iterator.is_error end
						create {XM_XPATH_INVALID_ITEM} Result.make (l_error_value)
					elseif not l_last_iterator.after then
						Result := l_last_iterator.item
					else
						check
							out_of_range: False
							-- pre-condition on `a_index'
						end
					end
				end
				last_iterator := l_saved_iterator
			end
		ensure
			item_may_be_void: True
		end

	lazy_evaluation_mode: INTEGER
			-- Method used for lazy evaluation of `Current'
		do
			Result := No_evaluation_needed
		end

	eager_evaluation_mode: INTEGER
			-- Method used for eager evaluation of `Current'
		do
			Result := No_evaluation_needed
		end

feature -- Status report

	last_reduced_value: detachable XM_XPATH_VALUE
			-- Result of last call to `reduce'

	is_convertible_to_item (a_context: XM_XPATH_CONTEXT): BOOLEAN
			-- Can `Current' be converted to an `XM_XPATH_ITEM'?
		deferred
		end

feature -- Optimization

	simplify (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION])
			-- Perform context-independent static optimizations.
		do
			a_replacement.put (Current)
		end

	check_static_type (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		do
			a_replacement.put (Current)
		end

	optimize (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform optimization of `Current' and its subexpressions.
		do
			a_replacement.put (Current)
		end

	promote (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_offer: XM_XPATH_PROMOTION_OFFER)
			-- Promote this subexpression.
		do
			a_replacement.put (Current)
		end

	reduce
			-- Reduce a value to its simplest form.
		require
			not_in_error: not is_error
		do
			last_reduced_value := Current
		ensure
			last_reduced_value_not_void: last_reduced_value /= Void
			may_be_in_error: True
		end

feature -- Evaluation

	generate_events (a_context: XM_XPATH_CONTEXT)
			-- Execute `Current' completely, writing results to the current `XM_XPATH_RECEIVER'.
		local
			a_receiver: XM_XPATH_SEQUENCE_RECEIVER
			an_item: XM_XPATH_INVALID_ITEM
		do
			create_iterator (a_context)
			check postcondition_of_create_iterator: attached last_iterator as l_last_iterator then
				check attached a_context.current_receiver as l_current_receiver then
					a_receiver := l_current_receiver
					from
						l_last_iterator.start
					until
						l_last_iterator.is_error or else l_last_iterator.after
					loop
						a_receiver.append_item (l_last_iterator.item)
						l_last_iterator.forth
					end
					if attached l_last_iterator.error_value as l_error_value then
						check is_error: l_last_iterator.is_error end
						create an_item.make (l_error_value)
						a_receiver.append_item (an_item)
					end
				end
			end
		end

	processed_eager_evaluation (a_context: XM_XPATH_CONTEXT): XM_XPATH_VALUE
			-- Eager evaluation via `generate_events'
		do
			Result := Current
		end

feature -- Conversion

	as_item (a_context: XM_XPATH_CONTEXT): XM_XPATH_ITEM
			-- `Current' seen as an item
		require
			is_convertible_to_item (a_context)
		deferred
		ensure
			may_be_void: True
		end

feature {NONE} -- Implementation

	trimmed_white_space (a_string: STRING): STRING
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
			variant
				a_string.count + 1 - counter
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


