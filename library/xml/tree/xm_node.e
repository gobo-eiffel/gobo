note

	description:

		"XML nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_NODE

inherit

	ANY

	KL_CLONABLE

	XM_UNICODE_STRUCTURE_FACTORY
		export {NONE} all end

feature -- Access

	parent: XM_COMPOSITE
			-- Parent of current node;
			-- Void if current node is root

feature -- Status report

	parent_element: XM_ELEMENT is
			-- Parent element.
		require
			not_root_node: not is_root_node
			not_root_element: not parent.is_root_node
		local
			typer: XM_NODE_TYPER
		do
			create typer
			parent.process (typer)
			check precondition: typer.is_element end
			Result := typer.element
		ensure
			result_not_void: Result /= Void
		end

	root_node: XM_DOCUMENT is
			-- Root node of current node
		do
			check not_root_node: not is_root_node end
			-- is_root_node case dealt by descendant because
			-- we cannot do Result := Current here.
			Result := parent.root_node
		ensure
			result_not_void: Result /= Void
		end

	level: INTEGER is
			-- Depth at which current node appears relative to its root
			-- (The root node has the level 1.)
		do
			if is_root_node then
				Result := 1
			else
				Result := parent.level + 1
			end
		ensure
			root_level: is_root_node implies (Result = 1)
		end

	is_root_node: BOOLEAN is
			-- Is current node the root node?
		do
			Result := (parent = Void)
		ensure
			definition: Result = (parent = Void)
		end

	is_first: BOOLEAN is
			-- Is this node the first in its parent's child list,
			-- or the root node?
		do
			Result := is_root_node or else (parent.first = Current)
		ensure
			definition: Result = (is_root_node or else (parent.first = Current))
		end

	is_last: BOOLEAN is
			-- Is this node the last in its parent's child list,
			-- or the root node?
		do
			Result := is_root_node or else (parent.last = Current)
		ensure
			definition: Result = (is_root_node or else (parent.last = Current))
		end

feature -- Element change

	set_parent (a_parent: like parent) is
			-- Set `parent' to `a_parent'.
		require
			a_parent_not_void: a_parent /= Void
			not_root_node: not is_root_node
		do
			parent := a_parent
		ensure
			parent_set: parent = a_parent
		end

feature {XM_COMPOSITE} -- Element change

	node_set_parent (a_parent: like parent) is
			-- Set `parent' to `a_parent'.
		do
			parent := a_parent
		ensure
			parent_set: parent = a_parent
		end

feature {NONE} -- Implementation

	Default_ns: XM_NAMESPACE is
			-- Shared default namespace constant object.
		once
			create Result.make_default
		ensure
			definition: Result.uri.count = 0
		end

feature -- Processing

	process (a_processor: XM_NODE_PROCESSOR) is
			-- Process current node with `a_processor'.
		require
			a_processor_not_void: a_processor /= Void
		deferred
		end

end
