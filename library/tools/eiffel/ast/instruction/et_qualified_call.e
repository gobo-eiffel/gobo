indexing

	description:

		"Eiffel qualified calls"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_QUALIFIED_CALL

inherit

	ET_AST_NODE

create

	make

feature {NONE} -- Initialization

	make (a_name: like qualified_name; args: like arguments) is
			-- Create a new qualified call.
		require
			a_name_not_void: a_name /= Void
		do
			qualified_name := a_name
			arguments := args
		ensure
			name_set: qualified_name = a_name
			arguments_set: arguments = args
		end

feature -- Initialization

	reset is
			-- Reset call as it was when it was last parsed.
		do
			name.reset
			if arguments /= Void then
				arguments.reset
			end
		end

feature -- Access

	qualified_name: ET_QUALIFIED_FEATURE_NAME
			-- Qualified feature name

	name: ET_FEATURE_NAME is
			-- Feature name
		do
			Result := qualified_name.feature_name
		ensure
			definition: Result = qualified_name.feature_name
		end

	arguments: ET_ACTUAL_ARGUMENT_LIST
			-- Arguments

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := qualified_name.position
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := qualified_name.first_leaf
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			if arguments /= Void then
				Result := arguments.last_leaf
			else
				Result := qualified_name.last_leaf
			end
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			if arguments /= Void then
				Result := arguments.break
			else
				Result := qualified_name.break
			end
		end

feature -- Measurement

	arguments_count: INTEGER is
			-- Number of arguments
		local
			l_arguments: like arguments
		do
			l_arguments := arguments
			if l_arguments /= Void then
				Result := l_arguments.count
			end
		ensure
			arguments_count_not_negative: Result >= 0
			no_argument: arguments = Void implies Result = 0
			with_arguments: arguments /= Void implies Result = arguments.count
		end
		
feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_qualified_call (Current)
		end

invariant

	qualified_name_not_void: qualified_name /= Void

end
