indexing

	description:

		"Eiffel target attachments at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_TARGET_ATTACHMENT

inherit

	ET_DYNAMIC_ATTACHMENT
		rename
			attachment as target
		end

create

	make

feature {NONE} -- Initialization

	make (a_type_set: like source_type_set; a_target: like target;
		a_current_feature: like current_feature; a_current_type: like current_type) is
			-- Create a new target passing.
		require
			a_type_set_not_void: a_type_set /= Void
			a_target_not_void: a_target /= Void
			a_current_feature_not_void: a_current_feature /= Void
			a_current_type_not_void: a_current_type /= Void
		do
			source_type_set := a_type_set
			target := a_target
			current_feature := a_current_feature
			current_type := a_current_type
		ensure
			source_type_set_set: source_type_set = a_type_set
			target_set: target = a_target
			current_feature_set: current_feature = a_current_feature
			current_type_set: current_type = a_current_type
		end

feature -- Access

	target: ET_TARGET_OPERAND
			-- Target

	position: ET_POSITION is
			-- Position of attachment
		do
			Result := target.position
		end

	description: STRING is
			-- Kind of attachment
		do
			if target.is_open_operand then
				Result := open_target_description
			else
				Result := target_description
			end
		end

feature {NONE} -- Constants

	target_description: STRING is "target"
	open_target_description: STRING is "open target"
			-- Description constants

invariant

	target_not_void: target /= Void

end
