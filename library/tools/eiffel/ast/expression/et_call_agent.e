indexing

	description:

		"Eiffel call agents"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_CALL_AGENT

inherit

	ET_EXPRESSION

creation

	make

feature {NONE} -- Initialization

	make (an_agent: like agent_keyword) is
			-- Create a new call agent.
		require
			an_agent_not_void: an_agent /= Void
		do
			agent_keyword := an_agent
		ensure
			agent_keyword_set: agent_keyword = an_agent
		end

feature -- Access

	agent_keyword: ET_TOKEN
			-- 'agent' keyword

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := agent_keyword.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := agent_keyword.break
		end

invariant

	agent_keyword_not_void: agent_keyword /= Void

end
