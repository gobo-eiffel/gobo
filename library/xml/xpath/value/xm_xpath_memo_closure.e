note

	description:

		"Values that have not yet been evaluated"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2014, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_MEMO_CLOSURE

inherit

	XM_XPATH_CLOSURE
		redefine
			make, create_iterator, same_expression, generate_events, is_memo_closure, as_memo_closure, count,
			item_at, is_node_sequence, create_node_iterator
		end

create {XM_XPATH_EXPRESSION_FACTORY}

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

	make (an_expression: XM_XPATH_COMPUTED_EXPRESSION; a_context: XM_XPATH_CONTEXT)
			-- Establish invariant.
		local
			l_count: INTEGER
			l_iterator: detachable XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			state := Unread_state
			is_node_sequence := is_node_item_type (an_expression.item_type)
			l_iterator := a_context.current_iterator
			if l_iterator /= Void and then l_iterator.is_last_position_finder then
				l_count := l_iterator.last_position
			end
			if is_node_sequence then
				if l_count /= 0 then
					create node_reservoir.make (l_count)
				else
					create node_reservoir.make_default
				end
			else
				if l_count /= 0 then
					create reservoir.make (l_count)
				else
					create reservoir.make_default
				end
			end
			Precursor (an_expression, a_context)
		end

	is_memo_closure: BOOLEAN
			-- Is `Current' a memo-closure?
		do
			Result := True
		end

	as_memo_closure: XM_XPATH_MEMO_CLOSURE
			-- `Current' seen as a closure
		do
			Result := Current
		end

feature -- Access

	count: INTEGER
			-- Number of items in `Current'
		do
			if state = All_read_state then
				if is_node_sequence then
					check invariant_node_reservoir_not_void: attached node_reservoir as l_node_reservoir then
						Result := l_node_reservoir.count
					end
				else
					check invariant_reservoir_not_void: attached reservoir as l_reservoir then
						Result := l_reservoir.count
					end
				end
			else
				Result := Precursor
			end
		end

	item_at (an_index: INTEGER): detachable XM_XPATH_ITEM
			-- Item at `an_index'
		local
			a_reservoir: like reservoir
		do
			if is_node_sequence then
				check invariant_node_reservoir_not_void: attached node_reservoir as l_node_reservoir then
					a_reservoir := l_node_reservoir
				end
			else
				check invariant_reservoir_not_void: attached reservoir as l_reservoir then
					a_reservoir := l_reservoir
				end
			end
			if an_index <= a_reservoir.count then
				Result := a_reservoir.item (an_index)
			elseif state = All_read_state then
				Result := Void
			elseif state = Unread_state then
				Result := Precursor (an_index)
			else

				-- We need to read some more items - this actually alters
				--  the internal state, but not the externally visible state
				check invariant_input_iterator_not_void: attached input_iterator as l_input_iterator then
					from
					until
						an_index = a_reservoir.count or else state = All_read_state
					loop
						if attached l_input_iterator.error_value as l_error_value then
							check is_error: l_input_iterator.is_error end
							create {XM_XPATH_INVALID_ITEM} Result.make (l_error_value)
						elseif l_input_iterator.before then
							l_input_iterator.start
						else
							l_input_iterator.forth
						end
						if attached l_input_iterator.error_value as l_error_value then
							check is_error: l_input_iterator.is_error end
							create {XM_XPATH_INVALID_ITEM} Result.make (l_error_value)
						elseif l_input_iterator.after then
							state := All_read_state
						elseif l_input_iterator.is_node_iterator then
							check
								node_sequence: is_node_sequence
								invariant_node_reservoir_not_void: attached node_reservoir as l_node_reservoir
							then
								if not l_node_reservoir.extendible (1) then
									l_node_reservoir.resize (2 * l_node_reservoir.count)
								end
								l_node_reservoir.put_last (l_input_iterator.as_node_iterator.item)
								state := Maybe_more_state
							end
						else
							check
								not_node_sequence: not is_node_sequence
								invariant_reservoir_not_void: attached reservoir as l_reservoir
							then
								if not l_reservoir.extendible (1) then
									l_reservoir.resize (2 * l_reservoir.count)
								end
								l_reservoir.put_last (l_input_iterator.item)
								state := Maybe_more_state
							end
						end
					end
					if state = Maybe_more_state then
						Result := a_reservoir.item (an_index)
					else
						check
								-- pre-condition for `an_index'
							out_of_range: l_input_iterator.is_error
							is_error: attached l_input_iterator.error_value as l_error_value
						then
							create {XM_XPATH_INVALID_ITEM} Result.make (l_error_value)
						end
					end
				end
			end
		end

	materialized: XM_XPATH_SEQUENCE_EXTENT
			-- `Current' materialized as a sequence extent
		require
			all_read: is_all_read
		do
			if is_node_sequence then
				check invariant_node_reservoir_not_void: attached node_reservoir as l_node_reservoir then
					create Result.make_from_list (l_node_reservoir)
				end
			else
				check invariant_reservoir_not_void: attached reservoir as l_reservoir then
					create Result.make_from_list (l_reservoir)
				end
			end
		ensure
			result_not_void: Result /= Void
		end

