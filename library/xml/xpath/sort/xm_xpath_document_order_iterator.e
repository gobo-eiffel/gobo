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


creation

	make

feature {NONE} -- Initialization

	make (an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]; a_comparer: XM_XPATH_NODE_ORDER_COMPARER) is
			-- establish invariant.
		require
			comparer_not_void: a_comparer /= Void
			iterator_not_void: an_iterator /= Void
		local
			a_sorter: DS_QUICK_SORTER [XM_XPATH_NODE]
		do
			comparer := a_comparer
			create sequence.make (an_iterator)
			create a_sorter.make (a_comparer)
			sequence.sort (a_sorter)
			sequence_iterator := sequence.iterator (Void)
		ensure
			comparer_set: comparer = a_comparer
		end

feature -- Access
	
	item: XM_XPATH_NODE is
			-- Value or node at the current position
		do
			Result := current_node
		end

feature -- Status report

	after: BOOLEAN is
			-- Are there any more items in the sequence?
		do
			Result := sequence_iterator.after
		end

feature -- Cursor movement

	forth is
			-- Move to next position, skipping over duplicates
		local
			a_node: XM_XPATH_NODE
			finished: BOOLEAN
		do
			if before then
				sequence_iterator.forth
			else
				from
				until
					finished
				loop
					a_node := item
					sequence_iterator.forth
					if not sequence_iterator.after then
						current_node ?= sequence_iterator.item
						check
							is_a_node: current_node /= Void
						end
						if not a_node.is_same_node (current_node) then
							finished := True
						end
					else
						finished := True
					end
				end
			end
			index := index + 1
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original
		do
			todo ("another", False)
		end

feature {NONE} -- Implementation

	comparer: XM_XPATH_NODE_ORDER_COMPARER
			-- Comparer

	sequence: XM_XPATH_SEQUENCE_EXTENT
		-- Base sequence

	sequence_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			-- Sequence extent iterator

	current_node: XM_XPATH_NODE
			-- used by `forth' and `item'

invariant

	comparer_not_void: comparer /= Void
	sequence_extent_not_void: sequence /= Void
	iterator_not_void: sequence_iterator /= Void
end
