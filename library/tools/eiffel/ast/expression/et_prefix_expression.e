indexing

	description:

		"Eiffel prefix expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_PREFIX_EXPRESSION

inherit

	ET_UNARY_EXPRESSION

creation

	make

feature {NONE} -- Initialization

	make (a_name: like name; e: like expression) is
			-- Create a new prefix feature call.
		require
			a_name_not_void: a_name /= Void
			e_not_void: e /= Void
		do
			name := a_name
			expression := e
		ensure
			name_set: name = a_name
			expression_set: expression = e
		end

feature -- Access

	name: ET_PREFIX_OPERATOR
			-- Feature name

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := name.position
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_prefix_expression (Current)
		end

invariant

	name_not_void: name /= Void

end
