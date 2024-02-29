note

	description:

		"Iterators over groups of nodes. `item' Always points to first node in group"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2007-2015, Colin Adams and others"
	license: "MIT License"

deferred class XM_XSLT_GROUP_NODE_ITERATOR

inherit

	XM_XSLT_GROUP_ITERATOR [XM_XPATH_NODE]
		undefine
			is_realizable_iterator, realize,
			is_axis_iterator, as_axis_iterator,
			is_node_iterator, as_node_iterator,
			is_reversible_iterator,
			is_singleton_iterator, as_singleton_iterator,
			is_array_iterator, as_array_iterator,
			is_empty_iterator, as_empty_iterator
		redefine
			is_group_node_iterator, as_group_node_iterator,
			error_value, index, is_error
		end

	XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		undefine
			set_last_error, is_invulnerable,
			before, off, start, is_last_position_finder, last_position
		redefine
			is_node_iterator, as_node_iterator,
			error_value, index, is_error
		end

feature -- Status report

	is_error: BOOLEAN
			-- Is `Current' in error?

	is_node_iterator: BOOLEAN
			-- Does `Current' yield a node sequence?
		do
			Result := True
		end

	is_group_node_iterator: BOOLEAN
			-- Is `Current' a group-node-iterator?
		do
			Result := True
		end

feature -- Access

	index: INTEGER
			-- The position of the current item;
			-- This will be zero after creation of the iterator

	error_value: detachable XM_XPATH_ERROR_VALUE
			-- Last error

feature -- Conversion

	as_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- `Current' seen as a node iterator
		do
			Result := Current
		end

	as_group_node_iterator: XM_XSLT_GROUP_NODE_ITERATOR
			-- `Current' seen as a group-node-iterator.
		do
			Result := Current
		end

end

