indexing

	description:

		"Eiffel agent actual arguments"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_AGENT_ACTUAL_ARGUMENT

inherit

	ET_AGENT_ACTUAL_ARGUMENT_ITEM

feature -- Access

	agent_actual_argument: ET_AGENT_ACTUAL_ARGUMENT is
			-- Agent actual argument in comma-separated list
		do
			Result := Current
		end

end
