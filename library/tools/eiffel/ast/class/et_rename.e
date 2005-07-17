indexing

	description:

		"Eiffel rename pairs"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_RENAME

inherit

	ET_RENAME_ITEM

create

	make

feature {NONE} -- Initialization

	make (o: like old_name; n: like new_name) is
			-- Create a new rename pair.
		require
			o_not_void: o /= Void
			n_not_void: n /= Void
		do
			old_name := o
			as_keyword := tokens.as_keyword
			new_name := n
		ensure
			old_name_set: old_name = o
			new_name_set: new_name = n
		end

feature -- Initialization

	reset is
			-- Reset rename pair as it was when it was first parsed.
		do
			old_name.reset
			new_name.reset
		end

feature -- Access

	old_name: ET_FEATURE_NAME
			-- Old name

	new_name: ET_EXTENDED_FEATURE_NAME
			-- New name

	as_keyword: ET_KEYWORD
			-- 'as' keyword

	rename_pair: ET_RENAME is
			-- Rename pair in comma-separated list
		do
			Result := Current
		end

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := old_name.position
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := old_name.first_leaf
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := new_name.last_leaf
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := new_name.break
		end

feature -- Setting

	set_as_keyword (an_as: like as_keyword) is
			-- Set `as_keyword' to `an_as'.
		require
			an_as_not_void: an_as /= Void
		do
			as_keyword := an_as
		ensure
			as_keyword_set: as_keyword = an_as
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_rename (Current)
		end

invariant

	old_name_not_void: old_name /= Void
	new_name_not_void: new_name /= Void
	as_keyword_not_void: as_keyword /= Void

end
