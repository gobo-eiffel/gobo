note

	description:

		"Eiffel Agent 'closed_operands' tuple item settings at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"

class ET_DYNAMIC_AGENT_CLOSED_OPERANDS_ITEM_ATTACHMENT

inherit

	ET_DYNAMIC_ATTACHMENT
		rename
			attachment as closed_operand
		end

create

	make

feature {NONE} -- Initialization

	make (a_type_set: like source_type_set; an_operand: like closed_operand;
		a_current_feature: like current_feature; a_current_type: like current_type)
			-- Create a new Agent 'closed_operands' tuple item setting.
		require
			a_type_set_not_void: a_type_set /= Void
			an_operand_not_void: an_operand /= Void
			a_current_feature_not_void: a_current_feature /= Void
			a_current_type_not_void: a_current_type /= Void
		do
			source_type_set := a_type_set
			closed_operand := an_operand
			current_feature := a_current_feature
			current_type := a_current_type
		ensure
			source_type_set_set: source_type_set = a_type_set
			closed_operand_set: closed_operand = an_operand
			current_feature_set: current_feature = a_current_feature
			current_type_set: current_type = a_current_type
		end

feature -- Access

	closed_operand: ET_OPERAND
			-- Closed operand

	position: ET_POSITION
			-- Position of attachment
		do
			Result := closed_operand.position
		end

	description: STRING = "agent closed operands tuple item"
			-- Kind of attachment

invariant

	closed_operand_not_void: closed_operand /= Void

end
