note

	description:

		"Eiffel constraint rename clauses"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2019, Eric Bezault and others"
	license: "MIT License"

class ET_CONSTRAINT_RENAME_LIST

inherit

	ET_RENAME_LIST
		redefine
			make,
			make_with_capacity,
			last_leaf,
			process
		end

create

	make, make_with_capacity

feature {NONE} -- Initialization

	make
			-- Create a new constraint rename clause.
		do
			end_keyword := tokens.end_keyword
			precursor
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new constraint rename clause with capacity `nb'.
		do
			end_keyword := tokens.end_keyword
			precursor (nb)
		end

feature -- Access

	end_keyword: ET_KEYWORD
			-- 'end' keyword

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := end_keyword
		end

feature -- Setting

	set_end_keyword (an_end: like end_keyword)
			-- Set `end_keyword' to `an_end'.
		require
			an_end_not_void: an_end /= Void
		do
			end_keyword := an_end
		ensure
			end_keyword_set: end_keyword = an_end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_constraint_rename_list (Current)
		end

invariant

	end_keyword_not_void: end_keyword /= Void

end
