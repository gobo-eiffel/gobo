note

	description:

		"Eiffel Tuple label setters at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_TUPLE_LABEL_SETTER

inherit

	ET_DYNAMIC_ATTACHMENT
		rename
			attachment as assigner
		end

create

	make

feature {NONE} -- Initialization

	make (a_type_set: like source_type_set; an_assigner: like assigner;
		a_current_feature: like current_feature; a_current_type: like current_type)
			-- Create a new Tuple label setter.
		require
			a_type_set_not_void: a_type_set /= Void
			an_assigner_not_void: an_assigner /= Void
			tuple_label_assigner: an_assigner.call.name.is_tuple_label
			a_current_feature_not_void: a_current_feature /= Void
			a_current_type_not_void: a_current_type /= Void
		do
			source_type_set := a_type_set
			assigner := an_assigner
			current_feature := a_current_feature
			current_type := a_current_type
		ensure
			source_type_set_set: source_type_set = a_type_set
			assigner_set: assigner = an_assigner
			current_feature_set: current_feature = a_current_feature
			current_type_set: current_type = a_current_type
		end

feature -- Access

	assigner: ET_ASSIGNER_INSTRUCTION
			-- Assigner instruction

	position: ET_POSITION
			-- Position of attachment
		do
			Result := assigner.source.position
		end

	description: STRING = "tuple label setter"
			-- Kind of attachment

invariant

	assigner_not_void: assigner /= Void
	tuple_label_assigner: assigner.call.name.is_tuple_label

end
