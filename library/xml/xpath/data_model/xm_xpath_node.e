indexing

	description:

		"XPath nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_NODE

feature -- Access

	base_uri: ANY_URI is
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

	string_value: STRING is
			-- String-value
		deferred
		ensure
			string_value_not_void: Result /= Void
		end

	typed_value: DS_ARRAYED_LIST [XM_XPATH_ANY_ATOMIC_VALUE] is
			-- Typed value
		deferred
		ensure
			typed_value_not_void: Result /= Void
		end

	type: XM_EXPANDED_QNAME is
			-- Type
		deferred
		ensure
			type_may_be_void: True
		end

	children: DS_ARRAYED_LIST [XM_XPATH_NODE]
			-- Children

	attributes: DS_ARRAYED_LIST [XM_XPATH_ATTRIBUTE]
			-- Attributes

	namespaces: DS_ARRAYED_LIST [XM_XPATH_NAMESPACE]
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

invariant

	children_not_void: children /= Void
	no_void_child: not children.has (Void)
	attributes_not_void: attributes /= Void
	no_void_attribute: not attributes.has (Void)
	namespaces_not_void: namespaces /= Void
	no_void_namespace: not namespaces.has (Void)
	
end
