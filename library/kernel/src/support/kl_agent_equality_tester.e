note

	description:

		"Equality testers implemented using an agent"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2009-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_AGENT_EQUALITY_TESTER [G]

inherit

	KL_EQUALITY_TESTER [G]
		redefine
			test
		end

create

	make

feature {NONE} -- Initialization

	make (a_test_agent: like test_agent)
			-- Create a new equality tester implemented using `a_test_agent'.
		require
			a_test_agent_not_void: a_test_agent /= Void
--			a_test_agent_args_not_void: a_test_agent can have a precondition which states that its open operands are not Void
		do
			test_agent := a_test_agent
		ensure
			test_agent_set: test_agent = a_test_agent
		end

feature -- Status report

	test (v, u: G): BOOLEAN
			-- Are `v' and `u' considered equal?
			-- (Use `equal' by default.)
		do
			if v = u then
				Result := True
			elseif v = Void then
				Result := False
			elseif u = Void then
				Result := False
			else
				Result := test_agent.item ([v, u])
			end
		end

feature {NONE} -- Implementation

	test_agent: FUNCTION [G, G, BOOLEAN]
			-- Agent used to test objects

invariant

	test_agent_not_void: test_agent /= Void
--	test_agent_arg_not_void: test_agent can have a precondition which states that its open operands are not Void

end
