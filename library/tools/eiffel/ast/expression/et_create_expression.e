indexing

	description:

		"Eiffel create expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_CREATE_EXPRESSION

inherit

	ET_EXPRESSION

creation

	make

feature {NONE} -- Initialization

	make (a_create: like create_keyword; l: like left_brace; a_type: like type; r: like right_brace) is
			-- Create a new create expression.
		require
			a_create_not_void: a_create /= Void
			l_not_void: l /= Void
			a_type_not_void: a_type /= Void
			r_not_void: r /= Void
		do
			create_keyword := a_create
			left_brace := l
			type := a_type
			right_brace := r
		ensure
			create_keyword_set: create_keyword = a_create
			left_brace_set: left_brace = l
			type_set: type = a_type
			right_brace_set: right_brace = r
		end

feature -- Access

	type: ET_TYPE
			-- Type of object being created

	create_keyword: ET_TOKEN
			-- 'create' keyword

	left_brace: ET_SYMBOL
	right_brace: ET_SYMBOL
			-- Braces surrounding type

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := create_keyword.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := right_brace.break
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_create_expression (Current)
		end

invariant

	type_not_void: type /= Void
	create_keyword_not_void: create_keyword /= Void
	left_brace_not_void: left_brace /= Void
	right_brace_not_void: right_brace /= Void

end
