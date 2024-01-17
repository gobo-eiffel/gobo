note

	description:

		"Eiffel object-test expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2009-2018, Eric Bezault and others"
	license: "MIT License"

class ET_OBJECT_TEST

inherit

	ET_EXPRESSION
		redefine
			reset,
			is_instance_free
		end

create

	make

feature {NONE} -- Initialization

	make (a_type: like declared_type; a_expression: like expression)
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

	reset
			-- Reset expression as it was just after it was last parsed.
		do
			if attached type as l_type then
				l_type.reset
			end
			expression.reset
		end

feature -- Access

	attached_keyword: ET_KEYWORD
			-- 'attached' keyword

	declared_type: detachable ET_TARGET_TYPE
			-- Type declared in the object test, surrounded by braces

	type: detachable ET_TYPE
			-- Type expected for the expression
		do
			if attached declared_type as l_declared_type then
				Result := l_declared_type.type
			end
		end

	expression: ET_EXPRESSION
			-- Expression being tested

	name: detachable ET_IDENTIFIER
			-- Name of object-test local, if any
		do
			-- Result := Void
		end

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := attached_keyword.position
			if Result.is_null then
				if attached declared_type as l_declared_type then
					Result := l_declared_type.position
				end
				if Result.is_null then
					Result := expression.position
				end
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := attached_keyword
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := expression.last_leaf
		end

feature -- Status report

	is_instance_free: BOOLEAN
			-- Does current expression not depend on 'Current' or its attributes?
			-- Note that we do not consider unqualified calls and Precursors as
			-- instance-free because it's not always possible syntactically
			-- to determine whether the feature being called is a class feature
			-- or not.
		do
			Result := expression.is_instance_free
		end

feature -- Setting

	set_attached_keyword (a_attached: like attached_keyword)
			-- Set `attached_keyword' to `a_attached'.
		require
			a_attached_not_void: a_attached /= Void
		do
			attached_keyword := a_attached
		ensure
			attached_keyword_set: attached_keyword = a_attached
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_object_test (Current)
		end

invariant

	expression_not_void: expression /= Void
	attached_keyword_not_void: attached_keyword /= Void

end
