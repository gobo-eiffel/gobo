note

	description:

		"Iterators over a sequence of zero or one nodes"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005-2014, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_SINGLETON_NODE_ITERATOR

inherit

	XM_XPATH_AXIS_ITERATOR [XM_XPATH_NODE]
		undefine
			is_singleton_iterator, as_singleton_iterator,
			after, item, is_node_iterator, as_node_iterator,
			is_last_position_finder, last_position,
			is_reversible_iterator, reverse_iterator
		end

	XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_NODE]
		undefine
			is_invulnerable,
			is_axis_iterator, as_axis_iterator,
			is_realizable_iterator, realize
		redefine
			is_node_iterator, as_node_iterator
		end

create

	make

feature -- Access

	is_node_iterator: BOOLEAN
			-- Does `Current' yield a node_sequence?
		do
			Result := True
		end

feature -- Conversion

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
