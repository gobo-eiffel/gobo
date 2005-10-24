indexing

	description:

		"Iterators over a sequence of zero or one nodes"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_SINGLETON_NODE_ITERATOR

inherit

	XM_XPATH_AXIS_ITERATOR [XM_XPATH_NODE]
		undefine
			is_singleton_iterator, as_singleton_iterator,
			after, item, is_node_iterator, as_node_iterator
		end

	XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_NODE]
		undefine
			is_last_position_finder, as_last_position_finder,
			is_realizable_iterator, as_realizable_iterator,
			is_reversible_iterator, as_reversible_iterator,
			is_invulnerable,
			is_axis_iterator, as_axis_iterator
		redefine
			is_node_iterator, as_node_iterator
		end

create

	make

feature -- Access

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

feature {NONE} -- Implementation

	advance is
			-- Move to the next position
		do

			-- not used

		end	

end
