note

	description:

		"Eiffel lists of agent implicit open arguments"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_AGENT_IMPLICIT_OPEN_ARGUMENT_LIST

inherit

	ET_AGENT_ARGUMENT_OPERANDS
		redefine
			is_instance_free
		end

	ET_TAIL_LIST [ET_AGENT_IMPLICIT_OPEN_ARGUMENT]
		rename
			item as actual_argument
		undefine
			is_empty, valid_index
		end

create

	make, make_with_capacity

feature -- Status report

	is_instance_free: BOOLEAN
			-- Are all arguments instance-free (i.e. not dependent
			-- on 'Current' or its attributes)?
			-- Note that we do not consider unqualified calls and Precursors as
			-- instance-free because it's not always possible syntactically
			-- to determine whether the feature being called is a class feature
			-- or not.
		do
			Result := True
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_AGENT_IMPLICIT_OPEN_ARGUMENT]
			-- Fixed array routines
		once
			create Result
		end

end
