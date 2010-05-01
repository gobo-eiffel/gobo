note

	description:

		"Objects that iterate over a sequence of nodes"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2007, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_BLOCK_NODE_ITERATOR

inherit

	XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		redefine
			is_node_iterator, as_node_iterator
		end

create

	make

feature {NONE} -- Initialization

	make (a_list: like child_list; a_context: like context) is
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
			Result := child_index >= child_list.count
				and then (child_iterator = Void or else child_iterator.after)
		end

feature -- Cursor movement

	forth is
			-- Move to next position
		local
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		do
			index := index + 1
			if child_iterator = Void then
				from
				until
					(child_iterator /= Void and then (child_iterator.is_error or else not child_iterator.after)) or else child_index = child_list.count
				loop
					child_index := child_index + 1
					child_list.item (child_index).create_node_iterator (context)
					l_iterator := child_list.item (child_index).last_node_iterator
					if not l_iterator.is_error then
						child_iterator := l_iterator
					else
						create {XM_XPATH_INVALID_NODE_ITERATOR} child_iterator.make (l_iterator.error_value)
					end
					if not child_iterator.is_error then child_iterator.start end
				end
			else
				child_iterator.forth
				if child_iterator.after and then child_index < child_list.count then
					from
					until
						(child_iterator /= Void and then child_iterator.is_error or else not child_iterator.after) or else child_index = child_list.count
					loop
						child_index := child_index + 1
						child_list.item (child_index).create_node_iterator (context)
						child_iterator := child_list.item (child_index).last_node_iterator
						if not child_iterator.is_error then child_iterator.start end
					end
				end
			end
			if child_iterator.is_error then
				set_last_error (child_iterator.error_value)
			elseif child_iterator.after then
				check
					last_child: child_index >= child_list.count
					-- routine logic
				end
				item := Void
			else
				item := child_iterator.item
			end
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original
		do
			create Result.make (child_list, context)
		end

feature {NONE} -- Implementation

	child_list: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Child_List to be iterated

	context: XM_XPATH_CONTEXT
			-- Dynamic context

	child_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- Iterator over current child

	child_index: INTEGER
			-- Current child being iterated

invariant

	child_list_not_empty: child_list /= Void and then child_list.count > 0
	context_not_void: context /= Void
	child_index_in_range: child_index >= 0 and then child_index <= child_list.count

end

