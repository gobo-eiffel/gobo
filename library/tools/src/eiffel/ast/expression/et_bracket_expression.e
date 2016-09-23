note

	description:

		"Eiffel bracket expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_BRACKET_EXPRESSION

inherit

	ET_QUALIFIED_FEATURE_CALL_EXPRESSION
		redefine
			reset
		end

	ET_CALL_WITH_ACTUAL_ARGUMENT_LIST

create

	make

feature {NONE} -- Initialization

	make (a_target: like target; a_name: like name; args: like arguments)
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

	reset
			-- Reset call as it was just after it was last parsed.
		do
			target.reset
			name.reset
			if attached arguments as l_arguments then
				l_arguments.reset
			end
		end

feature -- Access

	target: ET_EXPRESSION
			-- Target

	name: ET_BRACKET_SYMBOL
			-- Feature name

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := target.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := target.first_leaf
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			if attached arguments as l_arguments then
				Result := l_arguments.last_leaf
			else
				Result := name.last_leaf
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_bracket_expression (Current)
		end

invariant

	target_not_void: target /= Void

end
