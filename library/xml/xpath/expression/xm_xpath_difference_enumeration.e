note

	description:

		"Objects that enumerate a nodeset that is the difference of two other nodesets."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_DIFFERENCE_ENUMERATION

inherit

	XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		redefine
			is_node_iterator, as_node_iterator
		end

create

	make

feature {NONE} -- Initialization

	make (an_iterator, another_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]; a_comparer: XM_XPATH_NODE_ORDER_COMPARER)
			-- Establish invariant.
		require
			comparer_not_void: a_comparer /= Void
			first_iterator_before: an_iterator /= Void and then not an_iterator.is_error and then an_iterator.before
			second_iterator_before: another_iterator /= Void and then not another_iterator.is_error and then another_iterator.before
		do
			comparer := a_comparer
			first_iterator := an_iterator
			second_iterator := another_iterator
		ensure
			compare_set: comparer = a_comparer
			first_iterator_set: first_iterator = an_iterator
			second_iterator_set: second_iterator = another_iterator
		end

feature -- Access

	item: XM_XPATH_NODE
			-- Value or node at the current position
		do
			Result := current_node
		end

	is_node_iterator: BOOLEAN
			-- Does `Current' yield a node_sequence?
		do
			Result := True
		end

	as_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- `Current' seen as a node iterator
		do
			Result ?= ANY_.to_any (Current)
		end

feature -- Status report

	after: BOOLEAN
			-- Are there any more items in the sequence?
		do
			Result := first_iterator.after
		end

feature -- Cursor movement

	forth
			-- Move to next position
		do
			advance
			index := index + 1
		end

feature -- Duplication

	another: like Current
			-- Another iterator that iterates over the same items as the original
		do
			create Result.make (first_iterator.another, second_iterator.another, comparer)
		end

feature {NONE} -- Implementation

	comparer: XM_XPATH_NODE_ORDER_COMPARER
			-- Node order comparer

	first_iterator, second_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- Iterators across the two sets

	current_node: like item
			-- Current item

	advance
			-- Move to next item.
		require
			not_after: before or else not after
		do
			if before then
				first_iterator.start
				second_iterator.start
			else
				first_iterator.forth
			end

			if first_iterator.is_error then
				set_last_error (first_iterator.error_value)
				current_node := Void
			elseif first_iterator.after then
				current_node := Void
			elseif second_iterator.is_error then
				set_last_error (second_iterator.error_value)
				current_node := Void
			elseif second_iterator.after then
				current_node := first_iterator.item
			else
				advance_both_iterators
			end
		end

	advance_both_iterators
			-- Move to next item.
		require
			first_iterator_not_off: not first_iterator.is_error and then not first_iterator.off
			second_iterator_not_off: not second_iterator.is_error and then not second_iterator.off
		local
			finished: BOOLEAN
			comparison: INTEGER
			first_node, second_node: XM_XPATH_NODE
		do
			from
				finished := False
			until
				finished
			loop
				first_node := first_iterator.item
				second_node := second_iterator.item
				comparison := comparer.three_way_comparison (first_node, second_node)
				if comparison = -1 then
					finished := True
					current_node := first_node
				elseif comparison = 0 then
					first_iterator.forth
					if first_iterator.is_error then
						set_last_error (first_iterator.error_value)
						finished := True
						current_node := Void
					elseif first_iterator.after then
						finished := True
						current_node := Void
					else
						second_iterator.forth
						if second_iterator.is_error then
							set_last_error (second_iterator.error_value)
							finished := True
							current_node := Void
						elseif second_iterator.after then
							finished := True
							current_node := first_node
						end
					end
				else
					second_iterator.forth
					if second_iterator.is_error then
						set_last_error (second_iterator.error_value)
						finished := True
						current_node := Void
					elseif second_iterator.after then
						finished := True
						current_node := first_node
					end
				end
			end
		end

invariant

	comparer_not_void: comparer /= Void
	first_iterator_not_void: first_iterator /= Void
	second_iterator_not_void: second_iterator /= Void
	valid_item: off or else current_node /= Void

end
