indexing

	description:

		"Stack frames for local variables"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_STACK_FRAME

create

	make, make_empty, make_fixed_size

feature {NONE} -- Initialization

	make (a_slot_manager: like slot_manager; some_variables: like variables) is
			-- Assemble stack frame.
		require
			slot_manager_not_void: a_slot_manager /= Void
			variables_not_void: some_variables /= Void
		do
			slot_manager := a_slot_manager
			variables := some_variables
		ensure
			slot_manager_set: slot_manager = a_slot_manager
			variables_set: variables = some_variables
		end

	make_empty is
			-- Create empty stack frame.
		do
			create slot_manager.make
			create variables.make (1, 0)
		end

	make_fixed_size (a_variable_count: INTEGER) is
			-- Create empty stack frame.
		require
			strictly_positive_variable_count: a_variable_count > 0
		do
			create slot_manager.make
			slot_manager.set_number_of_variables (a_variable_count)
			create variables.make (1, a_variable_count)
		end

feature -- Access

	slot_manager: XM_XPATH_SLOT_MANAGER
			-- Slot manager

	variables: ARRAY [XM_XPATH_VALUE]
			-- Local variables

feature -- Element change

	set_variable (a_value: XM_XPATH_VALUE;  a_slot_number: INTEGER) is
			-- Set a variable's value.
		require
			valid_local_variable: a_slot_number > 0
		do
			variables.force (a_value, a_slot_number)
		end

invariant

	slot_manager_not_void: slot_manager /= Void
	variables_not_void: variables /= Void

end
	
