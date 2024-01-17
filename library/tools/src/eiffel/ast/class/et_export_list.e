note

	description:

		"Eiffel export clauses"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2018, Eric Bezault and others"
	license: "MIT License"

class ET_EXPORT_LIST

inherit

	ET_AST_NODE

	ET_HEAD_LIST [ET_EXPORT]
		redefine
			make, make_with_capacity
		end

create

	make, make_with_capacity

feature {NONE} -- Initialization

	make
			-- Create a new export clause
		do
			export_keyword := tokens.export_keyword
			precursor
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new export clause with capacity `nb'.
		do
			export_keyword := tokens.export_keyword
			precursor (nb)
		end

feature -- Initialization

	reset
			-- Reset export clauses as they were when they were last parsed.
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				storage.item (i).reset
				i := i + 1
			end
		end

feature -- Access

	has_non_null_export: BOOLEAN
			-- Is there at least one non-null export in current export clause?
		local
			i, nb: INTEGER
			l_export: ET_EXPORT
		do
			nb := count - 1
			from i := 0 until i > nb loop
				l_export := storage.item (i)
				if l_export.is_semicolon then
					-- Is null.
				elseif attached {ET_FEATURE_EXPORT} l_export as l_feature_export and then l_feature_export.is_empty then
					-- Is null.
				else
					Result := True
						-- Jump out of the loop.
					i := nb
				end
				i := i + 1
			end
		ensure
			not_empty: Result implies not is_empty
		end

	is_none_all: BOOLEAN
			-- Is there only one non-null export clause of the form 'export {NONE} all'?
		local
			i, nb: INTEGER
			l_export: ET_EXPORT
		do
			nb := count - 1
			from i := 0 until i > nb loop
				l_export := storage.item (i)
				if not l_export.is_semicolon then
					if l_export.is_none_all then
						Result := True
					else
						Result := False
							-- Jump out of the loop.
						i := nb
					end
				end
				i := i + 1
			end
		ensure
			has_non_null_export: Result implies has_non_null_export
		end

feature -- Access

	export_keyword: ET_KEYWORD
			-- 'export' keyword

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := export_keyword.position
			if Result.is_null and not is_empty then
				Result := first.position
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := export_keyword
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			if is_empty then
				Result := export_keyword
			else
				Result := last.last_leaf
			end
		end

feature -- Setting

	set_export_keyword (an_export: like export_keyword)
			-- Set `export_keyword' to `an_export'.
		require
			an_export_not_void: an_export /= Void
		do
			export_keyword := an_export
		ensure
			export_keyword_set: export_keyword = an_export
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_export_list (Current)
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_EXPORT]
			-- Fixed array routines
		once
			create Result
		end

invariant

	export_keyword_not_void: export_keyword /= Void

end
