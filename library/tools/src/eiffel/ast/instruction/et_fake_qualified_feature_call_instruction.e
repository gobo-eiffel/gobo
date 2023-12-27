note

	description:

		"Eiffel fake qualified feature call instructions, with no possible processing"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2023, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_FAKE_QUALIFIED_FEATURE_CALL_INSTRUCTION

inherit

	ET_QUALIFIED_FEATURE_CALL_INSTRUCTION

create

	make

feature {NONE} -- Initialization

	make (a_target: like target; a_name: like name; a_arguments: like arguments)
			-- Create a new fake qualified feature call instruction.
		require
			a_target_not_void: a_target /= Void
			a_name_not_void: a_name /= Void
		do
			target := a_target
			name := a_name
			arguments := a_arguments
		ensure
			target_set: target = a_target
			name_set: name = a_name
			arguments_set: arguments = a_arguments
		end

feature -- Access

	target: ET_EXPRESSION
			-- Target

	name: ET_CALL_NAME
			-- Call name

	arguments: detachable ET_ACTUAL_ARGUMENTS
			-- Arguments

	position: ET_POSITION
			-- Position of first character of current node in source code,
			-- or of a subsequent subnode if the position had not been set
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
			if attached {ET_ACTUAL_ARGUMENT_LIST} arguments as l_arguments then
				Result := l_arguments.last_leaf
			elseif attached arguments as l_arguments and then not l_arguments.is_empty then
				Result := l_arguments.actual_argument (l_arguments.count).last_leaf
			else
				Result := name.last_leaf
			end
		end

feature -- Setting

	set_target (a_target: like target)
			-- Set `target' to `a_target'.
		require
			a_target_not_void: a_target /= Void
		do
			target := a_target
		ensure
			target_set: target = a_target
		end

	set_name (a_name: like name)
			-- Set `name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
		do
			name := a_name
		ensure
			name_set: name = a_name
		end

	set_arguments (a_arguments: like arguments)
			-- Set `arguments' to `a_arguments'.
		do
			arguments := a_arguments
		ensure
			arguments_set: arguments = a_arguments
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
		end

end
