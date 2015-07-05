note

	description:

		"Iterators over an arrayed list of  nodes"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005-2014, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ARRAY_NODE_LIST_ITERATOR

inherit

	XM_XPATH_AXIS_ITERATOR [XM_XPATH_NODE]
		undefine
			start, after, is_realizable_iterator, realize,
			item, is_node_iterator, as_node_iterator, is_array_iterator,
			as_array_iterator, is_reversible_iterator,
			reverse_iterator, last_position, is_last_position_finder
		end

	XM_XPATH_ARRAY_LIST_ITERATOR [XM_XPATH_NODE]
		undefine
			is_invulnerable, is_axis_iterator, as_axis_iterator
		redefine
			is_node_iterator, as_node_iterator
		end

create

	make, make_slice

feature -- Access

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

feature {NONE} -- Implementation

	advance
			-- Move to the next position
		do

			-- not used

		end

end
