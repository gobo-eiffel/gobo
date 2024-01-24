note

	description:

		"Objects that iterate over a sequence of nodes"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2007-2014, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_BLOCK_NODE_ITERATOR

inherit

	XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		redefine
			is_node_iterator, as_node_iterator
		end

create

	make

feature {NONE} -- Initialization

	make (a_list: like child_list; a_context: like context)
			-- Establish invariant.
		require
			child_list_not_empty: a_list /= Void and then a_list.count > 0
		do
			child_list := a_list
			context := a_context
		ensure
			child_list_set: child_list = a_list
			context_set: context = a_context
		end

feature -- Access

	item: XM_XPATH_NODE
			-- Node at the current position
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
			Result := child_index >= child_list.count
				and then (not attached child_iterator as l_child_iterator or else l_child_iterator.after)
		end

feature -- Cursor movement

	forth
			-- Move to next position
		local
			l_child_iterator: like child_iterator
		do
			index := index + 1
			l_child_iterator := child_iterator
			if l_child_iterator = Void then
				from
				until
					(l_child_iterator /= Void and then (l_child_iterator.is_error or else not l_child_iterator.after)) or else child_index = child_list.count
				loop
					child_index := child_index + 1
					child_list.item (child_index).create_node_iterator (context)
					check postcondition_of_create_node_iterator: attached child_list.item (child_index).last_node_iterator as l_iterator then
						if attached l_iterator.error_value as l_error_value then
							check is_error: l_iterator.is_error end
							create {XM_XPATH_INVALID_NODE_ITERATOR} l_child_iterator.make (l_error_value)
							child_iterator := l_child_iterator
						else
							l_child_iterator := l_iterator
							child_iterator := l_child_iterator
						end
						if not l_child_iterator.is_error then
							l_child_iterator.start
						end
					end
				end
			else
				l_child_iterator.forth
				if l_child_iterator.after and then child_index < child_list.count then
					from
					until
						(l_child_iterator /= Void and then (l_child_iterator.is_error or else not l_child_iterator.after)) or else child_index = child_list.count
					loop
						child_index := child_index + 1
						child_list.item (child_index).create_node_iterator (context)
						check postcondition_of_create_node_iterator: attached child_list.item (child_index).last_node_iterator as l_iterator then
							l_child_iterator := l_iterator
							child_iterator := l_child_iterator
							if not l_child_iterator.is_error then
								l_child_iterator.start
							end
						end
					end
				end
			end
			check l_child_iterator /= Void then
				if attached l_child_iterator.error_value as l_error_value then
					check is_error: l_child_iterator.is_error end
					set_last_error (l_error_value)
				elseif l_child_iterator.after then
					check
						last_child: child_index >= child_list.count
						-- routine logic
					end
					internal_item := Void
				else
					internal_item := l_child_iterator.item
				end
			end
		end

feature -- Duplication

	another: like Current
			-- Another iterator that iterates over the same items as the original
		do
			create Result.make (child_list, context)
		end

feature {NONE} -- Implementation

	child_list: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Child_List to be iterated

	context: XM_XPATH_CONTEXT
			-- Dynamic context

	child_iterator: detachable XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- Iterator over current child

	child_index: INTEGER
			-- Current child being iterated

	internal_item: detachable XM_XPATH_NODE
			-- Node at the current position

invariant

	child_list_not_empty: child_list /= Void and then child_list.count > 0
	context_not_void: context /= Void
	child_index_in_range: child_index >= 0 and then child_index <= child_list.count

end

