note

	description:

	"Objects that iterate over a sequence consisting of a reservoir%
% of items that have already been read, and a base iterator, "

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2014, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_PROGRESSIVE_ITERATOR

inherit

	XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		redefine
			is_realizable_iterator, realize,
			is_last_position_finder, last_position
		end

create

	make

feature {NONE} -- Initialization

	make (a_reservoir: DS_ARRAYED_LIST [XM_XPATH_ITEM]; a_base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]; a_closure: like closure)
			-- Establish invariant.
		require
			reservoir_not_void: a_reservoir /= Void
			base_iterator_not_in_error: a_base_iterator /= Void and then not a_base_iterator.is_error
			empty_reservoir: a_reservoir.count = 0 implies a_base_iterator.off
		do
			reservoir := a_reservoir
			base_iterator := a_base_iterator
			closure := a_closure
		ensure
			reservoir_set: reservoir = a_reservoir
			base_iterator_set: base_iterator = a_base_iterator
			closure_set: closure = a_closure
			before: before
		end

feature -- Access

	item: XM_XPATH_ITEM
			-- Value or node at the current position
		do
			Result := reservoir.item (index)
		end

	last_position: INTEGER
			-- Last position (= number of items in sequence)
		do
			if attached closure as l_closure and then l_closure.is_all_read then
					Result := l_closure.count
			else
				fill_reservoir
				if attached closure as l_closure then
					Result := l_closure.count
				end
			end
		end

feature -- Status report

	is_realizable_iterator: BOOLEAN
			-- Is `Current' a realizable iterator?
		do
			Result := True
		end

	is_last_position_finder: BOOLEAN
			-- Can `Current' find the last position?
		do
			Result := True
		end

	after: BOOLEAN
			-- Are there any more items in the sequence?
		do
			if index > reservoir.count and then not base_iterator.is_error then
				if attached closure as l_closure and then l_closure.is_all_read then
					Result := True
				else
					Result := not base_iterator.before and then base_iterator.after
				end
			end
		end

feature -- Cursor movement

	forth
			-- Move to next position
		do
			index := index + 1
			if index > reservoir.count then
				if not attached closure as l_closure or else not l_closure.is_all_read then
					if attached base_iterator.error_value as l_error_value then
						check is_error: base_iterator.is_error end
						set_last_error (l_error_value)
					else
						if base_iterator.before then
							base_iterator.start
						elseif not base_iterator.after then
							base_iterator.forth
						end
					end
					if attached base_iterator.error_value as l_error_value then
						check is_error: base_iterator.is_error end
						set_last_error (l_error_value)
					elseif not base_iterator.after then
						reservoir.force_last (base_iterator.item)
					end
				end
			end
		end

feature -- Evaluation

	realize
			-- Realize the sequence as a value.
		do
			if attached base_iterator.error_value as l_error_value then
				check is_error: base_iterator.is_error end
				create {XM_XPATH_INVALID_VALUE} last_realized_value.make (l_error_value)
			elseif not base_iterator.before and then base_iterator.after then
				create {XM_XPATH_SEQUENCE_EXTENT} last_realized_value.make_from_list (reservoir)
			else
				fill_reservoir
				realize
			end
		end

feature -- Duplication

	another: like Current
			-- Another iterator that iterates over the same items as the original;
			-- The new iterator will be repositioned at the start of the sequence
		do
			create Result.make (reservoir, base_iterator, closure)
		end

feature {NONE} -- Implementation

	reservoir: DS_ARRAYED_LIST [XM_XPATH_ITEM]
			-- Reservoir of items already read

	base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			-- Source of unread items

	closure: detachable XM_XPATH_MEMO_CLOSURE
			-- Closure over which `Current' iterates

	fill_reservoir
			-- Fill `reservoir' from `base_iterator'
		require
			not_full: base_iterator.before or else not base_iterator.after
		do
			if base_iterator.before then
				base_iterator.start
				if not base_iterator.after then
					reservoir.force_last (base_iterator.item)
				end
			end
			from
			until
				base_iterator.after
			loop
				base_iterator.forth
				if not base_iterator.after then
					reservoir.force_last (base_iterator.item)
				end
			end
			if attached closure as l_closure then
				l_closure.mark_as_all_read
			end
		ensure
			filled: base_iterator.after
		end

invariant

	reservoir_not_void: reservoir /= Void
	base_iterator_not_void: base_iterator /= Void

end

