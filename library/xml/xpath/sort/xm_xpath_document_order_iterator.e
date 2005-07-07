indexing

	description:

	"Objects that take as input an iteration of nodes in any order, and%
	%return as output an iteration of the same nodes in document order,%
	%eliminating any duplicates.."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_DOCUMENT_ORDER_ITERATOR

inherit

	XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		redefine
			start, is_node_iterator, as_node_iterator
		end

creation

	make

creation {XM_XPATH_DOCUMENT_ORDER_ITERATOR}

	make_another

feature {NONE} -- Initialization

	make (an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]; a_comparer: XM_XPATH_NODE_ORDER_COMPARER) is
			-- Establish invariant.
		require
			comparer_not_void: a_comparer /= Void
			iterator_before: an_iterator /= Void and then not an_iterator.is_error and then an_iterator.before
		local
			a_sorter: DS_QUICK_SORTER [XM_XPATH_NODE]
		do
			comparer := a_comparer
			create sequence.make_default
			from
				an_iterator.start
			until
				an_iterator.is_error or else an_iterator.after
			loop
				sequence.force_last (an_iterator.item)
				an_iterator.forth
			end
			create a_sorter.make (a_comparer)
			sequence.sort (a_sorter)
			if an_iterator.is_error then
				set_last_error (an_iterator.error_value)
			end
		ensure
			comparer_set: comparer = a_comparer
		end

	make_another (a_sequence: like sequence; a_comparer: XM_XPATH_NODE_ORDER_COMPARER) is
			-- Create another document order iterator (used by `another').
		require
			comparer_not_void: a_comparer /= Void
			sequence_not_void: a_sequence /= Void
		do
			
			-- No need to repeat the sort

			create sequence.make_from_linear (a_sequence)
			comparer := a_comparer
		ensure
			comparer_set: comparer = a_comparer
		end

feature -- Access
	
	item: XM_XPATH_NODE is
			-- Value or node at the current position
		do
			Result := current_node
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
			Result := sequence.after
		end

feature -- Cursor movement

	start is
			-- Move to first position
		do
			sequence.start
			index := 1
			if not sequence.after then
				current_node := sequence.item (1)
			end
		end

feature -- Cursor movement

	forth is
			-- Move to next position, skipping over duplicates
		local
			finished: BOOLEAN
			a_node: XM_XPATH_NODE
		do
			from
			until
				finished
			loop
				a_node := sequence.item_for_iteration
				sequence.forth
				if not sequence.after then
					current_node := sequence.item_for_iteration
					if a_node.is_error then
						finished := True
						set_last_error (a_node.error_value)
					elseif not a_node.is_same_node (current_node) then
						finished := True
					end
				else
					finished := True
				end
			end
			index := index + 1 -- to satisfy the interface
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original
		do
			create Result.make_another (sequence, comparer)
		end

feature {NONE} -- Implementation

	comparer: XM_XPATH_NODE_ORDER_COMPARER
			-- Comparer

	current_node: XM_XPATH_NODE
			-- used by `forth' and `item'

	sequence: DS_ARRAYED_LIST [XM_XPATH_NODE]
			-- Sequence of nodes to be sorted

invariant

	comparer_not_void: comparer /= Void
	sequence_extent_not_void: sequence /= Void

end
