note

	description:

		"ECF dynamic_runtime conditions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_DYNAMIC_RUNTIME_CONDITION

inherit

	ET_ECF_CONDITION_ITEM

create

	make

feature {NONE} -- Initialization

	make (a_value: BOOLEAN)
			-- Create a new condition where dynamic_runtime should be equal to `a_value'.
		do
			value := a_value
		ensure
			value_set: value = a_value
		end

feature -- Access

	value: BOOLEAN
			-- Dynamic_runtime value

feature -- Status report

	is_enabled (a_state: ET_ECF_STATE): BOOLEAN
			-- Does `a_state' fulfill current condition?
		do
			Result := not value
		end

end
