indexing

	description:

		"XPath evaluation contexts for an expression"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_CONTEXT

inherit

	KL_SHARED_STANDARD_FILES -- TODO - remove

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
			current_iterator := a_controller.current_iterator
			local_variable_frame := a_controller.local_variable_frame
		ensure
			controller_set: controller = a_controller
		end

feature -- Access

	current_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			-- Current iterator

	local_variable_frame: ARRAY [XM_XPATH_VALUE]
			-- Local variables in scope
	
	context_item: XM_XPATH_ITEM is
			-- The context item (".")
		do
			if current_iterator = Void then
				Result := Void
			else
				Result := current_iterator.item
			end
		end

	context_position: INTEGER is
			-- Context position;
			-- (the position of the context node in the context node list)
		do
			todo ("context-position", False)
			-- TODO
		end

	last: INTEGER is
			-- Context size;
			-- (the position of the last item in the current node list)
		do
			if cached_last > 0 then
				Result := cached_last
			else
				todo ("last", True)
				-- TODO
			end
		end

feature -- Status setting

	set_local_variable (a_slot_number: INTEGER; a_value: XM_XPATH_VALUE) is
			-- TODO
		do
			todo ("set-local-variable", False)
		end

feature -- Creation

	new_context: XM_XPATH_CONTEXT is
			-- Create a copy of `Current'
		do
			Result := clone (Current)
		end

feature -- Evaluation

	evaluated_local_variable (a_slot_number: INTEGER): XM_XPATH_VALUE is
			-- Value of a local variable, identified by its slot number
		require
			strictly_positive_slot_number: a_slot_number > 0
		do
			todo ("evaluated-local-variable", False)
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

	todo (a_routine_name: STRING; is_partially_done: BOOLEAN) is
			-- Write a TODO message.
		require
			routine_name_not_void: a_routine_name /= Void and then a_routine_name.count > 2
		do
			std.error.put_string ("{")
			std.error.put_string (generating_type)
			std.error.put_string ("}.")
			std.error.put_string (a_routine_name)
			if is_partially_done then
				std.error.put_string (" is only partly written")
			else
				std.error.put_string (" needs to be written")
			end
			std.error.put_new_line
		end

invariant

	controller_not_void: controller /= Void

end


