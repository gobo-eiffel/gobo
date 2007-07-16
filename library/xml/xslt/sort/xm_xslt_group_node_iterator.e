indexing

	description:

		"Iterators over groups of nodes. `item' Always points to first node in group"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2007, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class	XM_XSLT_GROUP_NODE_ITERATOR

inherit

	XM_XSLT_GROUP_ITERATOR [XM_XPATH_NODE]
		undefine
			is_realizable_iterator, as_realizable_iterator,
			is_axis_iterator, as_axis_iterator,
			is_node_iterator, as_node_iterator,
			is_reversible_iterator, as_reversible_iterator,
			is_singleton_iterator, as_singleton_iterator,
			is_last_position_finder, as_last_position_finder,
			is_array_iterator, as_array_iterator,			
			is_empty_iterator, as_empty_iterator
		redefine
			is_group_node_iterator, as_group_node_iterator
		select
			error_value, index, is_error
		end

	XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		rename
			error_value as node_sequence_error_value,
			index as node_sequence_index,
			is_error as is_node_sequence_error
		undefine
			set_last_error, is_invulnerable,
			before, off, start
		redefine
			is_node_iterator, as_node_iterator
		end

feature -- Status report

	is_node_iterator: BOOLEAN is
			-- Does `Current' yield a node sequence?
		do
			Result := True
		end

	is_group_node_iterator: BOOLEAN is
			-- Is `Current' a group-node-iterator?
		do
			Result := True
		end

feature -- Conversion

	as_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- `Current' seen as a node iterator
		do
			Result := Current
		end

	as_group_node_iterator: XM_XSLT_GROUP_NODE_ITERATOR is
			-- `Current' seen as a group-node-iterator.
		do
			Result := Current
		end
	
end
	
