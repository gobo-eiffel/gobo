indexing

	description:

		"Objects that iterate the descendent, descendent-or-self, following and preceding XPath axes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_DESCENDANT_ENUMERATION [G -> XM_XPATH_NODE]

inherit

	XM_XPATH_AXIS_ITERATOR [G]

	XM_XPATH_AXIS
		export {NONE} all end

	-- This implementation works for all tree models

create

	make

feature {NONE} -- Initialization

	make (a_starting_node: G; self, forwards: BOOLEAN) is
			-- Establish invariant.
		require
			starting_node_not_void: a_starting_node /= Void
			no_self_if_reverse: not forwards implies not self
		do
			starting_node := a_starting_node
			include_self := self
			is_forwards := forwards
		ensure
			starting_node_set: starting_node = a_starting_node
			include_self_set: include_self = self
			is_forwards_set: is_forwards = forwards
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
			create Result.make (starting_node, include_self, is_forwards)
		end

feature {NONE} -- Implementation

	starting_node: G
			-- Origin node
	
	include_self: BOOLEAN
			-- Is `starting_node' included on the axis?

	is_forwards: BOOLEAN
			-- Are we traversing forwards (following/descendant) or reverse (preceding)

	is_at_end: BOOLEAN
			-- Have we finished traversal?

	children: XM_XPATH_AXIS_ITERATOR [G]
			-- Child iterator

	descendants: XM_XPATH_AXIS_ITERATOR [G]
			-- Descendant iterator

	advance is
			-- Move to the next position
		local
			finished_advance: BOOLEAN
         a_boxed: DS_CELL [G]
         a_void_item: G
		do
			if descendants /= Void then
				if descendants.after then
					descendants := Void
				else
					if descendants.before then descendants.start else descendants.forth end
					a_boxed ?= descendants.item
					if a_boxed /= Void then
						current_item := a_boxed.item
					else
						current_item := a_void_item
					end
					finished_advance := True
				end
			end
			if not finished_advance then
				if children /= Void then
					advance_child_axis
				elseif is_at_end then
					
					-- we're just finishing a backwards scan
					
					current_item := a_void_item
				else
					initial_advance
				end
			end
		end

	initial_advance is
			-- Advance to first node
		require
			initial: index = 1
		local
			an_extent: XM_XPATH_SEQUENCE_EXTENT
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			if starting_node.has_child_nodes then
				children ?= starting_node.new_axis_iterator (Child_axis)
				if not is_forwards then
					if children.is_reversible_iterator then
						children ?= children.reverse_iterator
					else
						an_iterator ?= children
						create an_extent.make (an_iterator)
						children ?= an_extent.reverse_iterator
					end
				end
			else
				create {XM_XPATH_EMPTY_ITERATOR [G]} children.make; is_at_end := True
			end
			if is_forwards and then include_self then
				current_item := starting_node
			else
				advance
			end
		end

	advance_child_axis is
			-- Advance along child axis
		require
			child_axis_not_void: children /= Void
		local
			a_node, l_default: G
		do
			if children.before then children.start else children.forth end
			if children.after then
				if is_forwards or else not include_self then
					current_item := l_default
				else
					is_at_end := True
					children := Void
					current_item := starting_node
				end
			else
				a_node := children.item
				if a_node.has_child_nodes then
					if is_forwards then
						create {XM_XPATH_DESCENDANT_ENUMERATION [G]} children.make (a_node, False, True)
						current_item := a_node
					else
						create {XM_XPATH_DESCENDANT_ENUMERATION [G]} children.make (a_node, True, False)
						advance						
					end
				else
					current_item := a_node
				end
			end
		end

invariant

	starting_node_not_void: starting_node /= Void
	no_self_if_reverse: not is_forwards implies not include_self	
end
	
