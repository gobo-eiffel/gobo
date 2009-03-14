indexing

	description:

		"Eiffel object-test expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_OBJECT_TEST

inherit

	ET_EXPRESSION
		redefine
			reset
		end

create

	make

feature {NONE} -- Initialization

	make (a_type: like declared_type; a_expression: like expression) is
			-- Create a new object-test expression.
		require
			a_expression_not_void: a_expression /= Void
		do
			attached_keyword := tokens.attached_keyword
			declared_type := a_type
			expression := a_expression
		ensure
			declared_type_set: declared_type = a_type
			expression_set: expression = a_expression
		end

feature -- Initialization

	reset is
			-- Reset expression as it was just after it was last parsed.
		local
			l_type: ET_TYPE
		do
			l_type := type
			if l_type /= Void then
				l_type.reset
			end
			expression.reset
		end

feature -- Access

	attached_keyword: ET_KEYWORD
			-- 'attached' keyword

	declared_type: ET_TARGET_TYPE
			-- Type declared in the object test, surrounded by braces

	type: ET_TYPE is
			-- Type expected for the expression
		do
			if declared_type /= Void then
				Result := declared_type.type
			end
		end

	expression: ET_EXPRESSION
			-- Expression being tested

	name: ET_IDENTIFIER is
			-- Name of object-test local, if any
		do
			-- Result := Void
		end

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := attached_keyword.position
			if Result.is_null then
				if declared_type /= Void then
					Result := declared_type.position
				end
				if Result.is_null then
					Result := expression.position
				end
			end
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := attached_keyword
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := expression.last_leaf
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := expression.break
		end

feature -- Setting

	set_attached_keyword (a_attached: like attached_keyword) is
			-- Set `attached_keyword' to `a_attached'.
		require
			a_attached_not_void: a_attached /= Void
		do
			attached_keyword := a_attached
		ensure
			attached_keyword_set: attached_keyword = a_attached
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_object_test (Current)
		end

invariant

	expression_not_void: expression /= Void
	attached_keyword_not_void: attached_keyword /= Void

end
