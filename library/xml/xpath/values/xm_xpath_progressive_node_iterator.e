indexing

	description:

	"Objects that iterate over a node sequence consisting of a reservoir%
% of items that have already been read, and an base iterator, "

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_PROGRESSIVE_NODE_ITERATOR

inherit
	
	XM_XPATH_REALIZABLE_ITERATOR [XM_XPATH_NODE]
		redefine
			is_node_iterator, as_node_iterator
		end

create

	make

feature {NONE} -- Initialization

	make (a_reservoir: DS_ARRAYED_LIST [XM_XPATH_NODE]; a_base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]) is
			-- Establish invariant.
		require
			reservoir_not_void: a_reservoir /= Void
			base_iterator_not_in_error: a_base_iterator /= Void and then not a_base_iterator.is_error
		do
			reservoir := a_reservoir
			base_iterator := a_base_iterator
		ensure
			reservoir_set: reservoir = a_reservoir
			base_iterator_set: base_iterator = a_base_iterator
		end

feature -- Access

	item: XM_XPATH_NODE is
			-- Node at the current position
		do
			Result := reservoir.item (index)
		end

	is_node_iterator: BOOLEAN is
			-- Does `Current' yield a node_sequence?
		do
			Result := True
		end

	as_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- `Current' seen as a node iterator
		do
			Result ?= ANY_.to_any (Current)
		end

feature -- Status report

	after: BOOLEAN is
			-- Are there any more items in the sequence?
		do
			if not base_iterator.is_error then
				Result := base_iterator.after
			end
		end

feature -- Cursor movement

	forth is
			-- Move to next position
		do
			index := index + 1
			if index > reservoir.count then
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

feature -- Evaluation

	realize is
			-- Realize the sequence as a value.
		do
			if base_iterator.is_error then
				create {XM_XPATH_INVALID_VALUE} last_realized_value.make (base_iterator.error_value)
			elseif base_iterator.after then
				create {XM_XPATH_SEQUENCE_EXTENT} last_realized_value.make_from_list (reservoir)
			elseif reservoir.is_empty then
				create {XM_XPATH_SEQUENCE_EXTENT} last_realized_value.make (base_iterator)
			else
				create {XM_XPATH_SEQUENCE_EXTENT} last_realized_value.make (another)
			end
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original;
			-- The new iterator will be repositioned at the start of the sequence
		do
			create Result.make (reservoir, base_iterator)
		end
	
feature {NONE} -- Implementation

	reservoir: DS_ARRAYED_LIST [XM_XPATH_NODE]
			-- Reservoir of nodes already read

	base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- Source of unread nodes

invariant

	reservoir_not_void: reservoir /= Void
	base_iterator_not_void: base_iterator /= Void

end
	
