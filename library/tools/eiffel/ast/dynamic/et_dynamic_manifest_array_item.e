indexing

	description:

		"Eiffel manifest array item settings at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_MANIFEST_ARRAY_ITEM

inherit

	ET_DYNAMIC_ATTACHMENT

creation

	make

feature {NONE} -- Initialization

	make (a_type: like source_type; an_expression: like expression;
		a_current_feature: like current_feature; a_current_type: like current_type) is
			-- Create a new argument passing.
		require
			a_type_not_void: a_type /= Void
			an_expression_not_void: an_expression /= Void
			a_current_feature_not_void: a_current_feature /= Void
			a_current_type_not_void: a_current_type /= Void
		do
			source_type := a_type
			expression := an_expression
			current_feature := a_current_feature
			current_type := a_current_type
		ensure
			source_type_set: source_type = a_type
			expression_set: expression = an_expression
			current_feature_set: current_feature = a_current_feature
			current_type_set: current_type = a_current_type
		end

feature -- Access

	expression: ET_EXPRESSION
			-- Manifest array item

	position: ET_POSITION is
			-- Position of attachment
		do
			Result := expression.position
		end

feature -- Duplication

	cloned_attachment: like Current is
			-- Cloned version of current attachment
		do
			create Result.make (source_type, expression, current_feature, current_type)
		end

invariant

	expression_not_void: expression /= Void

end
