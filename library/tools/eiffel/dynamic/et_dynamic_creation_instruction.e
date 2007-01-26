indexing

	description:

		"Eiffel creation instructions at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_CREATION_INSTRUCTION

inherit

	ET_DYNAMIC_ATTACHMENT
		rename
			attachment as creation_instruction
		end

create

	make

feature {NONE} -- Initialization

	make (a_type_set: like source_type_set; a_creation: like creation_instruction;
		a_current_feature: like current_feature; a_current_type: like current_type) is
			-- Create a new creation instruction.
		require
			a_type_set_not_void: a_type_set /= Void
			a_creation_not_void: a_creation /= Void
			a_current_feature_not_void: a_current_feature /= Void
			a_current_type_not_void: a_current_type /= Void
		do
			source_type_set := a_type_set
			creation_instruction := a_creation
			current_feature := a_current_feature
			current_type := a_current_type
		ensure
			source_type_set_set: source_type_set = a_type_set
			creation_instruction_set: creation_instruction = a_creation
			current_feature_set: current_feature = a_current_feature
			current_type_set: current_type = a_current_type
		end

feature -- Access

	creation_instruction: ET_CREATION_INSTRUCTION
			-- Creation instruction

	position: ET_POSITION is
			-- Position of attachment
		do
			Result := creation_instruction.target.position
		end

	description: STRING is "creation instruction"
			-- Kind of attachment

invariant

	creation_instruction_not_void: creation_instruction /= Void

end
