indexing

	description:

		"Eiffel prefix expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_PREFIX_EXPRESSION

inherit

	ET_FEATURE_CALL_EXPRESSION
		rename
			target as expression
		undefine
			reset
		end

	ET_UNARY_EXPRESSION
		redefine
			reset
		end

create

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

feature -- Initialization

	reset is
			-- Reset expression as it was when it was first parsed.
		do
			name.reset
			expression.reset
		end

feature -- Access

	name: ET_OPERATOR
			-- Feature name

	arguments: ET_ACTUAL_ARGUMENTS is
			-- Arguments
		do
		ensure then
			no_arguments: Result = Void
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := name.first_leaf
		end

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
