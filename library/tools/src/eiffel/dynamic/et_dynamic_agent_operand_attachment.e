note

	description:

		"Eiffel agent operand passings at run-time (tuples passed to features 'call' and 'item')"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"

class ET_DYNAMIC_AGENT_OPERAND_ATTACHMENT

inherit

	ET_DYNAMIC_ATTACHMENT
		rename
			attachment as tuple_argument
		end

create

	make

feature {NONE} -- Initialization

	make (a_type_set: like source_type_set; an_agent_type: like agent_type;
		a_tuple: like tuple_argument; an_index: INTEGER;
		a_current_feature: like current_feature; a_current_type: like current_type)
			-- Create a new agent operand passing.
		require
			a_type_set_not_void: a_type_set /= Void
			an_agent_type_not_void: an_agent_type /= Void
			a_tuple_not_void: a_tuple /= Void
			an_index_nonnegative: an_index >= 1
			a_current_feature_not_void: a_current_feature /= Void
			a_current_type_not_void: a_current_type /= Void
		do
			source_type_set := a_type_set
			agent_type := an_agent_type
			tuple_argument := a_tuple
			item_index := an_index
			current_feature := a_current_feature
			current_type := a_current_type
		ensure
			source_type_set_set: source_type_set = a_type_set
			agent_type_set: agent_type = an_agent_type
			tuple_argument_set: tuple_argument = a_tuple
			item_index_set: item_index = an_index
			current_feature_set: current_feature = a_current_feature
			current_type_set: current_type = a_current_type
		end

feature -- Access

	agent_type: ET_DYNAMIC_ROUTINE_TYPE
			-- Type of agent

	tuple_argument: ET_AST_NODE
			-- Tuple argument passed to agent's 'call' or 'item' features

	item_index: INTEGER
			-- Index of item in `tuple_argument' that is passed as
			-- argument of the associated feature

	position: ET_POSITION
			-- Position of attachment
		do
			Result := tuple_argument.position
		end

	description: STRING
			-- Kind of attachment
		do
			Result := agent_tuple_item_description + item_index.out
		end

feature {NONE} -- Constants

	agent_tuple_item_description: STRING = "tuple item #"
			-- Description constants

invariant

	agent_type_not_void: agent_type /= Void
	tuple_argument_not_void: tuple_argument /= Void
	item_index_nonnegative: item_index >= 1

end
