indexing

	description:

		"Eiffel infix expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_INFIX_EXPRESSION

inherit

	ET_BINARY_EXPRESSION

creation

	make

feature {NONE} -- Initialization

	make (a_left: like left; a_name: like name; a_right: like right) is
			-- Create a new infix feature call.
		require
			a_left_not_void: a_left /= Void
			a_name_not_void: a_name /= Void
			a_right_not_void: a_right /= Void
		do
			left := a_left
			name := a_name
			right := a_right
		ensure
			left_set: left = a_left
			name_set: name = a_name
			right_set: right = a_right
		end

feature -- Access

	name: ET_OPERATOR
			-- Feature name

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_infix_expression (Current)
		end

invariant

	name_not_void: name /= Void

end
