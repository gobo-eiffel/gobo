indexing

	description:

		"Eiffel AST nodes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_AST_NODE

inherit

	ANY -- Needed by SE 2.1.

	ET_SHARED_TOKEN_CONSTANTS

feature -- Access

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		deferred
		ensure
			position_not_void: Result /= Void
		end

	first_position: ET_POSITION is
			-- Position of first character of current node in source code;
			-- Null position is current node is empty
		local
			l_first_leaf: like first_leaf
		do
			l_first_leaf := first_leaf
			if l_first_leaf /= Void then
				Result := l_first_leaf.first_position
			else
				create {ET_COMPRESSED_POSITION} Result.make_default
			end
		ensure
			first_position_not_void: Result /= Void
		end

	last_position: ET_POSITION is
			-- Position of last character of current node in source code;
			-- Null position is current node is empty
		local
			l_last_leaf: like last_leaf
		do
			l_last_leaf := last_leaf
			if l_last_leaf /= Void then
				Result := l_last_leaf.last_position
			else
				create {ET_COMPRESSED_POSITION} Result.make_default
			end
		ensure
			last_position_not_void: Result /= Void
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		deferred
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		deferred
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		deferred
		end

feature -- Status report

	has_break: BOOLEAN is
			-- Is there a break after current node?
		do
			Result := (break /= Void)
		ensure
			definition: Result = (break /= Void)
		end

	has_comment: BOOLEAN is
			-- Is there a comment after current node?
		local
			a_break: like break
		do
			a_break := break
			if a_break /= Void then
				Result := a_break.has_comment
			end
		end

	has_non_empty_comment: BOOLEAN is
			-- Is there a non-empty comment after current node?
			-- (Comments only made up of white characters or minus signs are not taken into account.)
		local
			a_break: like break
		do
			a_break := break
			if a_break /= Void then
				Result := a_break.has_non_empty_comment
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		require
			a_processor_not_void: a_processor /= Void
		deferred
		end

end
