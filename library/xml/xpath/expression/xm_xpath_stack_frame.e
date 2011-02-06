note

	description:

		"Stack frames for local variables"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005-2011, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_STACK_FRAME

create

	make, make_empty, make_fixed_size

feature {NONE} -- Initialization

	make (a_slot_manager: like slot_manager; some_variables: like variables)
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

	make_empty
			-- Create empty stack frame.
		do
			create slot_manager.make
			create variables.make_filled (Void, 1, 0)
		end

	make_fixed_size (a_variable_count: INTEGER)
			-- Create empty stack frame.
		require
			strictly_positive_variable_count: a_variable_count > 0
		do
			create slot_manager.make
			slot_manager.set_number_of_variables (a_variable_count)
			create variables.make_filled (Void, 1, a_variable_count)
		end

feature -- Access

	slot_manager: XM_XPATH_SLOT_MANAGER
			-- Slot manager

	variables: ARRAY [XM_XPATH_VALUE]
			-- Local variables

feature -- Element change

	set_variable (a_value: XM_XPATH_VALUE;  a_slot_number: INTEGER)
			-- Set a variable's value.
		require
			valid_local_variable: a_slot_number > 0
		do
			variables.force (a_value, a_slot_number)
		end

	set_variables (a_variables: like variables)
			-- Set `variables' to `a_variables'.
		require
			a_variables_not_void: a_variables /= Void
		do
			variables := a_variables
		ensure
			variables_set: variables = a_variables
		end

	set_slot_manager (a_slot_manager: XM_XPATH_SLOT_MANAGER; a_parameter_count: INTEGER)
			-- Set `slot_manager' to `a_slot_manager' and re-allocate `variables' if necessary.
		require
			a_slot_manager_not_void: a_slot_manager /= Void
			non_negative_parameter_count: a_parameter_count >= 0
			a_parameter_count_small_enough: a_parameter_count <= a_slot_manager.number_of_variables
		local
			i: INTEGER
			l_variables: like variables
		do
			slot_manager := a_slot_manager
			if variables.count /= a_slot_manager.number_of_variables then
				create l_variables.make_filled (Void, 1, a_slot_manager.number_of_variables)
				from
					i := 1
				until
					i > a_parameter_count
				loop
					l_variables.put (variables.item (i), i)
					i := i + 1
				end
				variables := l_variables
			else
				from
					i := a_parameter_count + 1
				until
					i > variables.count
				loop
					variables.put (Void, i)
					i := i + 1
				end
			end
		ensure
			slot_manager_set: slot_manager = a_slot_manager
			correct_size: variables.count = a_slot_manager.number_of_variables
		end

invariant

	slot_manager_not_void: slot_manager /= Void
	variables_not_void: variables /= Void

end

