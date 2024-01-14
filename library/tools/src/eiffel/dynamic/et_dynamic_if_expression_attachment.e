note

	description:

		"Eiffel if-expression attachment at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"

class ET_DYNAMIC_IF_EXPRESSION_ATTACHMENT

inherit

	ET_DYNAMIC_ATTACHMENT
		rename
			attachment as sub_expression
		end

create

	make

feature {NONE} -- Initialization

	make (a_type_set: like source_type_set;
		a_if_expression: like if_expression; a_sub_expression: like sub_expression;
		a_current_feature: like current_feature; a_current_type: like current_type)
			-- Create a new if-expression attachment.
		require
			a_type_set_not_void: a_type_set /= Void
			a_if_expression_not_void: a_if_expression /= Void
			a_sub_expression_not_void: a_sub_expression /= Void
			a_current_feature_not_void: a_current_feature /= Void
			a_current_type_not_void: a_current_type /= Void
		do
			source_type_set := a_type_set
			if_expression := a_if_expression
			sub_expression := a_sub_expression
			current_feature := a_current_feature
			current_type := a_current_type
		ensure
			source_type_set_set: source_type_set = a_type_set
			if_expression_set: if_expression = a_if_expression
			sub_expression_set: sub_expression = a_sub_expression
			current_feature_set: current_feature = a_current_feature
			current_type_set: current_type = a_current_type
		end

feature -- Access

	if_expression: ET_IF_EXPRESSION
			-- 'if' expression

	sub_expression: ET_EXPRESSION
			-- Sub-expression of `if_expression'

	position: ET_POSITION
			-- Position of attachment
		do
			Result := sub_expression.position
		end

	description: STRING = "if expression"
			-- Kind of attachment

invariant

	if_expression_not_void: if_expression /= Void
	sub_expression_not_void: sub_expression /= Void

end