feature -- Status report

	is_node_sequence: BOOLEAN
			-- Do we deliver a node sequence?

	is_all_read: BOOLEAN
			-- Is `Current' in `All_read_state'?
		do
			Result := state = All_read_state
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN
			-- Are `Current' and `other' the same expression?
		do
			Result := other = Current
		end

feature -- Evaluation

	create_iterator (a_context: XM_XPATH_CONTEXT)
			-- An iterator over the values of a sequence
		local
			l_reservoir: like reservoir
			l_input_iterator: like input_iterator
		do
			last_iterator := Void
			if is_node_sequence then
				check invariant_node_reservoir_not_void: attached node_reservoir as l_node_reservoir then
					l_reservoir := l_node_reservoir
				end
			else
				check invariant_reservoir_not_void: attached reservoir as l_reservoir2 then
					l_reservoir := l_reservoir2
				end
			end
			if l_reservoir.count > 0 then
				if attached input_iterator as l_input_iterator2 and then l_input_iterator2.is_error then
					last_iterator := l_input_iterator2
				elseif attached input_iterator as l_input_iterator2 and then l_input_iterator2.after then
					state := All_read_state
				end
			end
			if last_iterator = Void then
				inspect
					state
				when Unread_state then
					state := Busy_state
					if is_node_sequence then
						base_expression.create_node_iterator (saved_xpath_context)
						check postcondition_of_create_node_iterator: attached base_expression.last_node_iterator as l_last_node_iterator then
							l_input_iterator := l_last_node_iterator
							input_iterator := l_last_node_iterator
						end
					else
						base_expression.create_iterator (saved_xpath_context)
						check postcondition_of_create_iterator: attached base_expression.last_iterator as l_last_iterator then
							l_input_iterator := l_last_iterator
							input_iterator := l_last_iterator
						end
					end
					state := Maybe_more_state
					if l_input_iterator.is_error then
						last_iterator := l_input_iterator
					elseif is_node_sequence then
						check invariant_node_reservoir_not_void: attached node_reservoir as l_node_reservoir then
							create {XM_XPATH_PROGRESSIVE_NODE_ITERATOR} last_iterator.make (l_node_reservoir, l_input_iterator.as_node_iterator, Current)
						end
					else
						check invariant_reservoir_not_void: attached reservoir as l_reservoir2 then
							create {XM_XPATH_PROGRESSIVE_ITERATOR} last_iterator.make (l_reservoir2, l_input_iterator, Current)
						end
					end
				when Maybe_more_state then
					check inariant_input_iterator_not_void: attached input_iterator as l_input_iterator2 then
						if l_input_iterator2.is_error then
							last_iterator := l_input_iterator2
						elseif is_node_sequence then
							check invariant_node_reservoir_not_void: attached node_reservoir as l_node_reservoir then
								create {XM_XPATH_PROGRESSIVE_NODE_ITERATOR} last_iterator.make (l_node_reservoir, l_input_iterator2.as_node_iterator, Current)
							end
						else
							check invariant_reservoir_not_void: attached reservoir as l_reservoir2 then
								create {XM_XPATH_PROGRESSIVE_ITERATOR} last_iterator.make (l_reservoir2, l_input_iterator2, Current)
							end
						end
					end
				when All_read_state then
					if l_reservoir.is_empty then
						create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_iterator.make
					else
						create {XM_XPATH_ARRAY_LIST_ITERATOR [XM_XPATH_ITEM]} last_iterator.make (l_reservoir)
					end
				when Busy_state then
					create {XM_XPATH_INVALID_ITERATOR} last_iterator.make_from_string ("Attempting to access a variable while it is being evaluated", Xpath_errors_uri, "XTDE0640", Dynamic_error)
					check
						busy_memo_closure: False
						-- BUG
					end
				end
			end
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT)
			-- Create an iterator over a node sequence
		do
			check precondition_is_node_sequence: attached node_reservoir as l_node_reservoir then
				last_node_iterator := Void
				if l_node_reservoir.count > 0 then
					if attached input_iterator as l_input_iterator and then l_input_iterator.is_error then
						last_node_iterator := l_input_iterator.as_node_iterator
					elseif attached input_iterator as l_input_iterator and then l_input_iterator.after then
						state := All_read_state
					end
				end
				if last_node_iterator = Void then
					inspect
						state
					when Unread_state then
						state := Busy_state
						base_expression.create_node_iterator (saved_xpath_context)
						check postcondition_of_create_node_iterator: attached base_expression.last_node_iterator as l_input_iterator then
							input_iterator := l_input_iterator
							state := Maybe_more_state
							if l_input_iterator.is_error then
								last_node_iterator := l_input_iterator.as_node_iterator
							else
								create {XM_XPATH_PROGRESSIVE_NODE_ITERATOR} last_node_iterator.make (l_node_reservoir, l_input_iterator.as_node_iterator, Current)
							end
						end
					when Maybe_more_state then
						check invariant_input_iterator: attached input_iterator as l_input_iterator then
							if l_input_iterator.is_error then
								last_node_iterator := l_input_iterator.as_node_iterator
							else
								create {XM_XPATH_PROGRESSIVE_NODE_ITERATOR} last_node_iterator.make (l_node_reservoir, l_input_iterator.as_node_iterator, Current)
							end
						end
					when All_read_state then
						create {XM_XPATH_ARRAY_NODE_LIST_ITERATOR} last_node_iterator.make (l_node_reservoir)
					when Busy_state then
						create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make_from_string ("Attempting to access a variable while it is being evaluated", Xpath_errors_uri, "XTDE0640", Dynamic_error)
						check
							busy_memo_closure: False
							-- BUG
						end
					end
				end
			end
		end

	generate_events (a_context: XM_XPATH_CONTEXT)
			-- Execute `Current' completely, writing results to the current `XM_XPATH_RECEIVER'.
		local
			l_error: XM_XPATH_ERROR_VALUE
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_receiver: XM_XPATH_SEQUENCE_RECEIVER
		do
			if state = Busy_state then
				create l_error.make_from_string ("Attempting to access a variable while it is being evaluated", Xpath_errors_uri, "XTDE0640", Dynamic_error)
				a_context.report_fatal_error (l_error)
			else
				create_iterator (a_context)
				check postcondition_of_create_iterator: attached last_iterator as l_last_iterator then
					if attached l_last_iterator.error_value as l_error_value then
						check is_error: l_last_iterator.is_error end
						a_context.report_fatal_error (l_error_value)
					else
						check precondition_has_push_processing: attached a_context.current_receiver as l_current_receiver then
							l_receiver := l_current_receiver
							from
								l_iterator := l_last_iterator
								l_iterator.start
							until
								l_iterator.is_error or l_iterator.after
							loop
								if attached l_iterator.error_value as l_error_value then
									check is_error: l_iterator.is_error end
									a_context.report_fatal_error (l_error_value)
								else
									l_receiver.append_item (l_iterator.item)
									l_iterator.forth
								end
							end
						end
					end
				end
			end
		end

