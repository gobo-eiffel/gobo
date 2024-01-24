note

	description:

		"XML nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001-2014, Andreas Leitner and others"
	license: "MIT License"

deferred class XM_NODE

inherit

	ANY

	KL_CLONABLE

	XM_UNICODE_STRUCTURE_FACTORY
		export {NONE} all end

feature -- Access

	parent: detachable XM_COMPOSITE
			-- Parent of current node;
			-- Void if current node is root
		do
		end

feature -- Status report

	parent_element: XM_ELEMENT
			-- Parent element
		require
			not_root_element: attached parent as l_parent and then not l_parent.is_root_node
		do
			check attached {XM_ELEMENT} parent as l_element then
				Result := l_element
			end
		ensure
			result_not_void: Result /= Void
		end

	root_node: XM_DOCUMENT
			-- Root node of current node
		do
			check attached parent as l_parent then
					-- is_root_node case dealt by descendant because
					-- we cannot do Result := Current here.
				Result := l_parent.root_node
			end
		ensure
			result_not_void: Result /= Void
		end

	level: INTEGER
			-- Depth at which current node appears relative to its root
			-- (The root node has the level 1.)
		do
			if not attached parent as l_parent then
				Result := 1
			else
				Result := l_parent.level + 1
			end
		ensure
			root_level: is_root_node implies (Result = 1)
		end

	is_root_node: BOOLEAN
			-- Is current node the root node?
		do
			Result := (parent = Void)
		ensure
			definition: Result = (parent = Void)
		end

	is_first: BOOLEAN
			-- Is this node the first in its parent's child list,
			-- or the root node?
		do
			Result := not attached parent as l_parent or else (l_parent.first = Current)
		ensure
			definition: Result = (not attached parent as l_parent or else (l_parent.first = Current))
		end

	is_last: BOOLEAN
			-- Is this node the last in its parent's child list,
			-- or the root node?
		do
			Result := not attached parent as l_parent or else (l_parent.last = Current)
		ensure
			definition: Result = (not attached parent as l_parent or else (l_parent.last = Current))
		end

feature -- Position

	position (a_position_table: detachable XM_POSITION_TABLE): XM_POSITION
			-- Position of current node
			--
			-- If not found in `a_position_table', then return a null position.
		do
			if a_position_table /= Void and then a_position_table.has (Current) then
				Result := a_position_table.item (Current)
			else
				Result := null_position
			end
		ensure
			position_not_void: Result /= Void
		end

	null_position: XM_DEFAULT_POSITION
			-- Null position
		once
			create Result.make ("", 0, 0, 0)
		ensure
			null_position_not_void: Result /= Void
		end

feature {NONE} -- Implementation

	Default_ns: XM_NAMESPACE
			-- Shared default namespace constant object.
		once
			create Result.make_default
		ensure
			not_void: Result /= Void
			definition: Result.uri.count = 0
		end

feature -- Processing

	process (a_processor: XM_NODE_PROCESSOR)
			-- Process current node with `a_processor'.
		require
			a_processor_not_void: a_processor /= Void
		deferred
		end

end
