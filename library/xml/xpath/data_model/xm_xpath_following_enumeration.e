indexing

	description:

		"Objects that iterate the XPath following axis"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_FOLLOWING_ENUMERATION [G -> XM_XPATH_NODE]

inherit

	XM_XPATH_AXIS_ITERATOR [G]

	-- This implementation works for all tree models

create

	make

feature {NONE} -- Initialization

	make (a_starting_node: XM_XPATH_NODE) is
			-- Establish invariant.
		require
			starting_node_exists: a_starting_node /= Void
		local
			a_parent: G
		do
			starting_node := a_starting_node
			create ancestors.make (starting_node, False)
			inspect
				starting_node.node_tests
			when Element_node, Text_node, Comment_node, Processing_instruction_node then
				siblings := starting_node.new_axis_iterator (Following_sibling_axis)
			when Attribute_node, Namespace_node then
				a_parent := starting_node.parent
				if a_parent = Void then
					create {XM_XPATH_EMPTY_ITERATOR} siblings.make
				else
					siblings := parents.new_axis_iterator (child_axis)
				end
			else
				create {XM_XPATH_EMPTY_ITERATOR} siblings.make
			end
		ensure
			starting_node_set: starting_node = a_starting_node
			ancestors_and_maybe_siblings: descendants = Void and ancestors /= Void
		end

feature -- Cursor movement
			
	forth is
			-- Move to next position
		do
			index := index + 1
			item := current_item
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original
		do
			create Result.make (starting_node)
		end

feature {NONE} -- Implementation

	starting_node: XM_XPATH_NODE
			-- Origin node

	ancestors: XM_XPATH_AXIS_ITERATOR [G]
			-- Ancestors
	
	sibling: XM_XPATH_AXIS_ITERATOR [G]
			-- Following siblings

	descndants: XM_XPATH_AXIS_ITERATOR [G]
			-- Descendants

	advance is
			-- Move to the next position
		local
			finished_advance: BOOLEAN
		do
			if descendants /= Void then
				if descendants.before then descendants.start else descendants.forth end
				if descendants.after then
					descendants := Void
				else
					current_item := descendants.item; finished_advance := True
				end
			end
			if not finished_advance then
				if siblings /= Void then
					if siblings.before then siblings.start else siblings.forth end
					if siblings.after then
						descendants := Void
						siblings := Void
					else
						current_item := siblings.item
						if current_item.has_child_nodes then
							create {XM_XPATH_DESCENDENT_ENUMERATION [G]} descendants.make (current_item, False, True)
						else
							descendants := Void
						end
						finished_advance := True
					end
					
				end
				if not finished_advance then
					if ancestors.before then ancestors.start else ancestors.forth end
					if ancestors.after then
						current_item := Void
					else
						current_item := ancestors.item
						if current_item.node_type = Document_node then
							create {XM_XPATH_EMPTY_ITERATOR} siblings.make
						else
							siblings := current_item.new_axis_iterator (Following_sibling_axis)
						end
						advance
					end
				end
			end	
		end

invariant

	starting_node_exists: starting_node /= Void

end
	
