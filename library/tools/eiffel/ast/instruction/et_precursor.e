indexing

	description:

		"Eiffel precursor calls"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_PRECURSOR

inherit

	ET_AST_NODE

feature {NONE} -- Initialization

	make (a_parent: like parent; args: like arguments) is
			-- Create a new precursor call.
		do
			parent := a_parent
			arguments := args
			precursor_keyword := tokens.precursor_keyword
		ensure
			parent_set: parent = a_parent
			arguments_set: arguments = args
		end

feature -- Access

	precursor_keyword: ET_KEYWORD
			-- 'precursor' keyword

	parent: ET_PRECURSOR_CLASS_NAME
			-- Parent class name sourrounded by braces

	arguments: ET_ACTUAL_ARGUMENT_LIST
			-- Arguments

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			if is_parent_prefixed and parent /= Void then
				Result := parent.position
			else
				Result := precursor_keyword.position
			end
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			if arguments /= Void then
				Result := arguments.break
			elseif not is_parent_prefixed and parent /= Void then
				Result := parent.break
			else
				Result := precursor_keyword.break
			end
		end

feature -- Setting

	set_precursor_keyword (a_precursor: like precursor_keyword) is
			-- Set `precursor_keyword' to `a_precursor'.
		require
			a_precursor_not_void: a_precursor /= Void
		do
			precursor_keyword := a_precursor
		ensure
			precursor_keyword_set: precursor_keyword = a_precursor
		end

feature -- Status report

	is_parent_prefixed: BOOLEAN
			-- Does parent clause appear before 'precursor' keyword?

feature -- Status setting

	set_parent_prefixed (b: BOOLEAN) is
			-- Set `is_parent_prefixed' to `b'.
		do
			is_parent_prefixed := b
		ensure
			is_parent_prefixed_set: is_parent_prefixed = b
		end

invariant

	precursor_keyword_not_void: precursor_keyword /= Void

end
