indexing

	description:

		"XPath nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_NODE

inherit

	XM_XPATH_ITEM

	XM_XPATH_AXIS

feature -- Access
	-- (These features are not in the data model)
	
	new_axis_iterator (axis_type: INTEGER): XM_XPATH_AXIS_ITERATOR [XM_XPATH_ABSTRACT_NODE] is
			-- An enumeration over the nodes reachable by `axis_type' from this node
		require
			valid_axis: is_axis_valid (axis_type)
		deferred
		ensure
			result_not_void: Result /= Void
		end

	new_axis_iterator_with_node_test (axis_type: INTEGER; test: XM_XPATH_NODE_TEST): XM_XPATH_AXIS_ITERATOR [XM_XPATH_ABSTRACT_NODE] is
			-- An enumeration over the nodes reachable by `axis_type' from this node;
			-- Only nodes that match the pattern specified by `test' will be selected.
		require
			test_not_void: test /= Void
			valid_axis: is_axis_valid (axis_type)
		deferred
		ensure
			result_not_void: Result /= Void
		end

feature -- Access

	base_uri: UC_UTF8_STRING is
			-- Base URI
		deferred
		ensure
			base_uri_may_be_void: True
		end

	node_kind: STRING is
			-- Kind of node
			-- Must be one of:
			-- "document", "element", "attribute",
			-- "namespace", "processing-instruction",
			-- "comment", or "text".
		deferred
		ensure
			node_kind_not_void: Result /= Void
		end

	node_name: XM_EXPANDED_QNAME is
			-- Qualified name
		deferred
		ensure
			node_name_may_be_void: True
		end
	
	parent: XM_XPATH_NODE is
			-- Parent of current node
			-- `Void' if current node is root,
			-- or for orphan nodes.
		deferred
		ensure
			parent_may_be_void: True
		end

	-- What to do about these?
	-- Should they be DS_ARRAYED_LISTs?
	-- Or should they be iterators as indicated
	-- after all, you can always call the `another' routine.
	-- Alternatively, they might be routines that return the iterator anew.
	
	children: XM_XPATH_AXIS_ITERATOR [XM_XPATH_CHILD_NODE]
			-- Children

	attributes: XM_XPATH_AXIS_ITERATOR [XM_XPATH_ATTRIBUTE]
			-- Attributes

	namespaces: XM_XPATH_AXIS_ITERATOR [XM_XPATH_NAMESPACE]
			-- Namespaces

feature -- Status report

	is_nilled: BOOLEAN is
			-- Is current node "nilled"? (i.e. xsi: nill="true")
		deferred
		end

feature {XM_XPATH_NODE} -- Access

	identity: INTEGER -- TODO: change to INTEGER_64 when all compilers support this
			-- Unique identifier within the document
			-- Increases with document order.
	
	is_possible_child: BOOLEAN is
			-- Can this node be a child of a document or element node?
		deferred
		end

end