feature {XM_XPATH_MEMO_CLOSURE, XM_XPATH_PROGRESSIVE_ITERATOR, XM_XPATH_PROGRESSIVE_NODE_ITERATOR, XM_XPATH_EXPRESSION} -- Restricted

	state: INTEGER
			-- Information on items read

	Unread_state: INTEGER = 1
	Maybe_more_state: INTEGER = 2
	All_read_state: INTEGER = 3
	Busy_state: INTEGER = 4
			-- TODO - optimize by adding Empty_state

feature {XM_XPATH_MEMO_CLOSURE} -- Local

	reservoir: detachable DS_ARRAYED_LIST [XM_XPATH_ITEM]
			-- List of items already read

	node_reservoir: detachable DS_ARRAYED_LIST [XM_XPATH_NODE]
			-- List of nodes already read

feature {XM_XPATH_PROGRESSIVE_ITERATOR, XM_XPATH_PROGRESSIVE_NODE_ITERATOR, XM_XPATH_EXPRESSION} -- Restricted

	mark_as_all_read
			-- Set `Current' to `All_read_state'.
		require
			maybe_more: state =	Maybe_more_state
		do
			state := All_read_state
		ensure
			all_read: state = All_read_state
		end

invariant

	state: Unread_state <= state and state <= Busy_state
	reservoir_not_void: not is_node_sequence implies reservoir /= Void
	node_reservoir_not_void: is_node_sequence implies node_reservoir /= Void
	input_iterator: state /= Unread_state implies input_iterator /= Void
	node_iterator: is_node_sequence and then attached input_iterator as l_input_iterator implies l_input_iterator.is_error or else l_input_iterator.is_node_iterator
	empty_reservoir: attached reservoir as l_reservoir and then l_reservoir.count = 0 and then attached input_iterator as l_input_iterator implies l_input_iterator.off
	empty_node_reservoir: attached node_reservoir as l_node_reservoir and then l_node_reservoir.count = 0 and then attached input_iterator as l_input_iterator implies l_input_iterator.off

end
