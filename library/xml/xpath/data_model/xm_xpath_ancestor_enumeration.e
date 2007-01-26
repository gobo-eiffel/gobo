indexing

	description:

		"Objects that iterator the ancestor and ancestor-or-self XPath axes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ANCESTOR_ENUMERATION [G -> XM_XPATH_NODE]

inherit

	XM_XPATH_AXIS_ITERATOR [G]

	-- This implementation works for all tree models

create

	make

feature {NONE} -- Initialization

	make (a_starting_node: G; self: BOOLEAN) is
			-- Establish invariant.
		require
			starting_node_not_void: a_starting_node /= Void
		do
			starting_node := a_starting_node
			include_self := self
		ensure
			starting_node_set: starting_node = a_starting_node
			include_self_set: include_self = self
		end

feature -- Cursor movement
			
	forth is
			-- Move to next position
		do
			index := index + 1
			advance
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original
		do
			create Result.make (starting_node, include_self)
		end

feature {NONE} -- Implementation

	starting_node: G
			-- Origin node
	
	include_self: BOOLEAN
			-- Is `starting_node' included on the axis?

	advance is
			-- Move to the next position
		local
         a_boxed: DS_CELL [G]
         a_void_item: G
		do
			if index = 1 and then include_self then
				current_item := starting_node
			else
				a_boxed ?= current_item.parent.boxed
				if a_boxed /= Void then
					current_item := a_boxed.item
				else
					current_item := a_void_item
				end
			end
		end

invariant

	starting_node_not_void: starting_node /= Void
	
end
	
