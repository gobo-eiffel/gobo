indexing

	description:

		"Eiffel agent actual argument followed by a comma"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_AGENT_ACTUAL_ARGUMENT_COMMA

inherit

	ET_AGENT_ACTUAL_ARGUMENT_ITEM

creation

	make

feature {NONE} -- Initialization

	make (an_argument: like agent_actual_argument; a_comma: like comma) is
			-- Create a new agent_actual_argument-comma.
		require
			an_argument_not_void: an_argument /= Void
			a_comma_not_void: a_comma /= Void
		do
			agent_actual_argument := an_argument
			comma := a_comma
		ensure
			agent_actual_argument_set: agent_actual_argument = an_argument
			comma_set: comma = a_comma
		end

feature -- Access

	agent_actual_argument: ET_AGENT_ACTUAL_ARGUMENT
			-- Agent actual argument in comma-separated list

	comma: ET_SYMBOL
			-- Comma separator

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := agent_actual_argument.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := comma.break
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_agent_actual_argument_comma (Current)
		end

invariant

	comma_not_void: comma /= Void

end
