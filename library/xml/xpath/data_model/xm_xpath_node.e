indexing

	description:

		"XPath nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_NODE

feature -- Access

	base_uri:  DS_ARRAYED_LIST [ANY_URI] is
			-- Base URI.
		deferred
		ensure
			base_uri_not_void: Result /= Void
			not_more_than_one_uri: not Result.is_empty implies Result.count = 1
		end

	node_kind: STRING is
			-- Identifies the kind of node.
			-- Must be one of:
			-- "document", "element", "attribute",
			-- "namespace", "processing-instruction",
			-- "comment", or "text".
		deferred
		ensure
			node_kind_not_void: Result /= Void
		end

	node_name: DS_ARRAYED_LIST [XM_EXPANDED_QNAME] is
			-- Qualified name.
		deferred
		ensure
			node_name_not_void: Result /= Void
			not_more_than_one_node_name: not Result.is_empty implies Result.count = 1
		end
	
	parent: DS_ARRAYED_LIST [XM_XPATH_NODE] is
			-- Parent of current node;
			-- Empty if current node is root,
			-- or for orphan nodes.
		deferred
		ensure
			parent_not_void: Result /= Void
			not_more_than_one_parent: not Result.is_empty implies Result.count = 1
		end

	string_value: UC_STRING is
			-- String-value.
		deferred
		ensure
			string_value_not_void: Result /= Void
		end

	typed_value: DS_ARRAYED_LIST [ANY_ATOMIC] is
			-- Typed value.
		deferred
		ensure
			typed_value_not_void: Result /= Void
		end

	type: DS_ARRAYED_LIST [XM_EXPANDED_QNAME] is
			-- Type.
		deferred
		ensure
			type_not_void: Result /= Void
			not_more_than_one_type: not Result.is_empty implies Result.count = 1
		end

	children:  DS_ARRAYED_LIST [XM_XPATH_NODE]
			-- Children.

	attributes: DS_ARRAYED_LIST [XM_XPATH_ATTRIBUTE]
			-- Attributes.

	namespaces: DS_ARRAYED_LIST [XM_XPATH_NAMESPACE]
			-- Namespaces.

feature -- Status report

	is_nilled: DL_ARRAYED_LIST [BOOLEAN]
			-- True if "nilled".
			-- Change to a three-valued logic result?
		deferred
		ensure
			is_nilled_not_void: Result /= Void
			not_more_than_one_nilled: not Result.is_empty implies Result.count = 1
		end

feature {XM_XPATH_NODE} -- Access

	identity: INTEGER
			-- Globally unique identifier.
			-- Increases with document order.
	
	is_possible_child: BOOLEAN is
			-- Can this node be a child of a document or element node?
		deferred
		end

invariant

	child_list_not_void: children /= Void
	attribute_list~_not_void: attributes /= Void
	namespaces_not_void: namespaces /= Void
	
end -- class XM_XPATH_NODE
