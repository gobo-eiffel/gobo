indexing

	description:

		"Eiffel rename pairs"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_RENAME

inherit

	ET_AST_NODE

creation

	make

feature {NONE} -- Initialization

	make (o: like old_name; an_as: like as_keyword; n: like new_name) is
			-- Create a new rename pair.
		require
			o_not_void: o /= Void
			an_as_not_void: an_as /= Void
			n_not_void: n /= Void
		do
			old_name := o
			as_keyword := an_as
			new_name := n
		ensure
			old_name_set: old_name = o
			as_keyword_set: as_keyword = an_as
			new_name_set: new_name = n
		end

feature -- Access

	old_name: ET_FEATURE_NAME
			-- Old name

	new_name: ET_FEATURE_NAME
			-- New name

	as_keyword: ET_TOKEN
			-- 'as' keyword

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := old_name.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := new_name.break
		end

invariant

	old_name_not_void: old_name /= Void
	new_name_not_void: new_name /= Void
	as_keyword_not_void: as_keyword /= Void

end -- class ET_RENAME
