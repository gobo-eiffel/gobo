note

	description:

		"Objects that allocate slots in a stack frame to local variables"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_SLOT_MANAGER

create

	make

feature {NONE} -- Initialization

	make is
			-- Nothing to do.
		do
		end

feature -- Access

	number_of_variables: INTEGER
			-- Number of variables currently allocated

feature -- Element change

	set_number_of_variables (a_number: INTEGER) is
			-- Set number of allocated variables.
		require
			positive_variable_count: a_number >= 0
		do
			number_of_variables := a_number
		ensure
			set: number_of_variables = a_number
		end

	allocate_slot_number (a_variable_name: STRING) is
			-- Allocate a slot number for variable named by `a_variable_name'.
			-- Allocated slot number is available as `number_of_variables'.
			-- `a_variable_name' is provided for use in a descendant (e.g. in a debugger).
		require
			variable_name_not_void: a_variable_name /= Void
		do
			number_of_variables := number_of_variables + 1
		ensure
			slot_number_allocated: number_of_variables = old number_of_variables + 1
		end

invariant

	positive_variable_count: number_of_variables >= 0

end
	
