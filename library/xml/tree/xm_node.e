indexing

	description:

		"XML nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_NODE

inherit

	ANY

	XM_UNICODE_STRUCTURE_FACTORY
		export {NONE} all end

feature -- Access

	parent: XM_COMPOSITE
			-- Parent of current node;
			-- Void if current node is root

	root_node: XM_COMPOSITE is
			-- Root node of current node
			-- (In most cases this will be of type XM_DOCUMENT)
		do
			if not is_root_node then
				Result := parent.root_node
			end
			-- is_root_node case dealt by descendant because
			-- we cannot do Result := Current here.
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

feature -- Status report

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
		do
			parent := a_parent
		ensure
			parent_set: parent = a_parent
		end

feature -- Processing

	process (a_processor: XM_NODE_PROCESSOR) is
			-- Process current node with `a_processor'.
		require
			a_processor_not_void: a_processor /= Void
		deferred
		end

end
