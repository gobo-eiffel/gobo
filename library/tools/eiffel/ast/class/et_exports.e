indexing

	description:

		"Eiffel export clauses"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_EXPORTS

inherit

	ET_AST_NODE

	ET_AST_LIST [ET_EXPORT]
		rename
			make as make_ast_list,
			make_with_capacity as make_ast_list_with_capacity
		end

creation

	make, make_with_capacity

feature {NONE} -- Initialization

	make (an_export: like export_keyword) is
			-- Create a new export clause
		require
			an_export_not_void: an_export /= Void
		do
			export_keyword := an_export
			make_ast_list
		ensure
			export_keyword_set: export_keyword = an_export
			is_empty: is_empty
			capacity_set: capacity = 0
		end

	make_with_capacity (an_export: like export_keyword; nb: INTEGER) is
			-- Create a new export clause with capacity `nb'.
		require
			an_export_not_void: an_export /= Void
			nb_positive: nb >= 0
		do
			export_keyword := an_export
			make_ast_list_with_capacity (nb)
		ensure
			export_keyword_set: export_keyword = an_export
			is_empty: is_empty
			capacity_set: capacity = nb
		end

feature -- Access

	export_keyword: ET_KEYWORD
			-- 'export' keyword

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := export_keyword.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			if is_empty then
				Result := export_keyword.break
			else
				Result := item (count).break
			end
		end

feature -- Setting

	set_export_keyword (an_export: like export_keyword) is
			-- Set `export_keyword' to `an_export'.
		require
			an_export_not_void: an_export /= Void
		do
			export_keyword := an_export
		ensure
			export_keyword_set: export_keyword = an_export
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_exports (Current)
		end

feature {NONE} -- Implementation

	fixed_array: KL_FIXED_ARRAY_ROUTINES [ET_EXPORT] is
			-- Fixed array routines
		once
			!! Result
		end

invariant

	export_keyword_not_void: export_keyword /= Void

end
