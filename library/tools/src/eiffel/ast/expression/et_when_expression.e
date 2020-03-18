note

	description:

		"Eiffel 'when' parts in inspect expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_WHEN_EXPRESSION

inherit

	ET_AST_NODE

create

	make

feature {NONE} -- Initialization

	make (a_choices: like choices; a_then_expression: like then_expression)
			-- Create a new when part.
		require
			a_choices_not_void: a_choices /= Void
			a_then_expression_not_void: a_then_expression /= Void
		do
			choices := a_choices
			then_keyword := tokens.then_keyword
			then_expression := a_then_expression
		ensure
			choices_set: choices = a_choices
			then_expression_set: then_expression = a_then_expression
		end

feature -- Initialization

	reset
			-- Reset when part as it was when it was last parsed.
		do
			choices.reset
			then_expression.reset
		end

feature -- Access

	choices: ET_CHOICE_LIST
			-- Choices

	then_keyword: ET_KEYWORD
			-- Then keyword

	then_expression: ET_EXPRESSION
			-- Then expression

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := choices.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := choices.first_leaf
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := then_expression.last_leaf
		end

feature -- Status report

	is_instance_free: BOOLEAN
			-- Does current 'when' part not depend on 'Current' or its attributes?
			-- Note that we do not consider unqualified calls and Precursors as
			-- instance-free because it's not always possible syntactically
			-- to determine whether the feature being called is a class feature
			-- or not.
		do
			Result := then_expression.is_instance_free
		end

feature -- Setting

	set_then_keyword (a_then: like then_keyword)
			-- Set `then_keyword' to `a_then'.
		do
			then_keyword := a_then
		ensure
			then_keyword_set: then_keyword = a_then
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_when_expression (Current)
		end

invariant

	choices_not_void: choices /= Void
	then_keyword_not_void: then_keyword /= Void
	then_expression_not_void: then_expression /= Void

end
