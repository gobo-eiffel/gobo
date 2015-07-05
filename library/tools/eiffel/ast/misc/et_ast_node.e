note

	description:

		"Eiffel AST nodes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_AST_NODE

inherit

	ANY -- Needed by SE 2.1.

	ET_SHARED_TOKEN_CONSTANTS

feature -- Access

	position: ET_POSITION
			-- Position of first character of current node in source code,
			-- or of a subsequent subnode if the position had not been set
		deferred
		ensure
			position_not_void: Result /= Void
		end

	first_position: ET_POSITION
			-- Position of first character of current node in source code;
			-- Null position if current node is empty or the position had not been set
		do
			Result := first_leaf.first_position
		ensure
			first_position_not_void: Result /= Void
		end

	last_position: ET_POSITION
			-- Position of last character of current node in source code;
			-- Null position if current node is empty or the position had not been set
		do
			Result := last_leaf.last_position
		ensure
			last_position_not_void: Result /= Void
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		deferred
		ensure
			first_leaft_not_void: Result /= Void
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		deferred
		ensure
			last_leaf_not_void: Result /= Void
		end

	break: detachable ET_BREAK
			-- Break which appears just after current node
		do
			Result := last_leaf.break
		end

feature -- Status report

	has_break: BOOLEAN
			-- Is there a break after current node?
		do
			Result := (break /= Void)
		ensure
			definition: Result = (break /= Void)
		end

	has_comment: BOOLEAN
			-- Is there a comment after current node?
		do
			if attached break as l_break then
				Result := l_break.has_comment
			end
		end

	has_non_empty_comment: BOOLEAN
			-- Is there a non-empty comment after current node?
			-- (Comments only made up of white characters or minus signs are not taken into account.)
		do
			if attached break as l_break then
				Result := l_break.has_non_empty_comment
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		require
			a_processor_not_void: a_processor /= Void
		deferred
		end

end
