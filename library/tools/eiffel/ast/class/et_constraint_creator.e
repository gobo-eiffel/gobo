note

	description:

		"Eiffel constraint creation clauses"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_CONSTRAINT_CREATOR

inherit

	ET_FEATURE_NAME_LIST
		redefine
			make, make_with_capacity
		end

create

	make, make_with_capacity

feature {NONE} -- Initialization

	make is
			-- Create a new constraint creation clause.
		do
			create_keyword := tokens.create_keyword
			end_keyword := tokens.end_keyword
			precursor
		end

	make_with_capacity (nb: INTEGER) is
			-- Create a new constraint creation clause with capacity `nb'.
		do
			create_keyword := tokens.create_keyword
			end_keyword := tokens.end_keyword
			precursor (nb)
		end

feature -- Status report

	has_feature (a_feature: ET_FEATURE): BOOLEAN is
			-- Is `a_feature' listed in current list?
			-- (The seeds of the creation procedure names must have been resolved first.)
		require
			a_feature_not_void: a_feature /= Void
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				if a_feature.has_seed (storage.item (i).feature_name.seed) then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

feature -- Access

	create_keyword: ET_KEYWORD
			-- 'create' keyword

	end_keyword: ET_KEYWORD
			-- 'end' keyword

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := create_keyword.position
			if Result.is_null and not is_empty then
				Result := first.position
			end
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := create_keyword
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := end_keyword
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

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_constraint_creator (Current)
		end

invariant

	create_keyword_not_void: create_keyword /= Void
	end_keyword_not_void: end_keyword /= Void

end
