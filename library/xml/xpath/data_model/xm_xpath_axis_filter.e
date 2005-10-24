indexing

	description:

		"Objects that filter an axis iterator with a node test"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_AXIS_FILTER [G -> XM_XPATH_NODE]

inherit

	XM_XPATH_AXIS_ITERATOR [G]
		redefine
			start, after
		end

create

	make

feature {NONE} -- Initialization

	make (a_base_iterator: XM_XPATH_AXIS_ITERATOR [G]; a_node_test: XM_XPATH_NODE_TEST) is
			-- Establish invariant.
		require
			base_iterator_before: base_iterator /= Void and then base_iterator.before
			node_test_not_void: a_node_test /= Void
		do
			base_iterator := a_base_iterator
			if base_iterator.is_error then
				set_last_error (base_iterator.error_value)
			end
			node_test := a_node_test
		ensure
			base_iterator_set: base_iterator = a_base_iterator
			node_test_set: node_test = a_node_test
		end

feature -- Status report

	after: BOOLEAN is
			-- Are there any more items in the sequence?
		do
			Result := base_iterator.after 
		end

feature -- Cursor movement

	start is
			-- Move to first position
		local
			l_default: G
		do
			index := 1
			from
				base_iterator.start
			until base_iterator.after or else node_test.matches_item (base_iterator.item) loop
				base_iterator.forth
			end
			if base_iterator.after then
				current_item := l_default
			else
				current_item := base_iterator.item
			end
		end
			
	forth is
			-- Move to next position
		local
			l_default: G
		do
			index := index + 1
			from
				base_iterator.forth
			until base_iterator.after or else node_test.matches_item (base_iterator.item) loop
				base_iterator.forth
			end
			if base_iterator.after then
				current_item := l_default
			else
				current_item := base_iterator.item
			end
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original
		do
			create Result.make (base_iterator.another, node_test)
		end

feature {NONE} -- Implementation

	base_iterator: XM_XPATH_AXIS_ITERATOR [G]
			-- Base iterator

	node_test: XM_XPATH_NODE_TEST
			-- Filtering node test

	advance is
			-- Move to the next position
		do
			-- not used
		end

invariant

	base_iterator_not_void: base_iterator /= Void
	node_test_not_void: node_test /= Void
	
end
	
