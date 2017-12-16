note

	description:

		"Eiffel manifest tuple item settings at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_MANIFEST_TUPLE_ITEM_ATTACHMENT

inherit

	ET_DYNAMIC_ATTACHMENT
		rename
			attachment as expression
		end

create

	make

feature {NONE} -- Initialization

	make (a_type_set: like source_type_set; an_expression: like expression;
		a_current_feature: like current_feature; a_current_type: like current_type)
			-- Create a new manifest tuple item setting.
		require
			a_type_set_not_void: a_type_set /= Void
			an_expression_not_void: an_expression /= Void
			a_current_feature_not_void: a_current_feature /= Void
			a_current_type_not_void: a_current_type /= Void
		do
			source_type_set := a_type_set
			expression := an_expression
			current_feature := a_current_feature
			current_type := a_current_type
		ensure
			source_type_set_set: source_type_set = a_type_set
			expression_set: expression = an_expression
			current_feature_set: current_feature = a_current_feature
			current_type_set: current_type = a_current_type
		end

feature -- Access

	expression: ET_EXPRESSION
			-- Manifest tuple item

	position: ET_POSITION
			-- Position of attachment
		do
			Result := expression.position
		end

	description: STRING = "manifest tuple item"
			-- Kind of attachment

invariant

	expression_not_void: expression /= Void

end
