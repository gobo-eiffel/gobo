indexing

	description:

		"Eiffel bracket expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_BRACKET_EXPRESSION

inherit

	ET_FEATURE_CALL_EXPRESSION
		redefine
			reset
		end

create

	make

feature {NONE} -- Initialization

	make (a_target: like target; a_name: like name; args: like arguments) is
			-- Create a new bracket expression.
		require
			a_target_not_void: a_target /= Void
			a_name_not_void: a_name /= Void
		do
			target := a_target
			name := a_name
			arguments := args
		ensure
			target_set: target = a_target
			name_set: name = a_name
			arguments_set: arguments = args
		end

feature -- Initialization

	reset is
			-- Reset call as it was when it was first parsed.
		do
			target.reset
			name.reset
			if arguments /= Void then
				arguments.reset
			end
		end

feature -- Access

	target: ET_EXPRESSION
			-- Target

	name: ET_BRACKET_SYMBOL
			-- Feature name

	arguments: ET_BRACKET_ARGUMENT_LIST
			-- Arguments

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := target.position
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := target.first_leaf
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			if arguments /= Void then
				Result := arguments.last_leaf
			else
				Result := name.last_leaf
			end
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			if arguments /= Void then
				Result := arguments.break
			else
				Result := name.break
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_bracket_expression (Current)
		end

invariant

	target_not_void: target /= Void

end
