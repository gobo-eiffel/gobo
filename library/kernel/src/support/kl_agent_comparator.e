﻿note

	description:

		"Total order comparators implemented using an agent"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2009-2017, Eric Bezault and others"
	license: "MIT License"

class KL_AGENT_COMPARATOR [G]

inherit

	KL_COMPARATOR [G]

create

	make

feature {NONE} -- Initialization

	make (a_less_than_agent: like less_than_agent)
			-- Create a new comparator implemented using `a_less_than_agent'.
		require
			a_less_than_agent_not_void: a_less_than_agent /= Void
--			a_less_than_agent_args_not_void: a_less_than_agent can have a precondition which states that its open operands are not Void
		do
			less_than_agent := a_less_than_agent
		ensure
			less_than_agent_set: less_than_agent = a_less_than_agent
		end

feature -- Status report

	attached_less_than (u, v: attached G): BOOLEAN
			-- Is `u' considered less than `v'?
		do
			Result := less_than_agent.item ([u, v])
		end

feature {NONE} -- Implementation

	less_than_agent: FUNCTION [attached G, attached G, BOOLEAN]
			-- Agent used to compare objects

invariant

	less_than_agent_not_void: less_than_agent /= Void
--	less_than_agent_args_not_void: less_than_agent can have a precondition which states that its open operands are not Void

end
