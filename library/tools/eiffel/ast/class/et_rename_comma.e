indexing

	description:

		"Eiffel rename pairs followed by a comma"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_RENAME_COMMA

inherit

	ET_RENAME
		rename
			make as make_rename
		redefine
			break
		end

creation

	make

feature {NONE} -- Initialization

	make (o: like old_name; an_as: like as_keyword; n: like new_name; a_comma: like comma) is
			-- Create a new rename pair.
		require
			o_not_void: o /= Void
			an_as_not_void: an_as /= Void
			n_not_void: n /= Void
			a_comma_not_void: a_comma /= Void
		do
			make_rename (o, an_as, n)
			comma := a_comma
		ensure
			old_name_set: old_name = o
			as_keyword_set: as_keyword = an_as
			new_name_set: new_name = n
			comma_set: comma = a_comma
		end

feature -- Access

	comma: ET_SYMBOL
			-- Comma separator

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := comma.break
		end

invariant

	comma_not_void: comma /= Void

end
