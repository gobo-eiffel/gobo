indexing

	description:

		"XPath evaluation contexts for an expression"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_CONTEXT

creation

	make

feature {NONE} -- Initialization

	make (a_controller: XM_XPATH_CONTROLLER) is
			-- Establish invariant.
		require
			controller_not_void: a_controller /= Void
		do
			controller := a_controller
			cached_last := -1
			-- TODO more code
		ensure
			controller_set: controller = a_controller
		end

feature -- Access

	current_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			-- Current iterator

	context_item: XM_XPATH_ITEM is
			-- The context item (".")
		do
			if current_iterator = Void then
				Result := Void
			else
				Result := current_iterator.item_for_iteration
			end
		end

	context_position: INTEGER is
			-- Context position;
			-- (the position of the context node in the context node list)
		do
			-- TODO
		end

	last: INTEGER is
			-- Context size;
			-- (the position of the last item in the current node list)
		do
			if cached_last > 0 then
				Result := cached_last
			else
				-- TODO
			end
		end

feature -- Evaluation

	evaluate_local_variable (a_slot_number: INTEGER): XM_XPATH_VALUE is
			-- Value of a local variable, identified by its slot number
		require
			strictly_positive_slot_number: a_slot_number > 0
		do
			-- TODO
		end
	
feature 	-- Element change

	set_current_iterator (an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]) is
			-- Set `current_iterator'.
		do
			current_iterator := an_iterator
		ensure
			set: current_iterator = an_iterator
		end

feature {NONE} -- Implementation

	controller: XM_XPATH_CONTROLLER
			-- XPATH controller

	cached_last: INTEGER
			-- Used by `last'

invariant

	controller_not_void: controller /= Void

end


