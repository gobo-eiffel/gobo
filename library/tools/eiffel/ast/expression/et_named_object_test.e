note

	description:

		"Eiffel object-test expressions with a local name"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_NAMED_OBJECT_TEST

inherit

	ET_OBJECT_TEST
		rename
			make as make_object_test
		redefine
			name,
			reset,
			last_leaf,
			break,
			process
		end

	HASHABLE

create

	make

feature {NONE} -- Initialization

	make (a_type: like declared_type; a_expression: like expression; a_name: like name)
			-- Create a new object-test expression.
		require
			a_name_not_void: a_name /= Void
			a_expression_not_void: a_expression /= Void
		do
			name := a_name
			as_keyword := tokens.as_keyword
			make_object_test (a_type, a_expression)
			expression := a_expression
		ensure
			name_set: name = a_name
			declared_type_set: declared_type = a_type
			expression_set: expression = a_expression
		end

feature -- Initialization

	reset
			-- Reset expression as it was just after it was last parsed.
		do
			precursor
		end

feature -- Access

	as_keyword: ET_KEYWORD
			-- 'as' keyword

	name: ET_IDENTIFIER
			-- Name of object-test local


	hash_code: INTEGER
			-- Hash value
		do
			Result := name.hash_code
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := name.last_leaf
		end

	break: ET_BREAK
			-- Break which appears just after current node
		do
			Result := name.break
		end

feature -- Setting

	set_as_keyword (a_as: like as_keyword)
			-- Set `as_keyword' to `a_as'.
		require
			a_as_not_void: a_as /= Void
		do
			as_keyword := a_as
		ensure
			as_keyword_set: as_keyword = a_as
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_named_object_test (Current)
		end

invariant

	name_not_void: name /= Void
	as_keyword_not_void: as_keyword /= Void

end
