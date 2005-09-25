indexing

	description:

		"Objects that enumerate a nodeset that is the union of two other nodesets."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_UNION_ENUMERATION

inherit

	XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		redefine
			is_node_iterator, as_node_iterator
		end

create

	make

		-- The two input iterators must return nodes in document order for this to work.

feature {NONE} -- Initialization

	make (an_iterator, another_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]; a_comparer: XM_XPATH_GLOBAL_ORDER_COMPARER) is
			-- Establish invariant.
		require
			first_iterator_before: an_iterator /= Void and then not an_iterator.is_error and then an_iterator.before
			second_iterator_before: another_iterator /= Void and then not another_iterator.is_error and then another_iterator.before
			comparer_not_void: a_comparer /= Void
		do
			second_iterator := another_iterator
			first_iterator := an_iterator
			comparer := a_comparer
		end

feature -- Access
	
	item: XM_XPATH_NODE
			-- Value or node at the current position

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
			Result := first_iterator.after and then second_iterator.after
		end

feature -- Cursor movement

	forth is
			-- Move to next position
		do
			index := index + 1
			if not first_iterator.before and then first_iterator.after then
				advance_second_iterator
				if second_iterator.is_error then
					set_last_error (second_iterator.error_value)
				elseif not second_iterator.after then
					item := second_iterator.item
				else
					item := Void
				end
			elseif not second_iterator.before and then second_iterator.after then
				advance_first_iterator
				if first_iterator.is_error then
					set_last_error (first_iterator.error_value)
				elseif not first_iterator.after then
					item := first_iterator.item
				else
					item := Void
				end
			else

				-- both iterators may point to valid items

				if cached_first_node = Void then
					advance_first_iterator
					if first_iterator.is_error then
						set_last_error (first_iterator.error_value)
					elseif first_iterator.after then
						if cached_second_node = Void then
							advance_second_iterator
							if second_iterator.is_error then
								set_last_error (second_iterator.error_value)
							elseif second_iterator.after then
								item := Void
							else
								item := second_iterator.item
							end
						else
							item := cached_second_node
						end
					else
						first_node := first_iterator.item
						if cached_second_node /= Void then
							second_node := cached_second_node
							compare_two_nodes
						else
							advance_second_iterator
							if second_iterator.is_error then
								set_last_error (second_iterator.error_value)
							elseif second_iterator.after then
								item := first_node
							else
								second_node := second_iterator.item
								compare_two_nodes
							end
						end
					end
				else -- first node is cached so second can't be
					first_node := cached_first_node
					advance_second_iterator
					if second_iterator.is_error then
						set_last_error (second_iterator.error_value)
					elseif second_iterator.after then
						item := first_node
					else
						second_node := second_iterator.item
						compare_two_nodes
					end
				end
			end
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original
		do
			create Result.make (first_iterator.another, second_iterator.another, comparer)
		end

feature {NONE} -- Implementation

	first_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- First sequence

	second_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- Second sequence

	comparer: XM_XPATH_GLOBAL_ORDER_COMPARER
			-- Comparer

	cached_first_node, cached_second_node: XM_XPATH_NODE

	first_node, second_node: XM_XPATH_NODE
			-- Nodes for comparison by `compare_two_nodes'

	compare_two_nodes is
			-- Compare two nodes.
		require
			first_node_not_void: first_node /= Void
			second_node_not_void: second_node /= Void
		local
			a_comparison: INTEGER
		do
			a_comparison := comparer.three_way_comparison (first_node, second_node)
			if a_comparison = -1 then
				item := first_node
				cached_first_node := Void
				cached_second_node := second_node
			elseif a_comparison = 1 then
				item := second_node
				cached_first_node := first_node
				cached_second_node := Void
			else
				item := second_node
				cached_first_node := Void
				cached_second_node := Void
			end
		end

	advance_first_iterator is
			-- Advance `first_iterator'.
		do
			if first_iterator.before then
				first_iterator.start
			else
				first_iterator.forth
			end
		end

	advance_second_iterator is
			-- Advance `second_iterator'.
		do
			if second_iterator.before then
				second_iterator.start
			else
				second_iterator.forth
			end
		end

invariant

	first_iterator_not_void: first_iterator /= Void
	second_iterator_not_void: second_iterator /= Void
	comparer_not_void: comparer /= Void

end
