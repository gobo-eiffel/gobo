indexing

	description:

		"Objects that enumerate a nodeset that is the intersection of two other nodesets."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_INTERSECTION_ENUMERATION

inherit

	XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		redefine
			is_node_iterator, as_node_iterator
		end

create

	make

feature {NONE} -- Initialization

	make (an_iterator, another_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]; a_comparer: XM_XPATH_GLOBAL_ORDER_COMPARER) is
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
			Result := first_iterator.after or second_iterator.after
		end

feature -- Cursor movement

	forth is
			-- Move to next position
		local
			a_first_node, a_second_node: XM_XPATH_NODE
			a_comparison: INTEGER
		do
			index := index + 1
			if index = 1 then
				first_iterator.start
				second_iterator.start
			else
				first_iterator.forth
				second_iterator.forth
			end
			if first_iterator.is_error then
				set_last_error (first_iterator.error_value)
			elseif second_iterator.is_error then
				set_last_error (second_iterator.error_value)
			elseif not after then
				a_first_node := first_iterator.item
				a_second_node := second_iterator.item
				a_comparison := comparer.three_way_comparison (a_first_node, a_second_node)
				if a_comparison = 0 then
					item := a_first_node
				elseif a_comparison = -1 then
					from
					until
						is_error or else a_comparison = 0 or else after
					loop
						first_iterator.forth
						if first_iterator.is_error then
							set_last_error (first_iterator.error_value)
						elseif not first_iterator.after then
							a_first_node := first_iterator.item
							a_comparison := comparer.three_way_comparison (a_first_node, a_second_node)
							if a_comparison = 0 then
								item := a_first_node
							end
						end
					end
				else
					from
					until
						is_error or else a_comparison = 0 or else after
					loop
						second_iterator.forth
						if second_iterator.is_error then
							set_last_error (second_iterator.error_value)
						elseif not second_iterator.after then
							a_second_node := second_iterator.item
							a_comparison := comparer.three_way_comparison (a_first_node, a_second_node)
							if a_comparison = 0 then
								item := a_first_node
							end
						end
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

invariant

	first_iterator_not_void: first_iterator /= Void
	second_iterator_not_void: second_iterator /= Void
	comparer_not_void: comparer /= Void

end
