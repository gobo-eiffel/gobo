note

	description:

	"Objects that iterate over a node sequence consisting of a reservoir%
% of items that have already been read, and a base iterator, "

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_PROGRESSIVE_NODE_ITERATOR

inherit
	
	XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		redefine
			is_node_iterator, as_node_iterator, is_realizable_iterator, realize,
			is_last_position_finder, last_position
		end

create

	make

feature {NONE} -- Initialization

	make (a_reservoir: DS_ARRAYED_LIST [XM_XPATH_NODE]; a_base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]; a_closure: like closure) is
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
		end

feature -- Access

	item: XM_XPATH_NODE is
			-- Node at the current position
		do
			Result := reservoir.item (index)
		end
	
	last_position: INTEGER is
			-- Last position (= number of items in sequence)
		do
			if closure /= Void and then closure.is_all_read then
					Result := closure.count
			else
				fill_reservoir
				if closure /= Void then
					Result := closure.count
				end
			end
		end

feature -- Status report

	is_node_iterator: BOOLEAN is
			-- Does `Current' yield a node_sequence?
		do
			Result := True
		end

	is_realizable_iterator: BOOLEAN is
			-- Is `Current' a realizable iterator?
		do
			Result := True
		end
	
	is_last_position_finder: BOOLEAN is
			-- Can `Current' find the last position?
		do
			Result := True
		end

	after: BOOLEAN is
			-- Are there any more items in the sequence?
		do
			if index > reservoir.count and then not base_iterator.is_error then
				if closure /= Void  and then closure.is_all_read then
					Result := True
				else
					Result := not base_iterator.before and then base_iterator.after
				end
			end
		end

feature -- Cursor movement

	forth is
			-- Move to next position
		do
			index := index + 1
			if index > reservoir.count then
				if closure = Void or else not closure.is_all_read then
					if base_iterator.is_error then
						set_last_error (base_iterator.error_value)
					else
						if base_iterator.before then
							base_iterator.start
						elseif not base_iterator.after then
							base_iterator.forth
						end
					end
					if base_iterator.is_error then
						set_last_error (base_iterator.error_value)
					elseif not base_iterator.after then
						reservoir.force_last (base_iterator.item)
					end
				end
			end
		end

feature -- Evaluation

	realize is
			-- Realize the sequence as a value.
		do
			if base_iterator.is_error then
				create {XM_XPATH_INVALID_VALUE} last_realized_value.make (base_iterator.error_value)
			elseif not base_iterator.before and then base_iterator.after then
				create {XM_XPATH_SEQUENCE_EXTENT} last_realized_value.make_from_list (reservoir)
			else
				fill_reservoir
				realize
			end
		end

feature -- Conversion

	as_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- `Current' seen as a node iterator
		do
			Result ?= ANY_.to_any (Current)
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original;
			-- The new iterator will be repositioned at the start of the sequence
		do
			create Result.make (reservoir, base_iterator, closure)
		end
	
feature {NONE} -- Implementation

	reservoir: DS_ARRAYED_LIST [XM_XPATH_NODE]
			-- Reservoir of nodes already read

	base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- Source of unread nodes

	closure: XM_XPATH_MEMO_CLOSURE
			-- Closure over which `Current' iterates

	fill_reservoir is
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
			if closure /= Void then
				closure.mark_as_all_read
			end
		ensure
			filled: base_iterator.after
		end

invariant

	reservoir_not_void: reservoir /= Void
	base_iterator_not_void: base_iterator /= Void

end
	
