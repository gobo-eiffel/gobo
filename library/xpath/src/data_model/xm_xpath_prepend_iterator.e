﻿note

	description:

		"Objects that prepend a node to an XPath node axis iterator"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2005-2014, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_PREPEND_ITERATOR [G -> XM_XPATH_NODE]

inherit

	XM_XPATH_AXIS_ITERATOR [G]
		redefine
			start, after
		end

create

	make

feature {NONE} -- Initialization

	make (a_node: G; a_base_iterator: XM_XPATH_AXIS_ITERATOR [G])
			-- Establish invariant.
		require
			starting_node_not_void: a_node /= Void
			base_iterator_before: a_base_iterator /= Void and then a_base_iterator.before
		do
			starting_node := a_node
			base_iterator := a_base_iterator
			if attached base_iterator.error_value as l_error_value then
				check is_error: base_iterator.is_error end
				set_last_error (l_error_value)
			else
				base_iterator.start
			end
		ensure
			starting_node_set: starting_node = a_node
			base_iterator_set: base_iterator = a_base_iterator
		end

feature -- Status report

	after: BOOLEAN
			-- Are there any more items in the sequence?
		do
			Result := base_iterator.after
		end

feature -- Cursor movement

	start
			-- Move to first position
		do
			index := 1
			current_item := starting_node
		end

	forth
			-- Move to next position
		local
			l_default: detachable G
		do
			index := index + 1
			if index > 2 then
				base_iterator.forth
			end
			if attached base_iterator.error_value as l_error_value then
				check is_error: base_iterator.is_error end
				current_item := l_default
				set_last_error (l_error_value)
			elseif base_iterator.after then
				current_item := l_default
			else
				current_item := base_iterator.item
			end
		end

feature -- Duplication

	another: like Current
			-- Another iterator that iterates over the same items as the original
		do
			create Result.make (starting_node, base_iterator.another)
		end

feature {NONE} -- Implementation

	starting_node: G
			-- Prepended node

	base_iterator: XM_XPATH_AXIS_ITERATOR [G]
			-- Base iterator

	advance
			-- Move to the next position
		do
			--	not used
		end

invariant

	starting_node_not_void: starting_node /= Void
	base_iterator_not_void: base_iterator /= Void

end

