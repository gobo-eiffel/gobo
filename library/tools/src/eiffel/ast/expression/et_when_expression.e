note

	description:

		"Eiffel 'when' parts in inspect expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2020-2026, Eric Bezault and others"
	license: "MIT License"

class ET_WHEN_EXPRESSION

inherit

	ET_WHEN_COMPONENT
		rename
			then_part as then_expression
		redefine
			reset
		end

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
			precursor
			then_expression.reset
		end

feature -- Access

	then_keyword: ET_KEYWORD
			-- Then keyword

	then_expression: ET_EXPRESSION
			-- Then expression

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

	has_result: BOOLEAN
			-- Does the entity 'Result' appear in current when part
			-- or (recursively) in one of its subexpressions?
		do
			Result := then_expression.has_result
		end

	has_address_expression: BOOLEAN
			-- Does an address expression appear in current when part
			-- or (recursively) in one of its subexpressions?
		do
			Result := then_expression.has_address_expression
		end

	has_agent: BOOLEAN
			-- Does an agent appear in current when part
			-- or (recursively) in one of its subexpressions?
		do
			Result := then_expression.has_agent
		end

	has_typed_object_test: BOOLEAN
			-- Does a typed object-test appear in current when part
			-- or (recursively) in one of its subexpressions?
		do
			Result := then_expression.has_typed_object_test
		end

feature -- Setting

	set_then_keyword (a_then: like then_keyword)
			-- Set `then_keyword' to `a_then'.
		do
			then_keyword := a_then
		ensure
			then_keyword_set: then_keyword = a_then
		end

feature -- Formal arguments

	add_formal_arguments (a_list: DS_ARRAYED_LIST_2 [detachable ET_IDENTIFIER, BOOLEAN])
			-- Add to `a_list' all formal arguments appearing in current when part
			-- and (recursively) in its subexpressions: set the boolean to true
			-- if the formal argument name at the index corresponding to its seed
			-- is not Void.
		require
			a_list_not_void: a_list /= Void
		do
			then_expression.add_formal_arguments (a_list)
		end

feature -- Assertions

	add_old_expressions (a_list: DS_ARRAYED_LIST [ET_OLD_EXPRESSION])
			-- Add to `a_list' all old expressions appearing in current when part
			-- and (recursively) in its subexpressions.
		require
			a_list_not_void: a_list /= Void
			no_void_item: not a_list.has_void
		do
			then_expression.add_old_expressions (a_list)
		ensure
			no_void_item: not a_list.has_void
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_when_expression (Current)
		end

invariant

	then_keyword_not_void: then_keyword /= Void
	then_expression_not_void: then_expression /= Void

end
