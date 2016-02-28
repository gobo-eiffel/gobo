note

	description:

		"Objects that enumerate a nodeset that is the intersection of two other nodesets."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2014, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_INTERSECTION_ENUMERATION

inherit

	XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		redefine
			is_node_iterator, as_node_iterator
		end

create {XM_XPATH_VENN_EXPRESSION, XM_XPATH_INTERSECTION_ENUMERATION}

	make

feature {NONE} -- Initialization

	make (a_iterator, a_other_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]; a_comparer: XM_XPATH_GLOBAL_ORDER_COMPARER)
		require
			first_iterator_before: a_iterator /= Void and then not a_iterator.is_error and then a_iterator.before
			second_iterator_before: a_other_iterator /= Void and then not a_other_iterator.is_error and then a_other_iterator.before
			comparer_not_void: a_comparer /= Void
			first_iterator_in_document_order: True
			second_iterator_in_document_order: True
		do
			second_iterator := a_other_iterator
			first_iterator := a_iterator
			comparer := a_comparer
			first_iterator.start
			second_iterator.start
			if attached first_iterator.error_value as l_error_value then
				check is_error: first_iterator.is_error end
				set_last_error (l_error_value)
			elseif attached second_iterator.error_value as l_error_value then
				check is_error: second_iterator.is_error end
				set_last_error (l_error_value)
			else
				if not first_iterator.after then
					first_node := first_iterator.item
				end
				if not second_iterator.after then
					second_node := second_iterator.item
				end
			end
		end

feature -- Access

	item: XM_XPATH_NODE
			-- Value or node at the current position
		do
			check precondition_not_off: attached internal_item as l_internal_item then
				Result := l_internal_item
			end
		end

	is_node_iterator: BOOLEAN
			-- Does `Current' yield a node_sequence?
		do
			Result := True
		end

	as_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- `Current' seen as a node iterator
		do
			Result := Current
		end

feature -- Status report

	after: BOOLEAN
			-- Are there any more items in the sequence?
		do
			Result := not before and internal_item = Void
		end

feature -- Cursor movement

	forth
			-- Move to next position
		local
			l_comparison: INTEGER
			l_finished: BOOLEAN
		do
			index := index + 1
			if first_node = Void or second_node = Void then
				l_finished := True
				internal_item := Void
			end
			from
			until
				l_finished
			loop
				check
					attached first_node as l_first_node
					attached second_node as l_second_node
				then
					l_comparison := comparer.three_way_comparison (l_first_node, l_second_node)
					if l_comparison = 0 then
						internal_item := first_node -- or `second_node' as they are the same
						l_finished := True
						first_iterator.forth
						if attached first_iterator.error_value as l_error_value then
							check is_error: first_iterator.is_error end
							set_last_error (l_error_value)
						elseif first_iterator.after then
							first_node := Void
							l_finished := True
						else
							first_node := first_iterator.item
						end
						second_iterator.forth
						if attached second_iterator.error_value as l_error_value then
							check is_error: second_iterator.is_error end
							set_last_error (l_error_value)
						elseif second_iterator.after then
							second_node := Void
							l_finished := True
						else
							second_node := second_iterator.item
						end
					elseif l_comparison = -1 then
						first_iterator.forth
						if attached first_iterator.error_value as l_error_value then
							check is_error: first_iterator.is_error end
							set_last_error (l_error_value)
						elseif first_iterator.after then
							first_node := Void
							internal_item := Void
							l_finished := True
						else
							first_node := first_iterator.item
						end
					else
						second_iterator.forth
						if attached second_iterator.error_value as l_error_value then
							check is_error: second_iterator.is_error end
							set_last_error (l_error_value)
						elseif second_iterator.after then
							second_node := Void
							l_finished := True
							internal_item := Void
						else
							second_node := second_iterator.item
						end
					end
				end
			end
		end

feature -- Duplication

	another: like Current
			-- Another iterator that iterates over the same items as the original
		do
			create Result.make (first_iterator.another, second_iterator.another, comparer)
		end

feature {NONE} -- Implementation

	first_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- First sequence in document order

	second_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- Second sequence in document order

	comparer: XM_XPATH_GLOBAL_ORDER_COMPARER
			-- Comparer

	first_node: detachable XM_XPATH_NODE
			-- Last inspected node from `first_iterator'

	second_node: detachable XM_XPATH_NODE
			-- Last inspected node from `second_iterator'

	internal_item: detachable XM_XPATH_NODE
			-- Value or node at the current position

invariant

	first_iterator_not_void: first_iterator /= Void
	second_iterator_not_void: second_iterator /= Void
	comparer_not_void: comparer /= Void
	first_iterator_in_document_order: True
	second_iterator_in_document_order: True

end
