indexing

	description:

		"XPath evaluation context for an expression"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_CONTEXT

feature -- Evaluation

	evaluate_local_variable (slot_number: INTEGER): XM_XPATH_VALUE is
			-- Value of a local variable, identified by its slot number
		require
			strictly_positive_slot_number: slot_number > 0
		do
			-- TODO
		end

end


