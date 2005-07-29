indexing

	description:

		"XPath Namespace nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_NAMESPACE

inherit

	XM_XPATH_NODE
		redefine
			base_uri, next_sibling, previous_sibling
		end

	-- TODO: scrap namespace nodes completely
	--     - add a namespace declarations interface instead

feature -- Access

	base_uri: STRING is
			-- Base URI
		do
			Result := Void
		ensure then
			base_uri_is_void: Result = Void
		end

	node_kind: STRING is
			-- Kind of node
		do
			Result := "namespace"
		ensure then
			node_kind_is_namespace: STRING_.same_string (Result, "namespace")
		end

	item_type: XM_XPATH_ITEM_TYPE is
			-- Type
		do
			create {XM_XPATH_NODE_KIND_TEST} Result.make_namespace_test
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	namespace_code: INTEGER is
			-- Code for the namespace represented by `Current'
		deferred
		ensure
			strictly_positive_namespace_code: Result > 0
		end

	previous_sibling: XM_XPATH_NODE is
			-- The previous sibling of this node;
			-- If there is no such node, return `Void'
		do
			Result := Void
		end
	
	next_sibling: XM_XPATH_NODE is
			-- The next sibling of this node;
			-- If there is no such node, return `Void'
		do
			Result := Void
		end
invariant

	parent_not_void: parent /= Void
	void_siblings: previous_sibling = Void and then next_sibling = Void

end
