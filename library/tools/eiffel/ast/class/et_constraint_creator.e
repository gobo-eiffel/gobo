indexing

	description:

		"Eiffel constraint creation clauses"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_CONSTRAINT_CREATOR

inherit

	ET_FEATURE_NAME_LIST
		rename
			make as make_feature_name_list,
			make_with_capacity as make_feature_name_list_with_capacity
		end

creation

	make, make_with_capacity

feature {NONE} -- Initialization

	make (a_create: like create_keyword; an_end: like end_keyword) is
			-- Create a new constraint creation clause.
		require
			a_create_not_void: a_create /= Void
			an_end_not_void: an_end /= Void
		do
			create_keyword := a_create
			end_keyword := an_end
			make_feature_name_list
		ensure
			create_keyword_set: create_keyword = a_create
			end_keyword_set: end_keyword = an_end
			is_empty: is_empty
			capacity_set: capacity = 0
		end

	make_with_capacity (a_create: like create_keyword; an_end: like end_keyword; nb: INTEGER) is
			-- Create a new constraint creation clause with capacity `nb'.
		require
			a_create_not_void: a_create /= Void
			an_end_not_void: an_end /= Void
			nb_positive: nb >= 0
		do
			create_keyword := a_create
			end_keyword := an_end
			make_feature_name_list_with_capacity (nb)
		ensure
			create_keyword_set: create_keyword = a_create
			end_keyword_set: end_keyword = an_end
			is_empty: is_empty
			capacity_set: capacity = nb
		end

feature -- Access

	create_keyword: ET_TOKEN
			-- 'create' keyword

	end_keyword: ET_TOKEN
			-- 'end' keyword

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := create_keyword.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := end_keyword.break
		end

feature -- Setting

	set_create_keyword (a_create: like create_keyword) is
			-- Set `create_keyword' to `a_create'.
		require
			a_create_not_void: a_create /= Void
		do
			create_keyword := a_create
		ensure
			create_keyword_set: create_keyword = a_create
		end

	set_end_keyword (an_end: like end_keyword) is
			-- Set `end_keyword' to `an_end'.
		require
			an_end_not_void: an_end /= Void
		do
			end_keyword := an_end
		ensure
			end_keyword_set: end_keyword = an_end
		end

invariant

	create_keyword_not_void: create_keyword /= Void
	end_keyword_not_void: end_keyword /= Void

end
